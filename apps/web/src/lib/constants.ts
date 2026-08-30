import type { Diagnosis, Difficulty, OptionLabel, Subject } from './types'

export const OPTION_LABELS: OptionLabel[] = ['A', 'B', 'C', 'D']

export const DIFFICULTIES: { value: Difficulty; label: string }[] = [
  { value: 'easy', label: 'Easy' },
  { value: 'medium', label: 'Medium' },
  { value: 'hard', label: 'Hard' },
]

export const SUBJECTS: { value: Subject; label: string }[] = [
  { value: 'english', label: 'English' },
  { value: 'mathematics', label: 'Mathematics' },
]

/**
 * The four Reading & Writing sections every question belongs to — the same four
 * the teachers assess against, and what every report is grouped by. Each
 * question sits in exactly one.
 */
export const SECTIONS: Record<Subject, { value: string; label: string }[]> = {
  english: [
    { value: 'information_and_ideas', label: 'Information and Ideas' },
    { value: 'expression_of_ideas', label: 'Expression of Ideas' },
    { value: 'standard_english_conventions', label: 'Standard English Conventions' },
    { value: 'craft_and_structure', label: 'Craft and Structure' },
  ],
  mathematics: [
    { value: 'algebra', label: 'Algebra' },
    { value: 'advanced_math', label: 'Advanced Mathematics' },
    { value: 'problem_solving_and_data_analysis', label: 'Problem-Solving and Data Analysis' },
    { value: 'geometry_and_trigonometry', label: 'Geometry and Trigonometry' },
  ],
}

const ALL_SECTIONS = [...SECTIONS.english, ...SECTIONS.mathematics]

export function sectionLabel(value: string | null): string | null {
  if (!value) return null
  return ALL_SECTIONS.find((s) => s.value === value)?.label ?? value
}

export function subjectLabel(value: Subject): string {
  return SUBJECTS.find((s) => s.value === value)?.label ?? value
}

/** One tap, captured while the teacher still has the reason in their head. */
export const DIAGNOSES: { value: Diagnosis; label: string; when: 'correct' | 'incorrect' | 'both' }[] = [
  { value: 'solid_reasoning', label: 'Solid reasoning', when: 'correct' },
  { value: 'lucky_guess', label: 'Lucky guess', when: 'correct' },
  { value: 'careless_error', label: 'Careless error', when: 'incorrect' },
  { value: 'concept_gap', label: 'Concept gap', when: 'incorrect' },
  { value: 'misread_question', label: 'Misread question', when: 'incorrect' },
  { value: 'ran_out_of_time', label: 'Ran out of time', when: 'both' },
]

export function diagnosisLabel(value: Diagnosis | null): string | null {
  if (!value) return null
  return DIAGNOSES.find((d) => d.value === value)?.label ?? value
}

/** What the teachers already do, written down: escalate, hold, or drop back. */
export function suggestNext(
  correct: boolean,
  diagnosis: Diagnosis | null,
): { move: 'escalate' | 'hold' | 'drop'; text: string } | null {
  if (!diagnosis) return null
  if (diagnosis === 'ran_out_of_time')
    return { move: 'drop', text: 'Drop one level — rebuild fluency before speed.' }
  if (correct) {
    return diagnosis === 'solid_reasoning'
      ? { move: 'escalate', text: 'Escalate — same section, one level up.' }
      : { move: 'hold', text: 'Hold the level and confirm it with another of the same.' }
  }
  if (diagnosis === 'concept_gap')
    return { move: 'hold', text: 'Re-teach, then hold the level on the same section.' }
  if (diagnosis === 'misread_question')
    return { move: 'hold', text: 'Hold the level — ask for a one-line summary first.' }
  return { move: 'hold', text: 'Hold the level and watch the pace.' }
}
