import { describe, expect, it } from 'vitest'
import { readingIsStale, readingStaleness, whoDid } from './recording'

describe('readingIsStale', () => {
  const reading = { created_at: '2026-09-27T10:00:00Z' }

  it('is not stale when there is nothing to compare', () => {
    expect(readingIsStale(null, { created_at: '2026-09-27T11:00:00Z' })).toBe(false)
    expect(readingIsStale(null, null, '2026-09-27T11:00:00Z')).toBe(false)
    expect(readingIsStale(reading, null)).toBe(false)
  })

  it('is stale when the transcript changed after the reading', () => {
    expect(readingIsStale(reading, { created_at: '2026-09-27T10:00:01Z' })).toBe(true)
  })

  it('is current when the reading came after the transcript', () => {
    expect(readingIsStale(reading, { created_at: '2026-09-27T09:59:59Z' })).toBe(false)
    expect(readingIsStale(reading, { created_at: '2026-09-27T10:00:00Z' })).toBe(false)
  })

  // The reading files its evidence against what the form says, so a form handed
  // in again after it is a form the reading never saw (0051).
  it('is stale when the form was handed in again after the reading', () => {
    const transcript = { created_at: '2026-09-27T09:00:00Z' }
    expect(readingIsStale(reading, transcript, '2026-09-27T10:05:00Z')).toBe(true)
    expect(readingStaleness(reading, transcript, '2026-09-27T10:05:00Z')).toBe('form')
  })

  it('is current when the reading came after the form was handed in', () => {
    const transcript = { created_at: '2026-09-27T09:00:00Z' }
    expect(readingIsStale(reading, transcript, '2026-09-27T09:30:00Z')).toBe(false)
    expect(readingIsStale(reading, transcript, null)).toBe(false)
  })

  // Postgres writes microseconds and JavaScript reads milliseconds; the two
  // timestamps these compare are always seconds apart, never microseconds.
  it('reads the timestamps Postgres writes', () => {
    const read = { created_at: '2026-09-27T15:27:09.412345+00:00' }
    expect(readingStaleness(read, null, '2026-09-27T15:27:07.223855+00:00')).toBeNull()
    expect(readingStaleness(read, null, '2026-09-27T15:31:02.000001+00:00')).toBe('form')
  })

  it('names the transcript first when both changed', () => {
    expect(
      readingStaleness(reading, { created_at: '2026-09-27T10:01:00Z' }, '2026-09-27T10:02:00Z'),
    ).toBe('transcript')
  })
})

describe('whoDid', () => {
  const known = { me: 'admin-1', teacherId: 'teacher-1', teacherName: 'Malya Rao' }

  it('says you, the teacher by name, or an admin', () => {
    expect(whoDid('admin-1', known)).toBe('you')
    expect(whoDid('teacher-1', known)).toBe('Malya Rao')
    expect(whoDid('admin-2', known)).toBe('an admin')
  })

  // A report generated before 0048 has nobody recorded against it, and saying
  // "an admin" about it would be a guess presented as a fact.
  it('says nothing when the row does not know', () => {
    expect(whoDid(null, known)).toBeNull()
    expect(whoDid(undefined, known)).toBeNull()
  })

  it('falls back to "the teacher" when the name did not load', () => {
    expect(whoDid('teacher-1', { ...known, teacherName: null })).toBe('the teacher')
  })
})
