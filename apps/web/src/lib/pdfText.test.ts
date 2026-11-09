import { describe, expect, it } from 'vitest'
import { linesFromItems, type TextFragment } from './pdfText'

/** A fragment at (x, y), `size` points tall, `width` wide. */
const f = (str: string, x: number, y: number, width: number, size = 12): TextFragment => ({
  str,
  transform: [size, 0, 0, size, x, y],
  width,
})

describe('linesFromItems', () => {
  it('puts fragments back into lines, top of the page first, left to right', () => {
    expect(
      linesFromItems([
        f('620', 300, 700, 20),
        f('Reading and Writing', 100, 700, 120),
        f('Your Total Score', 100, 740, 100),
        f('1250', 220, 741, 28),
      ]),
    ).toEqual(['Your Total Score 1250', 'Reading and Writing 620'])
  })

  it('joins a number set in two pieces side by side, and spaces words with a gap between', () => {
    expect(linesFromItems([f('12', 100, 500, 14), f('50', 114, 500, 14), f('Total', 40, 500, 30)])).toEqual([
      'Total 1250',
    ])
  })

  it('drops what carries no text', () => {
    expect(linesFromItems([f('  ', 10, 10, 5), f('Math', 10, 20, 30)])).toEqual(['Math'])
  })
})
