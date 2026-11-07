/**
 * The parent report (0070): one card a parent opens from the student's
 * account — the headline progress, a red / amber / green map of every skill,
 * and the trend on each skill that has had a targeted test.
 *
 * It is drawn from the same numbers and the same line as the staff's progress
 * page (lib/progress), so the two cannot disagree.
 */
import { SECTIONS, SKILLS, skillLabel } from './constants'
import {
  progressLines,
  reached,
  type ProgressConfig,
  type ProgressLine,
  type StudentProgress,
} from './progress'
import type { SessionMode, SessionStatus, Subject } from './types'

/**
 * Where a skill turns amber and green, as a share of the questions reached.
 * Suggested to Ascend Now for confirmation; this is the one place to change.
 */
export const RAG_CUTOFFS = { green: 0.7, amber: 0.4 } as const

export type Rag = 'green' | 'amber' | 'red'

export const RAG_LABEL: Record<Rag, string> = {
  green: 'Strong',
  amber: 'Getting there',
  red: 'Needs work',
}

export function ragFor(right: number, of: number): Rag | null {
  if (of <= 0) return null
  const share = right / of
  if (share >= RAG_CUTOFFS.green) return 'green'
  if (share >= RAG_CUTOFFS.amber) return 'amber'
  return 'red'
}

/* ------------------------------------------------------------ the payload --- */

/** One subject of student_report: student_progress's numbers, cut down. */
export interface ReportSubject {
  sessions: { id: string; mode: SessionMode; status: SessionStatus; at: string }[]
  targeted: { session_id: string; section: string; skill: string | null; set_size: number; set_count: number }[]
  items: {
    session_id: string
    section: string | null
    skill: string | null
    status: 'answered' | 'revealed' | 'voided'
    is_correct: boolean | null
    timed_out: boolean
  }[]
  config: ProgressConfig | null
}

export interface StudentReport {
  student: { full_name: string; display_id: string }
  at: string
  subjects: Partial<Record<Subject, ReportSubject>>
}

/**
 * The shape lib/progress reads. What the report leaves out — question ids,
 * difficulty, timing, the teacher, shared wording — the line never reads.
 */
export function asProgress(s: ReportSubject): StudentProgress {
  return {
    sessions: s.sessions.map((x) => ({ ...x, teacher: null })),
    targeted: s.targeted.map((t) => ({ ...t, question_seconds: null, overall_seconds: 0 })),
    items: s.items.map((i) => ({
      ...i,
      question_id: '',
      difficulty: 'medium' as const,
      elapsed_seconds: null,
      time_limit_seconds: null,
      target_seconds: null,
    })),
    config: s.config,
    summaries: [],
    overrides: [],
  }
}

/* ---------------------------------------------------------------- the map --- */

export interface SkillCell {
  section: string
  skill: string
  label: string
  /** The latest session with answers on the skill; null when never asked. */
  latest: { right: number; of: number; at: string } | null
  rag: Rag | null
}

/**
 * Every skill of the subject, by section, coloured by the latest session that
 * asked it — a diagnostic or a targeted test, whichever came last.
 */
export function skillMap(subject: Subject, p: StudentProgress): { section: string; label: string; skills: SkillCell[] }[] {
  const done = p.sessions
    .filter((s) => s.status === 'completed')
    .sort((a, b) => new Date(b.at).getTime() - new Date(a.at).getTime())

  return SECTIONS[subject].map((sec) => ({
    section: sec.value,
    label: sec.label,
    skills: (SKILLS[sec.value] ?? []).map((sk) => {
      let latest: SkillCell['latest'] = null
      for (const s of done) {
        const mine = p.items.filter(
          (i) => i.session_id === s.id && reached(i) && i.section === sec.value && i.skill === sk.value,
        )
        if (mine.length > 0) {
          latest = { right: mine.filter((i) => i.is_correct).length, of: mine.length, at: s.at }
          break
        }
      }
      return {
        section: sec.value,
        skill: sk.value,
        label: sk.label,
        latest,
        rag: latest ? ragFor(latest.right, latest.of) : null,
      }
    }),
  }))
}

/* ----------------------------------------------------------- the headline --- */

/** Sessions from the first point to the last: every lesson and test after the first. */
export function sessionsOver(line: ProgressLine): number {
  return line.points.slice(1).reduce((n, p) => n + p.sessionsBefore + 1, 0)
}

export interface Headline {
  skill: string
  /** "2/5 → 4/5", or "3/5" with one point. */
  scores: string
  /** "over 4 sessions", "on the first test". */
  over: string
}

const plural = (n: number, word: string) => `${n} ${word}${n === 1 ? '' : 's'}`

/** The line to lead with: the most recent one that has moved, else the most recent. */
export function headline(lines: ProgressLine[]): Headline | null {
  const line = lines.find((l) => l.points.length > 1) ?? lines[0]
  if (!line || line.points.length === 0) return null
  const first = line.points[0]
  const last = line.points[line.points.length - 1]
  const name = (line.skill ? skillLabel(line.skill) : null) ?? 'Whole section'
  if (line.points.length === 1) {
    return {
      skill: name,
      scores: `${last.correct}/${last.reached}`,
      over: last.kind === 'diagnostic' ? 'on the diagnostic' : 'on the first test',
    }
  }
  return {
    skill: name,
    scores: `${first.correct}/${first.reached} → ${last.correct}/${last.reached}`,
    over: `over ${plural(sessionsOver(line), 'session')}`,
  }
}

/** Everything the card draws, for one subject. */
export function buildParentReport(subject: Subject, s: ReportSubject) {
  const p = asProgress(s)
  const lines = progressLines(p)
  return { lines, headline: headline(lines), map: skillMap(subject, p) }
}
