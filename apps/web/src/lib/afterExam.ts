import { byDay, type BluebookRow } from './bluebook.ts'
import { daysUntil, goalTotal, type StudentGoal } from './goal.ts'

/**
 * After the exam (0108): the scope's student journey, steps 4 and 5. Worked out
 * here from what is on record — the goal's SAT date, the scores, the
 * reflections — rather than stored, so it cannot drift from them.
 *
 *   none      no SAT date, or it is today or still to come
 *   waiting   the SAT has been sat and no score dated on or after it is in:
 *             "Waiting for results"
 *   reflect   the result is in: the score beside the goal, and the three
 *             prompts to answer
 *   done      answered: the answers, the PC's line, and new goals if they
 *             will retake
 */

export interface Reflection {
  exam_on: string
  went_well: string | null
  was_hard: string | null
  next_time: string | null
  retake: boolean | null
  pc_summary: string | null
  pc_at?: string | null
  updated_at?: string
}

export type ExamStage =
  | { kind: 'none' }
  | { kind: 'waiting'; examOn: string; daysSince: number }
  | { kind: 'reflect'; examOn: string; result: BluebookRow; reflection: Reflection | null }
  | { kind: 'done'; examOn: string; result: BluebookRow; reflection: Reflection }

/** Whether the student has answered: any of the three, or the retake. */
export function answered(r: Reflection | null | undefined): r is Reflection {
  return !!r && (!!r.went_well || !!r.was_hard || !!r.next_time || r.retake !== null)
}

/**
 * The result of an SAT: the first score dated on or after it — an official
 * one before a practice test of the same days.
 */
export function resultFor(rows: BluebookRow[], examOn: string): BluebookRow | null {
  const after = byDay(rows.filter((r) => r.taken_on >= examOn))
  return after.find((r) => r.official) ?? after[0] ?? null
}

export function examStage(
  goal: StudentGoal | null,
  rows: BluebookRow[],
  reflections: Reflection[],
  today: string,
): ExamStage {
  const examOn = goal?.next_test_on
  if (!examOn || examOn >= today) return { kind: 'none' }
  const result = resultFor(rows, examOn)
  if (!result) return { kind: 'waiting', examOn, daysSince: -daysUntil(examOn, today) }
  const reflection = reflections.find((r) => r.exam_on === examOn) ?? null
  return answered(reflection)
    ? { kind: 'done', examOn, result, reflection }
    : { kind: 'reflect', examOn, result, reflection }
}

export interface Versus {
  label: string
  score: number
  goal: number | null
  /** score − goal: positive is past it. */
  diff: number | null
}

/** The result beside the goal: the total, then each section that has a goal. */
export function versusGoal(result: BluebookRow, goal: StudentGoal | null): Versus[] {
  const total = goalTotal(goal)
  const out: Versus[] = [
    { label: 'Total', score: result.total, goal: total, diff: total === null ? null : result.total - total },
  ]
  out.push({
    label: 'Reading & Writing',
    score: result.reading_writing,
    goal: goal?.target_rw ?? null,
    diff: goal?.target_rw != null ? result.reading_writing - goal.target_rw : null,
  })
  out.push({
    label: 'Math',
    score: result.math,
    goal: goal?.target_math ?? null,
    diff: goal?.target_math != null ? result.math - goal.target_math : null,
  })
  return out
}

/** "Goal reached", "+20 past the goal", "30 to go" — never a failing mark. */
export function diffLabel(diff: number | null): string | null {
  if (diff === null) return null
  if (diff === 0) return 'Goal reached'
  return diff > 0 ? `+${diff} past the goal` : `${-diff} to go`
}
