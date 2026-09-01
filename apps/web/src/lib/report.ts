import { DIAGNOSES, sectionLabel, skillLabel } from './constants'
import type { Diagnosis, SessionItem } from './types'

/**
 * The session report, computed from the session's own rows.
 *
 * Everything here is derived — nothing is stored and nothing is written by
 * hand — so a report cannot drift from what actually happened in the room.
 * That is the rule the report engine is built on: it cites or it does not say
 * it.
 */

/** Under half the target time is a guess dressed as an answer. */
export const RUSHED_RATIO = 0.5
/** Over 1.6× target is the student talking themselves out of a right answer. */
export const LABOURED_RATIO = 1.6

export interface Attempt {
  itemId: string
  sequence: number
  stem: string
  section: string | null
  skill: string | null
  difficulty: string
  correct: boolean
  chose: string | null
  answer: string | null
  seconds: number | null
  target: number | null
  diagnosis: Diagnosis | null
  teacherNote: string | null
  studentReasoning: string | null
  /** Fast and wrong: the pace is the finding, not the answer. */
  rushed: boolean
  /** Slow, whether or not it landed — where the time actually went. */
  laboured: boolean
}

export interface Band {
  key: string
  label: string
  total: number
  correct: number
  seconds: number
  target: number
}

export interface Report {
  total: number
  correct: number
  /** Null rather than 0 when nothing was answered — no attempts is not 0%. */
  accuracy: number | null
  seconds: number
  target: number
  /** Positive means slower than target overall. */
  paceDelta: number | null
  sections: Band[]
  skills: Band[]
  diagnoses: { value: Diagnosis; label: string; count: number }[]
  attempts: Attempt[]
  rushed: Attempt[]
  laboured: Attempt[]
  /** Wrong answers, weakest skill first — what the next session works on. */
  misses: Attempt[]
}

function band(key: string, label: string): Band {
  return { key, label, total: 0, correct: 0, seconds: 0, target: 0 }
}

function tally(map: Map<string, Band>, key: string | null, label: string, a: Attempt) {
  if (!key) return
  const b = map.get(key) ?? band(key, label)
  b.total += 1
  if (a.correct) b.correct += 1
  b.seconds += a.seconds ?? 0
  b.target += a.target ?? 0
  map.set(key, b)
}

/** Weakest first, and within the same accuracy the one with more attempts. */
function byWeakness(a: Band, b: Band): number {
  const ra = a.correct / a.total
  const rb = b.correct / b.total
  if (ra !== rb) return ra - rb
  return b.total - a.total
}

/**
 * The order the lesson actually ran in.
 *
 * Under teacher pacing the questions are not asked in the order the paper
 * holds them — that is the point of it — so the report follows asked_no where
 * there is one. A session the paper paced itself has the two numbers equal, so
 * this is the old ordering there.
 */
export function askOrder(i: SessionItem): number {
  return i.asked_no ?? i.sequence_no
}

export function buildReport(items: SessionItem[]): Report {
  const attempts: Attempt[] = items
    .filter((i) => i.status === 'answered' || i.status === 'revealed')
    .sort((a, b) => askOrder(a) - askOrder(b))
    .map((i) => {
      const a = i.session_item_assessments ?? null
      const seconds = a?.elapsed_seconds ?? null
      const target = i.questions?.target_seconds ?? null
      const correct = a?.is_correct ?? i.revealed_result === 'correct'
      const ratio = seconds !== null && target ? seconds / target : null
      return {
        itemId: i.id,
        sequence: askOrder(i),
        stem: i.questions?.stem ?? '',
        section: i.questions?.section ?? null,
        skill: i.questions?.skill ?? null,
        difficulty: i.questions?.difficulty ?? 'medium',
        correct,
        chose: i.selected_option,
        answer: i.revealed_correct_option,
        seconds,
        target,
        diagnosis: a?.diagnosis ?? null,
        teacherNote: a?.teacher_note ?? null,
        studentReasoning: i.student_reasoning,
        rushed: ratio !== null && !correct && ratio < RUSHED_RATIO,
        laboured: ratio !== null && ratio > LABOURED_RATIO,
      }
    })

  const sections = new Map<string, Band>()
  const skills = new Map<string, Band>()
  const diagnoses = new Map<Diagnosis, number>()

  for (const a of attempts) {
    tally(sections, a.section, sectionLabel(a.section) ?? '', a)
    tally(skills, a.skill, skillLabel(a.skill) ?? '', a)
    if (a.diagnosis) diagnoses.set(a.diagnosis, (diagnoses.get(a.diagnosis) ?? 0) + 1)
  }

  const total = attempts.length
  const correct = attempts.filter((a) => a.correct).length
  const seconds = attempts.reduce((n, a) => n + (a.seconds ?? 0), 0)
  const target = attempts.reduce((n, a) => n + (a.target ?? 0), 0)

  return {
    total,
    correct,
    accuracy: total === 0 ? null : correct / total,
    seconds,
    target,
    paceDelta: target === 0 ? null : seconds - target,
    sections: [...sections.values()].sort(byWeakness),
    skills: [...skills.values()].sort(byWeakness),
    diagnoses: [...diagnoses.entries()]
      .map(([value, count]) => ({
        value,
        label: DIAGNOSES.find((d) => d.value === value)?.label ?? value,
        count,
      }))
      .sort((a, b) => b.count - a.count),
    attempts,
    rushed: attempts.filter((a) => a.rushed),
    laboured: attempts.filter((a) => a.laboured),
    misses: attempts.filter((a) => !a.correct),
  }
}

/** "1m 43s", or "43s" — a report reads better without a leading 0m. */
export function formatDuration(totalSeconds: number | null): string {
  if (totalSeconds === null) return '—'
  const m = Math.floor(totalSeconds / 60)
  const s = totalSeconds % 60
  return m === 0 ? `${s}s` : `${m}m ${s}s`
}

/** How the pace reads next to the target: ahead, on it, or behind. */
export function paceLabel(seconds: number | null, target: number | null): string | null {
  if (seconds === null || !target) return null
  const delta = seconds - target
  if (Math.abs(delta) <= Math.max(5, target * 0.1)) return 'on pace'
  return delta < 0 ? `${formatDuration(-delta)} under` : `${formatDuration(delta)} over`
}
