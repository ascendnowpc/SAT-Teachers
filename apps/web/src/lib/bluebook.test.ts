import { readFileSync } from 'node:fs'
import { describe, expect, it } from 'vitest'
import {
  addedBy,
  bluebookHeadline,
  bluebookProblem,
  change,
  dateIn,
  dayLabel,
  EMPTY_SCORE,
  latestDomains,
  ordinal,
  readBluebook,
  sameName,
  withoutScales,
  type BluebookScore,
} from './bluebook'

/*
 * College Board's own "Your SAT Score Report" for an official SAT, as the app
 * meets it: the lines pdf.js's text layer gives (lib/pdfText), and the text a
 * PDF viewer's copy gives, its two columns side by side. Taken from a real
 * report, with the student's name, record locator, scores, percentiles and
 * score ranges changed; the layout, the printed scales and the domains' bands
 * are as printed.
 */
const fixture = (name: string) => readFileSync(new URL(`./fixtures/${name}`, import.meta.url), 'utf8')
const SAT_PDFJS = fixture('sat-score-report.pdfjs.txt')
const SAT_LAYOUT = fixture('sat-score-report.layout.txt')

const SAT_SCORE: BluebookScore = {
  test: 'SAT May 2026',
  official: true,
  takenOn: '2026-05-02',
  total: 1280,
  readingWriting: 610,
  math: 670,
  totalPercentile: 84,
  readingWritingPercentile: 78,
  mathPercentile: 89,
  domains: {
    information_and_ideas: [550, 600],
    craft_and_structure: [610, 670],
    expression_of_ideas: [680, 800],
    standard_english_conventions: [610, 670],
    algebra: [680, 800],
    advanced_math: [610, 670],
    problem_solving_and_data_analysis: [610, 670],
    geometry_and_trigonometry: [680, 800],
  },
}

describe('reading an official SAT score report', () => {
  it('reads everything off pdf.js’s lines: the scores, the percentiles, the eight bands, the test and the day', () => {
    const r = readBluebook(SAT_PDFJS)
    expect(r.score).toEqual(SAT_SCORE)
    expect(r.name).toBe('Jordan Sample')
    expect(r.notes).toEqual([
      'Read 1280: Reading and Writing 610 and Math 670, which add up to it.',
      'Percentiles: 84th, 78th, 89th — total, Reading and Writing, Math.',
      'All eight domains’ performance bands read.',
      'An official SAT: SAT May 2026.',
    ])
  })

  it('reads the same off text pasted from a PDF viewer, its columns side by side', () => {
    const r = readBluebook(SAT_LAYOUT)
    expect(r.score).toEqual(SAT_SCORE)
    expect(r.name).toBe('Jordan Sample')
  })

  it('never reads the printed scale, broken over two lines, as scores — 400 = 200 + 200 adds up', () => {
    // What the first version read off this report.
    const r = readBluebook(SAT_PDFJS)
    expect([r.score.total, r.score.readingWriting, r.score.math]).not.toEqual([400, 200, 200])
    expect(withoutScales(['TOTAL SCORE', '400–', '1280 1600 84th*']).map((l) => l.trim())).toEqual([
      'TOTAL SCORE',
      '',
      '1280      84th*',
    ])
  })

  it('reads a perfect score next to its scale', () => {
    const r = readBluebook(
      'TOTAL SCORE\n400–\n1600 1600 99th*\nSECTION SCORES\nReading and Writing\n200–\n800 800 99th*\nMath\n200–\n800 800 99th*',
    )
    expect(r.score).toMatchObject({ total: 1600, readingWriting: 800, math: 800, totalPercentile: 99 })
  })

  it('never reads a three-year average as a score', () => {
    expect(withoutScales(['3 Year Average Score (all testers): 1050'])[0].trim()).toBe('')
    const r = readBluebook(
      'Total Score\n3 Year Average Score (all testers): 1050\n1250\nReading and Writing 620\nMath 630',
    )
    expect(r.score.total).toBe(1250)
  })

  it('takes a percentile only where the report marks one: not the “12th” of “12th grade”', () => {
    const r = readBluebook(
      'Total Score 1250\nReading and Writing 620\nMath 630\n* Percentiles represent the percent of 12th\ngrade test takers',
    )
    expect([r.score.totalPercentile, r.score.readingWritingPercentile, r.score.mathPercentile]).toEqual([
      null,
      null,
      null,
    ])
  })

  it('leaves the bands out when they do not pair with the domains one to one', () => {
    const r = readBluebook(SAT_PDFJS.replace('Performance: 680-800\n', 'Score: 680-800\n'))
    expect(r.score.domains).toBeNull()
    expect(r.notes).toContain(
      'The domains’ performance bands could not be matched to their names, so they are left out.',
    )
    // The scores are read all the same.
    expect(r.score.total).toBe(1280)
  })
})

// A practice test's report, as its text layer comes out: each label on its
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

describe('reading a practice test’s report', () => {
  it('reads the stacked report: the scores, the test and the day — never the scale', () => {
    const r = readBluebook(STACKED)
    expect(r.score).toEqual({
      ...EMPTY_SCORE,
      test: 'Practice Test 4',
      official: false,
      takenOn: '2025-10-12',
      total: 1250,
      readingWriting: 620,
      math: 630,
    })
    expect(r.notes).toEqual(['Read 1250: Reading and Writing 620 and Math 630, which add up to it.'])
  })

  it('reads one line a score, past the score ranges', () => {
    expect(readBluebook(RANGED).score).toMatchObject({
      test: 'Practice Test 6',
      official: false,
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
    expect(r.score).toEqual(EMPTY_SCORE)
    expect(r.name).toBeNull()
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
    expect(dateIn('Tested on: May 2, 2026')).toBe('2026-05-02')
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

describe('sameName', () => {
  it('matches the same student however the name is cased or accented', () => {
    expect(sameName('Jordan Sample', 'jordan sample')).toBe(true)
    expect(sameName('José Núñez', 'Jose Nunez')).toBe(true)
  })

  it('matches a report’s first and last names among the student’s', () => {
    expect(sameName('Jordan Sample', 'Jordan A. Sample')).toBe(true)
  })

  it('does not match somebody else', () => {
    expect(sameName('Jordan Sample', 'Bea Bluebook')).toBe(false)
    expect(sameName('Jordan Sample', 'Jordan Smith')).toBe(false)
  })
})

describe('ordinal', () => {
  it('says a percentile as the report does', () => {
    expect([1, 2, 3, 11, 12, 13, 21, 89, 90, 92].map(ordinal)).toEqual([
      '1st', '2nd', '3rd', '11th', '12th', '13th', '21st', '89th', '90th', '92nd',
    ])
  })
})

describe('bluebookProblem', () => {
  const ok: BluebookScore = {
    ...EMPTY_SCORE,
    test: 'Practice Test 4',
    takenOn: '2025-10-12',
    total: 1250,
    readingWriting: 620,
    math: 630,
  }
  const today = '2025-11-01'

  it('is nothing for a score on the scale that adds up', () => {
    expect(bluebookProblem(ok, today)).toBeNull()
    expect(bluebookProblem({ ...SAT_SCORE, takenOn: '2025-10-01' }, today)).toBeNull()
  })

  it('says what the database would refuse', () => {
    expect(bluebookProblem({ ...ok, total: 1260 }, today)).toBe(
      'The total is the two sections added: 620 + 630 = 1250, not 1260.',
    )
    expect(bluebookProblem({ ...ok, math: 635, total: 1255 }, today)).toBe(
      'A Math score is 200 to 800, in tens.',
    )
    expect(bluebookProblem({ ...ok, total: null }, today)).toBe('Fill in the total and both section scores.')
    expect(bluebookProblem({ ...ok, totalPercentile: 100 }, today)).toBe('A percentile is 1 to 99.')
    expect(bluebookProblem({ ...ok, takenOn: '2025-12-01' }, today)).toBe(
      'A test cannot be sat on a day still to come.',
    )
    expect(bluebookProblem({ ...ok, takenOn: null }, today)).toBe('Say which day it was sat.')
  })
})

describe('the trend', () => {
  const row = (taken_on: string, total: number, extra = {}) => ({
    test_name: 'Bluebook practice test',
    taken_on,
    total,
    reading_writing: total / 2,
    math: total / 2,
    ...extra,
  })

  it('reads first to latest, by the day sat, official SATs and practice tests together', () => {
    expect(
      bluebookHeadline([row('2025-11-01', 1290), row('2025-09-01', 1180), row('2025-10-01', 1240)]),
    ).toBe('1180 → 1290 over 3 tests')
    expect(bluebookHeadline([row('2025-09-01', 1180)])).toBe('1180 on the first test')
    expect(bluebookHeadline([])).toBeNull()
  })

  it('finds the latest report that gave the domains’ bands', () => {
    const bands = { algebra: [680, 800] as [number, number] }
    expect(
      latestDomains([
        row('2025-09-01', 1180, { domains: bands }),
        row('2025-10-01', 1240, { test_name: 'SAT October 2025', domains: bands }),
        row('2025-11-01', 1290),
      ])?.test_name,
    ).toBe('SAT October 2025')
    expect(latestDomains([row('2025-09-01', 1180)])).toBeNull()
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

describe('addedBy', () => {
  it('says who added a score as the person looking would say it', () => {
    expect(addedBy('student', 'student')).toBe('You')
    expect(addedBy('teacher', 'student')).toBe('Your teacher')
    expect(addedBy('pc', 'student')).toBe('Your PC')
    expect(addedBy('pc', 'pc')).toBe('You')
    expect(addedBy('pc', 'staff')).toBe('The PC')
    expect(addedBy('student', 'staff')).toBe('The student')
    expect(addedBy('admin', 'staff')).toBe('An admin')
    expect(addedBy(null, 'staff')).toBe('Staff')
  })
})
