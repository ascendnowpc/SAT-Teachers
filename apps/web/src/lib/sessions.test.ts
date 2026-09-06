import { describe, expect, it } from 'vitest'
import { groupByStudent } from './sessions'
import type { Session, SessionStatus } from './types'

function session(
  id: string,
  student: string,
  scheduled: string,
  status: SessionStatus = 'completed',
  name = student.toUpperCase(),
): Session {
  return {
    id,
    teacher_id: 't1',
    student_id: student,
    subject: 'english',
    title: null,
    scheduled_at: scheduled,
    duration_mins: 60,
    meeting_url: null,
    status,
    level: 'easy',
    level_size: 20,
    opened_early_at: null,
    question_count: 0,
    started_at: null,
    ended_at: null,
    teacher_notes: null,
    created_at: scheduled,
    student: { id: student, full_name: name, display_id: `STU-${student}` },
  }
}

describe('groupByStudent', () => {
  it('puts every session with a student under that student', () => {
    const groups = groupByStudent([
      session('a', 's1', '2026-03-01T10:00:00Z'),
      session('b', 's2', '2026-03-02T10:00:00Z'),
      session('c', 's1', '2026-03-03T10:00:00Z'),
    ])
    expect(groups).toHaveLength(2)
    expect(groups.map((g) => g.key).sort()).toEqual(['s1', 's2'])
    const s1 = groups.find((g) => g.key === 's1')!
    expect(s1.past.map((s) => s.id)).toEqual(['c', 'a'])
    expect(s1.name).toBe('S1')
    expect(s1.displayId).toBe('STU-s1')
  })

  it('splits a student’s sessions into what is coming and what has been', () => {
    const groups = groupByStudent([
      session('done', 's1', '2026-03-01T10:00:00Z', 'completed'),
      session('live', 's1', '2026-03-05T10:00:00Z', 'live'),
      session('next', 's1', '2026-03-09T10:00:00Z', 'scheduled'),
      session('gone', 's1', '2026-02-01T10:00:00Z', 'cancelled'),
    ])
    expect(groups[0].upcoming.map((s) => s.id)).toEqual(['live', 'next'])
    expect(groups[0].past.map((s) => s.id)).toEqual(['done', 'gone'])
  })

  it('leads with the student who is seen soonest', () => {
    const groups = groupByStudent([
      session('later', 's1', '2026-04-10T10:00:00Z', 'scheduled'),
      session('sooner', 's2', '2026-04-02T10:00:00Z', 'scheduled'),
    ])
    expect(groups.map((g) => g.key)).toEqual(['s2', 's1'])
  })

  // A student with nothing booked is still worth reaching, but not before the
  // one whose lesson is this afternoon.
  it('puts students with nothing booked after those who have something', () => {
    const groups = groupByStudent([
      session('old', 's1', '2026-03-01T10:00:00Z', 'completed'),
      session('soon', 's2', '2026-09-01T10:00:00Z', 'scheduled'),
    ])
    expect(groups.map((g) => g.key)).toEqual(['s2', 's1'])
  })

  it('orders students with nothing booked by their most recent session', () => {
    const groups = groupByStudent([
      session('stale', 's1', '2026-01-01T10:00:00Z', 'completed'),
      session('recent', 's2', '2026-03-01T10:00:00Z', 'completed'),
    ])
    expect(groups.map((g) => g.key)).toEqual(['s2', 's1'])
  })

  it('breaks a tie on the name so the order does not wander between loads', () => {
    const groups = groupByStudent([
      session('b', 's2', '2026-03-01T10:00:00Z', 'scheduled', 'Bea'),
      session('a', 's1', '2026-03-01T10:00:00Z', 'scheduled', 'Ada'),
    ])
    expect(groups.map((g) => g.name)).toEqual(['Ada', 'Bea'])
  })

  // RLS can withhold the embedded profile; the foreign key is always there, so
  // two sessions with one student must not become two groups.
  it('groups on the foreign key when the profile did not come back', () => {
    const a = { ...session('a', 's1', '2026-03-01T10:00:00Z'), student: null }
    const b = { ...session('b', 's1', '2026-03-02T10:00:00Z'), student: null }
    const groups = groupByStudent([a, b])
    expect(groups).toHaveLength(1)
    expect(groups[0].key).toBe('s1')
    expect(groups[0].name).toBe('Student')
    expect(groups[0].displayId).toBeNull()
  })

  it('gives nothing back for no sessions', () => {
    expect(groupByStudent([])).toEqual([])
  })
})
