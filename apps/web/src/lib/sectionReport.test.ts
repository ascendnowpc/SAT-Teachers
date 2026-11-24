import { describe, expect, it } from 'vitest'
import { defaultConfig, type ProgressItem, type StudentProgress } from './progress'
import { headlineFor, nextFor, patternsFor, scaleNote, sectionReportDoc } from './sectionReport'
import { measureSubject } from './subjectProgress'

const ALG = 'algebra'
const PSDA = 'problem_solving_and_data_analysis'
const SYS = 'systems_of_two_linear_equations_in_two_variables'
const PCT = 'percentages'

let qn = 0
function many(
  session: string,
  section: string,
  skill: string,
  right: number,
  n: number,
  extra: Partial<ProgressItem> = {},
): ProgressItem[] {
  return Array.from({ length: n }, (_, k) => ({
    session_id: session,
    question_id: `q${qn++}`,
    section,
    skill,
    difficulty: 'medium' as const,
    status: 'answered' as const,
    is_correct: k < right,
    timed_out: false,
    elapsed_seconds: 60,
    time_limit_seconds: 60,
    target_seconds: 60,
    ...extra,
  }))
}

function progress(items: ProgressItem[], sessions: StudentProgress['sessions'], targeted: StudentProgress['targeted']): StudentProgress {
  return { sessions, targeted, items, config: defaultConfig('mathematics'), summaries: [], overrides: [] }
}

const sessions: StudentProgress['sessions'] = [
  { id: 'd1', mode: 'diagnostic', status: 'completed', at: '2026-10-01T10:00:00Z', teacher: null },
  { id: 'l1', mode: 'live', status: 'completed', at: '2026-10-08T10:00:00Z', teacher: null },
  { id: 't1', mode: 'targeted', status: 'completed', at: '2026-10-15T10:00:00Z', teacher: null },
  { id: 'l2', mode: 'live', status: 'completed', at: '2026-10-22T10:00:00Z', teacher: null },
  { id: 't2', mode: 'targeted', status: 'completed', at: '2026-11-01T10:00:00Z', teacher: null },
]
const targeted = (id: string, skill: string, n: number) => ({
  session_id: id,
  section: null,
  skill,
  skills: [skill],
  set_size: n,
  set_count: n,
  question_seconds: 60,
  overall_seconds: 600,
})

// Algebra climbs 2/10 → 5/10 → 8/10; Percentages sits at 3/10 → 3/10.
const p = progress(
  [
    ...many('d1', ALG, SYS, 2, 10),
    ...many('d1', PSDA, PCT, 3, 10),
    ...many('t1', ALG, SYS, 5, 10),
    ...many('t1', PSDA, PCT, 3, 10),
    ...many('t2', ALG, SYS, 8, 10),
    ...many('t2', PSDA, PCT, 3, 10),
  ],
  sessions,
  [
    { ...targeted('t1', SYS, 20), skill: null, skills: [SYS, PCT], set_by_skill: { [SYS]: 10, [PCT]: 10 } },
    { ...targeted('t2', SYS, 20), skill: null, skills: [SYS, PCT], set_by_skill: { [SYS]: 10, [PCT]: 10 } },
  ],
)

describe('the headline', () => {
  const m = measureSubject('mathematics', p)

  it('names the domain that moved and the one that has not', () => {
    // Levels: 2/10 → 24, 8/10 → 40; Percentages 3/10 → 26 both times.
    expect(headlineFor(m)).toBe(
      'Algebra improved from 24 to 40 over 4 sessions; Problem-Solving and Data Analysis has not moved after 4 sessions.',
    )
  })

  it('before any check-in, says where the baseline starts', () => {
    const base = measureSubject('mathematics', progress(p.items.filter((i) => i.session_id === 'd1'), sessions.slice(0, 1), []))
    expect(headlineFor(base)).toBe(
      'Baseline set on 2 of 4 domains: strongest Problem-Solving and Data Analysis (3 of 10), weakest Algebra (2 of 10).',
    )
  })

  it('with nothing at all, says the first test sets it', () => {
    expect(headlineFor(measureSubject('english', progress([], [], [])))).toBe(
      'No English tests yet: the first one sets the baseline.',
    )
  })
})

describe('what happens next', () => {
  it('names the weakest domains not yet strong, and the untested ones', () => {
    expect(nextFor(measureSubject('mathematics', p))).toBe(
      'Next, the tutor will focus on Problem-Solving and Data Analysis. Advanced Mathematics and Geometry and Trigonometry have not been tested yet; a first check-in will set their baseline.',
    )
  })
})

describe('patterns in plain words', () => {
  const cfg = { ...defaultConfig('mathematics'), long_words: 40, pattern_min_each: 4, pattern_gap: 0.4 }

  it('says when long questions are the trouble', () => {
    const items = [...many('t1', ALG, SYS, 5, 5), ...many('t1', ALG, SYS, 1, 5)]
    const words = new Map(items.map((i, k) => [i.question_id, k < 5 ? 10 : 80]))
    const out = patternsFor(progress(items, sessions, []), cfg, words)
    expect(out[0]).toBe('Answers short questions well (5 of 5 right) but misses most long ones (1 of 5).')
  })

  it('says when the clock runs out, and when wrong answers come too fast', () => {
    const items = [
      ...many('t1', ALG, SYS, 4, 6),
      ...many('t1', ALG, SYS, 0, 2, { timed_out: true }),
      ...many('t1', ALG, SYS, 0, 3, { elapsed_seconds: 10 }),
    ]
    const out = patternsFor(progress(items, sessions, []), cfg)
    expect(out).toContain('Runs out of time on some questions: 2 of 11 timed out.')
    expect(out).toContain('Some wrong answers come very fast (3 of 5): slowing down on those would help.')
  })

  it('says easy against hard', () => {
    const items = [...many('t1', ALG, SYS, 3, 3, { difficulty: 'easy' }), ...many('t1', ALG, SYS, 0, 4, { difficulty: 'hard' })]
    expect(patternsFor(progress(items, sessions, []), cfg)).toEqual([
      'Gets most easy questions right (3 of 3); the hard ones are the next step (0 of 4).',
    ])
  })

  it('reads nothing from a lesson, and says nothing on too little', () => {
    expect(patternsFor(progress(many('l1', ALG, SYS, 0, 10, { timed_out: true }), sessions, []), cfg)).toEqual([])
    expect(patternsFor(progress(many('t1', ALG, SYS, 1, 2), sessions, []), cfg)).toEqual([])
  })
})

describe('the report', () => {
  const doc = sectionReportDoc({
    student: { full_name: 'Amarra Test', display_id: '0067' },
    at: '2026-11-24T09:00:00Z',
    subjects: { mathematics: p, english: progress([], [], []) },
    goal: { target_rw: 700, target_math: 750, next_test_on: '2026-12-05' },
    bluebook: [{ test_name: 'SAT May 2026', taken_on: '2026-05-02', total: 1350, reading_writing: 650, math: 700 }],
    note: '  Two more sessions on percentages before the test.  ',
    pc: 'Priya Coach',
  })

  it('is one page per subject with tests, and leaves out a subject never sat', () => {
    expect(doc.subjects.map((s) => s.subject)).toEqual(['mathematics'])
    expect(doc.title).toBe('Section Progress Report')
    expect(doc.date).toBe('24 November 2026')
    expect(doc.testDay).toBe('Next SAT: 5 December 2026')
    expect(doc.note).toBe('Two more sessions on percentages before the test.')
  })

  it('gives every domain its baseline, latest, change, colour in words and sessions', () => {
    const [alg, adv, psda] = doc.subjects[0].domains
    expect(alg).toMatchObject({
      label: 'Algebra',
      baseline: { right: 2, of: 10 },
      latest: { right: 8, of: 10 },
      change: 16,
      verdict: 'Improved',
      status: 'Strong',
      sessions: 4,
      tests: 3,
    })
    expect(adv).toMatchObject({ baseline: null, latest: null, change: null, status: 'Not tested yet', tests: 0 })
    expect(psda).toMatchObject({ change: 0, verdict: 'Minimal change', status: 'Needs work' })
  })

  it('sets the goal beside the latest score, and never predicts one', () => {
    expect(doc.subjects[0].goal).toEqual({ target: 750, latest: 700, gap: '50 points to go' })
    expect(doc.scaleNote).toContain('not a predicted SAT score')
    expect(doc.scaleNote).toContain('0 of 10 right = 20, 5 = 30, 8 = 40')
  })
})

describe('the scale', () => {
  it('reads the admin’s mapping', () => {
    expect(scaleNote({ ...defaultConfig('english'), score_points: [[0, 10], [10, 50]] })).toContain('0 of 10 right = 10, 10 = 50')
  })
})
