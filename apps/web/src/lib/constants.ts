import type { Diagnosis, Difficulty, OptionLabel, SessionLevel, Subject } from './types'

export const OPTION_LABELS: OptionLabel[] = ['A', 'B', 'C', 'D']

export const DIFFICULTIES: { value: Difficulty; label: string }[] = [
  { value: 'easy', label: 'Easy' },
  { value: 'medium', label: 'Medium' },
  { value: 'hard', label: 'Hard' },
]

/**
 * The three tests, in the order a student climbs them.
 *
 * English is three tests and a session is on one of them, so the level is both
 * a question's difficulty and a session's state. One list serves both — and
 * being an array rather than a set is the point, because "the next one up" is
 * the move the whole session is built around.
 */
export const LEVELS: SessionLevel[] = ['easy', 'medium', 'hard']

export function levelLabel(level: SessionLevel): string {
  return DIFFICULTIES.find((d) => d.value === level)?.label ?? level
}

/** The level above this one, or null at the top. */
export function nextLevel(level: SessionLevel): SessionLevel | null {
  return LEVELS[LEVELS.indexOf(level) + 1] ?? null
}

/** The level below this one, or null at the bottom. */
export function previousLevel(level: SessionLevel): SessionLevel | null {
  const i = LEVELS.indexOf(level)
  return i > 0 ? LEVELS[i - 1] : null
}

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

/**
 * The Skill Focus column of the teachers' evaluation grid. A skill belongs to
 * exactly one section, so this is keyed by section — which is also what stops
 * the form offering "Boundaries" under Craft and Structure. The database
 * enforces the same pairing; this is the version the UI reads.
 */
export const SKILLS: Record<string, { value: string; label: string }[]> = {
  information_and_ideas: [
    { value: 'central_ideas_and_details', label: 'Central Ideas and Details' },
    { value: 'command_of_evidence_textual', label: 'Command of Evidence — Textual' },
    { value: 'command_of_evidence_quantitative', label: 'Command of Evidence — Quantitative' },
    { value: 'inferences', label: 'Inferences' },
  ],
  craft_and_structure: [
    { value: 'words_in_context', label: 'Words in Context' },
    { value: 'text_structure_and_purpose', label: 'Text Structure and Purpose' },
    { value: 'cross_text_connections', label: 'Cross-Text Connections' },
  ],
  expression_of_ideas: [
    { value: 'rhetorical_synthesis', label: 'Rhetorical Synthesis' },
    { value: 'transitions', label: 'Transitions' },
  ],
  standard_english_conventions: [
    { value: 'boundaries', label: 'Boundaries' },
    { value: 'form_structure_and_sense', label: 'Form, Structure and Sense' },
  ],
}

const ALL_SKILLS = Object.values(SKILLS).flat()

/** The skills of one section, or every skill when no section is chosen yet. */
export function skillsFor(section: string | null): { value: string; label: string }[] {
  if (!section) return ALL_SKILLS
  return SKILLS[section] ?? []
}

/** Whether a skill belongs to a section — the pairing the database checks. */
export function skillFitsSection(section: string | null, skill: string | null): boolean {
  if (!skill) return true
  if (!section) return false
  return (SKILLS[section] ?? []).some((s) => s.value === skill)
}

export function skillLabel(value: string | null): string | null {
  if (!value) return null
  return ALL_SKILLS.find((s) => s.value === value)?.label ?? value
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
