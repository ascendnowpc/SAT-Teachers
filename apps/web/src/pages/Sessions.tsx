import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { CopyButton, DifficultyBadge, Input, Notice, Select } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { DIFFICULTIES, SUBJECTS, levelLabel, subjectLabel } from '../lib/constants'
import {
  DEFAULT_SORT,
  NO_FILTERS,
  filterSessions,
  sortSessions,
  studentLink,
  studentOptions,
  type SessionFilters,
  type Sort,
  type SortKey,
} from '../lib/sessions'
import { utcParts, utcTime } from '../lib/time'
import { rows, supabase } from '../lib/supabase'
import type { Session } from '../lib/types'

const SESSION_SELECT =
  '*, teacher:profiles!sessions_teacher_id_fkey(id,full_name,display_id),' +
  ' student:profiles!sessions_student_id_fkey(id,full_name,display_id,pc)'

/**
 * Every session, in one table.
 *
 * This was a run of cards grouped by student, which answered one question well
 * — "where is this student up to" — and every other question badly. A table
 * answers them all the same way: one row per session, one column per thing you
 * might be looking for, and a search box and a filter above it so the answer is
 * found by narrowing rather than by scrolling.
 *
 * The grouping is not lost, it is a filter now: pick a student and the table is
 * their history. Which also means it composes — that student's live sessions,
 * that student on the hard test — where a heading never could.
 */
export function Sessions() {
  const { isTeacher } = useAuth()
  const navigate = useNavigate()

  const [sessions, setSessions] = useState<Session[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const [filters, setFilters] = useState<SessionFilters>(NO_FILTERS)
  const [sort, setSort] = useState<Sort>(DEFAULT_SORT)

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

  const students = useMemo(() => studentOptions(sessions), [sessions])
  const shown = useMemo(
    () => sortSessions(filterSessions(sessions, filters), sort),
    [sessions, filters, sort],
  )

  const narrowed = shown.length !== sessions.length
  function set<K extends keyof SessionFilters>(key: K, value: SessionFilters[K]) {
    setFilters((f) => ({ ...f, [key]: value }))
  }

  // Clicking the same column again turns it around; a new column starts on the
  // order that column is usually read in — soonest-last for dates, A–Z for
  // names, most urgent first for status.
  function toggleSort(key: SortKey) {
    setSort((s) =>
      s.key === key
        ? { key, dir: s.dir === 'asc' ? 'desc' : 'asc' }
        : { key, dir: key === 'when' ? 'desc' : 'asc' },
    )
  }

  return (
    <div className="page page-wide">
      <div className="page-head">
        <div>
          <h1>Sessions</h1>
          <p className="sub">
            {isTeacher
              ? 'Every session you have run or scheduled. Search a student, or narrow by what you are looking for.'
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

      <div className="filters">
        <Input
          className="input filter-search"
          type="search"
          value={filters.query}
          placeholder={
            isTeacher ? 'Search a student, PC, id or title…' : 'Search a teacher or a title…'
          }
          aria-label="Search sessions"
          onChange={(e) => set('query', e.target.value)}
        />

        <Select
          value={filters.status}
          aria-label="Filter by status"
          onChange={(e) => set('status', e.target.value as SessionFilters['status'])}
        >
          <option value="all">Any status</option>
          <option value="open">Upcoming and live</option>
          <option value="scheduled">Scheduled</option>
          <option value="live">Live</option>
          <option value="completed">Completed</option>
          <option value="cancelled">Cancelled</option>
        </Select>

        {isTeacher && students.length > 1 && (
          <Select
            value={filters.student}
            aria-label="Filter by student"
            onChange={(e) => set('student', e.target.value)}
          >
            <option value="all">Any student</option>
            {students.map((s) => (
              <option key={s.id} value={s.id}>
                {s.name} ({s.count})
              </option>
            ))}
          </Select>
        )}

        <Select
          value={filters.level}
          aria-label="Filter by level"
          onChange={(e) => set('level', e.target.value as SessionFilters['level'])}
        >
          <option value="all">Any level</option>
          {DIFFICULTIES.map((d) => (
            <option key={d.value} value={d.value}>
              {d.label}
            </option>
          ))}
        </Select>

        <Select
          value={filters.subject}
          aria-label="Filter by subject"
          onChange={(e) => set('subject', e.target.value as SessionFilters['subject'])}
        >
          <option value="all">Any subject</option>
          {SUBJECTS.map((s) => (
            <option key={s.value} value={s.value}>
              {s.label}
            </option>
          ))}
        </Select>

        <span className="spring" />
        <span className="filter-count">
          {loading ? 'Loading…' : `${shown.length} of ${sessions.length}`}
        </span>
        {narrowed && (
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => setFilters(NO_FILTERS)}>
            Clear
          </button>
        )}
      </div>

      {loading ? (
        <div className="empty">Loading…</div>
      ) : sessions.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No sessions yet</h3>
            <p>
              {isTeacher
                ? 'Create a session with a student and send them the link. That is the whole of it.'
                : 'Once a teacher schedules a session with you, it will show up here.'}
            </p>
            {isTeacher && (
              <Link className="btn btn-primary" to="/sessions/new">
                New session
              </Link>
            )}
          </div>
        </div>
      ) : shown.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nothing matches</h3>
            <p>No session fits what you have narrowed to. Widen it, or clear the filters.</p>
            <button type="button" className="btn btn-ghost" onClick={() => setFilters(NO_FILTERS)}>
              Clear the filters
            </button>
          </div>
        </div>
      ) : (
        <div className="board">
          <div className="board-scroll">
            <table className="board-table sess-table">
              <thead>
                <tr>
                  <SortHead label="When" k="when" sort={sort} onSort={toggleSort} />
                  <SortHead
                    label={isTeacher ? 'Student' : 'Teacher'}
                    k="student"
                    sort={sort}
                    onSort={toggleSort}
                  />
                  <SortHead label="Session" k="title" sort={sort} onSort={toggleSort} />
                  <SortHead label="Level" k="level" sort={sort} onSort={toggleSort} />
                  <SortHead label="Status" k="status" sort={sort} onSort={toggleSort} />
                  <th>Answered</th>
                  <th aria-label="Actions" />
                </tr>
              </thead>
              <tbody>
                {shown.map((s) => (
                  <SessionRow key={s.id} session={s} isTeacher={isTeacher} onOpen={navigate} />
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  )
}

function SortHead({
  label,
  k,
  sort,
  onSort,
}: {
  label: string
  k: SortKey
  sort: Sort
  onSort: (k: SortKey) => void
}) {
  const on = sort.key === k
  return (
    <th aria-sort={on ? (sort.dir === 'asc' ? 'ascending' : 'descending') : 'none'}>
      <button type="button" className={`th-sort ${on ? 'on' : ''}`} onClick={() => onSort(k)}>
        {label}
        <span aria-hidden="true">{on ? (sort.dir === 'asc' ? '↑' : '↓') : ''}</span>
      </button>
    </th>
  )
}

function SessionRow({
  session: s,
  isTeacher,
  onOpen,
}: {
  session: Session
  isTeacher: boolean
  onOpen: (to: string) => void
}) {
  // Every session time in the product is written in UTC, so a teacher and a
  // student in different countries mean the same moment by it.
  const when = utcParts(s.scheduled_at)
  const counterpart = isTeacher ? s.student : s.teacher
  const to = isTeacher ? `/sessions/${s.id}` : `/exam/${s.id}`
  const token = s.access_token ?? null

  return (
    <tr className={s.status === 'live' ? 'live-row row-link' : 'row-link'} onClick={() => onOpen(to)}>
      <td>
        {/* The real link, so the row can be opened in a new tab, focused with
            a keyboard and read by a screen reader as the thing it is. */}
        <Link className="cell-link" to={to} onClick={(e) => e.stopPropagation()}>
          <span className="when-day">
            {when.day} {when.month}
          </span>
          <span className="when-time">{utcTime(s.scheduled_at)} UTC</span>
        </Link>
      </td>
      <td>
        {counterpart ? (
          <>
            <div className="cell-strong">{counterpart.full_name}</div>
            <div className="cell-sub">
              <span className="num">{counterpart.display_id}</span>
              {isTeacher && s.student?.pc && <> · {s.student.pc}</>}
            </div>
          </>
        ) : (
          <span className="dash">—</span>
        )}
      </td>
      <td>
        <div className="cell-strong">{s.title || `${subjectLabel(s.subject)} session`}</div>
        <div className="cell-sub">
          {subjectLabel(s.subject)} · {s.duration_mins} min
        </div>
      </td>
      <td>
        <DifficultyBadge level={s.level} />
        <span className="cell-sub">{levelLabel(s.level)} test</span>
      </td>
      <td>
        <StatusBadge status={s.status} />
      </td>
      {/* What the student answered, not what the session loaded. A session
          loads a whole test at a time and loads another one when the level
          moves, so question_count reads 27 for a lesson of six questions. */}
      <td className="num">
        {s.answered_count > 0 ? s.answered_count : <span className="dash">—</span>}
      </td>
      <td className="row-actions">
        {isTeacher && token && <CopyButton value={studentLink(token)} label="Student link" />}
        <Link className="btn btn-ghost btn-sm" to={to} onClick={(e) => e.stopPropagation()}>
          Open
        </Link>
      </td>
    </tr>
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
