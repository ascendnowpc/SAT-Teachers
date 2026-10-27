import { sectionLabel, skillLabel, subjectLabel } from './constants.ts'
import {
  defaultConfig,
  onePointWorth,
  progressLines,
  VERDICT_LABELS,
  type ProgressConfig,
  type StudentProgress,
} from './progress.ts'
import {
  analyseTargeted,
  longPattern,
  type AnalysedItem,
  type AnalysedQuestion,
} from './targetedAnalytics.ts'
import type { Subject } from './types.ts'

/**
 * A short reading of every targeted test a student has sat in a subject, by
 * Gemini, on a button (summarise_targeted_tests).
 *
 * The model is not shown the answers or the questions. It is shown the
 * numbers the report already computes — each skill's line from the baseline,
 * each test's score and level score, the change and its verdict, accuracy by
 * level, rushing, gaps and hesitation, long against short — and asked for a
 * headline, a few points and one next step, each a sentence. Everything it
 * may say is in the facts; the prompt tells it so, and the schema keeps the
 * answer to that shape and that length.
 *
 * The facts are built here rather than in the edge function so they are the
 * same functions the page and the PDF use, and so they can be tested.
 */

/** One point on a skill's line, as the model reads it. */
export interface FactPoint {
  date: string
  what: 'baseline diagnostic' | 'baseline test' | 'targeted test'
  right: string
  out_of_10: number
  level_score: number
  timed_out: number
  not_reached: number
  /** From the point before: "Improved (+6)". Null on the baseline. */
  change: string | null
  sessions_between: number | null
  /** A test's own reading, beyond its score. Null for the baseline diagnostic. */
  detail: {
    by_level: Record<string, string>
    rushed: number
    gap_in_method: number
    hesitated: number
    long_vs_short: string | null
  } | null
}

export interface SkillFacts {
  skill: string
  points: FactPoint[]
  long_question_pattern: string | null
  sessions_since_last: number
}

export interface SummaryFacts {
  student: string
  subject: string
  tests: number
  scale: string
  thresholds: string
  skills: SkillFacts[]
}

const round1 = (n: number) => Math.round(n * 10) / 10

/**
 * student_progress's items for one test, as the analysis reads them. A
 * question the caller could not read still has its level and target on the
 * item, so it still counts by level and against its time.
 */
function itemsOf(
  p: StudentProgress,
  sessionId: string,
  questions: Map<string, AnalysedQuestion>,
): AnalysedItem[] {
  return p.items
    .filter((i) => i.session_id === sessionId)
    .map((i) => ({
      status: i.status,
      is_correct: i.is_correct,
      timed_out: i.timed_out,
      elapsed_seconds: i.elapsed_seconds,
      time_limit_seconds: i.time_limit_seconds,
      question: questions.get(i.question_id) ?? {
        difficulty: i.difficulty,
        passage: null,
        passage_underline: null,
        stem: '',
        image_url: null,
        target_seconds: i.target_seconds,
      },
    }))
}

export function summaryFacts(
  p: StudentProgress,
  questions: Map<string, AnalysedQuestion>,
  student: string,
  subject: Subject,
): SummaryFacts {
  const cfg: ProgressConfig = p.config ?? defaultConfig(subject)
  const lines = progressLines(p)
  let tests = 0

  const skills = lines.map((line) => {
    const points = line.points.map((pt): FactPoint => {
      if (pt.kind === 'test') tests += 1
      const setCount = p.targeted.find((t) => t.session_id === pt.sessionId)?.set_count ?? 0
      const a =
        pt.kind === 'test'
          ? analyseTargeted(itemsOf(p, pt.sessionId, questions), setCount, cfg)
          : null
      return {
        date: pt.at.slice(0, 10),
        what: pt.isBaseline
          ? pt.kind === 'diagnostic'
            ? 'baseline diagnostic'
            : 'baseline test'
          : 'targeted test',
        right: `${pt.correct} of ${pt.reached}`,
        out_of_10: round1(pt.raw),
        level_score: Math.round(pt.level),
        timed_out: pt.timedOut,
        not_reached: pt.notReached,
        change: pt.step
          ? `${VERDICT_LABELS[pt.step.verdict]} (${pt.step.delta >= 0 ? '+' : ''}${Math.round(pt.step.delta)})`
          : null,
        sessions_between: pt.isBaseline ? null : pt.sessionsBefore,
        detail: a
          ? {
              by_level: Object.fromEntries(
                Object.entries(a.byDifficulty)
                  .filter(([, t]) => t.total > 0)
                  .map(([l, t]) => [l, `${t.correct} of ${t.total}`]),
              ),
              rushed: a.rushed,
              gap_in_method: a.gap,
              hesitated: a.hesitation,
              long_vs_short:
                a.long.total > 0 && a.short.total > 0
                  ? `long ${a.long.correct} of ${a.long.total}, short ${a.short.correct} of ${a.short.total}`
                  : null,
            }
          : null,
      }
    })
    const testItems = line.points
      .filter((x) => x.kind === 'test')
      .flatMap((x) => itemsOf(p, x.sessionId, questions))
    const pattern = testItems.length ? longPattern(testItems, cfg) : null
    return {
      skill: line.skill
        ? `${skillLabel(line.skill)} (${sectionLabel(line.section)})`
        : `${sectionLabel(line.section)}, the whole section`,
      points,
      long_question_pattern: pattern?.text ?? null,
      sessions_since_last: line.sinceLast,
    }
  })

  const pts = [...cfg.score_points].sort((a, b) => a[0] - b[0])
  const worth = Math.round(onePointWorth(cfg.default_set_size, 5, cfg.score_points))
  return {
    student,
    subject: subjectLabel(subject),
    tests,
    scale: `The score out of 10 is right answers over questions reached, times 10; the level score maps it onto the school's scale through ${pts.map(([r, l]) => `${r}→${l}`).join(', ')}. On a ${cfg.default_set_size}-question test one question is worth about ${worth} level points.`,
    thresholds: `Improved is a rise of ${cfg.improved_at} or more level points from the point before; Declined a fall of ${-cfg.declined_at} or more; anything between is Minimal change.`,
    skills,
  }
}

export const SUMMARY_SYSTEM = [
  'You read an SAT student’s targeted skill tests for their tutor. A targeted test is a short timed set on one skill; the first point on each skill is the baseline.',
  'Be concise: a one-sentence headline, at most four points of one sentence each, and one next step. Plain English, no jargon, no padding, no praise words.',
  'Use only the facts given. Never invent a number, a test, a cause or a reason. When you give a level score, put the right answers beside it (for example "3 of 5, level score 32").',
  'Tests are short, so one question moves the score a lot: when a change rests on one or two questions, say it is a small sample rather than a trend.',
  'Name the skill in each point. Tie the next step to what the numbers show (rushing, gaps in method, hesitation, long questions, a level that is missed), not to general study advice.',
].join('\n')

export function summaryPrompt(facts: SummaryFacts): string {
  return `Every targeted test this student has sat in ${facts.subject}, with how each is scored:\n\n${JSON.stringify(facts, null, 2)}`
}

/** Plain JSON Schema; gemini.ts translates it. */
export const SUMMARY_SCHEMA = {
  type: 'object',
  properties: {
    headline: {
      type: 'string',
      description:
        'The overall picture across every skill tested, in one sentence of at most 25 words.',
    },
    points: {
      type: 'array',
      maxItems: 4,
      description: 'The few things that matter most, most important first.',
      items: {
        type: 'object',
        properties: {
          skill: {
            type: 'string',
            description: 'The skill this point is about, as named in the facts.',
          },
          text: {
            type: 'string',
            description: 'One sentence of at most 30 words, with its numbers.',
          },
        },
        required: ['skill', 'text'],
      },
    },
    next_step: {
      type: 'string',
      description: 'One sentence of at most 25 words: what to work on next, tied to the numbers.',
    },
  },
  required: ['headline', 'points', 'next_step'],
}

export interface TargetedSummary {
  headline: string
  points: { skill: string; text: string }[]
  next_step: string
}

const str = (v: unknown, max: number) =>
  typeof v === 'string' ? v.trim().replace(/\s+/g, ' ').slice(0, max) : ''

/** The model's answer, held to the shape and the length asked for. */
export function parseSummary(raw: unknown): TargetedSummary {
  const o = (raw ?? {}) as Record<string, unknown>
  const points = (Array.isArray(o.points) ? o.points : [])
    .map((p) => {
      const q = (p ?? {}) as Record<string, unknown>
      return { skill: str(q.skill, 120), text: str(q.text, 400) }
    })
    .filter((p) => p.text)
    .slice(0, 4)
  const headline = str(o.headline, 300)
  if (!headline && points.length === 0) throw new Error('Gemini returned an empty summary')
  return { headline, points, next_step: str(o.next_step, 300) }
}
