/**
 * The model call, behind one seam.
 *
 * Which vendor reads the recording is a decision that should be reversible by
 * an environment variable, not by a rewrite — so everything vendor-specific in
 * this codebase is in this file, and nothing above it knows which model
 * answered. The guard in ./extraction.ts, the prompt in ./extractionPrompt.ts,
 * the assembly in ./reportDoc.ts and every test over them are untouched by a
 * swap.
 *
 * That matters more than usual here because the right vendor for this job is an
 * open question and two transcripts is not enough to settle it. `tools/bench-extraction.mjs`
 * runs the same recording through each of these and scores them on the drop
 * rate — how often a model was asked for a verbatim quote and did not give one,
 * which is exactly the capability this feature lives or dies on. The seam is
 * what makes that comparison a config change rather than three branches.
 *
 * ## Why raw fetch rather than each vendor's SDK
 *
 * This module has to run in two runtimes — Deno, in the edge function, and Node,
 * in the bench — across three vendors. Three SDKs times two runtimes is six ways
 * to be wrong about an import, against three small request bodies that are
 * public, stable and documented. The request shapes below are the whole of what
 * an SDK would have wrapped.
 */

export type ProviderName = 'anthropic' | 'gemini' | 'xai'

export const PROVIDER_NAMES: ProviderName[] = ['anthropic', 'gemini', 'xai']

/**
 * The default model per vendor, and the env var that overrides it.
 *
 * Model names move faster than this file will. Every one of these is
 * overridable with EXTRACTION_MODEL precisely so that a rename is a secret
 * change rather than a deploy, and none of them should be taken as current
 * without checking — the failure is loud (a 404 from the vendor naming the
 * model) rather than silent, which is the one mercy here.
 */
export const DEFAULT_MODEL: Record<ProviderName, string> = {
  anthropic: 'claude-opus-5',
  gemini: 'gemini-2.5-pro',
  xai: 'grok-4',
}

/** Which env var each vendor's key is read from. */
export const KEY_VAR: Record<ProviderName, string> = {
  anthropic: 'ANTHROPIC_API_KEY',
  gemini: 'GEMINI_API_KEY',
  xai: 'XAI_API_KEY',
}

export interface ReadCall {
  system: string
  prompt: string
  /**
   * The JSON Schema the answer must satisfy — `EXTRACTION_TOOL.input_schema`.
   * Each adapter presents it in whatever way its vendor takes structured
   * output, and translates the dialect where it has to.
   */
  schema: unknown
  /** What the tool or response format is called, where a vendor wants a name. */
  name: string
  description: string
}

export interface Provider {
  provider: ProviderName
  model: string
  /** Returns the parsed object. Throws with the vendor's own message on failure. */
  read(call: ReadCall): Promise<unknown>
}

/** How much room the answer gets. A 23-question reading runs ~6k tokens. */
const MAX_TOKENS = 16000

async function fail(vendor: string, response: Response): Promise<never> {
  const body = await response.text()
  throw new Error(`${vendor} returned ${response.status}: ${body.slice(0, 600)}`)
}

// ---------------------------------------------------------------- schema --

type Json = Record<string, unknown>

/**
 * The schema, rewritten for Gemini's dialect.
 *
 * Gemini takes an OpenAPI 3.0 subset rather than full JSON Schema, and differs
 * in three ways that each break the request rather than degrade it:
 *
 *   · `type` is a single string, so the `['object', 'null']` union that makes a
 *     claim optional has to become `type: 'object'` plus `nullable: true`
 *   · `additionalProperties` is not understood and is rejected
 *   · `strict` is an Anthropic tool-level flag and means nothing here
 *
 * Everything else — properties, required, items, enum, description — carries
 * over, which is why this is a translation rather than a second schema. A second
 * schema would be a second thing to keep in step, and the one that drifted would
 * be the one no test covered.
 */
export function toGeminiSchema(schema: unknown): unknown {
  if (Array.isArray(schema)) return schema.map(toGeminiSchema)
  if (schema === null || typeof schema !== 'object') return schema

  const input = schema as Json
  const out: Json = {}

  for (const [key, value] of Object.entries(input)) {
    if (key === 'additionalProperties' || key === 'strict') continue

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

// -------------------------------------------------------------- adapters --

function anthropic(apiKey: string, model: string): Provider {
  return {
    provider: 'anthropic',
    model,
    async read({ system, prompt, schema, name, description }) {
      const response = await fetch('https://api.anthropic.com/v1/messages', {
        method: 'POST',
        headers: {
          'x-api-key': apiKey,
          'anthropic-version': '2023-06-01',
          'content-type': 'application/json',
        },
        body: JSON.stringify({
          model,
          max_tokens: MAX_TOKENS,
          system,
          // Adaptive thinking: this is a long reading over a lot of speech, and
          // the judgement it is being asked for — who was actually speaking —
          // is the part worth thinking about.
          thinking: { type: 'adaptive' },
          tools: [{ name, description, input_schema: schema, strict: true }],
          // 'auto' rather than forcing the tool, because forcing it is refused
          // alongside thinking on some models. The prompt names the tool.
          tool_choice: { type: 'auto' },
          messages: [{ role: 'user', content: prompt }],
        }),
      })

      if (!response.ok) await fail('Anthropic', response)
      const body = await response.json()
      const call = (body.content ?? []).find((b: Json) => b.type === 'tool_use')
      if (!call) throw new Error(`Anthropic returned no tool call (stop: ${body.stop_reason})`)
      return call.input
    },
  }
}

function gemini(apiKey: string, model: string): Provider {
  return {
    provider: 'gemini',
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
              // Native structured output: the schema is enforced by the decoder
              // rather than requested in prose, which is the same guarantee the
              // tool schema gives on the other two.
              responseMimeType: 'application/json',
              responseSchema: toGeminiSchema(schema),
              maxOutputTokens: MAX_TOKENS,
            },
          }),
        },
      )

      if (!response.ok) await fail('Gemini', response)
      const body = await response.json()
      const text = body.candidates?.[0]?.content?.parts?.[0]?.text
      if (typeof text !== 'string') {
        const why = body.candidates?.[0]?.finishReason ?? 'no candidates'
        throw new Error(`Gemini returned no JSON (${why})`)
      }
      return JSON.parse(text)
    },
  }
}

function xai(apiKey: string, model: string): Provider {
  return {
    provider: 'xai',
    model,
    async read({ system, prompt, schema, name }) {
      const response = await fetch('https://api.x.ai/v1/chat/completions', {
        method: 'POST',
        headers: { authorization: `Bearer ${apiKey}`, 'content-type': 'application/json' },
        body: JSON.stringify({
          model,
          max_tokens: MAX_TOKENS,
          messages: [
            { role: 'system', content: system },
            { role: 'user', content: prompt },
          ],
          // The OpenAI-compatible strict json_schema mode, which wants exactly
          // what this schema already is: additionalProperties false everywhere,
          // every property required, nullables as type unions.
          response_format: {
            type: 'json_schema',
            json_schema: { name, strict: true, schema },
          },
        }),
      })

      if (!response.ok) await fail('xAI', response)
      const body = await response.json()
      const text = body.choices?.[0]?.message?.content
      if (typeof text !== 'string') throw new Error('xAI returned no message content')
      return JSON.parse(text)
    },
  }
}

// ---------------------------------------------------------------- picking --

const BUILD: Record<ProviderName, (key: string, model: string) => Provider> = {
  anthropic,
  gemini,
  xai,
}

export function isProviderName(value: unknown): value is ProviderName {
  return typeof value === 'string' && (PROVIDER_NAMES as string[]).includes(value)
}

/**
 * The configured provider.
 *
 * `EXTRACTION_PROVIDER` picks the vendor and `EXTRACTION_MODEL` overrides the
 * model. Where neither is set, whichever vendor's key is present wins — so a
 * deployment that has only set one key does the obvious thing instead of
 * refusing on a variable nobody knew to set.
 */
export function providerFrom(env: (key: string) => string | undefined): Provider {
  const named = env('EXTRACTION_PROVIDER')
  if (named && !isProviderName(named)) {
    throw new Error(
      `EXTRACTION_PROVIDER is "${named}" — expected one of ${PROVIDER_NAMES.join(', ')}`,
    )
  }

  const chosen: ProviderName | undefined =
    (named as ProviderName | undefined) ?? PROVIDER_NAMES.find((p) => env(KEY_VAR[p]))

  if (!chosen) {
    throw new Error(
      `No model key is set. Set one of ${PROVIDER_NAMES.map((p) => KEY_VAR[p]).join(', ')}.`,
    )
  }

  const apiKey = env(KEY_VAR[chosen])
  if (!apiKey) throw new Error(`${KEY_VAR[chosen]} is not set, and it is what ${chosen} needs.`)

  return BUILD[chosen](apiKey, env('EXTRACTION_MODEL') || DEFAULT_MODEL[chosen])
}
