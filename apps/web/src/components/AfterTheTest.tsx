import { useCallback, useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { DiagnosticGrid } from './DiagnosticGrid'
import { Notice } from './ui'
import { rowsComplete, rowsFrom, type DiagnosticRow } from '../lib/diagnostic'
import { row, rows as toRows, supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { DomainNote, SessionReportRow, SessionTranscript } from '../lib/types'

/**
 * What the console offers once the test is over.
 *
 * There is an order to this and the screen keeps it. The test finishes and
 * there is one thing to do: fill the diagnostic form. Once it is in, the
 * console shows what was written — the grid, the comments, the transcript —
 * and only then is there a report to generate. The report is not something
 * that quietly happens when the boxes are full; the teacher presses the button,
 * and until they do there is nothing to press it with.
 */
export function AfterTheTest({ sessionId }: { sessionId: string }) {
  const [gridRows, setGridRows] = useState<DiagnosticRow[]>(rowsFrom([]))
  const [report, setReport] = useState<SessionReportRow | null>(null)
  const [transcript, setTranscript] = useState<SessionTranscript | null>(null)
  const [loading, setLoading] = useState(true)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    const [n, m, t] = await Promise.all([
      supabase.from('session_domain_notes').select('*').eq('session_id', sessionId),
      supabase.from('session_reports').select('*').eq('session_id', sessionId).maybeSingle(),
      supabase.from('session_transcripts').select('*').eq('session_id', sessionId).maybeSingle(),
    ])
    setGridRows(rowsFrom(toRows<DomainNote>(n.data)))
    setReport(row<SessionReportRow>(m.data))
    setTranscript(row<SessionTranscript>(t.data))
    setLoading(false)
  }, [sessionId])

  useEffect(() => {
    void load()
  }, [load])

  async function generate() {
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.rpc('generate_report', { p_session: sessionId })
    if (err) setError(err.message)
    await load()
    setBusy(false)
  }

  if (loading) return null

  const submitted = report?.form_submitted_at ?? null
  const generated = report?.generated_at ?? null
  const started = rowsComplete(gridRows)

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
