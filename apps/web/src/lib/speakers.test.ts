import { describe, expect, it } from 'vitest'
import { inferRoles as fromAnalysis } from './analysis'
import { inferRoles, rolesFor } from './speakers'

const speakers = ['Malya Rastogi', 'Zara Khan', 'Recorder']
const names = { teacher: 'Malya Rao', student: 'Zara Kapoor' }

describe('rolesFor', () => {
  it('keeps the roles the client names', () => {
    expect(rolesFor(speakers, { 'Malya Rastogi': 'teacher', 'Zara Khan': 'student' }, names)).toEqual({
      'Malya Rastogi': 'teacher',
      'Zara Khan': 'student',
      Recorder: 'other',
    })
  })

  // A client that could not parse the transcript names nobody. The reading is
  // not told that everybody is 'other'; it gets the guess the client would
  // have made.
  it('makes the first guess itself when the client names nobody', () => {
    const guessed = { 'Malya Rastogi': 'teacher', 'Zara Khan': 'student', Recorder: 'other' }
    expect(rolesFor(speakers, {}, names)).toEqual(guessed)
    expect(rolesFor(speakers, undefined, names)).toEqual(guessed)
    expect(rolesFor(speakers, { 'Malya Rastogi': 'other' }, names)).toEqual(guessed)
  })

  it('reads anything but the three roles as other', () => {
    expect(rolesFor(['Zara Khan'], { 'Zara Khan': 'student; drop table' }, {})).toEqual({
      'Zara Khan': 'other',
    })
  })

  it('is the one guess, whether it is reached through the analysis or on its own', () => {
    expect(fromAnalysis).toBe(inferRoles)
  })
})
