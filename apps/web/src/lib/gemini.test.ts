import { describe, expect, it } from 'vitest'
import { EXTRACTION_SCHEMA } from './extractionPrompt'
import { DEFAULT_MODEL, readerFrom, toGeminiSchema } from './gemini'

/** An env reader over a plain object, which is what both runtimes reduce to. */
function envOf(vars: Record<string, string>) {
  return (key: string) => vars[key]
}

describe('toGeminiSchema', () => {
  const converted = toGeminiSchema(EXTRACTION_SCHEMA) as Record<string, any>

  it('turns a nullable union into Gemini’s nullable flag', () => {
    // ['object', 'null'] is how a claim is made optional in the schema, and
    // Gemini takes a single type plus nullable instead.
    const q = converted.properties.questions.items.properties
    expect(q.studentReasoning.type).toBe('object')
    expect(q.studentReasoning.nullable).toBe(true)
  })

  it('leaves a type that was never a union alone', () => {
    const q = converted.properties.questions.items.properties
    expect(q.itemId.type).toBe('string')
    expect(q.itemId.nullable).toBeUndefined()
  })

  it('strips every additionalProperties — Gemini refuses the request over one', () => {
    expect(JSON.stringify(converted)).not.toContain('additionalProperties')
  })

  it('keeps the parts that carry the meaning', () => {
    const s = JSON.stringify(converted)
    expect(s).toContain('teacherFeedback')
    expect(s).toContain('complicates')
    expect(s).toContain('vocabulary')
    // The descriptions are half the instruction; losing them would leave the
    // request valid and the readings worse, which is the failure that hides.
    expect(s).toContain('character for character')
    expect(s).toContain('Never invent one')
  })

  it('keeps required, so a claim cannot come back half-built', () => {
    expect(converted.required).toEqual(['questions', 'session'])
    const claim = converted.properties.questions.items.properties.studentReasoning
    expect(claim.required).toEqual(['text', 'quote', 'speaker'])
  })

  it('keeps the enums that make a finding legible', () => {
    const kinds =
      converted.properties.questions.items.properties.teacherFeedback.items.properties.kind.enum
    expect(kinds).toContain('strategy')
    expect(kinds).toContain('correction')
  })

  it('does not touch the schema it was given', () => {
    const before = JSON.stringify(EXTRACTION_SCHEMA)
    toGeminiSchema(EXTRACTION_SCHEMA)
    expect(JSON.stringify(EXTRACTION_SCHEMA)).toBe(before)
  })

  it('survives a union with nothing left but null', () => {
    expect(toGeminiSchema({ type: ['null'] })).toEqual({ type: 'string', nullable: true })
  })
})

describe('readerFrom', () => {
  it('uses the default model when none is named', () => {
    expect(readerFrom(envOf({ GEMINI_API_KEY: 'k' })).model).toBe(DEFAULT_MODEL)
  })

  it('lets the model be changed without touching code', () => {
    const r = readerFrom(envOf({ GEMINI_API_KEY: 'k', EXTRACTION_MODEL: 'gemini-3-pro' }))
    expect(r.model).toBe('gemini-3-pro')
  })

  it('names the variable to set when the key is missing', () => {
    expect(() => readerFrom(envOf({}))).toThrow(/GEMINI_API_KEY/)
  })
})
