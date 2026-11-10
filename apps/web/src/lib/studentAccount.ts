/**
 * A student's own sign-in: their ID and a PIN, on the sign-in page's Student
 * tab (0067). The rules that need no network: what the server's answers say
 * to a student, where the key is kept, and what each test on their page
 * offers.
 */
import type { SessionMode, SessionStatus, Subject } from './types'
import type { KeyStore } from './studentEntry'

/** What student_sign_in hands back. */
export type SignInResult =
  | { ok: true; key: string }
  | { ok: false; reason: 'wrong' | 'closed' }
  | { ok: false; reason: 'locked'; until: string }

/** The server's answer, in words for a student. */
export function signInMessage(r: Exclude<SignInResult, { ok: true }>, now: number = Date.now()): string {
  switch (r.reason) {
    case 'wrong':
      return 'That student ID and PIN do not match. Check both and try again.'
    case 'closed':
      return 'This account has been closed. Ask your teacher.'
    case 'locked': {
      const minutes = Math.max(1, Math.ceil((new Date(r.until).getTime() - now) / 60_000))
      const wait = minutes >= 60 ? `${Math.ceil(minutes / 60)} hour${minutes > 60 ? 's' : ''}` : `${minutes} minute${minutes === 1 ? '' : 's'}`
      return `Too many wrong tries. Try again in ${wait}, or ask your teacher for a new PIN.`
    }
  }
}

/** A PIN as typed: digits only, at most four. */
export function cleanPin(raw: string): string {
  return raw.replace(/\D/g, '').slice(0, 4)
}

/** One test on the student's page, as student_home sends it. */
export interface StudentTest {
  id: string
  title: string | null
  subject: Subject
  mode: SessionMode
  status: SessionStatus
  scheduled_at: string
  opened_early_at: string | null
  link: string
  entry_key: string
  section: string | null
  skill: string | null
  /** A targeted test's skills, in the order chosen; null for a whole section (0086). */
  skills?: string[] | null
  set_size: number | null
  revealed: number
  right: number
  /** A finished targeted test's score, there at once (0068); null otherwise. */
  score?: { right: number; reached: number } | null
}

export interface StudentHome {
  student: { full_name: string; display_id: string }
  sessions: StudentTest[]
}

/**
 * What a test on the page offers. A test still to come opens to its own
 * waiting screen, which counts down to the start — so it can be opened early
 * to check the link works, and nothing is lost by it.
 */
export type TestStanding =
  | { kind: 'upcoming' }
  | { kind: 'open' }
  | { kind: 'live' }
  /** `answers`: the teacher has published them, so the test shows them too. */
  | { kind: 'results'; right: number; of: number; answers: boolean }
  | { kind: 'waiting' }

export function standingOf(t: StudentTest, now: number = Date.now()): TestStanding {
  if (t.status === 'live') return { kind: 'live' }
  if (t.status === 'completed') {
    // A targeted test's score is the student's as soon as it is over; a
    // lesson's comes with the teacher's Publish results.
    if (t.score && t.score.reached > 0) {
      return { kind: 'results', right: t.score.right, of: t.score.reached, answers: t.revealed > 0 }
    }
    return t.revealed > 0
      ? { kind: 'results', right: t.right, of: t.revealed, answers: true }
      : { kind: 'waiting' }
  }
  const open = t.opened_early_at !== null || new Date(t.scheduled_at).getTime() <= now
  return open ? { kind: 'open' } : { kind: 'upcoming' }
}

/** Tests still to sit first, soonest first; then the ones done, newest first. */
export function splitTests(tests: StudentTest[]) {
  const ahead = tests
    .filter((t) => t.status === 'scheduled' || t.status === 'live')
    .sort((a, b) => a.scheduled_at.localeCompare(b.scheduled_at))
  const done = tests
    .filter((t) => t.status === 'completed')
    .sort((a, b) => b.scheduled_at.localeCompare(a.scheduled_at))
  return { ahead, done }
}

/**
 * What the student's own page says about them at a glance (0067).
 *
 * Only what their own tests already say: how many are finished, how much of
 * what they were marked on they got right, and how many are still to sit.
 * A test whose results the teacher has not published yet counts as finished
 * and is left out of the proportion, because nobody has told the student how
 * it went.
 */
export interface StudentStats {
  completed: number
  ahead: number
  /** Right out of marked, across every test the student has been given back. */
  marked: { right: number; of: number } | null
}

export function studentStats(tests: StudentTest[], now: number = Date.now()): StudentStats {
  const { ahead, done } = splitTests(tests)
  let right = 0
  let of = 0
  for (const t of done) {
    const standing = standingOf(t, now)
    if (standing.kind === 'results' && standing.of > 0) {
      right += standing.right
      of += standing.of
    }
  }
  return { completed: done.length, ahead: ahead.length, marked: of > 0 ? { right, of } : null }
}

/** The proportion right as a whole percentage, for the page to show. */
export function percentRight(marked: { right: number; of: number } | null): number | null {
  if (!marked || marked.of <= 0) return null
  return Math.round((marked.right / marked.of) * 100)
}

const SLOT = 'sat:student-key'

/**
 * The browser's own storage, or nothing: a student stays signed in on their
 * device until they sign out or the key runs out (seven days, server side).
 * Private windows and blocked storage throw on access, so that is guarded.
 */
function deviceStore(): KeyStore | null {
  try {
    return typeof window === 'undefined' ? null : window.localStorage
  } catch {
    return null
  }
}

export function storedStudentKey(store: KeyStore | null = deviceStore()): string | null {
  try {
    return store?.getItem(SLOT) || null
  } catch {
    return null
  }
}

export function storeStudentKey(key: string | null, store: (KeyStore & { removeItem?: (k: string) => void }) | null = deviceStore()): void {
  try {
    if (key) store?.setItem(SLOT, key)
    else if (store?.removeItem) store.removeItem(SLOT)
    else store?.setItem(SLOT, '')
  } catch {
    // Storage refused: they stay signed in for this page only.
  }
}
