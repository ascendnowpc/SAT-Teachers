import { sectionLabel, skillList, skillsOn, subjectLabel } from './constants.ts'
import type { Extraction } from './extraction.ts'
import type { StudentProgress } from './progress.ts'
import { lessonDocFrom, type ReportPdfDoc } from './reportPdf.ts'
import type { AnalysedQuestion } from './targetedAnalytics.ts'
import { targetedDocFrom, type TargetedReportInput } from './targetedReport.ts'
import type { DomainNote, SessionItem, SessionMode, SessionReportRow, Subject } from './types.ts'

/**
 * Every report, in the student's own account (0098): the list of what is
 * ready, and one report drawn from its rows by the very function the PC's PDF
 * is drawn with — lessonDocFrom for a lesson, targetedDocFrom for a targeted
 * test — so the family reads what the PC was sent, not a second report.
 */

/** One line of student_report_list. */
export interface StudentReportEntry {
  session_id: string
  kind: 'lesson' | 'targeted'
  mode: SessionMode
  subject: Subject
  title: string | null
  /** When the session was sat. */
  at: string
  /** When the report became the family's: generated (or published), or the test's end. */
  ready_at: string | null
  /** A lesson's report the teacher has published; a targeted test's always is. */
  published: boolean
  teacher: string | null
  section: string | null
  skill: string | null
  skills?: string[] | null
  right: number | null
  of: number | null
}

export interface StudentReportList {
  student: { full_name: string; display_id: string; pc: string | null }
  reports: StudentReportEntry[]
}

interface BundleSession {
  id: string
  subject: Subject
  title: string | null
  mode: SessionMode
  scheduled_at: string
  started_at: string | null
  duration_mins: number
  teacher_notes: string | null
  teacher: { full_name: string | null } | null
  student: { full_name: string | null; display_id: string | null; pc: string | null } | null
}

/** student_session_report for a lesson. */
export interface LessonBundle {
  kind: 'lesson'
  session: BundleSession
  items: SessionItem[]
  progress: StudentProgress | null
  notes: DomainNote[]
  meta: SessionReportRow
  transcript_at: string | null
  reading: { body: Extraction; created_at: string } | null
}

/** student_session_report for a targeted test. */
export interface TargetedBundle {
  kind: 'targeted'
  session: BundleSession
  items: SessionItem[]
  progress: StudentProgress
  test: TargetedReportInput['test']
  set_count: number
  questions: (AnalysedQuestion & { id: string })[]
}

export type StudentReportBundle = LessonBundle | TargetedBundle

/** The report, as the PC's PDF prints it, from the rows student_session_report returns. */
export function docFromBundle(b: StudentReportBundle): ReportPdfDoc {
  if (b.kind === 'targeted') {
    return targetedDocFrom({
      session: b.session,
      test: b.test,
      setCount: b.set_count,
      items: b.items,
      progress: b.progress,
      questions: b.questions,
    })
  }
  return lessonDocFrom({
    session: b.session,
    items: b.items,
    notes: b.notes,
    meta: b.meta,
    reading: b.reading,
    transcriptAt: b.transcript_at,
    progress: b.progress,
  })
}

/**
 * The report for the family. One thing on the PC's copy is not theirs: "worth
 * a second look", where the recording sits awkwardly against the form, is a
 * note to the teacher to correct one or the other, not a finding.
 */
export function forTheFamily(doc: ReportPdfDoc): ReportPdfDoc {
  return { ...doc, conflicts: [] }
}

/** What a report is called in the list: "Transitions", "English diagnostic". */
export function reportTitle(e: Pick<StudentReportEntry, 'title' | 'kind' | 'mode' | 'subject' | 'section' | 'skill' | 'skills'>): string {
  if (e.title) return e.title
  if (e.kind === 'targeted') {
    const skills = skillsOn(e)
    return (skills ? skillList(skills, 3) : sectionLabel(e.section)) ?? `${subjectLabel(e.subject)} targeted test`
  }
  return e.mode === 'diagnostic' ? `${subjectLabel(e.subject)} diagnostic` : `${subjectLabel(e.subject)} lesson`
}

/** "Diagnostic report", "Lesson report", "Targeted test". */
export function reportKindLabel(e: Pick<StudentReportEntry, 'kind' | 'mode'>): string {
  if (e.kind === 'targeted') return 'Targeted test'
  return e.mode === 'diagnostic' ? 'Diagnostic report' : 'Lesson report'
}

/** Diagnostics are every report that is not a targeted test: the live lesson's too. */
export type ReportFilter = 'all' | 'lesson' | 'targeted'

export function filterReports(
  list: StudentReportEntry[],
  kind: ReportFilter,
  subject: Subject | 'all',
): StudentReportEntry[] {
  return list.filter((e) => (kind === 'all' || e.kind === kind) && (subject === 'all' || e.subject === subject))
}

/** Green at three quarters, amber at half, red below — the score chip's tone. */
export function scoreTone(right: number | null, of: number | null): 'good' | 'mid' | 'low' | null {
  if (right === null || of === null || of <= 0) return null
  const share = right / of
  if (share >= 0.75) return 'good'
  return share >= 0.5 ? 'mid' : 'low'
}
