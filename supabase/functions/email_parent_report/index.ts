import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import type { BluebookRow } from '../../../apps/web/src/lib/bluebook.ts'
import type { StudentGoal } from '../../../apps/web/src/lib/goal.ts'
import { transportFrom } from '../../../apps/web/src/lib/mail.ts'
import { parentReportEmail } from '../../../apps/web/src/lib/pcMail.ts'
import type { StudentProgress } from '../../../apps/web/src/lib/progress.ts'
import { sectionReportDoc } from '../../../apps/web/src/lib/sectionReport.ts'
import { SUBJECT_ORDER } from '../../../apps/web/src/lib/subjectProgress.ts'
import { wordsIn } from '../../../apps/web/src/lib/targetedAnalytics.ts'
import type { Subject } from '../../../apps/web/src/lib/types.ts'
import { CORS, json } from '../_shared/http.ts'
import { logo } from '../_shared/reportDocs.ts'
import { sectionReportPdf } from '../_shared/sectionPdf.ts'
import { sendMail } from '../_shared/send.ts'

/**
 * The Section Progress Report, emailed to the parent by the student's PC (0103).
 *
 *   POST /functions/v1/email_parent_report   { student_id, note? }
 *     with the caller's own token
 *     →  { sent, to?, attached?, reason? }
 *
 * ## Who may send it
 *
 * The student's PC, or an admin — the scope sends the report through the PC,
 * who adds context. Checked here on the service role, from profiles, not from
 * anything the request says.
 *
 * ## Where it goes
 *
 * To the parent's address in student_parents, which only the PC or an admin
 * sets (set_parent_contact). Never to an address in the request.
 *
 * ## What it says
 *
 * lib/sectionReport.ts, from student_progress read on the service role — the
 * same rows and the same functions as the report page the PC is looking at —
 * drawn by _shared/sectionPdf.ts. A PDF that cannot be made still sends the
 * mail, which says so. Every send is logged in parent_report_emails, sent or
 * failed, with the reason.
 */

Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const url = Deno.env.get('SUPABASE_URL')!
  const anon = Deno.env.get('SUPABASE_ANON_KEY')!
  const service = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  const appUrl = Deno.env.get('APP_URL') ?? ''

  let body: { student_id?: string; note?: string | null }
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }
  const studentId = body.student_id
  if (!studentId) return json({ error: 'student_id is required' }, 400)
  const note = typeof body.note === 'string' ? body.note.slice(0, 2000) : null

  // ------------------------------------------------------- who is asking ---
  const asCaller = createClient(url, anon, {
    global: { headers: { Authorization: req.headers.get('Authorization') ?? '' } },
    auth: { persistSession: false },
  })
  const { data: user } = await asCaller.auth.getUser()
  if (!user?.user) return json({ error: 'not signed in' }, 401)

  const db = createClient(url, service, { auth: { persistSession: false, autoRefreshToken: false } })
  const [{ data: me }, { data: student }] = await Promise.all([
    db.from('profiles').select('id, role, full_name, is_active').eq('id', user.user.id).maybeSingle(),
    db.from('profiles').select('id, role, full_name, display_id, pc_id').eq('id', studentId).maybeSingle(),
  ])
  if (!student || student.role !== 'student') return json({ sent: false, reason: 'no such student' }, 404)
  const mayAsk = me?.is_active && (me.role === 'admin' || (me.role === 'pc' && student.pc_id === me.id))
  if (!mayAsk) return json({ sent: false, reason: 'only the student’s PC or an admin sends this report' }, 403)

  // ---------------------------------------------------------- where to ---
  const { data: parent } = await db
    .from('student_parents')
    .select('parent_name, parent_email')
    .eq('student_id', studentId)
    .maybeSingle()
  const to = parent?.parent_email as string | null | undefined
  if (!to) return json({ sent: false, reason: 'add the parent’s email first' }, 409)

  const { data: pc } = student.pc_id
    ? await db.from('profiles').select('full_name').eq('id', student.pc_id).maybeSingle()
    : { data: null }
  const pcName = (pc?.full_name as string | undefined) ?? (me!.full_name as string) ?? 'Your PC'

  // ---------------------------------------------------------- the facts ---
  const reads = await Promise.all(
    SUBJECT_ORDER.map((s) => db.rpc('student_progress', { p_student: studentId, p_subject: s })),
  )
  const subjects: Partial<Record<Subject, StudentProgress>> = {}
  reads.forEach((r, i) => {
    if (r.data) subjects[SUBJECT_ORDER[i]] = r.data as StudentProgress
  })
  const [{ data: goal }, { data: bluebook }] = await Promise.all([
    db.from('student_goals').select('target_rw, target_math, next_test_on').eq('student_id', studentId).maybeSingle(),
    db.from('bluebook_scores').select('test_name, taken_on, total, reading_writing, math, domains').eq('student_id', studentId),
  ])
  const ids = [...new Set(Object.values(subjects).flatMap((p) => p!.items.map((i) => i.question_id)))]
  const words = new Map<string, number>()
  for (let k = 0; k < ids.length; k += 500) {
    const { data: qs } = await db.from('questions').select('id, passage, stem').in('id', ids.slice(k, k + 500))
    for (const q of (qs ?? []) as { id: string; passage: string | null; stem: string }[]) words.set(q.id, wordsIn(q))
  }

  const doc = sectionReportDoc({
    student: { full_name: student.full_name as string, display_id: student.display_id as string },
    at: new Date().toISOString(),
    subjects,
    goal: (goal ?? null) as StudentGoal | null,
    bluebook: (bluebook ?? []) as BluebookRow[],
    words,
    note,
    pc: pcName,
  })
  if (doc.subjects.length === 0) return json({ sent: false, reason: 'there are no check-ins to report yet' }, 409)

  let pdf: Uint8Array | null = null
  try {
    pdf = await sectionReportPdf(doc, await logo(appUrl))
  } catch (e) {
    console.error('the section report PDF could not be made:', e instanceof Error ? e.message : e)
  }

  const mail = parentReportEmail({
    studentName: doc.student,
    pcName,
    parentName: (parent?.parent_name as string | null) ?? null,
    note,
    headlines: doc.subjects.map((s) => `${s.name}: ${s.headline}`),
    attached: pdf !== null,
  })
  const filename = `Section Progress Report - ${doc.student.replace(/[^\p{L}\p{N} .-]/gu, '')}.pdf`
  const sent = await sendMail(transportFrom((key) => Deno.env.get(key)), {
    to: [to],
    ...mail,
    attachments: pdf ? [{ filename, contentType: 'application/pdf', content: pdf }] : [],
  })

  await db.from('parent_report_emails').insert({
    student_id: studentId,
    sent_by: me!.id,
    sent_to: to,
    subjects: doc.subjects.map((s) => s.subject),
    note,
    status: sent.sent ? 'sent' : 'failed',
    detail: sent.sent ? (pdf ? null : 'sent without the PDF, which could not be made') : sent.reason,
  })

  return json({ sent: sent.sent, to, attached: pdf !== null, reason: sent.reason }, sent.sent ? 200 : 502)
})
