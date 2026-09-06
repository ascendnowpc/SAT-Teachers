import { useCallback, useEffect, useMemo, useState, type ChangeEvent } from 'react'
import { Link, useParams } from 'react-router-dom'
import { DiagnosticGrid } from '../components/DiagnosticGrid'
import { IconBack } from '../components/icons'
import { Field, Notice, Textarea } from '../components/ui'
import { SESSION_SELECT } from '../hooks/useLiveSession'
import { subjectLabel } from '../lib/constants'
import {
  rowsComplete,
  rowsFrom,
  summariseProblems,
  validate,
  type DiagnosticRow,
  type Problem,
  type RowField,
} from '../lib/diagnostic'
import { formatDuration } from '../lib/report'
import { row, rows as toRows, supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import { parseTranscript } from '../lib/transcript'
import type { DomainNote, Session, SessionReportRow, SessionTranscript } from '../lib/types'

/**
 * The teacher's diagnostic form.
 *
 * This is the step the teachers actually take, in the order they take it: the
 * session ends with no score and no report, they fill in the English reflection
 * grid while it is still fresh, write what they made of the hour, and drop in
 * the Fathom transcript. The report is generated from the two of them
 * afterwards — nothing on this page computes, scores or concludes anything.
 *
 * Every field is required, which is the whole point of it: a report generated
 * from a form with two domains filled in reads as a judgement about four. The
 * grid marks what is missing and the button says how much, but a part-filled
 * form still saves as a draft, because nobody types four domains of notes in
 * one sitting without wanting to put it down halfway.
 */
export function DiagnosticForm() {
  const { id = '' } = useParams()

  const [session, setSession] = useState<Session | null>(null)
  const [loading, setLoading] = useState(true)

  const [gridRows, setGridRows] = useState<DiagnosticRow[]>(rowsFrom([]))
  const [reflection, setReflection] = useState('')
  const [body, setBody] = useState('')
  const [filename, setFilename] = useState<string | null>(null)
  const [submittedAt, setSubmittedAt] = useState<string | null>(null)

  // Empty until the teacher tries to hand the form in. Marking sixteen empty
  // cells red on arrival tells them nothing they do not already know.
  const [problems, setProblems] = useState<Problem[]>([])
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [saved, setSaved] = useState<'draft' | 'submitted' | null>(null)

  const load = useCallback(async () => {
    const [s, n, m, t] = await Promise.all([
      supabase.from('sessions').select(SESSION_SELECT).eq('id', id).maybeSingle(),
      supabase.from('session_domain_notes').select('*').eq('session_id', id),
      supabase.from('session_reports').select('*').eq('session_id', id).maybeSingle(),
      supabase.from('session_transcripts').select('*').eq('session_id', id).maybeSingle(),
    ])

    setSession(row<Session>(s.data))
    setGridRows(rowsFrom(toRows<DomainNote>(n.data)))

    const report = row<SessionReportRow>(m.data)
    setReflection(report?.teacher_reflection ?? '')
    setSubmittedAt(report?.form_submitted_at ?? null)

    const transcript = row<SessionTranscript>(t.data)
    if (transcript) {
      setBody(transcript.body)
      setFilename(transcript.filename)
    }

    setLoading(false)
  }, [id])

  useEffect(() => {
    void load()
  }, [load])

  const form = useMemo(
    () => ({ rows: gridRows, reflection, transcript: body }),
    [gridRows, reflection, body],
  )
  const outstanding = useMemo(() => validate(form), [form])
  const parsed = useMemo(() => (body.trim() ? parseTranscript(body) : null), [body])
  const done = rowsComplete(gridRows)

  function setCell(domain: string, field: RowField, value: string) {
    setSaved(null)
    setGridRows((prev) =>
      prev.map((r) =>
        r.domain !== domain
          ? r
          : field === 'performance'
            ? { ...r, performance: value as DiagnosticRow['performance'] }
            : { ...r, [field]: value },
      ),
    )
    // A cell that has just been filled stops being a complaint immediately,
    // rather than staying red until the next attempt.
    setProblems((prev) =>
      prev.filter((p) => !(p.where === 'row' && p.domain === domain && p.field === field)),
    )
  }

  async function onFile(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return
    setSaved(null)
    setFilename(file.name)
    setBody(await file.text())
    setProblems((prev) => prev.filter((p) => p.where !== 'transcript'))
  }

  /** Writes whatever is on screen. Required-ness is checked by the caller. */
  async function persist() {
    const { error: e1 } = await supabase.from('session_domain_notes').upsert(
      gridRows.map((r) => ({
        session_id: id,
        domain: r.domain,
        performance: r.performance,
        strengths: r.strengths.trim() || null,
        gaps: r.gaps.trim() || null,
        targets: r.targets.trim() || null,
      })),
      { onConflict: 'session_id,domain' },
    )
    if (e1) throw new Error(e1.message)

    const { error: e2 } = await supabase
      .from('session_reports')
      .upsert({ session_id: id, teacher_reflection: reflection.trim() || null }, { onConflict: 'session_id' })
    if (e2) throw new Error(e2.message)

    // The table will not hold an empty transcript, and a draft is allowed to
    // be without one — so nothing is written until there is something to write.
    if (body.trim()) {
      const { error: e3 } = await supabase.from('session_transcripts').upsert(
        { session_id: id, source: 'fathom', filename, body },
        { onConflict: 'session_id' },
      )
      if (e3) throw new Error(e3.message)
    }
  }

  async function save(submit: boolean) {
    setError(null)
    setSaved(null)

    if (submit) {
      const found = validate(form)
      setProblems(found)
      if (found.length > 0) {
        setError(summariseProblems(found))
        return
      }
    }

    setBusy(true)
    try {
      await persist()
      if (submit) {
        const { error: err } = await supabase.rpc('submit_diagnostic_form', { p_session: id })
        if (err) throw new Error(err.message)
      }
      setSaved(submit ? 'submitted' : 'draft')
      await load()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save the form.')
    } finally {
      setBusy(false)
    }
  }

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const student = session.student?.full_name ?? 'the student'

  return (
    <div className="page page-wide">
      <Link className="back-link" to={`/sessions/${id}`}>
        <IconBack /> Session
      </Link>

      <div className="page-head">
        <div>
          <h1>Diagnostic form</h1>
          <p className="sub">
            {student} · {subjectLabel(session.subject)} · {formatUtc(session.scheduled_at)}
          </p>
        </div>
        <div className="spring" />
        {submittedAt ? (
          <span className="badge badge-ok">Submitted {formatUtc(submittedAt)}</span>
        ) : (
          <span className="badge badge-neutral">
            {done} of {gridRows.length} domains filled in
          </span>
        )}
      </div>

      <Notice kind="info">
        Nothing is scored yet. Fill the reflection grid in while the session is fresh, write what
        you made of it, and add the Fathom transcript — the diagnostic report is generated from
        those and shared with {student.split(' ')[0]} and their parent afterwards.
      </Notice>

      {error && <Notice kind="error">{error}</Notice>}
      {saved === 'draft' && <Notice kind="ok">Saved as a draft. Nothing has been handed in yet.</Notice>}
      {saved === 'submitted' && (
        <Notice kind="ok">
          Form submitted. Everything the report needs from you is in — come back and edit it any
          time before the report goes out.
        </Notice>
      )}

      {/* ------------------------------------------------ the grid --------- */}
      <div className="card card-pad">
        <div className="section-title">English reflection grid</div>
        <p className="card-note">
          The same grid as the paper form. Domain and Skill Focus are printed on it; the tick or
          cross, the strengths, the gaps and the targets are yours. The targets start as the
          form's own — edit them into what {student.split(' ')[0]} actually needs.
        </p>
        <DiagnosticGrid
          rows={gridRows}
          problems={problems}
          disabled={busy}
          onChange={setCell}
        />
      </div>

      {/* ---------------------------------------------- the comments ------- */}
      <div className="card card-pad">
        <div className="section-title">Your comments on the session</div>
        <Field
          label="Comments and reflection"
          required
          hint="How the hour went as a whole — pace, engagement, how they worked through it, anything the grid has nowhere to put."
        >
          <Textarea
            rows={6}
            value={reflection}
            className={problems.some((p) => p.where === 'reflection') ? 'bad' : ''}
            aria-invalid={problems.some((p) => p.where === 'reflection') || undefined}
            onChange={(e) => {
              setSaved(null)
              setReflection(e.target.value)
              setProblems((prev) => prev.filter((p) => p.where !== 'reflection'))
            }}
          />
        </Field>
      </div>

      {/* --------------------------------------------- the transcript ------ */}
      <div className="card card-pad">
        <div className="section-title">Fathom transcript</div>

        <div className="upload-row">
          <label className="btn btn-ghost btn-sm">
            Choose file
            <input
              type="file"
              accept=".txt,.vtt,.md,text/plain"
              onChange={(e) => void onFile(e)}
              style={{ display: 'none' }}
            />
          </label>
          <span className="muted">{filename ?? 'Paste the transcript below, or upload the file.'}</span>
          <span className="spring" />
          {parsed && parsed.lines.length > 0 && (
            <span className="badge badge-sky">
              {parsed.lines.length} turns · {parsed.speakers.length} speakers ·{' '}
              {formatDuration(parsed.duration)}
            </span>
          )}
        </div>

        <Field
          label="Transcript"
          required
          hint="Straight out of Fathom, timestamps and all — they are what put each quote under the question it was about."
        >
          <Textarea
            rows={10}
            value={body}
            className={problems.some((p) => p.where === 'transcript') ? 'bad' : ''}
            aria-invalid={problems.some((p) => p.where === 'transcript') || undefined}
            placeholder={'@2:24 - Malya Rastogi (…)\nSo we’ll do it one by one, right?'}
            onChange={(e) => {
              setSaved(null)
              setBody(e.target.value)
              setProblems((prev) => prev.filter((p) => p.where !== 'transcript'))
            }}
          />
        </Field>

        {body.trim() && parsed && parsed.lines.length === 0 && (
          <Notice kind="info">
            No Fathom timestamps in this — nothing here reads as <code>@12:34 - Name</code>. It will
            save, but the report cannot line quotes up against questions without them.
          </Notice>
        )}
      </div>

      <div className="form-actions">
        <Link className="btn btn-ghost" to={`/sessions/${id}`}>
          Cancel
        </Link>
        <button type="button" className="btn btn-ghost" disabled={busy} onClick={() => void save(false)}>
          Save draft
        </button>
        <button type="button" className="btn btn-primary" disabled={busy} onClick={() => void save(true)}>
          {submittedAt ? 'Resubmit form' : 'Submit form'}
          {outstanding.length > 0 && <span className="btn-count">{outstanding.length} left</span>}
        </button>
      </div>
    </div>
  )
}
