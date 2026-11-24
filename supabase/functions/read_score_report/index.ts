import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import { DEFAULT_MODEL, FALLBACK_MODEL, KEY_VAR, geminiReader } from '../../../apps/web/src/lib/gemini.ts'
import {
  MAX_READ_BYTES,
  READABLE_TYPES,
  readingFromModel,
  SCORE_READER_PROMPT,
  SCORE_READER_SCHEMA,
  SCORE_READER_SYSTEM,
  type RawReading,
} from '../../../apps/web/src/lib/scoreReader.ts'
import { CORS, json } from '../_shared/http.ts'

/**
 * A score report read from a picture (the dashboard blueprint: "drop the
 * official report or a screenshot — the platform reads it").
 *
 *   POST /functions/v1/read_score_report
 *     { key, file, mime }          the student, signed in with their ID and PIN
 *     { file, mime }               staff or a PC, with their own token
 *     →  { score, name, notes }   the reading, checked — never saved here
 *
 * `file` is the picture or PDF, base64, up to 6 MB. The model the app already
 * uses (GEMINI_API_KEY, READER_MODEL if set) copies what is printed; what comes
 * back is checked against College Board's scale by lib/scoreReader and goes to
 * the form, where a person looks it over and saves it through the door they
 * always use. Nothing is kept: not the picture, not the reading.
 *
 * Who may ask: a working student key, or a signed-in teacher, admin or PC —
 * so the model is not an open door for whoever holds the public key.
 */
Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const apiKey = Deno.env.get(KEY_VAR)
  if (!apiKey) return json({ error: `${KEY_VAR} is not set.` }, 500)

  let body: { key?: string; file?: string; mime?: string }
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }
  const mime = (body.mime ?? '').toLowerCase()
  if (!READABLE_TYPES.includes(mime)) return json({ error: 'a PNG, JPEG, WebP or HEIC picture, or a PDF' }, 400)
  if (!body.file || typeof body.file !== 'string') return json({ error: 'file is required' }, 400)
  if ((body.file.length * 3) / 4 > MAX_READ_BYTES) return json({ error: 'the file is over 6 MB' }, 413)

  // ------------------------------------------------------- who is asking ---
  const asCaller = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_ANON_KEY')!, {
    global: { headers: { Authorization: req.headers.get('Authorization') ?? '' } },
    auth: { persistSession: false },
  })
  if (body.key) {
    const { error } = await asCaller.rpc('student_goal', { p_key: body.key })
    if (error) return json({ error: /signed out/i.test(error.message) ? 'signed out' : error.message }, 401)
  } else {
    const { data: user } = await asCaller.auth.getUser()
    if (!user?.user) return json({ error: 'not signed in' }, 401)
    const [{ data: staff }, { data: pc }] = await Promise.all([asCaller.rpc('is_teacher'), asCaller.rpc('is_pc')])
    if (staff !== true && pc !== true) return json({ error: 'only staff, a PC or the student reads a report here' }, 403)
  }

  // ------------------------------------------------------------ the read ---
  const reader = geminiReader(apiKey, Deno.env.get('READER_MODEL') || DEFAULT_MODEL, { fallback: Deno.env.get('FALLBACK_MODEL') || FALLBACK_MODEL })
  try {
    const raw = (await reader.read({
      system: SCORE_READER_SYSTEM,
      prompt: SCORE_READER_PROMPT,
      schema: SCORE_READER_SCHEMA,
      files: [{ mimeType: mime, data: body.file }],
    })) as RawReading
    return json({ ...readingFromModel(raw, new Date().toISOString().slice(0, 10)), model: reader.model })
  } catch (e) {
    return json({ error: e instanceof Error ? e.message : String(e) }, 502)
  }
})
