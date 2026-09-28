/**
 * What a PC is sent, word for word.
 *
 * Two mails: the link an admin's "Add a PC" sends, to choose a password (and
 * the same link again, for a new one), and a generated report. Written here
 * rather than inside the functions that send them so that the suite reads the
 * same words a PC does — and so that a teacher's name with a "<" in it is escaped once, in
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

// -------------------------------------------------------------- invitation --

/**
 * The link to choose a password: a new PC's first, or a new one for a PC who
 * has one already. No password is ever in a mail — the PC chooses it on the
 * page the link opens, where their address is already filled in.
 */
export function inviteEmail(input: {
  name: string
  link: string
  /** The PC has chosen a password before: this one replaces it. */
  joined?: boolean
  /** How long the link works. */
  days: number
}): Email {
  const first = input.name.trim().split(/\s+/)[0] || 'there'
  const subject = input.joined ? 'Choose a new password for Ascend Now' : 'Your Ascend Now PC account'

  const opening = input.joined
    ? 'An admin has sent you a link to choose a new password for your PC account on Ascend Now. Your current password keeps working until you do.'
    : 'An admin has made you a PC account on Ascend Now. Once you are in you will see the sessions and reports of the students assigned to you, and every report is emailed to you, as a PDF, the moment it is generated.'
  const ask = input.joined
    ? 'Choose the new one here:'
    : 'All that is left is a password. Your email address is already filled in — choose one and you are in:'
  const label = input.joined ? 'Choose a new password' : 'Set up my account'
  const expiry = `The link works once, for ${input.days} days. If it has run out, ask an admin to send another.`

  const html = frame(`
    <p style="margin:0 0 14px">Hello ${escapeHtml(first)},</p>
    <p style="margin:0 0 14px">${escapeHtml(opening)}</p>
    <p style="margin:0 0 18px">${escapeHtml(ask)}</p>
    <p style="margin:0 0 20px">${button(input.link, label)}</p>
    <p style="margin:0 0 6px;color:${MUTED};font-size:13px">${escapeHtml(expiry)}</p>
    <p style="margin:0 0 6px;color:${MUTED};font-size:13px">Or paste this into your browser: <span style="word-break:break-all">${escapeHtml(input.link)}</span></p>
    <p style="margin:0;color:${FAINT};font-size:13px">If you were not expecting this, you can ignore it.</p>
  `)

  const text = [
    `Hello ${first},`,
    '',
    opening,
    '',
    ask,
    input.link,
    '',
    expiry,
    '',
    'If you were not expecting this, you can ignore it.',
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
