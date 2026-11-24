/**
 * The SAT by its parts: English and Math apart, and inside each its four
 * sections — the SAT's own domains — and their skills, each measured on its
 * own. For every part: every test that asked it, first to latest, how much of
 * it was right each time, and where it stands now.
 *
 * Drawn from the same rows as the parent report (student_report, 0070), so a
 * section's figures and the skill map cannot disagree: a skill's latest
 * attempt here is the one its colour there comes from.
 */
import { SECTIONS, SKILLS } from './constants.ts'
import { latestDomains, SAT_DOMAINS, type Band, type BluebookRow } from './bluebook.ts'
import { ragForLevel, type Rag } from './parentReport.ts'
import {
  domainLine,
  progressLine,
  reached,
  sessionsSpent,
  type ProgressItem,
  type ProgressLine,
  type StudentProgress,
  type Verdict,
} from './progress.ts'
import type { SessionMode, Subject } from './types.ts'

/** What the student's pages call each subject, and the half of the SAT it is. */
export const SUBJECT_VIEW: Record<Subject, { name: string; sat: string; tone: 'violet' | 'sky' }> = {
  english: { name: 'English', sat: 'Reading & Writing', tone: 'violet' },
  mathematics: { name: 'Math', sat: 'Math', tone: 'sky' },
}

export const SUBJECT_ORDER: Subject[] = ['english', 'mathematics']

/**
 * One point on a part's line: the diagnostic baseline, or a check-in (a
 * targeted test) that asked it — how much of what it asked there was right,
 * and that on the level scale.
 */
export interface Attempt {
  sessionId: string
  at: string
  mode: SessionMode
  right: number
  of: number
  /** The level score (0061's 20 / 30 / 40 scale) — never a predicted SAT score. */
  level: number
  /** Lessons and diagnostics since the point before. */
  sessionsBefore: number
}

export interface Measure {
  /** Oldest first: the baseline, then each check-in. */
  attempts: Attempt[]
  first: Attempt | null
  latest: Attempt | null
  /** Questions reached across every attempt, and how many of them were right. */
  answered: number
  right: number
  /** The latest attempt's colour (lib/parentReport's cut-offs); null when never asked. */
  rag: Rag | null
  /** Percentage points, the latest attempt against the first; null with fewer than two. */
  change: number | null
  /** Level points, the latest against the baseline; null with fewer than two. */
  levelChange: number | null
  /** The computed verdict of the last step (0063): Improved, Minimal change, Declined. */
  verdict: Verdict | null
  /** Sessions from the baseline to the latest point: every lesson and check-in after the first. */
  sessions: number
}

export interface SkillMeasure extends Measure {
  skill: string
  label: string
}

export interface SectionMeasure extends Measure {
  section: string
  label: string
  skills: SkillMeasure[]
  /** The SAT's own band for this domain, from the latest score report that gave one. */
  band: { range: Band; on: string } | null
  /** Lessons and diagnostics since the latest point — "3 sessions since the last check-in". */
  sinceLast: number
}

export interface SubjectMeasure {
  subject: Subject
  /** Diagnostics and check-ins done in the subject. */
  tests: number
  /** Questions reached on them, and right. */
  answered: number
  right: number
  /** Lessons done in the subject. */
  lessons: number
  /** The latest test's day, or null. */
  latestAt: string | null
  sections: SectionMeasure[]
  /** Skills by the colour of their latest attempt; `none` for never asked. */
  skillCounts: Record<Rag | 'none', number>
}

/** A subject with nothing in it yet: every domain reads as not tested. */
export const EMPTY_PROGRESS: StudentProgress = { sessions: [], targeted: [], items: [], config: null, summaries: [], overrides: [] }

/** A subject's four sections in College Board's order — the score report's — with the app's names. */
export function sectionsInSatOrder(subject: Subject): { value: string; label: string }[] {
  return SAT_DOMAINS.filter((d) => d.subject === subject).map(
    (d) => SECTIONS[subject].find((s) => s.value === d.section) ?? { value: d.section, label: d.label },
  )
}

/** A whole percentage, or null for nothing asked. */
export function percent(a: { right: number; of: number } | null | undefined): number | null {
  return a && a.of > 0 ? Math.round((a.right / a.of) * 100) : null
}

/** A line, read as a part's measure. */
export function measureOf(line: ProgressLine | null): Measure {
  const attempts: Attempt[] = (line?.points ?? []).map((x) => ({
    sessionId: x.sessionId,
    at: x.at,
    mode: x.kind === 'diagnostic' ? 'diagnostic' : 'targeted',
    right: x.correct,
    of: x.reached,
    level: x.level,
    sessionsBefore: x.sessionsBefore,
  }))
  const first = attempts[0] ?? null
  const latest = attempts[attempts.length - 1] ?? null
  const two = attempts.length > 1
  return {
    attempts,
    first,
    latest,
    answered: attempts.reduce((n, a) => n + a.of, 0),
    right: attempts.reduce((n, a) => n + a.right, 0),
    rag: latest ? ragForLevel(latest.level) : null,
    change: two ? percent(latest)! - percent(first)! : null,
    levelChange: two ? Math.round(latest!.level - first!.level) : null,
    verdict: line?.points[line.points.length - 1]?.step?.verdict ?? null,
    sessions: line ? sessionsSpent(line) : 0,
  }
}

/**
 * One subject, by section and by skill. A section is its domain's line
 * (lib/progress domainLine) and a skill its own line: the diagnostic baseline,
 * then each check-in that asked it. `bluebook` gives each section the SAT's
 * own band.
 */
export function measureSubject(subject: Subject, p: StudentProgress, bluebook: BluebookRow[] = []): SubjectMeasure {
  const report = latestDomains(bluebook)
  const skillCounts: Record<Rag | 'none', number> = { green: 0, amber: 0, red: 0, none: 0 }

  const sections: SectionMeasure[] = sectionsInSatOrder(subject).map((sec) => {
    const skills: SkillMeasure[] = (SKILLS[sec.value] ?? []).map((sk) => {
      const m = measureOf(progressLine(p, sec.value, sk.value))
      skillCounts[m.rag ?? 'none']++
      return { ...m, skill: sk.value, label: sk.label }
    })
    const line = domainLine(p, sec.value)
    const range = report?.domains?.[sec.value]
    return {
      ...measureOf(line),
      section: sec.value,
      label: sec.label,
      skills,
      band: range && report ? { range, on: report.taken_on } : null,
      sinceLast: line.points.length > 0 ? line.sinceLast : 0,
    }
  })

  // The subject's tests: diagnostics and check-ins with anything reached.
  const asked = new Set(p.items.filter(reached).map((i) => i.session_id))
  const done = p.sessions.filter((x) => x.status === 'completed')
  const tests = done.filter((x) => x.mode !== 'live' && asked.has(x.id))
  const testIds = new Set(tests.map((x) => x.id))
  const met = p.items.filter((i) => reached(i) && testIds.has(i.session_id))
  const latestAt = tests.map((x) => x.at).sort().pop() ?? null

  return {
    subject,
    tests: tests.length,
    answered: met.length,
    right: met.filter((i) => i.is_correct).length,
    lessons: done.filter((x) => x.mode === 'live').length,
    latestAt,
    sections,
    skillCounts,
  }
}

/**
 * The domains to lead with: the strongest and the weakest that have been
 * tested, by the latest attempt's share right — ties to the one tested later.
 */
export function strongestAndWeakest(m: SubjectMeasure): { strongest: SectionMeasure | null; weakest: SectionMeasure | null } {
  const tested = m.sections.filter((s) => s.latest)
  if (tested.length === 0) return { strongest: null, weakest: null }
  const share = (s: SectionMeasure) => s.latest!.right / s.latest!.of
  const byShare = [...tested].sort((a, b) => share(b) - share(a) || b.latest!.at.localeCompare(a.latest!.at))
  const strongest = byShare[0]
  const weakest = byShare[byShare.length - 1]
  return { strongest, weakest: tested.length > 1 ? weakest : null }
}

/**
 * One test's score split by section, in the SAT's order — what the student's
 * home page shows under their last test. `revealedOnly` for a lesson or a
 * diagnostic, whose score is what the teacher has revealed; a targeted test's
 * is every question reached (0068).
 */
export function testBySection(
  subject: Subject,
  items: Pick<ProgressItem, 'session_id' | 'section' | 'status' | 'is_correct'>[],
  sessionId: string,
  revealedOnly: boolean,
): { section: string; label: string; right: number; of: number }[] {
  const mine = items.filter(
    (i) => i.session_id === sessionId && (revealedOnly ? i.status === 'revealed' : reached(i)),
  )
  return sectionsInSatOrder(subject)
    .map((sec) => {
      const on = mine.filter((i) => i.section === sec.value)
      return { section: sec.value, label: sec.label, right: on.filter((i) => i.is_correct).length, of: on.length }
    })
    .filter((x) => x.of > 0)
}

/** "Practice test", "Diagnostic", "Lesson" — what the student calls a session. */
export function attemptKind(mode: SessionMode): string {
  return mode === 'targeted' ? 'Practice test' : mode === 'diagnostic' ? 'Diagnostic' : 'Lesson'
}

/** "+12", "−8", "±0" percentage points. */
export function signedPoints(n: number): string {
  return n > 0 ? `+${n}` : n < 0 ? `−${-n}` : '±0'
}
