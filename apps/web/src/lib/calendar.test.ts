import { describe, expect, it } from 'vitest'
import { calendarMonths } from './calendar'

describe('the calendar', () => {
  const events = [
    { day: '2026-11-27', kind: 'registration' as const, label: 'Registration closes' },
    { day: '2026-11-28', kind: 'test' as const, label: 'Inferences' },
    { day: '2026-12-05', kind: 'sat' as const, label: 'SAT' },
  ]

  it('runs from this month to the SAT’s', () => {
    const months = calendarMonths('2026-11-24', events)
    expect(months.map((m) => m.title)).toEqual(['November 2026', 'December 2026'])
  })

  it('lays a month out Monday first, with its days and marks', () => {
    const [nov] = calendarMonths('2026-11-24', events)
    // 1 November 2026 is a Sunday: six blanks before it.
    expect(nov.weeks[0].map((d) => d.date)).toEqual([null, null, null, null, null, null, 1])
    const cells = nov.weeks.flat()
    expect(cells.find((d) => d.today)?.day).toBe('2026-11-24')
    expect(cells.find((d) => d.day === '2026-11-27')?.events[0].kind).toBe('registration')
    expect(cells.filter((d) => d.past).length).toBe(23)
    expect(nov.weeks.every((w) => w.length === 7)).toBe(true)
  })

  it('shows at most three months, and this one with nothing ahead', () => {
    expect(calendarMonths('2026-11-24', [{ day: '2027-06-05', kind: 'sat', label: 'SAT' }]).length).toBe(3)
    expect(calendarMonths('2026-11-24', []).map((m) => m.title)).toEqual(['November 2026'])
  })
})
