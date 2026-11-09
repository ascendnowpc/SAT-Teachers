import { describe, expect, it } from 'vitest'
import { scoreLine, scoreNote, skillName, skillsToWork, type TargetedResult } from './targetedResult'

const result: TargetedResult = {
  right: 1,
  reached: 3,
  timed_out: 1,
  not_reached: 1,
  skills: [
    { section: 'expression_of_ideas', skill: 'rhetorical_synthesis', right: 0, of: 1 },
    { section: 'expression_of_ideas', skill: 'transitions', right: 1, of: 2 },
    { section: 'expression_of_ideas', skill: 'words_in_context', right: 2, of: 2 },
  ],
}

describe('the score', () => {
  it('is right out of reached', () => {
    expect(scoreLine(result)).toBe('1 of 3 right')
  })

  it('says plainly when nothing was answered in time', () => {
    expect(scoreLine({ ...result, right: 0, reached: 0 })).toMatch(/No questions/)
  })

  it('notes what ran out of time and what was not reached, or nothing', () => {
    expect(scoreNote(result)).toBe('1 ran out of time · 1 not reached')
    expect(scoreNote({ ...result, timed_out: 0, not_reached: 0 })).toBeNull()
    expect(scoreNote({ ...result, skipped: 2 })).toBe('2 skipped · 1 ran out of time · 1 not reached')
  })
})

describe('skills to work on', () => {
  it('are the ones with a miss, weakest first', () => {
    expect(skillsToWork(result).map((s) => s.skill)).toEqual(['rhetorical_synthesis', 'transitions'])
  })

  it('are named as the grid names them', () => {
    expect(skillName(result.skills[1])).toBe('Transitions')
  })
})
