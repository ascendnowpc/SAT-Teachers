import { describe, expect, it } from 'vitest'
import { readingIsStale, whoDid } from './recording'

describe('readingIsStale', () => {
  const reading = { created_at: '2026-09-27T10:00:00Z' }

  it('is not stale when there is nothing to compare', () => {
    expect(readingIsStale(null, { created_at: '2026-09-27T11:00:00Z' })).toBe(false)
    expect(readingIsStale(reading, null)).toBe(false)
  })

  it('is stale when the transcript changed after the reading', () => {
    expect(readingIsStale(reading, { created_at: '2026-09-27T10:00:01Z' })).toBe(true)
  })

  it('is current when the reading came after the transcript', () => {
    expect(readingIsStale(reading, { created_at: '2026-09-27T09:59:59Z' })).toBe(false)
    expect(readingIsStale(reading, { created_at: '2026-09-27T10:00:00Z' })).toBe(false)
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
