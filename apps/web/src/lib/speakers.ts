/**
 * Who is who in the recording.
 *
 * On its own, importing nothing, because the edge function that reads the
 * recording needs the same first guess the screens make — see
 * {@link rolesFor}.
 */

export type Role = 'teacher' | 'student' | 'other'

/** The first name, lowercased — what two spellings of a person have in common. */
function firstName(name: string): string {
  return name.trim().toLowerCase().split(/\s+/)[0] ?? ''
}

/**
 * A first guess at who is who.
 *
 * Fathom labels turns with whatever the person called themselves in Zoom, which
 * is often neither the name on the account nor the same across two calls. So
 * this matches on the given name and gives up rather than guessing: an unmatched
 * speaker is 'other', and the write-up page asks. Attributing the teacher's
 * explanation to the student is the one mistake that would poison every finding
 * downstream, so it is not left to a heuristic.
 */
export function inferRoles(
  speakers: string[],
  teacherName: string | null | undefined,
  studentName: string | null | undefined,
): Record<string, Role> {
  const t = firstName(teacherName ?? '')
  const s = firstName(studentName ?? '')
  const out: Record<string, Role> = {}
  for (const speaker of speakers) {
    const f = firstName(speaker)
    if (f && f === s) out[speaker] = 'student'
    else if (f && f === t) out[speaker] = 'teacher'
    else out[speaker] = 'other'
  }
  return out
}

/**
 * The roles a reading is told: the ones the client names, or — when it names
 * nobody as the teacher or the student — the first guess it would have made.
 *
 * The client names roles from its own parse of the transcript, and a client
 * that could not parse the transcript names nobody. That is exactly what an app
 * older than a transcript layout sends: Fathom's current export dropped the "@"
 * its stamps used to carry, and the app found no turns in it at all. A reading
 * told that everybody is 'other' marks every claim it makes as overruling
 * Fathom's label, so the server makes the guess itself instead. Anything a
 * client sends that is not one of the three roles is 'other', which is inert.
 */
export function rolesFor(
  speakers: string[],
  claimed: Record<string, unknown> | null | undefined,
  names: { teacher?: string | null; student?: string | null },
): Record<string, Role> {
  const out: Record<string, Role> = {}
  for (const speaker of speakers) {
    const c = claimed?.[speaker]
    out[speaker] = c === 'teacher' || c === 'student' || c === 'other' ? c : 'other'
  }
  if (Object.values(out).some((role) => role !== 'other')) return out
  return inferRoles(speakers, names.teacher, names.student)
}
