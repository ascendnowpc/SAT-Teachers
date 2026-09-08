import { inferRoles, suggestOffset, type Role } from './analysis'
import type { Drop, Extraction } from './extraction.ts'
import { askOrder } from './report'
import { supabase } from './supabase'
import { DEFAULT_OFFSET_SECONDS, parseTranscript, windowsFor } from './transcript'
import type { Session, SessionItem } from './types'

/**
 * Asking the server to read the recording, and reading back what it found.
 *
 * The call itself is small. What this module is really for is the two things
 * the server cannot decide and the teacher already has controls for: where the
 * first question sits in the recording, and which speaker is which. Both are
 * computed here exactly as the write-up page computes them, so the reading the
 * teacher gets from the console and the alignment they see on the write-up page
 * are the same alignment rather than two that happen to agree most of the time.
 */

export interface ContextExtractionRow {
  session_id: string
  body: Extraction
  drops: Drop[]
  transcript_md5: string
  model: string
  offset_seconds: number
  created_at: string
}

export interface ReadResult {
  extraction: Extraction
  drops: Drop[]
  drop_rate: number
  /** Which model answered. Set by the server, not chosen here. */
  model: string
  coverage: { covered: number; total: number }
}

/**
 * The offset and the roles, worked out the same way the write-up page does.
 *
 * Exported because the console shows them next to the button: a teacher about
 * to spend a model call on a reading should be able to see that it thinks the
 * lesson starts at 2:30 and that Sara is the student, and go and fix it on the
 * write-up page first if either is wrong.
 */
export function alignmentFor(
  session: Session | null,
  items: SessionItem[],
  body: string,
): { offset: number; roles: Record<string, Role>; speakers: string[] } {
  const transcript = parseTranscript(body)
  const roles = inferRoles(
    transcript.speakers,
    session?.teacher?.full_name,
    session?.student?.full_name,
  )

  const answered = items
    .filter((i) => i.status === 'answered' || i.status === 'revealed')
    .sort((a, b) => askOrder(a) - askOrder(b))

  const ids = answered.map((i) => i.id)
  const at = (offset: number) =>
    windowsFor(
      answered.map((i) => ({ id: i.id, startedAt: i.first_viewed_at })),
      transcript.duration,
      offset,
    )

  const offset =
    transcript.lines.length > 0 && ids.length > 0
      ? suggestOffset(transcript, at, ids, roles)
      : DEFAULT_OFFSET_SECONDS

  return { offset, roles, speakers: transcript.speakers }
}

/**
 * Runs the reading.
 *
 * Everything that matters happens on the other side of this call — the server
 * loads the transcript and the answers itself and throws away every claim it
 * cannot point at a line of the recording. What comes back has already been
 * through that, drops included, which is why the drop rate is worth showing
 * rather than swallowing.
 */
export async function readRecording(input: {
  sessionId: string
  session: Session | null
  items: SessionItem[]
  transcriptBody: string
  /**
   * Where the first question sits in the recording, when the teacher has said.
   *
   * Falls back to {@link alignmentFor}'s guess, which is right for a lesson that
   * runs question by question and cannot be right for one where the paper is
   * taken in silence and discussed at the end — there, every candidate offset
   * inside the discussion scores the same and the guess lands wherever it likes.
   * So the teacher can overrule it, and on that shape of lesson they have to.
   */
  offset?: number
}): Promise<ReadResult> {
  const guessed = alignmentFor(input.session, input.items, input.transcriptBody)
  const offset = Number.isFinite(input.offset) ? Number(input.offset) : guessed.offset
  const roles = guessed.roles

  const { data, error } = await supabase.functions.invoke<ReadResult>('extract_session_context', {
    body: { session_id: input.sessionId, offset_seconds: offset, roles },
  })

  // A function that refuses says why in its body, and the message is the useful
  // half — "the diagnostic form has not been submitted yet" is something a
  // teacher can act on, where "Edge Function returned a non-2xx status code" is
  // not.
  if (error) {
    const detail = await readFunctionError(error)
    throw new Error(detail ?? error.message)
  }
  if (!data) throw new Error('the reading came back empty')
  return data
}

async function readFunctionError(error: unknown): Promise<string | null> {
  const response = (error as { context?: Response })?.context
  if (!response || typeof response.json !== 'function') return null
  try {
    const body = await response.json()
    return typeof body?.error === 'string' ? body.error : null
  } catch {
    return null
  }
}

/** The stored reading, or null when the recording has not been read yet. */
export async function loadExtraction(sessionId: string): Promise<ContextExtractionRow | null> {
  const { data } = await supabase
    .from('session_context_extractions')
    .select('*')
    .eq('session_id', sessionId)
    .maybeSingle()
  return (data as ContextExtractionRow | null) ?? null
}
