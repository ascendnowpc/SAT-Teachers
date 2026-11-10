import { sectionLabel, skillList } from './constants.ts'
import { MAX_SET, skillsAsked, suggestedMinutes, type Candidate } from './targetedSet.ts'
import type { Subject } from './types.ts'

/**
 * What the teacher has asked for so far on the targeted-test form
 * (components/TargetedBuilder), and what booking it would be refused for —
 * the rules kept out of the component so they can be tested without one.
 */
export interface TargetedDraft {
  /** A test on a whole section: which. Null when it is on skills, or nothing is chosen yet. */
  section: string | null
  /** The skills it is on, in the order ticked (0086). Empty: the whole of `section`. */
  skills: string[]
  /** Ticked by the teacher, drawn at random, or not chosen yet. */
  how: 'manual' | 'auto' | null
  /** Pick for me: how many to draw. A ticked set is as long as what is ticked. */
  size: number
  /** Pick for me: the draw. Pick again is a new one. */
  seed: number
  /** One clock for every question; null — each question's own target time. */
  questionSeconds: number | null
  overallMinutes: number
  /** The whole test's clock follows the questions until the teacher sets it. */
  overallAuto: boolean
  /**
   * Pick for me: whether a question the student has seen may be drawn. A
   * ticked set allows it exactly when a ticked question was seen.
   */
  allowRepeats: boolean
  /** The set, in the order it will be sat. */
  questions: string[]
  /** The skills the set asks, from its questions: every chosen skill has to be among them. */
  asks: string[]
}

export const newSeed = () => Math.floor(Math.random() * 2 ** 31)

export function emptyDraft(_subject: Subject): TargetedDraft {
  return {
    section: null,
    skills: [],
    how: null,
    size: 0,
    seed: newSeed(),
    // The brief's mini-test: about a minute a question (0069), twelve of them (0089).
    questionSeconds: 60,
    overallMinutes: suggestedMinutes(12, 60),
    overallAuto: true,
    allowRepeats: false,
    questions: [],
    asks: [],
  }
}

/** Whether the draft says what the test is on yet. */
export function draftIsOn(d: Pick<TargetedDraft, 'section' | 'skills'>): boolean {
  return d.skills.length > 0 || d.section !== null
}

/** "Transitions and Boundaries", or "Craft and Structure — whole section". */
export function draftOnLabel(d: Pick<TargetedDraft, 'section' | 'skills'>): string {
  if (d.skills.length > 0) return skillList(d.skills)
  return d.section ? `${sectionLabel(d.section)} — whole section` : 'Nothing chosen yet'
}

/** The size the test is booked with: what was asked for, or what was ticked. */
export function bookedSize(d: TargetedDraft): number {
  // What the set holds. Pick for me on a short bank holds fewer than was
  // asked for, and the test is that many questions, not the number asked.
  return d.questions.length
}

/** The whole test's clock: the teacher's, or a minute a question and one to spare. */
export function overallMinutesOf(d: TargetedDraft): number {
  return d.overallAuto ? suggestedMinutes(d.questions.length || d.size, d.questionSeconds) : d.overallMinutes
}

/** The chosen skills the set asks nothing on — the server refuses a test with one (0086). */
export function bareSkills(d: Pick<TargetedDraft, 'skills' | 'asks'>): string[] {
  return d.skills.filter((k) => !d.asks.includes(k))
}

/** What create_targeted_session would refuse, said before it is pressed. Null when it is ready. */
export function draftProblem(d: TargetedDraft): string | null {
  if (!draftIsOn(d)) return 'Choose what the test is on: a skill, several, or a whole section.'
  if (d.how === null) return 'Choose how the questions are picked.'
  if (d.questions.length === 0)
    return d.how === 'manual'
      ? 'Choose the questions for the test.'
      : `The set is empty — there are no questions on ${d.skills.length > 0 ? 'these skills' : 'this section'} to use.`
  const size = bookedSize(d)
  if (size < 1 || size > MAX_SET || d.questions.length > MAX_SET)
    return `A targeted test is 1 to ${MAX_SET} questions.`
  const bare = bareSkills(d)
  if (bare.length > 0)
    return d.how === 'manual'
      ? `Nothing ticked is on ${skillList(bare)} — tick a question on it, or take it off the test.`
      : `There is nothing left to ask on ${skillList(bare)} — include questions they have seen, or take it off the test.`
  if (d.questionSeconds !== null && (d.questionSeconds < 10 || d.questionSeconds > 900))
    return 'A question’s clock is 10 to 900 seconds.'
  const overall = overallMinutesOf(d)
  if (overall < 1 || overall > 180) return 'The whole test is 1 to 180 minutes.'
  return null
}

/** The draft with its set replaced: the questions in order, and the skills they ask. */
export function withSet(d: TargetedDraft, set: Candidate[]): TargetedDraft {
  return { ...d, questions: set.map((c) => c.question_id), asks: skillsAsked(set) }
}

