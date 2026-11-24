import { describe, expect, it } from 'vitest'
import {
  countdownLabel,
  gapFlag,
  registrationLabel,
  daysUntil,
  goalProblem,
  goalTotal,
  hasGoal,
  latestSat,
  NO_GOAL,
  parseTarget,
  toGo,
} from './goal'

describe('a target', () => {
  it('is a section score: 200 to 800, in tens', () => {
    expect(parseTarget('700')).toBe(700)
    expect(parseTarget(' 200 ')).toBe(200)
    expect(parseTarget('')).toBeNull()
    expect(parseTarget('705')).toBeUndefined()
    expect(parseTarget('190')).toBeUndefined()
    expect(parseTarget('810')).toBeUndefined()
    expect(parseTarget('1400')).toBeUndefined()
    expect(parseTarget('7oo')).toBeUndefined()
  })

  it('says what is wrong before it is saved', () => {
    expect(goalProblem('700', '750', '2026-12-05', '2026-11-24')).toBeNull()
    expect(goalProblem('', '', '', '2026-11-24')).toBeNull()
    expect(goalProblem('705', '', '', '2026-11-24')).toMatch(/Reading & Writing/)
    expect(goalProblem('', '900', '', '2026-11-24')).toMatch(/Math/)
    expect(goalProblem('', '', '2026-11-01', '2026-11-24')).toMatch(/still to come/)
  })
})

describe('the goal', () => {
  it('has a total only with both halves', () => {
    expect(goalTotal({ target_rw: 700, target_math: 750, next_test_on: null })).toBe(1450)
    expect(goalTotal({ target_rw: 700, target_math: null, next_test_on: null })).toBeNull()
    expect(goalTotal(null)).toBeNull()
  })

  it('is set when any part of it is', () => {
    expect(hasGoal(NO_GOAL)).toBe(false)
    expect(hasGoal(null)).toBe(false)
    expect(hasGoal({ ...NO_GOAL, next_test_on: '2026-12-05' })).toBe(true)
  })

  it('reads the distance to it', () => {
    expect(toGo(650, 700)).toBe('50 to go')
    expect(toGo(720, 700)).toBe('Reached')
    expect(toGo(null, 700)).toBeNull()
    expect(toGo(650, null)).toBeNull()
  })
})

describe('the next test', () => {
  it('counts whole days in the calendar', () => {
    expect(daysUntil('2026-12-05', '2026-11-24')).toBe(11)
    expect(daysUntil('2026-11-24', '2026-11-24')).toBe(0)
    expect(daysUntil('2026-11-20', '2026-11-24')).toBe(-4)
    // Across the clocks going back.
    expect(daysUntil('2026-11-02', '2026-10-24')).toBe(9)
  })

  it('says it in words', () => {
    expect(countdownLabel('2026-11-24', '2026-11-24')).toBe('Today')
    expect(countdownLabel('2026-11-25', '2026-11-24')).toBe('Tomorrow')
    expect(countdownLabel('2026-12-05', '2026-11-24')).toBe('In 11 days')
    expect(countdownLabel('2027-03-13', '2026-11-24')).toBe('In 16 weeks')
    expect(countdownLabel('2026-11-01', '2026-11-24')).toBe('Passed')
  })
})

describe('the latest SAT', () => {
  it('is the last day sat, in each half', () => {
    const rows = [
      { test_name: 'SAT May 2026', taken_on: '2026-05-02', total: 1350, reading_writing: 650, math: 700 },
      { test_name: 'Practice Test 4', taken_on: '2026-03-01', total: 1200, reading_writing: 600, math: 600 },
    ]
    expect(latestSat(rows)).toEqual({ total: 1350, rw: 650, math: 700, on: '2026-05-02' })
    expect(latestSat([])).toBeNull()
  })
})

describe('the registration deadline and the flag (0101)', () => {
  it('is on or before the test', () => {
    expect(goalProblem('', '', '2026-12-05', '2026-11-24', '2026-11-20')).toBeNull()
    expect(goalProblem('', '', '2026-12-05', '2026-11-24', '2026-12-10')).toMatch(/before the test/)
  })

  it('reads in words, urgent in the last week', () => {
    expect(registrationLabel('2026-11-27', '2026-11-24')).toEqual({ text: 'Registration closes in 3 days', urgent: true })
    expect(registrationLabel('2026-12-20', '2026-11-24')).toEqual({ text: 'Registration closes in 26 days', urgent: false })
    expect(registrationLabel('2026-11-20', '2026-11-24')?.text).toBe('Registration deadline passed')
    expect(registrationLabel(null, '2026-11-24')).toBeNull()
  })

  it('flags each half still short of its goal in the last month', () => {
    const goal = { target_rw: 700, target_math: 750, next_test_on: '2026-12-05', registration_deadline_on: null }
    expect(gapFlag(goal, { rw: 650, math: 760 }, '2026-11-24')).toEqual({ days: 11, parts: [{ name: 'Reading & Writing', gap: 50 }] })
    expect(gapFlag(goal, { rw: 650, math: 700 }, '2026-10-01')).toBeNull()
    expect(gapFlag(goal, { rw: 720, math: 760 }, '2026-11-24')).toBeNull()
    expect(gapFlag(goal, null, '2026-11-24')).toBeNull()
  })
})
