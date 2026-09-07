import { describe, expect, it } from 'vitest'
import { EXTRACTION_TOOL } from './extractionPrompt'
import {
  DEFAULT_MODEL,
  KEY_VAR,
  isProviderName,
  providerFrom,
  toGeminiSchema,
  type ProviderName,
} from './providers'

/** An env reader over a plain object, which is what both runtimes reduce to. */
function envOf(vars: Record<string, string>) {
  return (key: string) => vars[key]
}

describe('toGeminiSchema', () => {
  const converted = toGeminiSchema(EXTRACTION_TOOL.input_schema) as Record<string, unknown>

  it('turns a nullable union into Gemini’s nullable flag', () => {
    // ['object', 'null'] is how a claim is made optional everywhere else, and
    // Gemini takes a single type plus nullable instead.
    const q = (converted.properties as Record<string, any>).questions.items.properties
    expect(q.studentReasoning.type).toBe('object')
    expect(q.studentReasoning.nullable).toBe(true)
  })

  it('leaves a type that was never a union alone', () => {
    const q = (converted.properties as Record<string, any>).questions.items.properties
    expect(q.itemId.type).toBe('string')
    expect(q.itemId.nullable).toBeUndefined()
  })

  it('strips every additionalProperties — Gemini rejects the request over one', () => {
    expect(JSON.stringify(converted)).not.toContain('additionalProperties')
  })

  it('strips strict, which is an Anthropic tool flag and means nothing here', () => {
    expect(JSON.stringify(converted)).not.toContain('"strict"')
  })

  it('keeps the parts that carry the meaning', () => {
    const s = JSON.stringify(converted)
    expect(s).toContain('teacherFeedback')
    expect(s).toContain('complicates')
    expect(s).toContain('vocabulary')
    // The descriptions are most of the instruction; losing them would quietly
    // make the schema valid and the readings worse.
    expect(s).toContain('character for character')
  })

  it('does not touch the schema it was given', () => {
    const before = JSON.stringify(EXTRACTION_TOOL.input_schema)
    toGeminiSchema(EXTRACTION_TOOL.input_schema)
    expect(JSON.stringify(EXTRACTION_TOOL.input_schema)).toBe(before)
  })

  it('survives a union with no type left but null', () => {
    expect(toGeminiSchema({ type: ['null'] })).toEqual({ type: 'string', nullable: true })
  })
})

describe('providerFrom', () => {
  it('takes the vendor it is told to take', () => {
    const p = providerFrom(envOf({ EXTRACTION_PROVIDER: 'gemini', GEMINI_API_KEY: 'k' }))
    expect(p.provider).toBe('gemini')
    expect(p.model).toBe(DEFAULT_MODEL.gemini)
  })

  it('falls back to whichever key is actually set', () => {
    // A deployment with one key should work without also setting a variable
    // nobody told them about.
    const p = providerFrom(envOf({ XAI_API_KEY: 'k' }))
    expect(p.provider).toBe('xai')
  })

  it('lets the model be overridden without touching code', () => {
    const p = providerFrom(
      envOf({ EXTRACTION_PROVIDER: 'gemini', GEMINI_API_KEY: 'k', EXTRACTION_MODEL: 'gemini-x' }),
    )
    expect(p.model).toBe('gemini-x')
  })

  it('names the variables to set when there is no key at all', () => {
    expect(() => providerFrom(envOf({}))).toThrow(/ANTHROPIC_API_KEY/)
  })

  it('refuses a vendor it does not have, rather than guessing one', () => {
    expect(() => providerFrom(envOf({ EXTRACTION_PROVIDER: 'llama' }))).toThrow(/expected one of/)
  })

  it('says which key is missing when the vendor is named without one', () => {
    expect(() => providerFrom(envOf({ EXTRACTION_PROVIDER: 'gemini' }))).toThrow(/GEMINI_API_KEY/)
  })

  it('has a key variable and a default model for every vendor it offers', () => {
    for (const name of ['anthropic', 'gemini', 'xai'] as ProviderName[]) {
      expect(KEY_VAR[name]).toBeTruthy()
      expect(DEFAULT_MODEL[name]).toBeTruthy()
      expect(isProviderName(name)).toBe(true)
    }
  })
})
