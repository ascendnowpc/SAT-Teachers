import { describe, expect, it } from 'vitest'
import {
  bluebookHeadline,
  bluebookProblem,
  change,
  dayLabel,
  dateIn,
  readBluebook,
  type BluebookScore,
} from './bluebook'

// The practice score report as its text layer comes out: each label on its
// own line, the score under it, and the scale under that.
const STACKED = `SAT Practice Test 4
Bea Bluebook
Test Date
October 12, 2025
Your Total Score
1250
400–1600
Section Scores
Reading and Writing
620
200–800
Math
630
200–800
Knowledge and Skills
Reading and Writing
Information and Ideas
26% of test section, 12–14 questions
Craft and Structure
28% of test section, 13–15 questions
Math
Algebra
35% of test section, 13–15 questions
Advanced Math
35% of test section, 13–15 questions`

// One line a score, each with its range.
const RANGED = `Bluebook Practice Test 6 · Completed Mar 8, 2026
Total Score 1390 Score Range 1350–1430
Reading and Writing Section Score 700 Score Range 670–730
Math Section Score 690 Score Range 660–720`

// A table: the three labels on one line, the three scores on the next.
const TABLE = `SAT Practice Test #7
Total Score Reading and Writing Math
1180 590 590
Date 11/02/2025`

describe('readBluebook', () => {
  it('reads the stacked report: the scores, the test and the day — never the scale', () => {
    const r = readBluebook(STACKED)
    expect(r.score).toEqual({
      test: 'Practice Test 4',
      takenOn: '2025-10-12',
      total: 1250,
      readingWriting: 620,
      math: 630,
    })
    expect(r.notes).toEqual([
      'Read 1250: Reading and Writing 620 and Math 630, which add up to it.',
    ])
  })

  it('reads one line a score, past the score ranges', () => {
    expect(readBluebook(RANGED).score).toEqual({
      test: 'Practice Test 6',
      takenOn: '2026-03-08',
      total: 1390,
      readingWriting: 700,
      math: 690,
    })
  })

  it('reads a table, letting the sum say which number is which', () => {
    expect(readBluebook(TABLE).score).toMatchObject({
      test: 'Practice Test 7',
      takenOn: '2025-11-02',
      total: 1180,
      readingWriting: 590,
      math: 590,
    })
  })

  it('shows three that do not add up as read, and says so rather than correcting them', () => {
    const r = readBluebook('Total Score 1250\nReading and Writing 620\nMath 640\nOctober 1, 2025')
    expect(r.score).toMatchObject({ total: 1250, readingWriting: 620, math: 640 })
    expect(r.notes[0]).toBe(
      'Read 1250, 620 and 640, but those do not add up — check each against the report.',
    )
  })

  it('leaves what it cannot find empty, and never works it out from the rest', () => {
    const r = readBluebook('Reading and Writing: 610\nMath: 580\nTaken 2025-09-30')
    expect(r.score).toMatchObject({ total: null, readingWriting: 610, math: 580, takenOn: '2025-09-30' })
    expect(r.notes[0]).toBe('Not found: the total. Type it from the report.')
  })

  it('says when it found nothing, and when it found no date', () => {
    const r = readBluebook('A photo of a cat.')
    expect(r.score).toEqual({ test: null, takenOn: null, total: null, readingWriting: null, math: null })
    expect(r.notes).toEqual([
      'No scores could be read from this. Type them from the report.',
      'No date found: say which day it was sat.',
    ])
  })

  it('reads no score off a PSAT report, which is on another scale', () => {
    const r = readBluebook('PSAT/NMSQT Practice Test 1\nTotal Score 1100\nReading and Writing 550\nMath 550')
    expect(r.score.total).toBeNull()
    expect(r.notes[0]).toMatch(/PSAT/)
  })

  it('does not take an Advanced Math domain line for the Math score', () => {
    const r = readBluebook('Total Score 1000\nReading and Writing 500\nAdvanced Math 400\nMath 500')
    expect(r.score).toMatchObject({ total: 1000, readingWriting: 500, math: 500 })
  })
})

describe('dateIn', () => {
  it('reads the ways a report writes a day', () => {
    expect(dateIn('Test Date: October 12, 2025')).toBe('2025-10-12')
    expect(dateIn('Sat on 12 Oct 2025')).toBe('2025-10-12')
    expect(dateIn('Sept. 3, 2025')).toBe('2025-09-03')
    expect(dateIn('2025-10-12')).toBe('2025-10-12')
    expect(dateIn('10/12/2025')).toBe('2025-10-12')
  })

  it('reads no day that is not one', () => {
    expect(dateIn('February 30, 2025')).toBeNull()
    expect(dateIn('Score 1250')).toBeNull()
  })
})

describe('bluebookProblem', () => {
  const ok: BluebookScore = {
    test: 'Practice Test 4',
    takenOn: '2025-10-12',
    total: 1250,
    readingWriting: 620,
    math: 630,
  }
  const today = '2025-11-01'

  it('is nothing for a score on the scale that adds up', () => {
    expect(bluebookProblem(ok, today)).toBeNull()
  })

  it('says what the database would refuse', () => {
    expect(bluebookProblem({ ...ok, total: 1260 }, today)).toBe(
      'The total is the two sections added: 620 + 630 = 1250, not 1260.',
    )
    expect(bluebookProblem({ ...ok, math: 635, total: 1255 }, today)).toBe(
      'A Math score is 200 to 800, in tens.',
    )
    expect(bluebookProblem({ ...ok, total: null }, today)).toBe(
      'Fill in the total and both section scores.',
    )
    expect(bluebookProblem({ ...ok, takenOn: '2025-12-01' }, today)).toBe(
      'A test cannot be sat on a day still to come.',
    )
    expect(bluebookProblem({ ...ok, takenOn: null }, today)).toBe('Say which day it was sat.')
  })
})

describe('the trend', () => {
  const row = (taken_on: string, total: number) => ({
    test_name: 'Bluebook practice test',
    taken_on,
    total,
    reading_writing: total / 2,
    math: total / 2,
  })

  it('reads first to latest, by the day sat', () => {
    expect(
      bluebookHeadline([row('2025-11-01', 1290), row('2025-09-01', 1180), row('2025-10-01', 1240)]),
    ).toBe('1180 → 1290 over 3 practice tests')
    expect(bluebookHeadline([row('2025-09-01', 1180)])).toBe('1180 on the first practice test')
    expect(bluebookHeadline([])).toBeNull()
  })

  it('signs a change', () => {
    expect(change(1180, 1220)).toBe('+40')
    expect(change(1220, 1200)).toBe('−20')
    expect(change(1200, 1200)).toBe('±0')
  })
})

describe('dayLabel', () => {
  it('writes the day sat as a day, with no time or zone', () => {
    expect(dayLabel('2025-10-12')).toBe('12 Oct 2025')
  })
})
