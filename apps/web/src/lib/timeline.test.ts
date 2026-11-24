import { describe, expect, it } from 'vitest'
import { deadlineFor, upcomingSatDates } from './satDates'
import { asProgress, type ReportSubject } from './parentReport'
import { measureSubject } from './subjectProgress'
import { asOfDay, defaultPoint, domainsAt, monthYearShort, timelinePoints } from './timeline'
import { goalProblem, goalTotal, parseTotal } from './goal'

const rows = [
  { test_name: 'SAT March 2026', taken_on: '2026-03-14', total: 1400, reading_writing: 700, math: 700, official: true, domains: { algebra: [650, 700] as [number, number] } },
  { test_name: 'Practice Test 1', taken_on: '2025-04-12', total: 1300, reading_writing: 650, math: 650, official: false, domains: null },
  { test_name: 'Practice Test 2', taken_on: '2025-07-19', total: 1360, reading_writing: 680, math: 680, official: false, domains: null },
]
const goal = { target_total: 1450, target_rw: null, target_math: null, next_test_on: '2026-12-05' }

describe('the timeline', () => {
  const points = timelinePoints(rows, goal, '2025-06-01')

  it('runs oldest first, the target last', () => {
    expect(points.map((p) => p.total)).toEqual([1300, 1360, 1400, 1450])
    expect(points[3]).toMatchObject({ kind: 'target', tag: 'target', day: '2026-12-05' })
  })

  it('marks a test from before the student joined, and names an official one', () => {
    expect(points.map((p) => p.tag)).toEqual(['before AscendNow', 'Practice Test 2', 'official', 'target'])
    expect(points[0].before).toBe(true)
    expect(points[2].domains).toEqual({ algebra: [650, 700] })
  })

  it('has no target without a goal, and opens on the latest test', () => {
    const bare = timelinePoints(rows, null, null)
    expect(bare.map((p) => p.kind)).toEqual(['test', 'test', 'test'])
    expect(defaultPoint(points)).toBe('2026-03-14/SAT March 2026')
    expect(defaultPoint(timelinePoints([], goal, null))).toBe('target')
    expect(defaultPoint([])).toBeNull()
  })

  it('reads an earlier test as of its day, the latest and the target as of now', () => {
    expect(asOfDay(points, '2025-07-19/Practice Test 2')).toBe('2025-07-19')
    expect(asOfDay(points, '2026-03-14/SAT March 2026')).toBeNull()
    expect(asOfDay(points, 'target')).toBeNull()
  })

  it('labels a point by month and year', () => {
    expect(monthYearShort('2026-09-12')).toBe('Sep 26')
  })
})

describe('the domains on a day', () => {
  const SYS = 'systems_of_two_linear_equations_in_two_variables'
  const many = (session_id: string, right: number, n: number) =>
    Array.from({ length: n }, (_, k) => ({
      session_id,
      section: 'algebra',
      skill: SYS,
      status: 'answered' as const,
      is_correct: k < right,
      timed_out: false,
    }))
  const subject: ReportSubject = {
    sessions: [
      { id: 'd1', mode: 'diagnostic', status: 'completed', at: '2026-10-01T10:00:00Z' },
      { id: 't1', mode: 'targeted', status: 'completed', at: '2026-11-01T10:00:00Z' },
    ],
    targeted: [{ session_id: 't1', section: 'algebra', skill: SYS, skills: [SYS], set_size: 10, set_count: 10 }],
    items: [...many('d1', 2, 10), ...many('t1', 9, 10)],
    config: null,
  }
  const m = measureSubject('mathematics', asProgress(subject))

  it('takes the last point on or before the day, out of the level scale', () => {
    const before = domainsAt(m, '2026-10-15')[0]
    expect(before).toMatchObject({ section: 'algebra', right: 2, of: 10, rag: 'red', tests: 1 })
    expect(Math.round(before.level!)).toBe(24)
    const now = domainsAt(m, null)[0]
    expect(now).toMatchObject({ right: 9, of: 10, rag: 'green', tests: 2 })
    expect(domainsAt(m, '2026-09-01')[0]).toMatchObject({ level: null, rag: null, tests: 0 })
  })

  it('does the same for each skill', () => {
    const sys = domainsAt(m, '2026-10-15')[0].skills.find((k) => k.skill === SYS)!
    expect(sys).toMatchObject({ right: 2, of: 10, rag: 'red' })
  })
})

describe('the SAT calendar', () => {
  it('offers the next official dates', () => {
    expect(upcomingSatDates('2026-11-24').map((d) => d.day)).toEqual(['2026-12-05', '2027-03-06', '2027-05-01'])
  })

  it('keeps the deadline that still counts', () => {
    // 5 Dec 2026: regular deadline 20 Nov, late 24 Nov.
    expect(deadlineFor('2026-12-05', '2026-11-10')).toBe('2026-11-20')
    expect(deadlineFor('2026-12-05', '2026-11-22')).toBe('2026-11-24')
    expect(deadlineFor('2026-12-06', '2026-11-22')).toBeNull()
  })
})

describe('the total goal (0105)', () => {
  it('is 400 to 1600 in tens, and wins over the sections', () => {
    expect(parseTotal('1450')).toBe(1450)
    expect(parseTotal('1455')).toBeUndefined()
    expect(parseTotal('')).toBeNull()
    expect(goalProblem('', '', '', '2026-11-24', '', '1700')).toMatch(/400 to 1600/)
    expect(goalTotal({ target_total: 1450, target_rw: 700, target_math: 700, next_test_on: null })).toBe(1450)
    expect(goalTotal({ target_total: null, target_rw: 700, target_math: 720, next_test_on: null })).toBe(1420)
  })
})
