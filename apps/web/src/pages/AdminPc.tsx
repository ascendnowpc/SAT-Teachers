import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { PeopleTable, SessionTable, Stat } from '../components/AdminUi'
import { IconBack } from '../components/icons'
import { InviteResult, usePcActions } from '../components/PcActions'
import { Notice } from '../components/ui'
import { useSchool } from '../hooks/useSchool'
import { backlog, isSuspended, pcRows, studentRows } from '../lib/admin'
import { subjectLabel } from '../lib/constants'
import { loadPcInvites } from '../lib/pcApi'
import { inviteState } from '../lib/pcs'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { PcInvite, ReportEmail } from '../lib/types'

const EMAIL_STATUS: Record<ReportEmail['status'], { cls: string; text: string }> = {
  sent: { cls: 'badge-ok', text: 'Sent' },
  sending: { cls: 'badge-sky', text: 'Sending' },
  failed: { cls: 'badge-bad', text: 'Failed' },
  skipped: { cls: 'badge-neutral', text: 'Not sent' },
}

/**
 * One PC, for an admin (0055): whether they have joined, the two things an
 * admin does to their account, every student they are PC to, those students'
 * sessions, and every report emailed to them. The Users list opens it from
 * the PC's row.
 */
export function AdminPc() {
  const { id = '' } = useParams()
  const { profiles, sessions, stages, loading, error, reload } = useSchool()

  const [invites, setInvites] = useState<Map<string, PcInvite>>(new Map())
  const loadInvites = useCallback(async () => setInvites(await loadPcInvites()), [])
  useEffect(() => {
    void loadInvites()
  }, [loadInvites])
  const reloadAll = useCallback(async () => {
    await Promise.all([reload(), loadInvites()])
  }, [reload, loadInvites])
  const actions = usePcActions(invites, reloadAll)

  const row = useMemo(
    () => pcRows(profiles, sessions, stages).find((r) => r.profile.id === id) ?? null,
    [profiles, sessions, stages, id],
  )
  const students = useMemo(
    () => studentRows(profiles, sessions, stages).filter((r) => r.profile.pc_id === id),
    [profiles, sessions, stages, id],
  )
  const theirs = useMemo(() => {
    const mine = new Set(students.map((r) => r.profile.id))
    return sessions.filter((s) => mine.has(s.student_id))
  }, [sessions, students])
  const late = useMemo(() => backlog(theirs, stages), [theirs, stages])

  // Every report emailed to this PC, newest first (0055's report_emails).
  const [emails, setEmails] = useState<ReportEmail[] | null>(null)
  useEffect(() => {
    if (!id) return
    let live = true
    void supabase
      .from('report_emails')
      .select('*')
      .eq('pc_id', id)
      .order('updated_at', { ascending: false })
      .then(({ data }) => {
        if (live) setEmails((data ?? []) as ReportEmail[])
      })
    return () => {
      live = false
    }
  }, [id])
  const sessionById = useMemo(() => new Map(sessions.map((s) => [s.id, s])), [sessions])

  if (loading) return <div className="page page-loading">Loading…</div>

  if (!row) {
    return (
      <div className="page">
        <Link className="back-link" to="/admin/users?tab=pcs">
          <IconBack /> Users
        </Link>
        <div className="card">
          <div className="empty">
            <h3>No such PC</h3>
            <p>That account is not one this platform holds, or it is not a PC’s.</p>
          </div>
        </div>
      </div>
    )
  }

  const { profile, tally, lastAt } = row
  const joining = inviteState(invites.get(profile.id) ?? null)
  const sent = (emails ?? []).filter((e) => e.status === 'sent').length

  return (
    <div className="page page-wide">
      <Link className="back-link" to="/admin/users?tab=pcs">
        <IconBack /> Users
      </Link>

      <div className="page-head">
        <div>
          <h1>{profile.full_name || 'Unnamed'}</h1>
          <p className="sub head-meta">
            <span className="badge badge-role">PC</span>
            {isSuspended(profile) ? (
              <span className="badge badge-bad">Suspended</span>
            ) : (
              joining.badge && <span className={`badge badge-${joining.badge.tone}`}>{joining.badge.label}</span>
            )}
            <span>
              <span className="num">{profile.display_id}</span>
              {profile.email && <> · {profile.email}</>} · added {formatUtc(profile.created_at)}
            </span>
          </p>
        </div>
        <div className="spring" />
        {!isSuspended(profile) && (
          <button
            type="button"
            className="btn btn-ghost btn-sm"
            disabled={actions.busy === profile.id}
            onClick={() => void actions.invite(profile)}
          >
            {joining.action}
          </button>
        )}
        <button
          type="button"
          className={`btn btn-sm ${isSuspended(profile) ? 'btn-primary' : 'btn-ghost'}`}
          disabled={actions.busy === profile.id}
          onClick={() => void actions.toggle(profile)}
        >
          {isSuspended(profile) ? 'Reactivate' : 'Suspend'}
        </button>
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {actions.error && <Notice kind="error">{actions.error}</Notice>}
      {actions.result && <InviteResult result={actions.result} again />}
      <p className="section-note">{joining.text}</p>

      <div className="stats">
        <Stat k="Students" v={students.length} sub={students.length === 1 ? 'is theirs' : 'are theirs'} />
        <Stat k="Sessions" v={tally.total} sub={`${tally.completed} done · ${tally.scheduled + tally.live} open`} />
        <Stat k="Reports" v={tally.generated} sub={`${tally.published} published · ${sent} emailed`} />
        <Stat k="Outstanding" v={tally.outstanding} sub={lastAt ? `last session ${formatUtc(lastAt)}` : 'nothing sat yet'} />
      </div>

      <div className="section-head">
        <h2 className="section-title">Their students</h2>
      </div>
      {students.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No students yet</h3>
            <p>A teacher chooses a student’s PC at their first booking, or an admin does under Users → Students.</p>
          </div>
        </div>
      ) : (
        <PeopleTable rows={students} kind="student" href={(p) => `/admin/students/${p.id}`} />
      )}

      <div className="section-head">
        <h2 className="section-title">Reports emailed to them</h2>
      </div>
      {emails === null ? (
        <p className="muted">Loading…</p>
      ) : emails.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nothing emailed yet</h3>
            <p>A report is emailed to the PC when it is generated, or when a teacher sends it on.</p>
          </div>
        </div>
      ) : (
        <div className="board">
          <div className="board-scroll">
            <table className="board-table">
              <thead>
                <tr>
                  <th scope="col">When</th>
                  <th scope="col">Student</th>
                  <th scope="col">Session</th>
                  <th scope="col">To</th>
                  <th scope="col">Status</th>
                  <th aria-label="Open" />
                </tr>
              </thead>
              <tbody>
                {emails.map((e) => {
                  const s = sessionById.get(e.session_id)
                  const status = EMAIL_STATUS[e.status]
                  return (
                    <tr key={`${e.session_id}/${e.generated_at}`}>
                      <td className="nowrap">{formatUtc(e.updated_at)}</td>
                      <td>
                        {s?.student ? (
                          <Link to={`/admin/students/${s.student_id}`}>{s.student.full_name}</Link>
                        ) : (
                          <span className="dash">—</span>
                        )}
                      </td>
                      <td>
                        {s ? (
                          <>
                            <div className="cell-strong">{s.title || `${subjectLabel(s.subject)} session`}</div>
                            <div className="cell-sub">{formatUtc(s.scheduled_at)}</div>
                          </>
                        ) : (
                          <span className="dash">—</span>
                        )}
                      </td>
                      <td className="muted-cell">{e.sent_to ?? '—'}</td>
                      <td>
                        <span className={`badge ${status.cls}`}>{status.text}</span>
                        {e.attempts > 1 && <div className="cell-sub">{e.attempts} tries</div>}
                        {e.detail && <div className="cell-sub">{e.detail}</div>}
                      </td>
                      <td className="row-actions">
                        {s && (
                          <Link className="btn btn-ghost btn-sm" to={`/sessions/${s.id}/report`}>
                            Report
                          </Link>
                        )}
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {late.length > 0 && (
        <>
          <div className="section-head">
            <h2 className="section-title">Write-ups outstanding</h2>
          </div>
          <p className="section-note">Their students’ sessions that have been sat and have no report out yet.</p>
          <SessionTable sessions={late} stages={stages} />
        </>
      )}

      <div className="section-head">
        <h2 className="section-title">Their students’ sessions</h2>
      </div>
      {theirs.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nothing yet</h3>
            <p>None of their students has a session, sat or booked.</p>
          </div>
        </div>
      ) : (
        <SessionTable sessions={theirs} stages={stages} />
      )}
    </div>
  )
}
