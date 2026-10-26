import { difficultyLabel, sectionLabel, skillLabel, subjectLabel } from './constants.ts'
import { describeLine, type ProgressConfig, type ProgressLine } from './progress.ts'
import type { ReportPdfDoc } from './reportPdf.ts'
import { paceLabel } from './report.ts'
import { analyseTargeted, type LongPattern, type TargetedAnalysis } from './targetedAnalytics.ts'
import { formatUtc } from './time.ts'
import type { Difficulty, SessionItem, Subject } from './types.ts'

/**
 * A targeted test's report (0062): its own, simpler than a lesson's — no
 * diagnostic form, no teacher feedback, no recording — computed from its
 * answers on read. The page and the PDF the PC is sent are made from the same
 * rows by the same functions, so the PDF is the page, printed.
 */

export interface TargetedReportInput {
  session: {
    subject: Subject
    title: string | null
    scheduled_at: string
    started_at: string | null
    teacher?: { full_name: string | null } | null
    student?: { full_name: string | null; display_id: string | null; pc?: string | null } | null
  }
  test: {
    section: string
    skill: string | null
    set_size: number
    question_seconds: number | null
    overall_seconds: number
  }
  /** How many questions the set held. */
  setCount: number
  items: SessionItem[]
  config: Pick<ProgressConfig, 'score_points' | 'long_words'>
  line: ProgressLine | null
  pattern: LongPattern | null
}

export function skillName(section: string, skill: string | null): string {
  return skill
    ? (skillLabel(skill) ?? skill)
    : `${sectionLabel(section) ?? section} (the whole section)`
}

/** The analysis of the test, from its items as the staff and the PC read them. */
export function analyseTargetedItems(
  items: SessionItem[],
  setCount: number,
  config: Pick<ProgressConfig, 'score_points' | 'long_words'>,
): TargetedAnalysis {
  return analyseTargeted(
    items.map((i) => ({
      status: i.status,
      is_correct: i.session_item_assessments?.is_correct ?? null,
      timed_out: i.session_item_assessments?.timed_out ?? false,
      elapsed_seconds: i.session_item_assessments?.elapsed_seconds ?? null,
      time_limit_seconds: i.time_limit_seconds ?? null,
      question: i.questions ?? null,
    })),
    setCount,
    config,
  )
}

/** One row of the question table, as the page and the PDF both print it. */
export interface TargetedRow {
  number: number
  level: Difficulty | null
  outcome: 'right' | 'wrong' | 'timed out' | 'not reached'
  answer: string
  seconds: number | null
  limit: number | null
  pace: string | null
}

/**
 * Every question the student met, in the order sat, then the set's questions
 * never reached — counted, not listed, since they were never seen and naming
 * them would put their content in front of nobody for nothing.
 */
export function targetedRows(items: SessionItem[]): TargetedRow[] {
  return items
    .filter((i) => i.status !== 'staged')
    .sort((a, b) => a.sequence_no - b.sequence_no)
    .map((i, n) => {
      const a = i.session_item_assessments
      const reached = i.status === 'answered' || i.status === 'revealed'
      const outcome: TargetedRow['outcome'] = !reached
        ? 'not reached'
        : a?.timed_out
          ? 'timed out'
          : a?.is_correct
            ? 'right'
            : 'wrong'
      const seconds = a?.elapsed_seconds ?? null
      const target = i.questions?.target_seconds ?? i.time_limit_seconds ?? null
      return {
        number: n + 1,
        level: i.questions?.difficulty ?? null,
        outcome,
        answer: !reached ? '—' : (i.selected_option ?? '—'),
        seconds: reached ? seconds : null,
        limit: i.time_limit_seconds ?? null,
        pace: reached && !a?.timed_out ? paceLabel(seconds, target) : null,
      }
    })
}

export function targetedPdfDoc(input: TargetedReportInput): ReportPdfDoc {
  const { session, test, setCount, items, config, line, pattern } = input
  const student = session.student?.full_name || 'Student'
  const teacher = session.teacher?.full_name || 'their teacher'
  const at = session.started_at ?? session.scheduled_at
  const when = formatUtc(at)
  const day = at.slice(0, 10)
  const skill = skillName(test.section, test.skill)
  const a = analyseTargetedItems(items, setCount, config)
  const rows = targetedRows(items)

  const clocks = [
    test.question_seconds
      ? `${test.question_seconds} s a question`
      : 'each question’s own target time',
    `${Math.round(test.overall_seconds / 60)} minutes in all`,
  ].join(', ')

  const progressLines = line ? describeLine(line) : []
  if (pattern) progressLines.push(pattern.text)

  return {
    kicker: 'TARGETED TEST',
    title: `${student} — ${skill}`,
    subtitle: `${subjectLabel(session.subject)} · targeted test · ${when} · set by ${teacher}`,
    status: 'Computed',
    people: [
      {
        label: 'Student',
        value: [student, session.student?.display_id].filter(Boolean).join(' · '),
      },
      { label: 'Teacher', value: session.teacher?.full_name || '—' },
      { label: 'PC', value: session.student?.pc || '—' },
      { label: 'Test', value: `${setCount} of ${test.set_size} questions · ${clocks}` },
    ],
    empty: false,
    stats: [
      { value: `${a.correct}/${a.reached}`, label: 'Right of reached', note: null },
      { value: a.raw === null ? '—' : `${a.raw.toFixed(1)}/10`, label: 'Raw score', note: null },
      {
        value: a.level === null ? '—' : String(Math.round(a.level)),
        label: 'Level score',
        note: 'mapped from the raw score',
      },
      { value: String(a.timedOut), label: 'Timed out', note: null },
      { value: String(a.notReached), label: 'Not reached', note: 'left out of the score' },
    ],
    recordingNote: null,
    domains: [],
    reflection: null,
    conflicts: [],
    summary: [],
    summaryNote: null,
    extra: [
      { heading: 'What the answers say', lines: a.insights },
      { heading: `Progress on ${skill}`, lines: progressLines },
    ],
    teacherRead: null,
    skills: [],
    sections: [],
    diagnoses: null,
    pace: [],
    misses: [],
    findings: null,
    levelNote:
      'Each question the student met, in the order sat. A question not reached was not answered in time for the test and is left out of the score.',
    showLevel: true,
    questions: rows.map((r) => ({
      sequence: String(r.number),
      skill,
      level: r.level ? difficultyLabel(r.level) : '—',
      answer: r.outcome === 'timed out' ? 'timed out' : r.answer,
      correct: r.outcome === 'right',
      time: r.seconds === null ? '—' : `${r.seconds}s${r.limit ? ` / ${r.limit}s` : ''}`,
      pace: r.pace ?? (r.outcome === 'timed out' ? 'ran out' : '—'),
      diagnosis: r.outcome,
    })),
    footer: `Ascend Now · ${student} · ${subjectLabel(session.subject)} targeted test · ${when}`,
    filename: `Targeted test - ${student} - ${skill} - ${day}`,
    headline:
      a.reached === 0
        ? null
        : `${a.correct} of ${a.reached} right on ${skill} — ${a.raw!.toFixed(1)}/10, level score ${Math.round(a.level!)}`,
  }
}
