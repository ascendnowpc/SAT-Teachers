import { formatUtc } from './time.ts'
import type { Subject } from './types.ts'

/**
 * Reports saved before the rows they were drawn from are deleted (0087): where
 * each PDF goes, how the admin's list groups them, and what a run of the
 * clean-up says it did. The archive_reports edge function writes them; the
 * admin's Data clean-up tab reads them.
 */

/** The private bucket saved reports go in. An admin reads and deletes; the service role writes. */
export const ARCHIVE_BUCKET = 'report-archive'

/**
 * Where a saved report's file goes: the student, the session, then the
 * generation it was drawn from — so a report generated again is a second file
 * beside the first, never written over it.
 */
export function archivePath(studentId: string, sessionId: string, madeFrom: string): string {
  const stamp = new Date(madeFrom).toISOString().replace(/[:.]/g, '-')
  return `${studentId}/${sessionId}/${stamp}.pdf`
}

/** One row of report_archive. */
export interface SavedReport {
  id: string
  student_id: string
  student_name: string
  display_id: string | null
  subject: Subject
  session_id: string
  kind: 'report' | 'targeted'
  session_at: string
  made_from: string
  title: string
  path: string
  bytes: number | null
  archived_at: string
}

export interface SavedStudent {
  student_id: string
  student_name: string
  display_id: string | null
  /** Oldest session first: the order the reports were written in. */
  reports: SavedReport[]
  /** When the latest of them was saved. */
  last: string
}

/** The saved reports by student, the most recently saved first. */
export function groupSaved(rows: SavedReport[]): SavedStudent[] {
  const by = new Map<string, SavedStudent>()
  for (const r of rows) {
    const had = by.get(r.student_id)
    if (had) {
      had.reports.push(r)
      if (r.archived_at > had.last) had.last = r.archived_at
    } else {
      by.set(r.student_id, {
        student_id: r.student_id,
        student_name: r.student_name,
        display_id: r.display_id,
        reports: [r],
        last: r.archived_at,
      })
    }
  }
  const out = [...by.values()]
  for (const s of out)
    s.reports.sort((a, b) => a.session_at.localeCompare(b.session_at) || a.made_from.localeCompare(b.made_from))
  return out.sort((a, b) => b.last.localeCompare(a.last) || a.student_name.localeCompare(b.student_name))
}

/** What run_retention wrote onto the policy (0071, 0087). */
export interface RetentionRun {
  ran: boolean
  reason?: string
  students?: number
  sessions?: number
  transcripts?: number
  readings?: number
  /** Due students kept because a report of theirs is not saved yet. */
  held?: number
  /** Reports not saved yet that a deletion due now would take. */
  waiting?: number
  /** Whether the run asked archive_reports to save them. */
  queued?: boolean
}

const count = (n: number, one: string, many = `${one}s`) => `${n} ${n === 1 ? one : many}`

/**
 * "Last run 9 Nov 2026, 03:17 UTC: 2 students and 1 recording deleted. 1
 * student held until 4 reports are saved — saving them now."
 */
export function lastRunText(at: string | null, run: RetentionRun | null): string {
  if (!at || !run) return 'It has not run yet.'
  const when = `Last run ${formatUtc(at)}: `
  if (!run.ran) return `${when}off, nothing deleted.`
  const deleted = `${count(run.students ?? 0, 'student')} and ${count(run.transcripts ?? 0, 'recording')} deleted.`
  const waiting = run.waiting ?? 0
  if (waiting === 0) return `${when}${deleted}`
  const held = run.held ?? 0
  const what = held > 0 ? `${count(held, 'student')} held` : 'Recordings held'
  const how = run.queued
    ? 'saving them now.'
    : 'they could not be sent for saving — check the archive_reports function.'
  return `${when}${deleted} ${what} until ${count(waiting, 'report')} ${waiting === 1 ? 'is' : 'are'} saved — ${how}`
}
