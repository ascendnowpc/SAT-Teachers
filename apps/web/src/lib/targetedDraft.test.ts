import { describe, expect, it } from 'vitest'
import {
  bareSkills,
  draftIsOn,
  draftOnLabel,
  draftProblem,
  emptyDraft,
  withSet,
  type TargetedDraft,
} from './targetedDraft'
import type { Candidate } from './targetedSet'

const q = (id: string, skill: string): Candidate => ({
  question_id: id,
  difficulty: 'easy',
  source: 'practice',
  set_level: null,
  set_position: 1,
  seen: false,
  skill,
})

const ready = (over: Partial<TargetedDraft>): TargetedDraft => ({
  ...emptyDraft('english'),
  how: 'auto',
  size: 2,
  ...over,
})

describe('what the test is on', () => {
  it('starts on nothing, and says so', () => {
    const d = emptyDraft('english')
    expect(draftIsOn(d)).toBe(false)
    expect(draftProblem(d)).toBe('Choose what the test is on: a skill, several, or a whole section.')
  })

  it('reads a whole section, one skill, or several', () => {
    expect(draftOnLabel({ section: 'craft_and_structure', skills: [] })).toBe(
      'Craft and Structure — whole section',
    )
    expect(draftOnLabel({ section: null, skills: ['transitions'] })).toBe('Transitions')
    expect(draftOnLabel({ section: null, skills: ['transitions', 'boundaries'] })).toBe(
      'Transitions and Boundaries',
    )
  })
})

describe('every skill asked (0086)', () => {
  it('knows which chosen skills the set asks nothing on', () => {
    const d = withSet(ready({ skills: ['transitions', 'boundaries'] }), [q('a', 'transitions')])
    expect(d.asks).toEqual(['transitions'])
    expect(bareSkills(d)).toEqual(['boundaries'])
  })

  it('refuses to book until every skill has a question, and says how to fix it', () => {
    const auto = withSet(ready({ skills: ['transitions', 'boundaries'] }), [q('a', 'transitions')])
    expect(draftProblem(auto)).toBe(
      'There is nothing left to ask on Boundaries — include questions they have seen, or take it off the test.',
    )
    const manual = { ...auto, how: 'manual' as const }
    expect(draftProblem(manual)).toBe(
      'Nothing ticked is on Boundaries — tick a question on it, or take it off the test.',
    )
  })

  it('books once every skill is asked', () => {
    const d = withSet(ready({ skills: ['transitions', 'boundaries'] }), [
      q('a', 'transitions'),
      q('b', 'boundaries'),
    ])
    expect(draftProblem(d)).toBeNull()
  })

  it('asks nothing of a whole section but questions', () => {
    const d = withSet(ready({ section: 'expression_of_ideas' }), [q('a', 'transitions')])
    expect(draftProblem(d)).toBeNull()
  })
})
