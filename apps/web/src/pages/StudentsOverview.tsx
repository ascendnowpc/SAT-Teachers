import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { dayLabel } from '../lib/bluebook'
import { localToday } from '../lib/goal'
import { bySatDate, overviewRow, type OverviewRow, type OverviewStudent } from '../lib/overview'
import { supabase } from '../lib/supabase'

/**
 * My students (0104): the PC's view of the students assigned to them, a
 * teacher's of the students they teach, an admin's of everyone — the
 * section-tracker scope's F9 and F10. One row each: the next SAT and its
 * registration deadline, the goal against the latest score, and the domains
 * improving or stuck; the soonest SAT first.
 */
export function StudentsOverview() {
  const { isPc, isAdmin } = useAuth()
  const [list, setList] = useState<OverviewStudent[] | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [q, setQ] = useState('')
  const today = localToday()

  useEffect(() => {
    void supabase.rpc('students_overview').then(({ data, error: err }) => {
      if (err) setError(err.message)
      else setList((data ?? []) as OverviewStudent[])
    })
  }, [])

  const rows = useMemo(() => (list ?? []).map((s) => overviewRow(s, today)).sort(bySatDate), [list, today])
  const shown = rows.filter((r) => {
    const needle = q.trim().toLowerCase()
    return !needle || r.name.toLowerCase().includes(needle) || r.displayId.includes(needle) || (r.pc ?? '').toLowerCase().includes(needle)
  })

  const soon = rows.filter((r) => r.daysToSat !== null && r.daysToSat <= 30).length
  const waiting = rows.filter((r) => r.goal && !r.confirmed).length
  const stuck = rows.filter((r) => r.stuck.length > 0).length

  return (
    <div className="page page-wide">
      <div className="page-head">
        <h1>My students</h1>
      </div>
      <p className="muted">
        {isAdmin ? 'Every student.' : isPc ? 'The students assigned to you.' : 'The students you teach.'} Soonest SAT first.
      </p>

      {error && <Notice kind="error">{error}</Notice>}

      <div className="stats">
        <div className="stat">
          <div className="k">Students</div>
          <div className="v">{rows.length}</div>
        </div>
        <div className="stat">
          <div className="k">SAT within 30 days</div>
          <div className="v">{soon}</div>
        </div>
        <div className="stat">
          <div className="k">Goals to confirm</div>
          <div className="v">{waiting}</div>
        </div>
        <div className="stat">
          <div className="k">With a domain stuck</div>
          <div className="v">{stuck}</div>
        </div>
      </div>

      <div className="overview-tools">
        <input
          className="input"
          type="search"
          placeholder="Search by name, ID or PC"
          value={q}
          onChange={(e) => setQ(e.target.value)}
          aria-label="Search students"
        />
        <span className="muted">
          Showing {shown.length} of {rows.length}
        </span>
      </div>

      {!list && !error ? (
        <div className="page-loading">Loading…</div>
      ) : shown.length === 0 ? (
        <div className="card card-pad">No students{q ? ' match that' : ' yet'}.</div>
      ) : (
        <div className="board overview-board">
          <table className="board-table overview-table">
            <thead>
              <tr>
                <th>Student</th>
                <th>Next SAT</th>
                <th>Goal</th>
                <th>Latest SAT</th>
                <th>Improving</th>
                <th>Stuck</th>
                <th>Last test</th>
              </tr>
            </thead>
            <tbody>
              {shown.map((r) => (
                <Row key={r.id} r={r} />
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}

function Row({ r }: { r: OverviewRow }) {
  return (
    <tr>
      <td>
        <Link className="overview-name" to={`/students/${r.id}/progress`}>
          {r.name}
        </Link>
        <div className="muted overview-sub">
          <span className="num">{r.displayId}</span>
          {r.pc ? ` · PC ${r.pc}` : ''}
        </div>
      </td>
      <td>
        {r.nextSat ? (
          <>
            <b>{dayLabel(r.nextSat)}</b>
            <div className={`overview-sub${r.daysToSat! <= 30 ? ' is-soon' : ''}`}>
              {r.daysToSat === 0 ? 'Today' : `${r.daysToSat} days`}
            </div>
            {r.registration && (
              <div className={`overview-sub${r.registration.urgent ? ' is-urgent' : ''}`}>{r.registration.text}</div>
            )}
          </>
        ) : (
          <span className="muted">Not set</span>
        )}
      </td>
      <td>
        {r.goal && (r.goal.target_rw !== null || r.goal.target_math !== null) ? (
          <>
            <b className="num">{r.goalTotal ?? '—'}</b>
            <div className="overview-sub num">
              R&amp;W {r.goal.target_rw ?? '—'} · Math {r.goal.target_math ?? '—'}
            </div>
            {!r.confirmed && <div className="overview-sub is-urgent">To confirm</div>}
          </>
        ) : (
          <span className="muted">Not set</span>
        )}
      </td>
      <td>
        {r.sat ? (
          <>
            <b className="num">{r.sat.total}</b>
            <div className="overview-sub">
              {r.gap === null ? dayLabel(r.sat.taken_on) : r.gap === 0 ? 'Goal reached' : `${r.gap} to go`}
            </div>
          </>
        ) : (
          <span className="muted">None yet</span>
        )}
      </td>
      <td>
        <DomainList items={r.improving.map((d) => `${d.label} (+${d.change})`)} tone="ok" />
      </td>
      <td>
        <DomainList items={r.stuck.map((d) => `${d.label} (${d.sessions} session${d.sessions === 1 ? '' : 's'})`)} tone="bad" />
      </td>
      <td>{r.lastTestAt ? dayLabel(r.lastTestAt.slice(0, 10)) : <span className="muted">—</span>}</td>
    </tr>
  )
}

function DomainList({ items, tone }: { items: string[]; tone: 'ok' | 'bad' }) {
  if (items.length === 0) return <span className="muted">—</span>
  return (
    <ul className={`overview-domains is-${tone}`}>
      {items.slice(0, 3).map((t) => (
        <li key={t}>{t}</li>
      ))}
      {items.length > 3 && <li className="muted">and {items.length - 3} more</li>}
    </ul>
  )
}
