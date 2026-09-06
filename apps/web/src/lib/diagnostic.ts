import { sectionLabel } from './constants'
import { DOMAIN_ORDER, DOMAIN_SKILL_FOCUS, DOMAIN_TARGETS } from './grid'
import type { DomainNote } from './types'

/**
 * The teacher's diagnostic form — the English reflection grid, filled in.
 *
 * The teachers fill this on paper today, straight after a diagnostic and
 * before anybody has a score: four domain rows, a tick or a cross against each,
 * what they saw the student do well, where it fell down, and what to work on
 * next. The report is generated from this and the Fathom transcript afterwards,
 * so this module is only about capturing the form faithfully.
 *
 * Three of the six columns are printed on the form and three are the teacher's.
 * Domain and Skill Focus are printed and fixed. Next steps/Targets is printed
 * too, but as a starting point — the form's own wording, there to be edited
 * into what this student actually needs. Every column the teacher owns is
 * required, which is what {@link validate} is for.
 */

/** The two marks the Student Performance column offers: ✓ or ✗. */
export type MarkedPerformance = 'tick' | 'cross'

/** The columns of the grid a teacher fills in. */
export const ROW_FIELDS = ['performance', 'strengths', 'gaps', 'targets'] as const
export type RowField = (typeof ROW_FIELDS)[number]

export const ROW_FIELD_LABELS: Record<RowField, string> = {
  performance: 'Student performance',
  strengths: 'Strengths observed',
  gaps: 'Gaps observed',
  targets: 'Next steps / Targets',
}

/** One domain's row of the form. */
export interface DiagnosticRow {
  domain: string
  label: string
  /** Printed on the form: what the domain covers. Not the teacher's to change. */
  skillFocus: string[]
  performance: MarkedPerformance | null
  strengths: string
  gaps: string
  targets: string
}

export interface DiagnosticForm {
  rows: DiagnosticRow[]
  /** The teacher's comments on the session as a whole. */
  reflection: string
  /** The Fathom transcript, pasted in or uploaded. */
  transcript: string
}

/** A required field that is still empty. */
export type Problem =
  | { where: 'row'; domain: string; field: RowField }
  | { where: 'reflection' }
  | { where: 'transcript' }

/**
 * The form's own Next steps/Targets for a domain, one per line.
 *
 * A prefilled cell rather than a blank one, because the paper form arrives with
 * these already printed on it — and a teacher who agrees with them should not
 * have to retype them to say so.
 */
export function defaultTargets(domain: string): string {
  return (DOMAIN_TARGETS[domain] ?? []).join('\n')
}

/** A blank form: four rows, in the order the paper prints them. */
export function emptyRows(): DiagnosticRow[] {
  return DOMAIN_ORDER.map((domain) => ({
    domain,
    label: sectionLabel(domain) ?? domain,
    skillFocus: DOMAIN_SKILL_FOCUS[domain] ?? [],
    performance: null,
    strengths: '',
    gaps: '',
    targets: defaultTargets(domain),
  }))
}

/**
 * The form as the database has it, with anything never filled in left as the
 * blank form has it. A domain with no row yet is not an error — it is a form
 * that is part-filled, which is the normal state of one halfway through.
 */
export function rowsFrom(notes: DomainNote[]): DiagnosticRow[] {
  const byDomain = new Map(notes.map((n) => [n.domain, n]))
  return emptyRows().map((row) => {
    const note = byDomain.get(row.domain)
    if (!note) return row
    return {
      ...row,
      performance: note.performance ?? null,
      strengths: note.strengths ?? '',
      gaps: note.gaps ?? '',
      // An empty targets column means the row predates the form, not that the
      // teacher deleted the targets — so the printed ones stand.
      targets: note.targets ?? row.targets,
    }
  })
}

/**
 * Everything still missing, in the order it is read down the page.
 *
 * Every field on this form is required. A half-filled grid is worse than none:
 * a report generated from three domains reads as a judgement about four.
 */
export function validate(form: DiagnosticForm): Problem[] {
  const problems: Problem[] = []

  for (const row of form.rows) {
    if (row.performance === null) problems.push({ where: 'row', domain: row.domain, field: 'performance' })
    if (!row.strengths.trim()) problems.push({ where: 'row', domain: row.domain, field: 'strengths' })
    if (!row.gaps.trim()) problems.push({ where: 'row', domain: row.domain, field: 'gaps' })
    if (!row.targets.trim()) problems.push({ where: 'row', domain: row.domain, field: 'targets' })
  }

  if (!form.reflection.trim()) problems.push({ where: 'reflection' })
  if (!form.transcript.trim()) problems.push({ where: 'transcript' })

  return problems
}

export function isComplete(form: DiagnosticForm): boolean {
  return validate(form).length === 0
}

/** Whether a particular cell is among the problems, for marking it on screen. */
export function hasProblem(problems: Problem[], domain: string, field: RowField): boolean {
  return problems.some((p) => p.where === 'row' && p.domain === domain && p.field === field)
}

/** How many of the four domain rows are complete — the form's own progress. */
export function rowsComplete(rows: DiagnosticRow[]): number {
  return rows.filter(
    (r) => r.performance !== null && r.strengths.trim() && r.gaps.trim() && r.targets.trim(),
  ).length
}

/**
 * What is missing, said once per kind rather than once per cell.
 *
 * Sixteen cells can be empty at the same time, and sixteen error lines is a
 * wall rather than a message. The grid marks the cells; this names the columns
 * so the teacher knows what they are looking for before they start scrolling.
 */
export function summariseProblems(problems: Problem[]): string {
  const parts: string[] = []

  const missingRows = new Set(
    problems.filter((p) => p.where === 'row').map((p) => (p as { domain: string }).domain),
  )
  if (missingRows.size > 0) {
    const fields = ROW_FIELDS.filter((f) =>
      problems.some((p) => p.where === 'row' && p.field === f),
    ).map((f) => ROW_FIELD_LABELS[f].toLowerCase())
    parts.push(
      `${missingRows.size} of ${DOMAIN_ORDER.length} domain rows are unfinished (${fields.join(', ')})`,
    )
  }
  if (problems.some((p) => p.where === 'reflection')) parts.push('your comments on the session')
  if (problems.some((p) => p.where === 'transcript')) parts.push('the Fathom transcript')

  return `Every field on this form is required. Still to fill in: ${parts.join('; ')}.`
}
