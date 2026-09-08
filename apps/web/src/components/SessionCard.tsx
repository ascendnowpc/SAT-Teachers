import { Link } from 'react-router-dom'
import { subjectLabel } from '../lib/constants'
import { formatUtc, utcParts } from '../lib/time'
import type { Session } from '../lib/types'
import { StatusBadge } from '../pages/Sessions'

/**
 * One session, as a card.
 *
 * The sessions list is a table now — sixty rows scanned down a column beats
 * sixty cards scrolled past. This is what is left of the card, and it is the
 * right shape in the one place it still lives: the dashboard's "Coming up",
 * which is three sessions and a date each, read at a glance rather than
 * searched.
 */
export function SessionCard({
  session: s,
  isTeacher,
}: {
  session: Session
  isTeacher: boolean
}) {
  // Every session time in the product is written in UTC, so a teacher and a
  // student in different countries mean the same moment by it.
  const when = utcParts(s.scheduled_at)
  const counterpart = isTeacher ? s.student : s.teacher

  return (
    <Link className="sess-card" to={isTeacher ? `/sessions/${s.id}` : `/exam/${s.id}`}>
      <div className="when">
        <div className="d">{when.day}</div>
        <div className="m">{when.month}</div>
      </div>
      <div className="body">
        <h3>{s.title || `${subjectLabel(s.subject)} session`}</h3>
        <div className="meta">
          {formatUtc(s.scheduled_at)} · {s.duration_mins} min
          {counterpart && (
            <>
              {' '}
              · {isTeacher ? 'with' : 'by'} {counterpart.full_name}{' '}
              <span className="num">({counterpart.display_id})</span>
            </>
          )}
        </div>
        <div className="tags">
          <StatusBadge status={s.status} />
          <span className="badge badge-neutral">{subjectLabel(s.subject)}</span>
        </div>
      </div>
    </Link>
  )
}
