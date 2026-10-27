import { describe, expect, it } from 'vitest'
import {
  defaultConfig,
  type ProgressItem,
  type ProgressSession,
  type StudentProgress,
} from './progress'
import { parseSummary, summaryFacts, summaryPrompt, SUMMARY_SCHEMA } from './targetedSummary'

const S = 'craft_and_structure'
const K = 'cross_text_connections'

const session = (id: string, mode: ProgressSession['mode'], day: number): ProgressSession => ({
  id,
  mode,
  status: 'completed',
  at: `2026-10-${String(day).padStart(2, '0')}T10:00:00Z`,
  teacher: 'Malya Rao',
})

let n = 0
const item = (
  sessionId: string,
  correct: boolean,
  extra: Partial<ProgressItem> = {},
): ProgressItem => ({
  session_id: sessionId,
  question_id: `q${(n += 1)}`,
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
})

const target = (id: string, setCount: number) => ({
  session_id: id,
  section: S,
  skill: K,
  set_size: setCount,
  set_count: setCount,
  question_seconds: 60,
  overall_seconds: 600,
})

// A diagnostic with 2 of 4 on the skill, then a test of 5 with 4 right — one
// of the wrong ones rushed — and one more lesson after it.
const p: StudentProgress = {
  sessions: [session('d', 'diagnostic', 1), session('t1', 'targeted', 8), session('l', 'live', 10)],
  targeted: [target('t1', 5)],
  items: [
    item('d', true),
    item('d', true),
    item('d', false),
    item('d', false),
    item('t1', true, { difficulty: 'easy' }),
    item('t1', true, { difficulty: 'easy' }),
    item('t1', true),
    item('t1', true, { difficulty: 'hard' }),
    item('t1', false, { difficulty: 'hard', elapsed_seconds: 10 }),
  ],
  config: defaultConfig('english'),
  summaries: [],
  overrides: [],
}

describe('summaryFacts', () => {
  const facts = summaryFacts(p, new Map(), 'Amara Okonkwo', 'english')

  it('reads every skill’s line from the baseline, with the numbers the report shows', () => {
    expect(facts.tests).toBe(1)
    expect(facts.skills).toHaveLength(1)
    const [skill] = facts.skills
    expect(skill.skill).toBe('Cross-Text Connections (Craft and Structure)')
    expect(skill.points.map((x) => [x.what, x.right, x.out_of_10, x.level_score])).toEqual([
      ['baseline diagnostic', '2 of 4', 5, 30],
      ['targeted test', '4 of 5', 8, 40],
    ])
    expect(skill.points[1].change).toBe('Improved (+10)')
    expect(skill.sessions_since_last).toBe(1)
  })

  it('carries a test’s own reading, and none for the diagnostic', () => {
    const [d, t] = facts.skills[0].points
    expect(d.detail).toBeNull()
    expect(t.detail).toEqual({
      by_level: { easy: '2 of 2', medium: '1 of 1', hard: '1 of 2' },
      rushed: 1,
      gap_in_method: 0,
      hesitated: 0,
      long_vs_short: null,
    })
  })

  it('says how it is scored, from the admin’s settings', () => {
    expect(facts.scale).toContain('0→20, 5→30, 8→40')
    expect(facts.scale).toContain('On a 5-question test one question is worth about 5 level points')
    expect(facts.thresholds).toContain('rise of 5 or more')
    expect(facts.thresholds).toContain('fall of 5 or more')
  })

  it('names the student and subject in the prompt, and nothing else besides the facts', () => {
    const prompt = summaryPrompt(facts)
    expect(prompt).toContain('English')
    expect(prompt).toContain('"student": "Amara Okonkwo"')
  })

  it('has nothing to say with no tests', () => {
    const none = summaryFacts(
      { ...p, targeted: [], sessions: [session('d', 'diagnostic', 1)] },
      new Map(),
      'A',
      'english',
    )
    expect(none.tests).toBe(0)
    expect(none.skills).toEqual([])
  })
})

describe('parseSummary', () => {
  it('keeps the shape and at most four points', () => {
    const s = parseSummary({
      headline: '  Up on Cross-Text Connections.  ',
      points: Array.from({ length: 6 }, (_, i) => ({ skill: 'Cross-Text', text: `Point ${i}` })),
      next_step: 'Slow down on hard ones.',
    })
    expect(s.headline).toBe('Up on Cross-Text Connections.')
    expect(s.points).toHaveLength(4)
    expect(s.next_step).toBe('Slow down on hard ones.')
  })

  it('drops empty points and refuses an empty answer', () => {
    expect(parseSummary({ headline: 'H', points: [{ skill: 'x', text: '' }] }).points).toEqual([])
    expect(() => parseSummary({})).toThrow(/empty/)
  })

  it('asks for no more than four points', () => {
    expect(SUMMARY_SCHEMA.properties.points.maxItems).toBe(4)
  })
})
