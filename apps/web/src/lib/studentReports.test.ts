import { describe, expect, it } from 'vitest'
import { subjectLabel } from './constants'
import { defaultConfig, progressLines, type ProgressItem, type StudentProgress } from './progress'
import { reportPdfDoc } from './reportPdf'
import {
  docFromBundle,
  filterReports,
  forTheFamily,
  reportKindLabel,
  reportTitle,
  scoreTone,
  type LessonBundle,
  type StudentReportEntry,
  type TargetedBundle,
} from './studentReports'
import { targetedDocFrom } from './targetedReport'
import type { SessionItem } from './types'

const S = 'expression_of_ideas'
const K = 'transitions'

function item(n: number, sessionId: string, correct: boolean, words = 'A short passage.'): SessionItem {
  return {
    id: `${sessionId}-i${n}`,
    session_id: sessionId,
    question_id: `${sessionId}-q${n}`,
    sequence_no: n,
    asked_no: n,
    status: 'revealed',
    selected_option: correct ? 'A' : 'B',
    revealed_result: correct ? 'correct' : 'incorrect',
    revealed_correct_option: 'A',
    student_reasoning: null,
    student_confidence: 2,
    time_limit_seconds: 60,
    questions: { id: `${sessionId}-q${n}`, section: S, skill: K, difficulty: 'medium', passage: words, stem: 'Which?', target_seconds: 60 },
    session_item_assessments: { is_correct: correct, elapsed_seconds: 40, timed_out: false, skipped: false, diagnosis: null, teacher_note: null },
  } as unknown as SessionItem
}

const pItem = (i: SessionItem): ProgressItem => ({
  session_id: i.session_id,
  question_id: i.question_id,
  section: S,
  skill: K,
  difficulty: 'medium',
  status: 'revealed',
  is_correct: i.session_item_assessments?.is_correct ?? null,
  timed_out: false,
  elapsed_seconds: 40,
  time_limit_seconds: 60,
  target_seconds: 60,
})

const session = {
  subject: 'english' as const,
  title: null,
  mode: 'targeted' as const,
  scheduled_at: '2026-10-20T09:00:00Z',
  started_at: '2026-10-20T09:05:00Z',
  duration_mins: 30,
  teacher_notes: null,
  teacher: { full_name: 'Malya Rao' },
  student: { full_name: 'Rae Reports', display_id: 'RAER26-6', pc: 'Pat Reports' },
}

// A diagnostic with 1 of 2 on the skill, then a targeted test with 3 of 4.
const diag = [item(1, 'd', true), item(2, 'd', false)]
const test = [item(1, 't', true), item(2, 't', true), item(3, 't', true), item(4, 't', false)]
const progress: StudentProgress = {
  sessions: [
    { id: 'd', mode: 'diagnostic', status: 'completed', at: '2026-10-01T09:00:00Z', teacher: null },
    { id: 't', mode: 'targeted', status: 'completed', at: '2026-10-20T09:05:00Z', teacher: null },
  ],
  targeted: [{ session_id: 't', section: S, skill: K, set_size: 4, set_count: 4, question_seconds: 60, overall_seconds: 600 }],
  items: [...diag, ...test].map(pItem),
  config: defaultConfig('english'),
  summaries: [],
  overrides: [],
}

const targeted: TargetedBundle = {
  kind: 'targeted',
  session: { ...session, id: 't' },
  items: test,
  progress,
  test: { section: S, skill: K, set_size: 4, question_seconds: 60, overall_seconds: 600 },
  set_count: 4,
  questions: test.map((i) => ({
    id: i.question_id,
    difficulty: 'medium' as const,
    passage: 'A short passage.',
    passage_underline: null,
    stem: 'Which?',
    image_url: null,
    target_seconds: 60,
  })),
}

describe('docFromBundle — a targeted test', () => {
  const doc = docFromBundle(targeted)

  it('is the PC’s report: its kicker, score and headline', () => {
    expect(doc.kicker).toBe('TARGETED TEST')
    expect(doc.title).toBe('Rae Reports — Transitions')
    expect(doc.stats[0]).toMatchObject({ value: '3/4', label: 'Right of reached' })
    expect(doc.headline).toContain('3 of 4 right on Transitions')
  })

  it('draws the line on the skill from the diagnostic to the test', () => {
    const line = doc.extra?.find((x) => x.heading === 'Progress on Transitions')
    expect(line?.lines.length).toBeGreaterThan(0)
    expect(line?.lines.join(' ')).toMatch(/1 of 2/)
    expect(line?.lines.join(' ')).toMatch(/3 of 4/)
  })

  it('is exactly what targetedDocFrom draws for the PC', () => {
    expect(doc).toEqual(
      targetedDocFrom({
        session: targeted.session,
        test: targeted.test,
        setCount: 4,
        items: test,
        progress,
        questions: targeted.questions,
      }),
    )
  })
})

describe('docFromBundle — a lesson', () => {
  const lesson: LessonBundle = {
    kind: 'lesson',
    session: { ...session, id: 'd', mode: 'diagnostic', teacher_notes: 'Reads closely.' },
    items: diag,
    progress,
    notes: [],
    meta: {
      session_id: 'd',
      status: 'published',
      time_management: null,
      engagement: null,
      practice_priority: null,
      summary: 'A good start.',
      teacher_reflection: 'Steady.',
      form_submitted_at: '2026-10-01T10:00:00Z',
      form_submitted_by: null,
      generated_at: '2026-10-01T11:00:00Z',
      generated_by: null,
      published_at: '2026-10-01T12:00:00Z',
    },
    transcript_at: null,
    reading: null,
  }

  it('is the lesson report, with the teacher’s words and the Progress section', () => {
    const doc = docFromBundle(lesson)
    expect(doc.status).toBe('Published')
    expect(doc.stats[0]).toMatchObject({ value: '1/2', label: 'Correct' })
    expect(doc.reflection).toBe('Steady.')
    expect(doc.summaryNote).toBe('A good start.')
    expect(doc.teacherRead).toBe('Reads closely.')
    expect(doc.extra?.[0]?.heading).toBe('Progress')
  })

  it('leaves a reading of an older transcript out, as the page does', () => {
    const stale = docFromBundle({
      ...lesson,
      transcript_at: '2026-10-01T10:30:00Z',
      reading: { body: { questions: [], domains: [] } as never, created_at: '2026-10-01T10:15:00Z' },
    })
    expect(stale.findings).toBeNull()
    expect(stale.recordingNote).toMatch(/transcript was changed/)
    // The PC's copy, with the staleness worked out by hand.
    expect(stale).toEqual(
      reportPdfDoc({
        session: lesson.session,
        items: diag,
        notes: [],
        meta: lesson.meta,
        extraction: { questions: [], domains: [] } as never,
        staleness: 'transcript',
        progress: progressLines(progress),
      }),
    )
  })
})

describe('forTheFamily', () => {
  it('drops the note to the teacher and nothing else', () => {
    const doc = docFromBundle(targeted)
    const withConflict = { ...doc, conflicts: [{ label: 'Sits awkwardly', text: 't', quote: 'q', cite: 'c' }] }
    expect(forTheFamily(withConflict)).toEqual({ ...doc, conflicts: [] })
  })
})

const entry = (over: Partial<StudentReportEntry>): StudentReportEntry => ({
  session_id: 's',
  kind: 'lesson',
  mode: 'diagnostic',
  subject: 'english',
  title: null,
  at: '2026-10-01T09:00:00Z',
  ready_at: null,
  published: true,
  teacher: 'Malya Rao',
  section: null,
  skill: null,
  skills: null,
  right: 3,
  of: 4,
  ...over,
})

describe('naming and sorting the list', () => {
  it('names each report as the family would', () => {
    expect(reportTitle(entry({}))).toBe('English diagnostic')
    expect(reportTitle(entry({ mode: 'live', subject: 'mathematics' }))).toBe(`${subjectLabel('mathematics')} lesson`)
    expect(reportTitle(entry({ kind: 'targeted', mode: 'targeted', section: S, skill: K }))).toBe('Transitions')
    expect(reportTitle(entry({ title: 'Mock week' }))).toBe('Mock week')
    expect(reportKindLabel(entry({}))).toBe('Diagnostic report')
    expect(reportKindLabel(entry({ mode: 'live' }))).toBe('Lesson report')
    expect(reportKindLabel(entry({ kind: 'targeted', mode: 'targeted' }))).toBe('Targeted test')
  })

  it('filters by kind and subject', () => {
    const list = [
      entry({ session_id: 'a' }),
      entry({ session_id: 'b', kind: 'targeted', mode: 'targeted' }),
      entry({ session_id: 'c', subject: 'mathematics' }),
    ]
    expect(filterReports(list, 'all', 'all').map((e) => e.session_id)).toEqual(['a', 'b', 'c'])
    expect(filterReports(list, 'targeted', 'all').map((e) => e.session_id)).toEqual(['b'])
    expect(filterReports(list, 'lesson', 'mathematics').map((e) => e.session_id)).toEqual(['c'])
  })

  it('tones a score green at three quarters, amber at half, red below, and none without one', () => {
    expect(scoreTone(3, 4)).toBe('good')
    expect(scoreTone(2, 4)).toBe('mid')
    expect(scoreTone(1, 4)).toBe('low')
    expect(scoreTone(0, 0)).toBeNull()
    expect(scoreTone(null, null)).toBeNull()
  })
})
