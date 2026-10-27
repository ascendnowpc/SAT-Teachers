import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { CopyButton, DifficultyBadge, Input, Notice, Select } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { DIFFICULTIES, SUBJECTS, subjectLabel } from '../lib/constants'
import {
  DEFAULT_SORT,
  KIND_LABELS,
  NEW_SESSION,
  NO_FILTERS,
  filterSessions,
  kindOf,
  levelsLabel,
  levelsOf,
  sessionTitle,
  sortSessions,
  studentLink,
  studentOptions,
  targetedLabel,
  targetedOf,
  teacherOptions,
  type SessionFilters,
  type SessionKind,
  type Sort,
  type SortKey,
} from '../lib/sessions'
import { utcParts, utcTime } from '../lib/time'
import { rows, supabase } from '../lib/supabase'
import type { Session } from '../lib/types'

// The targeted test's skill and size come along (0061): staff and the PC read
// them, and for anybody else the embed is simply empty.
const SESSION_SELECT =
  '*, teacher:profiles!sessions_teacher_id_fkey(id,full_name,display_id),' +
  ' student:profiles!sessions_student_id_fkey(id,full_name,display_id,pc),' +
  ' targeted:targeted_tests(section,skill,set_size)'

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
 *
 * Staff read it as two tabs, Diagnostics and Targeted tests, because they are
 * two different things to book and to read: a diagnostic is run live and
 * written up with the form, a targeted test is sat alone on the clock and has
 * its own report. Each tab has its own columns and its own New button. A
 * student sees their sessions in one list — to them both are just a link.
 */
export function Sessions() {
  const { isTeacher, isAdmin, isPc } = useAuth()
  // A PC reads the list from the staff side: their students, and the teachers
  // who taught them (0055). They open a session to read it; they book nothing.
  const staff = isTeacher || isPc
  const navigate = useNavigate()
  const [params, setParams] = useSearchParams()
  const tab: SessionKind = params.get('tab') === 'targeted' ? 'targeted' : 'diagnostic'
  const setTab = (next: SessionKind) =>
    setParams(next === 'targeted' ? { tab: 'targeted' } : {}, { replace: true })

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

  // Staff see one kind at a time; a student sees everything they have.
  const counts = useMemo(() => {
    const n: Record<SessionKind, number> = { diagnostic: 0, targeted: 0 }
    for (const s of sessions) n[kindOf(s)] += 1
    return n
  }, [sessions])
  const inTab = useMemo(
    () => (staff ? sessions.filter((s) => kindOf(s) === tab) : sessions),
    [sessions, staff, tab],
  )
  const targeted = staff && tab === 'targeted'

  const students = useMemo(() => studentOptions(inTab), [inTab])
  // An admin's list spans the whole school, so it needs the other axis too, and
  // a PC's spans every teacher their students have had. A teacher's is all
  // their own sessions and the filter would hold one name.
  const teachers = useMemo(
    () => (isAdmin || isPc ? teacherOptions(inTab) : []),
    [inTab, isAdmin, isPc],
  )
  // A targeted test has no level — it is one skill across all three — so the
  // level filter is the diagnostics' alone, as is sorting on it.
  const shown = useMemo(
    () =>
      sortSessions(
        filterSessions(inTab, targeted ? { ...filters, level: 'all' } : filters),
        targeted && sort.key === 'level' ? DEFAULT_SORT : sort,
      ),
    [inTab, filters, sort, targeted],
  )

  const narrowed = shown.length !== inTab.length
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
            {!staff
              ? 'Your tutoring sessions. Open one once its time has come.'
              : tab === 'targeted'
                ? isPc
                  ? 'Short timed tests on one skill, which your students sat alone. Each has its own report.'
                  : 'Short timed tests on one skill. The student sits them alone on their link; each has its own report and adds a point to their progress on that skill.'
                : isPc
                  ? 'Sessions your students had live with their teacher, each written up in a report.'
                  : 'Sessions you run live with the student: you put each question up and write it up after. A student’s first in a subject is their baseline.'}
          </p>
        </div>
        <div className="spring" />
        {isTeacher && (
          <Link className="btn btn-primary" to={NEW_SESSION[tab]}>
            {tab === 'targeted' ? 'New targeted test' : 'New diagnostic'}
          </Link>
        )}
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      {staff && (
        <div className="tabs">
          {(['diagnostic', 'targeted'] as SessionKind[]).map((k) => (
            <button
              key={k}
              type="button"
              className={`tab ${tab === k ? 'on' : ''}`}
              onClick={() => setTab(k)}
            >
              {k === 'targeted' ? 'Targeted tests' : 'Diagnostics'}
              {!loading && <> ({counts[k]})</>}
            </button>
          ))}
        </div>
      )}

      <div className="filters">
        <Input
          className="input filter-search"
          type="search"
          value={filters.query}
          placeholder={
            targeted
              ? 'Search a student, skill, teacher, PC or id…'
              : staff
                ? 'Search a student, teacher, PC, id or title…'
                : 'Search a teacher or a title…'
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

        {(isAdmin || isPc) && teachers.length > 1 && (
          <Select
            value={filters.teacher}
            aria-label="Filter by teacher"
            onChange={(e) => set('teacher', e.target.value)}
          >
            <option value="all">Any teacher</option>
            {teachers.map((t) => (
              <option key={t.id} value={t.id}>
                {t.name} ({t.count})
              </option>
            ))}
          </Select>
        )}

        {staff && students.length > 1 && (
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

        {/* The level is the teacher's judgement about the student, and a
            student reading "hard test" beside their own session learns the one
            thing their exam screen no longer tells them. */}
        {staff && !targeted && (
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
        )}

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
          {loading ? 'Loading…' : `${shown.length} of ${inTab.length}`}
        </span>
        {narrowed && (
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => setFilters(NO_FILTERS)}>
            Clear
          </button>
        )}
      </div>

      {loading ? (
        <div className="empty">Loading…</div>
      ) : inTab.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>
              {!staff
                ? 'No sessions yet'
                : targeted
                  ? 'No targeted tests yet'
                  : 'No diagnostics yet'}
            </h3>
            <p>
              {!staff
                ? 'Once a teacher schedules a session with you, it will show up here.'
                : isPc
                  ? targeted
                    ? 'None of your students has been set a targeted test yet.'
                    : 'None of your students has a session yet. A student becomes yours when a teacher books them with you as their PC.'
                  : targeted
                    ? 'Once a student has had their diagnostic, set them a short timed test on a skill they found hard. They sit it alone on their link.'
                    : 'Book a student’s diagnostic and send them the link. Their first one in a subject is the baseline every skill is measured from.'}
            </p>
            {isTeacher && (
              <Link className="btn btn-primary" to={NEW_SESSION[tab]}>
                {targeted ? 'New targeted test' : 'New diagnostic'}
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
                    label={staff ? 'Student' : 'Teacher'}
                    k="student"
                    sort={sort}
                    onSort={toggleSort}
                  />
                  {targeted ? (
                    <SortHead label="Skill" k="skill" sort={sort} onSort={toggleSort} />
                  ) : (
                    <SortHead label="Session" k="title" sort={sort} onSort={toggleSort} />
                  )}
                  {staff && !targeted && (
                    <SortHead label="Level" k="level" sort={sort} onSort={toggleSort} />
                  )}
                  <SortHead label="Status" k="status" sort={sort} onSort={toggleSort} />
                  <th>Answered</th>
                  {isTeacher && <th aria-label="Actions" />}
                </tr>
              </thead>
              <tbody>
                {shown.map((s) => (
                  <SessionRow
                    key={s.id}
                    session={s}
                    staff={staff}
                    targeted={targeted}
                    canLink={isTeacher}
                    onOpen={navigate}
                  />
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
  staff,
  targeted,
  canLink,
  onOpen,
}: {
  session: Session
  /** Read from the staff side: the student is the counterpart, and the row opens the session. */
  staff: boolean
  /** The targeted tests' tab: the skill instead of the title, no level, answered out of the set. */
  targeted: boolean
  /** Offer the student's link. A teacher's; a PC books and sends nothing. */
  canLink: boolean
  onOpen: (to: string) => void
}) {
  // Every session time in the product is written in UTC, so a teacher and a
  // student in different countries mean the same moment by it.
  const when = utcParts(s.scheduled_at)
  const counterpart = staff ? s.student : s.teacher
  const to = staff ? `/sessions/${s.id}` : `/exam/${s.id}`
  const token = s.access_token ?? null
  const test = targeted ? targetedOf(s) : null

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
              {staff && s.student?.pc && <> · {s.student.pc}</>}
            </div>
          </>
        ) : (
          <span className="dash">—</span>
        )}
      </td>
      {targeted ? (
        <td>
          <div className="cell-strong">{targetedLabel(test) ?? sessionTitle(s)}</div>
          <div className="cell-sub">
            {subjectLabel(s.subject)}
            {test && <> · {test.set_size} questions</>}
            {s.title && <> · {s.title}</>}
          </div>
        </td>
      ) : (
        <td>
          <div className="cell-strong">{sessionTitle(s)}</div>
          <div className="cell-sub">
            {/* A student's one list holds both kinds, so it says which. */}
            {!staff && <>{KIND_LABELS[kindOf(s)]} · </>}
            {subjectLabel(s.subject)} · {s.duration_mins} min
          </div>
        </td>
      )}
      {staff && !targeted && (
        <td>
          <LevelsSat session={s} />
        </td>
      )}
      <td>
        <StatusBadge status={s.status} />
      </td>
      {/* What the student answered, not what the session loaded. A session
          loads a whole test at a time and loads another one when the level
          moves, so question_count reads 27 for a lesson of six questions. */}
      <td className="num">
        {s.answered_count > 0 ? (
          <>
            {s.answered_count}
            {test && <span className="muted-cell"> of {test.set_size}</span>}
          </>
        ) : (
          <span className="dash">—</span>
        )}
      </td>
      {canLink && (
        <td className="row-actions">
          {token && <CopyButton value={studentLink(token)} label="Student link" />}
        </td>
      )}
    </tr>
  )
}

/**
 * Every test the session covered, in the order the student reached them, and
 * the path under them in words — "Medium, then easy". One badge used to name
 * the test the session happened to end on, which for a lesson that moved is
 * the least of what happened in it.
 */
export function LevelsSat({ session }: { session: Session }) {
  const levels = levelsOf(session)
  return (
    <>
      <span className="levels-sat">
        {levels.map((l) => (
          <DifficultyBadge key={l} level={l} />
        ))}
      </span>
      <span className="cell-sub">{levelsLabel(levels)}</span>
    </>
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
