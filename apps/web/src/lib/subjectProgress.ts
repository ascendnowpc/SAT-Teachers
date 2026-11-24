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
import { SECTIONS, SKILLS } from './constants'
import { latestDomains, SAT_DOMAINS, type Band, type BluebookRow } from './bluebook'
import { ragFor, type Rag } from './parentReport'
import { progressLines, reached, type ProgressItem, type StudentProgress, type Verdict } from './progress'
import type { SessionMode, Subject } from './types'

/** What the student's pages call each subject, and the half of the SAT it is. */
export const SUBJECT_VIEW: Record<Subject, { name: string; sat: string; tone: 'violet' | 'sky' }> = {
  english: { name: 'English', sat: 'Reading & Writing', tone: 'violet' },
  mathematics: { name: 'Math', sat: 'Math', tone: 'sky' },
}

export const SUBJECT_ORDER: Subject[] = ['english', 'mathematics']

/** One test's go at a part: how much of what it asked there was right. */
export interface Attempt {
  sessionId: string
  at: string
  mode: SessionMode
  right: number
  of: number
}

export interface Measure {
  /** Oldest first. */
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
}

export interface SkillMeasure extends Measure {
  skill: string
  label: string
  /** The computed verdict on its targeted-test line (0063), when it has a step. */
  verdict: Verdict | null
}

export interface SectionMeasure extends Measure {
  section: string
  label: string
  skills: SkillMeasure[]
  /** The SAT's own band for this domain, from the latest score report that gave one. */
  band: { range: Band; on: string } | null
  verdict: Verdict | null
}

export interface SubjectMeasure extends Measure {
  subject: Subject
  sections: SectionMeasure[]
  /** Skills by the colour of their latest attempt; `none` for never asked. */
  skillCounts: Record<Rag | 'none', number>
}

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

export function measureOf(attempts: Attempt[]): Measure {
  const first = attempts[0] ?? null
  const latest = attempts[attempts.length - 1] ?? null
  return {
    attempts,
    first,
    latest,
    answered: attempts.reduce((n, a) => n + a.of, 0),
    right: attempts.reduce((n, a) => n + a.right, 0),
    rag: latest ? ragFor(latest.right, latest.of) : null,
    change: attempts.length > 1 ? percent(latest)! - percent(first)! : null,
  }
}

/**
 * The part's attempts: one for each completed session that reached at least
 * one question on it, oldest first.
 */
function attemptsOn(
  done: StudentProgress['sessions'],
  bySession: Map<string, ProgressItem[]>,
  on: (i: ProgressItem) => boolean,
): Attempt[] {
  const out: Attempt[] = []
  for (const s of done) {
    const mine = (bySession.get(s.id) ?? []).filter(on)
    if (mine.length === 0) continue
    out.push({ sessionId: s.id, at: s.at, mode: s.mode, right: mine.filter((i) => i.is_correct).length, of: mine.length })
  }
  return out
}

/** One subject, by section and by skill. `bluebook` gives each section the SAT's own band. */
export function measureSubject(subject: Subject, p: StudentProgress, bluebook: BluebookRow[] = []): SubjectMeasure {
  const done = p.sessions
    .filter((s) => s.status === 'completed')
    .sort((a, b) => new Date(a.at).getTime() - new Date(b.at).getTime())
  const bySession = new Map<string, ProgressItem[]>()
  for (const i of p.items) {
    if (!reached(i)) continue
    const list = bySession.get(i.session_id)
    if (list) list.push(i)
    else bySession.set(i.session_id, [i])
  }

  const lines = progressLines(p)
  const verdictOn = (section: string, skill: string | null): Verdict | null => {
    const line = lines.find((l) => l.section === section && l.skill === skill)
    return line?.points[line.points.length - 1]?.step?.verdict ?? null
  }
  const report = latestDomains(bluebook)

  const skillCounts: Record<Rag | 'none', number> = { green: 0, amber: 0, red: 0, none: 0 }
  const sections: SectionMeasure[] = sectionsInSatOrder(subject).map((sec) => {
    const skills: SkillMeasure[] = (SKILLS[sec.value] ?? []).map((sk) => {
      const m = measureOf(attemptsOn(done, bySession, (i) => i.section === sec.value && i.skill === sk.value))
      skillCounts[m.rag ?? 'none']++
      return { ...m, skill: sk.value, label: sk.label, verdict: verdictOn(sec.value, sk.value) }
    })
    const range = report?.domains?.[sec.value]
    return {
      ...measureOf(attemptsOn(done, bySession, (i) => i.section === sec.value)),
      section: sec.value,
      label: sec.label,
      skills,
      band: range && report ? { range, on: report.taken_on } : null,
      verdict: verdictOn(sec.value, null),
    }
  })

  return {
    ...measureOf(attemptsOn(done, bySession, () => true)),
    subject,
    sections,
    skillCounts,
  }
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
