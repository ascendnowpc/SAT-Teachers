import { describe, expect, it } from 'vitest'
import {
  DEFAULT_SORT,
  NO_FILTERS,
  filterSessions,
  sortSessions,
  studentLink,
  studentOptions,
} from './sessions'
import type { Session, SessionLevel, SessionStatus } from './types'

function session(
  id: string,
  student: string,
  scheduled: string,
  status: SessionStatus = 'completed',
  extra: Partial<Session> & { pc?: string | null } = {},
): Session {
  const { pc = null, ...rest } = extra
  return {
    id,
    teacher_id: 't1',
    student_id: student,
    subject: 'english',
    title: null,
    scheduled_at: scheduled,
    duration_mins: 60,
    meeting_url: null,
    access_token: `tok-${id}`,
    status,
    level: 'easy',
    level_size: 20,
    opened_early_at: null,
    question_count: 0,
    answered_count: 0,
    started_at: null,
    ended_at: null,
    teacher_notes: null,
    created_at: scheduled,
    student: {
      id: student,
      full_name: student.toUpperCase(),
      display_id: `STU-${student}`,
      pc,
    },
    teacher: { id: 't1', full_name: 'Ada Teacher', display_id: 'TCH-0001' },
    ...rest,
  }
}

describe('filterSessions', () => {
  const all = [
    session('a', 's1', '2026-03-01T10:00:00Z', 'completed'),
    session('b', 's2', '2026-03-02T10:00:00Z', 'scheduled', { pc: 'Priya Rao' }),
    session('c', 's1', '2026-03-03T10:00:00Z', 'live', { level: 'hard' as SessionLevel }),
  ]

  it('keeps everything when nothing is asked for', () => {
    expect(filterSessions(all, NO_FILTERS)).toHaveLength(3)
  })

  it('matches a student by name, id or PC', () => {
    expect(filterSessions(all, { ...NO_FILTERS, query: 's1' }).map((s) => s.id)).toEqual(['a', 'c'])
    expect(filterSessions(all, { ...NO_FILTERS, query: 'STU-s2' }).map((s) => s.id)).toEqual(['b'])
    expect(filterSessions(all, { ...NO_FILTERS, query: 'priya' }).map((s) => s.id)).toEqual(['b'])
  })

  it('takes every word in the search, not any of them', () => {
    expect(filterSessions(all, { ...NO_FILTERS, query: 's1 hard' }).map((s) => s.id)).toEqual(['c'])
    expect(filterSessions(all, { ...NO_FILTERS, query: 's1 nowhere' })).toHaveLength(0)
  })

  it('reads "open" as scheduled and live together', () => {
    expect(filterSessions(all, { ...NO_FILTERS, status: 'open' }).map((s) => s.id)).toEqual([
      'b',
      'c',
    ])
    expect(filterSessions(all, { ...NO_FILTERS, status: 'live' }).map((s) => s.id)).toEqual(['c'])
  })

  it('narrows by level and by student', () => {
    expect(filterSessions(all, { ...NO_FILTERS, level: 'hard' }).map((s) => s.id)).toEqual(['c'])
    expect(filterSessions(all, { ...NO_FILTERS, student: 's1' }).map((s) => s.id)).toEqual([
      'a',
      'c',
    ])
  })

  it('is not case sensitive', () => {
    expect(filterSessions(all, { ...NO_FILTERS, query: 'S1' }).map((s) => s.id)).toEqual(['a', 'c'])
  })
})

describe('sortSessions', () => {
  const all = [
    session('a', 's2', '2026-03-01T10:00:00Z', 'completed'),
    session('b', 's1', '2026-03-03T10:00:00Z', 'scheduled'),
    session('c', 's3', '2026-03-02T10:00:00Z', 'live'),
  ]

  it('opens on the most recent', () => {
    expect(sortSessions(all, DEFAULT_SORT).map((s) => s.id)).toEqual(['b', 'c', 'a'])
  })

  it('turns around', () => {
    expect(sortSessions(all, { key: 'when', dir: 'asc' }).map((s) => s.id)).toEqual(['a', 'c', 'b'])
  })

  it('sorts by student name', () => {
    expect(sortSessions(all, { key: 'student', dir: 'asc' }).map((s) => s.id)).toEqual([
      'b',
      'a',
      'c',
    ])
  })

  it('puts live above scheduled above completed', () => {
    expect(sortSessions(all, { key: 'status', dir: 'asc' }).map((s) => s.id)).toEqual([
      'c',
      'b',
      'a',
    ])
  })

  it('breaks a tie on the time, so the order is stable', () => {
    const tied = [
      session('x', 's1', '2026-03-01T10:00:00Z', 'completed'),
      session('y', 's1', '2026-03-05T10:00:00Z', 'completed'),
    ]
    expect(sortSessions(tied, { key: 'student', dir: 'asc' }).map((s) => s.id)).toEqual(['y', 'x'])
  })

  it('leaves the list it was given alone', () => {
    const before = all.map((s) => s.id)
    sortSessions(all, { key: 'student', dir: 'asc' })
    expect(all.map((s) => s.id)).toEqual(before)
  })
})

describe('studentOptions', () => {
  it('lists each student once, with how many sessions they hold', () => {
    const opts = studentOptions([
      session('a', 's1', '2026-03-01T10:00:00Z'),
      session('b', 's2', '2026-03-02T10:00:00Z', 'scheduled', { pc: 'Priya Rao' }),
      session('c', 's1', '2026-03-03T10:00:00Z'),
    ])
    expect(opts.map((o) => [o.id, o.count])).toEqual([
      ['s1', 2],
      ['s2', 1],
    ])
    expect(opts[1]!.pc).toBe('Priya Rao')
  })
})

describe('studentLink', () => {
  it('is the token on the /s/ route', () => {
    expect(studentLink('abc123', 'https://app.example')).toBe('https://app.example/s/abc123')
  })
})
