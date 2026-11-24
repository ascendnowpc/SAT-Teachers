/**
 * The SAT's own calendar, for "When's your SAT?" on a student's first login
 * and for the registration deadline that goes with each date.
 *
 * From College Board's "SAT Suite Test Dates and Deadlines",
 * https://satsuite.collegeboard.org/sat/dates-deadlines, read 24 November 2026.
 * The US dates; College Board publishes them a year ahead, so this list wants
 * the next year's added each summer. A student whose SAT is not here — a
 * school-day SAT, or one abroad on another day — types the day instead.
 */
export interface SatDate {
  /** The test day, YYYY-MM-DD. */
  day: string
  /** The regular registration deadline. */
  registerBy: string
  /** The last day to register late or change. */
  lateBy: string
}

export const SAT_DATES_SOURCE = 'https://satsuite.collegeboard.org/sat/dates-deadlines'

export const SAT_DATES: SatDate[] = [
  { day: '2026-08-22', registerBy: '2026-08-07', lateBy: '2026-08-11' },
  { day: '2026-09-12', registerBy: '2026-08-28', lateBy: '2026-09-01' },
  { day: '2026-10-03', registerBy: '2026-09-18', lateBy: '2026-09-22' },
  { day: '2026-11-07', registerBy: '2026-10-23', lateBy: '2026-10-27' },
  { day: '2026-12-05', registerBy: '2026-11-20', lateBy: '2026-11-24' },
  { day: '2027-03-06', registerBy: '2027-02-19', lateBy: '2027-02-23' },
  { day: '2027-05-01', registerBy: '2027-04-16', lateBy: '2027-04-20' },
  { day: '2027-06-05', registerBy: '2027-05-21', lateBy: '2027-05-25' },
]

/** The next `n` SAT dates on or after `today` (YYYY-MM-DD). */
export function upcomingSatDates(today: string, n = 3): SatDate[] {
  return SAT_DATES.filter((d) => d.day >= today).slice(0, n)
}

/** The official date a day is, if it is one. */
export function satDateFor(day: string | null | undefined): SatDate | null {
  return (day && SAT_DATES.find((d) => d.day === day)) || null
}

/**
 * The registration deadline to keep with a test day: the late one while the
 * regular one has passed and the late one has not, the regular one otherwise.
 * Null for a day that is not on the list.
 */
export function deadlineFor(day: string | null | undefined, today: string): string | null {
  const d = satDateFor(day)
  if (!d) return null
  return d.registerBy < today && d.lateBy >= today ? d.lateBy : d.registerBy
}
