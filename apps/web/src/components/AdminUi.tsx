import { Fragment, type ReactNode } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import {
  STAGE_LABELS,
  isSuspended,
  rate,
  type PersonRow,
  type ReportStage,
  type Stages,
} from '../lib/admin'
import { subjectLabel } from '../lib/constants'
import { levelsLabel, levelsOf } from '../lib/sessions'
import { utcParts, utcTime } from '../lib/time'
import { inviteState } from '../lib/pcs'
import type { PcInvite, Profile, Session } from '../lib/types'
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
 *
 * A dot and the words rather than a filled pill, because it sits in the last
 * column of a table whose Status column is already a pill, and two filled pills
 * on a row are read as decoration rather than as two different facts. The dot
 * is hollow while the stage is still somebody's to finish, so the backlog can
 * be read down the column without reading a word of it.
 */
export function StageBadge({ stage }: { stage: ReportStage }) {
  return <span className={`stage stage-${stage}`}>{STAGE_LABELS[stage]}</span>
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

/**
 * The test, or the tests, the lesson was sat on.
 *
 * The teacher's own list prints the badges and then says them again in words
 * on the line underneath — "Medium" over "Medium test" — which is a second
 * line on every row of a table the admin is reading four columns of numbers
 * across. Here the badges carry it on one line, with an arrow where the lesson
 * moved, that being the only thing the badges by themselves do not say.
 */
function Levels({ session }: { session: Session }) {
  const levels = levelsOf(session)
  return (
    <span className="levels-sat" title={levelsLabel(levels)}>
      {levels.map((level, i) => (
        <Fragment key={`${level}-${i}`}>
          {i > 0 && <span className="level-arrow">→</span>}
          <DifficultyBadge level={level} />
        </Fragment>
      ))}
    </span>
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
  pcCell,
}: {
  rows: PersonRow[]
  kind: 'teacher' | 'student'
  /** Given for teachers, whose rows open a page of their own. */
  href?: (profile: Profile) => string
  /** Given for students on an admin's page: the PC, and the control that changes it (0055). */
  pcCell?: (profile: Profile) => ReactNode
}) {
  const teachers = kind === 'teacher'
  const navigate = useNavigate()

  return (
    <div className="board">
      <div className="board-scroll">
        <table className="board-table people-table">
          <thead>
            <tr>
              <th scope="col">{teachers ? 'Teacher' : 'Student'}</th>
              <th scope="col">{teachers ? 'Students' : 'Teachers'}</th>
              {pcCell && <th scope="col">PC</th>}
              <th scope="col" className="col-num">
                Sessions
              </th>
              <th scope="col" className="col-num">
                Answered
              </th>
              <th scope="col" className="col-num">
                Published
              </th>
              <th scope="col" className="col-num">
                Outstanding
              </th>
              <th scope="col">Last</th>
              <th scope="col">Next</th>
            </tr>
          </thead>
          <tbody>
            {rows.map(({ profile, tally, counterparts, lastAt, nextAt }) => {
              const published = rate(tally.published, tally.completed)
              const to = href?.(profile)
              return (
                <tr
                  key={profile.id}
                  className={to ? 'row-link' : undefined}
                  onClick={to ? () => navigate(to) : undefined}
                >
                  <td>
                    <div className="cell-strong">
                      {to ? (
                        // The real link, for a new tab, a keyboard and a screen reader.
                        <Link className="cell-link-name" to={to} onClick={(e) => e.stopPropagation()}>
                          {profile.full_name || 'Unnamed'}
                        </Link>
                      ) : (
                        profile.full_name || 'Unnamed'
                      )}
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
                        <div className="cell-sub cell-names">
                          <span className="names">
                            {counterparts
                              .slice(0, 3)
                              .map((c) => c.name)
                              .join(', ')}
                          </span>
                          {counterparts.length > 3 && (
                            <span className="names-more">+{counterparts.length - 3}</span>
                          )}
                        </div>
                      </>
                    )}
                  </td>
                  {pcCell && <td onClick={(e) => e.stopPropagation()}>{pcCell(profile)}</td>}
                  <td className="num col-num">
                    {tally.total}
                    <div className="cell-sub">
                      {tally.completed} done · {tally.scheduled + tally.live} open
                    </div>
                  </td>
                  <td className="num col-num">{tally.answered || <span className="dash">—</span>}</td>
                  <td className="num col-num">
                    {tally.published}
                    <div className="cell-sub">{published === null ? '—' : `${published}%`}</div>
                  </td>
                  {/* The number that means somebody has to do something. */}
                  <td className="num col-num">
                    {tally.outstanding > 0 ? (
                      <strong className="overdue">{tally.outstanding}</strong>
                    ) : (
                      <span className="dash">—</span>
                    )}
                  </td>
                  <td>{dash(shortDate(lastAt))}</td>
                  <td>{dash(shortDate(nextAt))}</td>
                </tr>
              )
            })}
          </tbody>
        </table>
      </div>
    </div>
  )
}

/**
 * The PCs (0055): who they are, whether they have joined, whose PC they are,
 * and how far their students' reports have got — generated is what reaches a
 * PC's inbox, so it is the column. The controls are the two things an admin
 * does to a PC: another link (to join, or for a new password), and suspending
 * the account (or letting it back in).
 */
export function PcTable({
  rows,
  invites,
  busy,
  onInvite,
  onToggle,
}: {
  rows: PersonRow[]
  invites: Map<string, PcInvite>
  /** The PC an action is running for. */
  busy: string | null
  onInvite: (profile: Profile) => void
  onToggle: (profile: Profile) => void
}) {
  return (
    <div className="board">
      <div className="board-scroll">
        <table className="board-table people-table">
          <thead>
            <tr>
              <th scope="col">PC</th>
              <th scope="col">Students</th>
              <th scope="col" className="col-num">
                Sessions
              </th>
              <th scope="col" className="col-num">
                Reports
              </th>
              <th scope="col">Last</th>
              <th aria-label="Actions" />
            </tr>
          </thead>
          <tbody>
            {rows.map(({ profile, tally, counterparts, lastAt }) => {
              const joining = inviteState(invites.get(profile.id) ?? null)
              return (
                <tr key={profile.id}>
                  <td>
                    <div className="cell-strong">
                      {profile.full_name || 'Unnamed'}
                      {isSuspended(profile) ? (
                        <span className="badge badge-bad">Suspended</span>
                      ) : (
                        joining.badge && (
                          <span className={`badge badge-${joining.badge.tone}`}>{joining.badge.label}</span>
                        )
                      )}
                    </div>
                    <div className="cell-sub">
                      <span className="num">{profile.display_id}</span>
                      {profile.email && <> · {profile.email}</>}
                    </div>
                    <div className="cell-sub">{joining.text}</div>
                  </td>
                  <td>
                    {counterparts.length === 0 ? (
                      <span className="dash">—</span>
                    ) : (
                      <>
                        <div className="cell-strong">{counterparts.length}</div>
                        <div className="cell-sub cell-names">
                          <span className="names">
                            {counterparts
                              .slice(0, 3)
                              .map((c) => c.name)
                              .join(', ')}
                          </span>
                          {counterparts.length > 3 && (
                            <span className="names-more">+{counterparts.length - 3}</span>
                          )}
                        </div>
                      </>
                    )}
                  </td>
                  <td className="num col-num">
                    {tally.total}
                    <div className="cell-sub">
                      {tally.completed} done · {tally.scheduled + tally.live} open
                    </div>
                  </td>
                  <td className="num col-num">
                    {tally.generated}
                    <div className="cell-sub">{tally.published} published</div>
                  </td>
                  <td>{dash(shortDate(lastAt))}</td>
                  <td className="row-actions">
                    {!isSuspended(profile) && (
                      <button
                        type="button"
                        className="btn btn-ghost btn-sm"
                        disabled={busy === profile.id}
                        onClick={() => onInvite(profile)}
                      >
                        {joining.action}
                      </button>
                    )}
                    <button
                      type="button"
                      className="btn btn-ghost btn-sm"
                      disabled={busy === profile.id}
                      onClick={() => onToggle(profile)}
                    >
                      {isSuspended(profile) ? 'Reactivate' : 'Suspend'}
                    </button>
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

/**
 * Sessions, with the write-up column the teacher's own list does not carry.
 *
 * Rows open the admin's own view rather than the teacher's console: an admin
 * opening a live session should not land on the screen with the buttons that
 * publish questions on it without meaning to. That view shows all of the
 * session and is the way into the console, the form and the report, all of
 * which an admin can use as the teacher can (0050).
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
  const navigate = useNavigate()

  return (
    <div className="board">
      <div className="board-scroll">
        <table className="board-table admin-sess-table">
          <thead>
            <tr>
              <th scope="col">When</th>
              {showTeacher && <th scope="col">Teacher</th>}
              {showStudent && <th scope="col">Student</th>}
              <th scope="col">Session</th>
              <th scope="col">Level</th>
              <th scope="col">Status</th>
              <th scope="col" className="col-num">
                Answered
              </th>
              <th scope="col">Write-up</th>
            </tr>
          </thead>
          <tbody>
            {sessions.map((s) => {
              const when = utcParts(s.scheduled_at)
              const to = `/admin/sessions/${s.id}`
              return (
                <tr key={s.id} className="row-link" onClick={() => navigate(to)}>
                  <td>
                    <Link className="cell-link" to={to} onClick={(e) => e.stopPropagation()}>
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
                    <div className="cell-strong">{s.title || `${subjectLabel(s.subject)} session`}</div>
                    <div className="cell-sub">
                      {subjectLabel(s.subject)} · {s.duration_mins} min
                    </div>
                  </td>
                  <td>
                    <Levels session={s} />
                  </td>
                  <td>
                    <StatusBadge status={s.status} />
                  </td>
                  <td className="num col-num">
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
