import { describe, expect, it } from 'vitest'
import { DOMAINS, domainOrder } from './domains'
import { domainOrder as fromGrid } from './grid'

describe('domainOrder', () => {
  it('gives each subject its own four, in the order the form prints them', () => {
    expect(domainOrder('english')).toEqual([
      'information_and_ideas',
      'craft_and_structure',
      'expression_of_ideas',
      'standard_english_conventions',
    ])
    expect(domainOrder('mathematics')).toEqual([
      'algebra',
      'advanced_math',
      'problem_solving_and_data_analysis',
      'geometry_and_trigonometry',
    ])
  })

  // The edge function passes the session's subject straight from the row.
  it('falls back to English for a subject it does not know, or none', () => {
    expect(domainOrder(null)).toEqual(DOMAINS.english)
    expect(domainOrder(undefined)).toEqual(DOMAINS.english)
    expect(domainOrder('latin')).toEqual(DOMAINS.english)
  })

  it('is the one list, whether it is reached through the grid or on its own', () => {
    expect(fromGrid).toBe(domainOrder)
  })
})
