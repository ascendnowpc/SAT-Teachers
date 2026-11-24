/**
 * The Section Progress Report (the section-tracker scope's parent report): one
 * page per subject that the student's PC downloads or emails to the parent.
 *
 *   1. a headline in one sentence — "Information and Ideas improved from 25
 *      to 35 over 4 sessions; Algebra has not moved after 3."
 *   2. the four domains: baseline, latest and change, red / amber / green
 *      with the words as well as the colour
 *   3. the sessions spent on each, so extra hours are argued from numbers
 *   4. two or three patterns in plain words
 *   5. what happens next: the domains the tutor will focus on
 *
 * and the goal for that half of the SAT beside the latest score and the gap.
 * It never predicts a final SAT score: the level score sits beside the raw
 * one, with a note saying what it is.
 *
 * What it says is decided here, from student_progress's rows by the same
 * functions as the progress pages (lib/subjectProgress, lib/progress); the
 * page (pages/SectionReport) and the emailed PDF (_shared/sectionPdf.ts) only
 * lay it out, so the two cannot say different things.
 */
import { byDay, type BluebookRow } from './bluebook.ts'
import type { StudentGoal } from './goal.ts'
import { RAG_LABEL, type Rag } from './parentReport.ts'
import { defaultConfig, reached, VERDICT_LABELS, type ProgressConfig, type StudentProgress } from './progress.ts'
import { RUSHED_RATIO } from './report.ts'
import {
  EMPTY_PROGRESS,
  measureSubject,
  SUBJECT_ORDER,
  SUBJECT_VIEW,
  type SectionMeasure,
  type SubjectMeasure,
} from './subjectProgress.ts'
import type { Subject } from './types.ts'

export interface SectionReportInput {
  student: { full_name: string; display_id: string }
  /** When it is drawn, ISO. */
  at: string
  subjects: Partial<Record<Subject, StudentProgress>>
  goal: StudentGoal | null
  bluebook: BluebookRow[]
  /** Words in each question (passage and stem), for long against short; a question not in it is left out. */
  words?: Map<string, number>
  /** The PC's own lines, printed at the top. */
  note?: string | null
  pc?: string | null
}

export interface ReportPoint {
  level: number
  right: number
  of: number
}

export interface ReportDomain {
  section: string
  label: string
  baseline: ReportPoint | null
  latest: ReportPoint | null
  /** Level points, latest against baseline; null with one test or none. */
  change: number | null
  verdict: string | null
  rag: Rag | null
  /** "Strong", "Getting there", "Needs work", "Not tested yet". */
  status: string
  /** Lessons and check-ins since the baseline. */
  sessions: number
  tests: number
}

export interface ReportGoal {
  target: number | null
  latest: number | null
  /** "50 points to go", "Goal reached", or null when either is missing. */
  gap: string | null
}

export interface ReportSubject {
  subject: Subject
  /** "English — Reading and Writing", "Math". */
  name: string
  headline: string
  domains: ReportDomain[]
  patterns: string[]
  next: string
  goal: ReportGoal
  tests: number
}

export interface SectionReportDoc {
  title: string
  student: string
  studentId: string
  /** "24 November 2026". */
  date: string
  pc: string | null
  note: string | null
  /** "Next SAT: 5 December 2026" — or null. */
  testDay: string | null
  subjects: ReportSubject[]
  scaleNote: string
  footer: string
}

const plural = (n: number, word: string) => `${n} ${word}${n === 1 ? '' : 's'}`
const lvl = (n: number) => String(Math.round(n))

function longDay(day: string): string {
  const d = new Date(day.length === 10 ? `${day}T00:00:00Z` : day)
  return d.toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric', timeZone: 'UTC' })
}

/* ------------------------------------------------------------ headline --- */

/**
 * One sentence: the domain that moved most, and the one that has not moved
 * for longest — or, before any check-in, where the baseline starts.
 */
export function headlineFor(m: SubjectMeasure): string {
  const name = SUBJECT_VIEW[m.subject].name
  const tested = m.sections.filter((s) => s.latest)
  if (tested.length === 0) return `No ${name} tests yet: the first one sets the baseline.`

  const moved = tested
    .filter((s) => s.verdict === 'improved' && s.levelChange !== null)
    .sort((a, b) => b.levelChange! - a.levelChange!)[0]
  const stuck = tested
    .filter((s) => s.verdict === 'minimal' || s.verdict === 'declined')
    .sort((a, b) => b.sessions - a.sessions)[0]

  const parts: string[] = []
  if (moved) {
    parts.push(
      `${moved.label} improved from ${lvl(moved.first!.level)} to ${lvl(moved.latest!.level)} over ${plural(moved.sessions, 'session')}`,
    )
  }
  if (stuck) {
    parts.push(
      stuck.verdict === 'declined'
        ? `${stuck.label} dipped from ${lvl(stuck.first!.level)} to ${lvl(stuck.latest!.level)}, which is common while a new method beds in`
        : `${stuck.label} has not moved after ${plural(stuck.sessions, 'session')}`,
    )
  }
  if (parts.length > 0) return `${parts.join('; ')}.`

  // Only baselines so far, or steps too small to call either way.
  const byShare = [...tested].sort((a, b) => share(b) - share(a))
  const top = byShare[0]
  const low = byShare[byShare.length - 1]
  const lead = `Baseline set on ${tested.length} of ${m.sections.length} domains`
  if (tested.length === 1) return `${lead}: ${top.label}, ${top.latest!.right} of ${top.latest!.of} right.`
  return `${lead}: strongest ${top.label} (${top.latest!.right} of ${top.latest!.of}), weakest ${low.label} (${low.latest!.right} of ${low.latest!.of}).`
}

const share = (s: SectionMeasure) => (s.latest && s.latest.of > 0 ? s.latest.right / s.latest.of : 0)

/* ------------------------------------------------------------ patterns --- */

interface Tally {
  right: number
  of: number
}
const t = (): Tally => ({ right: 0, of: 0 })
const of = (x: Tally) => `${x.right} of ${x.of}`
const rate = (x: Tally) => (x.of > 0 ? x.right / x.of : 0)

/**
 * Two or three things the answers say, in a parent's words, from the
 * diagnostics and check-ins in the subject: long against short (where the
 * questions' length is known), running out of time, answering too fast, and
 * easy against hard. Each needs enough questions to be said at all.
 */
export function patternsFor(p: StudentProgress, cfg: ProgressConfig, words?: Map<string, number>): string[] {
  const measured = new Set(p.sessions.filter((s) => s.status === 'completed' && s.mode !== 'live').map((s) => s.id))
  const items = p.items.filter((i) => reached(i) && measured.has(i.session_id))
  if (items.length === 0) return []
  const out: string[] = []

  // Long against short.
  const long = t()
  const short = t()
  if (words) {
    for (const i of items) {
      const n = words.get(i.question_id)
      if (n === undefined) continue
      const side = n >= cfg.long_words ? long : short
      side.of += 1
      if (i.is_correct) side.right += 1
    }
  }
  const enough = long.of >= cfg.pattern_min_each && short.of >= cfg.pattern_min_each
  const lengthGap = enough ? rate(short) - rate(long) : 0
  if (enough && lengthGap >= cfg.pattern_gap) {
    out.push(
      rate(long) < 0.5
        ? `Answers short questions well (${of(short)} right) but misses most long ones (${of(long)}).`
        : `Does better on short questions (${of(short)} right) than on long ones (${of(long)}).`,
    )
  }

  // Running out of time.
  const timedOut = items.filter((i) => i.timed_out).length
  if (timedOut >= 2 && timedOut / items.length >= 0.1) {
    out.push(`Runs out of time on some questions: ${timedOut} of ${items.length} timed out.`)
  }

  // Answering too fast: wrong, in under half the time the question is meant to take.
  const wrong = items.filter((i) => i.is_correct === false && !i.timed_out)
  const rushed = wrong.filter((i) => {
    const target = i.target_seconds ?? i.time_limit_seconds
    return target !== null && i.elapsed_seconds !== null && i.elapsed_seconds < RUSHED_RATIO * target
  }).length
  if (rushed >= 2 && rushed / Math.max(1, wrong.length) >= 0.25) {
    out.push(`Some wrong answers come very fast (${rushed} of ${wrong.length}): slowing down on those would help.`)
  }

  // Easy against hard.
  const easy = t()
  const hard = t()
  for (const i of items) {
    const side = i.difficulty === 'easy' ? easy : i.difficulty === 'hard' ? hard : null
    if (!side) continue
    side.of += 1
    if (i.is_correct) side.right += 1
  }
  if (easy.of >= 3 && hard.of >= 3) {
    if (rate(easy) >= 0.7 && rate(hard) < 0.4) {
      out.push(`Gets most easy questions right (${of(easy)}); the hard ones are the next step (${of(hard)}).`)
    } else if (rate(hard) >= 0.6) {
      out.push(`Handles hard questions well (${of(hard)} right).`)
    } else if (rate(easy) < 0.5) {
      out.push(`Still misses some easy questions (${of(easy)} right), so the basics come first.`)
    }
  }

  // Length that made no difference is worth saying when there is room.
  if (enough && lengthGap < cfg.pattern_gap && out.length < 3) {
    out.push(`Long and short questions go about equally well (${of(long)} long, ${of(short)} short right).`)
  }

  return out.slice(0, 3)
}

/* ---------------------------------------------------------------- next --- */

/** The domains the tutor will focus on: the weakest two that are not yet strong, and what is untested. */
export function nextFor(m: SubjectMeasure): string {
  const tested = m.sections.filter((s) => s.latest)
  const untested = m.sections.filter((s) => !s.latest)
  const weak = tested
    .filter((s) => s.rag !== 'green' || s.verdict === 'declined')
    .sort((a, b) => share(a) - share(b))
    .slice(0, 2)
  const names = (xs: SectionMeasure[]) =>
    xs.length <= 1 ? (xs[0]?.label ?? '') : `${xs.slice(0, -1).map((x) => x.label).join(', ')} and ${xs[xs.length - 1].label}`

  const parts: string[] = []
  if (weak.length > 0) parts.push(`Next, the tutor will focus on ${names(weak)}.`)
  else if (tested.length > 0) parts.push('Every domain tested so far is strong; next is keeping them there with mixed practice.')
  if (untested.length > 0) {
    parts.push(
      `${names(untested)} ${untested.length === 1 ? 'has' : 'have'} not been tested yet; a first check-in will set ${untested.length === 1 ? 'its' : 'their'} baseline.`,
    )
  }
  return parts.join(' ')
}

/* ----------------------------------------------------------------- doc --- */

function domainRow(s: SectionMeasure): ReportDomain {
  const point = (a: SectionMeasure['first']): ReportPoint | null => (a ? { level: a.level, right: a.right, of: a.of } : null)
  return {
    section: s.section,
    label: s.label,
    baseline: point(s.first),
    latest: s.attempts.length > 1 ? point(s.latest) : null,
    change: s.levelChange,
    verdict: s.verdict ? VERDICT_LABELS[s.verdict] : null,
    rag: s.rag,
    status: s.rag ? RAG_LABEL[s.rag] : 'Not tested yet',
    sessions: s.sessions,
    tests: s.attempts.length,
  }
}

/** "0 of 10 right = 20, 5 = 30, 8 = 40" — the mapping, from the admin's settings. */
export function scaleNote(cfg: ProgressConfig): string {
  const pts = [...cfg.score_points].sort((a, b) => a[0] - b[0])
  const map = pts.map(([raw, level], i) => (i === 0 ? `${raw} of 10 right = ${level}` : `${raw} = ${level}`)).join(', ')
  return `Level scores put each check-in on the school’s scale (${map}). They measure these questions only and are not a predicted SAT score.`
}

export function sectionReportDoc(input: SectionReportInput): SectionReportDoc {
  const sat = byDay(input.bluebook)
  const last = sat[sat.length - 1] ?? null
  const cfgOf = (s: Subject) => input.subjects[s]?.config ?? defaultConfig(s)

  const subjects: ReportSubject[] = []
  for (const subject of SUBJECT_ORDER) {
    const p = input.subjects[subject]
    if (!p) continue
    const m = measureSubject(subject, p ?? EMPTY_PROGRESS, input.bluebook)
    if (m.tests === 0) continue
    const view = SUBJECT_VIEW[subject]
    const target = subject === 'english' ? (input.goal?.target_rw ?? null) : (input.goal?.target_math ?? null)
    const latest = last ? (subject === 'english' ? last.reading_writing : last.math) : null
    subjects.push({
      subject,
      name: view.sat === view.name ? view.name : `${view.name} — ${view.sat.replace('&', 'and')}`,
      headline: headlineFor(m),
      domains: m.sections.map(domainRow),
      patterns: patternsFor(p, cfgOf(subject), input.words),
      next: nextFor(m),
      goal: {
        target,
        latest,
        gap: target !== null && latest !== null ? (target - latest > 0 ? `${target - latest} points to go` : 'Goal reached') : null,
      },
      tests: m.tests,
    })
  }

  const cfg = input.subjects.english?.config ?? input.subjects.mathematics?.config ?? defaultConfig('english')
  return {
    title: 'Section Progress Report',
    student: input.student.full_name,
    studentId: input.student.display_id,
    date: longDay(input.at),
    pc: input.pc ?? null,
    note: input.note?.trim() ? input.note.trim() : null,
    testDay: input.goal?.next_test_on ? `Next SAT: ${longDay(input.goal.next_test_on)}` : null,
    subjects,
    scaleNote: scaleNote(cfg),
    footer: `Ascend Now · Section Progress Report · ${input.student.full_name} (${input.student.display_id}) · ${longDay(input.at)}`,
  }
}
