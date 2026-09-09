import { SKILLS, sectionLabel } from './constants'
import type { Report } from './report'

/**
 * The teacher evaluation grid.
 *
 * The paper version has six columns: Domain, Skill Focus, Student Performance,
 * Strengths observed, Gaps observed, Next steps/Targets. Three of those are the
 * same on every copy of the form (domain, skill focus, targets), two are
 * computed from the answers (performance), and two are the teacher's own
 * observation. This builds the first two kinds; the written columns come from
 * session_domain_notes.
 */

/** The four domains in the order the paper form prints them. */
export const DOMAIN_ORDER = [
  'information_and_ideas',
  'craft_and_structure',
  'expression_of_ideas',
  'standard_english_conventions',
]

/** The Next steps/Targets column, verbatim from the teachers' form. */
export const DOMAIN_TARGETS: Record<string, string[]> = {
  information_and_ideas: ['Review inference questions (implied vs stated).'],
  craft_and_structure: [
    'Build academic vocabulary.',
    'Practice rhetorical analysis (why the author writes).',
    'Compare texts on similar topics.',
  ],
  expression_of_ideas: [
    'Strengthen logical flow of ideas.',
    'Practice choosing the best transitions.',
    'Revise arguments to strengthen purpose.',
  ],
  standard_english_conventions: [
    'Review subject-verb agreement, pronouns, and modifiers.',
    'Practice sentence combining.',
    'Drill punctuation (commas, semicolons, clauses).',
  ],
}

/** The Skill Focus column, worded as the form words it. */
export const DOMAIN_SKILL_FOCUS: Record<string, string[]> = {
  information_and_ideas: [
    'Central Ideas & Details',
    'Command of Evidence (textual & quantitative)',
    'Inferences',
  ],
  craft_and_structure: ['Words in Context', 'Text Structure & Purpose', 'Cross-Text Connections'],
  expression_of_ideas: ['Rhetorical Synthesis', 'Transitions'],
  standard_english_conventions: [
    'Boundaries (comma splice, run-ons)',
    'Form, Structure, Sense (grammar, punctuation, usage)',
  ],
}

export type Performance = 'tick' | 'cross' | 'mixed' | 'untested'

/** One row of session_domain_notes, as much of it as the grid needs. */
export interface GridNote {
  domain: string
  strengths: string | null
  gaps: string | null
  /** The teacher's Next steps column, one target per line. */
  targets?: string | null
  /** The tick or cross the teacher put against the row. */
  performance?: 'tick' | 'cross' | null
  performance_note?: string | null
}

export interface GridRow {
  domain: string
  label: string
  skillFocus: string[]
  /** The teacher's next steps when they wrote any; the printed ones otherwise. */
  targets: string[]
  /** Whether the targets above are the teacher's or the form's own wording. */
  targetsAreTheTeacher: boolean
  total: number
  correct: number
  performance: Performance
  /** The teacher's own mark, which is a judgement rather than a count. */
  teacherPerformance: 'tick' | 'cross' | null
  /** Anything they wrote beside the mark. */
  performanceNote: string | null
  /** Per-skill detail behind the tick, so a mixed row can be read. */
  skills: { key: string; label: string; total: number; correct: number }[]
  strengths: string | null
  gaps: string | null
}

/**
 * The teacher's Next steps cell, as a list.
 *
 * They type it a line at a time, because that is how the printed column reads,
 * so it comes back a line at a time. Blank lines are dropped rather than
 * rendered as empty bullets.
 */
export function targetLines(written: string | null | undefined): string[] {
  return (written ?? '')
    .split('\n')
    .map((line) => line.replace(/^[-*\u2022]\s*/, '').trim())
    .filter(Boolean)
}

/**
 * A tick is not "got one right" — the form is a judgement about the domain.
 * Everything right is a tick, everything wrong is a cross, and anything in
 * between is mixed, which is the honest answer for four questions and two
 * misses.
 */
export function performanceOf(correct: number, total: number): Performance {
  if (total === 0) return 'untested'
  if (correct === total) return 'tick'
  if (correct === 0) return 'cross'
  return 'mixed'
}

/**
 * The grid, with the teacher's columns actually in it.
 *
 * The Next steps column was printed from {@link DOMAIN_TARGETS} whatever the
 * teacher had written, which meant a teacher who edited the targets on the form
 * — the one column the form exists to have edited — read their own report back
 * with the stock wording in it and no sign of their work. So the written cell
 * wins wherever there is one, and the row says which of the two it is showing.
 */
export function buildGrid(report: Report, notes: GridNote[]): GridRow[] {
  const byDomain = new Map(report.sections.map((s) => [s.key, s]))
  const noteFor = new Map(notes.map((n) => [n.domain, n]))

  return DOMAIN_ORDER.map((value) => {
    const band = byDomain.get(value)
    const total = band?.total ?? 0
    const correct = band?.correct ?? 0
    const note = noteFor.get(value)

    const skills = (SKILLS[value] ?? [])
      .map((s) => {
        const b = report.skills.find((x) => x.key === s.value)
        return { key: s.value, label: s.label, total: b?.total ?? 0, correct: b?.correct ?? 0 }
      })
      .filter((s) => s.total > 0)

    const written = targetLines(note?.targets)

    return {
      domain: value,
      label: sectionLabel(value) ?? value,
      skillFocus: DOMAIN_SKILL_FOCUS[value] ?? [],
      targets: written.length > 0 ? written : DOMAIN_TARGETS[value] ?? [],
      targetsAreTheTeacher: written.length > 0,
      total,
      correct,
      performance: performanceOf(correct, total),
      teacherPerformance: note?.performance ?? null,
      performanceNote: note?.performance_note?.trim() || null,
      skills,
      strengths: note?.strengths ?? null,
      gaps: note?.gaps ?? null,
    }
  })
}

/**
 * The "Recommended Practice Priority" the form asks the teacher to circle.
 *
 * Weakest domain by accuracy, and among equals the one with more questions
 * behind the verdict. Domains the session never tested cannot be the priority —
 * there is no evidence for them either way.
 */
export function recommendedPriority(report: Report): string | null {
  const tested = report.sections.filter((s) => s.total > 0)
  if (tested.length === 0) return null

  const worst = tested.reduce((a, b) => {
    const ra = a.correct / a.total
    const rb = b.correct / b.total
    if (ra !== rb) return ra < rb ? a : b
    return a.total >= b.total ? a : b
  })

  // A clean sweep has no priority to recommend; saying "work on your best
  // domain" because something has to be circled is worse than saying nothing.
  return worst.correct === worst.total ? null : worst.key
}

/**
 * Time management as the form wants it stated: how the student's pace compared
 * with the target across the questions they answered.
 */
export function timeManagement(report: Report): {
  verdict: 'fast' | 'on' | 'slow' | 'unknown'
  deltaSeconds: number | null
} {
  if (report.target === 0 || report.total === 0) return { verdict: 'unknown', deltaSeconds: null }
  const delta = report.seconds - report.target
  // A tenth of the paper's budget is the band where pace is not the story.
  if (Math.abs(delta) <= report.target * 0.1) return { verdict: 'on', deltaSeconds: delta }
  return { verdict: delta < 0 ? 'fast' : 'slow', deltaSeconds: delta }
}

/**
 * Engagement, in the one number the session actually measures.
 *
 * `rated` is what the average was taken over, and it is returned rather than
 * thrown away because a blank engagement row is otherwise unreadable. A student
 * who was never asked how sure they felt and a student whose answers averaged
 * nothing are different facts, and the report printed a dash for both — leaving
 * a teacher to wonder whether the number was missing or the feature was broken.
 * Nothing here can invent the rating; it can say it was not asked for.
 */
export function confidenceAverage(items: { student_confidence: number | null }[]): {
  average: number | null
  rated: number
  total: number
} {
  const given = items.map((i) => i.student_confidence).filter((c): c is number => c !== null)
  return {
    average: given.length === 0 ? null : given.reduce((a, b) => a + b, 0) / given.length,
    rated: given.length,
    total: items.length,
  }
}
