/**
 * A targeted test's score, for the student, the moment it ends (0068): right
 * out of reached, and the same per skill. Which questions were right, and
 * why, still wait for the teacher's Publish results.
 */
import { skillLabel } from './constants'

export interface SkillResult {
  section: string
  skill: string | null
  right: number
  of: number
}

export interface TargetedResult {
  right: number
  reached: number
  timed_out: number
  not_reached: number
  /** Weakest first, as the server orders them. */
  skills: SkillResult[]
}

/** "6 of 10 right" — or, with nothing reached, a plain account of that. */
export function scoreLine(r: TargetedResult): string {
  if (r.reached === 0) return 'No questions were answered in time.'
  return `${r.right} of ${r.reached} right`
}

/** "2 ran out of time · 1 not reached", or nothing. */
export function scoreNote(r: TargetedResult): string | null {
  const parts = [
    r.timed_out > 0 && `${r.timed_out} ran out of time`,
    r.not_reached > 0 && `${r.not_reached} not reached`,
  ].filter(Boolean)
  return parts.length ? parts.join(' · ') : null
}

/** The skills with a miss in them, weakest first: what to work on next. */
export function skillsToWork(r: TargetedResult): SkillResult[] {
  return r.skills.filter((s) => s.right < s.of)
}

export function skillName(s: SkillResult): string {
  return skillLabel(s.skill) ?? 'Other questions'
}
