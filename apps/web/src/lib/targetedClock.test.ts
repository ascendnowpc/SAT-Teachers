import { describe, expect, it } from 'vitest'
import {
  bindingClock,
  clockOffset,
  deadlineAt,
  outcomeOf,
  questionEndsAt,
  secondsLeft,
} from './targetedClock'

describe('clockOffset', () => {
  it('is the server minus the browser', () => {
    const received = Date.parse('2026-10-23T10:00:00Z')
    expect(clockOffset('2026-10-23T10:00:05Z', received)).toBe(5000)
    expect(clockOffset('2026-10-23T09:59:58Z', received)).toBe(-2000)
  })

  it('is zero when the server said nothing readable', () => {
    expect(clockOffset(null, 1)).toBe(0)
    expect(clockOffset('soon', 1)).toBe(0)
  })
})

describe('questionEndsAt and deadlineAt', () => {
  it('runs the question’s clock from the server’s first view', () => {
    expect(
      questionEndsAt({ first_viewed_at: '2026-10-23T10:00:00Z', time_limit_seconds: 60 }),
    ).toBe(Date.parse('2026-10-23T10:01:00Z'))
  })

  it('has no question clock without a limit or a view', () => {
    expect(
      questionEndsAt({ first_viewed_at: '2026-10-23T10:00:00Z', time_limit_seconds: null }),
    ).toBeNull()
    expect(questionEndsAt({ first_viewed_at: null, time_limit_seconds: 60 })).toBeNull()
  })

  it('reads the deadline, or nothing before the start', () => {
    expect(deadlineAt('2026-10-23T10:10:00Z')).toBe(Date.parse('2026-10-23T10:10:00Z'))
    expect(deadlineAt(null)).toBeNull()
  })
})

describe('secondsLeft', () => {
  const ends = Date.parse('2026-10-23T10:01:00Z')

  it('corrects the browser by the offset', () => {
    // The browser is 5 s behind the server: at its 10:00:30 the server is at 10:00:35.
    expect(secondsLeft(ends, Date.parse('2026-10-23T10:00:30Z'), 5000)).toBe(25)
  })

  it('stops at zero', () => {
    expect(secondsLeft(ends, Date.parse('2026-10-23T10:05:00Z'), 0)).toBe(0)
  })

  it('is null with no clock', () => {
    expect(secondsLeft(null, 0, 0)).toBeNull()
  })
})

describe('bindingClock', () => {
  it('counts down whichever ends first', () => {
    expect(bindingClock(100, 200)).toEqual({ endsAt: 100, which: 'question' })
    expect(bindingClock(300, 200)).toEqual({ endsAt: 200, which: 'overall' })
    expect(bindingClock(null, 200)).toEqual({ endsAt: 200, which: 'overall' })
    expect(bindingClock(100, null)).toEqual({ endsAt: 100, which: 'question' })
    expect(bindingClock(null, null)).toBeNull()
  })
})

describe('outcomeOf', () => {
  it('reads a question answered with no option as timed out', () => {
    expect(outcomeOf({ status: 'answered', selected_option: null })).toBe('timed_out')
    expect(outcomeOf({ status: 'revealed', selected_option: null })).toBe('timed_out')
    expect(outcomeOf({ status: 'answered', selected_option: 'B' })).toBe('answered')
    expect(outcomeOf({ status: 'answered', selected_option: null, skipped: true })).toBe('skipped')
    expect(outcomeOf({ status: 'revealed', selected_option: null, skipped: false })).toBe('timed_out')
    expect(outcomeOf({ status: 'voided', selected_option: null })).toBe('set_aside')
    expect(outcomeOf({ status: 'published', selected_option: null })).toBeNull()
  })

  it('reads a typed answer as answered, not as a question that ran out', () => {
    // A question the student writes the answer to (0073) never sets an
    // option, so reading only the option would put "Time ran out" under every
    // one of them.
    expect(outcomeOf({ status: 'answered', selected_option: null, entered_answer: '403' })).toBe(
      'answered',
    )
    expect(outcomeOf({ status: 'revealed', selected_option: null, entered_answer: '3/17' })).toBe(
      'answered',
    )
    // An empty string is still an answer the student sent; nothing sent at all
    // is null, and that is the one that ran out.
    expect(outcomeOf({ status: 'answered', selected_option: null, entered_answer: '' })).toBe(
      'answered',
    )
    expect(outcomeOf({ status: 'answered', selected_option: null, entered_answer: null })).toBe(
      'timed_out',
    )
    expect(
      outcomeOf({ status: 'answered', selected_option: null, entered_answer: null, skipped: true }),
    ).toBe('skipped')
  })
})
