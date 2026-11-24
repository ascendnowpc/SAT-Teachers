import { describe, expect, it } from 'vitest'
import { asProgress, type ReportSubject } from './parentReport'
import { readingFromModel } from './scoreReader'
import { hasPlanData, horizonsFor, parsePlan, planFacts, planPrompt } from './studyPlan'
import { measureSubject } from './subjectProgress'

const SYS = 'systems_of_two_linear_equations_in_two_variables'
const PCT = 'percentages'
const many = (session_id: string, section: string, skill: string, right: number, n: number) =>
  Array.from({ length: n }, (_, k) => ({ session_id, section, skill, status: 'answered' as const, is_correct: k < right, timed_out: false }))

const maths: ReportSubject = {
  sessions: [{ id: 'd1', mode: 'diagnostic', status: 'completed', at: '2026-10-01T10:00:00Z' }],
  targeted: [],
  items: [...many('d1', 'algebra', SYS, 9, 10), ...many('d1', 'problem_solving_and_data_analysis', PCT, 2, 10)],
  config: null,
}

const facts = planFacts({
  student: 'Amarra',
  today: '2026-11-24',
  daysToExam: 11,
  horizon: 'two_weeks',
  goal: { total: 1450, rw: null, math: null, college: 'NYU, 1450+' },
  latestSat: { total: 1350, rw: 650, math: 700, on: '2026-05-02' },
  measures: [measureSubject('mathematics', asProgress(maths))],
})

describe('what the model is shown', () => {
  it('is each domain and skill out of 40, with its colour in words', () => {
    const alg = facts.subjects[0].domains.find((d) => d.label === 'Algebra')!
    expect(alg).toMatchObject({ score: 40, status: 'Mastered', tests: 1 })
    expect(alg.skills).toEqual([{ label: 'Systems of Two Linear Equations in Two Variables', score: 40, status: 'Mastered' }])
    const psda = facts.subjects[0].domains.find((d) => d.label === 'Problem-Solving and Data Analysis')!
    expect(psda).toMatchObject({ score: 24, status: 'Focus now' })
    expect(facts.subjects[0].domains.find((d) => d.label === 'Advanced Mathematics')).toMatchObject({ score: null, status: 'Not tested yet' })
  })

  it('carries the horizon and the days left, and nothing else is asked for', () => {
    const p = planPrompt(facts)
    expect(p).toContain('last two weeks before the exam')
    expect(p).toContain('The exam is in 11 days.')
    expect(hasPlanData(facts)).toBe(true)
  })

  it('offers the late horizons only with an exam date', () => {
    expect(horizonsFor(null)).toEqual(['now'])
    expect(horizonsFor(11)).toEqual(['now', 'two_weeks', 'one_week'])
  })
})

describe('the plan that comes back', () => {
  it('keeps the steps on domains and skills it was shown, at most five', () => {
    const plan = parsePlan(
      {
        headline: '  Algebra is strong; Percentages is the job now. ',
        steps: [
          { focus: 'Percentages', action: 'Revise percent change and do two timed sets.', why: 'Percentages 24/40' },
          { focus: 'Trigonometry tricks', action: 'Learn SOHCAHTOA', why: 'made up' },
          { focus: 'Algebra', action: 'Keep it light: one mixed set a week.', why: 'Algebra 40/40' },
        ],
      },
      facts,
    )
    expect(plan.headline).toBe('Algebra is strong; Percentages is the job now.')
    expect(plan.steps.map((s) => s.focus)).toEqual(['Percentages', 'Algebra'])
  })

  it('refuses a plan with nothing usable', () => {
    expect(() => parsePlan({ headline: 'Work hard', steps: [{ focus: 'Life', action: 'x', why: 'y' }] }, facts)).toThrow()
    expect(() => parsePlan(null, facts)).toThrow()
  })
})

describe('a score report read from a picture', () => {
  const today = '2026-11-24'

  it('takes the scores and the bands that are on the scale', () => {
    const r = readingFromModel(
      {
        is_score_report: true,
        is_psat: false,
        student_name: 'Amarra Test',
        test_name: 'SAT March 2026',
        official: true,
        taken_on: '2026-03-14',
        total: 1400,
        reading_writing: 700,
        math: 700,
        total_percentile: 94,
        domains: [
          { domain: 'Information and Ideas', low: 650, high: 700 },
          { domain: 'Craft and Structure', low: 650, high: 700 },
          { domain: 'Expression of Ideas', low: 650, high: 700 },
          { domain: 'Standard English Conventions', low: 650, high: 700 },
          { domain: 'Algebra', low: 680, high: 800 },
          { domain: 'Advanced Math', low: 610, high: 670 },
          { domain: 'Problem-Solving and Data Analysis', low: 610, high: 670 },
          { domain: 'Geometry and Trigonometry', low: 610, high: 670 },
        ],
      },
      today,
    )
    expect(r.score).toMatchObject({ total: 1400, readingWriting: 700, math: 700, takenOn: '2026-03-14', official: true, totalPercentile: 94 })
    expect(r.score.domains?.algebra).toEqual([680, 800])
    expect(r.name).toBe('Amarra Test')
    expect(r.notes[0]).toMatch(/Check them, then save/)
  })

  it('drops what is off the scale, flags what does not add up, and refuses a PSAT', () => {
    const odd = readingFromModel({ is_score_report: true, is_psat: false, total: 1405, reading_writing: 700, math: 690, domains: [] }, today)
    expect(odd.score.total).toBeNull()
    expect(odd.notes.join(' ')).toMatch(/off the SAT's scale: a total of 1405/)
    const sum = readingFromModel({ is_score_report: true, is_psat: false, total: 1400, reading_writing: 700, math: 690, domains: [] }, today)
    expect(sum.notes.join(' ')).toMatch(/do not add up/)
    const psat = readingFromModel({ is_score_report: true, is_psat: true, total: 1200, domains: [] }, today)
    expect(psat.score.total).toBeNull()
    expect(psat.notes[0]).toMatch(/PSAT/)
  })

  it('keeps no half set of bands, and no date still to come', () => {
    const r = readingFromModel(
      { is_score_report: true, is_psat: false, taken_on: '2027-01-01', total: 1400, reading_writing: 700, math: 700, domains: [{ domain: 'Algebra', low: 680, high: 800 }] },
      today,
    )
    expect(r.score.domains).toBeNull()
    expect(r.score.takenOn).toBeNull()
    expect(r.notes.join(' ')).toMatch(/still to come/)
  })
})
