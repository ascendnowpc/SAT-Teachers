import { describe, expect, it } from 'vitest'
import { bySatDate, overviewRow, type OverviewStudent } from './overview'

const many = (session_id: string, section: string, skill: string, right: number, n: number) =>
  Array.from({ length: n }, (_, k) => ({
    session_id,
    section,
    skill,
    status: 'answered' as const,
    is_correct: k < right,
    timed_out: false,
  }))

const SYS = 'systems_of_two_linear_equations_in_two_variables'
const PCT = 'percentages'

const ana: OverviewStudent = {
  id: 'a',
  full_name: 'Ana Over',
  display_id: '0101',
  pc: 'Pat',
  goal: { target_rw: 700, target_math: 750, next_test_on: '2026-12-05', registration_deadline_on: '2026-11-27', confirmed_at: null },
  sat: { total: 1350, reading_writing: 650, math: 700, taken_on: '2026-05-02', test_name: 'SAT May 2026' },
  subjects: {
    mathematics: {
      sessions: [
        { id: 'd1', mode: 'diagnostic', status: 'completed', at: '2026-10-01T10:00:00Z' },
        { id: 't1', mode: 'targeted', status: 'completed', at: '2026-11-01T10:00:00Z' },
      ],
      targeted: [
        { session_id: 't1', section: null, skill: null, skills: [SYS, PCT], set_size: 20, set_count: 20, set_by_skill: { [SYS]: 10, [PCT]: 10 } },
      ],
      items: [
        ...many('d1', 'algebra', SYS, 2, 10),
        ...many('d1', 'problem_solving_and_data_analysis', PCT, 3, 10),
        ...many('t1', 'algebra', SYS, 8, 10),
        ...many('t1', 'problem_solving_and_data_analysis', PCT, 3, 10),
      ],
      config: null,
    },
  },
}

describe('a student at a glance', () => {
  const row = overviewRow(ana, '2026-11-24')

  it('has the next SAT, its deadline and the gap to the goal', () => {
    expect(row.nextSat).toBe('2026-12-05')
    expect(row.daysToSat).toBe(11)
    expect(row.registration).toEqual({ text: 'Registration closes in 3 days', urgent: true })
    expect(row.goalTotal).toBe(1450)
    expect(row.gap).toBe(100)
    expect(row.confirmed).toBe(false)
  })

  it('names the domains improving and those stuck', () => {
    expect(row.improving.map((d) => d.label)).toEqual(['Math · Algebra'])
    expect(row.stuck.map((d) => d.label)).toEqual(['Math · Problem-Solving and Data Analysis'])
    expect(row.toPractise).toBe(1)
    expect(row.tests).toBe(2)
    expect(row.lastTestAt).toBe('2026-11-01T10:00:00Z')
  })

  it('drops an SAT already gone, and has no gap without a score', () => {
    const gone = overviewRow({ ...ana, sat: null, goal: { ...ana.goal!, next_test_on: '2026-11-01' } }, '2026-11-24')
    expect(gone.nextSat).toBeNull()
    expect(gone.registration).toBeNull()
    expect(gone.gap).toBeNull()
  })
})

describe('the order', () => {
  it('is soonest SAT first, then the rest by name', () => {
    const rows = [
      overviewRow({ ...ana, id: 'z', full_name: 'Zed', goal: null }, '2026-11-24'),
      overviewRow({ ...ana, id: 'b', full_name: 'Bea', goal: { ...ana.goal!, next_test_on: '2027-03-13' } }, '2026-11-24'),
      overviewRow({ ...ana, id: 'y', full_name: 'Abe', goal: null }, '2026-11-24'),
      overviewRow(ana, '2026-11-24'),
    ]
    expect(rows.sort(bySatDate).map((r) => r.name)).toEqual(['Ana Over', 'Bea', 'Abe', 'Zed'])
  })
})
