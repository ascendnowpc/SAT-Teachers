import { describe, expect, it } from 'vitest'
import { emptyRows } from './diagnostic'
import type { Claim, Extraction, TeacherFeedback } from './extraction'
import { buildReport } from './report'
import { buildReportDoc, disagreements, relabelledClaims, taughtInSession } from './reportDoc'
import type { SessionItem } from './types'

/** Only the fields the report reads. */
function item(seq: number, over: Partial<{ correct: boolean; domain: string }> = {}): SessionItem {
  const { correct = true, domain = 'craft_and_structure' } = over
  return {
    id: `i${seq}`,
    sequence_no: seq,
    asked_no: null,
    status: 'revealed',
    selected_option: 'A',
    revealed_correct_option: correct ? 'A' : 'B',
    revealed_result: correct ? 'correct' : 'incorrect',
    student_reasoning: null,
    questions: { section: domain, skill: 'words_in_context', difficulty: 'medium', stem: `Q${seq}`, target_seconds: 75 },
    session_item_assessments: { is_correct: correct, elapsed_seconds: 60, diagnosis: null, teacher_note: null },
  } as unknown as SessionItem
}

function claim(text: string, over: Partial<Claim['evidence']> = {}): Claim {
  return {
    text,
    evidence: {
      quote: 'some words that were said',
      at: 300,
      speaker: 'student',
      relabelled: false,
      fromMargin: false,
      fromReview: false,
      ...over,
    },
  }
}

function feedback(
  kind: TeacherFeedback['kind'],
  text: string,
  quote: string,
): TeacherFeedback {
  return {
    kind,
    text,
    evidence: {
      quote,
      at: 300,
      speaker: 'teacher',
      relabelled: false,
      fromMargin: false,
      fromReview: false,
    },
  }
}

const NOTHING: Extraction['session'] = {
  closingVerdict: null,
  teacherStatedScore: null,
  studentSelfReport: null,
  domainEvidence: [],
}

function rowsWith(domain: string, over: Partial<{ strengths: string; gaps: string }>) {
  return emptyRows().map((r) =>
    r.domain === domain ? { ...r, performance: 'tick' as const, ...over } : r,
  )
}

describe('buildReportDoc', () => {
  const report = buildReport([item(1), item(2, { correct: false }), item(3)])

  it('reproduces the teacher’s row without touching it', () => {
    const doc = buildReportDoc({
      rows: rowsWith('craft_and_structure', {
        strengths: 'Eliminates confidently.',
        gaps: 'Vocabulary range is narrow.',
      }),
      reflection: 'She reasons well but guesses grammar by ear.',
      report,
      extraction: null,
    })

    const cs = doc.domains.find((d) => d.domain === 'craft_and_structure')!
    expect(cs.teacher.strengths).toBe('Eliminates confidently.')
    expect(cs.teacher.gaps).toBe('Vocabulary range is narrow.')
    expect(doc.reflection).toBe('She reasons well but guesses grammar by ear.')
  })

  it('is a complete report with no reading at all', () => {
    // The model being down on a Thursday must not stop a teacher finishing.
    const doc = buildReportDoc({
      rows: emptyRows(),
      reflection: 'Solid session.',
      report,
      extraction: null,
    })

    expect(doc.questions).toHaveLength(3)
    expect(doc.questions.every((q) => q.reading === null)).toBe(true)
    expect(doc.coverage).toEqual({ covered: 0, total: 3 })
    expect(doc.measured.correct).toBe(2)
  })

  it('hangs each reading off the question it belongs to', () => {
    const doc = buildReportDoc({
      rows: emptyRows(),
      reflection: '',
      report,
      extraction: {
        questions: [
          {
            itemId: 'i2',
            covered: true,
            studentReasoning: claim('Narrowed to two and picked the stronger claim.'),
            misunderstanding: claim('Read the stem as asking for the cause.'),
            vocabularyGap: null,
            teacherFeedback: [feedback('correction', 'Put the reading right.', 'too broad')],
          },
        ],
        session: NOTHING,
      },
    })

    expect(doc.questions.find((q) => q.itemId === 'i2')?.reading?.covered).toBe(true)
    expect(doc.questions.find((q) => q.itemId === 'i1')?.reading).toBeNull()
    expect(doc.coverage).toEqual({ covered: 1, total: 3 })
  })

  it('counts the numbers from the answers, never from the recording', () => {
    const doc = buildReportDoc({
      rows: emptyRows(),
      reflection: '',
      report,
      extraction: {
        questions: [],
        session: {
          ...NOTHING,
          // The teacher said "six wrong out of 23" aloud off a paper copy. The
          // report still says what this session's rows say.
          teacherStatedScore: claim('Counted six wrong out of 23 in the lesson.', {
            speaker: 'teacher',
          }),
        },
      },
    })

    expect(doc.measured.correct).toBe(2)
    expect(doc.measured.total).toBe(3)
    expect(doc.teacherStatedScore?.text).toContain('six wrong')
  })
})

describe('taughtInSession', () => {
  it('gathers a rule taught more than once into one line with its questions', () => {
    const same = 'whenever extreme language is used, it is wrong'
    const doc = buildReportDoc({
      rows: emptyRows(),
      reflection: '',
      report: buildReport([item(1), item(2), item(3)]),
      extraction: {
        questions: [
          {
            itemId: 'i1',
            covered: true,
            studentReasoning: null,
            misunderstanding: null,
            vocabularyGap: null,
            teacherFeedback: [feedback('strategy', 'Extreme language marks a wrong option.', same)],
          },
          {
            itemId: 'i3',
            covered: true,
            studentReasoning: null,
            misunderstanding: null,
            vocabularyGap: null,
            teacherFeedback: [feedback('strategy', 'Extreme language marks a wrong option.', same)],
          },
        ],
        session: NOTHING,
      },
    })

    const taught = taughtInSession(doc)
    expect(taught).toHaveLength(1)
    expect(taught[0].questions).toEqual([1, 3])
  })

  it('leaves confirmations out — "very good" is not a thing taught', () => {
    const doc = buildReportDoc({
      rows: emptyRows(),
      reflection: '',
      report: buildReport([item(1)]),
      extraction: {
        questions: [
          {
            itemId: 'i1',
            covered: true,
            studentReasoning: null,
            misunderstanding: null,
            vocabularyGap: null,
            teacherFeedback: [feedback('confirmation', 'Confirmed the answer.', 'very good')],
          },
        ],
        session: NOTHING,
      },
    })

    expect(taughtInSession(doc)).toHaveLength(0)
  })
})

describe('disagreements', () => {
  it('surfaces where the recording sits awkwardly against the form', () => {
    const doc = buildReportDoc({
      rows: rowsWith('craft_and_structure', { gaps: 'Did not use elimination.' }),
      reflection: '',
      report: buildReport([item(1)]),
      extraction: {
        questions: [],
        session: {
          ...NOTHING,
          domainEvidence: [
            {
              domain: 'craft_and_structure',
              relation: 'complicates',
              ...claim('She eliminated three options aloud before choosing.'),
            },
            {
              domain: 'craft_and_structure',
              relation: 'supports',
              ...claim('Said outright she did not know the word.'),
            },
          ],
        },
      },
    })

    const found = disagreements(doc)
    expect(found).toHaveLength(1)
    expect(found[0].relation).toBe('complicates')
  })
})

describe('relabelledClaims', () => {
  it('lists claims resting on a turn Fathom attributed to somebody else', () => {
    const doc = buildReportDoc({
      rows: emptyRows(),
      reflection: '',
      report: buildReport([item(1)]),
      extraction: {
        questions: [
          {
            itemId: 'i1',
            covered: true,
            studentReasoning: null,
            misunderstanding: null,
            vocabularyGap: null,
            teacherFeedback: [
              {
                kind: 'confirmation',
                text: 'Confirmed the vocabulary answers.',
                evidence: {
                  quote: 'Very good absolutely right, good job with the vocab questions.',
                  at: 532,
                  speaker: 'teacher',
                  // Fathom put this at the end of a turn labelled with the
                  // student's name. It is the teacher's.
                  relabelled: true,
                  fromMargin: false,
                  fromReview: false,
                },
              },
            ],
          },
        ],
        session: NOTHING,
      },
    })

    const flagged = relabelledClaims(doc)
    expect(flagged).toHaveLength(1)
    expect(flagged[0].sequence).toBe(1)
  })
})
