import { describe, expect, it } from 'vitest'
import { SECTIONS, SKILLS, skillFitsSection, skillLabel, skillsFor } from './constants'

describe('the skill taxonomy', () => {
  it('covers every English section and no Mathematics one', () => {
    for (const s of SECTIONS.english) expect(SKILLS[s.value]?.length).toBeGreaterThan(0)
    for (const s of SECTIONS.mathematics) expect(SKILLS[s.value]).toBeUndefined()
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
    expect(skillsFor(null)).toHaveLength(11)
  })

  // A Mathematics section has no skills yet; the form must show none rather
  // than fall back to the English list.
  it('offers nothing for a section that has no skills', () => {
    expect(skillsFor('algebra')).toEqual([])
  })
})

describe('skillFitsSection', () => {
  it('accepts a skill that belongs to the section', () => {
    expect(skillFitsSection('standard_english_conventions', 'boundaries')).toBe(true)
  })

  it('rejects a skill borrowed from another section', () => {
    expect(skillFitsSection('craft_and_structure', 'boundaries')).toBe(false)
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
