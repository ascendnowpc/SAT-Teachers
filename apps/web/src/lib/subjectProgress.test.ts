import { describe, expect, it } from 'vitest'
import { asProgress, type ReportSubject } from './parentReport'
import { measureSubject, percent, sectionsInSatOrder, signedPoints, testBySection } from './subjectProgress'

const ALG = 'algebra'
const PSDA = 'problem_solving_and_data_analysis'
const SYS = 'systems_of_two_linear_equations_in_two_variables'
const INEQ = 'linear_inequalities_in_one_or_two_variables'
const PCT = 'percentages'

const item = (
  session_id: string,
  section: string,
  skill: string,
  right: boolean,
  status: 'answered' | 'revealed' | 'voided' = 'answered',
) => ({ session_id, section, skill, status, is_correct: right, timed_out: false })

const many = (session_id: string, section: string, skill: string, right: number, of: number) =>
  Array.from({ length: of }, (_, k) => item(session_id, section, skill, k < right))

/** A diagnostic, then two practice tests on systems, and one still to come. */
const maths: ReportSubject = {
  sessions: [
    { id: 'd1', mode: 'diagnostic', status: 'completed', at: '2026-10-01T10:00:00Z' },
    { id: 't1', mode: 'targeted', status: 'completed', at: '2026-10-20T10:00:00Z' },
    { id: 't2', mode: 'targeted', status: 'completed', at: '2026-11-10T10:00:00Z' },
    { id: 't3', mode: 'targeted', status: 'scheduled', at: '2026-12-01T10:00:00Z' },
  ],
  targeted: [
    { session_id: 't1', section: ALG, skill: SYS, set_size: 5, set_count: 5 },
    { session_id: 't2', section: ALG, skill: SYS, set_size: 5, set_count: 5 },
  ],
  items: [
    ...many('d1', ALG, SYS, 1, 3),
    ...many('d1', ALG, INEQ, 0, 1),
    ...many('d1', PSDA, PCT, 2, 6),
    item('d1', PSDA, PCT, true, 'voided'),
    ...many('t1', ALG, SYS, 2, 5),
    ...many('t2', ALG, SYS, 4, 5),
  ],
  config: null,
}

describe('a subject by its sections', () => {
  const m = measureSubject('mathematics', asProgress(maths))

  it('lists all four sections, in the SAT order, asked or not', () => {
    expect(m.sections.map((s) => s.section)).toEqual([
      'algebra',
      'advanced_math',
      'problem_solving_and_data_analysis',
      'geometry_and_trigonometry',
    ])
    const geo = m.sections[3]
    expect(geo.attempts).toEqual([])
    expect(geo.rag).toBeNull()
    expect(geo.skills.every((s) => s.rag === null)).toBe(true)
  })

  it('counts each test that asked a section once, oldest first', () => {
    const alg = m.sections[0]
    expect(alg.attempts.map((a) => [a.sessionId, a.right, a.of])).toEqual([
      ['d1', 1, 4],
      ['t1', 2, 5],
      ['t2', 4, 5],
    ])
    expect(alg.answered).toBe(14)
    expect(alg.right).toBe(7)
    expect(alg.rag).toBe('green')
    expect(alg.change).toBe(80 - 25)
  })

  it('measures each skill on its own', () => {
    const alg = m.sections[0]
    const sys = alg.skills.find((s) => s.skill === SYS)!
    const ineq = alg.skills.find((s) => s.skill === INEQ)!
    expect(sys.attempts.map((a) => `${a.right}/${a.of}`)).toEqual(['1/3', '2/5', '4/5'])
    expect(sys.verdict).toBe('improved')
    expect(ineq.attempts.map((a) => `${a.right}/${a.of}`)).toEqual(['0/1'])
    expect(ineq.rag).toBe('red')
    expect(ineq.change).toBeNull()
  })

  it('leaves out a voided question and a test not yet sat', () => {
    const psda = m.sections[2]
    expect(psda.attempts.map((a) => `${a.sessionId} ${a.right}/${a.of}`)).toEqual(['d1 2/6'])
    expect(m.attempts.map((a) => a.sessionId)).toEqual(['d1', 't1', 't2'])
  })

  it('counts the skills by colour, never-asked included', () => {
    // Systems green, inequalities red, percentages red; the other sixteen not asked.
    expect(m.skillCounts).toEqual({ green: 1, amber: 0, red: 2, none: 16 })
  })

  it('gives a section the SAT band from the latest report that has one', () => {
    const withBands = measureSubject('mathematics', asProgress(maths), [
      {
        test_name: 'SAT May 2026',
        taken_on: '2026-05-02',
        total: 1350,
        reading_writing: 650,
        math: 700,
        domains: { algebra: [650, 700] },
      },
    ])
    expect(withBands.sections[0].band).toEqual({ range: [650, 700], on: '2026-05-02' })
    expect(withBands.sections[1].band).toBeNull()
  })
})

describe('the sections', () => {
  it('come in the score report’s order', () => {
    expect(sectionsInSatOrder('english').map((s) => s.value)).toEqual([
      'information_and_ideas',
      'craft_and_structure',
      'expression_of_ideas',
      'standard_english_conventions',
    ])
  })
})

describe('one test, split by section', () => {
  it('a targeted test counts every question reached', () => {
    expect(testBySection('mathematics', maths.items, 'd1', false)).toEqual([
      { section: ALG, label: 'Algebra', right: 1, of: 4 },
      { section: PSDA, label: 'Problem-Solving and Data Analysis', right: 2, of: 6 },
    ])
  })

  it('a lesson counts only what the teacher revealed', () => {
    const items = [item('l1', ALG, SYS, true, 'revealed'), item('l1', ALG, SYS, false, 'answered')]
    expect(testBySection('mathematics', items, 'l1', true)).toEqual([
      { section: ALG, label: 'Algebra', right: 1, of: 1 },
    ])
  })
})

describe('the figures', () => {
  it('reads a share as a whole percentage, and nothing as nothing', () => {
    expect(percent({ right: 2, of: 6 })).toBe(33)
    expect(percent({ right: 0, of: 0 })).toBeNull()
    expect(percent(null)).toBeNull()
  })

  it('signs a change', () => {
    expect(signedPoints(12)).toBe('+12')
    expect(signedPoints(-8)).toBe('−8')
    expect(signedPoints(0)).toBe('±0')
  })
})
