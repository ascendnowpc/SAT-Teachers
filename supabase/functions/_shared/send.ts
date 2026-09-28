import {
  addressOf,
  buildMime,
  dotStuff,
  safeFilename,
  toBase64,
  type MailMessage,
  type SmtpSettings,
  type Transport,
} from '../../../apps/web/src/lib/mail.ts'

/**
 * Sending a mail, one of two ways.
 *
 * SMTP is the way the platform is set up to use: an app password on the
 * sending account, and a conversation on port 465 — TLS from the first byte,
 * because Supabase's hosted functions may not open 25 or 587 and so cannot
 * STARTTLS at all. The client is small on purpose. It speaks the eight
 * commands a mail needs (greeting, EHLO, AUTH, MAIL, RCPT, DATA, the message,
 * QUIT) and nothing else, which is a smaller thing to trust than a Node mail
 * library running on Deno's Node shims inside the edge runtime. The message
 * itself is built by lib/mail.ts, where the suite checks it.
 *
 * Resend is the other way, kept because notify_pending_teacher has always
 * sent through it: one HTTPS call. Whichever the secrets describe is used —
 * see transportFrom — and neither is an error: every caller treats a mail it
 * could not send as a slower workflow, never as a failed one.
 */

const encoder = new TextEncoder()
const decoder = new TextDecoder()

export interface Sent {
  sent: boolean
  via?: 'smtp' | 'resend'
  /** Why not, in words a screen can show as they are. */
  reason?: string
}

class SmtpError extends Error {
  constructor(
    readonly code: number,
    readonly step: string,
    readonly said: string,
  ) {
    super(`${step}: the mail server answered ${code} ${said}`)
  }
}

/** CRLF lines off a connection, however the bytes happen to arrive. */
class Lines {
  #buffer = ''
  constructor(private readonly conn: Deno.Conn) {}

  async next(): Promise<string> {
    for (;;) {
      const at = this.#buffer.indexOf('\r\n')
      if (at >= 0) {
        const line = this.#buffer.slice(0, at)
        this.#buffer = this.#buffer.slice(at + 2)
        return line
      }
      const chunk = new Uint8Array(4096)
      const n = await this.conn.read(chunk)
      if (n === null) throw new Error('the mail server closed the connection')
      this.#buffer += decoder.decode(chunk.subarray(0, n), { stream: true })
    }
  }
}

async function writeAll(conn: Deno.Conn, text: string): Promise<void> {
  const bytes = encoder.encode(text)
  let written = 0
  while (written < bytes.length) written += await conn.write(bytes.subarray(written))
}

/** One reply, every line of it: "250-first", "250-second", "250 last". */
async function reply(lines: Lines): Promise<{ code: number; text: string[] }> {
  const text: string[] = []
  for (;;) {
    const line = await lines.next()
    text.push(line.slice(4))
    if (line[3] !== '-') return { code: Number(line.slice(0, 3)), text }
  }
}

/**
 * Hands one message to an SMTP server. Resolves once the server has accepted
 * it (250 after the DATA), and throws with the server's own words otherwise.
 */
export async function smtpSend(
  settings: SmtpSettings,
  envelope: { from: string; to: string[] },
  data: string,
  options: { caCerts?: string[]; timeoutMs?: number } = {},
): Promise<void> {
  const conn =
    settings.tls === 'implicit'
      ? await Deno.connectTls({ hostname: settings.host, port: settings.port, caCerts: options.caCerts })
      : await Deno.connect({ hostname: settings.host, port: settings.port })

  // A server that stops answering would otherwise hold the function until the
  // platform kills it, and take the whole response with it.
  let timedOut = false
  const timer = setTimeout(() => {
    timedOut = true
    try {
      conn.close()
    } catch {
      // closed already
    }
  }, options.timeoutMs ?? 30_000)

  const lines = new Lines(conn)
  const step = async (command: string | null, expect: number[], what: string) => {
    if (command !== null) await writeAll(conn, `${command}\r\n`)
    const r = await reply(lines)
    if (!expect.includes(r.code)) throw new SmtpError(r.code, what, r.text.join(' '))
    return r
  }

  try {
    await step(null, [220], 'greeting')
    const helo = addressOf(envelope.from).split('@')[1] || 'localhost'
    const ehlo = await step(`EHLO ${helo}`, [250], 'EHLO')

    if (settings.user) {
      const offered = ehlo.text.find((l) => /^AUTH\b/i.test(l)) ?? ''
      if (/\bLOGIN\b/i.test(offered) && !/\bPLAIN\b/i.test(offered)) {
        await step('AUTH LOGIN', [334], 'sign-in')
        await step(toBase64(encoder.encode(settings.user)), [334], 'sign-in')
        await step(toBase64(encoder.encode(settings.pass)), [235], 'sign-in')
      } else {
        const nul = String.fromCharCode(0)
        const token = toBase64(encoder.encode(`${nul}${settings.user}${nul}${settings.pass}`))
        await step(`AUTH PLAIN ${token}`, [235], 'sign-in')
      }
    }

    await step(`MAIL FROM:<${addressOf(envelope.from)}>`, [250], 'sender')
    for (const to of envelope.to) await step(`RCPT TO:<${addressOf(to)}>`, [250, 251], `recipient ${to}`)
    await step('DATA', [354], 'DATA')
    await writeAll(conn, `${dotStuff(data).replace(/(\r\n)+$/, '')}\r\n.\r\n`)
    await step(null, [250], 'the message')

    try {
      await step('QUIT', [221], 'QUIT')
    } catch {
      // The message is accepted; a server that hangs up rudely has still taken it.
    }
  } catch (e) {
    if (timedOut) throw new Error('the mail server stopped answering')
    throw e
  } finally {
    clearTimeout(timer)
    try {
      conn.close()
    } catch {
      // closed already
    }
  }
}

async function resendSend(key: string, message: MailMessage): Promise<void> {
  const response = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: { Authorization: `Bearer ${key}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({
      from: message.from,
      to: message.to,
      subject: message.subject,
      html: message.html,
      text: message.text,
      ...(message.replyTo ? { reply_to: message.replyTo } : {}),
      ...(message.attachments?.length
        ? {
            attachments: message.attachments.map((a) => ({
              filename: safeFilename(a.filename),
              content: toBase64(a.content),
            })),
          }
        : {}),
    }),
  })
  if (!response.ok) {
    throw new Error(`the mail provider refused it: ${response.status} ${await response.text()}`)
  }
}

/** What went wrong, for the person who has to fix it. */
function readable(e: unknown): string {
  if (e instanceof SmtpError) {
    if (e.step === 'sign-in' || e.code === 535 || e.code === 534) {
      return 'the mail server refused the sign-in — check SMTP_USER and SMTP_PASS (for Gmail, an app password, not the account password)'
    }
    return e.message
  }
  const message = e instanceof Error ? e.message : String(e)
  if (/refused|unreachable|timed out|dns|lookup/i.test(message)) {
    return `could not reach the mail server: ${message}`
  }
  return message
}

/**
 * Sends a message from whoever the transport sends as. Never throws: the
 * result says whether it went and, if not, why.
 */
export async function sendMail(transport: Transport, message: Omit<MailMessage, 'from'>): Promise<Sent> {
  if (transport.kind === 'none') return { sent: false, reason: transport.reason }

  const full: MailMessage = { ...message, from: transport.from }
  try {
    if (transport.kind === 'smtp') {
      const domain = addressOf(full.from).split('@')[1] || 'localhost'
      const data = buildMime(full, {
        messageId: `${crypto.randomUUID()}@${domain}`,
        date: new Date(),
        boundary: `=_ascend_${crypto.randomUUID()}`,
      })
      await smtpSend(transport.smtp, { from: full.from, to: full.to }, data)
      return { sent: true, via: 'smtp' }
    }
    await resendSend(transport.key, full)
    return { sent: true, via: 'resend' }
  } catch (e) {
    return { sent: false, via: transport.kind, reason: readable(e) }
  }
}
