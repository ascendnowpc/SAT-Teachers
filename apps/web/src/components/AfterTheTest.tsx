import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { DiagnosticGrid } from './DiagnosticGrid'
import { Notice } from './ui'
import { rowsComplete, rowsFrom, type DiagnosticRow } from '../lib/diagnostic'
import {
  alignmentFor,
  loadExtraction,
  readRecording,
  type ContextExtractionRow,
} from '../lib/contextExtraction'
import { row, rows as toRows, supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { DomainNote, Session, SessionItem, SessionReportRow, SessionTranscript } from '../lib/types'

/**
 * What the console offers once the test is over.
 *
 * There is an order to this and the screen keeps it. The test finishes and
 * there is one thing to do: fill the diagnostic form. Once it is in, the
 * console shows what was written — the grid, the comments, the transcript —
 * and only then is there a report to generate. It sits above the board,
 * because after the lesson this is the work and the answers are the reference. The report is not something
 * that quietly happens when the boxes are full; the teacher presses the button,
 * and until they do there is nothing to press it with.
 */
/** "2:30" — where the lesson is taken to start in the recording. */
function formatClock(seconds: number): string {
  return `${Math.floor(seconds / 60)}:${String(seconds % 60).padStart(2, '0')}`
}

/** "Sara Rohit is the student and Malya Rastogi the teacher" — who is who. */
function describeRoles(roles: Record<string, string>): string {
  const named = (role: string) =>
    Object.entries(roles)
      .filter(([, r]) => r === role)
      .map(([speaker]) => speaker)

  const student = named('student')
  const teacher = named('teacher')
  if (student.length === 0 && teacher.length === 0) return 'nobody on it has been matched to a name yet'
  if (student.length === 0) return `nobody on it matches the student's name`
  if (teacher.length === 0) return `nobody on it matches the teacher's name`
  return `${student.join(', ')} is the student and ${teacher.join(', ')} the teacher`
}

export function AfterTheTest({
  sessionId,
  session,
  items,
}: {
  sessionId: string
  session: Session | null
  items: SessionItem[]
}) {
  const [gridRows, setGridRows] = useState<DiagnosticRow[]>(rowsFrom([]))
  const [report, setReport] = useState<SessionReportRow | null>(null)
  const [transcript, setTranscript] = useState<SessionTranscript | null>(null)
  const [extraction, setExtraction] = useState<ContextExtractionRow | null>(null)
  const [loading, setLoading] = useState(true)
  const [busy, setBusy] = useState(false)
  const [reading, setReading] = useState(false)
  /** Null until the teacher types one; the suggestion stands until they do. */
  const [offsetOverride, setOffsetOverride] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    const [n, m, t, e] = await Promise.all([
      supabase.from('session_domain_notes').select('*').eq('session_id', sessionId),
      supabase.from('session_reports').select('*').eq('session_id', sessionId).maybeSingle(),
      supabase.from('session_transcripts').select('*').eq('session_id', sessionId).maybeSingle(),
      loadExtraction(sessionId),
    ])
    setGridRows(rowsFrom(toRows<DomainNote>(n.data)))
    setReport(row<SessionReportRow>(m.data))
    setTranscript(row<SessionTranscript>(t.data))
    setExtraction(e)
    setLoading(false)
  }, [sessionId])

  useEffect(() => {
    void load()
  }, [load])

  async function read() {
    setReading(true)
    setError(null)
    try {
      await readRecording({
        sessionId,
        session,
        items,
        transcriptBody: transcript?.body ?? '',
        offset: offsetOverride === null ? undefined : Number(offsetOverride),
      })
      await load()
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
    }
    setReading(false)
  }

  async function generate() {
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.rpc('generate_report', { p_session: sessionId })
    if (err) setError(err.message)
    await load()
    setBusy(false)
  }

  // suggestOffset tries every offset up to twenty minutes against every
  // question, so this is a scan over the whole transcript rather than a lookup —
  // not something to redo on each keystroke elsewhere on the console.
  const alignment = useMemo(
    () => alignmentFor(session, items, transcript?.body ?? ''),
    [session, items, transcript],
  )

  if (loading) return null

  const submitted = report?.form_submitted_at ?? null
  const generated = report?.generated_at ?? null
  const started = rowsComplete(gridRows)
  const total = extraction?.body.questions.length ?? 0
  const covered = extraction?.body.questions.filter((q) => q.covered).length ?? 0
  // A transcript row is replaced rather than added to, so one created after the
  // reading is a different recording than the one that was read.
  const stale = Boolean(
    extraction && transcript && Date.parse(transcript.created_at) > Date.parse(extraction.created_at),
  )

  /* ------------------------------------------- the form is not in yet --- */
  if (!submitted) {
    return (
      <div className="card card-pad next-step">
        <div className="section-title">Diagnostic form</div>
        <p>
          The test is done and nothing is scored yet. The report is built from the reflection grid,
          your comments and the Fathom transcript — fill those in and it can be generated.
        </p>
        <div className="step-actions">
          <Link className="btn btn-primary" to={`/sessions/${sessionId}/diagnostic`}>
            {started > 0 ? 'Continue the diagnostic form' : 'Fill the diagnostic form'}
          </Link>
          {started > 0 && (
            <span className="muted">{started} of {gridRows.length} domains filled in</span>
          )}
        </div>
      </div>
    )
  }

  /* ---------------------------------------------- the form, read back --- */
  return (
    <div className="card card-pad next-step">
      <div className="step-head">
        <div className="section-title" style={{ marginBottom: 0 }}>
          Diagnostic form
        </div>
        <span className="badge badge-ok">Submitted {formatUtc(submitted)}</span>
        <span className="spring" />
        <Link className="btn btn-ghost btn-sm" to={`/sessions/${sessionId}/diagnostic`}>
          Edit
        </Link>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <DiagnosticGrid rows={gridRows} readOnly />

      <div className="section-title step-sub">Comments on the session</div>
      <p className="step-text">{report?.teacher_reflection}</p>

      <div className="section-title step-sub">Fathom transcript</div>
      <p className="step-text muted">
        {transcript?.filename ?? 'Pasted in'} · {transcript?.body.length ?? 0} characters
      </p>

      <div className="section-title step-sub">What the recording says</div>
      {!extraction ? (
        <>
          <p className="step-text">
            The transcript is cut into one window per question and read back with a quote against
            every finding — what the student explained, what they misunderstood, and what you told
            them. Nothing that cannot be pointed at a line of the recording is kept.
          </p>
          <div className="offset-row">
            <label htmlFor="read-offset">The first question is discussed at</label>
            <input
              id="read-offset"
              type="number"
              min={0}
              step={15}
              value={offsetOverride ?? String(alignment.offset)}
              onChange={(e) => setOffsetOverride(e.target.value)}
            />
            <span className="muted">
              seconds in — {formatClock(Number(offsetOverride ?? alignment.offset) || 0)}
            </span>
            {offsetOverride !== null && (
              <button type="button" className="btn btn-ghost btn-sm" onClick={() => setOffsetOverride(null)}>
                Use the suggestion
              </button>
            )}
          </div>
          <p className="step-text muted">
            The suggestion is read off the recording, and it is only reliable when the lesson runs
            question by question. Where the paper was taken in silence and gone through at the end,
            set this to the moment the <b>first</b> question is discussed — otherwise every quote
            comes from the wrong question. {describeRoles(alignment.roles)}; that is corrected on the{' '}
            <Link to={`/sessions/${sessionId}/report/edit`}>write-up page</Link>.
          </p>
        </>
      ) : (
        <p className="step-text muted">
          Read {formatUtc(extraction.created_at)} · {covered} of {total} questions covered
          {extraction.drops.length > 0 && ` · ${extraction.drops.length} unquotable claims dropped`}
        </p>
      )}

      {stale && (
        <Notice kind="info">
          The transcript was replaced after this reading was taken. Read it again — the report will
          not generate from a reading of the old recording.
        </Notice>
      )}

      <div className="step-actions">
        <button
          type="button"
          className={extraction ? 'btn btn-ghost' : 'btn btn-primary'}
          disabled={reading || !transcript?.body}
          onClick={() => void read()}
        >
          {reading ? 'Reading the recording…' : extraction ? 'Read it again' : 'Read the recording'}
        </button>
      </div>

      <div className="step-actions">
        {generated ? (
          <>
            <span className="badge badge-ok">Report generated {formatUtc(generated)}</span>
            <Link className="btn btn-ghost" to={`/sessions/${sessionId}/report`}>
              View report
            </Link>
            <button type="button" className="btn btn-ghost" disabled={busy} onClick={() => void generate()}>
              Generate again
            </button>
          </>
        ) : (
          <button type="button" className="btn btn-primary" disabled={busy} onClick={() => void generate()}>
            Generate report
          </button>
        )}
      </div>
    </div>
  )
}
