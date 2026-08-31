import { describe, expect, it } from 'vitest'
import {
  defaultUtcSlot,
  formatUtc,
  formatUtcLong,
  isoToUtcInput,
  utcInputToIso,
  utcParts,
} from './time'

describe('formatUtc', () => {
  it('writes the instant in UTC and says so', () => {
    expect(formatUtc('2026-08-31T14:30:00Z')).toBe('31 Aug 2026, 14:30 UTC')
  })

  it('does not drift with the reader’s own zone', () => {
    // Same instant, three ways of writing it: one rendering.
    expect(formatUtc('2026-08-31T14:30:00Z')).toBe(formatUtc('2026-08-31T16:30:00+02:00'))
    expect(formatUtc('2026-08-31T14:30:00Z')).toBe(formatUtc('2026-08-31T09:30:00-05:00'))
  })

  it('spells the day out when there is room', () => {
    expect(formatUtcLong('2026-08-31T14:30:00Z')).toBe('Monday 31 August at 14:30 UTC')
  })

  it('has something to show for an unreadable time', () => {
    expect(formatUtc('not a date')).toBe('—')
  })
})

describe('utcParts', () => {
  it('gives the calendar tile its day and month, in UTC', () => {
    // 23:30 UTC is already the next day in Singapore; the tile must not say so.
    expect(utcParts('2026-08-31T23:30:00Z')).toEqual({ day: '31', month: 'Aug' })
  })
})

describe('the datetime-local field', () => {
  it('reads what the teacher typed as UTC, not as their own zone', () => {
    expect(utcInputToIso('2026-09-03T16:30')).toBe('2026-09-03T16:30:00.000Z')
    expect(utcInputToIso('2026-09-03T16:30:00')).toBe('2026-09-03T16:30:00.000Z')
  })

  it('round-trips a stored time back into the field', () => {
    expect(isoToUtcInput('2026-09-03T16:30:00.000Z')).toBe('2026-09-03T16:30')
    expect(utcInputToIso(isoToUtcInput('2026-09-03T16:30:00.000Z'))).toBe(
      '2026-09-03T16:30:00.000Z',
    )
  })

  it('has nothing to store for an empty or unreadable field', () => {
    expect(utcInputToIso('')).toBeNull()
    expect(utcInputToIso('tomorrow')).toBeNull()
    expect(isoToUtcInput('tomorrow')).toBe('')
  })
})

describe('defaultUtcSlot', () => {
  it('rounds up to the next half hour in UTC', () => {
    expect(defaultUtcSlot(new Date('2026-09-03T16:12:00Z').getTime())).toBe('2026-09-03T16:30')
    expect(defaultUtcSlot(new Date('2026-09-03T16:41:00Z').getTime())).toBe('2026-09-03T17:00')
  })
})
