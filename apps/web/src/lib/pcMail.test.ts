import { describe, expect, it } from 'vitest'
import { appBase, escapeHtml, inviteEmail, reportEmail } from './pcMail'

describe('inviteEmail', () => {
  const input = {
    name: 'Priya Rao',
    link: 'https://sat-teachers.vercel.app/join#token=abc',
    days: 7,
  }

  it('is a link to choose a password, and no password', () => {
    const mail = inviteEmail(input)
    expect(mail.subject).toBe('Your Ascend Now PC account')
    for (const body of [mail.html, mail.text]) {
      expect(body).toContain('https://sat-teachers.vercel.app/join#token=abc')
      expect(body).toContain('Hello Priya')
      expect(body).toMatch(/works once, for 7 days/)
      expect(body).not.toMatch(/password:/i)
    }
    expect(mail.html).toContain('Set up my account')
    expect(mail.text).toMatch(/Your email address is already filled in/)
  })

  it('says so when it is a new password rather than a new account', () => {
    const mail = inviteEmail({ ...input, joined: true })
    expect(mail.subject).toBe('Choose a new password for Ascend Now')
    expect(mail.text).toContain('Your current password keeps working until you do.')
    expect(mail.html).toContain('Choose a new password')
  })

  it('escapes what it did not write', () => {
    const mail = inviteEmail({ ...input, name: '<b>Priya</b> Rao', link: 'https://x.test/join#token=a&b' })
    expect(mail.html).not.toContain('<b>Priya</b>')
    expect(mail.html).toContain('href="https://x.test/join#token=a&amp;b"')
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
