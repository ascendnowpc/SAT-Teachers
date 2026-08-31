import { describe, expect, it } from 'vitest'
import { buildGrid, confidenceAverage, performanceOf, recommendedPriority, timeManagement } from './grid'
import { buildReport } from './report'
import type { SessionItem } from './types'

function item(seq: number, section: string, skill: string, correct: boolean, secs = 60, target = 75) {
  return {
    id: `i${seq}`,
    sequence_no: seq,
    status: 'revealed',
    selected_option: 'A',
    revealed_correct_option: correct ? 'A' : 'B',
    revealed_result: correct ? 'correct' : 'incorrect',
    student_reasoning: null,
    questions: { section, skill, difficulty: 'medium', stem: '', target_seconds: target },
    session_item_assessments: { is_correct: correct, elapsed_seconds: secs, diagnosis: null, teacher_note: null },
  } as unknown as SessionItem
}

describe('performanceOf', () => {
  it('ticks only a clean sweep', () => {
    expect(performanceOf(3, 3)).toBe('tick')
  })
  it('crosses only when nothing landed', () => {
    expect(performanceOf(0, 3)).toBe('cross')
  })
  it('calls the in-between mixed rather than rounding it to a verdict', () => {
    expect(performanceOf(2, 3)).toBe('mixed')
    expect(performanceOf(1, 3)).toBe('mixed')
  })
  it('has no verdict for a domain the session never tested', () => {
    expect(performanceOf(0, 0)).toBe('untested')
  })
})

describe('buildGrid', () => {
  const report = buildReport([
    item(1, 'information_and_ideas', 'inferences', false),
    item(2, 'information_and_ideas', 'inferences', true),
    item(3, 'craft_and_structure', 'words_in_context', true),
  ])

  it('always has all four domains, tested or not', () => {
    // The order the paper form prints them in, which is not the order the
    // section constant happens to list.
    expect(buildGrid(report, []).map((r) => r.domain)).toEqual([
      'information_and_ideas',
      'craft_and_structure',
      'expression_of_ideas',
      'standard_english_conventions',
    ])
  })

  it('carries the form’s own skill focus and targets', () => {
    const row = buildGrid(report, [])[0]
    expect(row.skillFocus).toContain('Central Ideas & Details')
    expect(row.targets).toContain('Review inference questions (implied vs stated).')
  })

  it('scores each domain from the answers', () => {
    const row = buildGrid(report, []).find((r) => r.domain === 'information_and_ideas')!
    expect([row.correct, row.total, row.performance]).toEqual([1, 2, 'mixed'])
  })

  it('leaves an untested domain empty rather than scoring it zero', () => {
    const row = buildGrid(report, []).find((r) => r.domain === 'expression_of_ideas')!
    expect([row.total, row.performance]).toEqual([0, 'untested'])
  })

  it('shows only the skills the session actually reached', () => {
    const row = buildGrid(report, []).find((r) => r.domain === 'information_and_ideas')!
    expect(row.skills.map((s) => s.key)).toEqual(['inferences'])
  })

  it('attaches the teacher’s written columns to their domain', () => {
    const rows = buildGrid(report, [
      { domain: 'craft_and_structure', strengths: 'Eliminates well.', gaps: null },
    ])
    const cs = rows.find((r) => r.domain === 'craft_and_structure')!
    expect(cs.strengths).toBe('Eliminates well.')
    expect(cs.gaps).toBeNull()
    expect(rows.find((r) => r.domain === 'information_and_ideas')!.strengths).toBeNull()
  })
})

describe('recommendedPriority', () => {
  it('circles the weakest tested domain', () => {
    const r = buildReport([
      item(1, 'information_and_ideas', 'inferences', false),
      item(2, 'craft_and_structure', 'words_in_context', true),
    ])
    expect(recommendedPriority(r)).toBe('information_and_ideas')
  })

  it('breaks a tie towards the domain with more evidence behind it', () => {
    const r = buildReport([
      item(1, 'information_and_ideas', 'inferences', false),
      item(2, 'craft_and_structure', 'words_in_context', false),
      item(3, 'craft_and_structure', 'words_in_context', false),
    ])
    expect(recommendedPriority(r)).toBe('craft_and_structure')
  })

  // Circling a domain because the form has a blank is worse than leaving it.
  it('recommends nothing when everything was right', () => {
    const r = buildReport([item(1, 'craft_and_structure', 'words_in_context', true)])
    expect(recommendedPriority(r)).toBeNull()
  })

  it('recommends nothing with no answers to go on', () => {
    expect(recommendedPriority(buildReport([]))).toBeNull()
  })
})

describe('timeManagement', () => {
  it('calls a small gap on pace', () => {
    const r = buildReport([item(1, 'craft_and_structure', 'words_in_context', true, 72, 75)])
    expect(timeManagement(r).verdict).toBe('on')
  })
  it('names fast and slow', () => {
    expect(timeManagement(buildReport([item(1, 'craft_and_structure', 'words_in_context', true, 30, 75)])).verdict).toBe('fast')
    expect(timeManagement(buildReport([item(1, 'craft_and_structure', 'words_in_context', true, 150, 75)])).verdict).toBe('slow')
  })
  it('says nothing without answers', () => {
    expect(timeManagement(buildReport([])).verdict).toBe('unknown')
  })
})

describe('confidenceAverage', () => {
  it('averages what the student reported', () => {
    expect(confidenceAverage([{ student_confidence: 3 }, { student_confidence: 1 }])).toBe(2)
  })
  it('ignores the questions where they said nothing', () => {
    expect(confidenceAverage([{ student_confidence: 3 }, { student_confidence: null }])).toBe(3)
  })
  it('has no average when nobody said anything', () => {
    expect(confidenceAverage([{ student_confidence: null }])).toBeNull()
  })
})
