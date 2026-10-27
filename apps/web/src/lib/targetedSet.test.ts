import { describe, expect, it } from 'vitest'
import {
  buildSet,
  byLevel,
  chosenSet,
  describeSet,
  inLevelOrder,
  levelCounts,
  mixFor,
  printedOrder,
  seededRandom,
  type Candidate,
} from './targetedSet'
import type { Difficulty } from './types'

function c(
  id: string,
  difficulty: Difficulty,
  position: number,
  extra: Partial<Candidate> = {},
): Candidate {
  return {
    question_id: id,
    difficulty,
    source: 'test',
    set_level: difficulty,
    set_position: position,
    seen: false,
    ...extra,
  }
}

const ids = (cs: Pick<Candidate, 'question_id'>[]) => cs.map((x) => x.question_id)

describe('mixFor', () => {
  it('is 2/1/2 for five and 3/3/4 for ten', () => {
    expect(mixFor(5)).toEqual({ easy: 2, medium: 1, hard: 2 })
    expect(mixFor(10)).toEqual({ easy: 3, medium: 3, hard: 4 })
  })

  it('always adds up to the size', () => {
    for (let n = 0; n <= 20; n++) {
      const m = mixFor(n)
      expect(m.easy + m.medium + m.hard).toBe(n)
    }
  })

  it('spreads small sets across the levels', () => {
    expect(mixFor(3)).toEqual({ easy: 1, medium: 1, hard: 1 })
    expect(mixFor(1)).toEqual({ easy: 0, medium: 0, hard: 1 })
  })
})

describe('printedOrder', () => {
  it('puts the tests before the pool, the easier test first, then the place in the test', () => {
    const rows = [
      c('p1', 'easy', 1, { source: 'practice', set_level: null }),
      c('m2', 'easy', 2, { set_level: 'medium' }),
      c('e9', 'easy', 9),
      c('e3', 'easy', 3),
    ]
    expect(ids([...rows].sort(printedOrder))).toEqual(['e3', 'e9', 'm2', 'p1'])
  })
})

describe('buildSet', () => {
  const bank = [
    c('e1', 'easy', 1),
    c('e2', 'easy', 2),
    c('e3', 'easy', 3),
    c('m1', 'medium', 1),
    c('m2', 'medium', 2),
    c('h1', 'hard', 1),
    c('h2', 'hard', 2),
    c('h3', 'hard', 3),
  ]

  it('takes each level’s share in printed order, easy → medium → hard', () => {
    const b = buildSet(bank, 5, { allowRepeats: false })
    expect(ids(b.questions)).toEqual(['e1', 'e2', 'm1', 'h1', 'h2'])
    expect(b.shortfalls).toEqual([])
    expect(b.missing).toBe(0)
    expect(describeSet(b)).toEqual([])
  })

  it('is the same set whatever order the rows arrive in', () => {
    const shuffled = [bank[5], bank[0], bank[7], bank[3], bank[2], bank[6], bank[1], bank[4]]
    expect(ids(buildSet(shuffled, 5, { allowRepeats: false }).questions)).toEqual(
      ids(buildSet(bank, 5, { allowRepeats: false }).questions),
    )
  })

  it('leaves a seen question out unless repeats are allowed', () => {
    const rows = bank.map((x) => (x.question_id === 'e1' ? { ...x, seen: true } : x))
    expect(ids(buildSet(rows, 5, { allowRepeats: false }).questions)).toEqual([
      'e2',
      'e3',
      'm1',
      'h1',
      'h2',
    ])
  })

  it('takes unseen before seen when repeats are allowed', () => {
    const rows = bank.map((x) => (x.question_id === 'e1' ? { ...x, seen: true } : x))
    const b = buildSet(rows, 5, { allowRepeats: true })
    expect(ids(b.questions)).toEqual(['e2', 'e3', 'm1', 'h1', 'h2'])
    // and reaches the seen one once the unseen run out
    const two = rows.filter((x) => x.question_id !== 'e3')
    expect(ids(buildSet(two, 5, { allowRepeats: true }).questions)).toEqual([
      'e2',
      'e1',
      'm1',
      'h1',
      'h2',
    ])
  })

  it('borrows a short level from its neighbour and names the shortfall', () => {
    const rows = bank.filter((x) => x.difficulty !== 'medium')
    const b = buildSet(rows, 5, { allowRepeats: false })
    expect(b.shortfalls).toEqual([{ level: 'medium', needed: 1, unseen: 0, seen: 0, short: 1 }])
    expect(b.borrowed).toEqual([{ for: 'medium', from: 'easy', count: 1 }])
    expect(ids(b.questions)).toEqual(['e1', 'e2', 'e3', 'h1', 'h2'])
    expect(b.missing).toBe(0)
    expect(describeSet(b)).toEqual([
      'a balanced set needs 1 medium; 0 unseen — 1 short; borrowed 1 from easy',
    ])
  })

  it('says how many are missing when nobody can lend', () => {
    const rows = [c('e1', 'easy', 1), c('e2', 'easy', 2), c('h1', 'hard', 1), c('h2', 'hard', 2)]
    const b = buildSet(rows, 5, { allowRepeats: false })
    expect(b.questions).toHaveLength(4)
    expect(b.missing).toBe(1)
    expect(b.available).toBe(4)
    expect(describeSet(b)).toEqual([
      'a balanced set needs 1 medium; 0 unseen — 1 short',
      '4 of 5 available',
    ])
  })

  it('counts the seen questions in the shortfall only when repeats are allowed', () => {
    const rows = [
      c('e1', 'easy', 1),
      c('e2', 'easy', 2),
      c('m1', 'medium', 1, { seen: true }),
      c('h1', 'hard', 1),
      c('h2', 'hard', 2),
    ]
    expect(describeSet(buildSet(rows, 5, { allowRepeats: false }))).toEqual([
      'a balanced set needs 1 medium; 0 unseen — 1 short',
      '4 of 5 available',
    ])
    expect(describeSet(buildSet(rows, 5, { allowRepeats: true }))).toEqual([])
  })

  it('borrows for hard from medium before easy', () => {
    const rows = [
      c('e1', 'easy', 1),
      c('e2', 'easy', 2),
      c('e3', 'easy', 3),
      c('m1', 'medium', 1),
      c('m2', 'medium', 2),
    ]
    const b = buildSet(rows, 5, { allowRepeats: false })
    expect(b.borrowed).toEqual([
      { for: 'hard', from: 'medium', count: 1 },
      { for: 'hard', from: 'easy', count: 1 },
    ])
    expect(ids(b.questions)).toEqual(['e1', 'e2', 'e3', 'm1', 'm2'])
  })

  it('reads the pool’s questions after the tests’ at the same level', () => {
    const rows = [...bank, c('p1', 'easy', 1, { source: 'practice', set_level: null })]
    expect(ids(buildSet(rows, 10, { allowRepeats: false }).questions).slice(0, 4)).toEqual([
      'e1',
      'e2',
      'e3',
      'p1',
    ])
  })

  it('keeps one row per question', () => {
    const rows = [...bank, c('e1', 'easy', 1, { source: 'practice', set_level: null })]
    const b = buildSet(rows, 10, { allowRepeats: false })
    expect(new Set(ids(b.questions)).size).toBe(b.questions.length)
  })
})

describe('buildSet at random (Pick for me)', () => {
  const bank = [
    ...Array.from({ length: 8 }, (_, i) => c(`e${i + 1}`, 'easy', i + 1)),
    ...Array.from({ length: 8 }, (_, i) => c(`m${i + 1}`, 'medium', i + 1)),
    ...Array.from({ length: 8 }, (_, i) => c(`h${i + 1}`, 'hard', i + 1)),
  ]
  const pick = (seed: number, rows = bank) =>
    ids(buildSet(rows, 5, { allowRepeats: false, random: seededRandom(seed) }).questions)

  it('is the same draw for the same seed, and keeps the balance', () => {
    expect(pick(7)).toEqual(pick(7))
    const levels = pick(7).map((id) => id[0])
    expect(levels).toEqual(['e', 'e', 'm', 'h', 'h'])
  })

  it('draws differently for another seed', () => {
    const draws = new Set([1, 2, 3, 4, 5, 6].map((s) => pick(s).join()))
    expect(draws.size).toBeGreaterThan(1)
  })

  it('still takes unseen before seen', () => {
    const rows = bank.map((x) => (x.difficulty === 'easy' && x.set_position > 2 ? { ...x, seen: true } : x))
    for (const seed of [1, 2, 3]) {
      const easy = buildSet(rows, 5, { allowRepeats: true, random: seededRandom(seed) }).questions
        .filter((q) => q.difficulty === 'easy')
        .map((q) => q.question_id)
      expect(easy.sort()).toEqual(['e1', 'e2'])
    }
  })
})

describe('byLevel and chosenSet (Choose myself)', () => {
  const bank = [
    c('h2', 'hard', 2),
    c('e2', 'easy', 2),
    c('m1', 'medium', 1),
    c('e1', 'easy', 1),
    c('p1', 'easy', 1, { source: 'practice', set_level: null }),
    c('h1', 'hard', 1),
  ]

  it('lists every question by level, in printed order', () => {
    const l = byLevel(bank)
    expect(ids(l.easy)).toEqual(['e1', 'e2', 'p1'])
    expect(ids(l.medium)).toEqual(['m1'])
    expect(ids(l.hard)).toEqual(['h1', 'h2'])
  })

  it('puts what was ticked in the order it is sat, whatever order it was ticked in', () => {
    expect(ids(chosenSet(['h2', 'p1', 'm1', 'e1'], bank))).toEqual(['e1', 'p1', 'm1', 'h2'])
  })

  it('drops a question that is not on the skill', () => {
    expect(ids(chosenSet(['e1', 'elsewhere'], bank))).toEqual(['e1'])
  })
})

describe('inLevelOrder and levelCounts', () => {
  it('sorts by level and keeps the order within one', () => {
    const set = [c('h1', 'hard', 1), c('e2', 'easy', 2), c('m1', 'medium', 1), c('e1', 'easy', 1)]
    expect(ids(inLevelOrder(set))).toEqual(['e2', 'e1', 'm1', 'h1'])
    expect(levelCounts(set)).toEqual({ easy: 2, medium: 1, hard: 1 })
  })
})
