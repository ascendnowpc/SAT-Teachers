import { describe, expect, it } from 'vitest'
import {
  NO_PAPER_FILTERS,
  countLabel,
  describeFilters,
  facetOptions,
  filtersFromParams,
  isNarrowed,
  matches,
  matchesQuery,
  normalise,
  paramsOf,
  searchText,
  skillName,
  sourceOf,
  type PaperFilters,
} from './paperFilter'
import type { Question } from './types'

function q(over: Partial<Question> & { id: string }): Question {
  return {
    created_by: null,
    subject: 'english',
    section: 'expression_of_ideas',
    skill: 'transitions',
    passage: null,
    passage_underline: null,
    image_url: null,
    source_ref: 'CB-00000000',
    stem: 'Which choice completes the text?',
    difficulty: 'easy',
    difficulty_rationale: null,
    target_seconds: null,
    status: 'published',
    created_at: '2026-01-01T00:00:00Z',
    question_options: [],
    question_keys: null,
    ...over,
  }
}

const POOL: Question[] = [
  q({ id: 'a', skill: 'transitions', difficulty: 'easy', stem: 'Sugar cookie cubes were on the menu.' }),
  q({ id: 'b', skill: 'transitions', difficulty: 'hard' }),
  q({ id: 'c', section: 'standard_english_conventions', skill: 'boundaries', difficulty: 'hard' }),
  q({
    id: 'd',
    section: 'information_and_ideas',
    skill: 'command_of_evidence',
    difficulty: 'medium',
    image_url: 'https://example.test/chart.png',
  }),
  q({ id: 'e', skill: 'transitions', difficulty: 'easy', source_ref: 'ENG-PRACTICE-CTC-Q01' }),
]
const HAY = POOL.map(searchText)

function only(f: Partial<PaperFilters>): string[] {
  const filters = { ...NO_PAPER_FILTERS, ...f }
  return POOL.filter((x, i) => matches(x, filters, HAY[i])).map((x) => x.id)
}

describe('sourceOf', () => {
  it('reads College Board, OnePrep, the diagnostic tests and a teacher off the source_ref', () => {
    expect(sourceOf({ source_ref: 'CB-ac472881', created_by: null })).toBe('college_board')
    expect(sourceOf({ source_ref: 'ENG-PRACTICE-CTC-Q07', created_by: null })).toBe('oneprep')
    expect(sourceOf({ source_ref: 'MATH-EASY-Q10', created_by: null })).toBe('diagnostic')
    expect(sourceOf({ source_ref: 'ENG-DIAG-T4-M1-Q03', created_by: null })).toBe('diagnostic')
    expect(sourceOf({ source_ref: null, created_by: 'teacher-1' })).toBe('teacher')
    expect(sourceOf({ source_ref: null, created_by: null })).toBe('teacher')
  })
})

describe('the search', () => {
  it('finds every word, in any order, ignoring case', () => {
    const hay = searchText(POOL[0])
    expect(matchesQuery(hay, 'COOKIE sugar')).toBe(true)
    expect(matchesQuery(hay, 'cookie chicken')).toBe(false)
  })

  it('reads curly quotes and minus signs the way they are typed', () => {
    expect(normalise('It can’t be −4 — “ever”')).toBe('it can\'t be -4 - "ever"')
    const hay = searchText(q({ id: 'x', stem: 'The value is −4, isn’t it?' }))
    expect(matchesQuery(hay, "-4 isn't")).toBe(true)
  })

  it('finds a question by its id and by its choices', () => {
    const withChoices = q({
      id: 'y',
      source_ref: 'CB-3008cfc3',
      question_options: [{ id: 'o1', question_id: 'y', label: 'A', body: 'shrimp cocktail' }],
    } as Partial<Question> & { id: string })
    const hay = searchText(withChoices)
    expect(matchesQuery(hay, 'cb-3008cfc3')).toBe(true)
    expect(matchesQuery(hay, 'shrimp')).toBe(true)
  })

  it('lets an empty query through', () => {
    expect(only({ query: '   ' })).toEqual(['a', 'b', 'c', 'd', 'e'])
  })
})

describe('matches', () => {
  it('narrows by each filter, and by several at once', () => {
    expect(only({ skill: 'transitions' })).toEqual(['a', 'b', 'e'])
    expect(only({ difficulty: 'hard' })).toEqual(['b', 'c'])
    expect(only({ skill: 'transitions', difficulty: 'hard' })).toEqual(['b'])
    expect(only({ section: 'information_and_ideas' })).toEqual(['d'])
    expect(only({ figure: 'with' })).toEqual(['d'])
    expect(only({ source: 'oneprep' })).toEqual(['e'])
    expect(only({ answer: 'entry' })).toEqual([])
    expect(only({ query: 'cookie', difficulty: 'easy' })).toEqual(['a'])
  })

  it('says when anything is narrowed', () => {
    expect(isNarrowed(NO_PAPER_FILTERS)).toBe(false)
    expect(isNarrowed({ ...NO_PAPER_FILTERS, query: '  ' })).toBe(false)
    expect(isNarrowed({ ...NO_PAPER_FILTERS, figure: 'with' })).toBe(true)
  })
})

describe('facetOptions', () => {
  it('counts what each option would leave, given the other filters', () => {
    const f = { ...NO_PAPER_FILTERS, skill: 'transitions' }
    const options = facetOptions(POOL, HAY, f)
    // Difficulty counts are within Transitions...
    expect(options.difficulty.map((o) => [o.value, o.count])).toEqual([
      ['easy', 2],
      ['medium', 0],
      ['hard', 1],
    ])
    // ...and the skill's own counts ignore the skill chosen.
    const skills = Object.fromEntries(options.skill.map((o) => [o.value, o.count]))
    expect(skills).toEqual({ command_of_evidence: 1, transitions: 3, boundaries: 1 })
  })

  it('offers only what the test holds, in the order the app lists them', () => {
    const options = facetOptions(POOL, HAY, NO_PAPER_FILTERS)
    expect(options.section.map((o) => o.label)).toEqual([
      'Information and Ideas',
      'Expression of Ideas',
      'Standard English Conventions',
    ])
    expect(options.source.map((o) => o.value)).toEqual(['college_board', 'oneprep'])
    expect(options.answer.map((o) => o.value)).toEqual(['choice'])
    expect(options.figure.map((o) => o.label)).toEqual(['With a picture', 'No picture'])
  })

  it("keeps the skills to the chosen section's, and groups them by section otherwise", () => {
    const all = facetOptions(POOL, HAY, NO_PAPER_FILTERS)
    const cb = all.skill.find((o) => o.value === 'command_of_evidence')
    expect(cb).toMatchObject({ label: 'Command of Evidence', group: 'Information and Ideas' })

    const narrowed = facetOptions(POOL, HAY, { ...NO_PAPER_FILTERS, section: 'expression_of_ideas' })
    expect(narrowed.skill.map((o) => o.value)).toEqual(['transitions'])
  })
})

describe('the address', () => {
  it('round-trips through the query string, leaving "any" out', () => {
    const f: PaperFilters = {
      ...NO_PAPER_FILTERS,
      query: 'sugar cookie',
      skill: 'transitions',
      difficulty: 'hard',
      figure: 'with',
    }
    const p = paramsOf(f)
    expect(p.toString()).toBe('q=sugar+cookie&skill=transitions&level=hard&figure=with')
    expect(filtersFromParams(p)).toEqual(f)
  })

  it('drops a value it does not understand', () => {
    const f = filtersFromParams(new URLSearchParams('level=impossible&source=moon&figure=with'))
    expect(f).toEqual({ ...NO_PAPER_FILTERS, figure: 'with' })
  })
})

describe('in words', () => {
  it('describes the filters for the printed copy', () => {
    expect(
      describeFilters({ ...NO_PAPER_FILTERS, skill: 'transitions', difficulty: 'hard', query: ' cookie ' }),
    ).toBe('Transitions · Hard · ‘cookie’')
    expect(describeFilters(NO_PAPER_FILTERS)).toBe('')
  })

  it('names a skill outside the grid instead of printing its key', () => {
    expect(skillName('command_of_evidence')).toBe('Command of Evidence')
    expect(skillName('transitions')).toBe('Transitions')
  })

  it('prints a count with its thousands', () => {
    expect(countLabel(1892)).toBe('1,892')
  })
})
