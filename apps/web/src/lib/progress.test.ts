import { describe, expect, it } from 'vitest'
import {
  caveatText,
  defaultConfig,
  describeLine,
  formatPoints,
  parsePoints,
  mapScore,
  onePointWorth,
  progressLine,
  progressLines,
  rawOutOf10,
  sessionsSinceLastTest,
  settingsProblem,
  verdictFor,
  verdictText,
  type ProgressItem,
  type ProgressSession,
  type ProgressTargeted,
  type StudentProgress,
} from './progress'

const POINTS = defaultConfig('english').score_points

describe('mapScore', () => {
  it('passes through the points', () => {
    expect(mapScore(0, POINTS)).toBe(20)
    expect(mapScore(5, POINTS)).toBe(30)
    expect(mapScore(8, POINTS)).toBe(40)
  })

  it('is linear between them', () => {
    expect(mapScore(2.5, POINTS)).toBe(25)
    expect(mapScore(6.5, POINTS)).toBe(35)
  })

  it('carries the last slope on above the last point', () => {
    expect(mapScore(9, POINTS)).toBeCloseTo(43.33, 2)
    expect(mapScore(10, POINTS)).toBeCloseTo(46.67, 2)
  })

  it('takes an admin’s extra point', () => {
    expect(mapScore(10, [...POINTS, [10, 50]])).toBe(50)
    expect(mapScore(9, [...POINTS, [10, 50]])).toBe(45)
  })
})

describe('rawOutOf10', () => {
  it('scales correct over reached to 10, and is null with nothing reached', () => {
    expect(rawOutOf10(3, 5)).toBe(6)
    expect(rawOutOf10(0, 0)).toBeNull()
  })
})

describe('verdicts', () => {
  const cfg = defaultConfig('english')

  it('reads the thresholds', () => {
    expect(verdictFor(5, cfg)).toBe('improved')
    expect(verdictFor(4, cfg)).toBe('minimal')
    expect(verdictFor(-4, cfg)).toBe('minimal')
    expect(verdictFor(-5, cfg)).toBe('declined')
  })

  it('says what the agreed wording says', () => {
    expect(verdictText('minimal', 3)).toBe(
      'No significant improvement after 3 sessions. This may be a ceiling for this skill, or the student may need to work deeper on method and unlearn habits.',
    )
    expect(verdictText('declined', 2)).toContain('A dip is common when learning a new technique.')
  })

  it('carries a caveat computed from the mapping', () => {
    // 5 questions: one is 2 raw points, which is 4 level points under 5/10.
    expect(onePointWorth(5, 2, POINTS)).toBe(4)
    expect(caveatText(5, onePointWorth(5, 2, POINTS))).toBe(
      'On 5 questions, one question is worth about 4 points.',
    )
  })
})

/* -------------------------------------------------------------- lines --- */

const S = 'expression_of_ideas'
const K = 'transitions'

function session(
  id: string,
  mode: ProgressSession['mode'],
  day: number,
  status: ProgressSession['status'] = 'completed',
): ProgressSession {
  return {
    id,
    mode,
    status,
    at: `2026-10-${String(day).padStart(2, '0')}T10:00:00Z`,
    teacher: 'Malya Rao',
  }
}

function item(
  sessionId: string,
  correct: boolean,
  extra: Partial<ProgressItem> = {},
): ProgressItem {
  return {
    session_id: sessionId,
    question_id: `${sessionId}-${Math.random()}`,
    section: S,
    skill: K,
    difficulty: 'medium',
    status: 'answered',
    is_correct: correct,
    timed_out: false,
    elapsed_seconds: 40,
    time_limit_seconds: 60,
    target_seconds: 60,
    ...extra,
  }
}

function test(id: string, setCount = 5, skill: string | null = K): ProgressTargeted {
  return {
    session_id: id,
    section: S,
    skill,
    set_size: 5,
    set_count: setCount,
    question_seconds: 60,
    overall_seconds: 600,
  }
}

function progress(over: Partial<StudentProgress>): StudentProgress {
  return {
    sessions: [],
    targeted: [],
    items: [],
    config: defaultConfig('english'),
    summaries: [],
    overrides: [],
    ...over,
  }
}

describe('progressLine', () => {
  const p = progress({
    sessions: [
      session('diag', 'diagnostic', 1),
      session('l1', 'live', 3),
      session('l2', 'live', 5),
      session('t1', 'targeted', 7),
      session('l3', 'live', 9),
      session('t2', 'targeted', 11),
      session('l4', 'live', 13),
      session('l5', 'live', 14, 'scheduled'),
    ],
    targeted: [test('t1'), test('t2')],
    items: [
      item('diag', false),
      item('diag', true),
      item('diag', false, { skill: 'rhetorical_synthesis' }),
      ...[true, false, false, false, false].map((c) => item('t1', c)),
      ...[true, true, true, false].map((c) => item('t2', c)),
      item('t2', false, { timed_out: true }),
    ],
  })
  const line = progressLine(p, S, K)

  it('starts at the diagnostic, on that skill’s answers only', () => {
    expect(line.points[0]).toMatchObject({
      kind: 'diagnostic',
      isBaseline: true,
      correct: 1,
      reached: 2,
      raw: 5,
      level: 30,
    })
  })

  it('plots each test, counting the sessions between, any teacher, completed only', () => {
    expect(line.points.map((x) => x.sessionId)).toEqual(['diag', 't1', 't2'])
    expect(line.points[1].sessionsBefore).toBe(2)
    expect(line.points[2].sessionsBefore).toBe(1)
  })

  it('names each step, with its caveat from the smaller point', () => {
    // diag 5/10 → 30; t1 2/10 → 24: −6, declined.
    expect(line.points[1].step).toMatchObject({ verdict: 'declined' })
    expect(line.points[1].step?.delta).toBeCloseTo(-6)
    expect(line.points[1].step?.caveat).toBe(
      'On 2 questions, one question is worth about 13 points.',
    )
    // t1 2/10 → 24; t2 6/10 → 33.3: +9.3, improved.
    expect(line.points[2].step?.verdict).toBe('improved')
    expect(line.points[2].timedOut).toBe(1)
  })

  it('reads as sentences for the PDF, raw beside mapped', () => {
    const text = describeLine(line)
    expect(text[0]).toBe('1 Oct 2026, 10:00 UTC — Baseline, diagnostic: 1 of 2 right, 5.0/10 → 30.')
    expect(text[1]).toBe('7 Oct 2026, 10:00 UTC — targeted test: 1 of 5 right, 2.0/10 → 24.')
    expect(text[2]).toMatch(/^ {3}Declined \(-6\)\. Flagged for review\./)
    expect(text[text.length - 1]).toBe('1 session since the last test on this skill.')
  })

  it('says how many sessions since the last test', () => {
    expect(line.sinceLast).toBe(1)
    expect(line.hint).toBe('1 session since the last test on this skill')
    expect(sessionsSinceLastTest(p, S, K)).toBe(1)
  })

  it('takes the first test as the baseline when there is no diagnostic on the skill', () => {
    const noDiag = { ...p, items: p.items.filter((i) => i.session_id !== 'diag') }
    const l = progressLine(noDiag, S, K)
    expect(l.points[0]).toMatchObject({
      sessionId: 't1',
      kind: 'test',
      isBaseline: true,
      step: null,
    })
    // diag and l1, l2 are before the baseline: nothing is counted before it.
    expect(l.points[1].sessionsBefore).toBe(1)
  })

  it('counts the set’s questions never reached', () => {
    const short = progress({ ...p, targeted: [test('t1', 7), test('t2')] })
    expect(progressLine(short, S, K).points[1].notReached).toBe(2)
  })

  it('shows a shared override, and marks it out of date when the earlier point changed', () => {
    const withOverride = progress({
      ...p,
      overrides: [
        {
          session_id: 't2',
          previous_session_id: 't1',
          shared_wording: 'Steady.',
          shared_context: null,
          shared_at: '2026-10-12T00:00:00Z',
        },
        {
          session_id: 't1',
          previous_session_id: null,
          shared_wording: 'Old pair.',
          shared_context: null,
          shared_at: '2026-10-08T00:00:00Z',
        },
      ],
    })
    const l = progressLine(withOverride, S, K)
    expect(l.points[2].override?.stale).toBe(false)
    expect(l.points[1].override?.stale).toBe(true)
  })

  it('leaves a test that is not completed off the line', () => {
    const open = progress({
      ...p,
      sessions: p.sessions.map((s) => (s.id === 't2' ? { ...s, status: 'live' as const } : s)),
    })
    expect(progressLine(open, S, K).points.map((x) => x.sessionId)).toEqual(['diag', 't1'])
  })
})

describe('progressLines', () => {
  it('is one line per skill with a completed test, the newest first', () => {
    const p = progress({
      sessions: [session('t1', 'targeted', 2), session('t2', 'targeted', 4)],
      targeted: [test('t1'), test('t2', 5, null)],
      items: [item('t1', true), item('t2', false)],
    })
    expect(progressLines(p).map((l) => l.skill)).toEqual([null, K])
  })
})

describe('parsePoints and formatPoints', () => {
  it('reads pairs, raw rising from 0 to 10', () => {
    expect(parsePoints('0 20, 5 30, 8 40')).toEqual(POINTS)
    expect(formatPoints(POINTS)).toBe('0 20, 5 30, 8 40')
  })

  it('refuses one point, a falling raw score, or anything not a pair', () => {
    expect(parsePoints('0 20')).toBeNull()
    expect(parsePoints('5 30, 2 25')).toBeNull()
    expect(parsePoints('0 20, 11 50')).toBeNull()
    expect(parsePoints('0 20, 5')).toBeNull()
  })
})

describe('settingsProblem', () => {
  const ok = defaultConfig('english')

  it('passes the defaults', () => {
    expect(settingsProblem(ok)).toBeNull()
  })

  it('takes the points in any order', () => {
    expect(
      settingsProblem({
        ...ok,
        score_points: [
          [8, 40],
          [0, 20],
          [5, 30],
        ],
      }),
    ).toBeNull()
  })

  it('names what is wrong with the points', () => {
    expect(settingsProblem({ ...ok, score_points: [[0, 20]] })).toMatch(/two points/)
    expect(
      settingsProblem({
        ...ok,
        score_points: [
          [0, 20],
          [5, NaN],
        ],
      }),
    ).toMatch(/both numbers/)
    expect(
      settingsProblem({
        ...ok,
        score_points: [
          [0, 20],
          [11, 50],
        ],
      }),
    ).toMatch(/0 to 10/)
    expect(
      settingsProblem({
        ...ok,
        score_points: [
          [0, 20],
          [5, 30],
          [5, 35],
        ],
      }),
    ).toMatch(/both for 5 out of 10/)
    expect(
      settingsProblem({
        ...ok,
        score_points: [
          [0, 30],
          [5, 20],
        ],
      }),
    ).toMatch(/rise/)
  })

  it('refuses what the table would', () => {
    expect(settingsProblem({ ...ok, improved_at: 0 })).toMatch(/Improved/)
    expect(settingsProblem({ ...ok, declined_at: 0 })).toMatch(/Declined/)
    expect(settingsProblem({ ...ok, long_words: 0 })).toMatch(/long question/)
    expect(settingsProblem({ ...ok, default_set_size: 21 })).toMatch(/1 to 20/)
    expect(settingsProblem({ ...ok, pattern_min_each: 0 })).toMatch(/each kind/)
    expect(settingsProblem({ ...ok, pattern_gap: 0 })).toMatch(/percentage points/)
    expect(settingsProblem({ ...ok, pattern_gap: 1 })).toBeNull()
  })
})
