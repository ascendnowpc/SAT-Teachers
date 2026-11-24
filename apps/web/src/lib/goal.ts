/**
 * The student's goal (0101): the score they aim for in each half of the SAT —
 * Reading and Writing, and Math — the day of their next one and its
 * registration deadline. The total is the two added, and is never stored. The
 * student enters it on joining; their PC confirms it, and from then on only
 * the PC changes it.
 */
import { byDay, type BluebookRow } from './bluebook.ts'

export interface StudentGoal {
  target_rw: number | null
  target_math: number | null
  /** YYYY-MM-DD. */
  next_test_on: string | null
  /** YYYY-MM-DD; on or before the test. */
  registration_deadline_on?: string | null
  /** When the PC confirmed it; null while it waits for them. */
  confirmed_at?: string | null
}

export const NO_GOAL: StudentGoal = { target_rw: null, target_math: null, next_test_on: null, registration_deadline_on: null }

/** A section score as College Board scores it: 200 to 800, in tens. */
export function isSectionScore(n: number): boolean {
  return Number.isInteger(n) && n >= 200 && n <= 800 && n % 10 === 0
}

/** "700" → 700, "" → null, anything else → undefined (not a score). */
export function parseTarget(text: string): number | null | undefined {
  const t = text.trim()
  if (t === '') return null
  if (!/^\d{3}$/.test(t)) return undefined
  const n = Number(t)
  return isSectionScore(n) ? n : undefined
}

/** What is wrong with a goal as typed, in the form's words, or null. */
export function goalProblem(rw: string, math: string, nextOn: string, today: string, regOn = ''): string | null {
  if (parseTarget(rw) === undefined) return 'Reading & Writing is a score from 200 to 800, in tens.'
  if (parseTarget(math) === undefined) return 'Math is a score from 200 to 800, in tens.'
  if (nextOn && !/^\d{4}-\d{2}-\d{2}$/.test(nextOn)) return 'Choose the day of your next SAT.'
  if (nextOn && nextOn < today) return 'Your next SAT is a day still to come.'
  if (regOn && !/^\d{4}-\d{2}-\d{2}$/.test(regOn)) return 'Choose the registration deadline.'
  if (regOn && nextOn && regOn > nextOn) return 'The registration deadline comes before the test.'
  return null
}

/**
 * The registration deadline in a line — "Registration closes in 3 days",
 * urgent in its last week — or that it has passed.
 */
export function registrationLabel(regOn: string | null | undefined, today: string): { text: string; urgent: boolean } | null {
  if (!regOn) return null
  const n = daysUntil(regOn, today)
  if (n < 0) return { text: 'Registration deadline passed', urgent: false }
  if (n === 0) return { text: 'Registration closes today', urgent: true }
  return { text: `Registration closes in ${n} day${n === 1 ? '' : 's'}`, urgent: n <= 7 }
}

/** Days left that make the gap worth flagging: the last month before the test. */
export const GAP_FLAG_DAYS = 30

/**
 * The gap to flag as the test nears (the scope's F15): each half still short
 * of its goal, when the test is within GAP_FLAG_DAYS. Null otherwise.
 */
export function gapFlag(
  goal: StudentGoal | null,
  sat: { rw: number; math: number } | null,
  today: string,
): { days: number; parts: { name: string; gap: number }[] } | null {
  if (!goal?.next_test_on || !sat) return null
  const days = daysUntil(goal.next_test_on, today)
  if (days < 0 || days > GAP_FLAG_DAYS) return null
  const parts = [
    goal.target_rw !== null ? { name: 'Reading & Writing', gap: goal.target_rw - sat.rw } : null,
    goal.target_math !== null ? { name: 'Math', gap: goal.target_math - sat.math } : null,
  ].filter((x): x is { name: string; gap: number } => x !== null && x.gap > 0)
  return parts.length > 0 ? { days, parts } : null
}

/** The goal's total, when both halves are set. */
export function goalTotal(g: StudentGoal | null): number | null {
  return g && g.target_rw !== null && g.target_math !== null ? g.target_rw + g.target_math : null
}

export function hasGoal(g: StudentGoal | null): boolean {
  return !!g && (g.target_rw !== null || g.target_math !== null || g.next_test_on !== null || !!g.registration_deadline_on)
}

/** Today in the student's own calendar, YYYY-MM-DD. */
export function localToday(now: Date = new Date()): string {
  const y = now.getFullYear()
  const m = String(now.getMonth() + 1).padStart(2, '0')
  const d = String(now.getDate()).padStart(2, '0')
  return `${y}-${m}-${d}`
}

/** Whole days from `today` to `day`, both YYYY-MM-DD; negative once it has gone. */
export function daysUntil(day: string, today: string): number {
  const a = Date.UTC(+today.slice(0, 4), +today.slice(5, 7) - 1, +today.slice(8, 10))
  const b = Date.UTC(+day.slice(0, 4), +day.slice(5, 7) - 1, +day.slice(8, 10))
  return Math.round((b - a) / 86_400_000)
}

/** "Today", "Tomorrow", "In 12 days", "In 5 weeks", or "Passed". */
export function countdownLabel(day: string, today: string): string {
  const n = daysUntil(day, today)
  if (n < 0) return 'Passed'
  if (n === 0) return 'Today'
  if (n === 1) return 'Tomorrow'
  if (n < 35) return `In ${n} days`
  return `In ${Math.round(n / 7)} weeks`
}

/**
 * How far a score is from its goal: "+40 to go", "Reached", or null when
 * either is missing.
 */
export function toGo(score: number | null | undefined, target: number | null | undefined): string | null {
  if (score == null || target == null) return null
  const gap = target - score
  return gap <= 0 ? 'Reached' : `${gap} to go`
}

/** The latest score for each half, and the total, from the scores on record. */
export function latestSat(rows: BluebookRow[]): { total: number; rw: number; math: number; on: string } | null {
  if (rows.length === 0) return null
  const last = byDay(rows)[rows.length - 1]
  return { total: last.total, rw: last.reading_writing, math: last.math, on: last.taken_on }
}
