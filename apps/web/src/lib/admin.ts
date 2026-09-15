import type { Profile, Session, SessionReportRow, SessionStatus } from './types'

/**
 * The admin's arithmetic.
 *
 * An admin arrives with questions a teacher never asks, because a teacher only
 * ever has their own sessions in front of them: who is running lessons, who has
 * stopped, whose reports are sitting half-written, which student has been seen
 * six times and which one once. Every one of those is a roll-up over the same
 * three lists — the profiles, the sessions, and the report rows — and none of
 * it belongs in a component.
 *
 * It is all computed rather than stored, for the reason the session report is:
 * a stored count is a count that can be wrong. The portal's numbers are the
 * rows, tallied on read, so a number that looks wrong has a row you can open.
 */

/**
 * How far a session has got through the write-up, in the order the teachers
 * actually take it (0030): the session ends, the form is filled, the transcript
 * goes in, the form is handed in, the report is generated, the report is
 * published. Anything before the first of those is 'none'.
 *
 * This is the single most useful column in the portal: a run of 'form' against
 * one teacher's name is the backlog, and nothing else in the product shows it.
 */
export type ReportStage = 'none' | 'form' | 'submitted' | 'generated' | 'published'

export const STAGE_LABELS: Record<ReportStage, string> = {
  none: 'Not started',
  form: 'Form in progress',
  submitted: 'Form handed in',
  generated: 'Report generated',
  published: 'Published',
}

/** Latest first: a report row only ever moves forward through these. */
export function reportStage(report: Pick<
  SessionReportRow,
  'status' | 'published_at' | 'generated_at' | 'form_submitted_at' | 'teacher_reflection'
> | null | undefined): ReportStage {
  if (!report) return 'none'
  if (report.status === 'published' || report.published_at) return 'published'
  if (report.generated_at) return 'generated'
  if (report.form_submitted_at) return 'submitted'
  // A row exists at all because something was saved into it — a draft form, or
  // a written reflection. Either way somebody has started.
  return 'form'
}

/** A session that is finished and whose report has not been published. */
export function isOutstanding(status: SessionStatus, stage: ReportStage): boolean {
  return status === 'completed' && stage !== 'published'
}

export interface Tally {
  total: number
  scheduled: number
  live: number
  completed: number
  cancelled: number
  /** Questions the students actually answered, across every session counted. */
  answered: number
  /** Completed sessions whose report has not been published. */
  outstanding: number
  published: number
}

function emptyTally(): Tally {
  return {
    total: 0,
    scheduled: 0,
    live: 0,
    completed: 0,
    cancelled: 0,
    answered: 0,
    outstanding: 0,
    published: 0,
  }
}

function count(tally: Tally, session: Session, stage: ReportStage): void {
  tally.total += 1
  tally[session.status] += 1
  tally.answered += session.answered_count ?? 0
  if (stage === 'published') tally.published += 1
  if (isOutstanding(session.status, stage)) tally.outstanding += 1
}

/** The report rows, by session id — what every roll-up below needs to hand. */
export type Stages = Map<string, ReportStage>

export function stagesBySession(reports: SessionReportRow[]): Stages {
  return new Map(reports.map((r) => [r.session_id, reportStage(r)]))
}

function stageOf(stages: Stages, sessionId: string): ReportStage {
  return stages.get(sessionId) ?? 'none'
}

export interface PersonRow {
  profile: Profile
  tally: Tally
  /** The other side of their sessions: students for a teacher, teachers for a student. */
  counterparts: { id: string; name: string }[]
  /** The most recent session they are on, scheduled or sat. Null if they have none. */
  lastAt: string | null
  /** The soonest session still ahead of them. Null if nothing is booked. */
  nextAt: string | null
}

function blank(profile: Profile): PersonRow {
  return { profile, tally: emptyTally(), counterparts: [], lastAt: null, nextAt: null }
}

function remember(row: PersonRow, id: string | undefined, name: string | undefined): void {
  if (!id) return
  if (row.counterparts.some((c) => c.id === id)) return
  row.counterparts.push({ id, name: name || 'Unnamed' })
}

function mark(row: PersonRow, session: Session, now: number): void {
  const at = session.scheduled_at
  const t = new Date(at).getTime()
  if (!row.lastAt || t > new Date(row.lastAt).getTime()) row.lastAt = at
  const ahead = t >= now && (session.status === 'scheduled' || session.status === 'live')
  if (ahead && (!row.nextAt || t < new Date(row.nextAt).getTime())) row.nextAt = at
}

/**
 * Every teacher, with what they have run behind them.
 *
 * A teacher with no sessions at all still gets a row. That is the point of
 * listing people rather than grouping sessions: an account that has never been
 * used is exactly what an admin is looking for, and grouping the sessions
 * would leave it out of the answer.
 */
export function teacherRows(
  profiles: Profile[],
  sessions: Session[],
  stages: Stages,
  now = Date.now(),
): PersonRow[] {
  const rows = new Map<string, PersonRow>()
  for (const p of profiles) {
    if (p.role === 'teacher' || p.role === 'admin') rows.set(p.id, blank(p))
  }

  for (const s of sessions) {
    const row = rows.get(s.teacher_id)
    if (!row) continue
    count(row.tally, s, stageOf(stages, s.id))
    remember(row, s.student?.id ?? s.student_id, s.student?.full_name)
    mark(row, s, now)
  }

  return [...rows.values()].sort(byActivity)
}

/** Every student on the roster, with who teaches them and how far they have got. */
export function studentRows(
  profiles: Profile[],
  sessions: Session[],
  stages: Stages,
  now = Date.now(),
): PersonRow[] {
  const rows = new Map<string, PersonRow>()
  for (const p of profiles) {
    if (p.role === 'student') rows.set(p.id, blank(p))
  }

  for (const s of sessions) {
    const row = rows.get(s.student_id)
    if (!row) continue
    count(row.tally, s, stageOf(stages, s.id))
    remember(row, s.teacher?.id ?? s.teacher_id, s.teacher?.full_name)
    mark(row, s, now)
  }

  return [...rows.values()].sort(byActivity)
}

/**
 * Busiest first, and a tie is broken by name rather than by whatever order the
 * rows arrived in — so the table does not shuffle between loads.
 */
function byActivity(a: PersonRow, b: PersonRow): number {
  if (a.tally.total !== b.tally.total) return b.tally.total - a.tally.total
  return a.profile.full_name.localeCompare(b.profile.full_name)
}

/** The whole school in one line, for the top of the overview. */
export function schoolTally(sessions: Session[], stages: Stages): Tally {
  const tally = emptyTally()
  for (const s of sessions) count(tally, s, stageOf(stages, s.id))
  return tally
}

/** An account an admin took away, as opposed to one nobody has approved yet. */
export function isSuspended(profile: Profile): boolean {
  return !profile.is_active && profile.suspended_at !== null
}

/**
 * Teacher accounts waiting to be let in.
 *
 * 0044 writes a new teacher inactive, because signup is open to anyone with an
 * email address and a teacher reads every answer key in the bank. This is the
 * queue that makes that a workflow rather than a wall.
 *
 * A *suspended* teacher is inactive too and is deliberately not here: somebody
 * an admin has removed is not somebody waiting to be let in, and putting them
 * in this queue asks the admin to undo their own decision every time they open
 * the page.
 */
export function pendingTeachers(profiles: Profile[]): Profile[] {
  return profiles
    .filter((p) => p.role === 'teacher' && !p.is_active && !isSuspended(p))
    .sort((a, b) => a.created_at.localeCompare(b.created_at))
}

/** Free text over everything a person's row shows. */
function haystack(row: PersonRow): string {
  return [
    row.profile.full_name,
    row.profile.display_id,
    row.profile.email,
    row.profile.pc,
    row.profile.role,
    ...row.counterparts.map((c) => c.name),
  ]
    .filter(Boolean)
    .join(' ')
    .toLowerCase()
}

/** Multi-word search, AND over the words — the same rule the sessions list uses. */
export function filterPeople(rows: PersonRow[], query: string): PersonRow[] {
  const words = query.trim().toLowerCase().split(/\s+/).filter(Boolean)
  if (words.length === 0) return rows
  return rows.filter((row) => {
    const hay = haystack(row)
    return words.every((w) => hay.includes(w))
  })
}

/** Sessions whose write-up is unfinished, oldest first — the backlog, in order. */
export function backlog(sessions: Session[], stages: Stages): Session[] {
  return sessions
    .filter((s) => isOutstanding(s.status, stageOf(stages, s.id)))
    .sort((a, b) => new Date(a.scheduled_at).getTime() - new Date(b.scheduled_at).getTime())
}

/** A percentage for display, or null when there is nothing to take one of. */
export function rate(part: number, whole: number): number | null {
  if (whole <= 0) return null
  return Math.round((part / whole) * 100)
}
