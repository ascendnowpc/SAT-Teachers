import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import { DEFAULT_MODEL, KEY_VAR, geminiReader } from '../../../apps/web/src/lib/gemini.ts'
import type { StudentProgress } from '../../../apps/web/src/lib/progress.ts'
import type { AnalysedQuestion } from '../../../apps/web/src/lib/targetedAnalytics.ts'
import {
  SUMMARY_SCHEMA,
  SUMMARY_SYSTEM,
  parseSummary,
  summaryFacts,
  summaryPrompt,
} from '../../../apps/web/src/lib/targetedSummary.ts'
import { CORS, json } from '../_shared/http.ts'

/**
 * A short reading of every targeted test a student has sat in a subject, by
 * Gemini, for the teacher who presses the button.
 *
 *   POST { student_id, subject }  →  { summary, model, tests, generated_at }
 *
 * Staff only: a teacher or an admin, asked of the database as the caller. The
 * numbers are loaded here, as the caller, through student_progress — never
 * taken from the browser — and the model is shown those numbers only
 * (lib/targetedSummary), not the questions or the answers. Nothing is stored:
 * the summary is the button's answer, and pressing it again reads again.
 *
 * Deploy with `supabase functions deploy summarise_targeted_tests`, or bundle
 * it with `node tools/bundle-edge-function.mjs summarise_targeted_tests` for
 * the Management API. It reads GEMINI_API_KEY, which extract_session_context
 * already needs, and SUMMARY_MODEL if set.
 */
Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const apiKey = Deno.env.get(KEY_VAR)
  if (!apiKey) return json({ error: `${KEY_VAR} is not set.` }, 500)
  const reader = geminiReader(apiKey, Deno.env.get('SUMMARY_MODEL') || DEFAULT_MODEL)

  const authorization = req.headers.get('Authorization') ?? ''
  if (!authorization) return json({ error: 'not signed in' }, 401)

  let body: { student_id?: string; subject?: string }
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }
  const studentId = body.student_id
  const subject = body.subject
  if (!studentId) return json({ error: 'student_id is required' }, 400)
  if (subject !== 'english' && subject !== 'mathematics') {
    return json({ error: 'subject is english or mathematics' }, 400)
  }

  const asCaller = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_ANON_KEY')!, {
    global: { headers: { Authorization: authorization } },
  })
  const { data: user } = await asCaller.auth.getUser()
  if (!user?.user) return json({ error: 'not signed in' }, 401)

  // A teacher or an admin. A PC reads the numbers, but a model's reading is
  // the staff's to look at before anybody else does.
  const { data: staff } = await asCaller.rpc('is_teacher')
  if (staff !== true) return json({ error: 'only a teacher or an admin can generate this' }, 403)

  const [progressRes, studentRes] = await Promise.all([
    asCaller.rpc('student_progress', { p_student: studentId, p_subject: subject }),
    asCaller.from('profiles').select('full_name').eq('id', studentId).maybeSingle(),
  ])
  if (progressRes.error) return json({ error: progressRes.error.message }, 400)
  const progress = progressRes.data as StudentProgress | null
  if (!progress) return json({ error: 'no such student' }, 404)

  // The questions' words and formats, for long against short. Staff read the bank.
  const ids = [...new Set(progress.items.map((i) => i.question_id))]
  const questions = new Map<string, AnalysedQuestion>()
  if (ids.length) {
    const { data } = await asCaller
      .from('questions')
      .select('id, difficulty, passage, passage_underline, stem, image_url, target_seconds')
      .in('id', ids)
    for (const q of (data ?? []) as (AnalysedQuestion & { id: string })[]) questions.set(q.id, q)
  }

  const student = (studentRes.data as { full_name?: string } | null)?.full_name || 'The student'
  const facts = summaryFacts(progress, questions, student, subject)
  if (facts.tests === 0) {
    return json({ error: 'there are no completed targeted tests in this subject yet' }, 400)
  }

  try {
    const answer = await reader.read({
      system: SUMMARY_SYSTEM,
      prompt: summaryPrompt(facts),
      schema: SUMMARY_SCHEMA,
    })
    return json({
      summary: parseSummary(answer),
      model: reader.model,
      tests: facts.tests,
      generated_at: new Date().toISOString(),
    })
  } catch (e) {
    return json({ error: e instanceof Error ? e.message : String(e) }, 502)
  }
})
