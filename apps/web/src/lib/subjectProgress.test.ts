import { describe, expect, it } from 'vitest'
import { asProgress, type ReportSubject } from './parentReport'
import {
  measureSubject,
  percent,
  sectionsInSatOrder,
  signedPoints,
  strongestAndWeakest,
  testBySection,
} from './subjectProgress'

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
    { id: 'l1', mode: 'live', status: 'completed', at: '2026-10-25T10:00:00Z' },
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
    // A lesson's questions are teaching, not a measurement: never a point.
    item('l1', ALG, SYS, true, 'revealed'),
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

  it('reads a domain from its baseline through each check-in that asked it', () => {
    const alg = m.sections[0]
    expect(alg.attempts.map((a) => [a.sessionId, a.right, a.of, Math.round(a.level)])).toEqual([
      ['d1', 1, 4, 25],
      ['t1', 2, 5, 28],
      ['t2', 4, 5, 40],
    ])
    expect(alg.answered).toBe(14)
    expect(alg.right).toBe(7)
    expect(alg.rag).toBe('green')
    expect(alg.change).toBe(80 - 25)
    expect(alg.levelChange).toBe(15)
    expect(alg.verdict).toBe('improved')
  })

  it('counts the lessons between, and the sessions spent since the baseline', () => {
    const alg = m.sections[0]
    expect(alg.attempts.map((a) => a.sessionsBefore)).toEqual([0, 0, 1])
    // t1 after the baseline (1), then the lesson and t2 (2).
    expect(alg.sessions).toBe(3)
    expect(alg.sinceLast).toBe(0)
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
    expect(psda.levelChange).toBeNull()
    expect(m.tests).toBe(3)
    expect(m.lessons).toBe(1)
    expect(m.answered).toBe(20)
  })

  it('counts the skills by colour, never-asked included', () => {
    // On the level score: systems 4/5 mastered, percentages 2/6 (27) needs work,
    // inequalities 0/1 (20) focus now; the other sixteen not asked.
    expect(m.skillCounts).toEqual({ green: 1, amber: 1, red: 1, none: 16 })
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

describe('the domains to lead with', () => {
  it('are the strongest and the weakest tested', () => {
    const m = measureSubject('mathematics', asProgress(maths))
    const { strongest, weakest } = strongestAndWeakest(m)
    expect(strongest?.section).toBe(ALG)
    expect(weakest?.section).toBe(PSDA)
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

describe('a check-in across two domains', () => {
  it('is a point on each, made of that domain’s questions alone', () => {
    const mixed: ReportSubject = {
      sessions: [
        { id: 'd1', mode: 'diagnostic', status: 'completed', at: '2026-10-01T10:00:00Z' },
        { id: 'x1', mode: 'targeted', status: 'completed', at: '2026-11-01T10:00:00Z' },
      ],
      targeted: [
        {
          session_id: 'x1',
          section: null,
          skill: null,
          skills: [PCT, SYS],
          set_size: 10,
          set_count: 10,
          set_by_skill: { [PCT]: 4, [SYS]: 6 },
        },
      ],
      items: [...many('d1', ALG, SYS, 1, 2), ...many('d1', PSDA, PCT, 1, 2), ...many('x1', PSDA, PCT, 3, 4), ...many('x1', ALG, SYS, 2, 5)],
      config: null,
    }
    const m = measureSubject('mathematics', asProgress(mixed))
    const alg = m.sections[0]
    const psda = m.sections[2]
    expect(alg.attempts.map((a) => `${a.sessionId} ${a.right}/${a.of}`)).toEqual(['d1 1/2', 'x1 2/5'])
    expect(psda.attempts.map((a) => `${a.sessionId} ${a.right}/${a.of}`)).toEqual(['d1 1/2', 'x1 3/4'])
    expect(m.tests).toBe(2)
  })
})
