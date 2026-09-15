import { Link } from 'react-router-dom'
import {
  STAGE_LABELS,
  isSuspended,
  rate,
  type PersonRow,
  type ReportStage,
  type Stages,
} from '../lib/admin'
import { levelLabel, subjectLabel } from '../lib/constants'
import { utcParts, utcTime } from '../lib/time'
import type { Profile, Session } from '../lib/types'
import { StatusBadge } from '../pages/Sessions'
import { DifficultyBadge } from './ui'

/**
 * The pieces every admin screen is made of.
 *
 * The portal is four pages that show the same few things at different widths —
 * where a session has got to, how much a person has done, which sessions those
 * were — so those three live here once rather than three times.
 */

/**
 * How far a session's write-up has got.
 *
 * It is the one column in the portal that is not on any teacher screen, because
 * a teacher only ever has their own to look at and already knows. An admin
 * reading down a column of these is reading the backlog.
 */
export function StageBadge({ stage }: { stage: ReportStage }) {
  const kind =
    stage === 'published'
      ? 'badge-ok'
      : stage === 'none'
        ? 'badge-neutral'
        : stage === 'generated'
          ? 'badge-sky'
          : 'badge-medium'
  return <span className={`badge ${kind}`}>{STAGE_LABELS[stage]}</span>
}

/** One figure with its name under it — the row across the top of a page. */
export function Stat({ k, v, sub }: { k: string; v: string | number; sub?: string }) {
  return (
    <div className="stat">
      <div className="k">{k}</div>
      <div className="v">{v}</div>
      {sub && <div className="stat-sub">{sub}</div>}
    </div>
  )
}

function dash(value: string | null | undefined) {
  return value ? <>{value}</> : <span className="dash">—</span>
}

function shortDate(at: string | null): string | null {
  if (!at) return null
  const p = utcParts(at)
  return `${p.day} ${p.month}`
}

/**
 * A list of people, teachers or students, with what they have done beside them.
 *
 * One table for both because the question is the same on both sides of a
 * session — how much, how recently, with whom — and the only difference is
 * which side the counterparts are on. The headings say which.
 */
export function PeopleTable({
  rows,
  kind,
  href,
}: {
  rows: PersonRow[]
  kind: 'teacher' | 'student'
  /** Given for teachers, whose rows open a page of their own. */
  href?: (profile: Profile) => string
}) {
  const teachers = kind === 'teacher'

  return (
    <div className="board">
      <div className="board-scroll">
        <table className="board-table people-table">
          <thead>
            <tr>
              <th>{teachers ? 'Teacher' : 'Student'}</th>
              <th>{teachers ? 'Students' : 'Teachers'}</th>
              <th>Sessions</th>
              <th>Answered</th>
              <th>Published</th>
              <th>Outstanding</th>
              <th>Last</th>
              <th>Next</th>
              {href && <th aria-label="Actions" />}
            </tr>
          </thead>
          <tbody>
            {rows.map(({ profile, tally, counterparts, lastAt, nextAt }) => (
              <tr key={profile.id}>
                <td>
                  <div className="cell-strong">
                    {profile.full_name || 'Unnamed'}
                    {isSuspended(profile) ? (
                      <span className="badge badge-bad">Suspended</span>
                    ) : (
                      !profile.is_active && <span className="badge badge-medium">Pending</span>
                    )}
                    {profile.role === 'admin' && <span className="badge badge-role">Admin</span>}
                  </div>
                  <div className="cell-sub">
                    <span className="num">{profile.display_id}</span>
                    {profile.pc && <> · {profile.pc}</>}
                    {teachers && profile.email && <> · {profile.email}</>}
                  </div>
                </td>
                <td>
                  {counterparts.length === 0 ? (
                    <span className="dash">—</span>
                  ) : (
                    <>
                      <div className="cell-strong">{counterparts.length}</div>
                      <div className="cell-sub">
                        {counterparts
                          .slice(0, 3)
                          .map((c) => c.name)
                          .join(', ')}
                        {counterparts.length > 3 && ` +${counterparts.length - 3}`}
                      </div>
                    </>
                  )}
                </td>
                <td className="num">
                  {tally.total}
                  <div className="cell-sub">
                    {tally.completed} done · {tally.scheduled + tally.live} open
                  </div>
                </td>
                <td className="num">{tally.answered || <span className="dash">—</span>}</td>
                <td className="num">
                  {tally.published}
                  <div className="cell-sub">
                    {rate(tally.published, tally.completed) ?? '—'}
                    {rate(tally.published, tally.completed) === null ? '' : '%'}
                  </div>
                </td>
                {/* The number that means somebody has to do something. */}
                <td className="num">
                  {tally.outstanding > 0 ? (
                    <strong className="overdue">{tally.outstanding}</strong>
                  ) : (
                    <span className="dash">—</span>
                  )}
                </td>
                <td>{dash(shortDate(lastAt))}</td>
                <td>{dash(shortDate(nextAt))}</td>
                {href && (
                  <td className="row-actions">
                    <Link className="btn btn-ghost btn-sm" to={href(profile)}>
                      Open
                    </Link>
                  </td>
                )}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  )
}

/**
 * Sessions, with the write-up column the teacher's own list does not carry.
 *
 * Rows open the admin's read-only view rather than the teacher's console: an
 * admin opening a live session should not land on the screen with the buttons
 * that publish questions on it.
 */
export function SessionTable({
  sessions,
  stages,
  showTeacher = true,
  showStudent = true,
}: {
  sessions: Session[]
  stages: Stages
  showTeacher?: boolean
  /** Off when the table already sits under that student's name. */
  showStudent?: boolean
}) {
  return (
    <div className="board">
      <div className="board-scroll">
        <table className="board-table admin-sess-table">
          <thead>
            <tr>
              <th>When</th>
              {showTeacher && <th>Teacher</th>}
              {showStudent && <th>Student</th>}
              <th>Session</th>
              <th>Level</th>
              <th>Status</th>
              <th>Answered</th>
              <th>Write-up</th>
            </tr>
          </thead>
          <tbody>
            {sessions.map((s) => {
              const when = utcParts(s.scheduled_at)
              return (
                <tr key={s.id}>
                  <td>
                    <Link className="cell-link" to={`/admin/sessions/${s.id}`}>
                      <span className="when-day">
                        {when.day} {when.month}
                      </span>
                      <span className="when-time">{utcTime(s.scheduled_at)} UTC</span>
                    </Link>
                  </td>
                  {showTeacher && (
                    <td>
                      <div className="cell-strong">{s.teacher?.full_name ?? '—'}</div>
                      <div className="cell-sub num">{s.teacher?.display_id}</div>
                    </td>
                  )}
                  {showStudent && (
                    <td>
                      <div className="cell-strong">{s.student?.full_name ?? '—'}</div>
                      <div className="cell-sub">
                        <span className="num">{s.student?.display_id}</span>
                        {s.student?.pc && <> · {s.student.pc}</>}
                      </div>
                    </td>
                  )}
                  <td>
                    <div className="cell-strong">
                      {s.title || `${subjectLabel(s.subject)} session`}
                    </div>
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
                  <td className="num">
                    {s.answered_count > 0 ? s.answered_count : <span className="dash">—</span>}
                  </td>
                  <td>
                    <StageBadge stage={stages.get(s.id) ?? 'none'} />
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
