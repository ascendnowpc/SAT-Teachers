import { useMemo } from 'react'
import { Link, useParams } from 'react-router-dom'
import { IconBack, IconCheck, IconCross } from '../components/icons'
import { Notice } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import { diagnosisLabel, sectionLabel, skillLabel, subjectLabel } from '../lib/constants'
import { buildReport, formatDuration, paceLabel, type Attempt, type Band } from '../lib/report'

/**
 * The session report.
 *
 * Every number on this page is computed from the session's own rows — the
 * answers, the times, the teacher's diagnoses. Nothing is written by hand and
 * nothing is stored, so the report cannot say something the session did not.
 */
export function SessionReport() {
  const { id = '' } = useParams()
  const { session, items, loading, error } = useLiveSession(id, { withAssessments: true })
  const report = useMemo(() => buildReport(items), [items])

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const when = new Date(session.scheduled_at).toLocaleDateString(undefined, {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })

  return (
    <div className="page report">
      <Link className="back-link" to={`/sessions/${id}`}>
        <IconBack /> Session
      </Link>

      <div className="page-head">
        <div>
          <h1>{session.student?.full_name || 'Student'} — session report</h1>
          <p className="sub">
            {subjectLabel(session.subject)} · {when} · with {session.teacher?.full_name}
          </p>
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      {report.total === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nothing to report yet</h3>
            <p>The report fills in as the student answers.</p>
          </div>
        </div>
      ) : (
        <>
          <div className="stat-row">
            <Stat
              value={`${report.correct}/${report.total}`}
              label="Correct"
              note={report.accuracy === null ? null : `${Math.round(report.accuracy * 100)}%`}
            />
            <Stat
              value={formatDuration(report.seconds)}
              label="Time on questions"
              note={paceLabel(report.seconds, report.target)}
            />
            <Stat
              value={formatDuration(Math.round(report.seconds / report.total))}
              label="Average per question"
              note={`target ${formatDuration(Math.round(report.target / report.total))}`}
            />
            <Stat
              value={String(report.misses.length)}
              label="To work on"
              note={report.rushed.length > 0 ? `${report.rushed.length} rushed` : null}
            />
          </div>

          {session.teacher_notes && (
            <div className="card card-pad report-note">
              <div className="section-title">Teacher's read</div>
              <p>{session.teacher_notes}</p>
            </div>
          )}

          <div className="report-cols">
            <BandCard title="By skill" bands={report.skills} />
            <BandCard title="By section" bands={report.sections} />
          </div>

          {report.diagnoses.length > 0 && (
            <div className="card card-pad">
              <div className="section-title">Diagnoses</div>
              <div className="diag-row">
                {report.diagnoses.map((d) => (
                  <span key={d.value} className="diag-chip">
                    <b>{d.count}</b> {d.label}
                  </span>
                ))}
              </div>
            </div>
          )}

          {(report.rushed.length > 0 || report.laboured.length > 0) && (
            <div className="card card-pad">
              <div className="section-title">Pace</div>
              <ul className="pace-list">
                {report.rushed.map((a) => (
                  <li key={a.itemId}>
                    <span className="badge badge-bad">Rushed</span> Question {a.sequence} —{' '}
                    {formatDuration(a.seconds)} against a {formatDuration(a.target)} target, and
                    wrong. {diagnosisLabel(a.diagnosis) ?? ''}
                  </li>
                ))}
                {report.laboured.map((a) => (
                  <li key={a.itemId}>
                    <span className="badge badge-neutral">Slow</span> Question {a.sequence} —{' '}
                    {formatDuration(a.seconds)} against a {formatDuration(a.target)} target
                    {a.correct ? ', and right' : ', and wrong'}.
                  </li>
                ))}
              </ul>
            </div>
          )}

          {report.misses.length > 0 && (
            <div className="card card-pad">
              <div className="section-title">Every miss, with the evidence</div>
              <div className="miss-list">
                {report.misses.map((a) => (
                  <MissRow key={a.itemId} attempt={a} />
                ))}
              </div>
            </div>
          )}

          <div className="card card-pad">
            <div className="section-title">Question by question</div>
            <div className="table-wrap">
              <table className="board-table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Skill</th>
                    <th>Level</th>
                    <th>Answer</th>
                    <th>Time</th>
                    <th>Pace</th>
                    <th>Diagnosis</th>
                  </tr>
                </thead>
                <tbody>
                  {report.attempts.map((a) => (
                    <tr key={a.itemId}>
                      <td>{a.sequence}</td>
                      <td>{skillLabel(a.skill) ?? sectionLabel(a.section) ?? '—'}</td>
                      <td>{a.difficulty}</td>
                      <td>
                        {a.correct ? (
                          <span className="ans ok">
                            <IconCheck /> {a.chose}
                          </span>
                        ) : (
                          <span className="ans bad">
                            <IconCross /> {a.chose} → {a.answer}
                          </span>
                        )}
                      </td>
                      <td>{formatDuration(a.seconds)}</td>
                      <td className="muted-cell">{paceLabel(a.seconds, a.target) ?? '—'}</td>
                      <td className="muted-cell">{diagnosisLabel(a.diagnosis) ?? '—'}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </>
      )}
    </div>
  )
}

function Stat({ value, label, note }: { value: string; label: string; note: string | null }) {
  return (
    <div className="stat">
      <div className="v">{value}</div>
      <div className="l">{label}</div>
      {note && <div className="n">{note}</div>}
    </div>
  )
}

function BandCard({ title, bands }: { title: string; bands: Band[] }) {
  return (
    <div className="card card-pad">
      <div className="section-title">{title}</div>
      <div className="bands">
        {bands.map((b) => {
          const pct = Math.round((b.correct / b.total) * 100)
          return (
            <div key={b.key} className="band">
              <div className="band-top">
                <span className="name">{b.label}</span>
                <span className="score">
                  {b.correct}/{b.total}
                </span>
              </div>
              <div className="bar" role="img" aria-label={`${pct}% correct`}>
                <span
                  className={pct >= 80 ? 'fill ok' : pct >= 50 ? 'fill mid' : 'fill low'}
                  style={{ width: `${Math.max(pct, 3)}%` }}
                />
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}

function MissRow({ attempt: a }: { attempt: Attempt }) {
  return (
    <div className="miss">
      <div className="miss-head">
        <span className="badge badge-neutral">Q{a.sequence}</span>
        {a.skill && <span className="badge badge-sky">{skillLabel(a.skill)}</span>}
        <span className="badge badge-bad">
          {a.chose} → {a.answer}
        </span>
        <span className="muted">{formatDuration(a.seconds)}</span>
      </div>
      <p className="miss-stem">{a.stem}</p>
      {a.studentReasoning && (
        <p className="miss-quote">
          <span className="who">Student</span> {a.studentReasoning}
        </p>
      )}
      {a.teacherNote && (
        <p className="miss-quote teacher">
          <span className="who">Teacher</span> {a.teacherNote}
        </p>
      )}
    </div>
  )
}
