import type { Difficulty } from './types'

/**
 * Building a targeted test's set (0061), in the parts that are arithmetic
 * rather than screen: how many of each level a set of a given size asks for,
 * which questions fill it, what is missing when the bank cannot, and the
 * order a set the teacher ticked by hand is sat in.
 *
 * Everything here is deterministic — the same candidates give the same set —
 * because a teacher who reopens the builder should see the set they left, and
 * the server checks the set again on save (write_targeted_set) anyway. "Pick
 * for me" draws at random, through a seeded generator: the same seed is the
 * same draw, and Pick again is a new seed.
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
  /** Its section and skill (0086): what a set on several skills is balanced across. */
  section?: string | null
  skill?: string | null
}

export const LEVEL_ORDER: Difficulty[] = ['easy', 'medium', 'hard']

/** The most a set can hold (write_targeted_set). */
export const MAX_SET = 20

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
/**
 * The whole test's clock, in minutes, when the teacher has not set it: the
 * questions' clocks end to end and one minute to spare for moving between
 * them. A question on its own target time is counted at 90 s, the top of what
 * the targets run to.
 */
export function suggestedMinutes(questions: number, questionSeconds: number | null): number {
  const each = questionSeconds ?? 90
  return Math.max(1, Math.ceil((Math.max(0, questions) * each) / 60) + 1)
}

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
  /**
   * A draw at random within each level, unseen still before seen — what Pick
   * for me uses. Without it a level fills in printed order.
   */
  random?: () => number
}

function usable(c: Candidate, o: BuildOptions): boolean {
  return o.allowRepeats || !c.seen
}

/** A number generator that gives the same run for the same seed (mulberry32). */
export function seededRandom(seed: number): () => number {
  let a = seed >>> 0
  return () => {
    a = (a + 0x6d2b79f5) >>> 0
    let t = a
    t = Math.imul(t ^ (t >>> 15), t | 1)
    t ^= t + Math.imul(t ^ (t >>> 7), t | 61)
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296
  }
}

function shuffled<T>(xs: T[], random: () => number): T[] {
  const out = [...xs]
  for (let i = out.length - 1; i > 0; i--) {
    const j = Math.floor(random() * (i + 1))
    ;[out[i], out[j]] = [out[j], out[i]]
  }
  return out
}

/** The candidates at each level that can go in a set, best first. */
function pools(candidates: Candidate[], o: BuildOptions): Record<Difficulty, Candidate[]> {
  const out = { easy: [], medium: [], hard: [] } as Record<Difficulty, Candidate[]>
  for (const c of dedupe(candidates)) if (usable(c, o)) out[c.difficulty].push(c)
  for (const l of LEVEL_ORDER) {
    out[l].sort(preferenceOrder)
    const random = o.random
    if (random) {
      const fresh = out[l].filter((c) => !c.seen)
      const seen = out[l].filter((c) => c.seen)
      out[l] = [...shuffled(fresh, random), ...shuffled(seen, random)]
    }
  }
  return out
}

/** One row per question. The server returns one already; this keeps the builder honest if it ever does not. */
function dedupe(candidates: Candidate[]): Candidate[] {
  const seen = new Map<string, Candidate>()
  for (const c of [...candidates].sort(printedOrder))
    if (!seen.has(c.question_id)) seen.set(c.question_id, c)
  return [...seen.values()]
}

/** Puts a set in the order it is sat: easy → medium → hard, keeping the order within a level. */
export function inLevelOrder<T extends Pick<Candidate, 'difficulty'>>(set: T[]): T[] {
  return set
    .map((c, i) => ({ c, i }))
    .sort(
      (a, b) =>
        LEVEL_ORDER.indexOf(a.c.difficulty) - LEVEL_ORDER.indexOf(b.c.difficulty) || a.i - b.i,
    )
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

/** Every question on the skill, by level, in printed order — the list a teacher ticks from. */
export function byLevel(candidates: Candidate[]): Record<Difficulty, Candidate[]> {
  const out = { easy: [], medium: [], hard: [] } as Record<Difficulty, Candidate[]>
  for (const c of dedupe(candidates)) out[c.difficulty].push(c)
  return out
}

/**
 * The questions a teacher ticked, in the order they are sat: easy → medium →
 * hard, printed order within a level. An id that is not a candidate — a
 * question from another skill, left over from before the skill changed — is
 * dropped.
 */
export function chosenSet(ticked: Iterable<string>, candidates: Candidate[]): Candidate[] {
  const want = new Set(ticked)
  return LEVEL_ORDER.flatMap((l) => byLevel(candidates)[l].filter((c) => want.has(c.question_id)))
}

/** The set's own count at each level — what the builder shows beside the mix. */
export function levelCounts(set: Pick<Candidate, 'difficulty'>[]): Record<Difficulty, number> {
  const out = { easy: 0, medium: 0, hard: 0 } as Record<Difficulty, number>
  for (const c of set) out[c.difficulty] += 1
  return out
}

/* ------------------------------------------------------- several skills --- */

/**
 * `n` over `k` parts as evenly as it goes, the earlier parts taking what is
 * left over: 12 over 3 → 4/4/4, 10 over 3 → 4/3/3, 10 over 4 → 3/3/2/2.
 */
export function splitEvenly(n: number, k: number): number[] {
  if (k <= 0) return []
  const whole = Math.max(0, Math.floor(n))
  const base = Math.floor(whole / k)
  return Array.from({ length: k }, (_, i) => base + (i < whole % k ? 1 : 0))
}

/** One skill's share of a set on several (0086). */
export interface SkillPart {
  skill: string
  /** What an even split asks of it. */
  asked: number
  /** What it gives: fewer when it has too few to ask, more when it covers another's. */
  given: number
  /** Its questions the set may use: unseen, and seen when repeats are allowed. */
  available: number
  /** Its share, balanced across the levels as a set on one skill is. */
  built: BuiltSet
}

export interface BuiltSkillsSet {
  /** The set as it is sat: easy → medium → hard, the skills taking turns within a level. */
  questions: Candidate[]
  size: number
  parts: SkillPart[]
  available: number
  /** size − the set's length: what no skill could supply. */
  missing: number
}

/** The lists merged by taking one from each in turn: [a1 a2] [b1] → a1 b1 a2. */
function inTurn<T>(lists: T[][]): T[] {
  const out: T[] = []
  for (let i = 0; lists.some((l) => i < l.length); i++)
    for (const l of lists) if (i < l.length) out.push(l[i])
  return out
}

/**
 * A balanced set on several skills (0086): the size split evenly between the
 * skills, and each skill's share balanced across the levels by buildSet.
 *
 * A skill with too few questions to ask its share gives what it has, and the
 * others take the difference in turn, in the order the skills were chosen,
 * while they have questions to spare — a short skill shortens nobody's test.
 * Each skill draws from its own seed, taken from the draw's, so one skill's
 * share does not move another's questions.
 *
 * The set is sat easy → medium → hard, as every set is; within a level the
 * skills take turns, so it does not read as two tests one after the other.
 */
export function buildSkillsSet(
  candidates: Candidate[],
  skills: string[],
  size: number,
  o: BuildOptions,
): BuiltSkillsSet {
  const all = dedupe(candidates)
  const n = Math.max(0, Math.floor(size))
  const asked = splitEvenly(n, skills.length)
  const available = skills.map((k) => all.filter((c) => c.skill === k && usable(c, o)).length)
  const given = asked.map((a, i) => Math.min(a, available[i]))

  let short = asked.reduce((s, a, i) => s + a - given[i], 0)
  while (short > 0) {
    let moved = false
    for (let i = 0; i < skills.length && short > 0; i++) {
      if (given[i] < available[i]) {
        given[i] += 1
        short -= 1
        moved = true
      }
    }
    if (!moved) break
  }

  const seeds = skills.map(() => (o.random ? Math.floor(o.random() * 2 ** 31) : 0))
  const parts: SkillPart[] = skills.map((skill, i) => ({
    skill,
    asked: asked[i],
    given: given[i],
    available: available[i],
    built: buildSet(
      all.filter((c) => c.skill === skill),
      given[i],
      { allowRepeats: o.allowRepeats, random: o.random ? seededRandom(seeds[i]) : undefined },
    ),
  }))

  const questions = LEVEL_ORDER.flatMap((l) =>
    inTurn(parts.map((p) => p.built.questions.filter((c) => c.difficulty === l))),
  )
  return {
    questions,
    size: n,
    parts,
    available: available.reduce((s, x) => s + x, 0),
    missing: Math.max(0, n - questions.length),
  }
}

/**
 * What the builder says about a set on several skills it could not split
 * evenly or balance, one line per thing worth knowing:
 *
 *   Boundaries: 1 to ask — an even share is 4
 *   Transitions: 7, covering for another skill
 *   Transitions: a balanced set needs 2 hard; 1 unseen — 1 short; borrowed 1 from medium
 *   10 of 12 available
 */
export function describeSkillsSet(b: BuiltSkillsSet, label: (skill: string) => string): string[] {
  const lines: string[] = []
  for (const p of b.parts) {
    const name = label(p.skill)
    if (p.given < p.asked)
      lines.push(
        p.available === 0
          ? `${name}: nothing to ask — an even share is ${p.asked}`
          : `${name}: ${p.available} to ask — an even share is ${p.asked}`,
      )
    else if (p.given > p.asked) lines.push(`${name}: ${p.given}, covering for another skill`)
    // A skill that gives every question it has had no balance to strike.
    if (p.given >= p.available) continue
    for (const s of describeSet(p.built)) {
      // A part's own "4 of 5 available" is said by the line above.
      if (!/ available$/.test(s)) lines.push(`${name}: ${s}`)
    }
  }
  if (b.missing > 0) lines.push(`${b.questions.length} of ${b.size} available`)
  return lines
}

/** The skills a set asks, in the order given — what checks every chosen skill has a question. */
export function skillsAsked(set: Pick<Candidate, 'skill'>[]): string[] {
  const out: string[] = []
  for (const c of set) if (c.skill && !out.includes(c.skill)) out.push(c.skill)
  return out
}
