import { useMemo, useState, type ChangeEvent } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useReadAgain } from '../hooks/useReadAgain'
import { useReportGeneration } from '../hooks/useReportGeneration'
import type { ContextExtractionRow } from '../lib/contextExtraction'
import { STALE_READING, readingStaleness, whoDid } from '../lib/recording'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import { parseTranscript } from '../lib/transcript'
import type { Session, SessionItem, SessionReportRow, SessionTranscript } from '../lib/types'
import { PcDelivery } from './PcDelivery'
import { Field, Notice, Textarea } from './ui'

/**
 * The recording and the report, from the admin's seat.
 *
 * An admin can put a session's transcript in or correct it, and generate the
 * report — the same button, doing the same thing, as the one on the teacher's
 * console, because it is the same hook — and publish it, as the teacher can
 * (0050).
 *
 * A report is made from the diagnostic form, so until the form is handed in
 * there is nothing to generate, and this says so — with the way to the form,
 * which an admin can fill in and hand in too (0049).
 *
 * A reading is taken against the transcript and the form. Correcting the
 * transcript, or handing the form in again, makes it out of date — it quotes
 * lines the recording no longer has, or weighs evidence against a form that
 * has since changed — so the page says so, and generating reads it again
 * first. Handing the form in again from here does both on the way back.
 */
export function AdminRecording({
  session,
  items,
  transcript,
  extraction,
  report,
  onChanged,
}: {
  session: Session
  items: SessionItem[]
  transcript: SessionTranscript | null
  extraction: ContextExtractionRow | null
  report: SessionReportRow | null
  /** Reloads the transcript, the reading and the report row. */
  onChanged: () => Promise<void>
}) {
  const { profile } = useAuth()
  const known = {
    me: profile?.id,
    teacherId: session.teacher_id,
    teacherName: session.teacher?.full_name,
  }

  const [editing, setEditing] = useState(false)
  const [body, setBody] = useState('')
  const [filename, setFilename] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const [saveError, setSaveError] = useState<string | null>(null)

  const staleness = readingStaleness(extraction, transcript, report?.form_submitted_at)
  const stale = staleness !== null
  const gen = useReportGeneration({
    sessionId: session.id,
    session,
    items,
    transcriptBody: transcript?.body ?? '',
    current: Boolean(extraction) && !stale,
    reload: onChanged,
  })

  // Back from handing the form in again: read the recording against the new
  // form and generate the report from it. The report row is what says the
  // page has loaded — there is one once a form has been handed in.
  useReadAgain(report !== null, gen.generate)

  const shown = editing ? body : (transcript?.body ?? '')
  const parsed = useMemo(() => (shown.trim() ? parseTranscript(shown) : null), [shown])
  const unchanged = editing && body === (transcript?.body ?? '')

  function startEditing() {
    setBody(transcript?.body ?? '')
    setFilename(transcript?.filename ?? null)
    setSaveError(null)
    setEditing(true)
  }

  async function onFile(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return
    setFilename(file.name)
    setBody(await file.text())
  }

  async function save() {
    setSaving(true)
    setSaveError(null)
    const { error } = await supabase.from('session_transcripts').upsert(
      { session_id: session.id, source: transcript?.source ?? 'fathom', filename, body },
      { onConflict: 'session_id' },
    )
    setSaving(false)
    if (error) {
      setSaveError(error.message)
      return
    }
    setEditing(false)
    await onChanged()
  }

  const uploadedBy = whoDid(transcript?.uploaded_by, known)
  const generatedBy = whoDid(report?.generated_by, known)

  return (
    <div className="card card-pad">
      {/* ------------------------------------------------- the transcript --- */}
      <div className="step-head">
        <div className="section-title" style={{ marginBottom: 0 }}>
          Fathom transcript
        </div>
        <span className="spring" />
        {!editing && (
          <button type="button" className="btn btn-ghost btn-sm" onClick={startEditing}>
            {transcript ? 'Edit the transcript' : 'Add the transcript'}
          </button>
        )}
      </div>

      {saveError && <Notice kind="error">{saveError}</Notice>}

      {editing ? (
        <>
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
            <span className="muted">{filename ?? 'Paste it below, or upload the file.'}</span>
            <span className="spring" />
            {parsed && parsed.lines.length > 0 && (
              <span className="badge badge-sky">
                {plural(parsed.lines.length, 'turn')} · {plural(parsed.speakers.length, 'speaker')}
              </span>
            )}
          </div>

          <Field label="Transcript">
            <Textarea
              rows={14}
              value={body}
              placeholder={'2:24 - Malya Rastogi (…)\n  So we’ll do it one by one, right?'}
              onChange={(e) => setBody(e.target.value)}
            />
          </Field>

          {body.trim() && parsed && parsed.lines.length === 0 && (
            <Notice kind="info">
              No timestamps found (like <code>12:34 - Name</code>). Quotes won’t line up with questions.
            </Notice>
          )}
          {extraction && !stale && !unchanged && (
            <p className="step-text muted">
              Saving a change means the recording is read again on the next report.
            </p>
          )}

          <div className="step-actions">
            <button
              type="button"
              className="btn btn-primary btn-sm"
              disabled={saving || !body.trim() || unchanged}
              onClick={() => void save()}
            >
              {saving ? 'Saving…' : 'Save the transcript'}
            </button>
            <button
              type="button"
              className="btn btn-ghost btn-sm"
              disabled={saving}
              onClick={() => setEditing(false)}
            >
              Cancel
            </button>
          </div>
        </>
      ) : !transcript ? (
        <p className="sub">
          No transcript yet.
        </p>
      ) : (
        <>
          <p className="sub">
            {transcript.filename ?? 'Pasted in'} · {transcript.source} · uploaded{' '}
            {formatUtc(transcript.created_at)}
            {uploadedBy && ` by ${uploadedBy}`}
            {parsed && (
              <>
                {' '}
                · {plural(parsed.lines.length, 'turn')} · {parsed.speakers.join(', ')}
              </>
            )}
          </p>
          {extraction ? (
            <p className="sub" style={{ marginTop: 8 }}>
              Read {formatUtc(extraction.created_at)}
            </p>
          ) : (
            <p className="sub" style={{ marginTop: 8 }}>
              Not read yet — generating the report reads it.
            </p>
          )}
        </>
      )}

      {/* ----------------------------------------------------- the report --- */}
      <div className="step-head step-sub">
        <div className="section-title" style={{ marginBottom: 0 }}>
          The report
        </div>
        <span className="spring" />
        {report?.generated_at && (
          <span className="badge badge-ok">
            Generated {formatUtc(report.generated_at)}
            {generatedBy && ` by ${generatedBy}`}
          </span>
        )}
        {report?.published_at && (
          <span className="badge badge-ok">Published {formatUtc(report.published_at)}</span>
        )}
      </div>

      {!report?.form_submitted_at ? (
        <div className="step-actions">
          <span className="muted">
            Waiting for the diagnostic form.
          </span>
          <Link
            className="btn btn-ghost btn-sm"
            to={`/sessions/${session.id}/diagnostic`}
            state={{ back: `/admin/sessions/${session.id}` }}
          >
            Open the diagnostic form
          </Link>
        </div>
      ) : (
        <>
          {staleness && <Notice kind="info">{STALE_READING[staleness]}</Notice>}
          {gen.error && <Notice kind="error">{gen.error}</Notice>}

          <div className="step-actions">
            <button
              type="button"
              className="btn btn-primary"
              disabled={gen.stage !== 'idle' || !transcript?.body || editing}
              onClick={() => void gen.generate()}
            >
              {gen.stage === 'reading'
                ? 'Reading the recording…'
                : gen.stage === 'generating'
                  ? 'Generating…'
                  : report.generated_at
                    ? 'Generate again'
                    : 'Generate report'}
            </button>
            {/* Generating reuses a reading that is still of this transcript
                and this form rather than spending another model call on the
                same recording. This is the way to force one. */}
            {extraction && !stale && (
              <button
                type="button"
                className="btn btn-ghost btn-sm"
                disabled={gen.stage !== 'idle' || editing}
                onClick={() => void gen.read()}
              >
                Read the recording again
              </button>
            )}
            {/* Publishing is the admin's to do as well (0050). The editor is
                where it happens, for either seat: it saves the report's
                written text and publishes it in one step. */}
            {report.generated_at && (
              <Link className="btn btn-ghost btn-sm" to={`/sessions/${session.id}/report/edit`}>
                {report.published_at ? 'Edit the published report' : 'Write up and publish'}
              </Link>
            )}
          </div>

          <PcDelivery
            sessionId={session.id}
            generatedAt={report.generated_at}
            pcName={session.student?.pc ?? null}
            canResend
          />

          {gen.readingFailed && (
            <div className="step-actions">
              <span className="muted">
                The recording couldn’t be read.
              </span>
              <button
                type="button"
                className="btn btn-ghost btn-sm"
                disabled={gen.stage !== 'idle'}
                onClick={() => void gen.generateWithoutReading()}
              >
                Generate without the recording
              </button>
            </div>
          )}
        </>
      )}
    </div>
  )
}

function plural(n: number, word: string): string {
  return `${n} ${word}${n === 1 ? '' : 's'}`
}
