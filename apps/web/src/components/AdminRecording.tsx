import { useMemo, useState, type ChangeEvent } from 'react'
import { useAuth } from '../context/AuthContext'
import { useReportGeneration } from '../hooks/useReportGeneration'
import type { ContextExtractionRow } from '../lib/contextExtraction'
import { readingIsStale, whoDid } from '../lib/recording'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import { parseTranscript } from '../lib/transcript'
import type { Session, SessionItem, SessionReportRow, SessionTranscript } from '../lib/types'
import { Field, Notice, Textarea } from './ui'

/**
 * The recording and the report, from the admin's seat.
 *
 * Everything else on an admin's session page is there to be read. This is the
 * part that is not (0048): an admin can put a session's transcript in, or
 * correct it, and generate the report — the same button, doing the same thing,
 * as the one on the teacher's console, because it is the same hook.
 *
 * What stays the teacher's is the form and the publishing. A report is made
 * from the diagnostic form the teacher handed in, so until they have, there is
 * nothing to generate, and this says so rather than offering a button the
 * database would refuse.
 *
 * Correcting a transcript that has already been read makes the reading out of
 * date — it quotes lines the recording no longer has — so the page says so
 * before the save and after it, and generating again reads the new one first.
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

  const stale = readingIsStale(extraction, transcript)
  const gen = useReportGeneration({
    sessionId: session.id,
    session,
    items,
    transcriptBody: transcript?.body ?? '',
    current: Boolean(extraction) && !stale,
    reload: onChanged,
  })

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
              placeholder={'@2:24 - Malya Rastogi (…)\nSo we’ll do it one by one, right?'}
              onChange={(e) => setBody(e.target.value)}
            />
          </Field>

          {body.trim() && parsed && parsed.lines.length === 0 && (
            <Notice kind="info">
              No Fathom timestamps in this — nothing reads as <code>@12:34 - Name</code>. It saves,
              but the report cannot line quotes up against questions without them.
            </Notice>
          )}
          {extraction && !unchanged && (
            <p className="step-text muted">
              The recording was read on {formatUtc(extraction.created_at)}. Saving a change makes that
              reading out of date, and generating the report again reads the new transcript first.
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
          No transcript has been uploaded. The teacher's form cannot be handed in without one, so
          this session's report cannot be generated yet.
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
              Read by <strong>{extraction.model}</strong> on {formatUtc(extraction.created_at)},
              offset {extraction.offset_seconds}s. {extraction.drops.length} claim
              {extraction.drops.length === 1 ? '' : 's'} dropped for want of a verbatim quote.
            </p>
          ) : (
            <p className="sub" style={{ marginTop: 8 }}>
              The recording has not been read by the model. Generating the report reads it first.
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
      </div>

      {!report?.form_submitted_at ? (
        <p className="sub">
          A report is generated from the teacher's diagnostic form, and they have not handed it in
          yet. Once they have, it can be generated here.
        </p>
      ) : (
        <>
          {stale && (
            <Notice kind="info">
              The transcript was changed after the last reading. Generating again reads the new one.
            </Notice>
          )}
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
                rather than spending another model call on the same recording.
                This is the way to force one. */}
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
          </div>

          {gen.readingFailed && (
            <div className="step-actions">
              <span className="muted">
                The recording could not be read. The report can still be generated from the form and
                the answers.
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
