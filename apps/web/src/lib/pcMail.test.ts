import { describe, expect, it } from 'vitest'
import { appBase, escapeHtml, inviteEmail, parentReportEmail, reportEmail, retentionNoticeEmail } from './pcMail'

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

describe('reportEmail for a targeted test', () => {
  it('says it is a targeted test, not a generated report', () => {
    const mail = reportEmail({
      pcName: 'Pat Progress',
      studentName: 'Tia Targeted',
      teacherName: 'Malya Rao',
      subjectLabel: 'English',
      when: '20 Oct 2026, 09:05 UTC',
      sessionId: 's1',
      appUrl: 'https://sat-teachers.vercel.app',
      headline: '3 of 5 right on Transitions',
      updated: false,
      attached: true,
      targeted: true,
    })
    expect(mail.subject).toBe('Targeted test: Tia Targeted — English, 20 Oct 2026')
    expect(mail.text).toContain("Tia Targeted's English targeted test, set by Malya Rao")
    expect(mail.text).not.toContain('generated')
  })
})

describe('the parent’s progress report (0103)', () => {
  const mail = parentReportEmail({
    studentName: 'Amarra Test',
    pcName: 'Priya Coach',
    parentName: 'Dana Test',
    note: 'Two more sessions on percentages.\nSee you Thursday.',
    headlines: ['Math: Algebra improved from 24 to 40 over 4 sessions.'],
    attached: true,
  })

  it('leads with the PC’s note and each subject’s headline, and has the PDF', () => {
    expect(mail.subject).toBe('Amarra Test: SAT progress by section')
    expect(mail.text.split('\n').slice(0, 4)).toEqual(['Hello Dana,', '', 'Two more sessions on percentages.', 'See you Thursday.'])
    expect(mail.text).toContain('Math: Algebra improved from 24 to 40 over 4 sessions.')
    expect(mail.text).toContain('attached as a PDF')
    expect(mail.html).toContain('Two more sessions on percentages.<br>See you Thursday.')
  })

  it('never predicts a score, and links nothing a parent cannot open', () => {
    expect(mail.text).toContain('not a predicted SAT score')
    expect(mail.html).not.toContain('href=')
  })

  it('escapes what a person typed', () => {
    const m = parentReportEmail({ studentName: 'A <b>', pcName: 'P', parentName: null, note: '<script>', headlines: [], attached: false })
    expect(m.html).not.toContain('<script>')
    expect(m.html).toContain('&lt;script&gt;')
    expect(m.text).toContain('Hello,')
    expect(m.text).toContain('could not be attached')
  })
})

describe('retentionNoticeEmail', () => {
  const mail = retentionNoticeEmail({
    studentName: 'Amarra <Test>',
    displayId: '0067',
    toName: 'Priya Coach',
    lastActive: '2026-09-25',
    deleteOn: '2026-12-08',
    days: 60,
    base: 'https://sat-teachers.vercel.app',
    studentId: 'abc-123',
  })

  it('says who, since when, and the day they go', () => {
    expect(mail.subject).toBe("Keep Amarra <Test>'s account?")
    expect(mail.text).toContain('Amarra <Test> (0067) has had no check-in or session for 60 days — the last was on 25 Sep 2026.')
    expect(mail.text).toContain('it will be deleted on 8 Dec 2026')
    expect(mail.text).toContain('Their reports are saved as PDFs first.')
  })

  it('both buttons open My students, for that student', () => {
    expect(mail.text).toContain('https://sat-teachers.vercel.app/students?retention=keep&student=abc-123')
    expect(mail.text).toContain('https://sat-teachers.vercel.app/students?retention=delete&student=abc-123')
  })

  it('escapes the name in the HTML', () => {
    expect(mail.html).toContain('Amarra &lt;Test&gt;')
    expect(mail.html).not.toContain('<Test>')
  })
})
