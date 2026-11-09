/**
 * The two clocks of a targeted test (0062), as the student's screen shows them.
 *
 * Both are the server's: the question's runs from the first_viewed_at the
 * server stamped as it showed the question, for its time_limit_seconds; the
 * overall one ends at the deadline the server sends. The browser's own clock
 * is only used to count down between payloads, corrected by the offset between
 * it and the server's `server_now` — so a laptop five minutes fast does not
 * show a student five minutes they do not have.
 *
 * Pure functions with the clock passed in, like lib/countdown.
 */

/** server time − browser time, in ms, from a payload received at `receivedAt` (browser ms). */
export function clockOffset(serverNow: string | null | undefined, receivedAt: number): number {
  if (!serverNow) return 0
  const server = new Date(serverNow).getTime()
  return Number.isNaN(server) ? 0 : server - receivedAt
}

/** When the question's own clock runs out, in server ms; null when it has none. */
export function questionEndsAt(item: {
  first_viewed_at: string | null
  time_limit_seconds?: number | null
}): number | null {
  if (!item.first_viewed_at || !item.time_limit_seconds) return null
  const from = new Date(item.first_viewed_at).getTime()
  return Number.isNaN(from) ? null : from + item.time_limit_seconds * 1000
}

/** The overall deadline in server ms, or null before the test starts. */
export function deadlineAt(deadline: string | null | undefined): number | null {
  if (!deadline) return null
  const at = new Date(deadline).getTime()
  return Number.isNaN(at) ? null : at
}

/** Seconds left until `endsAt` (server ms), never below zero; null when there is no such clock. */
export function secondsLeft(endsAt: number | null, now: number, offset: number): number | null {
  if (endsAt === null) return null
  return Math.max(0, (endsAt - (now + offset)) / 1000)
}

/**
 * Which clock runs out first on the question on screen, and when. The
 * overall deadline can cut a question's own time short, and the screen counts
 * down whichever ends first.
 */
export function bindingClock(
  questionEnds: number | null,
  deadline: number | null,
): { endsAt: number; which: 'question' | 'overall' } | null {
  if (questionEnds === null && deadline === null) return null
  if (questionEnds === null) return { endsAt: deadline as number, which: 'overall' }
  if (deadline === null || questionEnds <= deadline)
    return { endsAt: questionEnds, which: 'question' }
  return { endsAt: deadline, which: 'overall' }
}

/** A targeted item the student met: answered, skipped, timed out, or set aside. For the end screen. */
export type TargetedOutcome = 'answered' | 'skipped' | 'timed_out' | 'set_aside'

/**
 * How a targeted item ended, from the student's side — which has no
 * assessment row: an item answered with no option is one whose time ran out.
 *
 * Unless it never had an option to pick. A question the student types the
 * answer to (0073) leaves selected_option null however well it was answered,
 * so what it left behind is entered_answer, and reading only the option would
 * put "Time ran out" under every one of them.
 */
export function outcomeOf(item: {
  status: string
  selected_option: string | null
  entered_answer?: string | null
  skipped?: boolean
}): TargetedOutcome | null {
  if (item.status === 'voided') return 'set_aside'
  if (item.status === 'answered' || item.status === 'revealed') {
    if (item.selected_option !== null) return 'answered'
    if (item.entered_answer !== null && item.entered_answer !== undefined) return 'answered'
    // Nothing either way: the student skipped it (0072), or its time ran out.
    return item.skipped ? 'skipped' : 'timed_out'
  }
  return null
}
