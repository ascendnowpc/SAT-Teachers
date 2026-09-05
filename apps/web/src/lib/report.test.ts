import { describe, expect, it } from 'vitest'
import { buildReport, formatDuration, paceLabel } from './report'
import type { SessionItem } from './types'

/** Only the fields the report reads; the rest of SessionItem is irrelevant here. */
function item(over: {
  seq: number
  status?: SessionItem['status']
  section?: string
  skill?: string
  correct?: boolean
  seconds?: number | null
  target?: number | null
  diagnosis?: string | null
  asked?: number | null
}): SessionItem {
  const {
    seq,
    asked = null,
    status = 'revealed',
    section = 'craft_and_structure',
    skill = 'words_in_context',
    correct = true,
    seconds = 60,
    target = 75,
    diagnosis = null,
  } = over
  return {
    id: `i${seq}`,
    sequence_no: seq,
    asked_no: asked,
    status,
    selected_option: 'A',
    revealed_correct_option: correct ? 'A' : 'B',
    revealed_result: correct ? 'correct' : 'incorrect',
    student_reasoning: null,
    questions: { section, skill, difficulty: 'medium', stem: `Q${seq}`, target_seconds: target },
    session_item_assessments:
      seconds === null && diagnosis === null
        ? null
        : { is_correct: correct, elapsed_seconds: seconds, diagnosis, teacher_note: null },
  } as unknown as SessionItem
}

describe('buildReport', () => {
  it('numbers a session by when questions were asked, not where they sit', () => {
    // A level move: the third question was asked first and the first one second.
    const r = buildReport([
      item({ seq: 1, asked: 2 }),
      item({ seq: 3, asked: 1 }),
    ])
    expect(r.attempts.map((a) => a.sequence)).toEqual([1, 2])
    expect(r.attempts.map((a) => a.stem)).toEqual(['Q3', 'Q1'])
  })

  it('falls back to the questions\' own order when nothing moved', () => {
    const r = buildReport([item({ seq: 2 }), item({ seq: 1 })])
    expect(r.attempts.map((a) => a.sequence)).toEqual([1, 2])
  })

  it('counts only questions the student actually answered', () => {
    const r = buildReport([
      item({ seq: 1 }),
      item({ seq: 2, status: 'answered' }),
      item({ seq: 3, status: 'staged' }),
      item({ seq: 4, status: 'published' }),
    ])
    expect(r.total).toBe(2)
  })

  it('reports no accuracy at all rather than 0% when nothing was answered', () => {
    expect(buildReport([]).accuracy).toBeNull()
    expect(buildReport([item({ seq: 1, status: 'staged' })]).accuracy).toBeNull()
  })

  it('scores the session', () => {
    const r = buildReport([
      item({ seq: 1, correct: true }),
      item({ seq: 2, correct: false }),
      item({ seq: 3, correct: true }),
      item({ seq: 4, correct: true }),
    ])
    expect(r.correct).toBe(3)
    expect(r.accuracy).toBeCloseTo(0.75)
    expect(r.misses.map((m) => m.sequence)).toEqual([2])
  })

  it('puts the weakest skill first, since that is what the next session works on', () => {
    const r = buildReport([
      item({ seq: 1, skill: 'words_in_context', correct: true }),
      item({ seq: 2, skill: 'words_in_context', correct: true }),
      item({ seq: 3, skill: 'text_structure_and_purpose', correct: false }),
      item({ seq: 4, skill: 'text_structure_and_purpose', correct: true }),
    ])
    expect(r.skills.map((s) => s.key)).toEqual(['text_structure_and_purpose', 'words_in_context'])
  })

  it('breaks a tie on accuracy by how many questions back it up', () => {
    const r = buildReport([
      item({ seq: 1, skill: 'inferences', section: 'information_and_ideas', correct: false }),
      item({ seq: 2, skill: 'transitions', section: 'expression_of_ideas', correct: false }),
      item({ seq: 3, skill: 'transitions', section: 'expression_of_ideas', correct: false }),
    ])
    expect(r.skills[0].key).toBe('transitions')
  })

  // Fast and wrong is a different problem from slow and wrong, and the fix is
  // different too — this is the distinction the pace target exists for.
  it('flags a wrong answer given in under half the target time as rushed', () => {
    const r = buildReport([item({ seq: 1, correct: false, seconds: 30, target: 75 })])
    expect(r.rushed).toHaveLength(1)
  })

  it('does not call a correct fast answer rushed', () => {
    const r = buildReport([item({ seq: 1, correct: true, seconds: 20, target: 75 })])
    expect(r.rushed).toEqual([])
  })

  it('does not call a slow wrong answer rushed', () => {
    const r = buildReport([item({ seq: 1, correct: false, seconds: 70, target: 75 })])
    expect(r.rushed).toEqual([])
  })

  it('flags time sinks whether or not they landed', () => {
    const r = buildReport([
      item({ seq: 1, correct: true, seconds: 200, target: 75 }),
      item({ seq: 2, correct: false, seconds: 200, target: 75 }),
      item({ seq: 3, correct: true, seconds: 80, target: 75 }),
    ])
    expect(r.laboured.map((a) => a.sequence)).toEqual([1, 2])
  })

  it('leaves pace unjudged when the question has no target', () => {
    const r = buildReport([item({ seq: 1, correct: false, seconds: 5, target: null })])
    expect(r.rushed).toEqual([])
    expect(r.laboured).toEqual([])
    expect(r.paceDelta).toBeNull()
  })

  it('totals time against target so the whole session has a pace', () => {
    const r = buildReport([
      item({ seq: 1, seconds: 100, target: 75 }),
      item({ seq: 2, seconds: 50, target: 75 }),
    ])
    expect(r.seconds).toBe(150)
    expect(r.target).toBe(150)
    expect(r.paceDelta).toBe(0)
  })

  it('counts the diagnoses the teacher tapped, most common first', () => {
    const r = buildReport([
      item({ seq: 1, diagnosis: 'concept_gap', correct: false }),
      item({ seq: 2, diagnosis: 'solid_reasoning' }),
      item({ seq: 3, diagnosis: 'concept_gap', correct: false }),
    ])
    expect(r.diagnoses[0]).toEqual({ value: 'concept_gap', label: 'Concept gap', count: 2 })
  })

  it('falls back to the revealed result when no assessment row exists', () => {
    const r = buildReport([item({ seq: 1, correct: false, seconds: null, diagnosis: null })])
    expect(r.correct).toBe(0)
    expect(r.total).toBe(1)
  })
})

describe('formatDuration', () => {
  it('drops a leading zero minute', () => {
    expect(formatDuration(43)).toBe('43s')
    expect(formatDuration(103)).toBe('1m 43s')
    expect(formatDuration(0)).toBe('0s')
  })

  it('has nothing to show for no time', () => {
    expect(formatDuration(null)).toBe('—')
  })
})

describe('paceLabel', () => {
  it('calls a small gap on pace rather than inventing precision', () => {
    expect(paceLabel(72, 75)).toBe('on pace')
    expect(paceLabel(78, 75)).toBe('on pace')
  })

  it('names which side of the target it fell', () => {
    expect(paceLabel(30, 75)).toBe('45s under')
    expect(paceLabel(150, 75)).toBe('1m 15s over')
  })

  it('says nothing without a target to compare against', () => {
    expect(paceLabel(60, null)).toBeNull()
    expect(paceLabel(null, 75)).toBeNull()
  })
})
