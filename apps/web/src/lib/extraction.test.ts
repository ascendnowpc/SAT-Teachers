import { describe, expect, it } from 'vitest'
import {
  dropRate,
  findQuote,
  questionWindows,
  validateExtraction,
  widen,
  type RawExtraction,
  type ValidationInput,
} from './extraction'
import { parseTranscript } from './transcript'

/**
 * The fixture is real.
 *
 * Every line below is copied from the two Fathom exports the teachers gave us —
 * 7 August (Sara) and 17 July (Joshua) — including the mislabelled ones. The
 * guard is only worth having if it holds against the transcripts it will
 * actually be run on, and a fixture written by hand would quietly be a fixture
 * written to pass.
 */
const FATHOM = `Impromptu Zoom Meeting - August 07

VIEW RECORDING - 61 mins (No highlights)

@2:24 - Malya Rastogi (rastogimalya26@gmail.com)
So while we're discussing any questions, what I want you to do is think out loud, right? Like, what's your approach?

@2:52 - Sara Rohit
So first I thought relative before I read the text fully, because I just jumped to the answer section because I could see that first.

@4:06 - Malya Rastogi (rastogimalya26@gmail.com)
Very good. It's perfect. And the thought process is also correct because those are the keywords that you'll be looking at.

@6:00 - Sara Rohit
I have no idea what B means though.

@8:52 - Sara Rohit
Rely, it can't be rely on because evidence doesn't, what was the evidence that rely on their acceptability, this is the inverse because evidence can't rely on facts, facts rely on evidence.
Very good absolutely right, good job with the vocab questions.

@13:25 - Malya Rastogi (rastogimalya26@gmail.com)
So in elimination process, whenever extreme language is used, it is wrong. You're absolutely right.

@57:55 - Malya Rastogi (rastogimalya26@gmail.com)
So I've identified the main issue. So of course, it was just the literary one, because when you had the harder scientific one, were able to do those, right?

@58:50 - Malya Rastogi (rastogimalya26@gmail.com)
You got six wrong in the 23 questions that we did. So yes, it will definitely bring your score down.
`

const transcript = parseTranscript(FATHOM)

const ROLES: ValidationInput['roles'] = {
  'Malya Rastogi': 'teacher',
  'Sara Rohit': 'student',
}

const DOMAINS = [
  'information_and_ideas',
  'craft_and_structure',
  'expression_of_ideas',
  'standard_english_conventions',
]

/** Q1 covers the opening exchange; Q2 the vocabulary question at 8:52. */
const windows = questionWindows([
  { itemId: 'item-1', sequence: 1, window: { from: 140, to: 300 } },
  { itemId: 'item-2', sequence: 2, window: { from: 500, to: 700 } },
  { itemId: 'item-3', sequence: 3, window: { from: 3000, to: 3200 } },
])

const input: ValidationInput = { transcript, windows, roles: ROLES, domains: DOMAINS }

/** A reading with nothing in it, to be filled in per test. */
function empty(): RawExtraction {
  return {
    questions: [],
    session: {
      closingVerdict: null,
      teacherStatedScore: null,
      studentSelfReport: null,
      domainEvidence: [],
    },
  }
}

function oneQuestion(q: RawExtraction['questions'][number]): RawExtraction {
  return { ...empty(), questions: [q] }
}

const blank = {
  covered: true,
  studentReasoning: null,
  misunderstanding: null,
  vocabularyGap: null,
  teacherFeedback: [],
}

describe('findQuote', () => {
  it('finds a quote that is verbatim inside a turn', () => {
    const line = findQuote(transcript.lines, 'I just jumped to the answer section')
    expect(line?.at).toBe(172)
  })

  it('is not fooled by curly quotes or wrapping, which every export has', () => {
    expect(findQuote(transcript.lines, "what’s   your approach?")).not.toBeNull()
  })

  it('accepts a quote that elides its own middle, within one turn', () => {
    // How the model actually quotes a long turn, and what caused a third of the
    // dropped claims on the first real run.
    const line = findQuote(
      transcript.lines,
      'Rely, it can\'t be rely on ... facts rely on evidence.',
    )
    expect(line?.at).toBe(532)
  })

  it('refuses an elision whose fragments are out of order', () => {
    // Same words, reversed. Reversing across the gap is how an elision would
    // change a meaning rather than shorten one.
    expect(
      findQuote(transcript.lines, 'facts rely on evidence ... Rely, it can\'t be rely on'),
    ).toBeNull()
  })

  it('refuses an elision whose fragments come from different turns', () => {
    expect(
      findQuote(transcript.lines, 'I have no idea what B means ... those are the keywords'),
    ).toBeNull()
  })

  it('refuses fragments too short to be evidence', () => {
    // "a ... e ... i" appears in almost any sentence. A fragment that short is
    // not weak evidence, it is none.
    expect(findQuote(transcript.lines, 'a ... e ... i')).toBeNull()
  })

  it('refuses a quote stitched from two different turns', () => {
    expect(
      findQuote(transcript.lines, 'I have no idea what B means though. Very good. It is perfect.'),
    ).toBeNull()
  })
})

describe('validateExtraction — the quote rule', () => {
  it('keeps a claim whose quote is verbatim, and stamps it from the line it found', () => {
    const out = validateExtraction(
      oneQuestion({
        ...blank,
        itemId: 'item-1',
        studentReasoning: {
          text: 'Read the options before the passage and had to go back.',
          quote: 'I just jumped to the answer section',
          speaker: 'student',
        },
      }),
      input,
    )

    expect(out.drops).toHaveLength(0)
    expect(out.extraction.questions[0].studentReasoning?.evidence.at).toBe(172)
    expect(out.extraction.questions[0].studentReasoning?.evidence.fromMargin).toBe(false)
  })

  it('drops a paraphrase, rather than repairing it', () => {
    const out = validateExtraction(
      oneQuestion({
        ...blank,
        itemId: 'item-1',
        studentReasoning: {
          text: 'She jumped ahead to the answers.',
          quote: 'I skipped ahead to look at the answers first',
          speaker: 'student',
        },
      }),
      input,
    )

    expect(out.extraction.questions[0].studentReasoning).toBeNull()
    expect(out.drops[0].reason).toBe('quote-not-found')
  })

  it('drops a claim carrying a number its quote does not contain', () => {
    const out = validateExtraction(
      oneQuestion({
        ...blank,
        itemId: 'item-1',
        studentReasoning: {
          // The observation is fair; the "3" is invented, and an invented
          // figure in a parent's report is the failure this whole guard exists
          // to prevent.
          text: 'Eliminated 3 options before choosing.',
          quote: 'I just jumped to the answer section',
          speaker: 'student',
        },
      }),
      input,
    )

    expect(out.drops[0].reason).toBe('number-not-in-quote')
  })

  it('allows a number the speaker actually said', () => {
    const out = validateExtraction(
      {
        ...empty(),
        session: {
          ...empty().session,
          teacherStatedScore: {
            text: 'The teacher counted six wrong out of 23 aloud in the lesson.',
            quote: 'You got six wrong in the 23 questions that we did',
            speaker: 'teacher',
          },
        },
      },
      input,
    )

    expect(out.drops).toHaveLength(0)
    expect(out.extraction.session.teacherStatedScore?.text).toContain('23')
  })
})

describe('validateExtraction — who was speaking', () => {
  /**
   * The case the deterministic reader gets wrong.
   *
   * At 8:52 Fathom labels the turn "Sara Rohit", and the turn ends with the
   * teacher's own "Very good absolutely right, good job with the vocab
   * questions." Anything that believes the label reads the teacher praising the
   * student as the student praising herself.
   */
  it("records the model's attribution over Fathom's, and flags the disagreement", () => {
    const out = validateExtraction(
      oneQuestion({
        ...blank,
        itemId: 'item-2',
        teacherFeedback: [
          {
            kind: 'confirmation',
            text: 'Confirmed the elimination on the vocabulary questions.',
            quote: 'Very good absolutely right, good job with the vocab questions.',
            speaker: 'teacher',
          },
        ],
      }),
      input,
    )

    const f = out.extraction.questions[0].teacherFeedback[0]
    expect(f.evidence.speaker).toBe('teacher')
    // Fathom said this line was the student's. It was not.
    expect(f.evidence.relabelled).toBe(true)
  })

  it('leaves relabelled false where the model and Fathom agree', () => {
    const out = validateExtraction(
      oneQuestion({
        ...blank,
        itemId: 'item-1',
        teacherFeedback: [
          {
            kind: 'confirmation',
            text: 'Confirmed both the answer and the approach behind it.',
            quote: 'the thought process is also correct',
            speaker: 'teacher',
          },
        ],
      }),
      input,
    )

    expect(out.extraction.questions[0].teacherFeedback[0].evidence.relabelled).toBe(false)
  })
})

describe('validateExtraction — the margin', () => {
  it('marks a quote taken from outside the question’s own window', () => {
    // The window closes at 8:40 and the teacher's verdict lands at 8:52 —
    // twelve seconds after the lesson moved on, which is the normal case rather
    // than the awkward one, and the reason the margin exists at all.
    const wide = questionWindows([{ itemId: 'item-1', sequence: 1, window: { from: 440, to: 520 } }])
    const out = validateExtraction(
      oneQuestion({
        ...blank,
        itemId: 'item-1',
        teacherFeedback: [
          {
            kind: 'confirmation',
            text: 'Confirmed the answer after the question had moved on.',
            quote: 'good job with the vocab questions',
            speaker: 'teacher',
          },
        ],
      }),
      { ...input, windows: wide },
    )

    const f = out.extraction.questions[0].teacherFeedback[0]
    expect(f.evidence.at).toBe(532)
    expect(f.evidence.fromMargin).toBe(true)
  })

  it('does not reach past the margin', () => {
    const out = validateExtraction(
      oneQuestion({
        ...blank,
        itemId: 'item-1',
        teacherFeedback: [
          {
            kind: 'confirmation',
            // Said at 57:55, nowhere near item-1's window.
            text: 'Summed the session up.',
            quote: "So I've identified the main issue",
            speaker: 'teacher',
          },
        ],
      }),
      input,
    )

    expect(out.extraction.questions[0].teacherFeedback).toHaveLength(0)
    expect(out.drops[0].reason).toBe('quote-not-found')
  })
})

describe('validateExtraction — the allowlist', () => {
  it('drops a question the session does not have', () => {
    const out = validateExtraction(oneQuestion({ ...blank, itemId: 'item-99' }), input)
    expect(out.extraction.questions).toHaveLength(0)
    expect(out.drops[0].reason).toBe('unknown-item')
  })

  it('drops a repeated question rather than letting it overwrite', () => {
    const out = validateExtraction(
      { ...empty(), questions: [{ ...blank, itemId: 'item-1' }, { ...blank, itemId: 'item-1' }] },
      input,
    )
    expect(out.extraction.questions).toHaveLength(1)
    expect(out.drops[0].reason).toBe('duplicate-item')
  })

  it('drops evidence filed under a domain that is not on the form', () => {
    const out = validateExtraction(
      {
        ...empty(),
        session: {
          ...empty().session,
          domainEvidence: [
            {
              domain: 'algebra',
              relation: 'adds',
              text: 'Not a domain this form has.',
              quote: 'whenever extreme language is used, it is wrong',
              speaker: 'teacher',
            },
          ],
        },
      },
      input,
    )
    expect(out.extraction.session.domainEvidence).toHaveLength(0)
    expect(out.drops[0].reason).toBe('unknown-item')
  })
})

describe('validateExtraction — coverage', () => {
  it('calls a window with nobody in it uncovered, whatever the model said', () => {
    const out = validateExtraction(
      oneQuestion({ ...blank, itemId: 'item-3', covered: true }),
      input,
    )
    // item-3's window is 50:00–53:20, and the fixture has no lines there.
    expect(out.extraction.questions[0].covered).toBe(false)
  })
})

describe('the session reading', () => {
  it('keeps the closing verdict, which is said after the last question', () => {
    const out = validateExtraction(
      {
        ...empty(),
        session: {
          ...empty().session,
          closingVerdict: {
            text: 'Named the literary passages as the weak area and the scientific ones as sound.',
            quote: 'it was just the literary one',
            speaker: 'teacher',
          },
          domainEvidence: [
            {
              domain: 'craft_and_structure',
              relation: 'supports',
              text: 'Taught elimination by extreme language and the student applied it.',
              quote: 'whenever extreme language is used, it is wrong',
              speaker: 'teacher',
            },
          ],
        },
      },
      input,
    )

    expect(out.drops).toHaveLength(0)
    expect(out.extraction.session.closingVerdict?.evidence.at).toBe(3475)
    expect(out.extraction.session.domainEvidence[0].relation).toBe('supports')
  })
})

describe('dropRate', () => {
  it('is zero when everything survived', () => {
    const out = validateExtraction(
      oneQuestion({
        ...blank,
        itemId: 'item-1',
        studentReasoning: {
          text: 'Went to the options first.',
          quote: 'I just jumped to the answer section',
          speaker: 'student',
        },
      }),
      input,
    )
    expect(dropRate(out)).toBe(0)
  })

  it('counts what was thrown away against what was kept', () => {
    const out = validateExtraction(
      oneQuestion({
        ...blank,
        itemId: 'item-1',
        studentReasoning: {
          text: 'Went to the options first.',
          quote: 'I just jumped to the answer section',
          speaker: 'student',
        },
        misunderstanding: {
          text: 'Invented.',
          quote: 'this sentence is not in the recording at all',
          speaker: 'student',
        },
      }),
      input,
    )
    expect(dropRate(out)).toBe(0.5)
  })
})

describe('widen', () => {
  it('never runs the window back past the start of the recording', () => {
    expect(widen({ from: 10, to: 100 }).from).toBe(0)
  })
})
