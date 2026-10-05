/**
 * What the SAT is, for a student who has never seen one — the content of the
 * About the SAT page, which a mentor walks through before the first diagnostic.
 *
 * The numbers are College Board's (satsuite.collegeboard.org/sat): the module
 * lengths, the question counts and each domain's share of a section. The
 * sample module is the one in the teachers' own slides — which questions are
 * easy, medium or hard there is an illustration, not a rule.
 *
 * Kept short on purpose. Nobody reads a wall of text before a test.
 */

export type SatPart = 'english' | 'mathematics'

/** One stretch of test day, in the order it is sat. */
export interface DayStep {
  label: string
  minutes: number
  questions: number | null
  part: SatPart | 'break'
}

export const TEST_DAY: DayStep[] = [
  { label: 'English · Module 1', minutes: 32, questions: 27, part: 'english' },
  { label: 'English · Module 2', minutes: 32, questions: 27, part: 'english' },
  { label: 'Break', minutes: 10, questions: null, part: 'break' },
  { label: 'Math · Module 1', minutes: 35, questions: 22, part: 'mathematics' },
  { label: 'Math · Module 2', minutes: 35, questions: 22, part: 'mathematics' },
]

export function totalMinutes(steps: DayStep[] = TEST_DAY): number {
  return steps.reduce((sum, s) => sum + s.minutes, 0)
}

export function totalQuestions(steps: DayStep[] = TEST_DAY, part?: SatPart): number {
  return steps
    .filter((s) => (part ? s.part === part : true))
    .reduce((sum, s) => sum + (s.questions ?? 0), 0)
}

/** "2h 24m", "64 min". */
export function formatMinutes(minutes: number): string {
  if (minutes < 60) return `${minutes} min`
  const h = Math.floor(minutes / 60)
  const m = minutes % 60
  return m ? `${h}h ${m}m` : `${h}h`
}

/** Seconds a question gets on average, rounded to the nearest five. */
export function secondsPerQuestion(part: SatPart): number {
  const steps = TEST_DAY.filter((s) => s.part === part)
  const seconds = (totalMinutes(steps) * 60) / totalQuestions(steps)
  return Math.round(seconds / 5) * 5
}

export interface Domain {
  name: string
  /** Its share of the section, as College Board rounds it. */
  share: number
  questions: string
  /** What it asks, in one line a student can read aloud. */
  blurb: string
  skills: string[]
}

export const ENGLISH_DOMAINS: Domain[] = [
  {
    name: 'Craft and Structure',
    share: 28,
    questions: '13–15',
    blurb: 'What a word means here, why the text is built this way, how two texts connect.',
    skills: ['Words in Context', 'Text Structure and Purpose', 'Cross-Text Connections'],
  },
  {
    name: 'Information and Ideas',
    share: 26,
    questions: '12–14',
    blurb: 'Find the main idea, back a claim with a quote or a graph, draw the logical conclusion.',
    skills: ['Central Ideas and Details', 'Command of Evidence — Textual', 'Command of Evidence — Quantitative', 'Inferences'],
  },
  {
    name: 'Standard English Conventions',
    share: 26,
    questions: '11–15',
    blurb: 'Grammar and punctuation: where a sentence ends, and how its words agree.',
    skills: ['Boundaries', 'Form, Structure, and Sense'],
  },
  {
    name: 'Expression of Ideas',
    share: 20,
    questions: '8–12',
    blurb: 'Revise to hit a goal: use the notes that answer it, pick the right linking word.',
    skills: ['Rhetorical Synthesis', 'Transitions'],
  },
]

export const MATH_DOMAINS: Domain[] = [
  {
    name: 'Algebra',
    share: 35,
    questions: '13–15',
    blurb: 'Linear equations, functions and inequalities — and systems of two.',
    skills: ['Linear equations', 'Linear functions', 'Systems of equations', 'Linear inequalities'],
  },
  {
    name: 'Advanced Math',
    share: 35,
    questions: '13–15',
    blurb: 'Quadratics, exponentials and other nonlinear equations and functions.',
    skills: ['Equivalent expressions', 'Nonlinear equations', 'Nonlinear functions'],
  },
  {
    name: 'Problem-Solving and Data Analysis',
    share: 15,
    questions: '5–7',
    blurb: 'Ratios, rates and percentages; reading data, tables and charts; probability.',
    skills: ['Ratios, rates and units', 'Percentages', 'Data and statistics', 'Probability'],
  },
  {
    name: 'Geometry and Trigonometry',
    share: 15,
    questions: '5–7',
    blurb: 'Area and volume, angles and triangles, right-triangle trig, circles.',
    skills: ['Area and volume', 'Lines, angles and triangles', 'Right triangles and trig', 'Circles'],
  },
]

export type SampleLevel = 'easy' | 'medium' | 'hard' | 'unscored'

/** A run of one English module's questions that test the same domain. */
export interface SampleGroup {
  domain: string
  half: 'Reading' | 'Writing'
  levels: SampleLevel[]
}

const E: SampleLevel = 'easy'
const M: SampleLevel = 'medium'
const H: SampleLevel = 'hard'
const U: SampleLevel = 'unscored'

/** The 27 questions of a sample English module, from the teachers' slides. */
export const ENGLISH_SAMPLE_MODULE: SampleGroup[] = [
  { domain: 'Craft and Structure', half: 'Reading', levels: [E, M, H, E, U, M, E] },
  { domain: 'Information and Ideas', half: 'Reading', levels: [H, M, H, E, M, M, H] },
  { domain: 'Standard English Conventions', half: 'Writing', levels: [E, E, M, U, M, H, H] },
  { domain: 'Expression of Ideas', half: 'Writing', levels: [E, M, H, E, M, H] },
]

/** Where Module 1 sends you, and what each Module 2 can score. */
export const MODULE_TWO = {
  easier: { label: 'Easier Module 2', range: '≈ 200–600' },
  harder: { label: 'Harder Module 2', range: '≈ 450–800' },
} as const

export const SOURCES = [
  { label: 'The SAT — College Board', href: 'https://satsuite.collegeboard.org/sat' },
  { label: 'What’s on the Math test', href: 'https://satsuite.collegeboard.org/sat/whats-on-the-test/math' },
]
