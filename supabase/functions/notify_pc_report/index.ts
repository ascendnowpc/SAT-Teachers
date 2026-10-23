import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import { subjectLabel } from '../../../apps/web/src/lib/constants.ts'
import type { Extraction } from '../../../apps/web/src/lib/extraction.ts'
import { transportFrom } from '../../../apps/web/src/lib/mail.ts'
import { appBase, reportEmail } from '../../../apps/web/src/lib/pcMail.ts'
import { readingStaleness } from '../../../apps/web/src/lib/recording.ts'
import { progressLine, progressLines, type ProgressConfig, type StudentProgress } from '../../../apps/web/src/lib/progress.ts'
import { reportPdfDoc, type ReportPdfDoc } from '../../../apps/web/src/lib/reportPdf.ts'
import { longPattern, type AnalysedQuestion } from '../../../apps/web/src/lib/targetedAnalytics.ts'
import { targetedPdfDoc } from '../../../apps/web/src/lib/targetedReport.ts'
import { formatUtc } from '../../../apps/web/src/lib/time.ts'
import type { DomainNote, SessionItem, SessionReportRow, Subject } from '../../../apps/web/src/lib/types.ts'
import { CORS, json } from '../_shared/http.ts'
import { reportPdf } from '../_shared/pdf.ts'
import { sendMail } from '../_shared/send.ts'

/**
 * A generated report, to the student's PC: the PDF, and the way to the session.
 *
 *   POST /functions/v1/notify_pc_report   { session_id }
 *     from the trigger on session_reports.generated_at (0055), with no token
 *   POST /functions/v1/notify_pc_report   { session_id, again: true }
 *     from a person pressing "Send to the PC again", with theirs
 *     →  { sent, to?, attached?, reason? }
 *
 * A targeted test (0062) has no generated report — its report is computed
 * from its answers — so nothing sends it on its own: it goes when a person
 * presses Send to PC, as themselves, and its row in report_emails is keyed by
 * that moment. Its PDF is lib/targetedReport's, with the line on the skill
 * read through student_progress on the service role (0063).
 *
 * ## What this does NOT trust
 *
 * The body, beyond the id — 0046's rule. Everything is read here on the
 * service role: that the report really was generated, who the student's PC
 * really is, and the address they really sign in with (auth.users, not the
 * profile's copy, which its owner can edit). Nothing is sent anywhere a
 * request names. A stranger who guesses a session id can at most cause the
 * email that was due anyway: report_emails holds one row per generation, and
 * claim_report_email hands the send out once. Sending the same generation
 * again takes a person who could generate it — the session's teacher or an
 * admin — asking as themselves.
 *
 * ## What a failure costs
 *
 * Nothing that matters. The report is already generated when this runs; this
 * only tells the PC. A PDF that cannot be made still sends the mail, with the
 * link and a line saying so. A mail that cannot be sent is recorded as failed,
 * with the reason, and the screens offer to send it again.
 */

const SESSION_SELECT =
  'id, subject, title, scheduled_at, started_at, duration_mins, teacher_notes, teacher_id, student_id, mode,' +
  ' teacher:profiles!sessions_teacher_id_fkey(full_name),' +
  ' student:profiles!sessions_student_id_fkey(id, full_name, display_id, pc, pc_id)'

interface SessionRow {
  id: string
  subject: Subject
  title: string | null
  scheduled_at: string
  started_at: string | null
  duration_mins: number
  student_id: string
  mode: 'live' | 'diagnostic' | 'targeted'
  teacher_notes: string | null
  teacher_id: string
  teacher: { full_name: string | null } | null
  student: {
    id: string
    full_name: string | null
    display_id: string | null
    pc: string | null
    pc_id: string | null
  } | null
}

/** The brand mark for the PDF's band, from the app that serves it. Best effort. */
async function logo(appUrl: string): Promise<Uint8Array | null> {
  try {
    const response = await fetch(`${appBase(appUrl)}/brand/ascend-now-logo-on-navy.png`, {
      signal: AbortSignal.timeout(3000),
    })
    if (!response.ok || !(response.headers.get('content-type') ?? '').includes('png')) return null
    return new Uint8Array(await response.arrayBuffer())
  } catch {
    return null
  }
}

Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const url = Deno.env.get('SUPABASE_URL')!
  const anon = Deno.env.get('SUPABASE_ANON_KEY')!
  const service = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  const appUrl = Deno.env.get('APP_URL') ?? ''

  let body: { session_id?: string; again?: boolean; record?: { session_id?: string } }
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }
  // `record` is the shape a database webhook posts, as for 0046's function.
  const sessionId = body.session_id ?? body.record?.session_id
  if (!sessionId) return json({ error: 'session_id is required' }, 400)

  // ------------------------------------------------------- who is asking ---
  // The trigger carries nothing and gets the one email that is due. Asking
  // again is a person's, and only a person who could generate the report.
  const again = body.again === true
  if (again) {
    const authorization = req.headers.get('Authorization') ?? ''
    const asCaller = createClient(url, anon, {
      global: { headers: { Authorization: authorization } },
      auth: { persistSession: false },
    })
    const { data: user } = await asCaller.auth.getUser()
    if (!user?.user) return json({ error: 'not signed in' }, 401)
    const { data: mine } = await asCaller.from('sessions').select('teacher_id').eq('id', sessionId).maybeSingle()
    if (!mine) return json({ error: 'no such session' }, 404)
    if (mine.teacher_id !== user.user.id) {
      const { data: admin } = await asCaller.rpc('is_admin')
      if (admin !== true) return json({ error: 'not your session' }, 403)
    }
  }

  // ------------------------------------------------------------ the facts --
  const db = createClient(url, service, { auth: { persistSession: false, autoRefreshToken: false } })

  const [{ data: sessionData }, { data: reportData }] = await Promise.all([
    db.from('sessions').select(SESSION_SELECT).eq('id', sessionId).maybeSingle(),
    db.from('session_reports').select('*').eq('session_id', sessionId).maybeSingle(),
  ])
  const session = sessionData as SessionRow | null
  const report = reportData as SessionReportRow | null
  if (!session) return json({ sent: false, reason: 'no such session' }, 404)
  const targeted = session.mode === 'targeted'
  if (targeted && !again) {
    return json({ sent: false, reason: 'a targeted test is sent to the PC by hand' }, 409)
  }
  if (!targeted && !report?.generated_at) {
    return json({ sent: false, reason: 'the report has not been generated' }, 409)
  }
  // A targeted test's send is keyed by when it was sent: there is no generation.
  const generatedAt = targeted ? new Date().toISOString() : report!.generated_at!

  const { data: pc } = session.student?.pc_id
    ? await db
        .from('profiles')
        .select('id, role, full_name, email, is_active')
        .eq('id', session.student.pc_id)
        .maybeSingle()
    : { data: null }

  /** Nothing to send, and the log says why — once, and never over a sent row. */
  async function skip(reason: string): Promise<Response> {
    if (!again) {
      await db.from('report_emails').upsert(
        {
          session_id: sessionId,
          generated_at: generatedAt,
          pc_id: pc?.id ?? null,
          sent_to: null,
          status: 'skipped',
          detail: reason,
        },
        { onConflict: 'session_id,generated_at', ignoreDuplicates: true },
      )
    }
    return json({ sent: false, reason }, again ? 409 : 200)
  }

  if (!pc || pc.role !== 'pc') return await skip('this student has no PC to send it to')
  if (!pc.is_active) return await skip(`${pc.full_name} is suspended, so it was not sent`)

  // The address they sign in with: the profile's copy is theirs to edit.
  const { data: account } = await db.auth.admin.getUserById(pc.id)
  const to = account?.user?.email ?? pc.email
  if (!to) return await skip(`${pc.full_name} has no email address`)

  const { data: claimed, error: claimError } = await db.rpc('claim_report_email', {
    p_session: sessionId,
    p_generated_at: generatedAt,
    p_pc_id: pc.id,
    p_to: to,
    p_again: again,
  })
  if (claimError) return json({ sent: false, reason: claimError.message }, 500)
  if (claimed !== true) return json({ sent: false, reason: 'this report has already been sent to the PC' })

  // An earlier generation already in their inbox makes this one a replacement.
  const { count: before } = await db
    .from('report_emails')
    .select('session_id', { count: 'exact', head: true })
    .eq('session_id', sessionId)
    .eq('status', 'sent')
    .lt('generated_at', generatedAt)

  // --------------------------------------------------------------- the PDF --
  // The same rows the report page reads, as the service role reads them.
  let pdf: Uint8Array | null = null
  let filename = 'Report.pdf'
  let headline: string | null = null
  try {
    if (targeted) {
      const doc = await targetedDoc(db, session)
      headline = doc.headline
      filename = `${doc.filename}.pdf`
      pdf = await reportPdf(doc, await logo(appUrl))
    } else {
      const [items, notes, transcript, reading, progress] = await Promise.all([
        db
          .from('session_items')
          .select('*, questions(*), session_item_assessments(*)')
          .eq('session_id', sessionId)
          .order('sequence_no'),
        db.from('session_domain_notes').select('*').eq('session_id', sessionId),
        db.from('session_transcripts').select('created_at').eq('session_id', sessionId).maybeSingle(),
        db.from('session_context_extractions').select('body, created_at').eq('session_id', sessionId).maybeSingle(),
        // The Progress section (0063). Best effort: a report prints without it.
        db.rpc('student_progress', { p_student: session.student_id, p_subject: session.subject }),
      ])

      const stored = reading.data as { body: Extraction; created_at: string } | null
      const doc = reportPdfDoc({
        session: {
          subject: session.subject,
          title: session.title,
          scheduled_at: session.scheduled_at,
          duration_mins: session.duration_mins,
          teacher_notes: session.teacher_notes,
          teacher: session.teacher,
          student: session.student,
        },
        items: (items.data ?? []) as SessionItem[],
        notes: (notes.data ?? []) as DomainNote[],
        meta: report!,
        extraction: stored?.body ?? null,
        staleness: readingStaleness(
          stored,
          transcript.data as { created_at: string } | null,
          report!.form_submitted_at,
        ),
        progress: progress.data ? progressLines(progress.data as StudentProgress) : null,
      })
      headline = doc.headline
      filename = `${doc.filename}.pdf`
      pdf = await reportPdf(doc, await logo(appUrl))
    }
  } catch (e) {
    console.error('the report PDF could not be made:', e instanceof Error ? e.message : e)
  }

  // -------------------------------------------------------------- the mail --
  const mail = reportEmail({
    pcName: pc.full_name,
    studentName: session.student?.full_name || 'Your student',
    teacherName: session.teacher?.full_name || 'their teacher',
    subjectLabel: subjectLabel(session.subject),
    when: formatUtc(session.scheduled_at),
    sessionId,
    appUrl,
    headline,
    updated: !targeted && (before ?? 0) > 0,
    attached: pdf !== null,
    targeted,
  })

  const sent = await sendMail(
    transportFrom((key) => Deno.env.get(key)),
    {
      to: [to],
      ...mail,
      attachments: pdf ? [{ filename, contentType: 'application/pdf', content: pdf }] : [],
    },
  )

  await db
    .from('report_emails')
    .update({
      status: sent.sent ? 'sent' : 'failed',
      detail: sent.sent ? (pdf ? null : 'sent without the PDF, which could not be made') : sent.reason,
      updated_at: new Date().toISOString(),
    })
    .eq('session_id', sessionId)
    .eq('generated_at', generatedAt)

  return json({ sent: sent.sent, to, attached: pdf !== null, reason: sent.reason }, sent.sent ? 200 : 502)
})

/**
 * A targeted test's PDF: its answers, its set's size, and the line on its
 * skill — read on the service role, from the same rows the report page reads.
 */
// deno-lint-ignore no-explicit-any
async function targetedDoc(db: any, session: SessionRow): Promise<ReportPdfDoc> {
  const [testRes, setRes, itemsRes, progressRes] = await Promise.all([
    db.from('targeted_tests').select('*').eq('session_id', session.id).maybeSingle(),
    db.from('targeted_set_items').select('position', { count: 'exact', head: true }).eq('session_id', session.id),
    db
      .from('session_items')
      .select('*, questions(*), session_item_assessments(*)')
      .eq('session_id', session.id)
      .order('sequence_no'),
    db.rpc('student_progress', { p_student: session.student_id, p_subject: session.subject }),
  ])
  const test = testRes.data
  if (!test) throw new Error('this session has no targeted test row')
  const progress = (progressRes.data ?? null) as StudentProgress | null
  const config = (progress?.config ?? null) as ProgressConfig | null
  if (!config) throw new Error('no progress_config for this subject')
  const line = progress ? progressLine(progress, test.section, test.skill) : null

  // The long-question pattern, pooled over every test on the line.
  let pattern = null
  if (progress && line) {
    const tests = new Set(line.points.filter((p) => p.kind === 'test').map((p) => p.sessionId))
    const pooled = progress.items.filter((i) => tests.has(i.session_id))
    const ids = [...new Set(pooled.map((i) => i.question_id))]
    const { data: qs } = ids.length
      ? await db
          .from('questions')
          .select('id, difficulty, passage, passage_underline, stem, image_url, target_seconds')
          .in('id', ids)
      : { data: [] }
    const byId = new Map(((qs ?? []) as (AnalysedQuestion & { id: string })[]).map((q) => [q.id, q]))
    pattern = longPattern(
      pooled.map((i) => ({
        status: i.status,
        is_correct: i.is_correct,
        timed_out: i.timed_out,
        elapsed_seconds: i.elapsed_seconds,
        time_limit_seconds: i.time_limit_seconds,
        question: byId.get(i.question_id) ?? null,
      })),
      config,
    )
  }

  return targetedPdfDoc({
    session: {
      subject: session.subject,
      title: session.title,
      scheduled_at: session.scheduled_at,
      started_at: session.started_at,
      teacher: session.teacher,
      student: session.student,
    },
    test,
    setCount: setRes.count ?? 0,
    items: (itemsRes.data ?? []) as SessionItem[],
    config,
    line,
    pattern,
  })
}
