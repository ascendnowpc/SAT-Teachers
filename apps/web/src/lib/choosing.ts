import { LEVELS } from './constants'
import type { Question, SessionItem, SessionLevel } from './types'

/**
 * The teacher choosing the next question (0047), in the parts that are
 * arithmetic rather than screen: which question is up next, where every
 * question of the three tests stands in this session, and what a test calls
 * each of its questions.
 */

/** One of the three tests for a subject, as the picker lists it. */
export interface LevelTest {
  id: string
  level: SessionLevel
  title: string
  /** In the test's own order. A question's number in the test is its place here, from 1. */
  questions: Question[]
}

/**
 * Where a question stands in this session, from the teacher's chair.
 *
 *   answered   they have answered it (revealed or not)
 *   on_screen  it is in front of them now
 *   set_aside  it was in front of them and was taken down unanswered — by a
 *              chosen question, a level move, or the test being handed in
 *   next       the first of the queue: what answering the one on screen brings up
 *   free       anything else — further back in the queue, or not queued at all
 *
 * The first three have been in front of the student and cannot be chosen again
 * (0027's rule, which 0047 keeps). The last two can.
 */
export type Standing = 'answered' | 'on_screen' | 'set_aside' | 'next' | 'free'

export function choosable(s: Standing): boolean {
  return s === 'next' || s === 'free'
}

/**
 * The question answering the one on screen brings up.
 *
 * The server publishes the staged item with the lowest sequence number after
 * the one answered, and every staged row sits above everything already asked,
 * so the lowest staged sequence number is the next question — in test order,
 * or the one the teacher chose, whichever the queue was last built from.
 */
export function nextUp<T extends Pick<SessionItem, 'status' | 'sequence_no'>>(items: T[]): T | null {
  let best: T | null = null
  for (const i of items) {
    if (i.status !== 'staged') continue
    if (best === null || i.sequence_no < best.sequence_no) best = i
  }
  return best
}

/** How strongly an item's state speaks for its question, when a question has more than one row. */
const WEIGHT: Record<Standing, number> = { answered: 5, on_screen: 4, set_aside: 3, next: 2, free: 1 }

/**
 * Every question this session has a row for, keyed by question id.
 *
 * A question with no row is free, so callers read a missing entry as 'free'.
 * The server keeps one row per question, but a session from before the level
 * tests could hold two, and the one that has been in front of the student is
 * the one that counts.
 */
export function standings(
  items: Pick<SessionItem, 'id' | 'question_id' | 'status' | 'sequence_no'>[],
): Map<string, Standing> {
  const next = nextUp(items)
  const out = new Map<string, Standing>()
  for (const i of items) {
    const s: Standing =
      i.status === 'answered' || i.status === 'revealed'
        ? 'answered'
        : i.status === 'published'
          ? 'on_screen'
          : i.status === 'voided'
            ? 'set_aside'
            : next?.id === i.id
              ? 'next'
              : 'free'
    const had = out.get(i.question_id)
    if (!had || WEIGHT[s] > WEIGHT[had]) out.set(i.question_id, s)
  }
  return out
}

/** A question's test and its number in it, or null for one no test holds. */
export function placeOf(
  tests: LevelTest[],
  questionId: string,
): { level: SessionLevel; number: number } | null {
  for (const t of tests) {
    const i = t.questions.findIndex((q) => q.id === questionId)
    if (i >= 0) return { level: t.level, number: i + 1 }
  }
  return null
}

/** The rows of the tests query, as it comes back: one per test, its items unordered. */
export interface LevelTestRow {
  id: string
  level: string | null
  title: string
  question_set_items: { position: number; questions: Question | null }[] | null
}

/**
 * The three tests, easy first, each in its own order.
 *
 * Ordered here rather than in the query: an embedded collection's order is a
 * second thing to get right in PostgREST, and the position is on every row.
 * A row whose question did not come back is dropped before numbering, which is
 * what the printed test does (Paper), so a teacher who says "medium 7" means
 * the same question on both screens.
 */
export function toLevelTests(rows: LevelTestRow[]): LevelTest[] {
  return rows
    .filter((r): r is LevelTestRow & { level: SessionLevel } =>
      LEVELS.includes(r.level as SessionLevel),
    )
    .sort((a, b) => LEVELS.indexOf(a.level) - LEVELS.indexOf(b.level))
    .map((r) => ({
      id: r.id,
      level: r.level,
      title: r.title,
      questions: [...(r.question_set_items ?? [])]
        .sort((a, b) => a.position - b.position)
        .map((i) => i.questions)
        .filter((q): q is Question => q !== null),
    }))
}
