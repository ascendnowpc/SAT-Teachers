import { appBase } from './pcMail.ts'

/**
 * The link a PC is emailed to choose a password, in the rules both ends agree
 * on: manage_pc makes it, the join page reads it, accept_pc_invite checks it.
 * Pure, and free of anything browser- or Deno-only, so all three import the
 * one copy and the suite holds it.
 *
 * The token is 32 random bytes — a link nobody guesses — and what is stored is
 * its SHA-256 (0055's pc_invites), so the table is not a list of ways in. It
 * rides in the fragment, after the "#": a browser never sends that part to a
 * server, so it is in no access log on the way to the page and in no Referer
 * on the way out of it.
 */

/** How long a link works. The table sets the same week (issue_pc_invite). */
export const INVITE_DAYS = 7

/** The shortest password the join page will send. The project may ask more. */
export const MIN_PASSWORD = 8

/** bcrypt, underneath the auth server, reads 72 bytes and no more. */
export const MAX_PASSWORD = 72

function defaultRandom(n: number): Uint8Array {
  return crypto.getRandomValues(new Uint8Array(n))
}

/** 32 random bytes, base64url without padding: 43 characters. */
export function newToken(random: (n: number) => Uint8Array = defaultRandom): string {
  let binary = ''
  for (const byte of random(32)) binary += String.fromCharCode(byte)
  return btoa(binary).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '')
}

/** Whether a string could be a token at all — asked before any lookup. */
export function isToken(token: unknown): token is string {
  return typeof token === 'string' && /^[A-Za-z0-9_-]{43}$/.test(token)
}

/** What pc_invites keeps: the token's SHA-256, as 64 hex digits. */
export async function tokenHash(token: string): Promise<string> {
  const digest = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(token))
  return Array.from(new Uint8Array(digest), (b) => b.toString(16).padStart(2, '0')).join('')
}

export function inviteLink(appUrl: string | undefined | null, token: string): string {
  return `${appBase(appUrl)}/join#token=${token}`
}

/** The token from a location's fragment ("#token=…"), or null. */
export function tokenFrom(hash: string): string | null {
  const token = new URLSearchParams(hash.replace(/^#/, '')).get('token')
  return isToken(token) ? token : null
}

/** What is wrong with a password and its confirmation, in the page's words; null when nothing is. */
export function passwordProblem(password: string, confirm?: string): string | null {
  if (password.length < MIN_PASSWORD) return `At least ${MIN_PASSWORD} characters.`
  if (new TextEncoder().encode(password).length > MAX_PASSWORD) return `At most ${MAX_PASSWORD} characters.`
  if (password.trim() === '') return 'Not only spaces.'
  if (confirm !== undefined && confirm !== password) return 'The two passwords are not the same.'
  return null
}
