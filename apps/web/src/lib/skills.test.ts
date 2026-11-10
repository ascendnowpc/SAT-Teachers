import { describe, expect, it } from 'vitest'
import {
  SECTIONS,
  sectionOfSkill,
  SKILLS,
  skillFitsSection,
  skillLabel,
  skillList,
  skillsFor,
  skillsOn,
} from './constants'

describe('the skill taxonomy', () => {
  it('covers every section of both subjects', () => {
    for (const s of SECTIONS.english) expect(SKILLS[s.value]?.length).toBeGreaterThan(0)
    for (const s of SECTIONS.mathematics) expect(SKILLS[s.value]?.length).toBeGreaterThan(0)
  })

  it('gives every skill to exactly one section', () => {
    const all = Object.values(SKILLS).flat().map((s) => s.value)
    expect(new Set(all).size).toBe(all.length)
  })
})

describe('skillsFor', () => {
  it('narrows to the chosen section', () => {
    expect(skillsFor('expression_of_ideas').map((s) => s.value)).toEqual([
      'rhetorical_synthesis',
      'transitions',
    ])
  })

  it('offers every skill when no section is chosen yet', () => {
    // Eleven English and nineteen Mathematics — the taxonomy the database
    // checks (section, skill) against.
    expect(skillsFor(null)).toHaveLength(30)
  })

  it('narrows to a Mathematics section too', () => {
    expect(skillsFor('advanced_math').map((s) => s.value)).toEqual([
      'equivalent_expressions',
      'nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables',
      'nonlinear_functions',
    ])
  })

  it('offers nothing for a section that has no skills', () => {
    expect(skillsFor('not_a_section')).toEqual([])
  })
})

describe('skillFitsSection', () => {
  it('accepts a skill that belongs to the section', () => {
    expect(skillFitsSection('standard_english_conventions', 'boundaries')).toBe(true)
  })

  it('rejects a skill borrowed from another section', () => {
    expect(skillFitsSection('craft_and_structure', 'boundaries')).toBe(false)
    expect(skillFitsSection('algebra', 'nonlinear_functions')).toBe(false)
  })

  it('accepts no skill at all — the label is optional', () => {
    expect(skillFitsSection('craft_and_structure', null)).toBe(true)
    expect(skillFitsSection(null, null)).toBe(true)
  })

  it('rejects a skill with no section, since the pair is what is checked', () => {
    expect(skillFitsSection(null, 'boundaries')).toBe(false)
  })
})

describe('skillLabel', () => {
  it('reads back the grid wording', () => {
    expect(skillLabel('command_of_evidence_quantitative')).toBe('Command of Evidence — Quantitative')
  })

  it('passes an unknown value through rather than showing nothing', () => {
    expect(skillLabel('not_a_skill')).toBe('not_a_skill')
  })

  it('has no label for no skill', () => {
    expect(skillLabel(null)).toBeNull()
  })
})

/* ------------------------------------------------- a test on several (0086) */

describe('sectionOfSkill', () => {
  it('finds the one section a skill is in', () => {
    expect(sectionOfSkill('boundaries')).toBe('standard_english_conventions')
    expect(sectionOfSkill('circles')).toBe('geometry_and_trigonometry')
  })

  it('is null for a skill the list does not name, and for none', () => {
    expect(sectionOfSkill('command_of_evidence')).toBeNull()
    expect(sectionOfSkill(null)).toBeNull()
  })
})

describe('skillsOn', () => {
  it('reads the list, or a row from before 0086 by its one skill', () => {
    expect(skillsOn({ section: null, skills: ['transitions', 'boundaries'] })).toEqual([
      'transitions',
      'boundaries',
    ])
    expect(skillsOn({ section: 'expression_of_ideas', skill: 'transitions' })).toEqual(['transitions'])
  })

  it('is null for a whole section, and an empty list is no list', () => {
    expect(skillsOn({ section: 'expression_of_ideas', skill: null, skills: null })).toBeNull()
    expect(skillsOn({ section: 'expression_of_ideas', skill: null, skills: [] })).toBeNull()
  })
})

describe('skillList', () => {
  it('names one, two, and three skills as a phrase', () => {
    expect(skillList(['transitions'])).toBe('Transitions')
    expect(skillList(['transitions', 'boundaries'])).toBe('Transitions and Boundaries')
    expect(skillList(['transitions', 'boundaries', 'inferences'])).toBe(
      'Transitions, Boundaries and Inferences',
    )
  })

  it('counts the rest past the room it has', () => {
    expect(skillList(['transitions', 'boundaries', 'inferences', 'circles'], 3)).toBe(
      'Transitions, Boundaries and 2 more',
    )
    expect(skillList(['transitions', 'boundaries', 'inferences'], 3)).toBe(
      'Transitions, Boundaries and Inferences',
    )
  })
})
