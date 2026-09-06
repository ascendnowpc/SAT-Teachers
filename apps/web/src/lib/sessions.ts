import type { Session } from './types'

/**
 * The sessions list, by student.
 *
 * A teacher's list is one flat run of cards ordered by date, which is the right
 * shape for a diary and the wrong one for the question a teacher actually
 * arrives with — which is never "what happened on Tuesday" but "where is Amara
 * up to". Two students and eight sessions each interleave into sixteen cards
 * whose only grouping is the calendar, and following one student through them
 * means reading every card and discarding half.
 *
 * So they are grouped by the student they are with, and each group is ordered
 * the way a student's own history reads: what is still to come, soonest first,
 * then what has happened, most recent first.
 *
 * A student's own list is not grouped — every session in it is theirs, and
 * grouping it by themselves would be one heading over the whole page.
 */

/** One student and every session this list holds with them. */
export interface StudentGroup {
  /** The student's profile id — stable, and the key the list renders on. */
  key: string
  name: string
  displayId: string | null
  /** Scheduled or live, soonest first. */
  upcoming: Session[]
  /** Completed or cancelled, most recent first. */
  past: Session[]
}

function time(s: Session): number {
  return new Date(s.scheduled_at).getTime()
}

/**
 * Groups with something still to come sort first, by whichever is soonest —
 * that is the student the teacher is about to see. The rest follow by their
 * most recent session, so a student worked with last week outranks one last
 * seen in March.
 */
function compareGroups(a: StudentGroup, b: StudentGroup): number {
  const an = a.upcoming[0]
  const bn = b.upcoming[0]
  if (an && bn) return time(an) - time(bn) || a.name.localeCompare(b.name)
  if (an) return -1
  if (bn) return 1

  const al = a.past[0]
  const bl = b.past[0]
  if (al && bl) return time(bl) - time(al) || a.name.localeCompare(b.name)
  if (al) return -1
  if (bl) return 1
  return a.name.localeCompare(b.name)
}

export function groupByStudent(sessions: Session[]): StudentGroup[] {
  const groups = new Map<string, StudentGroup>()

  for (const s of sessions) {
    // The embedded profile is the good name, but RLS can withhold it; the
    // foreign key is always there, so a group never collapses two students
    // into one for want of a display name.
    const key = s.student?.id ?? s.student_id
    let g = groups.get(key)
    if (!g) {
      g = {
        key,
        name: s.student?.full_name ?? 'Student',
        displayId: s.student?.display_id ?? null,
        upcoming: [],
        past: [],
      }
      groups.set(key, g)
    }
    if (s.status === 'scheduled' || s.status === 'live') g.upcoming.push(s)
    else g.past.push(s)
  }

  for (const g of groups.values()) {
    g.upcoming.sort((a, b) => time(a) - time(b))
    g.past.sort((a, b) => time(b) - time(a))
  }

  return [...groups.values()].sort(compareGroups)
}
