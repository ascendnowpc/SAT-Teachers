import { formatUtc, utcParts } from './time'
import type { PcInvite, Profile, ReportEmail } from './types'

/**
 * PCs, in the rules every screen that shows one agrees on: which PCs a student
 * can be given, and how a report's email to the PC reads. Pure, so the suite
 * can hold them; the calls that fetch and send are in ./pcApi.
 */

export interface PcResult {
  profile: Profile
  /** Whether the link went by email. */
  emailed: boolean
  /** Why it did not. */
  reason?: string
  /** Only when the email did not go: shown once, for the admin to hand over. */
  link?: string
  /** The PC had chosen a password before: the link is for a new one. */
  joined: boolean
  /** When the link stops working. Missing when no link could be made. */
  expires_at?: string
}

/** A PC who can be given a student: active, and not suspended. */
export function choosable(pc: Profile): boolean {
  return pc.role === 'pc' && pc.is_active
}

// -------------------------------------------------------------- joining ---

export interface InviteState {
  /** Whether the PC has chosen a password: they can sign in. */
  joined: boolean
  /** The badge beside an unjoined PC's name; null once they have joined. */
  badge: { tone: 'sky' | 'bad' | 'neutral'; label: string } | null
  /** One line under the name. */
  text: string
  /** What sending another link is called, for this PC. */
  action: string
}

const day = (iso: string) => {
  const p = utcParts(iso)
  return `${p.day} ${p.month}`
}

/**
 * Where a PC is with their link, for the admin's list: invited and not yet
 * in, invited too long ago, or in. A PC who has joined can be sent a link
 * for a new password — the same link, which is the one way a PC who has
 * forgotten theirs gets back in.
 */
export function inviteState(invite: PcInvite | null, now: number = Date.now()): InviteState {
  if (invite?.joined_at) {
    return { joined: true, badge: null, text: `Joined ${day(invite.joined_at)}`, action: 'Send a password link' }
  }
  if (!invite) {
    return {
      joined: false,
      badge: { tone: 'neutral', label: 'Not invited' },
      text: 'No link has been sent yet',
      action: 'Send the invitation',
    }
  }
  if (!invite.used_at && Date.parse(invite.expires_at) > now) {
    return {
      joined: false,
      badge: { tone: 'sky', label: 'Invited' },
      text: `Invited ${day(invite.issued_at)} · the link works until ${day(invite.expires_at)}`,
      action: 'Send the link again',
    }
  }
  return {
    joined: false,
    badge: { tone: 'bad', label: 'Link expired' },
    text: `Invited ${day(invite.issued_at)} · the link has run out`,
    action: 'Send a new link',
  }
}

// ------------------------------------------------------------ how it reads --

export interface DeliveryLine {
  /** ok: it went. wait: it is going. bad: it failed. none: it did not and will not by itself. */
  tone: 'ok' | 'wait' | 'bad' | 'none'
  text: string
}

/** How long a generation waits for its email before the screen stops saying "sending". */
export const SENDING_GRACE_MS = 90_000

/**
 * The line a screen shows about the report's email to the PC.
 *
 * The email follows the generation by a few seconds — the database queues it
 * and a function sends it — so a report generated a moment ago with no row yet
 * is being sent, not unsent. After a minute and a half with nothing it is
 * said plainly that it has not gone, which is also what a project with the
 * email switched off looks like, and the screen offers to send it by hand.
 */
export function deliveryLine(
  email: ReportEmail | null,
  generatedAt: string | null,
  pcName: string | null,
  now: number = Date.now(),
): DeliveryLine | null {
  if (!generatedAt) return null
  const who = pcName || 'the PC'

  const current = email && Date.parse(email.generated_at) >= Date.parse(generatedAt) ? email : null
  if (!current) {
    return now - Date.parse(generatedAt) < SENDING_GRACE_MS
      ? { tone: 'wait', text: `Sending the report to ${who}…` }
      : { tone: 'none', text: `The report has not been emailed to ${who}.` }
  }

  switch (current.status) {
    case 'sent':
      return {
        tone: 'ok',
        text: `Emailed to ${who}${current.sent_to ? ` (${current.sent_to})` : ''}, ${formatUtc(current.updated_at)}`,
      }
    case 'sending':
      return { tone: 'wait', text: `Sending the report to ${who}…` }
    case 'failed':
      return { tone: 'bad', text: `Could not email ${who}: ${current.detail ?? 'the mail did not go'}` }
    case 'skipped':
      return { tone: 'none', text: `Not emailed: ${current.detail ?? 'there was nobody to send it to'}` }
  }
}
