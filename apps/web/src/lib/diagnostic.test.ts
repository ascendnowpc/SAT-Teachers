import { describe, expect, it } from 'vitest'
import {
  defaultTargets,
  emptyRows,
  hasProblem,
  isComplete,
  rowsComplete,
  rowsFrom,
  summariseProblems,
  validate,
  type DiagnosticForm,
  type DiagnosticRow,
} from './diagnostic'
import type { DomainNote } from './types'

function filled(overrides: Partial<DiagnosticRow> = {}): (row: DiagnosticRow) => DiagnosticRow {
  return (row) => ({
    ...row,
    performance: 'tick',
    strengths: 'Separated inference from fact unprompted.',
    gaps: 'Reads what the passage does, not what it says.',
    ...overrides,
  })
}

function form(rows: DiagnosticRow[], over: Partial<DiagnosticForm> = {}): DiagnosticForm {
  return {
    rows,
    reflection: 'Engaged throughout and thinks out loud readily.',
    transcript: '@2:24 - Malya Rastogi\nSo we will do it one by one, right?',
    ...over,
  }
}

describe('emptyRows', () => {
  it('is the four domains in the order the paper form prints them', () => {
    expect(emptyRows().map((r) => r.domain)).toEqual([
      'information_and_ideas',
      'craft_and_structure',
      'expression_of_ideas',
      'standard_english_conventions',
    ])
  })

  it('prints the form’s own skill focus, which is not the teacher’s to write', () => {
    expect(emptyRows()[0].skillFocus).toContain('Central Ideas & Details')
  })

  it('starts the targets column at the form’s own wording rather than blank', () => {
    const row = emptyRows()[1]
    expect(row.targets).toBe(defaultTargets('craft_and_structure'))
    expect(row.targets).toContain('Build academic vocabulary.')
    // One per line, so editing one target does not mean retyping the others.
    expect(row.targets.split('\n')).toHaveLength(3)
  })

  it('leaves every column the teacher owns empty', () => {
    for (const row of emptyRows()) {
      expect(row.performance).toBeNull()
      expect(row.performanceNote).toBe('')
      expect(row.strengths).toBe('')
      expect(row.gaps).toBe('')
    }
  })
})

describe('rowsFrom', () => {
  const note = (over: Partial<DomainNote>): DomainNote => ({
    session_id: 's1',
    domain: 'information_and_ideas',
    performance: 'cross',
    performance_note: 'Two of four, both inference.',
    strengths: 'Kept going.',
    gaps: 'Inference.',
    targets: 'Ten inference questions a week.',
    ...over,
  })

  it('reads a saved row back exactly as it was filled in', () => {
    const row = rowsFrom([note({})])[0]
    expect(row.performance).toBe('cross')
    expect(row.performanceNote).toBe('Two of four, both inference.')
    expect(row.strengths).toBe('Kept going.')
    expect(row.gaps).toBe('Inference.')
    expect(row.targets).toBe('Ten inference questions a week.')
  })

  it('leaves a domain with no row yet blank — a part-filled form is not an error', () => {
    const rows = rowsFrom([note({})])
    expect(rows[0].performance).toBe('cross')
    expect(rows[1].performance).toBeNull()
    expect(rows[1].strengths).toBe('')
  })

  it('falls back to the printed targets when a row predates the form', () => {
    const row = rowsFrom([note({ targets: null })])[0]
    expect(row.targets).toBe(defaultTargets('information_and_ideas'))
  })

  it('still gives back all four domains from an empty table', () => {
    expect(rowsFrom([])).toHaveLength(4)
  })
})

describe('validate', () => {
  it('passes a form with every field filled in', () => {
    expect(validate(form(emptyRows().map(filled())))).toEqual([])
    expect(isComplete(form(emptyRows().map(filled())))).toBe(true)
  })

  it('wants a mark on every domain, not just the ones that were tested', () => {
    const rows = emptyRows().map(filled())
    rows[2] = { ...rows[2], performance: null }
    expect(validate(form(rows))).toContainEqual({
      where: 'row',
      domain: 'expression_of_ideas',
      field: 'performance',
    })
  })

  it('counts whitespace as empty in every written column', () => {
    const rows = emptyRows().map(filled({ strengths: '   ', gaps: '\n' }))
    const problems = validate(form(rows))
    expect(problems.filter((p) => p.where === 'row' && p.field === 'strengths')).toHaveLength(4)
    expect(problems.filter((p) => p.where === 'row' && p.field === 'gaps')).toHaveLength(4)
  })

  it('requires the targets, prefilled though they arrive', () => {
    const rows = emptyRows().map(filled({ targets: '' }))
    expect(validate(form(rows)).filter((p) => p.where === 'row' && p.field === 'targets')).toHaveLength(4)
  })

  it('never asks for the note beside the mark — it is the one optional box', () => {
    const rows = emptyRows().map(filled({ performanceNote: '' }))
    expect(validate(form(rows))).toEqual([])
    expect(rowsComplete(rows)).toBe(4)
  })

  it('requires the teacher’s comments and the transcript', () => {
    const rows = emptyRows().map(filled())
    expect(validate(form(rows, { reflection: '  ' }))).toEqual([{ where: 'reflection' }])
    expect(validate(form(rows, { transcript: '' }))).toEqual([{ where: 'transcript' }])
  })

  it('finds all sixteen cells of a form nobody has touched', () => {
    // Targets arrive prefilled, so a blank form is missing three columns of four.
    const problems = validate(form(emptyRows(), { reflection: '', transcript: '' }))
    expect(problems.filter((p) => p.where === 'row')).toHaveLength(12)
    expect(problems).toContainEqual({ where: 'reflection' })
    expect(problems).toContainEqual({ where: 'transcript' })
  })
})

describe('hasProblem', () => {
  it('marks only the cell that is actually empty', () => {
    const rows = emptyRows().map(filled())
    rows[0] = { ...rows[0], gaps: '' }
    const problems = validate(form(rows))
    expect(hasProblem(problems, 'information_and_ideas', 'gaps')).toBe(true)
    expect(hasProblem(problems, 'information_and_ideas', 'strengths')).toBe(false)
    expect(hasProblem(problems, 'craft_and_structure', 'gaps')).toBe(false)
  })
})

describe('rowsComplete', () => {
  it('counts a row only once all four of its fields are in', () => {
    const rows = emptyRows().map(filled())
    expect(rowsComplete(rows)).toBe(4)
    rows[3] = { ...rows[3], performance: null }
    expect(rowsComplete(rows)).toBe(3)
  })

  it('does not count the prefilled targets as progress on their own', () => {
    expect(rowsComplete(emptyRows())).toBe(0)
  })
})

describe('summariseProblems', () => {
  it('names the columns rather than listing sixteen empty cells', () => {
    const text = summariseProblems(validate(form(emptyRows(), { reflection: '', transcript: '' })))
    expect(text).toContain('4 of 4 domain rows are unfinished')
    expect(text).toContain('student performance')
    expect(text).toContain('your comments on the session')
    expect(text).toContain('the Fathom transcript')
  })

  it('says only what is actually missing', () => {
    const rows = emptyRows().map(filled())
    const text = summariseProblems(validate(form(rows, { transcript: '' })))
    expect(text).toContain('the Fathom transcript')
    expect(text).not.toContain('domain rows')
    expect(text).not.toContain('your comments')
  })
})
