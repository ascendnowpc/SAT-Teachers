import type { QuestionWindow } from './extraction.ts'
import { linesIn, type Transcript } from './transcript.ts'

/**
 * What the model is asked, and how the recording is packed for it.
 *
 * Kept apart from the guard in ./extraction.ts on purpose: that file is the
 * rule the output has to survive, this one is the request. The rule is the part
 * that must not bend when this is tuned.
 *
 * Everything asserted below about Fathom exports is measured on the two
 * recordings the teachers gave us (7 August, Sara; 17 July, Joshua), not
 * assumed. Where a rule exists because of something in those recordings, the
 * comment says which — so the next person can tell a considered rule from a
 * superstition when a third recording disagrees.
 */

// ------------------------------------------------------------ the schema --

const claim = (description: string) => ({
  type: ['object', 'null'],
  description,
  additionalProperties: false,
  required: ['text', 'quote', 'speaker'],
  properties: {
    text: {
      type: 'string',
      description:
        'The observation, in your own words, one or two sentences. No figures that do not appear in the quote.',
    },
    quote: {
      type: 'string',
      description:
        'The words this is drawn from, copied character for character from a single turn in the window. Not a paraphrase, not stitched from two turns.',
    },
    speaker: {
      type: 'string',
      enum: ['teacher', 'student', 'other'],
      description: 'Who actually said the quote, judged from the words themselves.',
    },
  },
})

const feedbackClaim = {
  type: 'object',
  additionalProperties: false,
  required: ['kind', 'text', 'quote', 'speaker'],
  properties: {
    kind: {
      type: 'string',
      enum: ['confirmation', 'correction', 'strategy', 'vocabulary', 'recommendation', 'probe'],
      description:
        'confirmation: the answer and reasoning both stand. correction: a reading is put right. strategy: a method or rule is taught. vocabulary: a word is explained. recommendation: work to do outside the lesson. probe: the teacher asking the student to explain.',
    },
    text: { type: 'string', description: 'What the teacher conveyed, in your own words.' },
    quote: { type: 'string', description: 'Verbatim from one turn in the window.' },
    speaker: { type: 'string', enum: ['teacher', 'student', 'other'] },
  },
}

/**
 * The tool the model answers through.
 *
 * A tool schema rather than "reply in JSON", so a shape mismatch is a retry at
 * the API layer instead of prose that has to be parsed and might be prose.
 */
export const EXTRACTION_TOOL = {
  name: 'record_reading',
  description:
    'Record what the recording shows about each question and about the session as a whole. Every claim must carry a verbatim quote.',
  strict: true,
  input_schema: {
    type: 'object',
    additionalProperties: false,
    required: ['questions', 'session'],
    properties: {
      questions: {
        type: 'array',
        description: 'One entry per question you were given a window for. Omit none.',
        items: {
          type: 'object',
          additionalProperties: false,
          required: [
            'itemId',
            'covered',
            'studentReasoning',
            'misunderstanding',
            'vocabularyGap',
            'teacherFeedback',
          ],
          properties: {
            itemId: {
              type: 'string',
              description: 'Exactly as given in the window heading. Never invent one.',
            },
            covered: {
              type: 'boolean',
              description:
                'False when nobody actually discusses this question in its window — silence, or only logistics.',
            },
            studentReasoning: claim(
              'How the student reached their answer: what they eliminated and why, what they read first, the rule they applied. Null if they never explain it.',
            ),
            misunderstanding: claim(
              'What the student got wrong about the text, the stem or a word — the thing behind a wrong answer. Null when there is none.',
            ),
            vocabularyGap: claim(
              'A word or phrase the student says outright they do not know. Null when there is none.',
            ),
            teacherFeedback: {
              type: 'array',
              description:
                'Everything the teacher said to the student about this question. Empty when they said nothing.',
              items: feedbackClaim,
            },
          },
        },
      },
      session: {
        type: 'object',
        additionalProperties: false,
        required: [
          'closingVerdict',
          'teacherStatedScore',
          'studentSelfReport',
          'domainEvidence',
        ],
        properties: {
          closingVerdict: claim(
            "The teacher's own summing-up of the session — what they say the main issue is and what to work on. Usually near the end.",
          ),
          teacherStatedScore: claim(
            'A score or count the teacher says out loud. Null unless they actually say one.',
          ),
          studentSelfReport: claim(
            'Anything the student says about their own performance or what they find hard. Null when there is none.',
          ),
          domainEvidence: {
            type: 'array',
            description:
              "Evidence from the recording for each of the four domains, tied to what the teacher wrote on their form. At most three per domain, and only where the recording actually shows something.",
            items: {
              type: 'object',
              additionalProperties: false,
              required: ['domain', 'relation', 'text', 'quote', 'speaker'],
              properties: {
                domain: {
                  type: 'string',
                  description: 'One of the four domain keys given to you. Never invent one.',
                },
                relation: {
                  type: 'string',
                  enum: ['supports', 'complicates', 'adds'],
                  description:
                    "supports: the recording shows what the teacher wrote. complicates: the recording sits awkwardly against it. adds: the recording shows something the teacher's form does not mention.",
                },
                text: { type: 'string' },
                quote: { type: 'string', description: 'Verbatim from one turn.' },
                speaker: { type: 'string', enum: ['teacher', 'student', 'other'] },
              },
            },
          },
        },
      },
    },
  },
} as const

// ------------------------------------------------------------ the request --

export const SYSTEM_PROMPT = `You read a recording of a one-to-one SAT English diagnostic lesson and record what it shows, question by question. A teacher will read what you produce, correct it, and publish a version of it to the student's parent. So the standard is not fluency — it is that every sentence can be pointed at a line of the recording.

WHAT YOU ARE AND ARE NOT DECIDING

You are deciding *how the student got to their answer* and *what the teacher told them*. You are not deciding whether an answer was right — the answer rows already know that, and they are given to you. You are not deciding which part of the call belongs to which question — that is already done, and each question arrives with its own window of the transcript. Never move a claim to a different question because it seems to fit better there.

THE QUOTE RULE

Every claim carries a quote. The quote must be copied character for character from a single turn inside the window you were given. Not a paraphrase. Not two turns stitched together. Not tidied-up grammar — these are speech transcripts and they are full of false starts, repetition and mistranscribed words; copy them as they are.

A claim whose quote cannot be found verbatim is discarded rather than corrected, and a discarded claim helps nobody. If you cannot find words that carry the observation, do not make the observation.

NUMBERS

Never write a number that does not appear in the quote. Not a count of questions, not a percentage, not a score. Those are computed from the answer rows elsewhere. "Eliminated three options" is a number you invented; "worked by elimination" is the same observation without it.

WHO IS SPEAKING — READ THE WORDS, NOT THE LABEL

This matters more than anything else here.

The speaker label on each turn comes from Fathom and it is often wrong at the edges of a turn. Fathom attributes a block of time to one person, and the other person's words routinely land at the *end* of that block. On the recordings this was built against, the teacher's "Very good. Absolutely right." repeatedly sits at the tail of a turn labelled with the student's name, and a turn labelled with the student's name opens with the teacher's own question.

So judge who is speaking from what is said:
- The teacher confirms, corrects, explains what a word means, names a rule, asks the student to think out loud, moves the lesson on ("next one please", "let's discuss", "reason please"), and manages time.
- The student reads the stem aloud, works through options, says what they do not know, and answers questions.

When your judgement disagrees with the label, still record what you judge. That disagreement is recorded and shown to the teacher, so a wrong label is caught rather than believed.

THE MARGIN

Each window is a little wider than the question itself, because feedback arrives late. The teacher's verdict on a question often lands while the student is already reading the next one, and in a lesson where the test was taken in silence first, the whole discussion happens afterwards. Lines from the margin are marked with a ~ and you may use them. Lines from further away are not there to use.

TWO SHAPES OF LESSON

Some lessons run question by question with the student thinking out loud as they go. Others are a silent timed paper followed by a review that jumps around, in which the teacher goes down the list saying which are right and wrong. Both are normal. In the second shape, a short verdict is still teacher feedback and is worth recording; a bare "this is wrong" with nothing else is a confirmation-kind claim with no reasoning attached to it, not a correction.

THE TEACHER'S FORM

You are given what the teacher wrote on their diagnostic form. Use it to know what they were watching for and to fill in domainEvidence.

But never turn their words into your finding. If the teacher wrote "rushed the inference questions" and the recording does not show that, you do not have evidence for it — you have their opinion, which the report already carries in their own words. Say what the recording shows and mark whether it supports, complicates, or adds to what they wrote. A "complicates" that is true is worth more to a teacher than another "supports".

WHAT MAKES THIS WORTH READING

A finding of "the teacher gave feedback on this question" is worth nothing. What is worth reading is the substance: which rule was taught, what the student was actually confused about, what word they did not know, whether they got there themselves or were walked to it. Be specific and be brief. Where the recording shows nothing on a question, say so with covered:false rather than reaching.`

export interface PromptInput {
  transcript: Transcript
  windows: QuestionWindow[]
  /** Fathom's labels mapped to roles, so the model can be told what it is second-guessing. */
  roles: Record<string, 'teacher' | 'student' | 'other'>
  /** The answer rows: what was chosen and whether it was right. */
  answers: {
    itemId: string
    sequence: number
    correct: boolean
    chose: string | null
    answer: string | null
    section: string | null
    skill: string | null
  }[]
  /** The teacher's diagnostic form, verbatim. */
  form: {
    domain: string
    label: string
    performance: 'tick' | 'cross' | null
    performanceNote: string
    strengths: string
    gaps: string
    targets: string
  }[]
  /** The teacher's comments on the session as a whole. */
  reflection: string
}

function clock(seconds: number): string {
  const m = Math.floor(seconds / 60)
  const s = seconds % 60
  return `${m}:${String(s).padStart(2, '0')}`
}

/**
 * One question's window, rendered for the model.
 *
 * Margin lines are prefixed with `~` rather than dropped or silently merged:
 * the model is allowed to use them and the report records that it did, which is
 * the difference between a documented reach and an unexplained one.
 */
function renderWindow(
  transcript: Transcript,
  window: QuestionWindow,
  roles: PromptInput['roles'],
  answer: PromptInput['answers'][number] | undefined,
): string {
  const lines = linesIn(transcript, window.shown)
  const body = lines
    .map((l) => {
      const margin = l.at < window.own.from || l.at >= window.own.to ? '~' : ' '
      return `${margin}@${clock(l.at)} [${roles[l.speaker] ?? 'other'}: ${l.speaker}] ${l.text}`
    })
    .join('\n')

  const head = [
    `itemId: ${window.itemId}`,
    `question ${window.sequence} on the paper`,
    answer ? `the student answered ${answer.chose ?? '—'} (${answer.correct ? 'right' : 'wrong'}; the key is ${answer.answer ?? '—'})` : 'no answer row',
    answer?.skill ? `skill: ${answer.skill}` : null,
  ]
    .filter(Boolean)
    .join(' · ')

  return `--- ${head} ---\n${body || '(nobody speaks in this window)'}`
}

/** The teacher's form, verbatim, as context rather than as findings. */
function renderForm(form: PromptInput['form'], reflection: string): string {
  const rows = form
    .map((r) =>
      [
        `domain key: ${r.domain}  (${r.label})`,
        `  the teacher marked: ${r.performance === 'tick' ? '✓' : r.performance === 'cross' ? '✗' : 'not marked'}${r.performanceNote ? ` — ${r.performanceNote}` : ''}`,
        `  strengths they observed: ${r.strengths || '(blank)'}`,
        `  gaps they observed: ${r.gaps || '(blank)'}`,
        `  next steps they set: ${r.targets || '(blank)'}`,
      ].join('\n'),
    )
    .join('\n\n')

  return `THE TEACHER'S DIAGNOSTIC FORM (their words, not findings for you to repeat)\n\n${rows}\n\nTheir comments on the session:\n${reflection || '(blank)'}`
}

export function buildPrompt(input: PromptInput): string {
  const answers = new Map(input.answers.map((a) => [a.itemId, a]))
  const windows = input.windows
    .map((w) => renderWindow(input.transcript, w, input.roles, answers.get(w.itemId)))
    .join('\n\n')

  const domains = input.form.map((f) => f.domain).join(', ')

  return [
    renderForm(input.form, input.reflection),
    `THE FOUR DOMAIN KEYS you may file domainEvidence under: ${domains}`,
    `THE RECORDING, cut into one window per question. Lines marked ~ are from the margin either side.\n\n${windows}`,
    `Now record the reading by calling the record_reading tool — that call is the whole answer, so do not write the findings as prose instead. One entry per window above, using the itemId exactly as given. Every claim carries a verbatim quote from inside its own window.`,
  ].join('\n\n========================================\n\n')
}
