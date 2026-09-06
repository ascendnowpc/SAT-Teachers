import Anthropic from 'npm:@anthropic-ai/sdk@0.124.0'
import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import {
  questionWindows,
  validateExtraction,
  type RawExtraction,
  type ValidationInput,
} from '../../../apps/web/src/lib/extraction.ts'
import { EXTRACTION_TOOL, buildPrompt, SYSTEM_PROMPT } from '../../../apps/web/src/lib/extractionPrompt.ts'
import { parseTranscript, windowsFor } from '../../../apps/web/src/lib/transcript.ts'

/**
 * Reading a session's recording, server-side.
 *
 * This runs on the server for one reason that is not about cost: the guard has
 * to be somewhere the client cannot reach. "Every claim in this report carries
 * a quote that was checked against the recording" is a promise about the
 * report, and a promise a browser makes about itself is not one. So the
 * function loads the transcript and the answers itself, calls the model, throws
 * away every claim that fails the check in extraction.ts, and stores only what
 * is left.
 *
 * It imports the check rather than reimplementing it. Those modules are the
 * ones the vitest suite runs against, which is the point — a second copy here
 * would be a second copy to keep right, and the one that drifted would be the
 * one nothing tested.
 *
 *   POST /functions/v1/extract_session_context
 *        { session_id, offset_seconds, roles }
 *     →  { extraction, drops, drop_rate, model, coverage }
 *
 * `offset_seconds` and `roles` come from the client on purpose. Both are
 * already the teacher's to set: the write-up page has an offset control and a
 * speaker-role control, because a recording that starts three minutes before
 * the lesson and a Fathom label that is somebody's Zoom nickname are things
 * only a person can settle. Neither is a security boundary — the offset moves
 * which lines the model reads, and the report shows the quotes either way, so a
 * wrong offset is visible rather than dangerous.
 */

const MODEL = 'claude-opus-5'

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
}

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...CORS, 'Content-Type': 'application/json' },
  })
}

/** md5 of the transcript, so a reading cannot outlive the recording it read. */
async function md5(text: string): Promise<string> {
  const digest = await crypto.subtle.digest('MD5', new TextEncoder().encode(text))
  return [...new Uint8Array(digest)].map((b) => b.toString(16).padStart(2, '0')).join('')
}

Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const url = Deno.env.get('SUPABASE_URL')!
  const anon = Deno.env.get('SUPABASE_ANON_KEY')!
  const service = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  const apiKey = Deno.env.get('ANTHROPIC_API_KEY')
  if (!apiKey) return json({ error: 'ANTHROPIC_API_KEY is not set on this function' }, 500)

  const authorization = req.headers.get('Authorization') ?? ''
  if (!authorization) return json({ error: 'not signed in' }, 401)

  let body: { session_id?: string; offset_seconds?: number; roles?: Record<string, string> }
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }

  const sessionId = body.session_id
  if (!sessionId) return json({ error: 'session_id is required' }, 400)
  const offset = Number.isFinite(body.offset_seconds) ? Number(body.offset_seconds) : 150

  // ------------------------------------------------------------- the caller --
  // Read as the caller, not as the service role: RLS is what decides whether
  // this person may see this session, and asking it is cheaper and harder to get
  // wrong than restating the rule here.
  const asCaller = createClient(url, anon, {
    global: { headers: { Authorization: authorization } },
  })

  const { data: user } = await asCaller.auth.getUser()
  if (!user?.user) return json({ error: 'not signed in' }, 401)

  const { data: session } = await asCaller
    .from('sessions')
    .select('id, teacher_id')
    .eq('id', sessionId)
    .maybeSingle()

  if (!session) return json({ error: 'no such session' }, 404)
  if (session.teacher_id !== user.user.id) return json({ error: 'not your session' }, 403)

  // -------------------------------------------------------------- the data --
  // Loaded here rather than accepted from the client. What the model is shown
  // and what the claims are checked against have to be the same thing, and a
  // client that could post its own transcript could post one containing the
  // quotes it wanted to see.
  const [items, transcriptRow, notes, report] = await Promise.all([
    asCaller
      .from('session_items')
      .select(
        'id, sequence_no, asked_no, status, first_viewed_at, selected_option, revealed_correct_option, revealed_result, questions(section, skill), session_item_assessments(is_correct)',
      )
      .eq('session_id', sessionId),
    asCaller.from('session_transcripts').select('body').eq('session_id', sessionId).maybeSingle(),
    asCaller.from('session_domain_notes').select('*').eq('session_id', sessionId),
    asCaller
      .from('session_reports')
      .select('teacher_reflection, form_submitted_at')
      .eq('session_id', sessionId)
      .maybeSingle(),
  ])

  const transcriptBody = transcriptRow.data?.body ?? ''
  if (!transcriptBody.trim()) return json({ error: 'there is no transcript for this session' }, 400)
  if (!report.data?.form_submitted_at) {
    return json({ error: 'the diagnostic form has not been submitted yet' }, 400)
  }

  const transcript = parseTranscript(transcriptBody)
  if (transcript.lines.length === 0) {
    return json({ error: 'the transcript has no timestamped turns — is it a Fathom export?' }, 400)
  }

  // ------------------------------------------------------------ the windows --
  // Alignment is arithmetic and stays arithmetic. The model is never asked
  // which part of the call is about which question; it is handed the answer.
  const answered = (items.data ?? []).filter(
    (i) => i.status === 'answered' || i.status === 'revealed',
  )
  if (answered.length === 0) return json({ error: 'no answered questions in this session' }, 400)

  const ordered = answered
    .map((i) => ({ ...i, sequence: i.asked_no ?? i.sequence_no }))
    .sort((a, b) => a.sequence - b.sequence)

  const aligned = windowsFor(
    ordered.map((i) => ({ id: i.id, startedAt: i.first_viewed_at })),
    transcript.duration,
    offset,
  )

  const windows = questionWindows(
    ordered.map((i) => ({ itemId: i.id, sequence: i.sequence, window: aligned.get(i.id) ?? null })),
  )
  if (windows.length === 0) {
    return json({ error: 'no question has a timestamp to align against' }, 400)
  }

  // Roles are the teacher's correction of Fathom's labels. Anything the client
  // sends that is not one of the three roles is 'other', which is inert.
  const roles: ValidationInput['roles'] = {}
  for (const speaker of transcript.speakers) {
    const claimed = body.roles?.[speaker]
    roles[speaker] =
      claimed === 'teacher' || claimed === 'student' || claimed === 'other' ? claimed : 'other'
  }

  const DOMAINS = [
    'information_and_ideas',
    'craft_and_structure',
    'expression_of_ideas',
    'standard_english_conventions',
  ]

  const noteFor = new Map((notes.data ?? []).map((n) => [n.domain, n]))
  const form = DOMAINS.map((domain) => {
    const n = noteFor.get(domain)
    return {
      domain,
      label: domain.replace(/_/g, ' '),
      performance: (n?.performance ?? null) as 'tick' | 'cross' | null,
      performanceNote: n?.performance_note ?? '',
      strengths: n?.strengths ?? '',
      gaps: n?.gaps ?? '',
      targets: n?.targets ?? '',
    }
  })

  const prompt = buildPrompt({
    transcript,
    windows,
    roles,
    answers: ordered.map((i) => ({
      itemId: i.id,
      sequence: i.sequence,
      correct:
        (i.session_item_assessments as { is_correct?: boolean } | null)?.is_correct ??
        i.revealed_result === 'correct',
      chose: i.selected_option,
      answer: i.revealed_correct_option,
      section: (i.questions as { section?: string } | null)?.section ?? null,
      skill: (i.questions as { skill?: string } | null)?.skill ?? null,
    })),
    form,
    reflection: report.data?.teacher_reflection ?? '',
  })

  // --------------------------------------------------------------- the read --
  const anthropic = new Anthropic({ apiKey })

  let raw: RawExtraction
  try {
    // A tool schema rather than "reply in JSON": a shape mismatch is then the
    // API's problem to retry, not ours to parse out of prose. Streamed because
    // a session of twenty questions is a long answer and a non-streaming
    // request that large invites an HTTP timeout rather than a result.
    const stream = anthropic.messages.stream({
      model: MODEL,
      max_tokens: 32000,
      thinking: { type: 'adaptive' },
      system: SYSTEM_PROMPT,
      tools: [EXTRACTION_TOOL as unknown as Anthropic.Tool],
      // 'auto' rather than forcing the tool: forcing it is refused alongside
      // extended thinking on some models, and thinking is worth more here than
      // the guarantee — this is a long reading over a lot of speech. The prompt
      // names the tool instead, and a reply that somehow arrives without a tool
      // call is a 502 below rather than prose nobody checked.
      tool_choice: { type: 'auto' },
      messages: [{ role: 'user', content: prompt }],
    })

    const message = await stream.finalMessage()
    const call = message.content.find((b) => b.type === 'tool_use')
    if (!call || call.type !== 'tool_use') {
      return json({ error: 'the model did not return a reading', stop: message.stop_reason }, 502)
    }
    raw = call.input as RawExtraction
  } catch (e) {
    const message = e instanceof Error ? e.message : String(e)
    return json({ error: `the model call failed: ${message}` }, 502)
  }

  // --------------------------------------------------------------- the guard --
  const result = validateExtraction(raw, { transcript, windows, roles, domains: DOMAINS })

  // Stored on the service role: the table has no client-side insert policy, so
  // that a reading can only ever arrive here having been through the guard above.
  const asService = createClient(url, service)
  const { error: saveError } = await asService.from('session_context_extractions').upsert({
    session_id: sessionId,
    body: result.extraction,
    drops: result.drops,
    transcript_md5: await md5(transcriptBody),
    model: MODEL,
    offset_seconds: offset,
  })
  if (saveError) return json({ error: `could not store the reading: ${saveError.message}` }, 500)

  const covered = result.extraction.questions.filter((q) => q.covered).length
  const kept =
    result.extraction.questions.reduce(
      (n, q) =>
        n +
        q.teacherFeedback.length +
        (q.studentReasoning ? 1 : 0) +
        (q.misunderstanding ? 1 : 0) +
        (q.vocabularyGap ? 1 : 0),
      0,
    ) + result.extraction.session.domainEvidence.length

  return json({
    extraction: result.extraction,
    drops: result.drops,
    // Reported rather than logged: a teacher who sees half the claims dropped
    // should know the reading is thin before they publish anything from it.
    drop_rate: kept + result.drops.length === 0 ? 0 : result.drops.length / (kept + result.drops.length),
    model: MODEL,
    coverage: { covered, total: windows.length },
  })
})
