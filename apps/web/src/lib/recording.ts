/**
 * The recording and the reading of it, in the two rules both seats that can
 * generate a report need to agree on: whether the stored reading is of the
 * transcript that is there now, and who put a thing in.
 *
 * Pure, so the teacher's console and the admin's session page cannot disagree
 * about either — and so the suite can say so.
 */

/**
 * Whether the stored reading is of an older transcript than the one there now.
 *
 * A transcript is replaced in place, and since 0048 its created_at moves with
 * its text, so a reading taken before the latest change is a reading of a
 * different recording. generate_report checks the same thing by md5 and
 * refuses; this is how the screen knows to read again first rather than find
 * out from the refusal.
 */
export function readingIsStale(
  reading: { created_at: string } | null,
  transcript: { created_at: string } | null,
): boolean {
  if (!reading || !transcript) return false
  return Date.parse(transcript.created_at) > Date.parse(reading.created_at)
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
