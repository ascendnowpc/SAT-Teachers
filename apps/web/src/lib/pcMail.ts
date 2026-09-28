/**
 * What a PC is sent, word for word.
 *
 * Two mails: the sign-in an admin's "Add a PC" produces (and a new password,
 * when one is asked for), and a generated report. Written here rather than
 * inside the functions that send them so that the suite reads the same words a
 * PC does — and so that a teacher's name with a "<" in it is escaped once, in
 * one place, in both.
 */

export interface Email {
  subject: string
  html: string
  text: string
}

export function escapeHtml(text: string): string {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
}

/** The address the app is served from, with no trailing slash. */
export function appBase(url: string | undefined | null): string {
  return (url?.trim() || 'https://sat-teachers.vercel.app').replace(/\/+$/, '')
}

// --------------------------------------------------------------- passwords --

/**
 * Letters and digits a person can read off a screen and type without asking
 * which one it was: no I, l, 1, O, o or 0.
 */
export const PASSWORD_ALPHABET = 'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789'

/** The largest multiple of the alphabet's length a byte can reach: above it, a draw is thrown away. */
const LIMIT = 256 - (256 % PASSWORD_ALPHABET.length)

function defaultRandom(n: number): Uint8Array {
  return crypto.getRandomValues(new Uint8Array(n))
}

/**
 * A temporary password: three groups of four, like "kP7m-Qx4n-Tz9c".
 *
 * About 70 bits from the twelve characters, drawn without modulo bias. It
 * always has a lower-case letter, a capital, a digit and — in the dashes — a
 * symbol, because a project can require any of those of every password and a
 * PC account that GoTrue refused to create over it would be a strange way for
 * an admin to find out.
 */
export function temporaryPassword(random: (n: number) => Uint8Array = defaultRandom): string {
  for (;;) {
    const chars: string[] = []
    while (chars.length < 12) {
      for (const byte of random(24)) {
        if (byte < LIMIT && chars.length < 12) {
          chars.push(PASSWORD_ALPHABET[byte % PASSWORD_ALPHABET.length])
        }
      }
    }
    const word = chars.join('')
    if (/[a-z]/.test(word) && /[A-Z]/.test(word) && /[0-9]/.test(word)) {
      return `${word.slice(0, 4)}-${word.slice(4, 8)}-${word.slice(8, 12)}`
    }
  }
}

// ------------------------------------------------------------------ layout --

const INK = '#1E2752'
const MUTED = '#5F73B3'
const FAINT = '#8796C6'
const LIME = '#CEE177'

function button(href: string, label: string): string {
  return (
    `<a href="${escapeHtml(href)}" style="display:inline-block;background:${LIME};color:${INK};` +
    `padding:11px 20px;border-radius:999px;text-decoration:none;font-weight:600">${escapeHtml(label)}</a>`
  )
}

function frame(inner: string): string {
  return (
    `<div style="font-family:system-ui,-apple-system,'Segoe UI',Roboto,sans-serif;color:${INK};` +
    `line-height:1.55;font-size:15px;max-width:560px">${inner}</div>`
  )
}

// --------------------------------------------------------------- sign-in ---

/**
 * A PC's sign-in, or a new password for one.
 *
 * The password is in the mail because that is what was asked for, and it is
 * temporary in the sense that matters: the account page changes it, and the
 * mail says where that is.
 */
export function credentialsEmail(input: {
  name: string
  email: string
  password: string
  appUrl: string
  /** A new password for an account that already exists. */
  reset?: boolean
}): Email {
  const first = input.name.trim().split(/\s+/)[0] || 'there'
  const login = `${appBase(input.appUrl)}/login`
  const subject = input.reset
    ? 'Your new password for Ascend Now'
    : 'Your Ascend Now PC account'

  const opening = input.reset
    ? 'An admin has set a new password on your PC account. The old one no longer works.'
    : 'An admin has made you a PC account on Ascend Now. When you sign in you will see the sessions and reports of the students assigned to you, and every report is emailed to you, as a PDF, the moment it is generated.'

  const html = frame(`
    <p style="margin:0 0 14px">Hello ${escapeHtml(first)},</p>
    <p style="margin:0 0 18px">${escapeHtml(opening)}</p>
    <table role="presentation" style="border-collapse:collapse;margin:0 0 20px">
      <tr><td style="padding:4px 16px 4px 0;color:${MUTED}">Email</td>
          <td style="padding:4px 0"><strong>${escapeHtml(input.email)}</strong></td></tr>
      <tr><td style="padding:4px 16px 4px 0;color:${MUTED}">Password</td>
          <td style="padding:4px 0;font-family:ui-monospace,Menlo,Consolas,monospace;font-size:16px">
            <strong>${escapeHtml(input.password)}</strong></td></tr>
    </table>
    <p style="margin:0 0 20px">${button(login, 'Sign in')}</p>
    <p style="margin:0 0 6px">Change the password once you are in: click your name at the foot of the sidebar.</p>
    <p style="margin:0;color:${FAINT};font-size:13px">If you were not expecting this, tell whoever runs Ascend Now's platform.</p>
  `)

  const text = [
    `Hello ${first},`,
    '',
    opening,
    '',
    `Email:    ${input.email}`,
    `Password: ${input.password}`,
    '',
    `Sign in: ${login}`,
    '',
    'Change the password once you are in: click your name at the foot of the sidebar.',
    '',
    "If you were not expecting this, tell whoever runs Ascend Now's platform.",
  ].join('\n')

  return { subject, html, text }
}

// ----------------------------------------------------------------- report --

export interface ReportEmailInput {
  pcName: string
  studentName: string
  teacherName: string
  subjectLabel: string
  /** "28 Sep 2026, 14:30 UTC" — the session's time, as every screen writes it. */
  when: string
  sessionId: string
  appUrl: string
  /** One line of the numbers: "13 of 18 correct (72%) · 21m 30s on questions". */
  headline: string | null
  /** An earlier generation of this report was already emailed to this PC. */
  updated: boolean
  /** The PDF is attached. False when it could not be made, and the mail says so. */
  attached: boolean
}

/**
 * A generated report, to the student's PC: the PDF, and the way to the
 * session. Sent every time the report is generated — a second one says it
 * replaces the first, so nobody forwards the older PDF believing it current.
 */
export function reportEmail(input: ReportEmailInput): Email {
  const base = appBase(input.appUrl)
  const sessionUrl = `${base}/sessions/${input.sessionId}`
  const reportUrl = `${base}/sessions/${input.sessionId}/report`
  const first = input.pcName.trim().split(/\s+/)[0] || 'there'

  const subject = `${input.updated ? 'Updated report' : 'Report'}: ${input.studentName} — ${input.subjectLabel}, ${input.when.replace(/, \d\d:\d\d UTC$/, '')}`

  // Who pressed Generate is not said: it may have been the teacher or an admin,
  // and the PC's question is whose lesson it was.
  const session = `${input.studentName}'s ${input.subjectLabel} session with ${input.teacherName} on ${input.when}`
  const lead = input.updated
    ? `The report on ${session} has been generated again. It replaces the one sent before.`
    : `The report on ${session} has been generated.`

  const attachedLine = input.attached
    ? 'The report is attached as a PDF.'
    : 'The PDF could not be made this time, so it is not attached — the report is in full on the page below.'

  const html = frame(`
    <p style="margin:0 0 14px">Hello ${escapeHtml(first)},</p>
    <p style="margin:0 0 12px">${escapeHtml(lead)}</p>
    ${input.headline ? `<p style="margin:0 0 12px;font-weight:600">${escapeHtml(input.headline)}</p>` : ''}
    <p style="margin:0 0 20px">${escapeHtml(attachedLine)}</p>
    <p style="margin:0 0 12px">${button(sessionUrl, 'Open the session')}</p>
    <p style="margin:0 0 20px">Or read the report online: <a href="${escapeHtml(reportUrl)}" style="color:${MUTED}">${escapeHtml(reportUrl)}</a></p>
    <p style="margin:0;color:${FAINT};font-size:13px">You are receiving this as ${escapeHtml(input.studentName)}'s PC.</p>
  `)

  const text = [
    `Hello ${first},`,
    '',
    lead,
    ...(input.headline ? ['', input.headline] : []),
    '',
    attachedLine,
    '',
    `Open the session: ${sessionUrl}`,
    `Read the report:  ${reportUrl}`,
    '',
    `You are receiving this as ${input.studentName}'s PC.`,
  ].join('\n')

  return { subject, html, text }
}
