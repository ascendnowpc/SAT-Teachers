import type { Extraction } from '../../../apps/web/src/lib/extraction.ts'
import { appBase } from '../../../apps/web/src/lib/pcMail.ts'
import type { StudentProgress } from '../../../apps/web/src/lib/progress.ts'
import { lessonDocFrom, type ReportPdfDoc } from '../../../apps/web/src/lib/reportPdf.ts'
import type { AnalysedQuestion } from '../../../apps/web/src/lib/targetedAnalytics.ts'
import { patternQuestionIds, targetedDocFrom } from '../../../apps/web/src/lib/targetedReport.ts'
import type { DomainNote, SessionItem, SessionReportRow, Subject } from '../../../apps/web/src/lib/types.ts'

/**
 * A session's report as the document its PDF is drawn from — a lesson's
 * generated report, or a targeted test's computed one — read on the service
 * role from the same rows the report page reads.
 *
 * Two functions draw them: notify_pc_report, the PDF the PC is emailed, and
 * archive_reports, the copy kept before the rows go (0087). They draw them
 * here, so the copy kept is the PDF the PC was sent.
 */

export const SESSION_SELECT =
  'id, subject, title, scheduled_at, started_at, duration_mins, teacher_notes, teacher_id, student_id, mode,' +
  ' teacher:profiles!sessions_teacher_id_fkey(full_name),' +
  ' student:profiles!sessions_student_id_fkey(id, full_name, display_id, pc, pc_id)'

export interface SessionRow {
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
export async function logo(appUrl: string): Promise<Uint8Array | null> {
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

/** A lesson's generated report: answers, the form, the reading of the recording, and the Progress section. */
// deno-lint-ignore no-explicit-any
export async function lessonDoc(db: any, session: SessionRow, report: SessionReportRow): Promise<ReportPdfDoc> {
  const [items, notes, transcript, reading, progress] = await Promise.all([
    db
      .from('session_items')
      .select('*, questions(*), session_item_assessments(*)')
      .eq('session_id', session.id)
      .order('sequence_no'),
    db.from('session_domain_notes').select('*').eq('session_id', session.id),
    db.from('session_transcripts').select('created_at').eq('session_id', session.id).maybeSingle(),
    db.from('session_context_extractions').select('body, created_at').eq('session_id', session.id).maybeSingle(),
    // The Progress section (0063). Best effort: a report prints without it.
    db.rpc('student_progress', { p_student: session.student_id, p_subject: session.subject }),
  ])

  return lessonDocFrom({
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
    meta: report,
    reading: reading.data as { body: Extraction; created_at: string } | null,
    transcriptAt: (transcript.data as { created_at: string } | null)?.created_at ?? null,
    progress: (progress.data ?? null) as StudentProgress | null,
  })
}

/**
 * A targeted test's PDF: its answers, its set's size, and the line on each of
 * its skills (0086) — read through student_progress, as the report page reads it.
 */
// deno-lint-ignore no-explicit-any
export async function targetedDoc(db: any, session: SessionRow): Promise<ReportPdfDoc> {
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
  if (!progress?.config) throw new Error('no progress_config for this subject')

  // The questions the long-question pattern on each line is pooled from.
  const ids = patternQuestionIds(progress, session.id)
  const { data: qs } = ids.length
    ? await db
        .from('questions')
        .select('id, difficulty, passage, passage_underline, stem, image_url, target_seconds')
        .in('id', ids)
    : { data: [] }

  return targetedDocFrom({
    session: {
      id: session.id,
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
    progress,
    questions: (qs ?? []) as (AnalysedQuestion & { id: string })[],
  })
}
