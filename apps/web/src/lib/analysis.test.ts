import { describe, expect, it } from 'vitest'
import {
  analyseItem,
  analyseSession,
  inferRoles,
  markersIn,
  suggestOffset,
  type Role,
} from './analysis'
import type { Attempt, Report } from './report'
import { parseTranscript, windowsFor, type AlignWindow } from './transcript'

/** Lines lifted off the recorded diagnostic, trimmed to the turn that matters. */
const BODY = `Impromptu Zoom Meeting - August 07

@2:00 - Malya Rastogi (rastogimalya26@gmail.com)
Tell me your thought process and the answer that you're getting.

@2:30 - Sara Rohit
I'm gonna say B, dominant. First I thought relative before I read the text fully, because I just
jumped to the answer section. But then I saw inherit their mother's rank, which means rank,
dominant, compete.

@3:30 - Malya Rastogi (rastogimalya26@gmail.com)
Very good. It's perfect.

@4:00 - Sara Rohit
I think it's B, but it could very well be C. I haven't read this.

@5:00 - Malya Rastogi (rastogimalya26@gmail.com)
It is C, because see what is happening in B, B is very specific just about her being hesitant
about leaving home, and the main claim is about the country and her home duties, so the two
responsibilities are the struggle she is describing here in option C.

@6:00 - Sara Rohit
Not B for Bombay. It's A.

@7:00 - Malya Rastogi (rastogimalya26@gmail.com)
No, A will be incorrect. When do we put commas around a transition, do you know dependent
clauses and independent clauses?

@8:00 - Sara Rohit
I thought the question was asking me what proves that these two are styles. I didn't read the
word distinct.

@9:00 - Sara Rohit
It's D.
`

const T = parseTranscript(BODY)
const ROLES: Record<string, Role> = { 'Malya Rastogi': 'teacher', 'Sara Rohit': 'student' }

function attempt(over: Partial<Attempt>): Attempt {
  return {
    itemId: 'i1',
    sequence: 1,
    stem: '',
    section: 'craft_and_structure',
    skill: 'words_in_context',
    difficulty: 'easy',
    correct: true,
    chose: 'B',
    answer: 'B',
    seconds: 60,
    target: 55,
    diagnosis: null,
    teacherNote: null,
    studentReasoning: null,
    rushed: false,
    laboured: false,
    ...over,
  }
}

const w = (from: number, to: number): AlignWindow => ({ from, to })

describe('inferRoles', () => {
  it('matches on the given name, because Zoom labels are not account names', () => {
    expect(inferRoles(['Malya Rastogi', 'Sara Rohit'], 'Malya Rao', 'Sara Kapoor')).toEqual({
      'Malya Rastogi': 'teacher',
      'Sara Rohit': 'student',
    })
  })

  it('leaves anyone it cannot place as other rather than guessing', () => {
    const roles = inferRoles(['Miriam Hanna', 'Sara Rohit'], 'Malya Rao', 'Sara Kapoor')
    expect(roles['Miriam Hanna']).toBe('other')
  })
})

describe('markersIn', () => {
  it('reads elimination out of the student’s own idiom', () => {
    const hits = markersIn(T.lines.filter((l) => l.speaker === 'Sara Rohit'))
    expect(hits.some((h) => h.marker === 'elimination')).toBe(true)
  })

  it('carries the line that raised it, so a finding can show its evidence', () => {
    const hits = markersIn([{ at: 10, speaker: 'Sara Rohit', text: 'I didn’t read the word.' }])
    expect(hits[0].line.at).toBe(10)
  })
})

describe('analyseItem', () => {
  it('separates a right answer that was explained from one that was not', () => {
    const explained = analyseItem(attempt({}), T, w(120, 210), ROLES)
    expect(explained.verdict).toBe('self_corrected')

    const bare = analyseItem(attempt({}), T, w(540, 600), ROLES)
    expect(bare.verdict).toBe('unexplained')
  })

  it('calls a miss the student had in hand a second guess, not a concept gap', () => {
    const a = analyseItem(attempt({ correct: false }), T, w(240, 300), ROLES)
    expect(a.verdict).toBe('talked_out_of_it')
  })

  it('calls a miss that read past the stem a misread', () => {
    const a = analyseItem(attempt({ correct: false }), T, w(480, 540), ROLES)
    expect(a.verdict).toBe('misread')
  })

  it('says nothing at all about a question the recording does not reach', () => {
    const a = analyseItem(attempt({}), T, w(9000, 9100), ROLES)
    expect(a.verdict).toBe('not_covered')
    expect(a.quote).toBeNull()
  })

  it('measures who did the talking, so a taught answer is not read as a known one', () => {
    const a = analyseItem(attempt({ correct: false }), T, w(240, 360), ROLES)
    expect(a.talkShare).not.toBeNull()
    expect(a.talkShare!).toBeLessThan(0.5)
  })
})

describe('suggestOffset', () => {
  it('finds the offset that leaves the fewest questions with nobody talking', () => {
    const items = [
      { id: 'a', startedAt: '2026-08-07T10:00:00Z' },
      { id: 'b', startedAt: '2026-08-07T10:01:00Z' },
      { id: 'c', startedAt: '2026-08-07T10:02:00Z' },
    ]
    const at = (offset: number) => windowsFor(items, T.duration, offset)
    const offset = suggestOffset(T, at, ['a', 'b', 'c'], ROLES)
    expect(offset).toBeGreaterThan(0)
    expect(offset).toBeLessThanOrEqual(T.duration)
  })
})

describe('analyseSession', () => {
  const attempts = [
    attempt({ itemId: 'a', sequence: 1, correct: true }),
    attempt({
      itemId: 'b',
      sequence: 2,
      correct: false,
      section: 'information_and_ideas',
      skill: 'central_ideas_and_details',
    }),
  ]
  const report = {
    total: 2,
    correct: 1,
    accuracy: 0.5,
    seconds: 120,
    target: 110,
    paceDelta: 10,
    sections: [],
    skills: [],
    diagnoses: [],
    attempts,
    rushed: [],
    laboured: [],
    misses: [attempts[1]],
  } as unknown as Report

  const windows = new Map([
    ['a', w(120, 210)],
    ['b', w(240, 300)],
  ])
  const analysis = analyseSession(report, T, windows, ROLES)

  it('groups its findings by the four domains and drops the ones nothing landed in', () => {
    expect(analysis.domains.map((d) => d.domain)).toEqual([
      'information_and_ideas',
      'craft_and_structure',
    ])
  })

  it('offers a strength and a gap that each carry their questions and a quote', () => {
    const craft = analysis.domains.find((d) => d.domain === 'craft_and_structure')!
    expect(craft.strengths.length).toBeGreaterThan(0)
    expect(craft.strengths[0].questions).toEqual([1])
    expect(craft.strengths[0].quote?.speaker).toBe('Sara Rohit')
  })

  it('records the second-guessing as a count and how often it went wrong', () => {
    expect(analysis.secondGuess).toEqual({ wrong: 1, total: 1 })
  })

  it('flags alignment when most questions have nobody talking about them', () => {
    const empty = analyseSession(report, T, new Map(), ROLES)
    expect(empty.alignment.ok).toBe(false)
    expect(empty.alignment.covered).toBe(0)
  })
})
