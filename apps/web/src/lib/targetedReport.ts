import {
  difficultyLabel,
  sectionLabel,
  skillLabel,
  skillList,
  skillsOn,
  subjectLabel,
  type TestOn,
} from './constants.ts'
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
  test: TestOn & {
    set_size: number
    question_seconds: number | null
    overall_seconds: number
  }
  /** How many questions the set held. */
  setCount: number
  /** On a test of several skills, how many of the set were on each (0086). */
  setBySkill?: Record<string, number> | null
  items: SessionItem[]
  config: Pick<ProgressConfig, 'score_points' | 'long_words'>
  /** The line on each skill the test asks — one, or one per skill (0086) — with its long-question pattern. */
  lines: { line: ProgressLine; pattern: LongPattern | null }[]
}

/** One line's name: "Transitions", or "Craft and Structure (the whole section)". */
export function skillName(section: string | null, skill: string | null): string {
  return skill
    ? (skillLabel(skill) ?? skill)
    : `${sectionLabel(section) ?? section ?? 'A section'} (the whole section)`
}

/** What a test is on, by name: "Transitions", "Transitions and Boundaries", or a whole section's. */
export function testName(t: TestOn): string {
  const skills = skillsOn(t)
  return skills ? skillList(skills) : skillName(t.section, null)
}

/** One skill's share of a test of several: what it asked, and how it went. */
export interface SkillResult {
  skill: string
  correct: number
  reached: number
  /** Its questions in the set the student never answered. */
  notReached: number
}

/**
 * A test of several skills, skill by skill, in the order they were chosen
 * (0086). Empty for a test with one line: its result is the test's.
 */
export function resultBySkill(
  test: TestOn,
  items: SessionItem[],
  setBySkill: Record<string, number> | null | undefined,
): SkillResult[] {
  const skills = skillsOn(test)
  if (!skills || skills.length < 2) return []
  return skills.map((skill) => {
    const mine = items.filter(
      (i) => i.questions?.skill === skill && (i.status === 'answered' || i.status === 'revealed'),
    )
    const correct = mine.filter((i) => i.session_item_assessments?.is_correct).length
    return {
      skill,
      correct,
      reached: mine.length,
      notReached: Math.max(0, (setBySkill?.[skill] ?? mine.length) - mine.length),
    }
  })
}

/** "Transitions: 3 of 4 right, 1 not reached." */
export function skillResultText(r: SkillResult): string {
  const name = skillLabel(r.skill) ?? r.skill
  const nr = r.notReached > 0 ? `, ${r.notReached} not reached` : ''
  return r.reached === 0
    ? `${name}: none of its questions reached${nr}.`
    : `${name}: ${r.correct} of ${r.reached} right${nr}.`
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
      skipped: i.session_item_assessments?.skipped ?? false,
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
  /** The question's skill — what a test of several skills prints beside it. */
  skill: string | null
  outcome: 'right' | 'wrong' | 'skipped' | 'timed out' | 'not reached'
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
          : a?.skipped
            ? 'skipped'
            : a?.is_correct
            ? 'right'
            : 'wrong'
      const seconds = a?.elapsed_seconds ?? null
      const target = i.questions?.target_seconds ?? i.time_limit_seconds ?? null
      return {
        number: n + 1,
        level: i.questions?.difficulty ?? null,
        skill: i.questions?.skill ?? null,
        outcome,
        answer: !reached ? '—' : (i.selected_option ?? i.entered_answer ?? '—'),
        seconds: reached ? seconds : null,
        limit: i.time_limit_seconds ?? null,
        pace: reached && !a?.timed_out && !a?.skipped ? paceLabel(seconds, target) : null,
      }
    })
}

export function targetedPdfDoc(input: TargetedReportInput): ReportPdfDoc {
  const { session, test, setCount, items, config, lines } = input
  const student = session.student?.full_name || 'Student'
  const teacher = session.teacher?.full_name || 'their teacher'
  const at = session.started_at ?? session.scheduled_at
  const when = formatUtc(at)
  const day = at.slice(0, 10)
  const skill = testName(test)
  const a = analyseTargetedItems(items, setCount, config)
  const rows = targetedRows(items)
  const bySkill = resultBySkill(test, items, input.setBySkill)

  const clocks = [
    test.question_seconds
      ? `${test.question_seconds} s a question`
      : 'each question’s own target time',
    `${Math.round(test.overall_seconds / 60)} minutes in all`,
  ].join(', ')

  const progress = lines.map(({ line, pattern }) => ({
    heading: `Progress on ${skillName(line.section, line.skill)}`,
    lines: [...describeLine(line), ...(pattern ? [pattern.text] : [])],
  }))

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
      { value: String(a.skipped), label: 'Skipped', note: 'counted as wrong' },
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
      ...(bySkill.length > 0
        ? [{ heading: 'Skill by skill', lines: bySkill.map(skillResultText) }]
        : []),
      { heading: 'What the answers say', lines: a.insights },
      ...(progress.length > 0 ? progress : [{ heading: `Progress on ${skill}`, lines: [] }]),
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
      skill: bySkill.length > 0 ? (skillLabel(r.skill) ?? skill) : skill,
      level: r.level ? difficultyLabel(r.level) : '—',
      answer: r.outcome === 'timed out' || r.outcome === 'skipped' ? r.outcome : r.answer,
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
