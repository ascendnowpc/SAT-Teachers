/**
 * The student's calendar (the section-tracker scope's F12): the months from
 * now to their SAT, with the registration deadline, the test day and the
 * check-ins booked between — as days in a grid, Monday first.
 */

export type CalendarMark = 'sat' | 'registration' | 'test'

export interface CalendarEvent {
  /** YYYY-MM-DD. */
  day: string
  kind: CalendarMark
  label: string
  /** A check-in's subject colour. */
  tone?: 'violet' | 'sky'
}

export interface CalendarDay {
  /** YYYY-MM-DD, or null for a blank before the 1st or after the last. */
  day: string | null
  date: number | null
  today: boolean
  past: boolean
  events: CalendarEvent[]
}

export interface CalendarMonth {
  /** "December 2026". */
  title: string
  weeks: CalendarDay[][]
}

const pad = (n: number) => String(n).padStart(2, '0')
const iso = (y: number, m: number, d: number) => `${y}-${pad(m + 1)}-${pad(d)}`

/**
 * The months to show: this one through the month of the last event, at most
 * `max` of them — and just this one when there is nothing ahead.
 */
export function calendarMonths(today: string, events: CalendarEvent[], max = 3): CalendarMonth[] {
  const y0 = +today.slice(0, 4)
  const m0 = +today.slice(5, 7) - 1
  const ahead = events.map((e) => e.day).filter((d) => d >= today.slice(0, 8) + '01').sort()
  const last = ahead[ahead.length - 1] ?? today
  const span = (+last.slice(0, 4) - y0) * 12 + (+last.slice(5, 7) - 1 - m0) + 1
  const count = Math.max(1, Math.min(max, span))

  const out: CalendarMonth[] = []
  for (let k = 0; k < count; k++) {
    const y = y0 + Math.floor((m0 + k) / 12)
    const m = (m0 + k) % 12
    const days = new Date(Date.UTC(y, m + 1, 0)).getUTCDate()
    // Monday first: getUTCDay is 0 for Sunday.
    const lead = (new Date(Date.UTC(y, m, 1)).getUTCDay() + 6) % 7
    const cells: CalendarDay[] = []
    for (let i = 0; i < lead; i++) cells.push({ day: null, date: null, today: false, past: false, events: [] })
    for (let d = 1; d <= days; d++) {
      const day = iso(y, m, d)
      cells.push({ day, date: d, today: day === today, past: day < today, events: events.filter((e) => e.day === day) })
    }
    while (cells.length % 7 !== 0) cells.push({ day: null, date: null, today: false, past: false, events: [] })
    const weeks: CalendarDay[][] = []
    for (let i = 0; i < cells.length; i += 7) weeks.push(cells.slice(i, i + 7))
    out.push({
      title: new Date(Date.UTC(y, m, 1)).toLocaleDateString('en-GB', { month: 'long', year: 'numeric', timeZone: 'UTC' }),
      weeks,
    })
  }
  return out
}
