import { describe, expect, it } from 'vitest'
import { splitFractions, type MathSegment } from './fractions'

/** The segments back as a string, fractions as [top|bottom], to read at a glance. */
function show(segments: MathSegment[]): string {
  return segments
    .map((s) => (s.kind === 'text' ? s.text : `[${show(s.num)}|${show(s.den)}]`))
    .join('')
}

const f = (text: string) => show(splitFractions(text))

describe('splitFractions', () => {
  it('returns nothing for nothing, and text without a slash untouched', () => {
    expect(splitFractions(null)).toEqual([])
    expect(splitFractions('')).toEqual([])
    expect(splitFractions('45π')).toEqual([{ kind: 'text', text: '45π' }])
  })

  it('stacks a plain number over a number', () => {
    expect(splitFractions('1/14')).toEqual([
      {
        kind: 'frac',
        num: [{ kind: 'text', text: '1' }],
        den: [{ kind: 'text', text: '14' }],
        source: '1/14',
      },
    ])
  })

  it('keeps a full stop after the denominator out of it', () => {
    expect(f('the probability is 1/14. B mistakes')).toBe('the probability is [1|14]. B mistakes')
  })

  it('takes roots, coefficients and letters as part of the term', () => {
    expect(f('√15/4')).toBe('[√15|4]')
    expect(f('4√15/15')).toBe('[4√15|15]')
    expect(f('tan X = YZ/XZ = 12/35')).toBe('tan X = [YZ|XZ] = [12|35]')
    expect(f('h/√2')).toBe('[h|√2]')
  })

  it('leaves the sign in front of a fraction outside it', () => {
    expect(f('v = −w/(150x)')).toBe('v = −[w|150x]')
    expect(f('w = −150v/x')).toBe('w = −[150v|x]')
    expect(f('(−26/3, 0)')).toBe('(−[26|3], 0)')
  })

  it('takes a bracketed group whole and drops the brackets the bar replaces', () => {
    expect(f('(2 ± √40)/2')).toBe('[2 ± √40|2]')
    expect(f('(24,000 − 19,350)/5 = 930')).toBe('[24,000 − 19,350|5] = 930')
    expect(f('−1/(−9) = 1/9')).toBe('−[1|−9] = [1|9]')
  })

  it('keeps a function call together on top', () => {
    expect(f('g(x) = f(x)/(x + 3), where')).toBe('g(x) = [f(x)|x + 3], where')
  })

  it('finds a fraction inside brackets that are not its own', () => {
    expect(f('(1/2)y = 4')).toBe('([1|2])y = 4')
    expect(f('(4/3)π(34³)')).toBe('([4|3])π(34³)')
    expect(f('b(1 + 1/0.83)')).toBe('b(1 + [1|0.83])')
  })

  it('stacks a fraction inside a fraction', () => {
    expect(f('(1/2)/(3/4)')).toBe('[[1|2]|[3|4]]')
  })

  it('reads a thousands comma as part of the number and a list comma as not', () => {
    expect(f('24,000/5')).toBe('[24,000|5]')
    expect(f('1/2, 3/4')).toBe('[1|2], [3|4]')
  })

  it('leaves a slash it cannot read as a division alone', () => {
    expect(f('and/or')).toBe('and/or')
    expect(f('either/or, 1/2')).toBe('either/or, [1|2]')
    expect(f('a / b')).toBe('a / b')
    expect(f('https://example.com')).toBe('https://example.com')
    expect(f('1/')).toBe('1/')
  })
})
