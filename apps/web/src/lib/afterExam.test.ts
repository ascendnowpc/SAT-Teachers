import { describe, expect, it } from 'vitest'
import { diffLabel, examStage, resultFor, versusGoal, type Reflection } from './afterExam'
import type { BluebookRow } from './bluebook'
import type { StudentGoal } from './goal'

const goal = (next: string | null, total = 1450): StudentGoal => ({
  target_total: total,
  target_rw: 700,
  target_math: null,
  next_test_on: next,
  registration_deadline_on: null,
  college_note: null,
})
const row = (taken_on: string, total: number, official = false): BluebookRow => ({
  test_name: official ? 'SAT' : 'Practice',
  taken_on,
  total,
  reading_writing: total / 2 - 20,
  math: total / 2 + 20,
  official,
})
const reflection = (r: Partial<Reflection> = {}): Reflection => ({
  exam_on: '2026-12-05',
  went_well: null,
  was_hard: null,
  next_time: null,
  retake: null,
  pc_summary: null,
  ...r,
})

describe('examStage', () => {
  it('is nothing before the SAT, on the day, or with no date', () => {
    expect(examStage(goal('2026-12-05'), [], [], '2026-12-01').kind).toBe('none')
    expect(examStage(goal('2026-12-05'), [], [], '2026-12-05').kind).toBe('none')
    expect(examStage(goal(null), [], [], '2026-12-20').kind).toBe('none')
  })

  it('waits for the results once the SAT is past, counting the days', () => {
    const s = examStage(goal('2026-12-05'), [row('2026-11-01', 1300)], [], '2026-12-12')
    expect(s).toEqual({ kind: 'waiting', examOn: '2026-12-05', daysSince: 7 })
  })

  it('asks for the reflection once a score dated on or after it is in', () => {
    const s = examStage(goal('2026-12-05'), [row('2026-12-05', 1420, true)], [], '2026-12-20')
    expect(s.kind).toBe('reflect')
  })

  it('is done once anything is answered for that SAT', () => {
    const rows = [row('2026-12-05', 1420, true)]
    expect(examStage(goal('2026-12-05'), rows, [reflection({ retake: false })], '2026-12-20').kind).toBe('done')
    expect(examStage(goal('2026-12-05'), rows, [reflection({ pc_summary: 'only the PC' })], '2026-12-20').kind).toBe('reflect')
    expect(examStage(goal('2026-12-05'), rows, [reflection({ exam_on: '2026-08-29', went_well: 'x' })], '2026-12-20').kind).toBe(
      'reflect',
    )
  })
})

describe('resultFor', () => {
  it('takes an official score before a practice one of the same days', () => {
    const r = resultFor([row('2026-12-06', 1400), row('2026-12-07', 1420, true)], '2026-12-05')
    expect(r?.total).toBe(1420)
  })

  it('ignores anything sat before the exam', () => {
    expect(resultFor([row('2026-12-04', 1400, true)], '2026-12-05')).toBeNull()
  })
})

describe('versusGoal and diffLabel', () => {
  it('sets the result beside the goal, a section without a goal left open', () => {
    const v = versusGoal(row('2026-12-05', 1420, true), goal('2026-12-05'))
    expect(v.map((x) => [x.label, x.score, x.goal, x.diff])).toEqual([
      ['Total', 1420, 1450, -30],
      ['Reading & Writing', 690, 700, -10],
      ['Math', 730, null, null],
    ])
  })

  it('never reads as a failing mark', () => {
    expect(diffLabel(-30)).toBe('30 to go')
    expect(diffLabel(0)).toBe('Goal reached')
    expect(diffLabel(20)).toBe('+20 past the goal')
    expect(diffLabel(null)).toBeNull()
  })
})
