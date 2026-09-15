import { useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { SessionTable, Stat } from '../components/AdminUi'
import { IconBack } from '../components/icons'
import { Notice } from '../components/ui'
import { useSchool } from '../hooks/useSchool'
import { backlog, rate, teacherRows } from '../lib/admin'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'

/**
 * One teacher, and everything with their name on it.
 *
 * The sessions are the page — a teacher is what they have run — so the tables
 * are the same ones the overview uses and the only thing above them is the
 * arithmetic over exactly these rows. The suspend control is here rather than
 * on the list because switching somebody off is not a thing to do from a table
 * of twenty people by hitting the wrong row.
 */
export function AdminTeacher() {
  const { id = '' } = useParams()
  const { profiles, sessions, stages, loading, error, reload } = useSchool()

  const row = useMemo(
    () => teacherRows(profiles, sessions, stages).find((r) => r.profile.id === id) ?? null,
    [profiles, sessions, stages, id],
  )
  const theirs = useMemo(() => sessions.filter((s) => s.teacher_id === id), [sessions, id])
  const late = useMemo(() => backlog(theirs, stages), [theirs, stages])

  if (loading) return <div className="page">Loading…</div>

  if (!row) {
    return (
      <div className="page">
        <Link className="back-link" to="/admin/people">
          <IconBack /> People
        </Link>
        <div className="card">
          <div className="empty">
            <h3>No such teacher</h3>
            <p>That account is not one this platform holds, or it is not a teacher's.</p>
          </div>
        </div>
      </div>
    )
  }

  const { profile, tally, counterparts, nextAt } = row
  const published = rate(tally.published, tally.completed)

  return (
    <div className="page page-wide">
      <Link className="back-link" to="/admin/people">
        <IconBack /> People
      </Link>

      <div className="page-head">
        <div>
          <h1>{profile.full_name || 'Unnamed'}</h1>
          <p className="sub">
            <span className="badge badge-role">{profile.role}</span>
            {!profile.is_active && <span className="badge badge-bad">Suspended</span>}
            <span style={{ marginLeft: 8 }} className="num">
              {profile.display_id}
            </span>
            {profile.email && <> · {profile.email}</>} · joined {formatUtc(profile.created_at)}
          </p>
        </div>
        <div className="spring" />
        <Suspend profile={profile} onDone={reload} />
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <div className="stats">
        <Stat k="Sessions" v={tally.total} sub={`${tally.completed} finished`} />
        <Stat k="Students" v={counterparts.length} sub={`${tally.answered} answers` } />
        <Stat
          k="Reports out"
          v={tally.published}
          sub={published === null ? 'nothing finished yet' : `${published}% of finished sessions`}
        />
        <Stat
          k="Outstanding"
          v={tally.outstanding}
          sub={nextAt ? `next session ${formatUtc(nextAt)}` : 'nothing booked'}
        />
      </div>

      {late.length > 0 && (
        <>
          <div className="section-title">Write-ups outstanding</div>
          <SessionTable sessions={late} stages={stages} showTeacher={false} />
        </>
      )}

      <div className="section-title" style={{ marginTop: 26 }}>
        Every session
      </div>
      {theirs.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nothing yet</h3>
            <p>This account has never run or scheduled a session.</p>
          </div>
        </div>
      ) : (
        <SessionTable sessions={theirs} stages={stages} showTeacher={false} />
      )}
    </div>
  )
}

/**
 * Switching an account off, and back on.
 *
 * It is the one write the portal has, and it is the same RPC the approval queue
 * calls: is_teacher() asks is_active, so an inactive teacher loses every policy
 * in the schema at once. Their sessions and their reports are untouched — this
 * is a door, not an eraser.
 */
function Suspend({
  profile,
  onDone,
}: {
  profile: { id: string; is_active: boolean; full_name: string }
  onDone: () => Promise<void>
}) {
  const [busy, setBusy] = useState(false)
  const [failed, setFailed] = useState<string | null>(null)
  const [confirming, setConfirming] = useState(false)

  async function set(active: boolean) {
    setBusy(true)
    setFailed(null)
    const { error } = await supabase.rpc('set_profile_active', {
      p_profile: profile.id,
      p_active: active,
    })
    if (error) setFailed(error.message)
    else await onDone()
    setBusy(false)
    setConfirming(false)
  }

  if (!profile.is_active) {
    return (
      <div className="suspend">
        {failed && <Notice kind="error">{failed}</Notice>}
        <button
          type="button"
          className="btn btn-primary btn-sm"
          disabled={busy}
          onClick={() => void set(true)}
        >
          {busy ? 'Working…' : 'Let them in'}
        </button>
      </div>
    )
  }

  return (
    <div className="suspend">
      {failed && <Notice kind="error">{failed}</Notice>}
      {confirming ? (
        <>
          <span className="cell-sub">Sign {profile.full_name || 'them'} out of everything?</span>
          <button
            type="button"
            className="btn btn-danger btn-sm"
            disabled={busy}
            onClick={() => void set(false)}
          >
            {busy ? 'Working…' : 'Yes, suspend'}
          </button>
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => setConfirming(false)}>
            Cancel
          </button>
        </>
      ) : (
        <button type="button" className="btn btn-ghost btn-sm" onClick={() => setConfirming(true)}>
          Suspend
        </button>
      )}
    </div>
  )
}
