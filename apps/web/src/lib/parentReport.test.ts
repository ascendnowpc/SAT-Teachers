import { describe, expect, it } from 'vitest'
import { buildParentReport, headline, ragFor, sessionsOver, type ReportSubject } from './parentReport'

const item = (session_id: string, skill: string, right: boolean, section = 'expression_of_ideas') => ({
  session_id,
  section,
  skill,
  status: 'answered' as const,
  is_correct: right,
  timed_out: false,
})

/**
 * A diagnostic on 1 Oct with 1 of 3 on Transitions and 2 of 2 on Words in
 * Context; two lessons; a targeted test on Transitions (2 of 5); one more
 * lesson; a second (4 of 5).
 */
const english: ReportSubject = {
  sessions: [
    { id: 'diag', mode: 'diagnostic', status: 'completed', at: '2026-10-01T10:00:00Z' },
    { id: 'l1', mode: 'diagnostic', status: 'completed', at: '2026-10-05T10:00:00Z' },
    { id: 'l2', mode: 'diagnostic', status: 'completed', at: '2026-10-08T10:00:00Z' },
    { id: 't1', mode: 'targeted', status: 'completed', at: '2026-10-10T10:00:00Z' },
    { id: 'l3', mode: 'diagnostic', status: 'completed', at: '2026-10-15T10:00:00Z' },
    { id: 't2', mode: 'targeted', status: 'completed', at: '2026-10-20T10:00:00Z' },
  ],
  targeted: [
    { session_id: 't1', section: 'expression_of_ideas', skill: 'transitions', set_size: 5, set_count: 5 },
    { session_id: 't2', section: 'expression_of_ideas', skill: 'transitions', set_size: 5, set_count: 5 },
  ],
  items: [
    item('diag', 'transitions', true),
    item('diag', 'transitions', false),
    item('diag', 'transitions', false),
    item('diag', 'words_in_context', true, 'craft_and_structure'),
    item('diag', 'words_in_context', true, 'craft_and_structure'),
    ...[true, true, false, false, false].map((r) => item('t1', 'transitions', r)),
    ...[true, true, true, true, false].map((r) => item('t2', 'transitions', r)),
  ],
  config: null,
}

describe('ragFor', () => {
  it('is green from 70%, amber from 40%, red below', () => {
    expect(ragFor(7, 10)).toBe('green')
    expect(ragFor(4, 10)).toBe('amber')
    expect(ragFor(6, 10)).toBe('amber')
    expect(ragFor(3, 10)).toBe('red')
  })

  it('is nothing with nothing asked', () => {
    expect(ragFor(0, 0)).toBeNull()
  })
})

describe('the parent report', () => {
  const r = buildParentReport('english', english)

  it('leads with the line that moved, first score to latest, over the sessions between', () => {
    expect(r.headline).toEqual({ skill: 'Transitions', scores: '1/3 → 4/5', over: 'over 5 sessions' })
  })

  it('counts every lesson and test after the first point', () => {
    // l1, l2, t1, then l3, t2.
    expect(sessionsOver(r.lines[0])).toBe(5)
  })

  it('colours each skill by the latest session that asked it', () => {
    const cells = r.map.flatMap((s) => s.skills)
    const transitions = cells.find((c) => c.skill === 'transitions')
    expect(transitions?.latest).toMatchObject({ right: 4, of: 5 })
    expect(transitions?.rag).toBe('green')
    const wic = cells.find((c) => c.skill === 'words_in_context')
    expect(wic?.latest).toMatchObject({ right: 2, of: 2 })
  })

  it('shows every skill of the subject, untested ones with nothing', () => {
    const cells = r.map.flatMap((s) => s.skills)
    expect(cells.length).toBeGreaterThan(10)
    expect(cells.find((c) => c.skill === 'inferences')).toMatchObject({ latest: null, rag: null })
  })

  it('says so when a skill has only one score', () => {
    const one = buildParentReport('english', {
      ...english,
      sessions: english.sessions.filter((s) => s.id !== 't2'),
      targeted: english.targeted.filter((t) => t.session_id !== 't2'),
      items: english.items.filter((i) => i.session_id === 't1'),
    })
    expect(one.headline).toEqual({ skill: 'Transitions', scores: '2/5', over: 'on the first test' })
  })

  it('has no headline with no targeted test', () => {
    expect(headline([])).toBeNull()
  })
})
