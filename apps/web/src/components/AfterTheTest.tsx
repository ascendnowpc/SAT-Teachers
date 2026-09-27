import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { DiagnosticGrid } from './DiagnosticGrid'
import { Notice } from './ui'
import { useReportGeneration } from '../hooks/useReportGeneration'
import { rowsComplete, rowsFrom, type DiagnosticRow } from '../lib/diagnostic'
import { alignmentFor, loadExtraction, type ContextExtractionRow } from '../lib/contextExtraction'
import { transcriptDocx } from '../lib/docx'
import { readingIsStale, whoDid } from '../lib/recording'
import { parseTranscript } from '../lib/transcript'
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
  // The grid is the subject's, so there is nothing to show until the session
  // that says which subject has loaded.
  const [gridRows, setGridRows] = useState<DiagnosticRow[]>([])
  const [report, setReport] = useState<SessionReportRow | null>(null)
  const [transcript, setTranscript] = useState<SessionTranscript | null>(null)
  const [extraction, setExtraction] = useState<ContextExtractionRow | null>(null)
  const [loading, setLoading] = useState(true)
  /** Null until the teacher types one; the suggestion stands until they do. */
  const [offsetOverride, setOffsetOverride] = useState<string | null>(null)
  /** The alignment control is folded away until something looks wrong. */
  const [showAlignment, setShowAlignment] = useState(false)

  const load = useCallback(async () => {
    const [n, m, t, e] = await Promise.all([
      supabase.from('session_domain_notes').select('*').eq('session_id', sessionId),
      supabase.from('session_reports').select('*').eq('session_id', sessionId).maybeSingle(),
      supabase.from('session_transcripts').select('*').eq('session_id', sessionId).maybeSingle(),
      loadExtraction(sessionId),
    ])
    setGridRows(rowsFrom(toRows<DomainNote>(n.data), session?.subject))
    setReport(row<SessionReportRow>(m.data))
    setTranscript(row<SessionTranscript>(t.data))
    setExtraction(e)
    setLoading(false)
  }, [sessionId, session?.subject])

  useEffect(() => {
    void load()
  }, [load])

  const submitted = report?.form_submitted_at ?? null
  const generated = report?.generated_at ?? null
  const started = rowsComplete(gridRows)
  // The transcript is replaced in place, and its created_at moves with its text
  // (0048), so one dated after the reading is a different recording than the
  // one that was read.
  const stale = readingIsStale(extraction, transcript)

  // Generating the report, which reads the recording first. The same hook the
  // admin's session page uses, so the button means one thing from both seats.
  const { stage, error, readingFailed, read, generate, generateWithoutReading } =
    useReportGeneration({
      sessionId,
      session,
      items,
      transcriptBody: transcript?.body ?? '',
      current: Boolean(extraction) && !stale,
      offset: offsetOverride === null ? undefined : Number(offsetOverride),
      reload: load,
    })

  // suggestOffset tries every offset up to twenty minutes against every
  // question, so this is a scan over the whole transcript rather than a lookup —
  // not something to redo on each keystroke elsewhere on the console.
  const alignment = useMemo(
    () => alignmentFor(session, items, transcript?.body ?? ''),
    [session, items, transcript],
  )

  const turns = useMemo(() => parseTranscript(transcript?.body ?? '').lines, [transcript])

  // An admin can change the transcript and generate the report too (0048). When
  // one has, the teacher is told, rather than finding a new timestamp on their
  // own work and no name on it. Their own doing is not announced back to them.
  const someoneElse = (id: string | null | undefined) => {
    const who = session
      ? whoDid(id, {
          me: session.teacher_id,
          teacherId: session.teacher_id,
          teacherName: session.teacher?.full_name,
        })
      : null
    return who && who !== 'you' ? who : null
  }
  const transcriptBy = someoneElse(transcript?.uploaded_by)
  const submittedBy = someoneElse(report?.form_submitted_by)
  const generatedBy = someoneElse(report?.generated_by)

  /** The transcript as a Word file, named after the student and the lesson. */
  function downloadTranscript() {
    if (!transcript?.body) return
    const who = session?.student?.full_name ?? 'student'
    const when = (session?.scheduled_at ?? '').slice(0, 10)
    const title = `Lesson transcript — ${who}${when ? ` — ${when}` : ''}`
    const url = URL.createObjectURL(transcriptDocx(title, transcript.body))
    const link = document.createElement('a')
    link.href = url
    link.download = `${title.replace(/[^\w — -]+/g, '')}.docx`
    link.click()
    // Revoked on the next tick rather than immediately: Safari has not started
    // the download by the time click() returns.
    setTimeout(() => URL.revokeObjectURL(url), 0)
  }

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
        <span className="badge badge-ok">
          Submitted {formatUtc(submitted)}
          {submittedBy && ` by ${submittedBy}`}
        </span>
        <span className="spring" />
        <Link className="btn btn-ghost btn-sm" to={`/sessions/${sessionId}/diagnostic`}>
          Edit
        </Link>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <DiagnosticGrid rows={gridRows} readOnly />

      <div className="section-title step-sub">Comments on the session</div>
      <p className="step-text">{report?.teacher_reflection}</p>

      {/* The transcript itself, not a character count. A teacher checking a
          report against the lesson needs the words in front of them, and the
          record they keep of a lesson is a document — so it is both, on the
          page and in a file they can save. */}
      <div className="step-head step-sub">
        <div className="section-title" style={{ marginBottom: 0 }}>
          Fathom transcript
        </div>
        <span className="spring" />
        {transcript?.body && (
          <button type="button" className="btn btn-ghost btn-sm" onClick={downloadTranscript}>
            Download as Word
          </button>
        )}
      </div>
      {transcript?.body ? (
        <details className="transcript-read">
          <summary>
            {transcript.filename ?? 'Pasted in'} · {turns.length}{' '}
            {turns.length === 1 ? 'turn' : 'turns'}
            {turns.length > 0 && ` · ${formatClock(turns[turns.length - 1].at)} long`}
            {transcriptBy && ` · last changed by ${transcriptBy}, ${formatUtc(transcript.created_at)}`}
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
        <p className="step-text muted">Nothing pasted in yet.</p>
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
        {generated && (
          <span className="badge badge-ok">
            Generated {formatUtc(generated)}
            {generatedBy && ` by ${generatedBy}`}
          </span>
        )}
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
