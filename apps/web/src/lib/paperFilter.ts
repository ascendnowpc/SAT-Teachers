/**
 * Narrowing a test to the questions a teacher is looking for.
 *
 * A level test is twenty questions and is read top to bottom. A practice pool
 * is nearly two thousand, and nobody reads that top to bottom: a teacher opens
 * it for the Transitions questions, or the hard ones, or the ones with a chart.
 * This is the pure half of the filter above every test — what each filter
 * means, how many questions each choice would leave, and the filters as the
 * page's address, so a narrowed test survives a reload and can be sent on.
 *
 * Every count is the number of questions the choice would leave given the
 * other filters as they stand, which is what a count beside an option is read
 * as: "Hard (40)" means forty questions on screen if Hard is picked.
 */
import { DIFFICULTIES, SECTIONS, SKILLS, sectionLabel, skillLabel } from './constants.ts'
import type { Difficulty, Question } from './types.ts'

export type SourceKind = 'college_board' | 'oneprep' | 'diagnostic' | 'teacher'
export type AnswerKind = 'choice' | 'entry'
export type FigureKind = 'with' | 'without'

export interface PaperFilters {
  /** Words that must all appear in the question — its text, its choices or its id. */
  query: string
  section: string
  skill: string
  difficulty: Difficulty | ''
  answer: AnswerKind | ''
  source: SourceKind | ''
  figure: FigureKind | ''
}

export const NO_PAPER_FILTERS: PaperFilters = {
  query: '',
  section: '',
  skill: '',
  difficulty: '',
  answer: '',
  source: '',
  figure: '',
}

/** The filters that are a choice from a list, in the order the bar sets them out. */
export type Facet = Exclude<keyof PaperFilters, 'query'>
export const FACETS: Facet[] = ['section', 'skill', 'difficulty', 'answer', 'source', 'figure']

export const SOURCE_LABELS: Record<SourceKind, string> = {
  college_board: 'College Board',
  oneprep: 'OnePrep',
  diagnostic: 'Diagnostic tests',
  teacher: 'Written by a teacher',
}

const ANSWER_LABELS: Record<AnswerKind, string> = {
  choice: 'Multiple choice',
  entry: 'Typed answer',
}

const FIGURE_LABELS: Record<FigureKind, string> = {
  with: 'With a picture',
  without: 'No picture',
}

/**
 * Where a question came from, read off its source_ref.
 *
 * CB- is College Board's question bank (0074). ENG-PRACTICE- is the practice
 * set transcribed from OnePrep (0065). A question with no source_ref, or with
 * an author, was written in the app. Everything else is one of the three
 * diagnostic tests' own questions, loaded from the teachers' papers.
 */
export function sourceOf(q: Pick<Question, 'source_ref' | 'created_by'>): SourceKind {
  const ref = q.source_ref ?? ''
  if (ref.startsWith('CB-')) return 'college_board'
  if (ref.startsWith('ENG-PRACTICE-')) return 'oneprep'
  if (!ref || q.created_by) return 'teacher'
  return 'diagnostic'
}

export function answerOf(q: Pick<Question, 'answer_kind'>): AnswerKind {
  return q.answer_kind === 'entry' ? 'entry' : 'choice'
}

export function figureOf(q: Pick<Question, 'image_url'>): FigureKind {
  return q.image_url ? 'with' : 'without'
}

function valueOf(q: Question, facet: Facet): string {
  switch (facet) {
    case 'section':
      return q.section ?? ''
    case 'skill':
      return q.skill ?? ''
    case 'difficulty':
      return q.difficulty ?? ''
    case 'answer':
      return answerOf(q)
    case 'source':
      return sourceOf(q)
    case 'figure':
      return figureOf(q)
  }
}

/* --------------------------------------------------------------- search --- */

/**
 * Text as the search reads it: lower case, one space between words, and the
 * typographic quotes and dashes the bank's passages are set with written the
 * way a keyboard types them — so "can't" finds "can’t", and "-4" finds "−4".
 */
export function normalise(s: string): string {
  return s
    .toLowerCase()
    .replace(/[‘’ʼ]/g, "'")
    .replace(/[“”]/g, '"')
    .replace(/[−–—]/g, '-')
    .replace(/\s+/g, ' ')
    .trim()
}

/** Everything about a question a search can match: its id, passage, stem and choices. */
export function searchText(q: Question): string {
  return normalise(
    [q.source_ref, q.passage, q.stem, ...(q.question_options ?? []).map((o) => o.body)]
      .filter(Boolean)
      .join(' \n '),
  )
}

/** Every word of the query somewhere in the question, in any order. */
export function matchesQuery(haystack: string, query: string): boolean {
  const words = normalise(query).split(' ').filter(Boolean)
  return words.every((w) => haystack.includes(w))
}

/* ------------------------------------------------------------- matching --- */

/**
 * Whether a question passes the filters. `except` leaves one filter out, which
 * is how the count beside each of that filter's options is worked out.
 * `haystack` is the question's searchText, worked out once per load.
 */
export function matches(
  q: Question,
  f: PaperFilters,
  haystack: string,
  except?: Facet,
): boolean {
  for (const facet of FACETS) {
    if (facet === except) continue
    const want = f[facet]
    if (want && valueOf(q, facet) !== want) return false
  }
  return !f.query.trim() || matchesQuery(haystack, f.query)
}

export function isNarrowed(f: PaperFilters): boolean {
  return Boolean(f.query.trim()) || FACETS.some((k) => f[k])
}

/* --------------------------------------------------------------- facets --- */

export interface FacetOption {
  value: string
  label: string
  /** How many questions picking this would leave, given the other filters. */
  count: number
  /** For a skill: the section it is in, which the list is grouped under. */
  group?: string
}

const SECTION_ORDER = [...SECTIONS.english, ...SECTIONS.mathematics].map((s) => s.value)
const SKILL_ORDER = SECTION_ORDER.flatMap((s) => (SKILLS[s] ?? []).map((k) => k.value))
const FIXED_ORDER: Record<Exclude<Facet, 'section' | 'skill'>, string[]> = {
  difficulty: DIFFICULTIES.map((d) => d.value),
  answer: ['choice', 'entry'],
  source: ['college_board', 'oneprep', 'diagnostic', 'teacher'],
  figure: ['with', 'without'],
}

/**
 * A skill's name. College Board files 277 English questions under one
 * Command of Evidence where the teachers' grid has two (0074), and a skill
 * outside the grid would otherwise be shown as its key.
 */
export function skillName(value: string): string {
  const known = skillLabel(value)
  if (known && known !== value) return known
  const small = new Set(['of', 'and', 'in', 'or', 'the', 'to', 'a', 'on'])
  return value
    .split('_')
    .map((w, i) => (i > 0 && small.has(w) ? w : w.charAt(0).toUpperCase() + w.slice(1)))
    .join(' ')
}

function labelOf(facet: Facet, value: string): string {
  switch (facet) {
    case 'section':
      return sectionLabel(value) ?? value
    case 'skill':
      return skillName(value)
    case 'difficulty':
      return DIFFICULTIES.find((d) => d.value === value)?.label ?? value
    case 'answer':
      return ANSWER_LABELS[value as AnswerKind] ?? value
    case 'source':
      return SOURCE_LABELS[value as SourceKind] ?? value
    case 'figure':
      return FIGURE_LABELS[value as FigureKind] ?? value
  }
}

function ordered(facet: Facet, values: string[]): string[] {
  const order =
    facet === 'section' ? SECTION_ORDER : facet === 'skill' ? SKILL_ORDER : FIXED_ORDER[facet]
  const rank = (v: string) => {
    const i = order.indexOf(v)
    return i === -1 ? order.length : i
  }
  return [...values].sort(
    (a, b) => rank(a) - rank(b) || labelOf(facet, a).localeCompare(labelOf(facet, b)),
  )
}

/**
 * The options of every filter, each with the count it would leave.
 *
 * Only values the test actually holds are offered — a test with no typed
 * answers has nothing to choose between. The skills are the chosen section's
 * when a section is chosen, and every skill grouped by its section when not.
 * A section is read off the questions themselves rather than the teachers'
 * grid, so College Board's Command of Evidence lands under Information and
 * Ideas, where its questions are filed.
 */
export function facetOptions(
  questions: Question[],
  haystacks: string[],
  f: PaperFilters,
): Record<Facet, FacetOption[]> {
  const sectionOfSkill = new Map<string, string>()
  for (const q of questions) {
    if (q.skill && q.section && !sectionOfSkill.has(q.skill)) sectionOfSkill.set(q.skill, q.section)
  }

  const out = {} as Record<Facet, FacetOption[]>
  for (const facet of FACETS) {
    const present = new Set<string>()
    const counts = new Map<string, number>()
    questions.forEach((q, i) => {
      const v = valueOf(q, facet)
      if (!v) return
      if (facet === 'skill' && f.section && q.section !== f.section) return
      present.add(v)
      if (matches(q, f, haystacks[i] ?? '', facet)) counts.set(v, (counts.get(v) ?? 0) + 1)
    })
    out[facet] = ordered(facet, [...present]).map((v) => {
      const option: FacetOption = { value: v, label: labelOf(facet, v), count: counts.get(v) ?? 0 }
      if (facet === 'skill') {
        const section = sectionOfSkill.get(v)
        if (section) option.group = sectionLabel(section) ?? section
      }
      return option
    })
  }
  return out
}

/* ------------------------------------------------------------ the address --- */

const PARAM: Record<keyof PaperFilters, string> = {
  query: 'q',
  section: 'section',
  skill: 'skill',
  difficulty: 'level',
  answer: 'answer',
  source: 'source',
  figure: 'figure',
}

function oneOf<T extends string>(value: string | null, allowed: readonly T[]): T | '' {
  return value && (allowed as readonly string[]).includes(value) ? (value as T) : ''
}

/** The filters from the page's query string; anything not understood is left off. */
export function filtersFromParams(p: URLSearchParams): PaperFilters {
  return {
    query: p.get(PARAM.query) ?? '',
    section: p.get(PARAM.section) ?? '',
    skill: p.get(PARAM.skill) ?? '',
    difficulty: oneOf(p.get(PARAM.difficulty), ['easy', 'medium', 'hard'] as const),
    answer: oneOf(p.get(PARAM.answer), ['choice', 'entry'] as const),
    source: oneOf(p.get(PARAM.source), ['college_board', 'oneprep', 'diagnostic', 'teacher'] as const),
    figure: oneOf(p.get(PARAM.figure), ['with', 'without'] as const),
  }
}

/** The filters as a query string, with nothing for a filter left at "any". */
export function paramsOf(f: PaperFilters): URLSearchParams {
  const p = new URLSearchParams()
  for (const key of Object.keys(PARAM) as (keyof PaperFilters)[]) {
    const v = key === 'query' ? f.query : f[key]
    if (v && v.trim()) p.set(PARAM[key], v)
  }
  return p
}

/**
 * The filters in words, for the printed copy — "Transitions · Hard · ‘cookie’" —
 * so a narrowed test on paper says what it was narrowed to.
 */
export function describeFilters(f: PaperFilters): string {
  const parts: string[] = []
  if (f.section) parts.push(labelOf('section', f.section))
  if (f.skill) parts.push(labelOf('skill', f.skill))
  if (f.difficulty) parts.push(labelOf('difficulty', f.difficulty))
  if (f.answer) parts.push(labelOf('answer', f.answer))
  if (f.source) parts.push(labelOf('source', f.source))
  if (f.figure) parts.push(labelOf('figure', f.figure))
  if (f.query.trim()) parts.push(`‘${f.query.trim()}’`)
  return parts.join(' · ')
}

/** "1,892" — a count the way the page prints one. */
export function countLabel(n: number): string {
  return n.toLocaleString('en-US')
}
