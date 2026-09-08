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
 * Model names move faster than this file will. The first default written here
 * was `gemini-2.5-pro`, and the first time it was ever run Google answered "no
 * longer available to new users" — so check this one rather than trusting it.
 * The failure is at least loud: a 404 naming the model and its replacement.
 *
 * Measured on the 7 August recording, 23 windows, same prompt (see
 * `docs/reference/context-extraction.md`):
 *
 *   model                    kept  drop-rate  feedback found  secs
 *   gemini-3.5-flash           63      12.5%              35   125
 *   gemini-3.1-flash-lite      49       7.5%              24    21
 *   gemini-3.8-flash            —          —               —   503 every attempt
 *
 * 3.5-flash finds appreciably more — 35 pieces of teacher feedback against 24,
 * which is the thing the report is actually for — and drops a little more
 * looking for it. It would be the better default but for the clock: 125 seconds
 * is too close to an edge function's wall limit, and a run that times out gives
 * the teacher nothing at all, where a thinner reading still gives them
 * something. So the safe one is the default and the better one is one variable
 * away, for a deployment whose plan allows the time.
 *
 * Pro is not on the free tier at all — it answers 429 with `limit: 0`. On an
 * account with billing it is likely the best reading of the three and is worth
 * measuring with `tools/bench-extraction.mjs` before switching to it.
 */
export const DEFAULT_MODEL = 'gemini-3.1-flash-lite'

export const KEY_VAR = 'GEMINI_API_KEY'

/**
 * How much room the answer gets — and it has to cover the thinking too.
 *
 * This was 16000, which looked generous next to a reading that runs about 6k
 * tokens of actual JSON. It is not: on these models `maxOutputTokens` bounds the
 * thinking and the answer together, and the first real run against the 7 August
 * recording spent 13,511 tokens thinking and had 2,474 left to answer in, so the
 * JSON came back cut off mid-string.
 *
 * 65536 is the models' own output ceiling. Nothing is spent by asking for
 * headroom — billing is on tokens generated, not tokens allowed — and the
 * failure it prevents is one that produces a broken report rather than an error.
 */
const MAX_TOKENS = 65536

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

/**
 * How many times a 503 is retried, and how long it waits.
 *
 * Google answers 503 UNAVAILABLE — "currently experiencing high demand" — often
 * enough that it came up repeatedly in one afternoon of testing. It is load
 * rather than a fault, and it clears. A teacher who pressed the button should
 * not be handed a transient failure to interpret, so it is waited out here.
 *
 * Only 503. A 429 is quota and a 404 is a dead model name; retrying either just
 * makes the same mistake more slowly.
 */
const RETRY_ON = 503
const RETRIES = 3
const BACKOFF_MS = 2000

const wait = (ms: number) => new Promise((resolve) => setTimeout(resolve, ms))

export function geminiReader(apiKey: string, model: string = DEFAULT_MODEL): Reader {
  return {
    model,
    async read({ system, prompt, schema }) {
      const response = await withRetry(() =>
        fetch(
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
        ),
      )

      if (!response.ok) {
        const body = await response.text()
        throw new Error(`Gemini returned ${response.status}: ${body.slice(0, 600)}`)
      }

      const body = await response.json()
      const candidate = body.candidates?.[0]
      const text = candidate?.content?.parts?.[0]?.text
      const finish = candidate?.finishReason

      // Checked BEFORE parsing, because a truncated answer is still a string and
      // JSON.parse reports it as "Unterminated string at position 2555" — which
      // says nothing about the cause and sends the next person looking at the
      // schema. A stop that is not STOP is the actual explanation.
      if (finish && finish !== 'STOP') {
        const spent = body.usageMetadata?.thoughtsTokenCount
        throw new Error(
          `Gemini stopped early (${finish})` +
            (finish === 'MAX_TOKENS'
              ? ` — the answer did not fit in ${MAX_TOKENS} tokens${
                  spent ? `, of which thinking took ${spent}` : ''
                }. Raise MAX_TOKENS or shorten the lesson.`
              : ''),
        )
      }

      if (typeof text !== 'string') throw new Error(`Gemini returned no JSON (${finish ?? 'no candidates'})`)

      try {
        return JSON.parse(text)
      } catch {
        throw new Error(`Gemini returned ${text.length} characters that are not JSON`)
      }
    },
  }
}

/** Rides out a 503, which is load rather than a fault, and leaves the rest alone. */
async function withRetry(send: () => Promise<Response>): Promise<Response> {
  let response = await send()
  for (let attempt = 1; attempt <= RETRIES && response.status === RETRY_ON; attempt += 1) {
    await wait(BACKOFF_MS * attempt)
    response = await send()
  }
  return response
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
