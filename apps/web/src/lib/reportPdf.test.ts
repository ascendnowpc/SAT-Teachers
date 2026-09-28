import { describe, expect, it } from 'vitest'
import type { Extraction } from './extraction'
import { reportPdfDoc, winAnsi, wrapText, type ReportPdfInput } from './reportPdf'
import type { DomainNote, SessionItem, SessionReportRow } from './types'

function item(over: {
  seq: number
  correct?: boolean
  seconds?: number
  target?: number
  section?: string
  skill?: string
  difficulty?: string
  diagnosis?: string | null
  note?: string | null
  reasoning?: string | null
  confidence?: number | null
}): SessionItem {
  const {
    seq,
    correct = true,
    seconds = 60,
    target = 75,
    section = 'craft_and_structure',
    skill = 'words_in_context',
    difficulty = 'medium',
    diagnosis = null,
    note = null,
    reasoning = null,
    confidence = 2,
  } = over
  return {
    id: `i${seq}`,
    sequence_no: seq,
    asked_no: seq,
    status: 'revealed',
    selected_option: correct ? 'A' : 'C',
    revealed_correct_option: 'A',
    revealed_result: correct ? 'correct' : 'incorrect',
    student_reasoning: reasoning,
    student_confidence: confidence,
    questions: { section, skill, difficulty, stem: `Stem ${seq}`, target_seconds: target },
    session_item_assessments: { is_correct: correct, elapsed_seconds: seconds, diagnosis, teacher_note: note },
  } as unknown as SessionItem
}

const note = (domain: string, over: Partial<DomainNote> = {}): DomainNote => ({
  session_id: 's',
  domain,
  performance: 'tick',
  performance_note: null,
  strengths: `Strong on ${domain}`,
  gaps: `Gaps in ${domain}`,
  targets: null,
  ...over,
})

const meta = (over: Partial<SessionReportRow> = {}): SessionReportRow => ({
  session_id: 's',
  status: 'draft',
  time_management: null,
  engagement: null,
  practice_priority: null,
  summary: null,
  teacher_reflection: 'A steady first session.',
  form_submitted_at: '2026-09-28T15:00:00Z',
  form_submitted_by: null,
  generated_at: '2026-09-28T16:00:00Z',
  generated_by: null,
  published_at: null,
  ...over,
})

function input(over: Partial<ReportPdfInput> = {}): ReportPdfInput {
  return {
    session: {
      subject: 'english',
      title: null,
      scheduled_at: '2026-08-28T14:30:00Z',
      duration_mins: 60,
      teacher_notes: null,
      teacher: { full_name: 'Malya Rao' },
      student: { full_name: 'Amara Okonkwo', display_id: 'AMAO26-3', pc: 'Priya Rao' },
    },
    items: [
      item({ seq: 1 }),
      item({ seq: 2, correct: false, seconds: 20, diagnosis: 'careless_error', note: 'Did not reread.' }),
      item({ seq: 3, section: 'information_and_ideas', skill: 'inferences', seconds: 150, reasoning: 'I guessed' }),
    ],
    notes: [
      note('information_and_ideas'),
      note('craft_and_structure', { performance: 'cross', performance_note: 'rushed', targets: 'Read twice' }),
      note('expression_of_ideas'),
      note('standard_english_conventions'),
    ],
    meta: meta(),
    extraction: null,
    staleness: null,
    ...over,
  }
}

describe('reportPdfDoc', () => {
  it('heads the report as the page does, and names the PC', () => {
    const doc = reportPdfDoc(input())
    expect(doc.title).toBe('Amara Okonkwo — session report')
    expect(doc.subtitle).toBe('English · 28 Aug 2026, 14:30 UTC · with Malya Rao')
    expect(doc.status).toBe('Draft')
    expect(doc.people).toContainEqual({ label: 'PC', value: 'Priya Rao' })
    expect(doc.people).toContainEqual({ label: 'Student', value: 'Amara Okonkwo · AMAO26-3' })
    expect(doc.filename).toBe('Report - Amara Okonkwo - English - 2026-08-28')
    expect(doc.footer).toBe('Ascend Now · Amara Okonkwo · English · 28 Aug 2026, 14:30 UTC')
  })

  it('computes the numbers from the answers', () => {
    const doc = reportPdfDoc(input())
    expect(doc.stats.map((s) => s.value)).toEqual(['2/3', '3m 50s', '1m 17s', '1'])
    expect(doc.stats[0].note).toBe('67%')
    expect(doc.stats[3].note).toBe('1 rushed')
    expect(doc.headline).toBe('2 of 3 correct (67%) · 3m 50s on the questions')
  })

  it('prints the four domains of the form, in its order, as the teacher wrote them', () => {
    const doc = reportPdfDoc(input())
    expect(doc.domains.map((d) => d.label)).toEqual([
      'Information and Ideas',
      'Craft and Structure',
      'Expression of Ideas',
      'Standard English Conventions',
    ])
    const craft = doc.domains[1]
    expect(craft.measured).toBe('1/2 correct')
    expect(craft.marked).toBe('Teacher marked a cross — rushed')
    expect(craft.gaps).toBe('Gaps in craft_and_structure')
    expect(craft.targets).toEqual(['Read twice'])
    expect(craft.targetsNote).toBeNull()
    // Untouched targets are the form's, and it says so.
    expect(doc.domains[0].targetsNote).toMatch(/form’s own wording/)
    expect(doc.domains[2].measured).toBe('Not tested in this session')
  })

  it('reads a mathematics session against the mathematics four', () => {
    const doc = reportPdfDoc(input({ session: { ...input().session, subject: 'mathematics' }, notes: [] }))
    expect(doc.domains.map((d) => d.label)).toEqual([
      'Algebra',
      'Advanced Mathematics',
      'Problem-Solving and Data Analysis',
      'Geometry and Trigonometry',
    ])
  })

  it('carries the summary, the misses and every question', () => {
    const doc = reportPdfDoc(input({ meta: meta({ summary: 'Keep going.', engagement: 'Chatty.' }) }))
    expect(doc.summary.map((s) => s.label)).toEqual([
      'Time management',
      'Accuracy rate',
      'Engagement / confidence',
      'Recommended practice priority',
    ])
    expect(doc.summary[2].value).toBe('2.0 of 3')
    expect(doc.summary[2].notes).toContain('Chatty.')
    expect(doc.summary[3].value).toBe('Craft and Structure')
    expect(doc.summary[3].notes).toEqual(['the weakest domain in this session’s answers'])
    expect(doc.summaryNote).toBe('Keep going.')
    expect(doc.misses).toHaveLength(1)
    expect(doc.misses[0].head).toBe('Q2 · Medium · Words in Context · chose C, key A · 20s, rushed')
    expect(doc.misses[0].why).toBe('Careless error')
    expect(doc.misses[0].teacher).toBe('Did not reread.')
    expect(doc.questions.map((q) => q.answer)).toEqual(['A, right', 'C, key A', 'A, right'])
    expect(doc.showLevel).toBe(false)
    expect(doc.levelNote).toBe('Every question was from the medium paper.')
    expect(doc.pace).toEqual([
      'Rushed — question 2: 20s against a 1m 15s target, and wrong. Careless error',
      'Slow — question 3: 2m 30s against a 1m 15s target, and right.',
    ])
  })

  it('says when there is nothing answered, rather than printing zeros', () => {
    const doc = reportPdfDoc(input({ items: [] }))
    expect(doc.empty).toBe(true)
    expect(doc.stats).toEqual([])
    expect(doc.headline).toBeNull()
  })

  it('says published when it is', () => {
    expect(reportPdfDoc(input({ meta: meta({ status: 'published' }) })).status).toBe('Published')
  })

  describe('the recording', () => {
    const evidence = { quote: 'I did not know that word', at: 125, speaker: 'student' as const, relabelled: false, fromMargin: false, fromReview: true }
    const reading: Extraction = {
      questions: [
        {
          itemId: 'i2',
          covered: true,
          studentReasoning: null,
          misunderstanding: { text: 'Read the stem too fast', evidence },
          vocabularyGap: null,
          teacherFeedback: [],
        },
      ],
      session: {
        closingVerdict: null,
        teacherStatedScore: null,
        studentSelfReport: null,
        domainEvidence: [
          { domain: 'craft_and_structure', relation: 'complicates', text: 'Seemed sure of the word', evidence },
        ],
      },
    }

    it('shows its findings, each with the words it came from', () => {
      const doc = reportPdfDoc(input({ extraction: reading }))
      expect(doc.recordingNote).toBeNull()
      expect(doc.domains[1].evidence).toEqual([
        {
          label: 'Sits awkwardly',
          text: 'Seemed sure of the word',
          quote: 'I did not know that word',
          cite: 'student at 2:05 · from the end-of-lesson review',
        },
      ])
      expect(doc.conflicts).toHaveLength(1)
      // Q3's reasoning was typed on the question, not quoted from the
      // recording, so it is not a finding; Q1 has nothing at all.
      expect(doc.findings?.questions.map((q) => q.head)).toEqual(['Q2 · Missed · chose C, key A · rushed'])
      expect(doc.findings?.questions[0].teacherNote).toBe('Did not reread.')
      expect(doc.findings?.questions[0].claims.map((c) => c.label)).toEqual(['What went wrong'])
      expect(doc.findings?.unsaid).toBe('Nothing was said, and nothing was written, about Q1, Q3.')
    })

    it('leaves out a reading of another transcript or another form, and says why', () => {
      const doc = reportPdfDoc(input({ extraction: reading, staleness: 'form' }))
      expect(doc.findings).toBeNull()
      expect(doc.conflicts).toEqual([])
      expect(doc.domains[1].evidence).toBeNull()
      expect(doc.recordingNote).toMatch(/^The diagnostic form was handed in again/)
    })

    it('says when it was never read', () => {
      expect(reportPdfDoc(input()).recordingNote).toMatch(/has not been read/)
    })
  })
})

describe('winAnsi', () => {
  it('keeps what the fonts can draw, typography included', () => {
    const text = 'Amara’s “best” session — 72% · café … €5'
    expect(winAnsi(text)).toBe(text)
  })

  it('writes out what they cannot', () => {
    expect(winAnsi('B → C ✓ ≤ 5 − 2 √x π')).toBe('B -> C (tick) <= 5 - 2 sqrtx pi')
  })

  it('takes accents off letters outside the set, and marks the rest', () => {
    // ę and ő come apart into a letter and an accent; Ł, ł and 日 do not.
    expect(winAnsi('Łukasz Wałęsa ő 日本')).toBe('?ukasz Wa?esa o ??')
  })

  it('drops invisible characters and turns odd spaces into spaces', () => {
    expect(winAnsi('a\u200bb\u2009c\td')).toBe('ab c    d')
  })
})

describe('wrapText', () => {
  const measure = (s: string) => s.length

  it('fills lines word by word', () => {
    expect(wrapText('the quick brown fox jumps', 10, measure)).toEqual(['the quick', 'brown fox', 'jumps'])
  })

  it('keeps paragraphs and blank lines', () => {
    expect(wrapText('one\n\ntwo', 10, measure)).toEqual(['one', '', 'two'])
  })

  it('cuts a word that is wider than the line, and loses nothing', () => {
    const lines = wrapText('see https://example.com/a/very/long/path', 10, measure)
    expect(lines.every((l) => l.length <= 10)).toBe(true)
    expect(lines.join('')).toBe('seehttps://example.com/a/very/long/path')
  })
})
