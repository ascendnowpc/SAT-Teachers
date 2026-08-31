/**
 * Session times, in UTC, everywhere.
 *
 * A session has one time, and a teacher in Singapore, a student in Dubai and a
 * parent reading the report in London all have to mean the same moment by it.
 * Rendering in each browser's own zone made "4:30" mean three different things
 * and made a scheduled time impossible to talk about on a call — so every
 * session time in the product is written and read as UTC, and says so.
 *
 * The database has always stored `timestamptz`, which is an instant rather
 * than a wall clock; this is only about which zone that instant is shown in.
 */

/** "31 Aug 2026, 20:00 UTC" — the form used wherever a session time appears. */
export function formatUtc(
  when: string | Date,
  opts: Intl.DateTimeFormatOptions = {
    day: 'numeric',
    month: 'short',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
    hour12: false,
  },
): string {
  const d = when instanceof Date ? when : new Date(when)
  if (Number.isNaN(d.getTime())) return '—'
  return `${d.toLocaleString('en-GB', { ...opts, timeZone: 'UTC' })} UTC`
}

/** The same, with the weekday, for a screen with room for it. */
export function formatUtcLong(when: string | Date): string {
  return formatUtc(when, {
    weekday: 'long',
    day: 'numeric',
    month: 'long',
    hour: '2-digit',
    minute: '2-digit',
    hour12: false,
  })
}

/** Day and month for the little calendar tile on a session card. */
export function utcParts(when: string | Date): { day: string; month: string } {
  const d = when instanceof Date ? when : new Date(when)
  if (Number.isNaN(d.getTime())) return { day: '—', month: '' }
  return {
    day: d.toLocaleString('en-GB', { day: 'numeric', timeZone: 'UTC' }),
    month: d.toLocaleString('en-GB', { month: 'short', timeZone: 'UTC' }),
  }
}

/**
 * `<input type="datetime-local">` has no zone: it hands back "2026-09-03T16:30"
 * and the browser means local time by it. Since the field is labelled UTC, the
 * value is read as UTC — appending the Z rather than letting `new Date()` apply
 * the browser's offset, which would silently shift every session by hours for
 * anyone not sitting on the meridian.
 */
export function utcInputToIso(value: string): string | null {
  if (!value) return null
  // The field gives "2026-09-03T16:30", sometimes with seconds. Either way it
  // becomes an explicit UTC instant rather than a local one.
  const withSeconds = value.length === 16 ? `${value}:00` : value
  const d = new Date(`${withSeconds}Z`)
  return Number.isNaN(d.getTime()) ? null : d.toISOString()
}

/** The reverse, for filling the field in when editing an existing time. */
export function isoToUtcInput(iso: string): string {
  const d = new Date(iso)
  if (Number.isNaN(d.getTime())) return ''
  return d.toISOString().slice(0, 16)
}

/** The next half hour, in UTC, as the field wants it. */
export function defaultUtcSlot(now: number = Date.now()): string {
  const d = new Date(now)
  d.setUTCMinutes(d.getUTCMinutes() + 30 - (d.getUTCMinutes() % 30), 0, 0)
  return d.toISOString().slice(0, 16)
}
