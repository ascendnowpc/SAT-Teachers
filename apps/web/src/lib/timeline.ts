/**
 * The performance timeline (the dashboard blueprint): every full test the
 * student has a score for — official SATs and practice tests, those from
 * before they joined Ascend Now too — in the order they were sat, and their
 * target at the end. Click a point, and the English and Math boxes below show
 * that test: its section scores, and each domain as it stood on that day.
 */
import type { Band, BluebookRow } from './bluebook.ts'
import { goalTotal, type StudentGoal } from './goal.ts'
import { ragForLevel, type Rag } from './parentReport.ts'
import type { SectionMeasure, SubjectMeasure } from './subjectProgress.ts'

export interface TimelinePoint {
  /** `${day}/${name}` for a test, 'target' for the target. */
  id: string
  kind: 'test' | 'target'
  /** YYYY-MM-DD; for the target, the next SAT if set. */
  day: string | null
  total: number
  rw: number | null
  math: number | null
  name: string
  /** "before AscendNow", "official", the test's own name, or "target". */
  tag: string
  /** Sat before the student joined: drawn dashed. */
  before: boolean
  official: boolean
  /** The SAT's own domain bands, where the report gave them. */
  domains: Record<string, Band> | null
}

/** "Sep 26" — the month and the year, as the blueprint labels a point. */
const MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

export function monthYearShort(day: string): string {
  return `${MONTHS[Number(day.slice(5, 7)) - 1]} ${day.slice(2, 4)}`
}

export function timelinePoints(
  rows: Pick<BluebookRow, 'test_name' | 'taken_on' | 'total' | 'reading_writing' | 'math' | 'official' | 'domains'>[],
  goal: StudentGoal | null,
  joinedOn: string | null,
): TimelinePoint[] {
  const tests: TimelinePoint[] = [...rows]
    .sort((a, b) => a.taken_on.localeCompare(b.taken_on))
    .map((r) => {
      const before = !!joinedOn && r.taken_on < joinedOn
      return {
        id: `${r.taken_on}/${r.test_name}`,
        kind: 'test' as const,
        day: r.taken_on,
        total: r.total,
        rw: r.reading_writing,
        math: r.math,
        name: r.test_name,
        tag: before ? 'before AscendNow' : r.official ? 'official' : r.test_name,
        before,
        official: !!r.official,
        domains: r.domains ?? null,
      }
    })
  const target = goalTotal(goal)
  if (target === null) return tests
  return [
    ...tests,
    {
      id: 'target',
      kind: 'target',
      day: goal?.next_test_on ?? null,
      total: target,
      rw: goal?.target_rw ?? null,
      math: goal?.target_math ?? null,
      name: 'Target',
      tag: 'target',
      before: false,
      official: false,
      domains: null,
    },
  ]
}

/** What the boxes open on: the latest test, else the target, else nothing. */
export function defaultPoint(points: TimelinePoint[]): string | null {
  const tests = points.filter((p) => p.kind === 'test')
  return tests[tests.length - 1]?.id ?? points.find((p) => p.kind === 'target')?.id ?? null
}

/**
 * The day the domains are read as of, for a chosen point: that test's day for
 * an earlier test; null — every check-in so far — for the latest test or the
 * target, so the boxes never open on something staler than now.
 */
export function asOfDay(points: TimelinePoint[], id: string | null): string | null {
  const tests = points.filter((p) => p.kind === 'test')
  const chosen = points.find((p) => p.id === id)
  if (!chosen || chosen.kind === 'target' || chosen.id === tests[tests.length - 1]?.id) return null
  return chosen.day
}

export interface DomainAt {
  section: string
  label: string
  /** The level on that day — null when nothing had asked it yet. */
  level: number | null
  right: number
  of: number
  rag: Rag | null
  /** Points on its line up to that day: the baseline, then each check-in. */
  tests: number
  skills: { skill: string; label: string; level: number | null; right: number; of: number; rag: Rag | null }[]
}

function lastBy<T extends { at: string }>(attempts: T[], day: string | null): T | null {
  const upTo = day === null ? attempts : attempts.filter((a) => a.at.slice(0, 10) <= day)
  return upTo[upTo.length - 1] ?? null
}

/** Each domain of a subject — and each of its skills — as it stood on `day` (null: now). */
export function domainsAt(m: SubjectMeasure, day: string | null): DomainAt[] {
  return m.sections.map((s: SectionMeasure) => {
    const a = lastBy(s.attempts, day)
    return {
      section: s.section,
      label: s.label,
      level: a ? a.level : null,
      right: a?.right ?? 0,
      of: a?.of ?? 0,
      rag: a ? ragForLevel(a.level) : null,
      tests: day === null ? s.attempts.length : s.attempts.filter((x) => x.at.slice(0, 10) <= day).length,
      skills: s.skills.map((k) => {
        const b = lastBy(k.attempts, day)
        return {
          skill: k.skill,
          label: k.label,
          level: b ? b.level : null,
          right: b?.right ?? 0,
          of: b?.of ?? 0,
          rag: b ? ragForLevel(b.level) : null,
        }
      }),
    }
  })
}
