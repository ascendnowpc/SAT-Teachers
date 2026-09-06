import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { subjectLabel } from '../lib/constants'
import { groupByStudent, type StudentGroup } from '../lib/sessions'
import { formatUtc, utcParts } from '../lib/time'
import { rows, supabase } from '../lib/supabase'
import type { Session } from '../lib/types'

const SESSION_SELECT =
  '*, teacher:profiles!sessions_teacher_id_fkey(id,full_name,display_id),' +
  ' student:profiles!sessions_student_id_fkey(id,full_name,display_id)'

export function Sessions() {
  const { isTeacher } = useAuth()
  const [sessions, setSessions] = useState<Session[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    const { data, error: err } = await supabase
      .from('sessions')
      .select(SESSION_SELECT)
      .order('scheduled_at', { ascending: false })
    if (err) setError(err.message)
    else setSessions(rows<Session>(data))
    setLoading(false)
  }, [])

  useEffect(() => {
    void load()
  }, [load])

  const upcoming = sessions.filter((s) => s.status === 'scheduled' || s.status === 'live')
  const past = sessions.filter((s) => s.status === 'completed' || s.status === 'cancelled')
  // A teacher's list is read one student at a time, so it is built that way.
  // A student's own list is already one student's, and has nothing to group by.
  const groups = useMemo(() => (isTeacher ? groupByStudent(sessions) : []), [isTeacher, sessions])

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Sessions</h1>
          <p className="sub">
            {isTeacher
              ? 'Your students, and every session with each of them.'
              : 'Your tutoring sessions. Open one once its time has come.'}
          </p>
        </div>
        <div className="spring" />
        {isTeacher && (
          <Link className="btn btn-primary" to="/sessions/new">
            New session
          </Link>
        )}
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      {loading ? (
        <div className="empty">Loading…</div>
      ) : sessions.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No sessions yet</h3>
            <p>
              {isTeacher
                ? 'Create a session with a student, pick the questions they should sit, and set the time it opens.'
                : 'Once a teacher schedules a session with you, it will show up here.'}
            </p>
            {isTeacher && (
              <Link className="btn btn-primary" to="/sessions/new">
                New session
              </Link>
            )}
          </div>
        </div>
      ) : isTeacher ? (
        groups.map((g) => <StudentSessions key={g.key} group={g} />)
      ) : (
        <>
          {upcoming.length > 0 && (
            <>
              <div className="section-title">Upcoming and live</div>
              <div className="sess-list" style={{ marginBottom: 28 }}>
                {upcoming.map((s) => (
                  <SessionCard key={s.id} session={s} isTeacher={isTeacher} />
                ))}
              </div>
            </>
          )}
          {past.length > 0 && (
            <>
              <div className="section-title">Past</div>
              <div className="sess-list">
                {past.map((s) => (
                  <SessionCard key={s.id} session={s} isTeacher={isTeacher} />
                ))}
              </div>
            </>
          )}
        </>
      )}
    </div>
  )
}

/**
 * One student, and the sessions this teacher has with them.
 *
 * The heading is the student — their name and the ID the teacher types to find
 * them — and underneath it their history in the order it is asked about: the
 * lesson that is next, then the ones already sat. Where both exist a rule
 * separates them, so "what is coming" and "what happened" do not have to be
 * told apart by reading the badges.
 */
function StudentSessions({ group: g }: { group: StudentGroup }) {
  const ahead = g.upcoming.length
  const behind = g.past.length

  return (
    <section className="sess-group">
      <div className="sess-group-head">
        <h2>{g.name}</h2>
        {g.displayId && <span className="num">{g.displayId}</span>}
        <span className="spring" />
        <span className="sess-group-count">
          {ahead > 0 && `${ahead} coming up`}
          {ahead > 0 && behind > 0 && ' · '}
          {behind > 0 && `${behind} sat`}
        </span>
      </div>

      {ahead > 0 && (
        <div className="sess-list">
          {g.upcoming.map((s) => (
            <SessionCard key={s.id} session={s} isTeacher withCounterpart={false} />
          ))}
        </div>
      )}

      {behind > 0 && (
        <>
          {ahead > 0 && <div className="sess-group-rule">Past</div>}
          <div className="sess-list">
            {g.past.map((s) => (
              <SessionCard key={s.id} session={s} isTeacher withCounterpart={false} />
            ))}
          </div>
        </>
      )}
    </section>
  )
}

export function SessionCard({
  session: s,
  isTeacher,
  // Under a heading that already names the student, repeating them on every
  // card is the same name six times down the page.
  withCounterpart = true,
}: {
  session: Session
  isTeacher: boolean
  withCounterpart?: boolean
}) {
  // Every session time in the product is written in UTC, so a teacher and a
  // student in different countries mean the same moment by it.
  const when = utcParts(s.scheduled_at)
  const counterpart = withCounterpart ? (isTeacher ? s.student : s.teacher) : null

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

export function StatusBadge({ status }: { status: Session['status'] }) {
  if (status === 'live')
    return (
      <span className="badge badge-live">
        <span className="dot" aria-hidden="true" /> Live
      </span>
    )
  if (status === 'scheduled') return <span className="badge badge-sky">Scheduled</span>
  if (status === 'completed') return <span className="badge badge-neutral">Completed</span>
  return <span className="badge badge-neutral">Cancelled</span>
}
