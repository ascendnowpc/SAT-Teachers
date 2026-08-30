import type { Difficulty, OptionLabel, Subject } from './types'

export const OPTION_LABELS: OptionLabel[] = ['A', 'B', 'C', 'D']

export const DIFFICULTIES: { value: Difficulty; label: string }[] = [
  { value: 'easy', label: 'Easy' },
  { value: 'medium', label: 'Medium' },
  { value: 'hard', label: 'Hard' },
]

export const SUBJECTS: { value: Subject; label: string }[] = [
  { value: 'english', label: 'English' },
  { value: 'math', label: 'Math' },
]

/** The four official Digital SAT Reading & Writing domains, plus the Math four. */
export const DOMAINS: Record<Subject, { value: string; label: string }[]> = {
  english: [
    { value: 'information_and_ideas', label: 'Information and Ideas' },
    { value: 'craft_and_structure', label: 'Craft and Structure' },
    { value: 'expression_of_ideas', label: 'Expression of Ideas' },
    { value: 'standard_english_conventions', label: 'Standard English Conventions' },
  ],
  math: [
    { value: 'algebra', label: 'Algebra' },
    { value: 'advanced_math', label: 'Advanced Math' },
    { value: 'problem_solving_and_data_analysis', label: 'Problem-Solving and Data Analysis' },
    { value: 'geometry_and_trigonometry', label: 'Geometry and Trigonometry' },
  ],
}

const ALL_DOMAINS = [...DOMAINS.english, ...DOMAINS.math]

export function domainLabel(value: string | null): string | null {
  if (!value) return null
  return ALL_DOMAINS.find((d) => d.value === value)?.label ?? value
}
