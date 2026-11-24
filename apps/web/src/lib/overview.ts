/**
 * My students, at a glance (0104): the PC's view and the teacher's (the
 * section-tracker scope's F9 and F10). One row a student: their next SAT and
 * its registration deadline, their goal against their latest score, and the
 * domains improving or stuck — read by the same functions as every progress
 * page (lib/subjectProgress), from the rows students_overview returns.
 */
import { daysUntil, goalTotal, registrationLabel, type StudentGoal } from './goal.ts'
import { asProgress, type ReportSubject } from './parentReport.ts'
import { measureSubject, SUBJECT_ORDER, SUBJECT_VIEW } from './subjectProgress.ts'
import type { Subject } from './types.ts'

/** One student as students_overview sends them. */
export interface OverviewStudent {
  id: string
  full_name: string
  display_id: string
  pc: string | null
  goal: StudentGoal | null
  sat: { total: number; reading_writing: number; math: number; taken_on: string; test_name: string } | null
  subjects: Partial<Record<Subject, ReportSubject>>
}

export interface DomainNote {
  subject: Subject
  /** "Math · Algebra". */
  label: string
  /** Level points since the baseline. */
  change: number
  sessions: number
}

export interface OverviewRow {
  id: string
  name: string
  displayId: string
  pc: string | null
  nextSat: string | null
  /** Days to it; null with none set or one gone. */
  daysToSat: number | null
  registration: { text: string; urgent: boolean } | null
  goal: StudentGoal | null
  goalTotal: number | null
  confirmed: boolean
  sat: OverviewStudent['sat']
  /** Points still to go on the total; null when either is missing, 0 once reached. */
  gap: number | null
  improving: DomainNote[]
  stuck: DomainNote[]
  /** Domains not yet strong, of those tested. */
  toPractise: number
  tests: number
  lastTestAt: string | null
}

export function overviewRow(s: OverviewStudent, today: string): OverviewRow {
  const improving: DomainNote[] = []
  const stuck: DomainNote[] = []
  let toPractise = 0
  let tests = 0
  let lastTestAt: string | null = null

  for (const subject of SUBJECT_ORDER) {
    const payload = s.subjects[subject]
    if (!payload) continue
    const m = measureSubject(subject, asProgress(payload))
    tests += m.tests
    if (m.latestAt && (!lastTestAt || m.latestAt > lastTestAt)) lastTestAt = m.latestAt
    for (const d of m.sections) {
      if (d.rag && d.rag !== 'green') toPractise++
      if (!d.verdict || d.levelChange === null) continue
      const note = { subject, label: `${SUBJECT_VIEW[subject].name} · ${d.label}`, change: d.levelChange, sessions: d.sessions }
      if (d.verdict === 'improved') improving.push(note)
      else stuck.push(note)
    }
  }

  const next = s.goal?.next_test_on ?? null
  const days = next ? daysUntil(next, today) : null
  const total = goalTotal(s.goal)
  return {
    id: s.id,
    name: s.full_name,
    displayId: s.display_id,
    pc: s.pc,
    nextSat: days !== null && days >= 0 ? next : null,
    daysToSat: days !== null && days >= 0 ? days : null,
    registration: days !== null && days >= 0 ? registrationLabel(s.goal?.registration_deadline_on, today) : null,
    goal: s.goal,
    goalTotal: total,
    confirmed: !!s.goal?.confirmed_at,
    sat: s.sat,
    gap: total !== null && s.sat ? Math.max(0, total - s.sat.total) : null,
    improving: improving.sort((a, b) => b.change - a.change),
    stuck: stuck.sort((a, b) => b.sessions - a.sessions),
    toPractise,
    tests,
    lastTestAt,
  }
}

/** Soonest SAT first; those with none after, by name. */
export function bySatDate(a: OverviewRow, b: OverviewRow): number {
  if (a.daysToSat !== null && b.daysToSat !== null) return a.daysToSat - b.daysToSat || a.name.localeCompare(b.name)
  if (a.daysToSat !== null) return -1
  if (b.daysToSat !== null) return 1
  return a.name.localeCompare(b.name)
}
