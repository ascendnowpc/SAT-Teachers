import { useMemo, useState } from 'react'
import { PeopleTable, Stat } from '../components/AdminUi'
import { Input, Notice } from '../components/ui'
import { useSchool } from '../hooks/useSchool'
import { filterPeople, pendingTeachers, studentRows, teacherRows } from '../lib/admin'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { Profile } from '../lib/types'

/**
 * Users — everybody on the platform, and the queue of people waiting to be one.
 *
 * This was two pages: an overview that counted sessions and a list of people.
 * The counting was the problem — it answered questions about sessions on a
 * screen that is not the sessions list, so the same rows were displayed twice
 * in two shapes and could disagree. Sessions live under Sessions. This page is
 * about people, and the only numbers on it are counts of people.
 *
 * Teachers and students are two tables rather than one, because they are
 * counted against opposite sides of the same session and a single list with a
 * Role column would make every other column mean two things. The search box is
 * over whichever half is showing, and it searches the counterparts too — typing
 * a teacher's name into the student half is a fair way to ask "who does she
 * teach".
 */
export function AdminUsers() {
  const { profiles, sessions, stages, loading, error, reload } = useSchool()
  const [tab, setTab] = useState<'teachers' | 'students'>('teachers')
  const [query, setQuery] = useState('')

  const pending = useMemo(() => pendingTeachers(profiles), [profiles])
  const teachers = useMemo(() => teacherRows(profiles, sessions, stages), [profiles, sessions, stages])
  const students = useMemo(() => studentRows(profiles, sessions, stages), [profiles, sessions, stages])

  const all = tab === 'teachers' ? teachers : students
  const shown = useMemo(() => filterPeople(all, query), [all, query])
  const active = teachers.filter((t) => t.profile.is_active).length

  return (
    <div className="page page-wide">
      <div className="page-head">
        <div>
          <h1>Users</h1>
          <p className="sub">
            Everyone on the platform, with what they have done beside them. A student is a roster row
            their teacher typed in, so this is the whole roster rather than a list of accounts.
          </p>
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <ApprovalQueue pending={pending} onDone={reload} />

      <div className="stats">
        <Stat k="Teachers" v={teachers.length} sub={`${active} approved and active`} />
        <Stat k="Students" v={students.length} sub="on the roster" />
        <Stat
          k="Waiting"
          v={pending.length}
          sub={pending.length === 0 ? 'nobody to approve' : 'teacher accounts to verify'}
        />
      </div>

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
            tab === 'teachers'
              ? 'Search a teacher, id, email or student…'
              : 'Search a student, PC, id or teacher…'
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

/**
 * The teachers waiting to be verified.
 *
 * It sits above the tables and disappears when it is empty, because it is the
 * one thing on this page that is somebody waiting on the admin rather than the
 * admin looking at something. A pending account can see nothing at all — 0044
 * writes it inactive and every policy asks is_active — so the person behind it
 * is sitting on a "waiting for approval" screen until this is done.
 */
function ApprovalQueue({ pending, onDone }: { pending: Profile[]; onDone: () => Promise<void> }) {
  const [busy, setBusy] = useState<string | null>(null)
  const [failed, setFailed] = useState<string | null>(null)

  if (pending.length === 0) return null

  async function decide(id: string, active: boolean) {
    setBusy(id)
    setFailed(null)
    const { error } = await supabase.rpc('set_profile_active', {
      p_profile: id,
      p_active: active,
    })
    if (error) setFailed(error.message)
    else await onDone()
    setBusy(null)
  }

  return (
    <div className="card card-pad approvals">
      <div className="section-title">
        Pending verification ({pending.length})
      </div>
      <p className="sub" style={{ marginBottom: 14, maxWidth: '62ch' }}>
        Anyone can create a teacher account, and a teacher reads every answer key in the bank, every
        student on the roster and the house content everyone's sessions are built from. These
        accounts can see none of it until you say so.
      </p>

      {failed && <Notice kind="error">{failed}</Notice>}

      <ul className="approval-list">
        {pending.map((p) => (
          <li key={p.id}>
            <div>
              <div className="cell-strong">{p.full_name || 'Unnamed'}</div>
              <div className="cell-sub">
                <span className="num">{p.display_id}</span>
                {p.email && <> · {p.email}</>} · signed up {formatUtc(p.created_at)}
              </div>
            </div>
            <div className="spring" />
            <button
              type="button"
              className="btn btn-primary btn-sm"
              disabled={busy === p.id}
              onClick={() => void decide(p.id, true)}
            >
              {busy === p.id ? 'Working…' : 'Approve'}
            </button>
          </li>
        ))}
      </ul>
    </div>
  )
}
