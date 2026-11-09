import { describe, expect, it } from 'vitest'
import { defaultConfig } from './progress'
import {
  resultBySkill,
  targetedPdfDoc,
  targetedRows,
  testName,
  type TargetedReportInput,
} from './targetedReport'
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
  lines: [],
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
    // Right of reached, raw, level, skipped (0072), timed out, not reached.
    expect(doc.stats.map((s) => s.value)).toEqual(['1/3', '3.3/10', '27', '0', '1', '2'])
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

/* ------------------------------------------------ several skills (0086) --- */

describe('a test on several skills', () => {
  const on = (skill: string, seq: number, correct: boolean | null) => {
    const i = item(seq, correct === null ? 'voided' : 'revealed', { correct: correct ?? false })
    return { ...i, questions: { ...i.questions!, skill } }
  }
  const sat = [
    on('transitions', 1, true),
    on('boundaries', 2, false),
    on('transitions', 3, true),
    on('boundaries', 4, null),
  ]
  const several = {
    ...input,
    test: { ...input.test, section: null, skill: null, skills: ['transitions', 'boundaries'] },
    setCount: 4,
    setBySkill: { transitions: 2, boundaries: 2 },
    items: sat,
  }

  it('is named by its skills', () => {
    expect(testName(several.test)).toBe('Transitions and Boundaries')
    expect(testName({ section: 'craft_and_structure', skill: null, skills: null })).toBe(
      'Craft and Structure (the whole section)',
    )
  })

  it('is read skill by skill, against each skill’s share of the set', () => {
    expect(resultBySkill(several.test, sat, several.setBySkill)).toEqual([
      { skill: 'transitions', correct: 2, reached: 2, notReached: 0 },
      { skill: 'boundaries', correct: 0, reached: 1, notReached: 1 },
    ])
    expect(resultBySkill(input.test, items, null)).toEqual([])
  })

  it('prints a section skill by skill, and each question’s own skill', () => {
    const doc = targetedPdfDoc(several)
    expect(doc.title).toBe('Tia Targeted — Transitions and Boundaries')
    expect(doc.extra?.[0]).toEqual({
      heading: 'Skill by skill',
      lines: ['Transitions: 2 of 2 right.', 'Boundaries: 0 of 1 right, 1 not reached.'],
    })
    expect(doc.questions.map((x) => x.skill)).toEqual([
      'Transitions',
      'Boundaries',
      'Transitions',
      'Boundaries',
    ])
  })

  it('prints the line on each skill under its own heading', () => {
    const line = (skill: string) => ({
      section: 'expression_of_ideas',
      skill,
      points: [],
      sinceLast: 0,
      hint: null,
      summary: null,
    })
    const doc = targetedPdfDoc({
      ...several,
      lines: [
        { line: line('transitions'), pattern: null },
        { line: line('boundaries'), pattern: null },
      ],
    })
    expect(doc.extra?.map((e) => e.heading)).toEqual([
      'Skill by skill',
      'What the answers say',
      'Progress on Transitions',
      'Progress on Boundaries',
    ])
  })
})
