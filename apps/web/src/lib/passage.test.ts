import { describe, expect, it } from 'vitest'
import { splitPassage } from './passage'

describe('splitPassage', () => {
  const passage = 'One. Two. Three.'

  it('returns nothing to render for an absent passage', () => {
    expect(splitPassage(null, null)).toEqual([])
    expect(splitPassage('', 'Two.')).toEqual([])
  })

  it('leaves a passage with no underlined sentence in one piece', () => {
    expect(splitPassage(passage, null)).toEqual([{ text: passage, underlined: false }])
    expect(splitPassage(passage, '')).toEqual([{ text: passage, underlined: false }])
  })

  it('marks the underlined sentence and keeps the text either side of it', () => {
    expect(splitPassage(passage, 'Two.')).toEqual([
      { text: 'One. ', underlined: false },
      { text: 'Two.', underlined: true },
      { text: ' Three.', underlined: false },
    ])
  })

  it('emits no empty segment when the sentence opens or closes the passage', () => {
    expect(splitPassage(passage, 'One.')).toEqual([
      { text: 'One.', underlined: true },
      { text: ' Two. Three.', underlined: false },
    ])
    expect(splitPassage(passage, 'Three.')).toEqual([
      { text: 'One. Two. ', underlined: false },
      { text: 'Three.', underlined: true },
    ])
  })

  it('underlines the whole passage when the span is the whole passage', () => {
    expect(splitPassage(passage, passage)).toEqual([{ text: passage, underlined: true }])
  })

  // A question that renders plainly is recoverable mid-session; a blank one is not.
  it('falls back to the plain passage when the span is not found', () => {
    expect(splitPassage(passage, 'Four.')).toEqual([{ text: passage, underlined: false }])
  })

  it('underlines only the first occurrence of a repeated sentence', () => {
    expect(splitPassage('Go. Go.', 'Go.')).toEqual([
      { text: 'Go.', underlined: true },
      { text: ' Go.', underlined: false },
    ])
  })
})
