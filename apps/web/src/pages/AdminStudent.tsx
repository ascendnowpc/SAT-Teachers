import { useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { SessionTable, StageBadge, Stat } from '../components/AdminUi'
import { BluebookScores } from '../components/BluebookScores'
import { IconBack } from '../components/icons'
import { StudentPcSelect } from '../components/PcActions'
import { SuspendAccount } from '../components/SuspendAccount'
import { Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { useSchool } from '../hooks/useSchool'
import { backlog, isSuspended, rate, readyReports, studentRows, type Stages } from '../lib/admin'
import { signedInBluebook } from '../lib/bluebookApi'
import { skillList, skillsOn, subjectLabel } from '../lib/constants'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { Session, TargetedTest } from '../lib/types'

/**
 * One student, everything on the platform about them, for an admin: who they
 * are and how they sign in, their PC and their teachers, their SAT scores,
 * every report written for them, and every session they have sat or have
 * booked. The Users list opens it from the student's row.
 *
 * Their skill-by-skill progress has a page of its own — the one staff and the
 * PC already read — and this links to it rather than drawing it twice.
 */
export function AdminStudent() {
  const { id = '' } = useParams()
  const { profile: me } = useAuth()
  const { profiles, sessions, stages, loading, error, reload } = useSchool()

  const row = useMemo(
    () => studentRows(profiles, sessions, stages).find((r) => r.profile.id === id) ?? null,
    [profiles, sessions, stages, id],
  )
  const theirs = useMemo(() => sessions.filter((s) => s.student_id === id), [sessions, id])
  const late = useMemo(() => backlog(theirs, stages), [theirs, stages])
  const reports = useMemo(() => readyReports(theirs, stages), [theirs, stages])
  const pcs = useMemo(() => profiles.filter((p) => p.role === 'pc'), [profiles])
  const pc = useMemo(() => pcs.find((p) => p.id === row?.profile.pc_id) ?? null, [pcs, row])

  // A targeted test's name is what it is on.
  const [tests, setTests] = useState<Map<string, TargetedTest>>(new Map())
  useEffect(() => {
    const ids = theirs.filter((s) => s.mode === 'targeted').map((s) => s.id)
    if (ids.length === 0) return
    let live = true
    void supabase
      .from('targeted_tests')
      .select('*')
      .in('session_id', ids)
      .then(({ data }) => {
        if (live) setTests(new Map(((data ?? []) as TargetedTest[]).map((t) => [t.session_id, t])))
      })
    return () => {
      live = false
    }
  }, [theirs])

  // The PIN they sign in with (0067), and a new one when it is needed.
  const [pin, setPin] = useState<string | null>(null)
  const [pinBusy, setPinBusy] = useState(false)
  const [pinError, setPinError] = useState<string | null>(null)
  useEffect(() => {
    if (!id) return
    let live = true
    void supabase
      .from('student_pins')
      .select('pin')
      .eq('student_id', id)
      .maybeSingle()
      .then(({ data }) => {
        if (live) setPin((data as { pin: string } | null)?.pin ?? null)
      })
    return () => {
      live = false
    }
  }, [id])

  async function newPin() {
    if (!window.confirm('Give this student a new PIN? The old one stops working and they are signed out.')) return
    setPinBusy(true)
    setPinError(null)
    const { data, error: err } = await supabase.rpc('reset_student_pin', { p_student: id })
    if (err) setPinError(err.message)
    else setPin(data as string)
    setPinBusy(false)
  }

  const bluebook = useMemo(
    () => signedInBluebook({ studentId: id, me: me?.id ?? null, isAdmin: true, audience: 'staff' }),
    [id, me?.id],
  )

  if (loading) return <div className="page page-loading">Loading…</div>

  if (!row) {
    return (
      <div className="page">
        <Link className="back-link" to="/admin/users?tab=students">
          <IconBack /> Users
        </Link>
        <div className="card">
          <div className="empty">
            <h3>No such student</h3>
            <p>This student doesn’t exist.</p>
          </div>
        </div>
      </div>
    )
  }

  const { profile, tally, counterparts, lastAt, nextAt } = row
  const published = rate(tally.published, tally.completed)
  const subjects = [...new Set(theirs.map((s) => s.subject))]

  return (
    <div className="page page-wide">
      <Link className="back-link" to="/admin/users?tab=students">
        <IconBack /> Users
      </Link>

      <div className="page-head">
        <div>
          <h1>{profile.full_name || 'Unnamed'}</h1>
          <p className="sub head-meta">
            <span className="badge badge-role">Student</span>
            {isSuspended(profile) && <span className="badge badge-bad">Suspended</span>}
            <span>
              <span className="num">{profile.display_id}</span> · on the roster since {formatUtc(profile.created_at)}
            </span>
          </p>
        </div>
        <div className="spring" />
        <Link className="btn btn-ghost btn-sm" to={`/students/${profile.id}/progress`}>
          Skill progress
        </Link>
        <SuspendAccount profile={profile} onDone={reload} />
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <div className="stats">
        <Stat k="Sessions" v={tally.total} sub={`${tally.completed} done · ${tally.scheduled + tally.live} open`} />
        <Stat k="Answered" v={tally.answered} sub={lastAt ? `last session ${formatUtc(lastAt)}` : 'nothing sat yet'} />
        <Stat
          k="Reports"
          v={reports.length}
          sub={published === null ? 'nothing finished yet' : `${published}% of finished sessions published`}
        />
        <Stat k="Outstanding" v={tally.outstanding} sub={nextAt ? `next session ${formatUtc(nextAt)}` : 'nothing booked'} />
      </div>

      <div className="person-cols">
        <section className="card card-pad">
          <div className="section-title">Signing in</div>
          <dl className="person-facts">
            <dt>Student ID</dt>
            <dd className="num">{profile.display_id}</dd>
            <dt>PIN</dt>
            <dd>
              {pin ? <span className="num">{pin}</span> : <span className="dash">—</span>}{' '}
              <button type="button" className="link-btn" disabled={pinBusy} onClick={() => void newPin()}>
                {pinBusy ? 'Changing…' : 'New PIN'}
              </button>
              {pinError && <div className="cell-sub overdue">{pinError}</div>}
            </dd>
            <dt>Status</dt>
            <dd>{isSuspended(profile) ? `Suspended ${profile.suspended_at ? formatUtc(profile.suspended_at) : ''}` : 'Active'}</dd>
          </dl>
        </section>

        <section className="card card-pad">
          <div className="section-title">Who they work with</div>
          <dl className="person-facts">
            <dt>PC</dt>
            <dd>
              {pc ? (
                <Link to={`/admin/pcs/${pc.id}`}>{pc.full_name}</Link>
              ) : (
                <span className="muted">None yet</span>
              )}
              <div className="person-pc">
                <StudentPcSelect student={profile} pcs={pcs} onChanged={reload} />
              </div>
            </dd>
            <dt>Teachers</dt>
            <dd>
              {counterparts.length === 0 ? (
                <span className="muted">Nobody has taught them yet.</span>
              ) : (
                <ul className="person-links">
                  {counterparts.map((t) => (
                    <li key={t.id}>
                      <Link to={`/admin/teachers/${t.id}`}>{t.name}</Link>
                      <span className="cell-sub">
                        {' '}
                        · {theirs.filter((s) => s.teacher_id === t.id).length} sessions
                      </span>
                    </li>
                  ))}
                </ul>
              )}
            </dd>
            <dt>Subjects</dt>
            <dd>{subjects.length === 0 ? <span className="muted">None yet</span> : subjects.map(subjectLabel).join(', ')}</dd>
          </dl>
        </section>
      </div>

      <BluebookScores api={bluebook} studentName={profile.full_name} />

      <div className="section-head">
        <h2 className="section-title">Reports</h2>
      </div>
      {reports.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No reports yet</h3>
            <p>Reports appear after each session.</p>
          </div>
        </div>
      ) : (
        <ReportList sessions={reports} stages={stages} tests={tests} />
      )}

      {late.length > 0 && (
        <>
          <div className="section-head">
            <h2 className="section-title">Write-ups outstanding</h2>
          </div>
          <SessionTable sessions={late} stages={stages} showStudent={false} />
        </>
      )}

      <div className="section-head">
        <h2 className="section-title">Every session</h2>
      </div>
      {theirs.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nothing booked</h3>
            <p>No sessions yet.</p>
          </div>
        </div>
      ) : (
        <SessionTable sessions={theirs} stages={stages} showStudent={false} />
      )}
    </div>
  )
}

/** The reports, each opening as staff read it. */
function ReportList({
  sessions,
  stages,
  tests,
}: {
  sessions: Session[]
  stages: Stages
  tests: Map<string, TargetedTest>
}) {
  return (
    <div className="board">
      <div className="board-scroll">
        <table className="board-table">
          <thead>
            <tr>
              <th scope="col">When</th>
              <th scope="col">Report</th>
              <th scope="col">Teacher</th>
              <th scope="col">Stage</th>
              <th aria-label="Open" />
            </tr>
          </thead>
          <tbody>
            {sessions.map((s) => {
              const targeted = s.mode === 'targeted'
              const t = tests.get(s.id)
              const skills = t ? skillsOn(t) : null
              const name =
                s.title ||
                (targeted
                  ? (skills ? skillList(skills, 3) : null) ?? `${subjectLabel(s.subject)} targeted test`
                  : `${subjectLabel(s.subject)} ${s.mode === 'diagnostic' ? 'diagnostic' : 'lesson'}`)
              return (
                <tr key={s.id}>
                  <td className="nowrap">{formatUtc(s.started_at ?? s.scheduled_at)}</td>
                  <td>
                    <div className="cell-strong">{name}</div>
                    <div className="cell-sub">
                      {targeted ? 'Targeted test' : s.mode === 'diagnostic' ? 'Diagnostic report' : 'Lesson report'} ·{' '}
                      {subjectLabel(s.subject)}
                    </div>
                  </td>
                  <td>{s.teacher?.full_name ?? '—'}</td>
                  <td>
                    {targeted ? (
                      <span className="badge badge-sky">Computed</span>
                    ) : (
                      <StageBadge stage={stages.get(s.id) ?? 'none'} />
                    )}
                  </td>
                  <td className="row-actions">
                    <Link className="btn btn-primary btn-sm" to={`/sessions/${s.id}/report`}>
                      Open report
                    </Link>
                  </td>
                </tr>
              )
            })}
          </tbody>
        </table>
      </div>
    </div>
  )
}
