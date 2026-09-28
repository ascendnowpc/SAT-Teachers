import { describe, expect, it } from 'vitest'
import {
  PASSWORD_ALPHABET,
  appBase,
  credentialsEmail,
  escapeHtml,
  reportEmail,
  temporaryPassword,
} from './pcMail'

describe('temporaryPassword', () => {
  it('is three groups of four', () => {
    for (let i = 0; i < 50; i++) {
      expect(temporaryPassword()).toMatch(/^[A-Za-z2-9]{4}-[A-Za-z2-9]{4}-[A-Za-z2-9]{4}$/)
    }
  })

  it('has none of the characters people misread', () => {
    for (let i = 0; i < 200; i++) expect(temporaryPassword()).not.toMatch(/[IlOo01]/)
  })

  // A project can require each of these of every password; GoTrue would refuse
  // to make the account otherwise.
  it('always has a lower-case letter, a capital, a digit and a symbol', () => {
    for (let i = 0; i < 200; i++) {
      const p = temporaryPassword()
      expect(p).toMatch(/[a-z]/)
      expect(p).toMatch(/[A-Z]/)
      expect(p).toMatch(/[0-9]/)
      expect(p).toMatch(/-/)
    }
  })

  it('draws again rather than bias the alphabet or drop a class', () => {
    const at = (c: string) => PASSWORD_ALPHABET.indexOf(c)
    // First draw: every byte above the cut-off, so none of it is usable. Then a
    // word of capitals only. Then one with every class — so it has to throw two
    // draws away before it can answer.
    const draws = [
      new Uint8Array(24).fill(255),
      new Uint8Array(24).fill(at('A')),
      Uint8Array.from({ length: 24 }, (_, i) => [at('A'), at('a'), at('2'), at('B')][i % 4]),
    ]
    let n = 0
    const p = temporaryPassword(() => {
      if (n >= draws.length) throw new Error('asked for more draws than the test has')
      return draws[n++]
    })
    expect(p).toBe('Aa2B-Aa2B-Aa2B')
    expect(n).toBe(3)
  })

  it('differs from one call to the next', () => {
    const seen = new Set(Array.from({ length: 100 }, () => temporaryPassword()))
    expect(seen.size).toBe(100)
  })
})

describe('credentialsEmail', () => {
  const input = {
    name: 'Priya Rao',
    email: 'priya@ascendnow.info',
    password: 'kP7m-Qx4n-Tz9c',
    appUrl: 'https://sat-teachers.vercel.app/',
  }

  it('gives the address, the password and where to sign in', () => {
    const mail = credentialsEmail(input)
    expect(mail.subject).toBe('Your Ascend Now PC account')
    for (const body of [mail.html, mail.text]) {
      expect(body).toContain('priya@ascendnow.info')
      expect(body).toContain('kP7m-Qx4n-Tz9c')
      expect(body).toContain('https://sat-teachers.vercel.app/login')
      expect(body).toContain('Hello Priya')
    }
    expect(mail.text).toMatch(/Change the password once you are in/)
  })

  it('says so when it is a new password rather than a new account', () => {
    const mail = credentialsEmail({ ...input, reset: true })
    expect(mail.subject).toBe('Your new password for Ascend Now')
    expect(mail.text).toContain('The old one no longer works.')
  })

  it('escapes what it did not write', () => {
    const mail = credentialsEmail({ ...input, name: '<b>Priya</b> Rao', password: 'a<b>c&d' })
    expect(mail.html).not.toContain('<b>Priya</b>')
    expect(mail.html).toContain('a&lt;b&gt;c&amp;d')
  })
})

describe('reportEmail', () => {
  const input = {
    pcName: 'Priya Rao',
    studentName: 'Amara Okonkwo',
    teacherName: 'Malya Rao',
    subjectLabel: 'English',
    when: '28 Sep 2026, 14:30 UTC',
    sessionId: 'sess-1',
    appUrl: 'https://sat-teachers.vercel.app',
    headline: '13 of 18 correct (72%) · 21m 30s on the questions',
    updated: false,
    attached: true,
  }

  it('names the student, the subject and the day', () => {
    expect(reportEmail(input).subject).toBe('Report: Amara Okonkwo — English, 28 Sep 2026')
  })

  it('says whose lesson it was, not who pressed the button', () => {
    expect(reportEmail(input).text).toContain(
      "The report on Amara Okonkwo's English session with Malya Rao on 28 Sep 2026, 14:30 UTC has been generated.",
    )
  })

  it('links the session and the report', () => {
    const mail = reportEmail(input)
    for (const body of [mail.html, mail.text]) {
      expect(body).toContain('https://sat-teachers.vercel.app/sessions/sess-1')
      expect(body).toContain('https://sat-teachers.vercel.app/sessions/sess-1/report')
      expect(body).toContain('13 of 18 correct (72%)')
    }
    expect(mail.text).toContain('The report is attached as a PDF.')
  })

  it('says a second one replaces the first', () => {
    const mail = reportEmail({ ...input, updated: true })
    expect(mail.subject).toMatch(/^Updated report: /)
    expect(mail.text).toContain('It replaces the one sent before.')
  })

  it('says when the PDF is not attached', () => {
    const mail = reportEmail({ ...input, attached: false, headline: null })
    expect(mail.text).toMatch(/could not be made this time/)
    expect(mail.html).not.toContain('font-weight:600">null')
  })

  it('escapes a name with markup in it', () => {
    const mail = reportEmail({ ...input, studentName: 'Amara <script>' })
    expect(mail.html).not.toContain('<script>')
    expect(mail.html).toContain('Amara &lt;script&gt;')
  })
})

describe('helpers', () => {
  it('escapes the five characters HTML cares about', () => {
    expect(escapeHtml(`<a href="x">'&'</a>`)).toBe('&lt;a href=&quot;x&quot;&gt;&#39;&amp;&#39;&lt;/a&gt;')
  })

  it('reads the app address, with a default', () => {
    expect(appBase('https://example.test/')).toBe('https://example.test')
    expect(appBase('')).toBe('https://sat-teachers.vercel.app')
    expect(appBase(undefined)).toBe('https://sat-teachers.vercel.app')
  })
})
