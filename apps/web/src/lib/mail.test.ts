import { describe, expect, it } from 'vitest'
import {
  addressOf,
  appPassword,
  base64Lines,
  buildMime,
  dotStuff,
  encodeHeader,
  formatMailbox,
  isEmailAddress,
  mailDate,
  safeFilename,
  toBase64,
  transportFrom,
} from './mail'

const env = (vars: Record<string, string>) => (key: string) => vars[key]

describe('transportFrom', () => {
  it('uses SMTP when its three secrets are set, on 465 with TLS from the start', () => {
    const t = transportFrom(env({ SMTP_HOST: 'smtp.gmail.com', SMTP_USER: 'pc@ascendnow.info', SMTP_PASS: 'secret' }))
    expect(t).toEqual({
      kind: 'smtp',
      smtp: { host: 'smtp.gmail.com', port: 465, tls: 'implicit', user: 'pc@ascendnow.info', pass: 'secret' },
      from: 'Ascend Now <pc@ascendnow.info>',
    })
  })

  it('takes a port, a sender and a local catcher when told', () => {
    const t = transportFrom(
      env({
        SMTP_HOST: 'mailpit',
        SMTP_PORT: '1025',
        SMTP_TLS: 'none',
        SMTP_USER: 'x',
        SMTP_PASS: 'y',
        MAIL_FROM: 'Ascend Now <no-reply@ascendnow.info>',
      }),
    )
    expect(t.kind === 'smtp' && t.smtp.port).toBe(1025)
    expect(t.kind === 'smtp' && t.smtp.tls).toBe('none')
    expect(t.kind === 'smtp' && t.from).toBe('Ascend Now <no-reply@ascendnow.info>')
  })

  it('prefers SMTP to Resend, and falls back to Resend without it', () => {
    const both = env({ SMTP_HOST: 'h', SMTP_USER: 'u', SMTP_PASS: 'p', RESEND_API_KEY: 're_1' })
    expect(transportFrom(both).kind).toBe('smtp')
    const resend = transportFrom(env({ RESEND_API_KEY: 're_1', SMTP_HOST: 'h' }))
    expect(resend).toEqual({ kind: 'resend', key: 're_1', from: 'Ascend Now <onboarding@resend.dev>' })
  })

  it('says what to set when there is nothing to send with', () => {
    const t = transportFrom(env({}))
    expect(t.kind).toBe('none')
    expect(t.kind === 'none' && t.reason).toMatch(/SMTP_HOST, SMTP_USER and SMTP_PASS/)
  })
})

describe('appPassword', () => {
  it('drops the spaces Google shows an app password with', () => {
    expect(appPassword('abcd efgh ijkl mnop')).toBe('abcdefghijklmnop')
    expect(appPassword('  ABCD efgh IJKL mnop ')).toBe('ABCDefghIJKLmnop')
  })

  it('leaves any other password exactly as it is', () => {
    expect(appPassword('correct horse battery staple')).toBe('correct horse battery staple')
    expect(appPassword('abcdefghijklmnop')).toBe('abcdefghijklmnop')
  })
})

describe('addresses', () => {
  it('finds the address in a mailbox', () => {
    expect(addressOf('Ascend Now <no-reply@ascendnow.info>')).toBe('no-reply@ascendnow.info')
    expect(addressOf(' pc@ascendnow.info ')).toBe('pc@ascendnow.info')
  })

  it('knows an address when it sees one', () => {
    expect(isEmailAddress('priya.rao@ascendnow.info')).toBe(true)
    expect(isEmailAddress('priya rao@ascendnow.info')).toBe(false)
    expect(isEmailAddress('priya@localhost')).toBe(false)
    expect(isEmailAddress('')).toBe(false)
  })

  it('quotes a display name that would otherwise parse as something else', () => {
    expect(formatMailbox('Ascend Now <a@b.co>')).toBe('Ascend Now <a@b.co>')
    expect(formatMailbox('Rao, Priya <a@b.co>')).toBe('"Rao, Priya" <a@b.co>')
    expect(formatMailbox('a@b.co')).toBe('a@b.co')
  })

  it('encodes a display name that is not ASCII', () => {
    expect(formatMailbox('Zoë Ng <z@b.co>')).toBe('=?UTF-8?B?Wm/DqyBOZw==?= <z@b.co>')
  })
})

describe('encodeHeader', () => {
  it('passes plain ASCII through', () => {
    expect(encodeHeader('Report: Amara Okonkwo')).toBe('Report: Amara Okonkwo')
  })

  it('writes anything else as encoded-words that decode back to it', () => {
    const subject = 'Report: Zoë Ng — English, 28 Sep 2026'
    const encoded = encodeHeader(subject)
    const words = encoded.split('\r\n ')
    for (const w of words) {
      expect(w).toMatch(/^=\?UTF-8\?B\?[A-Za-z0-9+/=]+\?=$/)
      expect(w.length).toBeLessThanOrEqual(75)
    }
    const decoded = words
      .map((w) => Buffer.from(w.slice(10, -2), 'base64').toString('utf8'))
      .join('')
    expect(decoded).toBe(subject)
  })

  it('never splits a character between two words', () => {
    const long = 'é'.repeat(60)
    for (const w of encodeHeader(long).split('\r\n ')) {
      expect(Buffer.from(w.slice(10, -2), 'base64').toString('utf8')).toMatch(/^é+$/)
    }
  })
})

describe('encodings', () => {
  it('base64s bytes the way everybody else does', () => {
    const bytes = new TextEncoder().encode('Ascend Now ✓')
    expect(toBase64(bytes)).toBe(Buffer.from(bytes).toString('base64'))
  })

  it('handles more than one slice of bytes', () => {
    const bytes = new Uint8Array(70_000).map((_, i) => i % 256)
    expect(toBase64(bytes)).toBe(Buffer.from(bytes).toString('base64'))
  })

  it('cuts base64 into 76-character lines', () => {
    const lines = base64Lines(new Uint8Array(200)).split('\r\n')
    expect(lines.slice(0, -1).every((l) => l.length === 76)).toBe(true)
    expect(lines[lines.length - 1].length).toBeLessThanOrEqual(76)
  })

  it('makes a filename any mail client will take', () => {
    expect(safeFilename('Report — Zoë Ng — 2026-09-28.pdf')).toBe('Report - Zoe Ng - 2026-09-28.pdf')
    expect(safeFilename('a/b:c*d?.pdf')).toBe('abcd.pdf')
    expect(safeFilename('日本')).toBe('attachment')
  })

  it('writes the date the way RFC 5322 does, in UTC', () => {
    expect(mailDate(new Date('2026-09-28T14:05:09Z'))).toBe('Mon, 28 Sep 2026 14:05:09 +0000')
  })

  it('doubles a leading dot for SMTP', () => {
    expect(dotStuff('.hidden\r\nplain\r\n..two')).toBe('..hidden\r\nplain\r\n...two')
  })
})

describe('buildMime', () => {
  const meta = { messageId: 'abc@ascendnow.info', date: new Date('2026-09-28T14:05:09Z'), boundary: '=_b' }
  const pdf = new TextEncoder().encode('%PDF-1.7 not really')

  function decodePart(mime: string, type: string): string {
    const at = mime.indexOf(`Content-Type: ${type}`)
    const body = mime.slice(mime.indexOf('\r\n\r\n', at) + 4)
    const b64 = body.slice(0, body.indexOf('\r\n--')).replace(/\r\n/g, '')
    return Buffer.from(b64, 'base64').toString('utf8')
  }

  it('has the headers a mail server and a mail client both need', () => {
    const mime = buildMime(
      { from: 'Ascend Now <no-reply@a.co>', to: ['p@a.co'], subject: 'Hi', html: '<p>Hi</p>', text: 'Hi' },
      meta,
    )
    expect(mime).toContain('From: Ascend Now <no-reply@a.co>\r\n')
    expect(mime).toContain('To: p@a.co\r\n')
    expect(mime).toContain('Subject: Hi\r\n')
    expect(mime).toContain('Date: Mon, 28 Sep 2026 14:05:09 +0000\r\n')
    expect(mime).toContain('Message-ID: <abc@ascendnow.info>\r\n')
    expect(mime).toContain('MIME-Version: 1.0\r\nContent-Type: multipart/alternative; boundary="=_b-alt"\r\n\r\n')
  })

  it('carries both the text and the HTML, exactly', () => {
    const html = '<p>Priya — the report is <b>attached</b>.</p>'
    const text = 'Priya — the report is attached.\n...and more'
    const mime = buildMime({ from: 'a@a.co', to: ['p@a.co'], subject: 'x', html, text }, meta)
    expect(decodePart(mime, 'text/plain')).toBe(text)
    expect(decodePart(mime, 'text/html')).toBe(html)
  })

  it('puts an attachment beside them, named safely', () => {
    const mime = buildMime(
      {
        from: 'a@a.co',
        to: ['p@a.co'],
        subject: 'x',
        html: 'h',
        text: 't',
        attachments: [{ filename: 'Report — Zoë.pdf', contentType: 'application/pdf', content: pdf }],
      },
      meta,
    )
    expect(mime).toContain('Content-Type: multipart/mixed; boundary="=_b-mix"')
    expect(mime).toContain('Content-Type: application/pdf; name="Report - Zoe.pdf"')
    expect(mime).toContain('Content-Disposition: attachment; filename="Report - Zoe.pdf"')
    expect(decodePart(mime, 'application/pdf')).toBe('%PDF-1.7 not really')
    expect(mime.trimEnd().endsWith('--=_b-mix--')).toBe(true)
  })

  it('never writes a line that SMTP would read as the end of the message', () => {
    const mime = buildMime(
      { from: 'a@a.co', to: ['p@a.co'], subject: 'x', html: '.\r\n.', text: '.\n.\n...' },
      meta,
    )
    for (const line of mime.split('\r\n')) {
      expect(line.startsWith('.')).toBe(false)
      expect(line.length).toBeLessThanOrEqual(998)
    }
  })
})
