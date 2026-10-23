import type { Difficulty } from './types'

/**
 * Building a targeted test's set (0061), in the parts that are arithmetic
 * rather than screen: how many of each level a set of a given size asks for,
 * which questions fill it, what is missing when the bank cannot, and what a
 * question can be swapped for.
 *
 * Everything here is deterministic — the same candidates give the same set —
 * because a teacher who reopens the builder should see the set they left, and
 * the server checks the set again on save (write_targeted_set) anyway.
 */

/** One row of `targeted_candidates`. */
export interface Candidate {
  question_id: string
  difficulty: Difficulty
  /** 'test' — one of the three level tests; 'practice' — the subject's pool (0060). */
  source: 'test' | 'practice'
  /** The level test it is printed in; null for the pool. */
  set_level: Difficulty | null
  /** Its place in that test or the pool, from 1. */
  set_position: number
  /** Put in front of this student before, in any session, by any teacher. */
  seen: boolean
}

export const LEVEL_ORDER: Difficulty[] = ['easy', 'medium', 'hard']

/** Share of a set at each level. 5 → 2/1/2, 10 → 3/3/4. */
const SHARE: Record<Difficulty, number> = { easy: 0.3, medium: 0.3, hard: 0.4 }

/** Where a short level borrows from, nearest first. */
const NEIGHBOURS: Record<Difficulty, Difficulty[]> = {
  easy: ['medium', 'hard'],
  medium: ['easy', 'hard'],
  hard: ['medium', 'easy'],
}

/**
 * How many of each level a balanced set of `size` asks for: the shares above,
 * rounded by largest remainder so the three always add up to the size, ties
 * going to the easier level.
 */
export function mixFor(size: number): Record<Difficulty, number> {
  const n = Math.max(0, Math.floor(size))
  const exact = LEVEL_ORDER.map((l) => ({ l, x: n * SHARE[l] }))
  const out = { easy: 0, medium: 0, hard: 0 } as Record<Difficulty, number>
  for (const { l, x } of exact) out[l] = Math.floor(x + 1e-9)
  let left = n - LEVEL_ORDER.reduce((s, l) => s + out[l], 0)
  const byRemainder = exact
    .map(({ l, x }, i) => ({ l, r: x - Math.floor(x + 1e-9), i }))
    .sort((a, b) => b.r - a.r || a.i - b.i)
  for (const { l } of byRemainder) {
    if (left <= 0) break
    out[l] += 1
    left -= 1
  }
  return out
}

/**
 * Printed order: the three tests before the pool, the easier test first, then
 * each question's place in its test. The question id settles anything left so
 * the order never depends on how the rows arrived.
 */
export function printedOrder(a: Candidate, b: Candidate): number {
  const src = (c: Candidate) => (c.source === 'test' ? 0 : 1)
  const lvl = (c: Candidate) => (c.set_level ? LEVEL_ORDER.indexOf(c.set_level) : 3)
  return (
    src(a) - src(b) ||
    lvl(a) - lvl(b) ||
    a.set_position - b.set_position ||
    (a.question_id < b.question_id ? -1 : a.question_id > b.question_id ? 1 : 0)
  )
}

/** Unseen before seen, then printed order. The order a level is filled and offered in. */
export function preferenceOrder(a: Candidate, b: Candidate): number {
  return Number(a.seen) - Number(b.seen) || printedOrder(a, b)
}

/** A level the bank could not fill on its own. */
export interface Shortfall {
  level: Difficulty
  /** What a balanced set of this size asks for at this level. */
  needed: number
  unseen: number
  /** Counted only when repeats are allowed — otherwise a seen question is not available. */
  seen: number
  /** needed − what this level could give. Borrowing may cover it; `missing` on the set says what it did not. */
  short: number
}

export interface Borrow {
  /** The level that was short. */
  for: Difficulty
  /** The level that lent. */
  from: Difficulty
  count: number
}

export interface BuiltSet {
  /** The set, easy → medium → hard, as the student will sit it. */
  questions: Candidate[]
  /** The size asked for. */
  size: number
  /** What a balanced set of that size asks for. */
  mix: Record<Difficulty, number>
  shortfalls: Shortfall[]
  borrowed: Borrow[]
  /** Questions available on this skill, all levels: unseen, plus seen when repeats are allowed. */
  available: number
  /** size − the set's length: what the bank could not supply at all. */
  missing: number
}

export interface BuildOptions {
  allowRepeats: boolean
}

function usable(c: Candidate, o: BuildOptions): boolean {
  return o.allowRepeats || !c.seen
}

/** The candidates at each level that can go in a set, best first. */
function pools(candidates: Candidate[], o: BuildOptions): Record<Difficulty, Candidate[]> {
  const out = { easy: [], medium: [], hard: [] } as Record<Difficulty, Candidate[]>
  for (const c of dedupe(candidates)) if (usable(c, o)) out[c.difficulty].push(c)
  for (const l of LEVEL_ORDER) out[l].sort(preferenceOrder)
  return out
}

/** One row per question. The server returns one already; this keeps the builder honest if it ever does not. */
function dedupe(candidates: Candidate[]): Candidate[] {
  const seen = new Map<string, Candidate>()
  for (const c of [...candidates].sort(printedOrder)) if (!seen.has(c.question_id)) seen.set(c.question_id, c)
  return [...seen.values()]
}

/** Puts a set in the order it is sat: easy → medium → hard, keeping the order within a level. */
export function inLevelOrder<T extends Pick<Candidate, 'difficulty'>>(set: T[]): T[] {
  return set
    .map((c, i) => ({ c, i }))
    .sort((a, b) => LEVEL_ORDER.indexOf(a.c.difficulty) - LEVEL_ORDER.indexOf(b.c.difficulty) || a.i - b.i)
    .map(({ c }) => c)
}

/**
 * The balanced set of `size` from these candidates.
 *
 * Each level takes its share, unseen first. A level that cannot fill its
 * share borrows the difference from its nearest level with questions to
 * spare — medium first, for easy and for hard. What nobody can lend is
 * `missing`, and the set is that much shorter than asked.
 */
export function buildSet(candidates: Candidate[], size: number, o: BuildOptions): BuiltSet {
  const mix = mixFor(size)
  const pool = pools(candidates, o)
  const all = dedupe(candidates)

  const taken: Record<Difficulty, Candidate[]> = { easy: [], medium: [], hard: [] }
  const shortfalls: Shortfall[] = []
  const borrowed: Borrow[] = []

  for (const l of LEVEL_ORDER) {
    taken[l] = pool[l].slice(0, mix[l])
    const short = mix[l] - taken[l].length
    if (short > 0) {
      const atLevel = all.filter((c) => c.difficulty === l)
      shortfalls.push({
        level: l,
        needed: mix[l],
        unseen: atLevel.filter((c) => !c.seen).length,
        seen: o.allowRepeats ? atLevel.filter((c) => c.seen).length : 0,
        short,
      })
    }
  }

  // Borrowing comes after every level has taken its own share, so a level
  // never lends what it needed itself.
  for (const s of shortfalls) {
    let want = s.short
    for (const from of NEIGHBOURS[s.level]) {
      if (want <= 0) break
      const spare = pool[from].filter((c) => !taken[from].includes(c))
      const lend = spare.slice(0, want)
      if (lend.length === 0) continue
      taken[from].push(...lend)
      borrowed.push({ for: s.level, from, count: lend.length })
      want -= lend.length
    }
  }

  const questions = LEVEL_ORDER.flatMap((l) => [...taken[l]].sort(preferenceOrder))
  const available = LEVEL_ORDER.reduce((n, l) => n + pool[l].length, 0)

  return {
    questions,
    size,
    mix,
    shortfalls,
    borrowed,
    available,
    missing: Math.max(0, size - questions.length),
  }
}

/**
 * What the builder says about a set the bank could not balance, one line per
 * short level and one for the whole set:
 *
 *   a balanced set needs 1 medium; 0 unseen — 1 short; borrowed 1 from easy
 *   4 of 5 available
 */
export function describeSet(b: BuiltSet): string[] {
  const lines = b.shortfalls.map((s) => {
    const have = s.seen > 0 ? `${s.unseen} unseen, ${s.seen} seen` : `${s.unseen} unseen`
    const lent = b.borrowed.filter((x) => x.for === s.level)
    const borrowedText = lent.length
      ? `; borrowed ${lent.map((x) => `${x.count} from ${x.from}`).join(' and ')}`
      : ''
    return `a balanced set needs ${s.needed} ${s.level}; ${have} — ${s.short} short${borrowedText}`
  })
  if (b.missing > 0) lines.push(`${b.questions.length} of ${b.size} available`)
  return lines
}

/**
 * What the question at `position` (from 0) can be swapped for: anything not
 * already in the set, the same level first, then the nearer levels, unseen
 * before seen within each, in printed order. A seen question is offered only
 * when repeats are allowed — the server refuses it otherwise.
 */
export function swapOptions(
  set: string[],
  candidates: Candidate[],
  position: number,
  o: BuildOptions,
): Candidate[] {
  const all = dedupe(candidates)
  const current = all.find((c) => c.question_id === set[position])
  const inSet = new Set(set)
  const level = current?.difficulty
  const distance = (c: Candidate) =>
    level ? Math.abs(LEVEL_ORDER.indexOf(c.difficulty) - LEVEL_ORDER.indexOf(level)) : 0
  return all
    .filter((c) => !inSet.has(c.question_id) && usable(c, o))
    .sort((a, b) => distance(a) - distance(b) || LEVEL_ORDER.indexOf(a.difficulty) - LEVEL_ORDER.indexOf(b.difficulty) || preferenceOrder(a, b))
}

/**
 * The set with the question at `position` replaced, back in the order it is
 * sat — a swap to another level moves the question to its level's place.
 */
export function swapAt(set: string[], candidates: Candidate[], position: number, questionId: string): string[] {
  const byId = new Map(dedupe(candidates).map((c) => [c.question_id, c]))
  const next = set.map((id, i) => (i === position ? questionId : id))
  const known = next.map((id) => byId.get(id)).filter((c): c is Candidate => !!c)
  return inLevelOrder(known).map((c) => c.question_id)
}

/** The set's own count at each level — what the builder shows beside the mix. */
export function levelCounts(set: Pick<Candidate, 'difficulty'>[]): Record<Difficulty, number> {
  const out = { easy: 0, medium: 0, hard: 0 } as Record<Difficulty, number>
  for (const c of set) out[c.difficulty] += 1
  return out
}
