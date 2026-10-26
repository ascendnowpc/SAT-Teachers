import { describe, expect, it } from 'vitest'
import { defaultConfig } from './progress'
import { targetedPdfDoc, targetedRows, type TargetedReportInput } from './targetedReport'
import type { Difficulty, ItemStatus, SessionItem } from './types'

function item(
  n: number,
  status: ItemStatus,
  extra: {
    correct?: boolean
    timedOut?: boolean
    chose?: 'A' | 'B' | null
    seconds?: number
    level?: Difficulty
  } = {},
): SessionItem {
  return {
    id: `i${n}`,
    session_id: 's1',
    question_id: `q${n}`,
    student_id: 'st',
    sequence_no: n,
    asked_no: n,
    status,
    published_at: null,
    first_viewed_at: null,
    decided_at: null,
    answered_at: null,
    revealed_at: null,
    selected_option: extra.chose ?? null,
    eliminated_options: [],
    marked_for_review: false,
    student_confidence: null,
    student_reasoning: null,
    revealed_result: null,
    revealed_correct_option: null,
    revealed_explanation: null,
    time_limit_seconds: 60,
    questions: {
      id: `q${n}`,
      created_by: null,
      subject: 'english',
      section: 'expression_of_ideas',
      skill: 'transitions',
      passage: 'A short passage.',
      passage_underline: null,
      image_url: null,
      source_ref: 'SECRET-REF',
      stem: 'Which choice?',
      difficulty: extra.level ?? 'medium',
      difficulty_rationale: null,
      target_seconds: 60,
      status: 'published',
      created_at: '2026-10-01T00:00:00Z',
      question_options: [],
      question_keys: null,
    },
    session_item_assessments:
      status === 'answered' || status === 'revealed'
        ? {
            session_item_id: `i${n}`,
            is_correct: extra.correct ?? false,
            elapsed_seconds: extra.seconds ?? 40,
            diagnosis: null,
            teacher_note: null,
            timed_out: extra.timedOut ?? false,
          }
        : null,
  }
}

const items = [
  item(1, 'revealed', { correct: true, chose: 'A', seconds: 30, level: 'easy' }),
  item(2, 'revealed', { correct: false, chose: 'B', seconds: 50 }),
  item(3, 'revealed', { timedOut: true, seconds: 60, level: 'hard' }),
  item(4, 'voided'),
]

const input: TargetedReportInput = {
  session: {
    subject: 'english',
    title: 'Transitions',
    scheduled_at: '2026-10-20T09:00:00Z',
    started_at: '2026-10-20T09:05:00Z',
    teacher: { full_name: 'Malya Rao' },
    student: { full_name: 'Tia Targeted', display_id: 'TIAT26-4', pc: 'Pat Progress' },
  },
  test: {
    section: 'expression_of_ideas',
    skill: 'transitions',
    set_size: 5,
    question_seconds: 60,
    overall_seconds: 600,
  },
  setCount: 5,
  items,
  config: defaultConfig('english'),
  line: null,
  pattern: null,
}

describe('targetedRows', () => {
  it('reads each question met: right, wrong, timed out, and set aside as not reached', () => {
    expect(targetedRows(items).map((r) => [r.outcome, r.answer])).toEqual([
      ['right', 'A'],
      ['wrong', 'B'],
      ['timed out', '—'],
      ['not reached', '—'],
    ])
  })
})

describe('targetedPdfDoc', () => {
  const doc = targetedPdfDoc(input)

  it('is a targeted test, computed, with its own heading', () => {
    expect(doc.kicker).toBe('TARGETED TEST')
    expect(doc.status).toBe('Computed')
    expect(doc.title).toBe('Tia Targeted — Transitions')
    expect(doc.filename).toBe('Targeted test - Tia Targeted - Transitions - 2026-10-20')
  })

  it('scores over what was reached and counts the rest as not reached', () => {
    expect(doc.stats.map((s) => s.value)).toEqual(['1/3', '3.3/10', '27', '1', '2'])
    expect(doc.headline).toBe('1 of 3 right on Transitions — 3.3/10, level score 27')
  })

  it('has no diagnostic summary, form or recording — only what the answers say', () => {
    expect(doc.summary).toEqual([])
    expect(doc.domains).toEqual([])
    expect(doc.findings).toBeNull()
    expect(doc.extra?.[0].heading).toBe('What the answers say')
    expect(doc.extra?.[0].lines[0]).toBe(
      '1 of 3 right, 2 not reached — 3.3 out of 10, level score 27.',
    )
  })

  it('prints no source reference and no key', () => {
    const text = JSON.stringify(doc)
    expect(text).not.toContain('SECRET-REF')
  })
})
