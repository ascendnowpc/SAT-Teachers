import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { PeopleTable, SessionTable, Stat } from '../components/AdminUi'
import { Notice } from '../components/ui'
import { useSchool } from '../hooks/useSchool'
import {
  backlog,
  pendingTeachers,
  rate,
  schoolTally,
  studentRows,
  teacherRows,
} from '../lib/admin'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { Profile } from '../lib/types'

/**
 * The admin's first screen.
 *
 * It answers, in the order an admin asks them: is anybody waiting to be let in,
 * what is the school doing, whose write-ups are late, and who is running the
 * lessons. Nothing here is stored — every figure is tallied from the rows on
 * read, which is the same rule the session report is built on, for the same
 * reason: a number nobody can open is a number nobody can check.
 */
export function AdminOverview() {
  const { profiles, sessions, stages, loading, error, reload } = useSchool()

  const pending = useMemo(() => pendingTeachers(profiles), [profiles])
  const tally = useMemo(() => schoolTally(sessions, stages), [sessions, stages])
  const teachers = useMemo(() => teacherRows(profiles, sessions, stages), [profiles, sessions, stages])
  const students = useMemo(() => studentRows(profiles, sessions, stages), [profiles, sessions, stages])
  const late = useMemo(() => backlog(sessions, stages), [sessions, stages])

  const active = teachers.filter((t) => t.tally.total > 0).length
  const publishedRate = rate(tally.published, tally.completed)

  return (
    <div className="page page-wide">
      <div className="page-head">
        <div>
          <h1>The school</h1>
          <p className="sub">
            Every teacher, every session and every write-up, read-only. An admin oversees the work;
            the teacher whose name is on a session is still the only person who can change it.
          </p>
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <ApprovalQueue pending={pending} onDone={reload} />

      <div className="stats">
        <Stat k="Teachers" v={teachers.length} sub={`${active} have run a session`} />
        <Stat k="Students" v={students.length} sub={`${tally.answered} answers on record`} />
        <Stat k="Sessions" v={tally.total} sub={`${tally.live + tally.scheduled} still open`} />
        <Stat
          k="Reports out"
          v={tally.published}
          sub={publishedRate === null ? 'nothing finished yet' : `${publishedRate}% of finished sessions`}
        />
      </div>

      <div className="section-title">Write-ups outstanding</div>
      {loading ? (
        <div className="empty">Loading…</div>
      ) : late.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nothing outstanding</h3>
            <p>Every session that has finished has a published report behind it.</p>
          </div>
        </div>
      ) : (
        <>
          <p className="sub" style={{ marginBottom: 12 }}>
            {late.length} finished {late.length === 1 ? 'session has' : 'sessions have'} no published
            report. Oldest first — the top of this list is the one the parent has been waiting on
            longest.
          </p>
          <SessionTable sessions={late.slice(0, 12)} stages={stages} />
          {late.length > 12 && (
            <p className="sub" style={{ marginTop: 10 }}>
              And {late.length - 12} more, on each teacher's own page.
            </p>
          )}
        </>
      )}

      <div className="section-title" style={{ marginTop: 26 }}>
        Teachers
      </div>
      {loading ? (
        <div className="empty">Loading…</div>
      ) : (
        <>
          <PeopleTable rows={teachers} kind="teacher" href={(p) => `/admin/teachers/${p.id}`} />
          <p className="sub" style={{ marginTop: 10 }}>
            <Link to="/admin/people">Everybody, teachers and students →</Link>
          </p>
        </>
      )}
    </div>
  )
}

/**
 * The teachers waiting to be let in.
 *
 * It sits above everything else and disappears when it is empty, because it is
 * the only thing on this page that is somebody waiting on the admin rather than
 * the admin looking at something. A pending account can see nothing at all —
 * 0044 writes it inactive and every policy asks is_active — so the person
 * behind it is sitting on a "waiting for approval" screen until this is done.
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
      <div className="section-title">Waiting for approval</div>
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
