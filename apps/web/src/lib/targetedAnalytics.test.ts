import { describe, expect, it } from 'vitest'
import { defaultConfig } from './progress'
import {
  analyseTargeted,
  formatOf,
  isLong,
  longPattern,
  wordsIn,
  type AnalysedItem,
  type AnalysedQuestion,
} from './targetedAnalytics'
import type { Difficulty } from './types'

const cfg = defaultConfig('english')

function q(extra: Partial<AnalysedQuestion> = {}): AnalysedQuestion {
  return {
    difficulty: 'medium',
    passage: 'A short passage.',
    passage_underline: null,
    stem: 'Which choice completes the text?',
    image_url: null,
    target_seconds: 60,
    ...extra,
  }
}

function it_(
  correct: boolean,
  seconds: number | null,
  extra: Partial<AnalysedItem> = {},
  question: Partial<AnalysedQuestion> = {},
): AnalysedItem {
  return {
    status: 'answered',
    is_correct: correct,
    timed_out: false,
    elapsed_seconds: seconds,
    time_limit_seconds: 60,
    question: q(question),
    ...extra,
  }
}

const long = 'word '.repeat(80)

describe('formatOf', () => {
  it('reads the most particular format first', () => {
    expect(formatOf(q({ passage: 'Text 1\nOne view.\nText 2\nAnother.' }))).toBe('paired')
    expect(formatOf(q({ passage: 'Year | Count\n2020 | 4\n2021 | 6' }))).toBe('table')
    expect(formatOf(q({ image_url: 'https://x/fig.png' }))).toBe('figure')
    expect(formatOf(q({ passage: 'She ran. He walked.', passage_underline: 'He walked.' }))).toBe(
      'underlined',
    )
    expect(formatOf(q())).toBe('prose')
    expect(formatOf(q({ passage: null }))).toBe('no_passage')
  })
})

describe('wordsIn and isLong', () => {
  it('counts the passage and the stem together, not the table pipes', () => {
    expect(wordsIn({ passage: 'One two | three', stem: 'Four?' })).toBe(4)
    expect(isLong({ passage: long, stem: 'Which?' }, 75)).toBe(true)
    expect(isLong({ passage: 'Short.', stem: 'Which?' }, 75)).toBe(false)
  })
})

describe('analyseTargeted', () => {
  const items: AnalysedItem[] = [
    it_(true, 30, {}, { difficulty: 'easy' }),
    it_(true, 120, {}, { difficulty: 'easy' }), // right, 2× target: hesitation
    it_(false, 20, {}, { difficulty: 'medium' }), // wrong in a third of it: rushed
    it_(false, 50, {}, { difficulty: 'hard', passage: long }), // wrong, took its time: gap
    it_(false, 60, { timed_out: true }, { difficulty: 'hard', passage: long }),
  ]
  const a = analyseTargeted(items, 6, cfg)

  it('scores over what was reached, and counts what was not', () => {
    expect(a).toMatchObject({
      setCount: 6,
      reached: 5,
      correct: 2,
      timedOut: 1,
      notReached: 1,
      raw: 4,
    })
    expect(a.level).toBe(28)
  })

  it('tallies by difficulty', () => {
    const d = (k: Difficulty) => a.byDifficulty[k]
    expect([d('easy'), d('medium'), d('hard')]).toEqual([
      { correct: 2, total: 2 },
      { correct: 0, total: 1 },
      { correct: 0, total: 2 },
    ])
  })

  it('reads time against target, leaving the timed-out one out', () => {
    expect(a.time).toEqual({ seconds: 220, target: 240, timed: 4 })
    expect([a.rushed, a.gap, a.hesitation]).toEqual([1, 1, 1])
  })

  it('splits long from short', () => {
    expect(a.long).toEqual({ correct: 0, total: 2 })
    expect(a.short).toEqual({ correct: 2, total: 3 })
  })

  it('says it in plain English, with the counts', () => {
    expect(a.insights).toEqual([
      '2 of 5 right, 1 not reached — 4.0 out of 10, level score 28.',
      '1 question ran out of time — counted as wrong.',
      'Easy 2 of 2, medium 0 of 1, hard 0 of 2.',
      'Wrong in under half the target time on 1 question — rushing.',
      'Wrong after taking the time on 1 question — a gap in method or knowledge, not speed.',
      'Right but over 1.6× the target time on 1 question — hesitation.',
      'Long questions 0 of 2 right; short 2 of 3.',
    ])
  })

  it('leaves the score and the levels out of the findings, which a screen draws as figures', () => {
    expect(a.findings).toEqual(a.insights.filter((_, i) => i !== 0 && i !== 2))
    expect(analyseTargeted([], 5, cfg).findings).toEqual([])
  })

  it('says nothing was reached rather than scoring zero', () => {
    const none = analyseTargeted([], 5, cfg)
    expect(none.raw).toBeNull()
    expect(none.insights).toEqual(['Nothing was reached: 5 questions not reached.'])
  })

  it('leaves a set-aside question out of the score', () => {
    const b = analyseTargeted([it_(true, 30), it_(false, 10, { status: 'voided' })], 2, cfg)
    expect([b.reached, b.notReached]).toEqual([1, 1])
  })
})

describe('longPattern', () => {
  const longItem = (c: boolean) => it_(c, 50, {}, { passage: long })
  const shortItem = (c: boolean) => it_(c, 50)

  it('flags long questions only with enough of each and a wide enough gap', () => {
    const items = [
      ...[true, false, false, false].map(longItem),
      ...[true, true, true, false].map(shortItem),
    ]
    const p = longPattern(items, cfg)
    expect(p.flagged).toBe(true)
    expect(p.text).toBe(
      'Struggles on long questions: 1 of 4 long right against 3 of 4 short, across the tests on this skill.',
    )
  })

  it('does not with too few of either', () => {
    const p = longPattern([longItem(false), longItem(false), shortItem(true), shortItem(true)], cfg)
    expect(p.flagged).toBe(false)
    expect(p.text).toContain('Too few questions')
  })

  it('does not when the gap is narrower than the setting', () => {
    const items = [
      ...[true, true, false, false].map(longItem),
      ...[true, true, true, false].map(shortItem),
    ]
    expect(longPattern(items, cfg).flagged).toBe(false)
  })
})
