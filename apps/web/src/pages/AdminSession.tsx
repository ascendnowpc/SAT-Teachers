import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { AdminRecording } from '../components/AdminRecording'
import { StageBadge, Stat } from '../components/AdminUi'
import { PcDelivery } from '../components/PcDelivery'
import { IconBack, IconCheck, IconCross } from '../components/icons'
import { CopyButton, Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { useLiveSession } from '../hooks/useLiveSession'
import { reportStage, STAGE_LABELS } from '../lib/admin'
import { diagnosisLabel, sectionLabel, skillLabel, subjectLabel } from '../lib/constants'
import { loadExtraction, type ContextExtractionRow } from '../lib/contextExtraction'
import { rowsFrom, type DiagnosticRow } from '../lib/diagnostic'
import { buildReport, formatDuration, paceLabel } from '../lib/report'
import { levelsLabel, levelsOf, studentLink } from '../lib/sessions'
import { row, rows, supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import { parseTranscript } from '../lib/transcript'
import type { DomainNote, SessionReportRow, SessionTranscript } from '../lib/types'
import { StatusBadge } from './Sessions'

/**
 * One session, all of it, from the admin's seat.
 *
 * This is what the portal is for. A session leaves its traces in six places —
 * the session row, the questions it put up, the assessment behind each answer,
 * the teacher's diagnostic form, the transcript and the report row — and until
 * now there was no screen that showed all six at once to anybody. The teacher
 * has three screens that each show part of it and each let them change what
 * they show.
 *
 * An admin can do to a session whatever its teacher can (0050), and this page
 * is the way into all of it rather than a second copy of it: the console, to
 * run the session or publish its results; the diagnostic form; the transcript
 * and generating the report, here (AdminRecording); and the report's editor,
 * where it is published.
 *
 * It is also what a PC sees of their student's session (0055), at the
 * session's own address: the same six traces, read, and none of the ways in.
 * A PC runs nothing and writes nothing — the database refuses them either way
 * — so the buttons that would are simply not there, and where the admin has
 * the transcript editor and Generate the PC has the transcript, the report and
 * whether it was emailed to them.
 */
export function AdminSession() {
  const { id = '' } = useParams()
  const { isAdmin } = useAuth()
  const { session, items, loading, error } = useLiveSession(id, { withAssessments: true })
  const report = useMemo(() => buildReport(items), [items])

  const [notes, setNotes] = useState<DomainNote[]>([])
  const [meta, setMeta] = useState<SessionReportRow | null>(null)
  const [transcript, setTranscript] = useState<SessionTranscript | null>(null)
  const [extraction, setExtraction] = useState<ContextExtractionRow | null>(null)

  const loadWritten = useCallback(async () => {
    const [n, m, t, e] = await Promise.all([
      supabase.from('session_domain_notes').select('*').eq('session_id', id),
      supabase.from('session_reports').select('*').eq('session_id', id).maybeSingle(),
      supabase.from('session_transcripts').select('*').eq('session_id', id).maybeSingle(),
      loadExtraction(id),
    ])
    setNotes(rows<DomainNote>(n.data))
    setMeta(row<SessionReportRow>(m.data))
    setTranscript(row<SessionTranscript>(t.data))
    setExtraction(e)
  }, [id])

  useEffect(() => {
    void loadWritten()
  }, [loadWritten])

  const formRows = useMemo(
    () => rowsFrom(notes, session?.subject ?? 'english'),
    [notes, session],
  )
  const stage = reportStage(meta)

  if (loading) return <div className="page">Loading…</div>

  if (!session) {
    return (
      <div className="page">
        <Link className="back-link" to={isAdmin ? '/admin/users' : '/sessions'}>
          <IconBack /> {isAdmin ? 'Users' : 'Sessions'}
        </Link>
        <div className="card">
          <div className="empty">
            <h3>No such session</h3>
            <p>{error ?? 'That session does not exist, or it has been deleted.'}</p>
          </div>
        </div>
      </div>
    )
  }

  const accuracy = report.accuracy === null ? null : Math.round(report.accuracy * 100)
  const notStarted = session.status === 'scheduled'

  return (
    <div className="page page-wide">
      {isAdmin ? (
        <Link className="back-link" to={`/admin/teachers/${session.teacher_id}`}>
          <IconBack /> {session.teacher?.full_name ?? 'The teacher'}
        </Link>
      ) : (
        <Link className="back-link" to="/sessions">
          <IconBack /> Sessions
        </Link>
      )}

      <div className="page-head">
        <div>
          <h1>{session.title || `${subjectLabel(session.subject)} session`}</h1>
          <p className="sub head-meta">
            <StatusBadge status={session.status} />
            <span>
              {formatUtc(session.scheduled_at)} · {session.duration_mins} min ·{' '}
              {levelsLabel(levelsOf(session))}
            </span>
          </p>
        </div>
        <div className="spring" />
        {/* The teacher's own console, which works from this seat too (0050):
            running the session, answering for the student, publishing the
            results, the diagnoses. Not a PC's: they read. */}
        {isAdmin && (
          <Link className="btn btn-ghost btn-sm" to={`/sessions/${session.id}`}>
            Open the console
          </Link>
        )}
        {/* The report as the teacher and the parent read it. It is the same page
            the teacher opens, which is the point: an admin checking a report
            should be reading the report, not a summary of it. */}
        <Link className="btn btn-ghost btn-sm" to={`/sessions/${session.id}/report`}>
          Open the report
        </Link>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <div className="admin-who">
        <div className="card card-pad">
          <div className="section-title">Teacher</div>
          <div className="cell-strong">{session.teacher?.full_name ?? '—'}</div>
          <div className="cell-sub num">{session.teacher?.display_id}</div>
        </div>
        <div className="card card-pad">
          <div className="section-title">Student</div>
          <div className="cell-strong">{session.student?.full_name ?? '—'}</div>
          <div className="cell-sub">
            <span className="num">{session.student?.display_id}</span>
            {session.student?.pc && <> · PC {session.student.pc}</>}
          </div>
        </div>
        {isAdmin ? (
          <LinkCard token={session.access_token ?? null} />
        ) : (
          <ReportCard sessionId={session.id} stage={stage} />
        )}
      </div>

      <div className="stats">
        <Stat
          k="Answered"
          v={report.total}
          sub={`of ${session.question_count} put up`}
        />
        <Stat k="Correct" v={accuracy === null ? '—' : `${accuracy}%`} sub={`${report.correct} right`} />
        <Stat
          k="Time"
          v={formatDuration(report.seconds)}
          sub={paceLabel(report.seconds, report.target) ?? 'no target to read it against'}
        />
        <Stat k="Write-up" v={STAGE_LABELS[stage]} sub={timings(meta)} />
      </div>

      <div className="section-head">
        <h2 className="section-title">Every question</h2>
      </div>
      {report.attempts.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nothing was answered</h3>
            <p>
              This session put {session.question_count} questions up and none of them came back
              answered.
            </p>
          </div>
        </div>
      ) : (
        <div className="board">
          <div className="board-scroll">
            <table className="board-table admin-items-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Question</th>
                  <th>Section · skill</th>
                  <th>Answer</th>
                  <th>Time</th>
                  <th>Diagnosis</th>
                </tr>
              </thead>
              <tbody>
                {report.attempts.map((a) => (
                  <tr key={a.itemId} className={a.correct ? '' : 'miss-row'}>
                    <td className="num">{a.sequence}</td>
                    <td>
                      <div className="cell-clip">{a.stem}</div>
                      {a.studentReasoning && (
                        <div className="cell-sub">“{a.studentReasoning}”</div>
                      )}
                    </td>
                    <td className="cell-sub">
                      {sectionLabel(a.section) ?? '—'}
                      {a.skill && <> · {skillLabel(a.skill)}</>}
                    </td>
                    <td>
                      {a.correct ? (
                        <span className="ans ok">
                          <IconCheck /> {a.chose}
                        </span>
                      ) : (
                        <span className="ans bad">
                          <IconCross /> {a.chose ?? '—'} → {a.answer ?? '—'}
                        </span>
                      )}
                    </td>
                    <td className="num">
                      {formatDuration(a.seconds)}
                      <div className="cell-sub">
                        {a.rushed ? 'rushed' : a.laboured ? 'laboured' : paceLabel(a.seconds, a.target) ?? '—'}
                      </div>
                    </td>
                    <td className="cell-sub">
                      {diagnosisLabel(a.diagnosis) ?? '—'}
                      {a.teacherNote && <div>{a.teacherNote}</div>}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      <div className="section-head">
        <h2 className="section-title">The teacher's diagnostic form</h2>
        <span className="spring" />
        {/* The write-up is of a lesson, and before the test has started there
            is no lesson to write up — the console holds everything back until
            then too (0052). */}
        {!notStarted && isAdmin && (
          <Link
            className="btn btn-ghost btn-sm"
            to={`/sessions/${session.id}/diagnostic`}
            state={{ back: `/admin/sessions/${session.id}` }}
          >
            Edit the form
          </Link>
        )}
      </div>
      <FormView rows={formRows} reflection={meta?.teacher_reflection ?? ''} stage={stage} />

      <div className="section-head">
        <h2 className="section-title">The recording and the report</h2>
      </div>
      {notStarted ? (
        <div className="card card-pad">
          <p className="sub">
            The test has not started. The transcript and the report open up once it has been sat.
          </p>
        </div>
      ) : isAdmin ? (
        <AdminRecording
          session={session}
          items={items}
          transcript={transcript}
          extraction={extraction}
          report={meta}
          onChanged={loadWritten}
        />
      ) : (
        <RecordingRead session={session} transcript={transcript} report={meta} />
      )}

      {(meta?.summary || meta?.time_management || meta?.engagement) && (
        <>
          <div className="section-head">
            <h2 className="section-title">The overall diagnostic summary</h2>
          </div>
          <div className="card card-pad admin-written">
            {meta.time_management && (
              <p>
                <strong>Time management</strong> {meta.time_management}
              </p>
            )}
            {meta.engagement && (
              <p>
                <strong>Engagement</strong> {meta.engagement}
              </p>
            )}
            {meta.summary && (
              <p>
                <strong>Summary</strong> {meta.summary}
              </p>
            )}
          </div>
        </>
      )}
    </div>
  )
}

/** The three timestamps the write-up column is computed from, in one line. */
function timings(meta: SessionReportRow | null): string {
  if (!meta) return 'nothing written yet'
  if (meta.published_at) return `published ${formatUtc(meta.published_at)}`
  if (meta.generated_at && reportStage(meta) === 'generated') {
    return `generated ${formatUtc(meta.generated_at)}`
  }
  if (meta.form_submitted_at) {
    // Handed in again after the report was made from it: the report is owed.
    return meta.generated_at
      ? `form in again ${formatUtc(meta.form_submitted_at)}`
      : `form in ${formatUtc(meta.form_submitted_at)}`
  }
  return 'a draft'
}

/**
 * The teacher's form, as they filled it in.
 *
 * The same four rows and the same six columns as the paper grid the teachers
 * work from, with the two printed columns printed and the four they own shown
 * as written. An empty cell is shown as empty rather than skipped — a blank
 * Gaps observed against a domain is exactly the thing an admin is reading this
 * page to find.
 */
function FormView({
  rows: formRows,
  reflection,
  stage,
}: {
  rows: DiagnosticRow[]
  reflection: string
  stage: ReturnType<typeof reportStage>
}) {
  const empty = formRows.every((r) => !r.performance && !r.strengths && !r.gaps)

  if (empty && !reflection) {
    return (
      <div className="card">
        <div className="empty">
          <h3>The form has not been started</h3>
          <p>
            Nothing has been written into the reflection grid for this session.{' '}
            <StageBadge stage={stage} />
          </p>
        </div>
      </div>
    )
  }

  return (
    <>
      <div className="board">
        <div className="board-scroll">
          <table className="board-table admin-form-table">
            <thead>
              <tr>
                <th>Domain</th>
                <th>Skill focus</th>
                <th>Performance</th>
                <th>Strengths observed</th>
                <th>Gaps observed</th>
                <th>Next steps / Targets</th>
              </tr>
            </thead>
            <tbody>
              {formRows.map((r) => (
                <tr key={r.domain}>
                  <td className="cell-strong">{r.label}</td>
                  <td className="cell-sub">{r.skillFocus.join(', ')}</td>
                  <td>
                    {r.performance === 'tick' ? (
                      <span className="ans ok">
                        <IconCheck />
                      </span>
                    ) : r.performance === 'cross' ? (
                      <span className="ans bad">
                        <IconCross />
                      </span>
                    ) : (
                      <span className="dash">—</span>
                    )}
                    {r.performanceNote && <div className="cell-sub">{r.performanceNote}</div>}
                  </td>
                  <td className="cell-read">{r.strengths || <span className="dash">—</span>}</td>
                  <td className="cell-read">{r.gaps || <span className="dash">—</span>}</td>
                  <td className="cell-read">{r.targets || <span className="dash">—</span>}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {reflection && (
        <div className="card card-pad admin-written admin-written-after">
          <div className="section-title">The teacher's comments</div>
          <p>{reflection}</p>
        </div>
      )}
    </>
  )
}

/** The student's way in, for the admin to send again. */
function LinkCard({ token }: { token: string | null }) {
  return (
    <div className="card card-pad">
      <div className="section-title">The student's link</div>
      {token ? (
        <>
          <div className="cell-sub">Opens this session and nothing else, with no account.</div>
          <CopyButton value={studentLink(token)} label="Copy the link" />
        </>
      ) : (
        <div className="cell-sub">Not issued.</div>
      )}
    </div>
  )
}

/** Where the report is up to, from a PC's seat, and the way to it. */
function ReportCard({ sessionId, stage }: { sessionId: string; stage: ReturnType<typeof reportStage> }) {
  return (
    <div className="card card-pad">
      <div className="section-title">The report</div>
      <div className="cell-sub">
        <StageBadge stage={stage} />
      </div>
      <Link className="btn btn-ghost btn-sm" to={`/sessions/${sessionId}/report`}>
        Open the report
      </Link>
    </div>
  )
}

function formatClock(seconds: number): string {
  return `${Math.floor(seconds / 60)}:${String(seconds % 60).padStart(2, '0')}`
}

/**
 * The recording and the report, from a PC's seat: the transcript to read, and
 * whether the report was generated and emailed to them. What the admin edits
 * here, the PC reads.
 */
function RecordingRead({
  session,
  transcript,
  report,
}: {
  session: { id: string; student?: { pc?: string | null } | null }
  transcript: SessionTranscript | null
  report: SessionReportRow | null
}) {
  const turns = useMemo(() => parseTranscript(transcript?.body ?? '').lines, [transcript])

  return (
    <div className="card card-pad">
      <div className="step-head">
        <div className="section-title section-title-flush">The report</div>
        <span className="spring" />
        {report?.generated_at && <span className="badge badge-ok">Generated {formatUtc(report.generated_at)}</span>}
        {report?.published_at && <span className="badge badge-ok">Published {formatUtc(report.published_at)}</span>}
      </div>
      {report?.generated_at ? (
        <>
          <PcDelivery
            sessionId={session.id}
            generatedAt={report.generated_at}
            pcName={session.student?.pc ?? null}
            canResend={false}
          />
          <div className="step-actions pc-delivery">
            <Link className="btn btn-primary btn-sm" to={`/sessions/${session.id}/report`}>
              Open the report
            </Link>
          </div>
        </>
      ) : (
        <p className="prose card-note">
          The report has not been generated yet. It is emailed to you, as a PDF, the moment it is.
        </p>
      )}

      <div className="section-title step-sub">Fathom transcript</div>
      {transcript?.body ? (
        <details className="transcript-read">
          <summary>
            {transcript.filename ?? 'Pasted in'} · {turns.length} {turns.length === 1 ? 'turn' : 'turns'}
            {turns.length > 0 && ` · ${formatClock(turns[turns.length - 1].at)} long`}
          </summary>
          <div className="transcript-body">
            {turns.length === 0 ? (
              <pre>{transcript.body}</pre>
            ) : (
              turns.map((line, k) => (
                <p key={k} className="transcript-turn">
                  <span className="who">
                    {formatClock(line.at)} · {line.speaker}
                  </span>
                  {line.text}
                </p>
              ))
            )}
          </div>
        </details>
      ) : (
        <p className="sub">No transcript has been put in for this session yet.</p>
      )}
    </div>
  )
}
