import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { StageBadge, Stat } from '../components/AdminUi'
import { IconBack, IconCheck, IconCross } from '../components/icons'
import { CopyButton, Notice } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import { reportStage, STAGE_LABELS } from '../lib/admin'
import { diagnosisLabel, levelLabel, subjectLabel } from '../lib/constants'
import { loadExtraction, type ContextExtractionRow } from '../lib/contextExtraction'
import { rowsFrom, type DiagnosticRow } from '../lib/diagnostic'
import { buildReport, formatDuration, paceLabel } from '../lib/report'
import { studentLink } from '../lib/sessions'
import { row, rows, supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import { parseTranscript } from '../lib/transcript'
import type { DomainNote, SessionReportRow, SessionTranscript } from '../lib/types'
import { StatusBadge } from './Sessions'

/**
 * One session, read-only, all of it.
 *
 * This is what the portal is for. A session leaves its traces in six places —
 * the session row, the questions it put up, the assessment behind each answer,
 * the teacher's diagnostic form, the transcript and the report row — and until
 * now there was no screen that showed all six at once to anybody. The teacher
 * has three screens that each show part of it and each let them change what
 * they show.
 *
 * Nothing here can be changed. Not because a control was hidden: an admin has
 * SELECT policies and nothing else (0044), and every RPC that writes a session
 * still asks assert_session_teacher. If a button were added to this page it
 * would fail at the database, which is the right place for it to fail.
 */
export function AdminSession() {
  const { id = '' } = useParams()
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
  const parsed = useMemo(
    () => (transcript?.body.trim() ? parseTranscript(transcript.body) : null),
    [transcript],
  )

  if (loading) return <div className="page">Loading…</div>

  if (!session) {
    return (
      <div className="page">
        <Link className="back-link" to="/admin">
          <IconBack /> The school
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

  return (
    <div className="page page-wide">
      <Link className="back-link" to={`/admin/teachers/${session.teacher_id}`}>
        <IconBack /> {session.teacher?.full_name ?? 'The teacher'}
      </Link>

      <div className="page-head">
        <div>
          <h1>{session.title || `${subjectLabel(session.subject)} session`}</h1>
          <p className="sub">
            <StatusBadge status={session.status} />
            <span style={{ marginLeft: 8 }}>{formatUtc(session.scheduled_at)}</span> ·{' '}
            {session.duration_mins} min · {levelLabel(session.level)} test
          </p>
        </div>
        <div className="spring" />
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
            {session.student?.pc && <> · {session.student.pc}</>}
          </div>
        </div>
        <div className="card card-pad">
          <div className="section-title">The student's link</div>
          {session.access_token ? (
            <>
              <div className="cell-sub" style={{ marginBottom: 8 }}>
                Opens this session and nothing else, with no account.
              </div>
              <CopyButton value={studentLink(session.access_token)} label="Copy the link" />
            </>
          ) : (
            <div className="cell-sub">Not issued.</div>
          )}
        </div>
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

      <div className="section-title">Every question</div>
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
                      {a.section ?? '—'}
                      {a.skill && <> · {a.skill}</>}
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

      <div className="section-title" style={{ marginTop: 26 }}>
        The teacher's diagnostic form
      </div>
      <FormView rows={formRows} reflection={meta?.teacher_reflection ?? ''} stage={stage} />

      <div className="section-title" style={{ marginTop: 26 }}>
        The recording
      </div>
      <div className="card card-pad">
        {!transcript ? (
          <p className="sub">
            No transcript has been uploaded. The form cannot be handed in without one, so this
            session's report cannot be generated yet.
          </p>
        ) : (
          <>
            <p className="sub">
              {transcript.filename ?? 'Pasted in'} · {transcript.source} · uploaded{' '}
              {formatUtc(transcript.created_at)}
              {parsed && (
                <>
                  {' '}
                  · {parsed.lines.length} turns · {parsed.speakers.join(', ')}
                </>
              )}
            </p>
            {extraction ? (
              <p className="sub" style={{ marginTop: 8 }}>
                Read by <strong>{extraction.model}</strong> on{' '}
                {formatUtc(extraction.created_at)}, offset {extraction.offset_seconds}s.{' '}
                {extraction.drops.length} claim{extraction.drops.length === 1 ? '' : 's'} dropped for
                want of a verbatim quote.
              </p>
            ) : (
              <p className="sub" style={{ marginTop: 8 }}>
                The recording has not been read by the model. A report generated now carries the
                form and the numbers and no quotes from the call.
              </p>
            )}
          </>
        )}
      </div>

      {(meta?.summary || meta?.time_management || meta?.engagement) && (
        <>
          <div className="section-title" style={{ marginTop: 26 }}>
            The overall diagnostic summary
          </div>
          <div className="card card-pad admin-written">
            {meta.time_management && (
              <p>
                <strong>Time management.</strong> {meta.time_management}
              </p>
            )}
            {meta.engagement && (
              <p>
                <strong>Engagement.</strong> {meta.engagement}
              </p>
            )}
            {meta.summary && (
              <p>
                <strong>Summary.</strong> {meta.summary}
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
  if (meta.generated_at) return `generated ${formatUtc(meta.generated_at)}`
  if (meta.form_submitted_at) return `form in ${formatUtc(meta.form_submitted_at)}`
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
        <div className="card card-pad admin-written" style={{ marginTop: 14 }}>
          <div className="section-title">The teacher's comments</div>
          <p>{reflection}</p>
        </div>
      )}
    </>
  )
}
