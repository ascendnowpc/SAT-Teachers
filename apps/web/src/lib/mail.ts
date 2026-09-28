/**
 * An email, as the wire carries it, and which way it goes out.
 *
 * The edge functions send three kinds of mail — a PC's sign-in, a report to a
 * PC, and the pending-teacher notice — and they send it one of two ways: over
 * SMTP with an app password (Gmail's, usually), or through Resend's API. This
 * is the half of that which is not a socket: which transport the secrets
 * describe, and the MIME message SMTP sends. Pure, so the suite can check the
 * bytes before a mail server ever sees them; the socket is
 * supabase/functions/_shared/send.ts.
 *
 * Why SMTP at all, when Supabase sends mail: Supabase Auth's mailer sends its
 * own templates and nothing else — no attachments, no report — and without a
 * custom SMTP server it refuses every address outside the project's team.
 */

export interface MailAttachment {
  filename: string
  contentType: string
  content: Uint8Array
}

export interface MailMessage {
  /** 'Ascend Now <no-reply@ascendnow.info>', or a bare address. */
  from: string
  to: string[]
  subject: string
  html: string
  /** The plain-text part: what a mail client shows when it will not render HTML. */
  text: string
  replyTo?: string
  attachments?: MailAttachment[]
}

// ----------------------------------------------------------- the transport --

export interface SmtpSettings {
  host: string
  port: number
  /**
   * 'implicit' is TLS from the first byte, which is port 465. Supabase's
   * hosted functions may not open 25 or 587 at all, so STARTTLS is not on
   * offer and implicit TLS is the only secure way out. 'none' is plain text,
   * for a local mail catcher and nothing else.
   */
  tls: 'implicit' | 'none'
  user: string
  pass: string
}

export type Transport =
  | { kind: 'smtp'; smtp: SmtpSettings; from: string }
  | { kind: 'resend'; key: string; from: string }
  | { kind: 'none'; reason: string }

/**
 * Which way mail goes, from the function's secrets.
 *
 * SMTP when its three secrets are set, Resend when its key is, and neither
 * otherwise — which is not an error. Every caller treats an unsent mail as a
 * slower workflow rather than a failed one: the account is still made, the
 * report is still generated, and the screen says the mail did not go.
 */
export function transportFrom(env: (key: string) => string | undefined): Transport {
  const host = env('SMTP_HOST')?.trim()
  const user = env('SMTP_USER')?.trim()
  const pass = appPassword(env('SMTP_PASS') ?? '')
  if (host && user && pass) {
    const port = Number(env('SMTP_PORT') ?? '') || 465
    const tls = env('SMTP_TLS')?.trim().toLowerCase() === 'none' ? 'none' : 'implicit'
    return {
      kind: 'smtp',
      smtp: { host, port, tls, user, pass },
      // The account's own address unless told otherwise: Gmail rewrites a From
      // that is not the account or one of its verified aliases anyway.
      from: env('MAIL_FROM')?.trim() || `Ascend Now <${user}>`,
    }
  }

  const key = env('RESEND_API_KEY')?.trim()
  if (key) {
    return {
      kind: 'resend',
      key,
      from: env('MAIL_FROM')?.trim() || 'Ascend Now <onboarding@resend.dev>',
    }
  }

  return {
    kind: 'none',
    reason: 'no mail provider is set up: set SMTP_HOST, SMTP_USER and SMTP_PASS (or RESEND_API_KEY) as function secrets',
  }
}

/**
 * Google shows an app password as four groups of four — "abcd efgh ijkl mnop"
 * — and people paste it as shown. The spaces are not part of it. Anything
 * else is left exactly as given: an ordinary password may contain a space.
 */
export function appPassword(value: string): string {
  const v = value.trim()
  return /^[a-z]{4} [a-z]{4} [a-z]{4} [a-z]{4}$/i.test(v) ? v.replace(/ /g, '') : v
}

// -------------------------------------------------------------- addresses --

/** The bare address out of 'Name <address>', for the SMTP envelope. */
export function addressOf(mailbox: string): string {
  const angled = mailbox.match(/<([^<>]+)>/)
  return (angled ? angled[1] : mailbox).trim()
}

/** Whether a string is shaped like one address — the check a form can make. */
export function isEmailAddress(value: string): boolean {
  return /^[^@\s<>]+@[^@\s<>]+\.[^@\s<>]+$/.test(value.trim())
}

// -------------------------------------------------------------- encodings --

const encoder = new TextEncoder()

/** Standard base64 of any bytes — in Deno and in Node, through btoa. */
export function toBase64(bytes: Uint8Array): string {
  let binary = ''
  // In slices: String.fromCharCode over a whole PDF overflows the call stack.
  for (let i = 0; i < bytes.length; i += 0x2000) {
    binary += String.fromCharCode(...bytes.subarray(i, i + 0x2000))
  }
  return btoa(binary)
}

/** Base64 cut into the 76-character lines MIME asks for. */
export function base64Lines(bytes: Uint8Array): string {
  return (toBase64(bytes).match(/.{1,76}/g) ?? []).join('\r\n')
}

function isPlainAscii(value: string): boolean {
  return /^[\x20-\x7e]*$/.test(value)
}

/**
 * A header value, as RFC 2047 encoded-words when it needs to be.
 *
 * Plain ASCII passes through. Anything else — a student called Zoë, an em dash
 * in a subject — is base64 in words of at most 45 bytes (60 characters once
 * encoded, inside the 75 an encoded-word may be), cut between characters
 * rather than between bytes so no word carries half of one, and folded one to
 * a line.
 */
export function encodeHeader(value: string): string {
  if (isPlainAscii(value)) return value

  const words: string[] = []
  let chunk = ''
  for (const ch of value) {
    if (encoder.encode(chunk + ch).length > 45) {
      words.push(chunk)
      chunk = ''
    }
    chunk += ch
  }
  if (chunk) words.push(chunk)

  return words.map((w) => `=?UTF-8?B?${toBase64(encoder.encode(w))}?=`).join('\r\n ')
}

/** 'Name <address>' with the name made safe to put in a header. */
export function formatMailbox(mailbox: string): string {
  const angled = mailbox.match(/^(.*?)\s*<([^<>]+)>\s*$/)
  if (!angled) return mailbox.trim()
  const name = angled[1].trim().replace(/^"(.*)"$/, '$1')
  const address = angled[2].trim()
  if (!name) return address
  if (!isPlainAscii(name)) return `${encodeHeader(name)} <${address}>`
  // A comma or a dot in a bare display name changes how it parses.
  return /[()<>\[\]:;@\\,."]/.test(name)
    ? `"${name.replace(/(["\\])/g, '\\$1')}" <${address}>`
    : `${name} <${address}>`
}

/**
 * An attachment's name, in ASCII and without anything a header would choke on.
 * The PDF's name is built from the student's, and the client that receives it
 * may be anything.
 */
export function safeFilename(name: string): string {
  const cleaned = name
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .replace(/[—–]/g, '-')
    .replace(/[^\x20-\x7e]/g, '')
    .replace(/["\\/:*?<>|]/g, '')
    .replace(/\s+/g, ' ')
    .trim()
  return cleaned || 'attachment'
}

// ---------------------------------------------------------------- the MIME --

/** RFC 5322's date, in UTC like every other time in the product. */
export function mailDate(date: Date): string {
  const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  const pad = (n: number) => String(n).padStart(2, '0')
  return (
    `${days[date.getUTCDay()]}, ${pad(date.getUTCDate())} ${months[date.getUTCMonth()]} ` +
    `${date.getUTCFullYear()} ${pad(date.getUTCHours())}:${pad(date.getUTCMinutes())}:` +
    `${pad(date.getUTCSeconds())} +0000`
  )
}

function part(contentType: string, body: Uint8Array, extra: string[] = []): string {
  return [
    `Content-Type: ${contentType}`,
    'Content-Transfer-Encoding: base64',
    ...extra,
    '',
    base64Lines(body),
  ].join('\r\n')
}

function multipart(kind: string, boundary: string, parts: string[]): string {
  return [
    `Content-Type: multipart/${kind}; boundary="${boundary}"`,
    '',
    ...parts.map((p) => `--${boundary}\r\n${p}`),
    `--${boundary}--`,
  ].join('\r\n')
}

/**
 * The whole message, headers and body, CRLF throughout.
 *
 * Every part is base64, the text ones included. That costs a third in size and
 * buys two things that matter more: no line is ever longer than 76 characters,
 * and no line can begin with a dot — so a teacher's comment that opens with
 * "..." cannot end the SMTP DATA early, whatever it says.
 */
export function buildMime(
  message: MailMessage,
  meta: { messageId: string; date: Date; boundary: string },
): string {
  const alternative = multipart(`alternative`, `${meta.boundary}-alt`, [
    part('text/plain; charset=UTF-8', encoder.encode(message.text)),
    part('text/html; charset=UTF-8', encoder.encode(message.html)),
  ])

  const attachments = message.attachments ?? []
  const body =
    attachments.length === 0
      ? alternative
      : multipart('mixed', `${meta.boundary}-mix`, [
          alternative,
          ...attachments.map((a) => {
            const name = safeFilename(a.filename)
            return part(`${a.contentType}; name="${name}"`, a.content, [
              `Content-Disposition: attachment; filename="${name}"`,
            ])
          }),
        ])

  const headers = [
    `From: ${formatMailbox(message.from)}`,
    `To: ${message.to.map(formatMailbox).join(', ')}`,
    ...(message.replyTo ? [`Reply-To: ${formatMailbox(message.replyTo)}`] : []),
    `Subject: ${encodeHeader(message.subject)}`,
    `Date: ${mailDate(meta.date)}`,
    `Message-ID: <${meta.messageId}>`,
    'MIME-Version: 1.0',
  ]

  return `${headers.join('\r\n')}\r\n${body}\r\n`
}

/**
 * The message as SMTP's DATA wants it: any line that starts with a dot gets a
 * second one. buildMime never writes such a line, but the guard is what the
 * protocol asks for, and it costs nothing to keep.
 */
export function dotStuff(data: string): string {
  return data.replace(/(^|\r\n)\./g, '$1..')
}
