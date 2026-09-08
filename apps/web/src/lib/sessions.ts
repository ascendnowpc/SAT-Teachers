import type { Session, SessionLevel, SessionStatus, Subject } from './types'

/**
 * The sessions list, as a table.
 *
 * It used to be cards grouped by student, which was the right answer to "where
 * is Amara up to" and the wrong one to everything else. A teacher with sixty
 * sessions and four students scrolled through four headings and sixty cards to
 * find the one on Tuesday, and a card cannot be scanned down a column: date,
 * student, level and status all sat in different places on every row.
 *
 * So the list is a table, and the question a teacher arrives with is answered
 * by narrowing it rather than by scrolling it — a search box over the names,
 * ids, PCs and titles, and a filter for each column that has a fixed set of
 * values. Everything here is that narrowing, kept out of the component so it
 * can be tested without one.
 */

export interface SessionFilters {
  /** Free text over student, teacher, title, display id and PC. */
  query: string
  status: SessionStatus | 'all' | 'open'
  subject: Subject | 'all'
  level: SessionLevel | 'all'
  /** A student's profile id, or 'all'. */
  student: string | 'all'
}

export const NO_FILTERS: SessionFilters = {
  query: '',
  status: 'all',
  subject: 'all',
  level: 'all',
  student: 'all',
}

export type SortKey = 'when' | 'student' | 'title' | 'status' | 'level'
export interface Sort {
  key: SortKey
  dir: 'asc' | 'desc'
}

/** Newest first, which is what a list of things that happened opens on. */
export const DEFAULT_SORT: Sort = { key: 'when', dir: 'desc' }

function time(s: Session): number {
  return new Date(s.scheduled_at).getTime()
}

/** Everything about a session a search box should match. */
function haystack(s: Session): string {
  return [
    s.title,
    s.student?.full_name,
    s.student?.display_id,
    s.student?.pc,
    s.teacher?.full_name,
    s.teacher?.display_id,
    s.subject,
    s.level,
    s.status,
  ]
    .filter(Boolean)
    .join(' ')
    .toLowerCase()
}

/**
 * 'open' is the one filter value that is not a status: it is scheduled *and*
 * live, which is the question "what have I still got to do" and the reason the
 * old list split itself in two at the top.
 */
function matchesStatus(s: Session, want: SessionFilters['status']): boolean {
  if (want === 'all') return true
  if (want === 'open') return s.status === 'scheduled' || s.status === 'live'
  return s.status === want
}

export function filterSessions(sessions: Session[], f: SessionFilters): Session[] {
  // Multi-word search is an AND over the words, so "amara medium" finds the
  // medium sessions with Amara rather than everything that mentions either.
  const words = f.query.trim().toLowerCase().split(/\s+/).filter(Boolean)

  return sessions.filter((s) => {
    if (!matchesStatus(s, f.status)) return false
    if (f.subject !== 'all' && s.subject !== f.subject) return false
    if (f.level !== 'all' && s.level !== f.level) return false
    if (f.student !== 'all' && (s.student?.id ?? s.student_id) !== f.student) return false
    if (words.length === 0) return true
    const hay = haystack(s)
    return words.every((w) => hay.includes(w))
  })
}

const STATUS_ORDER: Record<SessionStatus, number> = {
  live: 0,
  scheduled: 1,
  completed: 2,
  cancelled: 3,
}

const LEVEL_ORDER: Record<SessionLevel, number> = { easy: 0, medium: 1, hard: 2 }

function compare(a: Session, b: Session, key: SortKey): number {
  switch (key) {
    case 'when':
      return time(a) - time(b)
    case 'student':
      return (a.student?.full_name ?? '').localeCompare(b.student?.full_name ?? '')
    case 'title':
      return (a.title ?? '').localeCompare(b.title ?? '')
    case 'status':
      return STATUS_ORDER[a.status] - STATUS_ORDER[b.status]
    case 'level':
      return LEVEL_ORDER[a.level] - LEVEL_ORDER[b.level]
  }
}

/**
 * Sorted, and never ambiguously: two sessions that tie on the chosen column
 * fall back to the time, so the order does not shuffle between renders.
 */
export function sortSessions(sessions: Session[], sort: Sort): Session[] {
  const sign = sort.dir === 'asc' ? 1 : -1
  return [...sessions].sort((a, b) => {
    const primary = compare(a, b, sort.key)
    if (primary !== 0) return sign * primary
    return time(b) - time(a)
  })
}

export interface StudentOption {
  id: string
  name: string
  displayId: string | null
  pc: string | null
  count: number
}

/**
 * The students this list holds, for the student filter — built from the
 * sessions themselves rather than from a second query, so the dropdown can
 * never offer a student who has nothing in the table behind it.
 */
export function studentOptions(sessions: Session[]): StudentOption[] {
  const found = new Map<string, StudentOption>()
  for (const s of sessions) {
    const id = s.student?.id ?? s.student_id
    const existing = found.get(id)
    if (existing) {
      existing.count += 1
      continue
    }
    found.set(id, {
      id,
      name: s.student?.full_name ?? 'Student',
      displayId: s.student?.display_id ?? null,
      pc: s.student?.pc ?? null,
      count: 1,
    })
  }
  return [...found.values()].sort((a, b) => a.name.localeCompare(b.name))
}

/** The share link for a session, absolute so it can be pasted anywhere. */
export function studentLink(token: string, origin = window.location.origin): string {
  return `${origin}/s/${token}`
}
