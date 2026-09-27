/**
 * The recording and the reading of it, in the rules every seat that can
 * generate a report needs to agree on: whether the stored reading is still of
 * this session as it stands, and who put a thing in.
 *
 * Pure, so the teacher's console, the admin's session page and the report
 * cannot disagree about either — and so the suite can say so.
 */

/** What changed after the recording was read. */
export type Staleness = 'transcript' | 'form'

/**
 * Why the stored reading is no longer of this session, or null when it is.
 *
 * A reading is taken against two things: the transcript, whose lines it
 * quotes, and the teacher's form, whose every row it files its evidence under
 * as supporting, complicating or adding to what the form says. So it goes out
 * of date when either changes. A transcript is replaced in place and its
 * created_at moves with its text (0048); a form handed in again moves
 * form_submitted_at; and a reading is dated each time it is taken (0051).
 * generate_report checks the same two things and refuses — this is how a
 * screen knows to read again first rather than find out from the refusal.
 */
export function readingStaleness(
  reading: { created_at: string } | null,
  transcript: { created_at: string } | null,
  formSubmittedAt?: string | null,
): Staleness | null {
  if (!reading) return null
  const readAt = Date.parse(reading.created_at)
  if (transcript && Date.parse(transcript.created_at) > readAt) return 'transcript'
  if (formSubmittedAt && Date.parse(formSubmittedAt) > readAt) return 'form'
  return null
}

/** Whether the stored reading is out of date — see {@link readingStaleness}. */
export function readingIsStale(
  reading: { created_at: string } | null,
  transcript: { created_at: string } | null,
  formSubmittedAt?: string | null,
): boolean {
  return readingStaleness(reading, transcript, formSubmittedAt) !== null
}

/** The line a screen shows beside the Generate button when the reading is out of date. */
export const STALE_READING: Record<Staleness, string> = {
  transcript:
    'The transcript was changed after the recording was last read. Generating again reads the new one.',
  form:
    'The diagnostic form was handed in again after the recording was last read. Generating again reads it against the form as it is now.',
}

/**
 * Who did something, as the page reading it should say it.
 *
 * Two seats can now write a transcript and generate a report (0048), so a
 * timestamp alone no longer says whose work it was. Null when the row does not
 * know — everything written before 0048 — rather than a guess.
 */
export function whoDid(
  id: string | null | undefined,
  known: { me: string | null | undefined; teacherId: string; teacherName: string | null | undefined },
): string | null {
  if (!id) return null
  if (id === known.me) return 'you'
  if (id === known.teacherId) return known.teacherName ?? 'the teacher'
  return 'an admin'
}
