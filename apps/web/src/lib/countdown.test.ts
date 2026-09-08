import { describe, expect, it } from 'vitest'
import { clock, openState, workedFor } from './countdown'

const NOW = new Date('2026-09-03T10:00:00Z').getTime()
const at = (iso: string) => openState(iso, NOW)

describe('openState', () => {
  it('is open once the scheduled time has passed', () => {
    expect(at('2026-09-03T10:00:00Z')).toEqual({ open: true, label: 'open now' })
    expect(at('2026-09-03T09:30:00Z').open).toBe(true)
  })

  it('counts down in minutes within the hour', () => {
    expect(at('2026-09-03T10:04:00Z')).toEqual({ open: false, label: 'opens in 4 minutes' })
    expect(at('2026-09-03T10:01:00Z').label).toBe('opens in 1 minute')
    expect(at('2026-09-03T10:00:30Z').label).toBe('opens in under a minute')
  })

  it('counts down in hours and minutes within the day', () => {
    expect(at('2026-09-03T12:30:00Z').label).toBe('opens in 2 hours 30 minutes')
    expect(at('2026-09-03T13:00:00Z').label).toBe('opens in 3 hours')
    expect(at('2026-09-03T11:00:00Z').label).toBe('opens in 1 hour')
  })

  it('counts down in days beyond that', () => {
    expect(at('2026-09-05T10:00:00Z').label).toBe('opens in 2 days')
    expect(at('2026-09-04T10:00:00Z').label).toBe('opens in 1 day')
  })

  it('never offers the start button on an unreadable time', () => {
    expect(openState('not a date', NOW).open).toBe(false)
  })

  it('opens on a teacher waiver however far off the scheduled time is', () => {
    const early = '2026-09-03T09:40:00Z'
    expect(openState('2026-09-03T16:00:00Z', NOW, early)).toEqual({
      open: true,
      label: 'opened by your teacher',
    })
    expect(openState('2026-09-09T10:00:00Z', NOW, early).open).toBe(true)
    // Even a time nobody could read: the teacher has said they may start.
    expect(openState('not a date', NOW, early).open).toBe(true)
  })

  it('counts down again when the waiver is taken back', () => {
    expect(openState('2026-09-03T10:04:00Z', NOW, null).label).toBe('opens in 4 minutes')
  })
})

describe('clock', () => {
  it('counts the question in mm:ss', () => {
    expect(clock(0)).toBe('0:00')
    expect(clock(9)).toBe('0:09')
    expect(clock(75)).toBe('1:15')
    expect(clock(600)).toBe('10:00')
  })

  it('never shows a negative clock', () => {
    expect(clock(-4)).toBe('0:00')
  })
})

describe('workedFor', () => {
  const item = (
    published: string | null,
    viewed: string | null,
    decided: string | null,
  ) => ({ published_at: published, first_viewed_at: viewed, decided_at: decided })

  it('runs from when the question reached the screen to now', () => {
    expect(workedFor(item('2026-09-03T09:59:00Z', '2026-09-03T09:59:30Z', null), NOW)).toBe(30)
  })

  it('falls back to when it was published, if it was never marked seen', () => {
    expect(workedFor(item('2026-09-03T09:59:00Z', null, null), NOW)).toBe(60)
  })

  it('stops the moment they settled, and stays stopped', () => {
    const settled = item('2026-09-03T09:59:00Z', '2026-09-03T09:59:00Z', '2026-09-03T09:59:42Z')
    expect(workedFor(settled, NOW)).toBe(42)
    // An hour later it still reads 42 — this is the number the report keeps.
    expect(workedFor(settled, NOW + 3_600_000)).toBe(42)
  })

  it('is null before the question has been put up at all', () => {
    expect(workedFor(item(null, null, null), NOW)).toBeNull()
  })

  it('never runs backwards when the clocks disagree', () => {
    expect(workedFor(item('2026-09-03T10:00:30Z', null, null), NOW)).toBe(0)
  })
})
