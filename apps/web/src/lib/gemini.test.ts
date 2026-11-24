import { afterEach, describe, expect, it, vi } from 'vitest'
import { EXTRACTION_SCHEMA } from './extractionPrompt'
import { BUSY_MESSAGE, DEFAULT_MODEL, geminiReader, readerFrom, toGeminiSchema } from './gemini'

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

describe('geminiReader when a model is overloaded', () => {
  const ok = () =>
    new Response(JSON.stringify({ candidates: [{ content: { parts: [{ text: '{"a":1}' }] }, finishReason: 'STOP' }] }), { status: 200 })
  const busy = () => new Response('{"error":{"code":503,"message":"high demand"}}', { status: 503 })
  const call = { system: 's', prompt: 'p', schema: { type: 'object' } }

  afterEach(() => vi.unstubAllGlobals())

  /** Answers by the model in the URL; records which were asked. */
  function stub(answer: (model: string) => Response) {
    const asked: string[] = []
    vi.stubGlobal('fetch', async (url: string) => {
      const model = /models\/([^:]+):/.exec(url)![1]
      asked.push(model)
      return answer(model)
    })
    return asked
  }

  it('asks the fallback once the chosen model is busy on a retry too', async () => {
    const asked = stub((m) => (m === 'slow' ? busy() : ok()))
    const r = geminiReader('k', 'slow', { fallback: 'spare', backoffMs: 0 })
    await expect(r.read(call)).resolves.toEqual({ a: 1 })
    expect(asked).toEqual(['slow', 'slow', 'spare'])
  })

  it('says so in plain words when every model is busy', async () => {
    const asked = stub(() => busy())
    const r = geminiReader('k', 'slow', { fallback: 'spare', backoffMs: 0 })
    await expect(r.read(call)).rejects.toThrow(BUSY_MESSAGE)
    expect(asked).toEqual(['slow', 'slow', 'spare', 'spare', 'spare'])
  })

  it('without a fallback, retries the chosen model three times', async () => {
    const asked = stub(() => busy())
    await expect(geminiReader('k', 'slow', { backoffMs: 0 }).read(call)).rejects.toThrow(BUSY_MESSAGE)
    expect(asked).toEqual(['slow', 'slow', 'slow', 'slow'])
  })

  it('does not reach for the fallback on a fault that is not load', async () => {
    const asked = stub(() => new Response('nope', { status: 404 }))
    await expect(geminiReader('k', 'gone', { fallback: 'spare', backoffMs: 0 }).read(call)).rejects.toThrow(/404/)
    expect(asked).toEqual(['gone'])
  })
})
