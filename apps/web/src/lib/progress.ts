import { formatUtc } from './time.ts'
import type { Difficulty, SessionMode, SessionStatus, Subject } from './types.ts'

/**
 * Whether a student has moved on a skill: the line from their baseline through
 * every targeted test on it, the step between each pair, and what the step is
 * called (0061, 0063).
 *
 * Every figure here is computed from student_progress's rows on read — the
 * same rule the report keeps — and the platform only computes. The verdict is
 * arithmetic against the admin's thresholds; what it means is the teacher's,
 * in the override and the summary.
 */

/* --------------------------------------------------------------- config --- */

/** Raw score out of 10 → level score, as [[raw, level], …] with raw rising. */
export type ScorePoints = [number, number][]

/** A row of progress_config (0061). */
export interface ProgressConfig {
  subject: Subject
  score_points: ScorePoints
  improved_at: number
  declined_at: number
  long_words: number
  default_set_size: number
  pattern_min_each: number
  pattern_gap: number
}

/** What 0061 seeds, for a screen that has not read the row yet. */
export function defaultConfig(subject: Subject): ProgressConfig {
  return {
    subject,
    score_points: [
      [0, 20],
      [5, 30],
      [8, 40],
    ],
    improved_at: 5,
    declined_at: -5,
    long_words: subject === 'english' ? 75 : 40,
    default_set_size: 5,
    pattern_min_each: 4,
    pattern_gap: 0.4,
  }
}

/** [[0,20],[5,30]] → "0 20, 5 30", as the settings panel writes it. */
export function formatPoints(points: ScorePoints): string {
  return points.map(([r, l]) => `${r} ${l}`).join(', ')
}

/** "0 20, 5 30, 8 40" → [[0,20],[5,30],[8,40]], or null when it is not that. */
export function parsePoints(text: string): ScorePoints | null {
  const pairs = text
    .split(',')
    .map((p) => p.trim())
    .filter(Boolean)
    .map((p) => p.split(/\s+/).map(Number))
  if (pairs.length < 2) return null
  if (pairs.some((p) => p.length !== 2 || p.some((n) => !Number.isFinite(n)))) return null
  let prev = -1
  for (const [r] of pairs) {
    if (r < 0 || r > 10 || r <= prev) return null
    prev = r
  }
  return pairs as ScorePoints
}

/* ---------------------------------------------------------------- score --- */

/** correct / reached, scaled to 10. Null when nothing was reached — no attempts is not 0. */
export function rawOutOf10(correct: number, reached: number): number | null {
  return reached > 0 ? (correct / reached) * 10 : null
}

/**
 * The level score for a raw score out of 10: linear between the mapping's
 * points; beyond either end, the end segment's slope carries on. With the
 * default (0,20) (5,30) (8,40), 9 ≈ 43.3 and 10 ≈ 46.7.
 */
export function mapScore(raw: number, points: ScorePoints): number {
  const pts = [...points].sort((a, b) => a[0] - b[0])
  if (pts.length === 0) return raw
  if (pts.length === 1) return pts[0][1]
  let i = 0
  while (i < pts.length - 2 && raw > pts[i + 1][0]) i++
  const [x0, y0] = pts[i]
  const [x1, y1] = pts[i + 1]
  return y0 + ((raw - x0) * (y1 - y0)) / (x1 - x0)
}

/**
 * About how many level points one question is worth on a test of `n`
 * questions, around a raw score of `raw` — the caveat every verdict carries.
 * One question is 10/n of the raw score; this is that step through the
 * mapping, up and down from `raw`, averaged where both fit inside 0–10 (the
 * mapping bends, so the two differ).
 */
export function onePointWorth(n: number, raw: number, points: ScorePoints): number {
  if (n <= 0) return 0
  const step = 10 / n
  const at = mapScore(raw, points)
  const steps: number[] = []
  if (raw + step <= 10 + 1e-9) steps.push(Math.abs(mapScore(raw + step, points) - at))
  if (raw - step >= -1e-9) steps.push(Math.abs(at - mapScore(raw - step, points)))
  if (steps.length === 0) return Math.abs(mapScore(10, points) - mapScore(0, points))
  return steps.reduce((x, y) => x + y, 0) / steps.length
}

export function caveatText(n: number, worth: number): string {
  return `On ${n} question${n === 1 ? '' : 's'}, one question is worth about ${Math.round(worth)} points.`
}

/* -------------------------------------------------------------- verdict --- */

export type Verdict = 'improved' | 'minimal' | 'declined'

export function verdictFor(
  delta: number,
  cfg: Pick<ProgressConfig, 'improved_at' | 'declined_at'>,
): Verdict {
  if (delta >= cfg.improved_at) return 'improved'
  if (delta <= cfg.declined_at) return 'declined'
  return 'minimal'
}

export const VERDICT_LABELS: Record<Verdict, string> = {
  improved: 'Improved',
  minimal: 'Minimal change',
  declined: 'Declined',
}

/** The words under a verdict. `between` is the number of sessions between the two points. */
export function verdictText(v: Verdict, between: number): string {
  switch (v) {
    case 'improved':
      return `Improved after ${between} session${between === 1 ? '' : 's'}.`
    case 'minimal':
      return `No significant improvement after ${between} session${between === 1 ? '' : 's'}. This may be a ceiling for this skill, or the student may need to work deeper on method and unlearn habits.`
    case 'declined':
      return 'Flagged for review. A dip is common when learning a new technique.'
  }
}

/* ------------------------------------------------------- the RPC's rows --- */

export interface ProgressSession {
  id: string
  mode: SessionMode
  status: SessionStatus
  /** started_at, or scheduled_at for a session that never started. */
  at: string
  teacher: string | null
}

export interface ProgressTargeted {
  session_id: string
  section: string
  /** Null for a test on the whole section. */
  skill: string | null
  set_size: number
  /** How many questions the set actually held. */
  set_count: number
  question_seconds: number | null
  overall_seconds: number
}

/** One question put in front of the student: numbers only — no option, no key. */
export interface ProgressItem {
  session_id: string
  question_id: string
  section: string | null
  skill: string | null
  difficulty: Difficulty
  status: 'answered' | 'revealed' | 'voided'
  is_correct: boolean | null
  timed_out: boolean
  elapsed_seconds: number | null
  time_limit_seconds: number | null
  target_seconds: number | null
}

export interface SharedSummary {
  section: string
  /** '' for a summary on the whole section. */
  skill: string
  shared: string
  shared_at: string
}

export interface SharedOverride {
  session_id: string
  previous_session_id: string | null
  shared_wording: string | null
  shared_context: string | null
  shared_at: string
}

/** What student_progress returns (0063). */
export interface StudentProgress {
  sessions: ProgressSession[]
  targeted: ProgressTargeted[]
  items: ProgressItem[]
  config: ProgressConfig | null
  summaries: SharedSummary[]
  overrides: SharedOverride[]
}

/* ----------------------------------------------------------------- line --- */

export function reached(i: Pick<ProgressItem, 'status'>): boolean {
  return i.status === 'answered' || i.status === 'revealed'
}

function onKey(
  i: Pick<ProgressItem, 'section' | 'skill'>,
  section: string,
  skill: string | null,
): boolean {
  return i.section === section && (skill === null || i.skill === skill)
}

const time = (s: Pick<ProgressSession, 'at'>) => new Date(s.at).getTime()

export interface Step {
  /** Level points from the point before. */
  delta: number
  verdict: Verdict
  text: string
  /** From the smaller of the two points: the one a single question moves more. */
  caveat: string
}

export interface ProgressPoint {
  sessionId: string
  /** baseline: the diagnostic, or the first test when there is none. */
  kind: 'diagnostic' | 'test'
  isBaseline: boolean
  at: string
  correct: number
  reached: number
  timedOut: number
  /** On a test: the set's questions the student never answered or ran out of time on. */
  notReached: number
  raw: number
  level: number
  /** Completed lessons and diagnostics since the point before, any teacher. */
  sessionsBefore: number
  /** Against the point before; null on the baseline. */
  step: Step | null
  /** The teacher's shared wording for the step, if any, and whether it was written against this pair. */
  override: (SharedOverride & { stale: boolean }) | null
}

export interface ProgressLine {
  section: string
  skill: string | null
  points: ProgressPoint[]
  /** Completed lessons and diagnostics since the last point. */
  sinceLast: number
  /** "3 sessions since the last test on this skill", or null with none. */
  hint: string | null
  summary: SharedSummary | null
}

function completedBetween(
  sessions: ProgressSession[],
  after: number | null,
  before: number | null,
  exclude: Set<string>,
): number {
  return sessions.filter(
    (s) =>
      (s.mode === 'live' || s.mode === 'diagnostic') &&
      s.status === 'completed' &&
      !exclude.has(s.id) &&
      (after === null || time(s) > after) &&
      (before === null || time(s) < before),
  ).length
}

/**
 * The line for one skill (or a whole section, with skill null).
 *
 * Its baseline is the earliest completed diagnostic with answers on the skill
 * that came before the first test on it; without one, the first test is the
 * baseline. Later diagnostics are sessions between, not points: the line is
 * tests on this skill, and a diagnostic measures everything at once.
 */
export function progressLine(
  p: StudentProgress,
  section: string,
  skill: string | null,
): ProgressLine {
  const cfg = p.config ?? defaultConfig('english')
  const byId = new Map(p.sessions.map((s) => [s.id, s]))

  const tests = p.targeted
    .filter((t) => t.section === section && (t.skill ?? null) === skill)
    .map((t) => ({ t, s: byId.get(t.session_id) }))
    .filter(
      (x): x is { t: ProgressTargeted; s: ProgressSession } => !!x.s && x.s.status === 'completed',
    )
    .sort((a, b) => time(a.s) - time(b.s))

  const firstTestAt = tests.length ? time(tests[0].s) : null
  const diagnostic = p.sessions
    .filter(
      (s) =>
        s.mode === 'diagnostic' &&
        s.status === 'completed' &&
        (firstTestAt === null || time(s) < firstTestAt) &&
        p.items.some((i) => i.session_id === s.id && reached(i) && onKey(i, section, skill)),
    )
    .sort((a, b) => time(a) - time(b))[0]

  const raw: Omit<ProgressPoint, 'sessionsBefore' | 'step' | 'override' | 'isBaseline'>[] = []

  if (diagnostic) {
    const mine = p.items.filter(
      (i) => i.session_id === diagnostic.id && reached(i) && onKey(i, section, skill),
    )
    const correct = mine.filter((i) => i.is_correct).length
    const r = rawOutOf10(correct, mine.length) ?? 0
    raw.push({
      sessionId: diagnostic.id,
      kind: 'diagnostic',
      at: diagnostic.at,
      correct,
      reached: mine.length,
      timedOut: mine.filter((i) => i.timed_out).length,
      notReached: 0,
      raw: r,
      level: mapScore(r, cfg.score_points),
    })
  }

  for (const { t, s } of tests) {
    const mine = p.items.filter((i) => i.session_id === s.id && reached(i))
    // A test with nothing reached has no score to plot.
    if (mine.length === 0) continue
    const correct = mine.filter((i) => i.is_correct).length
    const r = rawOutOf10(correct, mine.length) ?? 0
    raw.push({
      sessionId: s.id,
      kind: 'test',
      at: s.at,
      correct,
      reached: mine.length,
      timedOut: mine.filter((i) => i.timed_out).length,
      notReached: Math.max(0, t.set_count - mine.length),
      raw: r,
      level: mapScore(r, cfg.score_points),
    })
  }

  const pointIds = new Set(raw.map((x) => x.sessionId))
  const points: ProgressPoint[] = raw.map((x, idx) => {
    const prev = idx > 0 ? raw[idx - 1] : null
    const sessionsBefore = prev
      ? completedBetween(
          p.sessions,
          new Date(prev.at).getTime(),
          new Date(x.at).getTime(),
          pointIds,
        )
      : 0
    let step: Step | null = null
    if (prev) {
      const delta = x.level - prev.level
      const verdict = verdictFor(delta, cfg)
      const small = prev.reached <= x.reached ? prev : x
      step = {
        delta,
        verdict,
        text: verdictText(verdict, sessionsBefore),
        caveat: caveatText(
          small.reached,
          onePointWorth(small.reached, small.raw, cfg.score_points),
        ),
      }
    }
    const o = x.kind === 'test' ? p.overrides.find((v) => v.session_id === x.sessionId) : undefined
    return {
      ...x,
      isBaseline: idx === 0,
      sessionsBefore,
      step,
      override: o ? { ...o, stale: o.previous_session_id !== (prev?.sessionId ?? null) } : null,
    }
  })

  const last = points[points.length - 1]
  const sinceLast = last
    ? completedBetween(p.sessions, new Date(last.at).getTime(), null, pointIds)
    : 0
  const what = skill === null ? 'section' : 'skill'

  return {
    section,
    skill,
    points,
    sinceLast,
    hint:
      last && sinceLast > 0
        ? `${sinceLast} session${sinceLast === 1 ? '' : 's'} since the last test on this ${what}`
        : null,
    summary: p.summaries.find((s) => s.section === section && s.skill === (skill ?? '')) ?? null,
  }
}

/** Every skill (or section) with a completed targeted test, newest test first. */
export function progressLines(p: StudentProgress): ProgressLine[] {
  const byId = new Map(p.sessions.map((s) => [s.id, s]))
  const keys = new Map<string, { section: string; skill: string | null; at: number }>()
  for (const t of p.targeted) {
    const s = byId.get(t.session_id)
    if (!s || s.status !== 'completed') continue
    const k = `${t.section}/${t.skill ?? ''}`
    const at = time(s)
    const had = keys.get(k)
    if (!had || at > had.at) keys.set(k, { section: t.section, skill: t.skill ?? null, at })
  }
  return [...keys.values()]
    .sort((a, b) => b.at - a.at)
    .map((k) => progressLine(p, k.section, k.skill))
    .filter((l) => l.points.length > 0)
}

/** "3 sessions since the last test on this skill" for a skill, from the rows alone — for the booking form. */
export function sessionsSinceLastTest(
  p: StudentProgress,
  section: string,
  skill: string | null,
): number | null {
  const line = progressLine(p, section, skill)
  return line.points.some((x) => x.kind === 'test') ? line.sinceLast : null
}

/**
 * The line as sentences, for a PDF: one per point, with its step, the step's
 * caveat and the teacher's shared wording under it. The raw score is always
 * beside the mapped one.
 */
export function describeLine(line: ProgressLine): string[] {
  const out: string[] = []
  for (const p of line.points) {
    const what = `${p.isBaseline ? 'Baseline, ' : ''}${p.kind === 'diagnostic' ? 'diagnostic' : 'targeted test'}`
    const extra = [
      p.timedOut > 0 ? `${p.timedOut} timed out` : null,
      p.notReached > 0 ? `${p.notReached} not reached` : null,
    ].filter(Boolean)
    out.push(
      `${formatUtc(p.at)} — ${what}: ${p.correct} of ${p.reached} right${extra.length ? ` (${extra.join(', ')})` : ''}, ${p.raw.toFixed(1)}/10 → ${Math.round(p.level)}.`,
    )
    if (p.step) {
      const sign = p.step.delta >= 0 ? '+' : ''
      out.push(
        `   ${VERDICT_LABELS[p.step.verdict]} (${sign}${Math.round(p.step.delta)}). ${p.step.text} ${p.step.caveat}`,
      )
    }
    if (p.override?.shared_wording) {
      out.push(
        `   Teacher: ${p.override.shared_wording}${p.override.shared_context ? ` — ${p.override.shared_context}` : ''}`,
      )
    }
  }
  if (line.hint) out.push(`${line.hint[0].toUpperCase()}${line.hint.slice(1)}.`)
  return out
}
