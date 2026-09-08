/**
 * The model call.
 *
 * Gemini reads the recording, and this is the only file in the repo that knows
 * that. Everything above it — the guard in ./extraction.ts, the prompt and
 * schema in ./extractionPrompt.ts, the assembly in ./reportDoc.ts, the whole
 * report — is written against a shape rather than against a vendor, so the model
 * is a detail here and not an assumption spread through the codebase.
 *
 * The answer comes back through `responseSchema`: the structure is enforced by
 * the decoder rather than requested in prose, so the model cannot return a shape
 * the schema does not describe, and there is no JSON to fish out of a paragraph.
 * What it *says* inside that shape is still checked, claim by claim, by the
 * guard — a well-formed lie is still a lie, and that is what the quote rule is
 * for.
 *
 * ## Why fetch rather than @google/genai
 *
 * This module runs in two runtimes: Deno, in the edge function, and Node, in
 * `tools/bench-extraction.mjs`. One documented request body works in both
 * without an SDK version to keep in step across them, and the request below is
 * the whole of what an SDK would have wrapped.
 */

/**
 * The default model, overridable with `EXTRACTION_MODEL`.
 *
 * Model names move faster than this file will, and this one should not be taken
 * as current without checking. The failure is at least loud — a 404 from Google
 * naming the model — rather than silent.
 */
export const DEFAULT_MODEL = 'gemini-2.5-pro'

export const KEY_VAR = 'GEMINI_API_KEY'

/** How much room the answer gets. A 23-question reading runs ~6k tokens. */
const MAX_TOKENS = 16000

export interface ReadCall {
  system: string
  prompt: string
  /** `EXTRACTION_SCHEMA` — plain JSON Schema, translated below. */
  schema: unknown
}

export interface Reader {
  model: string
  /** Returns the parsed object. Throws with Google's own message on failure. */
  read(call: ReadCall): Promise<unknown>
}

// ---------------------------------------------------------------- schema --

type Json = Record<string, unknown>

/**
 * The schema, rewritten for Gemini's dialect.
 *
 * Gemini takes an OpenAPI 3.0 subset rather than full JSON Schema, and differs
 * in two ways that each reject the request outright rather than degrade it:
 *
 *   · `type` is a single string, so the `['object', 'null']` union that makes a
 *     claim optional has to become `type: 'object'` plus `nullable: true`
 *   · `additionalProperties` is not understood and is refused
 *
 * Everything else — properties, required, items, enum, description — carries
 * over unchanged, which is why this is a translation and not a second schema.
 * A second schema would be a second thing to keep in step, and the one that
 * drifted would be the one no test covered. The descriptions matter most: they
 * are where half the instruction lives, and dropping them would leave the
 * request valid and the readings worse.
 */
export function toGeminiSchema(schema: unknown): unknown {
  if (Array.isArray(schema)) return schema.map(toGeminiSchema)
  if (schema === null || typeof schema !== 'object') return schema

  const input = schema as Json
  const out: Json = {}

  for (const [key, value] of Object.entries(input)) {
    if (key === 'additionalProperties') continue

    if (key === 'type' && Array.isArray(value)) {
      const types = value.filter((t) => t !== 'null')
      out.type = types[0] ?? 'string'
      if (types.length !== value.length) out.nullable = true
      continue
    }

    out[key] = toGeminiSchema(value)
  }

  return out
}

// ----------------------------------------------------------------- the call --

export function geminiReader(apiKey: string, model: string = DEFAULT_MODEL): Reader {
  return {
    model,
    async read({ system, prompt, schema }) {
      const response = await fetch(
        `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent`,
        {
          method: 'POST',
          headers: { 'x-goog-api-key': apiKey, 'content-type': 'application/json' },
          body: JSON.stringify({
            systemInstruction: { parts: [{ text: system }] },
            contents: [{ role: 'user', parts: [{ text: prompt }] }],
            generationConfig: {
              responseMimeType: 'application/json',
              responseSchema: toGeminiSchema(schema),
              maxOutputTokens: MAX_TOKENS,
            },
          }),
        },
      )

      if (!response.ok) {
        const body = await response.text()
        throw new Error(`Gemini returned ${response.status}: ${body.slice(0, 600)}`)
      }

      const body = await response.json()
      const text = body.candidates?.[0]?.content?.parts?.[0]?.text

      // A refusal, a safety stop or a truncated answer all arrive as a 200 with
      // no text rather than as an error, so the reason is worth carrying up —
      // MAX_TOKENS is the one a teacher could actually hit on a long lesson.
      if (typeof text !== 'string') {
        const why = body.candidates?.[0]?.finishReason ?? 'no candidates'
        throw new Error(`Gemini returned no JSON (${why})`)
      }

      return JSON.parse(text)
    },
  }
}

/**
 * The reader, from the environment.
 *
 * `GEMINI_API_KEY` is required and `EXTRACTION_MODEL` is optional. Both are read
 * through a function rather than off a global so the same code works under Deno
 * and Node without knowing which it is in.
 */
export function readerFrom(env: (key: string) => string | undefined): Reader {
  const apiKey = env(KEY_VAR)
  if (!apiKey) throw new Error(`${KEY_VAR} is not set.`)
  return geminiReader(apiKey, env('EXTRACTION_MODEL') || DEFAULT_MODEL)
}
