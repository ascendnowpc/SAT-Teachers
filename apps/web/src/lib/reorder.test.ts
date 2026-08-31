import { describe, expect, it } from 'vitest'
import { addAll, move, removeAll, toggle } from './reorder'

describe('move', () => {
  const list = ['a', 'b', 'c', 'd']

  it('moves an entry down, closing the gap behind it', () => {
    expect(move(list, 0, 2)).toEqual(['b', 'c', 'a', 'd'])
  })

  it('moves an entry up', () => {
    expect(move(list, 3, 1)).toEqual(['a', 'd', 'b', 'c'])
  })

  it('moves to either end', () => {
    expect(move(list, 2, 0)).toEqual(['c', 'a', 'b', 'd'])
    expect(move(list, 0, 3)).toEqual(['b', 'c', 'd', 'a'])
  })

  it('leaves the list alone for a move that goes nowhere or off the end', () => {
    expect(move(list, 1, 1)).toBe(list)
    expect(move(list, -1, 2)).toBe(list)
    expect(move(list, 0, 4)).toBe(list)
    expect(move(list, 9, 0)).toBe(list)
  })

  it('does not mutate the list it was given', () => {
    move(list, 0, 3)
    expect(list).toEqual(['a', 'b', 'c', 'd'])
  })
})

describe('toggle', () => {
  it('adds an absent id at the end', () => {
    expect(toggle(['a'], 'b')).toEqual(['a', 'b'])
  })

  it('removes a present id and leaves the rest in order', () => {
    expect(toggle(['a', 'b', 'c'], 'b')).toEqual(['a', 'c'])
  })
})

describe('addAll', () => {
  it('appends only what is missing, in the order given', () => {
    expect(addAll(['a'], ['b', 'c'])).toEqual(['a', 'b', 'c'])
  })

  it('leaves an already-picked question where it is', () => {
    // Adding the whole passage must not drag b to the end and split it up.
    expect(addAll(['b', 'z'], ['a', 'b', 'c'])).toEqual(['b', 'z', 'a', 'c'])
  })
})

describe('removeAll', () => {
  it('drops every id given and keeps the order of the rest', () => {
    expect(removeAll(['a', 'b', 'c', 'd'], ['b', 'd'])).toEqual(['a', 'c'])
  })

  it('ignores ids that are not in the list', () => {
    expect(removeAll(['a'], ['q'])).toEqual(['a'])
  })
})
