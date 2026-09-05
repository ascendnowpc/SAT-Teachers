import { describe, expect, it } from 'vitest'
import { buildPaper, hasTable, paperNumber, parsePassage } from './paper'
import type { Question } from './types'

const SLEEP_TABLE = `A study found that students who sleep at least 8 hours before a test score, on average, 10 points higher than those who sleep less. The chart shows average test scores based on hours of sleep.

Hours slept | Average score
5 | 72
6 | 74
7 | 78
8 | 82
9 | 85`

function q(over: Partial<Question> & { id: string }): Question {
  return {
    created_by: null,
    subject: 'english',
    section: 'information_and_ideas',
    skill: null,
    passage: null,
    passage_underline: null,
    image_url: null,
    source_ref: null,
    stem: 'A question.',
    difficulty: 'easy',
    difficulty_rationale: null,
    target_seconds: null,
    status: 'published',
    created_at: '2026-01-01T00:00:00Z',
    question_options: [],
    question_keys: null,
    ...over,
  }
}

describe('parsePassage', () => {
  it('has nothing to print for an absent passage', () => {
    expect(parsePassage(null)).toEqual([])
    expect(parsePassage('')).toEqual([])
  })

  it('keeps prose as one block, line breaks and all', () => {
    expect(parsePassage('One.\nTwo.')).toEqual([
      { kind: 'text', segments: [{ text: 'One.\nTwo.', underlined: false }] },
    ])
  })

  it('marks the underlined sentence inside the prose', () => {
    expect(parsePassage('One. Two.', 'Two.')).toEqual([
      {
        kind: 'text',
        segments: [
          { text: 'One. ', underlined: false },
          { text: 'Two.', underlined: true },
        ],
      },
    ])
  })

  it('reads the transcribed table back as a table, headed by its first row', () => {
    const blocks = parsePassage(SLEEP_TABLE)
    expect(blocks.map((b) => b.kind)).toEqual(['text', 'table'])
    expect(blocks[1]).toEqual({
      kind: 'table',
      head: ['Hours slept', 'Average score'],
      rows: [
        ['5', '72'],
        ['6', '74'],
        ['7', '78'],
        ['8', '82'],
        ['9', '85'],
      ],
    })
  })

  it('sets a paired-text passage under its own headings', () => {
    const blocks = parsePassage('Text 1\nSykes disputed it.\n\nText 2\nScholars accepted it.')
    expect(blocks.map((b) => b.kind)).toEqual(['heading', 'text', 'heading', 'text'])
    expect(blocks[0]).toEqual({ kind: 'heading', text: 'Text 1' })
    expect(blocks[2]).toEqual({ kind: 'heading', text: 'Text 2' })
  })

  it('leaves a lone sentence containing a pipe as prose', () => {
    const blocks = parsePassage('The command was ls | wc.')
    expect(blocks).toEqual([
      { kind: 'text', segments: [{ text: 'The command was ls | wc.', underlined: false }] },
    ])
  })

  it('knows which passages carry a table', () => {
    expect(hasTable(SLEEP_TABLE)).toBe(true)
    expect(hasTable('Just prose.')).toBe(false)
  })
})

describe('paperNumber', () => {
  it('numbers a question by its place in the test, counted from 1', () => {
    expect(paperNumber(0)).toBe('1')
    expect(paperNumber(6)).toBe('7')
    expect(paperNumber(19)).toBe('20')
  })
})

describe('buildPaper', () => {
  const shared = 'Urban reformers sought to address the conditions in expanding cities.'

  it('prints a shared stimulus once, with its questions under it', () => {
    const groups = buildPaper([
      q({ id: 'a', passage: shared, source_ref: 'ENG-DIAG-INCLASS-Q01' }),
      q({ id: 'b', passage: shared, source_ref: 'ENG-DIAG-INCLASS-Q02' }),
      q({ id: 'c', passage: shared, source_ref: 'ENG-DIAG-INCLASS-Q03' }),
    ])
    expect(groups).toHaveLength(1)
    expect(groups[0].label).toBe('Passage 1')
    expect(groups[0].questions.map((x) => x.number)).toEqual(['1', '2', '3'])
  })

  it('numbers the test straight through, whatever the source papers numbered', () => {
    // The three level tests take twenty items out of longer documents, so the
    // source numbers have holes in them; the test does not.
    const groups = buildPaper([
      q({ id: 'a', source_ref: 'ENG-DIAG-T4-M1-Q14' }),
      q({ id: 'b', source_ref: 'ENG-DIAG-T4-M1-Q17' }),
      q({ id: 'c', source_ref: 'ENG-DIAG-T4-M1-Q19' }),
    ])
    expect(groups.flatMap((g) => g.questions).map((x) => x.number)).toEqual(['1', '2', '3'])
  })

  it('numbers the passages in the order they are printed, and says which holds a table', () => {
    const groups = buildPaper([
      q({ id: 'a', passage: shared }),
      q({ id: 'b', passage: shared }),
      q({ id: 'c', passage: SLEEP_TABLE }),
      q({ id: 'd', passage: SLEEP_TABLE }),
    ])
    expect(groups.map((g) => g.label)).toEqual(['Passage 1', 'Passage 2 (+ Table)'])
  })

  it('leaves a stimulus belonging to one question unheaded and inline', () => {
    const groups = buildPaper([
      q({ id: 'a', passage: shared }),
      q({ id: 'b', passage: shared }),
      q({ id: 'c', passage: 'The integrated circuit ______ the industry.' }),
    ])
    expect(groups).toHaveLength(2)
    expect(groups[1].label).toBeNull()
    expect(groups[1].questions).toHaveLength(1)
  })

  it('does not merge two questions that only look alike', () => {
    const groups = buildPaper([
      q({ id: 'a', passage: 'One.' }),
      q({ id: 'b', passage: 'Two.' }),
      q({ id: 'c', passage: 'One.' }),
    ])
    // Same text, but not adjacent — the paper prints it twice, so do we.
    expect(groups).toHaveLength(3)
  })

  it('keeps an item with no stimulus at all in its place', () => {
    const groups = buildPaper([q({ id: 'a', passage: null }), q({ id: 'b', passage: null })])
    expect(groups).toHaveLength(2)
    expect(groups.every((g) => g.label === null)).toBe(true)
  })

  it('carries the underlined span onto the group that prints the passage', () => {
    const groups = buildPaper([
      q({ id: 'a', passage: shared, passage_underline: 'Urban reformers' }),
      q({ id: 'b', passage: shared }),
    ])
    expect(groups[0].underline).toBe('Urban reformers')
  })
})
