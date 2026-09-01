/**
 * How long until a session opens, in the words a student wants to read.
 *
 * The server is the one that actually enforces the scheduled time
 * (start_session_as_student refuses before it), so this is presentation — but
 * it decides whether the Start button is offered at all, which is why it is a
 * pure function with the clock passed in rather than something that reads
 * Date.now() out of the air and cannot be tested.
 */
export interface OpenState {
  open: boolean
  /** "opens in 4 minutes", "opens on 3 Sep", "open now". */
  label: string
}

const MINUTE = 60_000
const HOUR = 60 * MINUTE
const DAY = 24 * HOUR

function plural(n: number, word: string): string {
  return `${n} ${word}${n === 1 ? '' : 's'}`
}

export function openState(
  scheduledAt: string | Date,
  now: number = Date.now(),
  /** Set when a teacher waived the clock. The scheduled time still stands as the arrangement. */
  openedEarlyAt: string | null = null,
): OpenState {
  // A waiver beats the clock, and beats an unreadable time too — the teacher
  // has said the student may start, and that is not a countdown any more.
  if (openedEarlyAt) return { open: true, label: 'opened by your teacher' }

  const at = scheduledAt instanceof Date ? scheduledAt.getTime() : new Date(scheduledAt).getTime()
  if (Number.isNaN(at)) return { open: false, label: 'opens at a time still to be set' }

  const ms = at - now
  if (ms <= 0) return { open: true, label: 'open now' }

  if (ms < MINUTE) return { open: false, label: 'opens in under a minute' }
  if (ms < HOUR) return { open: false, label: `opens in ${plural(Math.round(ms / MINUTE), 'minute')}` }
  if (ms < DAY) {
    const hours = Math.floor(ms / HOUR)
    const minutes = Math.round((ms % HOUR) / MINUTE)
    return {
      open: false,
      label: minutes
        ? `opens in ${plural(hours, 'hour')} ${plural(minutes, 'minute')}`
        : `opens in ${plural(hours, 'hour')}`,
    }
  }
  return { open: false, label: `opens in ${plural(Math.round(ms / DAY), 'day')}` }
}

/** mm:ss, for the clock on the question the student is working on. */
export function clock(seconds: number): string {
  const s = Math.max(0, Math.floor(seconds))
  return `${Math.floor(s / 60)}:${String(s % 60).padStart(2, '0')}`
}
