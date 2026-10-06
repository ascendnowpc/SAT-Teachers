import { describe, expect, it } from 'vitest'
import {
  ENGLISH_DOMAINS,
  ENGLISH_SAMPLE_MODULE,
  MATH_DOMAINS,
  formatMinutes,
  secondsPerQuestion,
  totalMinutes,
  totalQuestions,
} from './satGuide'

describe('the SAT at a glance', () => {
  it('is 2h 24m with the break, as the slides say', () => {
    expect(totalMinutes()).toBe(144)
    expect(formatMinutes(totalMinutes())).toBe('2h 24m')
    expect(formatMinutes(64)).toBe('1h 4m')
    expect(formatMinutes(32)).toBe('32 min')
  })

  it('asks 54 English questions and 44 maths ones', () => {
    expect(totalQuestions(undefined, 'english')).toBe(54)
    expect(totalQuestions(undefined, 'mathematics')).toBe(44)
    expect(totalQuestions()).toBe(98)
  })

  it('gives about 70 seconds an English question and 95 a maths one', () => {
    expect(secondsPerQuestion('english')).toBe(70)
    expect(secondsPerQuestion('mathematics')).toBe(95)
  })

  it('splits each section into shares that add up to the whole', () => {
    expect(ENGLISH_DOMAINS.reduce((s, d) => s + d.share, 0)).toBe(100)
    expect(MATH_DOMAINS.reduce((s, d) => s + d.share, 0)).toBe(100)
  })

  it('draws a sample module of 27 questions, two of them unscored', () => {
    const levels = ENGLISH_SAMPLE_MODULE.flatMap((g) => g.levels)
    expect(levels).toHaveLength(27)
    expect(levels.filter((l) => l === 'unscored')).toHaveLength(2)
  })
})
