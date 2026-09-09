import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { EvaluationGrid } from '../components/EvaluationGrid'
import { DomainFindings, QuestionFindings, hasFindings } from '../components/RecordingFindings'
import { IconBack, IconCheck, IconCross } from '../components/icons'
import { Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { useLiveSession } from '../hooks/useLiveSession'
import {
  diagnosisLabel,
  difficultyLabel,
  sectionLabel,
  skillLabel,
  subjectLabel,
} from '../lib/constants'
import {
  DOMAIN_ORDER,
  buildGrid,
  confidenceAverage,
  recommendedPriority,
  timeManagement,
} from '../lib/grid'
import { loadExtraction, type ContextExtractionRow } from '../lib/contextExtraction'
import { rowsFrom } from '../lib/diagnostic'
import { buildReport, formatDuration, paceLabel, type Attempt, type Band } from '../lib/report'
import { buildReportDoc, disagreements, type DomainSection } from '../lib/reportDoc'
import { rows, supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { DomainNote, SessionReportRow } from '../lib/types'

/**
 * The session report.
 *
 * Every number on this page is computed from the session's own rows — the
 * answers, the times, the teacher's diagnoses. Nothing is written by hand and
 * nothing is stored, so the report cannot say something the session did not.
 */
export function SessionReport() {
  const { id = '' } = useParams()
  const { isTeacher } = useAuth()
  const { session, items, loading, error } = useLiveSession(id, { withAssessments: true })
  const report = useMemo(() => buildReport(items), [items])

  const [notes, setNotes] = useState<DomainNote[]>([])
  const [meta, setMeta] = useState<SessionReportRow | null>(null)
  const [extraction, setExtraction] = useState<ContextExtractionRow | null>(null)

  const loadWritten = useCallback(async () => {
    const [n, m, e] = await Promise.all([
      supabase.from('session_domain_notes').select('*').eq('session_id', id),
      supabase.from('session_reports').select('*').eq('session_id', id).maybeSingle(),
      loadExtraction(id),
    ])
    setNotes(rows<DomainNote>(n.data))
    setMeta((m.data as SessionReportRow | null) ?? null)
    setExtraction(e)
  }, [id])

  useEffect(() => {
    void loadWritten()
  }, [loadWritten])

  const grid = useMemo(() => buildGrid(report, notes), [report, notes])

  // The document: the teacher's form, the recording's findings and the computed
  // numbers, joined but never merged. It is assembled at read time from the
  // three of them, so it cannot drift from any of them.
  const doc = useMemo(
    () =>
      buildReportDoc({
        rows: rowsFrom(notes),
        reflection: meta?.teacher_reflection ?? '',
        report,
        extraction: extraction?.body ?? null,
      }),
    [notes, meta, report, extraction],
  )
  const conflicts = useMemo(() => disagreements(doc), [doc])
  const pace = useMemo(() => timeManagement(report), [report])
  // Over the questions the student actually worked, not over every row: a
  // question set aside by a level switch was never asked and never rated, and
  // counting it makes the engagement row read as thinner than it was.
  const confidence = useMemo(
    () => confidenceAverage(items.filter((i) => i.status === 'answered' || i.status === 'revealed')),
    [items],
  )
  const priority = meta?.practice_priority ?? recommendedPriority(report)

  // The domain evidence, by domain, for the grid's last column.
  const byDomain = useMemo(() => {
    const map = new Map<string, DomainSection['evidence']>()
    for (const d of doc.domains) map.set(d.domain, d.evidence)
    return map
  }, [doc])

  // The questions the recording could actually quote something on. A heading
  // and "nothing could be quoted" repeated fifteen times is not a report; the
  // ones with nothing are named together underneath instead.
  const said = useMemo(() => doc.questions.filter(hasFindings), [doc])
  const unsaid = useMemo(() => doc.questions.filter((q) => !hasFindings(q)), [doc])

  // The level is a property of the paper, not of the question, and a session
  // usually runs at one. Repeating "medium" down twenty rows says nothing; the
  // column earns its place only on a session that moved level mid-lesson.
  const levels = useMemo(() => [...new Set(report.attempts.map((a) => a.difficulty))], [report])
  const oneLevel = levels.length === 1 && levels[0] !== null ? levels[0] : null

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const when = formatUtc(session.scheduled_at)

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
        <div className="spring" />
        {meta?.status === 'published' ? (
          <span className="badge badge-ok">Published</span>
        ) : (
          <span className="badge badge-neutral">Draft</span>
        )}
        <button type="button" className="btn btn-sm" onClick={() => window.print()}>
          Save as PDF
        </button>
        {isTeacher && (
          <Link className="btn btn-primary btn-sm" to={`/sessions/${id}/report/edit`}>
            Write up
          </Link>
        )}
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

          <div className="card card-pad">
            <div className="section-title">
              Each domain: the form{extraction && ', and what the recording shows'}
            </div>
            <p className="step-text muted">
              The four rows of the diagnostic form, reproduced word for word.
              {extraction &&
                ' The last column is the recording, and every line in it carries the words it came from.'}
            </p>
            <EvaluationGrid rows={grid} evidence={extraction ? byDomain : undefined} />
          </div>

          {doc.reflection && (
            <div className="card card-pad">
              <div className="section-title">The teacher’s comments on the session</div>
              <p className="step-text">{doc.reflection}</p>
            </div>
          )}

          {!extraction && (
            <Notice kind="info">
              The recording has not been read for this session, so everything here is the teacher’s
              own writing and the numbers from the answers. Generate the report again from the
              session console to have the transcript read.
            </Notice>
          )}

          {conflicts.length > 0 && (
            <div className="card card-pad">
              <div className="section-title">Worth a second look before this goes out</div>
              <p className="step-text muted">
                The recording sits awkwardly against what was written on the form here. One of the
                two needs correcting, and only the teacher can say which.
              </p>
              <DomainFindings evidence={conflicts} />
            </div>
          )}

          <div className="card card-pad summary-card">
            <div className="section-title">Overall diagnostic summary</div>
            <dl className="summary">
              <dt>Time management</dt>
              <dd>
                <b>
                  {pace.verdict === 'unknown'
                    ? '—'
                    : pace.verdict === 'on'
                      ? 'On pace'
                      : pace.verdict === 'fast'
                        ? `${formatDuration(Math.abs(pace.deltaSeconds ?? 0))} under target`
                        : `${formatDuration(pace.deltaSeconds ?? 0)} over target`}
                </b>
                {meta?.time_management && <span className="said">{meta.time_management}</span>}
              </dd>

              <dt>Accuracy rate</dt>
              <dd>
                <b>{report.accuracy === null ? '—' : `${Math.round(report.accuracy * 100)}%`}</b>
                <span className="said">
                  {report.correct} of {report.total} correct
                </span>
              </dd>

              <dt>Engagement / confidence</dt>
              <dd>
                {/* A dash on its own left a teacher unable to tell a missing
                    number from a broken feature. The row is measured from the
                    "how sure are you?" the student answers beside each
                    question, and where they were never asked it says so. */}
                <b>
                  {confidence.average === null
                    ? 'Not rated'
                    : `${confidence.average.toFixed(1)} of 3`}
                </b>
                <span className="said">
                  {confidence.average === null
                    ? 'the student was not asked how sure they felt on any question'
                    : `across ${confidence.rated} of ${confidence.total} questions`}
                </span>
                {meta?.engagement && <span className="said">{meta.engagement}</span>}
              </dd>

              <dt>Recommended practice priority</dt>
              <dd className="priority">
                {DOMAIN_ORDER.map((key) => (
                  <span key={key} className={key === priority ? 'opt on' : 'opt'}>
                    {sectionLabel(key)}
                  </span>
                ))}
              </dd>
            </dl>
            {meta?.summary && <p className="summary-note">{meta.summary}</p>}
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
              <div className="section-title">Every miss, and why</div>
              <p className="step-text muted">
                What the question was is on the paper; what is worth reading here is why this one
                went wrong. The question is named by its number and its level.
              </p>
              <div className="miss-list">
                {report.misses.map((a) => (
                  <MissRow key={a.itemId} attempt={a} />
                ))}
              </div>
            </div>
          )}

          {extraction && (
            <div className="card card-pad">
              <div className="section-title">What was said about each question</div>
              <p className="step-text muted">
                The recording reached {doc.coverage.covered} of {doc.coverage.total} questions, and
                there is something to show on {said.length} of them. Those are below. A finding
                marked as coming from the end-of-lesson review was said when the teacher went back
                over the paper by number rather than while the question was on screen.
              </p>
              {said.map((q) => (
                <QuestionFindings key={q.itemId} question={q} />
              ))}
              {said.length === 0 && (
                <p className="step-text muted">
                  Nothing in the recording could be quoted against a particular question. Either the
                  lesson did not go through the paper question by question, or the recording is not
                  lined up with it — the offset control on the write-up page is where that is fixed.
                </p>
              )}
              {unsaid.length > 0 && said.length > 0 && (
                <p className="step-text muted unsaid">
                  Nothing was said, and nothing was written, about{' '}
                  {unsaid.map((q) => `Q${q.sequence}`).join(', ')}.
                </p>
              )}
            </div>
          )}

          <div className="card card-pad">
            <div className="section-title">Question by question</div>
            {/* A session is normally sat at one level, and a Level column that
                reads "medium" twenty times is a column that says nothing. Where
                the paper was one level it is stated once, here; where the
                session moved level mid-lesson the column comes back, because
                then it is the interesting thing on the row. */}
            <p className="step-text muted">
              {oneLevel
                ? `Every question was from the ${difficultyLabel(oneLevel).toLowerCase()} paper.`
                : levels.length > 1
                  ? 'The session moved level part way through, so each question carries its own.'
                  : 'The level did not come back with these questions.'}
            </p>
            <div className="table-wrap">
              <table className="board-table">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>Skill</th>
                    {!oneLevel && <th>Level</th>}
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
                      {!oneLevel && <td>{difficultyLabel(a.difficulty)}</td>}
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

/**
 * One wrong answer: which question, how hard it was, and why it went wrong.
 *
 * The stem used to head this and it was the least useful line on the page — the
 * parent has the paper, the teacher was in the room, and a paragraph of
 * question text buried the one thing neither of them already knew. What is left
 * is what the row is for: the number, the level, the skill, what was chosen
 * against the key, and then the two accounts of why — the teacher's diagnosis
 * and the student's own words.
 */
function MissRow({ attempt: a }: { attempt: Attempt }) {
  const why = diagnosisLabel(a.diagnosis)

  return (
    <div className="miss">
      <div className="miss-head">
        <span className="badge badge-neutral">Q{a.sequence}</span>
        {a.difficulty && <span className="badge">{difficultyLabel(a.difficulty)}</span>}
        {a.skill && <span className="badge badge-sky">{skillLabel(a.skill)}</span>}
        <span className="badge badge-bad">
          {a.chose} → {a.answer}
        </span>
        <span className="muted">
          {formatDuration(a.seconds)}
          {a.rushed && ' · rushed'}
          {a.laboured && ' · laboured'}
        </span>
      </div>
      {why ? (
        <p className="miss-why">{why}</p>
      ) : (
        <p className="miss-why unset">No diagnosis was recorded for this one.</p>
      )}
      {a.teacherNote && (
        <p className="miss-quote teacher">
          <span className="who">Teacher</span> {a.teacherNote}
        </p>
      )}
      {a.studentReasoning && (
        <p className="miss-quote">
          <span className="who">Student</span> {a.studentReasoning}
        </p>
      )}
    </div>
  )
}
