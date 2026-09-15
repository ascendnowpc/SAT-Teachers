import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { PeopleTable } from '../components/AdminUi'
import { IconBack } from '../components/icons'
import { Input, Notice } from '../components/ui'
import { useSchool } from '../hooks/useSchool'
import { filterPeople, studentRows, teacherRows } from '../lib/admin'

/**
 * Everybody, on one page.
 *
 * Two tables rather than one: a teacher and a student are counted against
 * opposite sides of the same sessions, and a single list with a Role column
 * would make every other column mean two things. The search box is over
 * whichever half is showing, and it searches the counterparts too — typing a
 * teacher's name into the student half is a fair way to ask "who does she
 * teach".
 */
export function AdminPeople() {
  const { profiles, sessions, stages, loading, error } = useSchool()
  const [tab, setTab] = useState<'teachers' | 'students'>('teachers')
  const [query, setQuery] = useState('')

  const teachers = useMemo(() => teacherRows(profiles, sessions, stages), [profiles, sessions, stages])
  const students = useMemo(() => studentRows(profiles, sessions, stages), [profiles, sessions, stages])

  const all = tab === 'teachers' ? teachers : students
  const shown = useMemo(() => filterPeople(all, query), [all, query])

  return (
    <div className="page page-wide">
      <Link className="back-link" to="/admin">
        <IconBack /> The school
      </Link>

      <div className="page-head">
        <div>
          <h1>People</h1>
          <p className="sub">
            Everyone on the platform, with what they have done beside them. A student is a roster row
            their teacher typed in, so this is the whole roster, not a list of accounts.
          </p>
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <div className="tabs">
        <button
          type="button"
          className={`tab ${tab === 'teachers' ? 'on' : ''}`}
          onClick={() => setTab('teachers')}
        >
          Teachers ({teachers.length})
        </button>
        <button
          type="button"
          className={`tab ${tab === 'students' ? 'on' : ''}`}
          onClick={() => setTab('students')}
        >
          Students ({students.length})
        </button>
      </div>

      <div className="filters">
        <Input
          className="input filter-search"
          type="search"
          value={query}
          placeholder={
            tab === 'teachers' ? 'Search a teacher, id, email or student…' : 'Search a student, PC, id or teacher…'
          }
          aria-label="Search people"
          onChange={(e) => setQuery(e.target.value)}
        />
        <span className="spring" />
        <span className="filter-count">
          {loading ? 'Loading…' : `${shown.length} of ${all.length}`}
        </span>
        {query && (
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => setQuery('')}>
            Clear
          </button>
        )}
      </div>

      {loading ? (
        <div className="empty">Loading…</div>
      ) : shown.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nobody matches</h3>
            <p>Nothing here fits what you have typed. Widen it, or clear the search.</p>
          </div>
        </div>
      ) : (
        <PeopleTable
          rows={shown}
          kind={tab === 'teachers' ? 'teacher' : 'student'}
          href={tab === 'teachers' ? (p) => `/admin/teachers/${p.id}` : undefined}
        />
      )}
    </div>
  )
}
