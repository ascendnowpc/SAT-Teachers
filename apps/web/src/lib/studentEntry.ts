/**
 * The student ID that opens a link (0066).
 *
 * The link a teacher sends is the address and the student ID is the login:
 * the server hands back the session's entry key only for the right ID, and
 * every call the test makes after that carries the key, not the link. These
 * are the rules around that exchange that do not need the network — how an
 * ID is read, what the refusals say, and where the key is kept for the visit.
 */

/** BATO26-1, however it was typed: no spaces, upper case. */
export function normaliseStudentId(raw: string): string {
  return raw.replace(/\s+/g, '').toUpperCase()
}

/** The server's two refusals, in words for a student. */
export function readableEntryError(message: string): string {
  if (/does not match/i.test(message)) {
    return 'That student ID does not match this link. Check it and try again.'
  }
  if (/not valid/i.test(message)) {
    return 'This link does not work. Ask your teacher to send it again.'
  }
  return message
}

/** Where a browser keeps what it needs: get and set, as Storage has them. */
export interface KeyStore {
  getItem(key: string): string | null
  setItem(key: string, value: string): void
}

const slot = (token: string) => `sat:entry:${token}`

/**
 * The tab's own storage, or nothing. Kept for the tab rather than the
 * browser: a refresh mid-test must not ask again, but the next person on a
 * shared computer must be asked. Private windows and blocked storage throw
 * on access, so reaching it is guarded too.
 */
function tabStore(): KeyStore | null {
  try {
    return typeof window === 'undefined' ? null : window.sessionStorage
  } catch {
    return null
  }
}

/** The key this tab was handed for this link, if it was. */
export function rememberedEntry(token: string, store: KeyStore | null = tabStore()): string | null {
  try {
    return store?.getItem(slot(token)) || null
  } catch {
    return null
  }
}

/** Keep the key for the rest of the visit. Losing it only means asking again. */
export function rememberEntry(token: string, key: string, store: KeyStore | null = tabStore()): void {
  try {
    store?.setItem(slot(token), key)
  } catch {
    // Storage refused: the test still runs, and a refresh asks for the ID.
  }
}
