import { describe, expect, it } from 'vitest'
import {
  cleanPin,
  percentRight,
  signInMessage,
  splitTests,
  standingOf,
  storeStudentKey,
  storedStudentKey,
  studentStats,
  type StudentTest,
} from './studentAccount'

const NOW = Date.parse('2026-11-07T10:00:00Z')

function test(over: Partial<StudentTest>): StudentTest {
  return {
    id: 'x',
    title: null,
    subject: 'english',
    mode: 'targeted',
    status: 'scheduled',
    scheduled_at: '2026-11-07T12:00:00Z',
    opened_early_at: null,
    link: 'link',
    entry_key: 'key',
    section: 'craft_and_structure',
    skill: 'words_in_context',
    set_size: 10,
    revealed: 0,
    right: 0,
    ...over,
  }
}

describe('signInMessage', () => {
  it('does not say which half was wrong', () => {
    expect(signInMessage({ ok: false, reason: 'wrong' })).toMatch(/ID and PIN do not match/)
  })

  it('says how long a lock has left', () => {
    const until = new Date(NOW + 14 * 60_000 + 5_000).toISOString()
    expect(signInMessage({ ok: false, reason: 'locked', until }, NOW)).toMatch(/in 15 minutes/)
    const later = new Date(NOW + 90 * 60_000).toISOString()
    expect(signInMessage({ ok: false, reason: 'locked', until: later }, NOW)).toMatch(/in 2 hours/)
  })

  it('sends a closed account to the teacher', () => {
    expect(signInMessage({ ok: false, reason: 'closed' })).toMatch(/Ask your teacher/)
  })
})

describe('cleanPin', () => {
  it('keeps four digits and nothing else', () => {
    expect(cleanPin(' 4 8-2 1 9')).toBe('4821')
    expect(cleanPin('ab12')).toBe('12')
  })
})

describe('standingOf', () => {
  it('a test still to come opens once its time has come, or early when let in', () => {
    expect(standingOf(test({}), NOW).kind).toBe('upcoming')
    expect(standingOf(test({ scheduled_at: '2026-11-07T09:00:00Z' }), NOW).kind).toBe('open')
    expect(standingOf(test({ opened_early_at: '2026-11-07T09:59:00Z' }), NOW).kind).toBe('open')
  })

  it('a running test is live', () => {
    expect(standingOf(test({ status: 'live' }), NOW).kind).toBe('live')
  })

  it('a finished test shows its result only once it is shared', () => {
    expect(standingOf(test({ status: 'completed' }), NOW).kind).toBe('waiting')
    expect(standingOf(test({ status: 'completed', mode: 'diagnostic', revealed: 10, right: 6 }), NOW)).toEqual({
      kind: 'results',
      right: 6,
      of: 10,
      answers: true,
    })
  })

  it('a finished targeted test shows its score at once, its answers once shared', () => {
    expect(standingOf(test({ status: 'completed', score: { right: 7, reached: 9 } }), NOW)).toEqual({
      kind: 'results',
      right: 7,
      of: 9,
      answers: false,
    })
    expect(
      standingOf(test({ status: 'completed', score: { right: 7, reached: 9 }, revealed: 9, right: 7 }), NOW),
    ).toMatchObject({ kind: 'results', answers: true })
    expect(standingOf(test({ status: 'completed', score: { right: 0, reached: 0 } }), NOW).kind).toBe('waiting')
  })
})

describe('splitTests', () => {
  it('puts what is ahead first, soonest first, and what is done after, newest first', () => {
    const { ahead, done } = splitTests([
      test({ id: 'later', scheduled_at: '2026-11-09T10:00:00Z' }),
      test({ id: 'old', status: 'completed', scheduled_at: '2026-10-01T10:00:00Z' }),
      test({ id: 'soon', status: 'live', scheduled_at: '2026-11-07T09:00:00Z' }),
      test({ id: 'recent', status: 'completed', scheduled_at: '2026-11-01T10:00:00Z' }),
    ])
    expect(ahead.map((t) => t.id)).toEqual(['soon', 'later'])
    expect(done.map((t) => t.id)).toEqual(['recent', 'old'])
  })
})

describe('the key on the device', () => {
  it('is kept, read and forgotten', () => {
    const data = new Map<string, string>()
    const store = {
      getItem: (k: string) => data.get(k) ?? null,
      setItem: (k: string, v: string) => void data.set(k, v),
      removeItem: (k: string) => void data.delete(k),
    }
    storeStudentKey('abc', store)
    expect(storedStudentKey(store)).toBe('abc')
    storeStudentKey(null, store)
    expect(storedStudentKey(store)).toBeNull()
  })

  it('is simply absent without storage', () => {
    storeStudentKey('abc', null)
    expect(storedStudentKey(null)).toBeNull()
  })
})

describe('the student page at a glance', () => {
  const base = {
    subject: 'english' as const,
    mode: 'targeted' as const,
    link: 'l',
    entry_key: 'k',
    section: null,
    skill: null,
    set_size: 12,
    title: null,
    opened_early_at: null,
    revealed: 0,
    right: 0,
  }
  const at = (iso: string) => new Date(iso).getTime()
  const now = at('2026-11-10T12:00:00Z')

  it('counts what is finished and what is still to sit', () => {
    const stats = studentStats(
      [
        { ...base, id: '1', status: 'completed', scheduled_at: '2026-11-01T10:00:00Z', score: { right: 9, reached: 12 } },
        { ...base, id: '2', status: 'completed', scheduled_at: '2026-11-05T10:00:00Z', score: { right: 6, reached: 12 } },
        { ...base, id: '3', status: 'scheduled', scheduled_at: '2026-11-20T10:00:00Z', score: null },
      ],
      now,
    )
    expect(stats.completed).toBe(2)
    expect(stats.ahead).toBe(1)
    expect(stats.marked).toEqual({ right: 15, of: 24 })
    expect(percentRight(stats.marked)).toBe(63)
  })

  it('leaves a test nobody has been given back out of the proportion', () => {
    const stats = studentStats(
      [
        { ...base, id: '1', status: 'completed', scheduled_at: '2026-11-01T10:00:00Z', score: { right: 9, reached: 12 } },
        // Finished, but the teacher has published neither score nor answers.
        { ...base, id: '2', status: 'completed', scheduled_at: '2026-11-06T10:00:00Z', score: null, revealed: 0 },
      ],
      now,
    )
    expect(stats.completed).toBe(2)
    expect(stats.marked).toEqual({ right: 9, of: 12 })
  })

  it('has no proportion to show before anything is marked', () => {
    const stats = studentStats([{ ...base, id: '1', status: 'scheduled', scheduled_at: '2026-11-20T10:00:00Z', score: null }], now)
    expect(stats).toEqual({ completed: 0, ahead: 1, marked: null })
  })
})
