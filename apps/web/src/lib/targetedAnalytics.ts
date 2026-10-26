import { hasTable, parsePassage } from './paper.ts'
import { mapScore, rawOutOf10, type ProgressConfig } from './progress.ts'
import { LABOURED_RATIO, RUSHED_RATIO } from './report.ts'
import type { Difficulty } from './types.ts'

/**
 * What one targeted test's answers say (0062), computed on read like the rest
 * of the report: the score and its level, accuracy by difficulty, time against
 * target, what ran out of time, long against short, the formats the questions
 * came in, and the same said in plain English with its counts.
 *
 * And one finding that is not about one test: whether long questions are the
 * trouble, pooled across every test on the skill, because one test of five
 * questions cannot carry that on its own (longPattern).
 */

/** The question, as far as the analysis reads it. */
export interface AnalysedQuestion {
  difficulty: Difficulty
  passage: string | null
  passage_underline: string | null
  stem: string
  image_url: string | null
  target_seconds: number | null
}

/** One question the student met, with its grading. */
export interface AnalysedItem {
  status: 'staged' | 'published' | 'answered' | 'revealed' | 'voided'
  is_correct: boolean | null
  timed_out: boolean
  elapsed_seconds: number | null
  time_limit_seconds: number | null
  question: AnalysedQuestion | null
}

export interface Tally {
  correct: number
  total: number
}

const tally = (): Tally => ({ correct: 0, total: 0 })

/* -------------------------------------------------------------- formats --- */

export type Format = 'paired' | 'table' | 'figure' | 'underlined' | 'prose' | 'no_passage'

export const FORMAT_LABELS: Record<Format, string> = {
  paired: 'Paired texts',
  table: 'With a table',
  figure: 'With a figure',
  underlined: 'Underlined text',
  prose: 'Prose passage',
  no_passage: 'No passage',
}

const FORMAT_ORDER: Format[] = ['paired', 'table', 'figure', 'underlined', 'prose', 'no_passage']

/**
 * What a question looks like on the page, the most particular first: a pair
 * of texts, a table, a figure, an underlined span, a passage, or none.
 */
export function formatOf(
  q: Pick<AnalysedQuestion, 'passage' | 'passage_underline' | 'image_url'>,
): Format {
  const blocks = parsePassage(q.passage)
  if (blocks.filter((b) => b.kind === 'heading').length >= 2) return 'paired'
  if (hasTable(q.passage)) return 'table'
  if (q.image_url) return 'figure'
  if (q.passage_underline && q.passage?.includes(q.passage_underline)) return 'underlined'
  if (q.passage && q.passage.trim()) return 'prose'
  return 'no_passage'
}

/** Words in the passage and the stem together — what "long" is measured on. */
export function wordsIn(q: Pick<AnalysedQuestion, 'passage' | 'stem'>): number {
  const text = `${q.passage ?? ''} ${q.stem ?? ''}`.replace(/\|/g, ' ')
  return text.split(/\s+/).filter((w) => /[\p{L}\p{N}]/u.test(w)).length
}

export function isLong(q: Pick<AnalysedQuestion, 'passage' | 'stem'>, longWords: number): boolean {
  return wordsIn(q) >= longWords
}

/* ------------------------------------------------------------- analysis --- */

export interface TargetedAnalysis {
  /** Questions in the set. */
  setCount: number
  reached: number
  correct: number
  timedOut: number
  notReached: number
  /** Out of 10, over what was reached. Null with nothing reached. */
  raw: number | null
  level: number | null
  byDifficulty: Record<Difficulty, Tally>
  /** Seconds taken and the targets they are measured against, over answered questions with a target. */
  time: { seconds: number; target: number; timed: number }
  /** Wrong in under RUSHED_RATIO of the target. */
  rushed: number
  /** Wrong having taken at least RUSHED_RATIO of the target: not speed. */
  gap: number
  /** Right, but over LABOURED_RATIO of the target. */
  hesitation: number
  long: Tally
  short: Tally
  formats: { format: Format; label: string; tally: Tally }[]
  insights: string[]
}

function isReached(i: Pick<AnalysedItem, 'status'>): boolean {
  return i.status === 'answered' || i.status === 'revealed'
}

/** The target an answer is timed against: the question's own, else the clock it was shown with. */
function targetOf(i: AnalysedItem): number | null {
  return i.question?.target_seconds ?? i.time_limit_seconds ?? null
}

const plural = (n: number, one: string, many = `${one}s`) => `${n} ${n === 1 ? one : many}`

export function analyseTargeted(
  items: AnalysedItem[],
  setCount: number,
  cfg: Pick<ProgressConfig, 'score_points' | 'long_words'>,
): TargetedAnalysis {
  const met = items.filter(isReached)
  const correct = met.filter((i) => i.is_correct).length
  const timedOut = met.filter((i) => i.timed_out).length
  const raw = rawOutOf10(correct, met.length)

  const byDifficulty: Record<Difficulty, Tally> = { easy: tally(), medium: tally(), hard: tally() }
  const long = tally()
  const short = tally()
  const formats = new Map<Format, Tally>()
  const time = { seconds: 0, target: 0, timed: 0 }
  let rushed = 0
  let gap = 0
  let hesitation = 0

  for (const i of met) {
    const right = i.is_correct === true
    const q = i.question
    if (q) {
      const d = byDifficulty[q.difficulty]
      d.total += 1
      if (right) d.correct += 1

      const side = isLong(q, cfg.long_words) ? long : short
      side.total += 1
      if (right) side.correct += 1

      const f = formatOf(q)
      const t = formats.get(f) ?? tally()
      t.total += 1
      if (right) t.correct += 1
      formats.set(f, t)
    }

    // A timed-out question took its whole clock by definition; it is counted
    // as timed out, not as slow.
    const target = targetOf(i)
    if (i.timed_out || target === null || i.elapsed_seconds === null) continue
    time.seconds += i.elapsed_seconds
    time.target += target
    time.timed += 1
    const ratio = i.elapsed_seconds / target
    if (!right && ratio < RUSHED_RATIO) rushed += 1
    else if (!right) gap += 1
    else if (ratio > LABOURED_RATIO) hesitation += 1
  }

  const notReached = Math.max(0, setCount - met.length)
  const level = raw === null ? null : mapScore(raw, cfg.score_points)
  const formatRows = FORMAT_ORDER.filter((f) => formats.has(f)).map((f) => ({
    format: f,
    label: FORMAT_LABELS[f],
    tally: formats.get(f)!,
  }))

  const insights: string[] = []
  if (met.length === 0) {
    insights.push(
      notReached > 0
        ? `Nothing was reached: ${plural(notReached, 'question')} not reached.`
        : 'Nothing was answered.',
    )
  } else {
    insights.push(
      `${correct} of ${met.length} right` +
        (notReached > 0 ? `, ${notReached} not reached` : '') +
        ` — ${raw!.toFixed(1)} out of 10, level score ${Math.round(level!)}.`,
    )
    if (timedOut > 0) insights.push(`${plural(timedOut, 'question')} ran out of time.`)

    const levels = (['easy', 'medium', 'hard'] as Difficulty[]).filter(
      (d) => byDifficulty[d].total > 0,
    )
    if (levels.length > 1) {
      insights.push(
        levels
          .map(
            (d, n) =>
              `${n === 0 ? d[0].toUpperCase() + d.slice(1) : d} ${byDifficulty[d].correct} of ${byDifficulty[d].total}`,
          )
          .join(', ') + '.',
      )
    }
    if (rushed > 0)
      insights.push(
        `Wrong in under half the target time on ${plural(rushed, 'question')} — rushing.`,
      )
    if (gap > 0)
      insights.push(
        `Wrong after taking the time on ${plural(gap, 'question')} — a gap in method or knowledge, not speed.`,
      )
    if (hesitation > 0)
      insights.push(
        `Right but over ${LABOURED_RATIO}× the target time on ${plural(hesitation, 'question')} — hesitation.`,
      )
    if (long.total > 0 && short.total > 0) {
      insights.push(
        `Long questions ${long.correct} of ${long.total} right; short ${short.correct} of ${short.total}.`,
      )
    }
    for (const f of formatRows) {
      if (f.tally.correct < f.tally.total && formatRows.length > 1) {
        insights.push(`${f.label}: ${f.tally.correct} of ${f.tally.total} right.`)
      }
    }
  }

  return {
    setCount,
    reached: met.length,
    correct,
    timedOut,
    notReached,
    raw,
    level,
    byDifficulty,
    time,
    rushed,
    gap,
    hesitation,
    long,
    short,
    formats: formatRows,
    insights,
  }
}

/* -------------------------------------------------------- long pattern --- */

export interface LongPattern {
  flagged: boolean
  long: Tally
  short: Tally
  /** The finding, when flagged; otherwise why it is not (yet) one. */
  text: string
}

/**
 * Whether long questions are the trouble, over every test on the skill. It
 * says so only with at least `pattern_min_each` of each kind and short
 * accuracy at least `pattern_gap` above long — so five questions on one
 * Tuesday never make it a finding.
 */
export function longPattern(
  items: AnalysedItem[],
  cfg: Pick<ProgressConfig, 'long_words' | 'pattern_min_each' | 'pattern_gap'>,
): LongPattern {
  const long = tally()
  const short = tally()
  for (const i of items) {
    if (!isReached(i) || !i.question) continue
    const side = isLong(i.question, cfg.long_words) ? long : short
    side.total += 1
    if (i.is_correct) side.correct += 1
  }
  const enough = long.total >= cfg.pattern_min_each && short.total >= cfg.pattern_min_each
  const gap = enough ? short.correct / short.total - long.correct / long.total : 0
  const flagged = enough && gap >= cfg.pattern_gap
  const counts = `${long.correct} of ${long.total} long right against ${short.correct} of ${short.total} short, across the tests on this skill`
  return {
    flagged,
    long,
    short,
    text: flagged
      ? `Struggles on long questions: ${counts}.`
      : enough
        ? `No long-question pattern: ${counts}.`
        : `Too few questions to say whether length matters yet (${long.total} long, ${short.total} short; ${cfg.pattern_min_each} of each needed).`,
  }
}
