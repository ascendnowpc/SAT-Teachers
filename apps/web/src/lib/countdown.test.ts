import { describe, expect, it } from 'vitest'
import { clock, openState } from './countdown'

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
