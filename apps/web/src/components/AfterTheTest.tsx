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
 * and only then is there a report to generate. It sits above the board, because
 * after the lesson this is the work and the answers are the reference. The
 * report is not something that quietly happens when the boxes are full; the
 * teacher presses the button, and until they do there is nothing to press it
 * with.
 *
 * There is one button. Reading the recording used to be a second one beside it,
 * and a teacher who did not press that one got a report with no reading in it
 * that took a second to make — which reads, correctly, as a report with no
 * model anywhere near it. Generating now does the reading, and the button says
 * which of the two it is doing.
 */
/** "2:30" — where the lesson is taken to start in the recording. */
function formatClock(seconds: number): string {
  return `${Math.floor(seconds / 60)}:${String(seconds % 60).padStart(2, '0')}`
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
  /** What the button is doing, so it can say so rather than just spin. */
  const [stage, setStage] = useState<'idle' | 'reading' | 'generating'>('idle')
  /** Null until the teacher types one; the suggestion stands until they do. */
  const [offsetOverride, setOffsetOverride] = useState<string | null>(null)
  /** The alignment control is folded away until something looks wrong. */
  const [showAlignment, setShowAlignment] = useState(false)
  const [error, setError] = useState<string | null>(null)
  /** Set when the reading failed, so the teacher can go ahead without it. */
  const [readingFailed, setReadingFailed] = useState(false)

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

  /** The model call. Returns false when it failed, having said why. */
  async function read(): Promise<boolean> {
    setStage('reading')
    try {
      await readRecording({
        sessionId,
        session,
        items,
        transcriptBody: transcript?.body ?? '',
        offset: offsetOverride === null ? undefined : Number(offsetOverride),
      })
      await load()
      setReadingFailed(false)
      return true
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
      setReadingFailed(true)
      return false
    } finally {
      setStage('idle')
    }
  }

  /** Stamps the report. Separated out because it is also the fallback below. */
  async function stamp() {
    setStage('generating')
    const { error: err } = await supabase.rpc('generate_report', { p_session: sessionId })
    if (err) setError(err.message)
    await load()
    setStage('idle')
  }

  /**
   * Generating the report — which now includes reading the recording.
   *
   * These were two buttons, and that was the whole misunderstanding: pressing
   * Generate report stamped a timestamp in under a second and never called the
   * model, so a teacher who never happened to press the other button got a
   * report with no reading in it and no way to tell that was what had happened.
   * The reading is not an optional extra step. It runs here, first, and only if
   * it fails does the teacher get the choice of going ahead without it.
   */
  async function generate() {
    setError(null)
    if (!extraction || stale) {
      const ok = await read()
      if (!ok) return
    }
    await stamp()
  }

  /** Explicitly going ahead on the teacher's form and the numbers alone. */
  async function generateWithoutReading() {
    setError(null)
    setReadingFailed(false)
    await stamp()
  }

  // suggestOffset tries every offset up to twenty minutes against every
  // question, so this is a scan over the whole transcript rather than a lookup —
  // not something to redo on each keystroke elsewhere on the console.
  const alignment = useMemo(
    () => alignmentFor(session, items, transcript?.body ?? ''),
    [session, items, transcript],
  )

  if (loading) return null

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

      <div className="section-title step-sub">The recording</div>
      {extraction && !stale ? (
        <p className="step-text muted">
          Read by {extraction.model} on {formatUtc(extraction.created_at)} · {covered} of {total}{' '}
          questions covered
          {extraction.drops.length > 0 && ` · ${extraction.drops.length} unquotable claims dropped`}
        </p>
      ) : (
        <p className="step-text muted">
          Not read yet. Generating the report reads it — this takes a minute or so.
        </p>
      )}

      {stale && (
        <Notice kind="info">
          The transcript was replaced after the last reading. Generating again reads the new one.
        </Notice>
      )}

      {/* Folded away. The alignment is guessed correctly for a lesson that runs
          question by question, and a teacher who never has to think about it
          should never have to read about it. It opens when it is wrong. */}
      <div className="step-actions">
        <button
          type="button"
          className="btn btn-ghost btn-sm"
          onClick={() => setShowAlignment((open) => !open)}
        >
          {showAlignment ? 'Hide' : 'Quotes on the wrong questions?'}
        </button>
      </div>

      {showAlignment && (
        <>
          <div className="offset-row">
            <label htmlFor="read-offset">First question discussed at</label>
            <input
              id="read-offset"
              type="number"
              min={0}
              step={15}
              value={offsetOverride ?? String(alignment.offset)}
              onChange={(e) => setOffsetOverride(e.target.value)}
            />
            <span className="muted">
              seconds in ({formatClock(Number(offsetOverride ?? alignment.offset) || 0)})
            </span>
            {offsetOverride !== null && (
              <button type="button" className="btn btn-ghost btn-sm" onClick={() => setOffsetOverride(null)}>
                Reset
              </button>
            )}
          </div>
          <p className="step-text muted">
            Set this if the quotes come out against the wrong questions — it is where the lesson
            starts in the recording.
          </p>
        </>
      )}

      <div className="step-actions">
        <button
          type="button"
          className="btn btn-primary"
          disabled={stage !== 'idle' || !transcript?.body}
          onClick={() => void generate()}
        >
          {stage === 'reading'
            ? 'Reading the recording…'
            : stage === 'generating'
              ? 'Generating…'
              : generated
                ? 'Generate again'
                : 'Generate report'}
        </button>
        {generated && (
          <Link className="btn btn-ghost" to={`/sessions/${sessionId}/report`}>
            View report
          </Link>
        )}
        {generated && <span className="badge badge-ok">Generated {formatUtc(generated)}</span>}
        {/* Generating reuses a reading that is still of this transcript rather
            than spending another model call on the same recording. This is the
            way to force one — after moving the offset, usually. */}
        {extraction && !stale && (
          <button
            type="button"
            className="btn btn-ghost btn-sm"
            disabled={stage !== 'idle'}
            onClick={() => void read()}
          >
            Read the recording again
          </button>
        )}
      </div>

      {readingFailed && (
        <div className="step-actions">
          <span className="muted">
            The recording could not be read. You can still generate the report from your form and
            the answers.
          </span>
          <button
            type="button"
            className="btn btn-ghost btn-sm"
            disabled={stage !== 'idle'}
            onClick={() => void generateWithoutReading()}
          >
            Generate without the recording
          </button>
        </div>
      )}
    </div>
  )
}
