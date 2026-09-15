import { describe, expect, it } from 'vitest'
import {
  backlog,
  filterPeople,
  isOutstanding,
  isSuspended,
  pendingTeachers,
  rate,
  reportStage,
  schoolTally,
  stagesBySession,
  studentRows,
  teacherRows,
} from './admin'
import type { Profile, Session, SessionReportRow, SessionStatus } from './types'

function profile(id: string, role: Profile['role'], extra: Partial<Profile> = {}): Profile {
  return {
    id,
    role,
    display_id: `${role === 'student' ? 'STU' : 'TCH'}-${id}`,
    full_name: id.toUpperCase(),
    email: `${id}@example.test`,
    pc: null,
    is_active: true,
    suspended_at: null,
    created_at: '2026-01-01T00:00:00Z',
    ...extra,
  }
}

function session(
  id: string,
  teacher: string,
  student: string,
  scheduled: string,
  status: SessionStatus = 'completed',
  extra: Partial<Session> = {},
): Session {
  return {
    id,
    teacher_id: teacher,
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
    question_count: 20,
    answered_count: 0,
    started_at: null,
    ended_at: null,
    teacher_notes: null,
    created_at: scheduled,
    teacher: { id: teacher, full_name: teacher.toUpperCase(), display_id: `TCH-${teacher}` },
    student: { id: student, full_name: student.toUpperCase(), display_id: `STU-${student}` },
    ...extra,
  }
}

function report(sessionId: string, extra: Partial<SessionReportRow> = {}): SessionReportRow {
  return {
    session_id: sessionId,
    status: 'draft',
    time_management: null,
    engagement: null,
    practice_priority: null,
    summary: null,
    teacher_reflection: null,
    form_submitted_at: null,
    generated_at: null,
    published_at: null,
    ...extra,
  }
}

const NOW = new Date('2026-06-15T12:00:00Z').getTime()

describe('reportStage', () => {
  it('is none when no row was ever written', () => {
    expect(reportStage(null)).toBe('none')
  })

  it('is form as soon as a row exists, because something was saved into it', () => {
    expect(reportStage(report('s1'))).toBe('form')
  })

  it('moves forward through the write-up in the order the teachers take it', () => {
    expect(reportStage(report('s1', { form_submitted_at: '2026-06-01T00:00:00Z' }))).toBe(
      'submitted',
    )
    expect(
      reportStage(
        report('s1', {
          form_submitted_at: '2026-06-01T00:00:00Z',
          generated_at: '2026-06-02T00:00:00Z',
        }),
      ),
    ).toBe('generated')
  })

  it('reads published from the status, and from the timestamp on its own', () => {
    expect(reportStage(report('s1', { status: 'published' }))).toBe('published')
    expect(reportStage(report('s1', { published_at: '2026-06-03T00:00:00Z' }))).toBe('published')
  })
})

describe('isOutstanding', () => {
  it('is a finished session whose report is not out', () => {
    expect(isOutstanding('completed', 'submitted')).toBe(true)
    expect(isOutstanding('completed', 'published')).toBe(false)
  })

  it('does not chase a session that has not happened', () => {
    expect(isOutstanding('scheduled', 'none')).toBe(false)
    expect(isOutstanding('cancelled', 'none')).toBe(false)
  })
})

describe('teacherRows', () => {
  const profiles = [
    profile('t1', 'teacher'),
    profile('t2', 'teacher'),
    profile('a1', 'admin'),
    profile('s1', 'student'),
  ]
  const sessions = [
    session('x1', 't1', 's1', '2026-06-01T09:00:00Z', 'completed', { answered_count: 20 }),
    session('x2', 't1', 's2', '2026-06-20T09:00:00Z', 'scheduled'),
    session('x3', 't2', 's1', '2026-06-10T09:00:00Z', 'live', { answered_count: 4 }),
  ]
  const stages = stagesBySession([report('x1', { status: 'published' })])

  it('counts each teacher against their own sessions only', () => {
    const rows = teacherRows(profiles, sessions, stages, NOW)
    const t1 = rows.find((r) => r.profile.id === 't1')!
    expect(t1.tally.total).toBe(2)
    expect(t1.tally.completed).toBe(1)
    expect(t1.tally.scheduled).toBe(1)
    expect(t1.tally.answered).toBe(20)
    expect(t1.tally.published).toBe(1)
  })

  it('keeps a teacher who has never run a session', () => {
    const rows = teacherRows(profiles, [], stages, NOW)
    expect(rows).toHaveLength(3)
    expect(rows.every((r) => r.tally.total === 0)).toBe(true)
  })

  it('lists each student once, however many sessions they have had', () => {
    const twice = [...sessions, session('x4', 't1', 's1', '2026-05-01T09:00:00Z')]
    const t1 = teacherRows(profiles, twice, stages, NOW).find((r) => r.profile.id === 't1')!
    expect(t1.counterparts.map((c) => c.id).sort()).toEqual(['s1', 's2'])
  })

  it('reads the last session from the whole history and the next from what is still ahead', () => {
    const t1 = teacherRows(profiles, sessions, stages, NOW).find((r) => r.profile.id === 't1')!
    expect(t1.lastAt).toBe('2026-06-20T09:00:00Z')
    expect(t1.nextAt).toBe('2026-06-20T09:00:00Z')

    const t2 = teacherRows(profiles, sessions, stages, NOW).find((r) => r.profile.id === 't2')!
    // Live, and its scheduled time has passed — it is not a booking any more.
    expect(t2.nextAt).toBeNull()
  })

  it('puts the busiest first and breaks a tie by name', () => {
    const rows = teacherRows(profiles, sessions, stages, NOW)
    expect(rows.map((r) => r.profile.id)).toEqual(['t1', 't2', 'a1'])
  })

  it('lists an admin, who may run sessions too, and never lists a student', () => {
    const rows = teacherRows(profiles, sessions, stages, NOW)
    expect(rows.some((r) => r.profile.id === 'a1')).toBe(true)
    expect(rows.some((r) => r.profile.id === 's1')).toBe(false)
  })
})

describe('studentRows', () => {
  const profiles = [profile('s1', 'student', { pc: 'PC-9' }), profile('s2', 'student'), profile('t1', 'teacher')]
  const sessions = [
    session('x1', 't1', 's1', '2026-06-01T09:00:00Z'),
    session('x2', 't2', 's1', '2026-06-05T09:00:00Z'),
  ]

  it('lists every teacher a student has sat with', () => {
    const s1 = studentRows(profiles, sessions, new Map(), NOW).find((r) => r.profile.id === 's1')!
    expect(s1.counterparts.map((c) => c.id)).toEqual(['t1', 't2'])
    expect(s1.tally.total).toBe(2)
  })

  it('keeps a roster student who has never been booked', () => {
    const s2 = studentRows(profiles, sessions, new Map(), NOW).find((r) => r.profile.id === 's2')!
    expect(s2.tally.total).toBe(0)
    expect(s2.lastAt).toBeNull()
  })
})

describe('schoolTally', () => {
  it('counts every session once and every outstanding write-up with it', () => {
    const sessions = [
      session('x1', 't1', 's1', '2026-06-01T09:00:00Z', 'completed', { answered_count: 20 }),
      session('x2', 't1', 's2', '2026-06-02T09:00:00Z', 'completed', { answered_count: 7 }),
      session('x3', 't2', 's1', '2026-06-20T09:00:00Z', 'scheduled'),
    ]
    const stages = stagesBySession([report('x1', { status: 'published' }), report('x2')])
    const tally = schoolTally(sessions, stages)

    expect(tally.total).toBe(3)
    expect(tally.completed).toBe(2)
    expect(tally.answered).toBe(27)
    expect(tally.published).toBe(1)
    expect(tally.outstanding).toBe(1)
  })
})

describe('backlog', () => {
  it('is the unfinished write-ups, oldest first', () => {
    const sessions = [
      session('new', 't1', 's1', '2026-06-10T09:00:00Z'),
      session('old', 't1', 's1', '2026-05-01T09:00:00Z'),
      session('done', 't1', 's1', '2026-04-01T09:00:00Z'),
      session('ahead', 't1', 's1', '2026-07-01T09:00:00Z', 'scheduled'),
    ]
    const stages = stagesBySession([report('done', { status: 'published' })])
    expect(backlog(sessions, stages).map((s) => s.id)).toEqual(['old', 'new'])
  })
})

describe('pendingTeachers', () => {
  it('is the inactive teacher accounts, in the order they arrived', () => {
    const profiles = [
      profile('t1', 'teacher'),
      profile('t3', 'teacher', { is_active: false, created_at: '2026-03-01T00:00:00Z' }),
      profile('t2', 'teacher', { is_active: false, created_at: '2026-02-01T00:00:00Z' }),
      profile('s1', 'student', { is_active: false }),
    ]
    expect(pendingTeachers(profiles).map((p) => p.id)).toEqual(['t2', 't3'])
  })

  // Off is two things (0045). Somebody an admin removed is not somebody
  // waiting to be let in, and the queue must not ask them to undo it daily.
  it('leaves out a teacher an admin suspended', () => {
    const profiles = [
      profile('t2', 'teacher', { is_active: false, created_at: '2026-02-01T00:00:00Z' }),
      profile('t4', 'teacher', {
        is_active: false,
        suspended_at: '2026-04-01T00:00:00Z',
        created_at: '2026-01-01T00:00:00Z',
      }),
    ]
    expect(pendingTeachers(profiles).map((p) => p.id)).toEqual(['t2'])
  })
})

describe('isSuspended', () => {
  it('tells a removed account from one that was never approved', () => {
    expect(isSuspended(profile('t1', 'teacher'))).toBe(false)
    expect(isSuspended(profile('t2', 'teacher', { is_active: false }))).toBe(false)
    expect(
      isSuspended(profile('t3', 'teacher', { is_active: false, suspended_at: '2026-04-01T00:00:00Z' })),
    ).toBe(true)
  })
})

describe('filterPeople', () => {
  const rows = studentRows(
    [profile('s1', 'student', { pc: 'PC-9', full_name: 'Amara Osei' }), profile('s2', 'student')],
    [session('x1', 't1', 's1', '2026-06-01T09:00:00Z')],
    new Map(),
    NOW,
  )

  it('matches a name, an id, a PC and the other side of the session', () => {
    expect(filterPeople(rows, 'amara').map((r) => r.profile.id)).toEqual(['s1'])
    expect(filterPeople(rows, 'pc-9').map((r) => r.profile.id)).toEqual(['s1'])
    expect(filterPeople(rows, 'T1').map((r) => r.profile.id)).toEqual(['s1'])
  })

  it('ANDs the words, so two terms narrow rather than widen', () => {
    expect(filterPeople(rows, 'amara pc-9')).toHaveLength(1)
    expect(filterPeople(rows, 'amara pc-4')).toHaveLength(0)
  })

  it('returns everything for an empty query', () => {
    expect(filterPeople(rows, '  ')).toHaveLength(2)
  })
})

describe('rate', () => {
  it('is null rather than 0 when there is nothing to take a percentage of', () => {
    expect(rate(0, 0)).toBeNull()
    expect(rate(1, 4)).toBe(25)
  })
})
