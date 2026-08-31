import { useCallback, useEffect, useMemo, useState, type ChangeEvent } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { Field, Notice, Select, Textarea } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import { sectionLabel, skillLabel } from '../lib/constants'
import { DOMAIN_ORDER, buildGrid, recommendedPriority } from '../lib/grid'
import { buildReport, formatDuration } from '../lib/report'
import { rows, supabase } from '../lib/supabase'
import {
  DEFAULT_OFFSET_SECONDS,
  linesIn,
  parseTranscript,
  windowsFor,
  type Transcript,
} from '../lib/transcript'
import type { DomainNote, SessionReportRow, SessionTranscript } from '../lib/types'

/**
 * Writing up the report after the session.
 *
 * The flow is: the session finishes, the teacher drops in the Fathom
 * transcript, and the page lines the recording up against the questions so each
 * one carries what was actually said about it. The answer data fills the
 * computed half of the grid on its own; the teacher writes the two observed
 * columns with the conversation in front of them rather than from memory, and
 * publishes.
 */
export function ReportEdit() {
  const { id = '' } = useParams()
  const navigate = useNavigate()
  const { session, items, loading } = useLiveSession(id, { withAssessments: true })

  const [transcript, setTranscript] = useState<SessionTranscript | null>(null)
  const [draftBody, setDraftBody] = useState('')
  const [filename, setFilename] = useState<string | null>(null)
  const [offset, setOffset] = useState(DEFAULT_OFFSET_SECONDS)

  const [notes, setNotes] = useState<Record<string, { strengths: string; gaps: string }>>({})
  const [meta, setMeta] = useState<Partial<SessionReportRow>>({})

  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [saved, setSaved] = useState(false)

  const load = useCallback(async () => {
    const [t, n, m] = await Promise.all([
      supabase.from('session_transcripts').select('*').eq('session_id', id).maybeSingle(),
      supabase.from('session_domain_notes').select('*').eq('session_id', id),
      supabase.from('session_reports').select('*').eq('session_id', id).maybeSingle(),
    ])
    const tr = (t.data as SessionTranscript | null) ?? null
    setTranscript(tr)
    if (tr) setDraftBody(tr.body)
    const next: Record<string, { strengths: string; gaps: string }> = {}
    for (const row of rows<DomainNote>(n.data)) {
      next[row.domain] = { strengths: row.strengths ?? '', gaps: row.gaps ?? '' }
    }
    setNotes(next)
    setMeta((m.data as SessionReportRow | null) ?? {})
  }, [id])

  useEffect(() => {
    void load()
  }, [load])

  const report = useMemo(() => buildReport(items), [items])
  const grid = useMemo(
    () =>
      buildGrid(
        report,
        Object.entries(notes).map(([domain, v]) => ({
          domain,
          strengths: v.strengths,
          gaps: v.gaps,
        })),
      ),
    [report, notes],
  )

  const parsed: Transcript | null = useMemo(
    () => (draftBody.trim() ? parseTranscript(draftBody) : null),
    [draftBody],
  )

  // Each question's slice of the recording, so a quote can be attached to the
  // question it was actually about.
  const windows = useMemo(() => {
    if (!parsed) return new Map()
    return windowsFor(
      items.map((i) => ({ id: i.id, startedAt: i.first_viewed_at ?? i.published_at })),
      parsed.duration,
      offset,
    )
  }, [parsed, items, offset])

  function setNote(domain: string, field: 'strengths' | 'gaps', value: string) {
    setNotes((prev) => ({
      ...prev,
      [domain]: { ...(prev[domain] ?? { strengths: '', gaps: '' }), [field]: value },
    }))
  }

  async function onFile(e: ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return
    setFilename(file.name)
    setDraftBody(await file.text())
  }

  async function saveTranscript() {
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.from('session_transcripts').upsert(
      {
        session_id: id,
        source: 'fathom',
        filename: filename ?? transcript?.filename ?? null,
        body: draftBody,
      },
      { onConflict: 'session_id' },
    )
    if (err) setError(err.message)
    await load()
    setBusy(false)
  }

  async function save(publish: boolean) {
    setBusy(true)
    setError(null)
    setSaved(false)
    try {
      const rowsToWrite = Object.entries(notes)
        .filter(([, v]) => v.strengths.trim() || v.gaps.trim())
        .map(([domain, v]) => ({
          session_id: id,
          domain,
          strengths: v.strengths.trim() || null,
          gaps: v.gaps.trim() || null,
        }))

      if (rowsToWrite.length > 0) {
        const { error: e1 } = await supabase
          .from('session_domain_notes')
          .upsert(rowsToWrite, { onConflict: 'session_id,domain' })
        if (e1) throw new Error(e1.message)
      }

      const { error: e2 } = await supabase.from('session_reports').upsert(
        {
          session_id: id,
          time_management: meta.time_management?.trim() || null,
          engagement: meta.engagement?.trim() || null,
          practice_priority: meta.practice_priority || null,
          summary: meta.summary?.trim() || null,
        },
        { onConflict: 'session_id' },
      )
      if (e2) throw new Error(e2.message)

      if (publish) {
        const { error: e3 } = await supabase.rpc('publish_report', { p_session: id })
        if (e3) throw new Error(e3.message)
        navigate(`/sessions/${id}/report`)
        return
      }
      setSaved(true)
      await load()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save the report.')
    } finally {
      setBusy(false)
    }
  }

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const suggested = recommendedPriority(report)

  return (
    <div className="page page-wide">
      <Link className="back-link" to={`/sessions/${id}/report`}>
        <IconBack /> Report
      </Link>

      <div className="page-head">
        <div>
          <h1>Write up the report</h1>
          <p className="sub">
            {session.student?.full_name} · {report.correct}/{report.total} correct ·{' '}
            {formatDuration(report.seconds)} on questions
          </p>
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {saved && <Notice kind="ok">Saved as a draft.</Notice>}

      {/* ------------------------------------------------------ transcript -- */}
      <div className="card card-pad">
        <div className="section-title">Recording transcript</div>

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
          <span className="muted">
            {filename ?? transcript?.filename ?? 'Paste the Fathom transcript below, or upload it.'}
          </span>
          <span className="spring" />
          {parsed && (
            <span className="badge badge-sky">
              {parsed.lines.length} turns · {parsed.speakers.length} speakers ·{' '}
              {formatDuration(parsed.duration)}
            </span>
          )}
          <button
            type="button"
            className="btn btn-primary btn-sm"
            disabled={busy || !draftBody.trim()}
            onClick={() => void saveTranscript()}
          >
            {transcript ? 'Replace' : 'Save transcript'}
          </button>
        </div>

        <Textarea
          rows={6}
          value={draftBody}
          onChange={(e) => setDraftBody(e.target.value)}
          placeholder="@2:24 - Malya Rastogi (…)&#10;So we'll do it one by one, right?"
          aria-label="Transcript"
        />

        {parsed && parsed.lines.length > 0 && (
          <div className="offset-row">
            <label htmlFor="offset">First question starts at</label>
            <input
              id="offset"
              className="input"
              type="number"
              min={0}
              step={15}
              value={offset}
              onChange={(e) => setOffset(Number(e.target.value))}
              style={{ width: 110 }}
            />
            <span className="muted">
              seconds into the recording — Fathom starts before the lesson does, and this is what
              lines the quotes up with the right questions.
            </span>
          </div>
        )}
      </div>

      {/* --------------------------------------------- what was said, per Q -- */}
      {parsed && parsed.lines.length > 0 && (
        <div className="card card-pad">
          <div className="section-title">What was said, question by question</div>
          <div className="qtalk">
            {report.attempts.map((a) => {
              const w = windows.get(a.itemId)
              const said = w ? linesIn(parsed, w) : []
              return (
                <details key={a.itemId} className="qtalk-row">
                  <summary>
                    <span className={`badge ${a.correct ? 'badge-ok' : 'badge-bad'}`}>
                      Q{a.sequence}
                    </span>
                    <span className="sk">{skillLabel(a.skill) ?? '—'}</span>
                    <span className="muted">{formatDuration(a.seconds)}</span>
                    <span className="spring" />
                    <span className="muted">{said.length} turns</span>
                  </summary>
                  <div className="qtalk-body">
                    {said.length === 0 ? (
                      <p className="muted">
                        Nothing lines up here — check the offset above.
                      </p>
                    ) : (
                      said.map((l, i) => (
                        <p key={i} className="qtalk-line">
                          <span className="who">{l.speaker}</span>
                          {l.text}
                        </p>
                      ))
                    )}
                  </div>
                </details>
              )
            })}
          </div>
        </div>
      )}

      {/* ------------------------------------------------------- the grid --- */}
      <div className="card card-pad">
        <div className="section-title">Strengths and gaps, by domain</div>
        <div className="note-grid">
          {grid.map((r) => (
            <div key={r.domain} className="note-row">
              <div className="note-head">
                <b>{r.label}</b>
                <span className="muted">
                  {r.total === 0 ? 'not covered' : `${r.correct}/${r.total}`}
                </span>
                {r.skills.map((s) => (
                  <span key={s.key} className="badge badge-neutral">
                    {s.label} {s.correct}/{s.total}
                  </span>
                ))}
              </div>
              <div className="note-cols">
                <Field label="Strengths observed">
                  <Textarea
                    rows={2}
                    value={notes[r.domain]?.strengths ?? ''}
                    onChange={(e) => setNote(r.domain, 'strengths', e.target.value)}
                  />
                </Field>
                <Field label="Gaps observed">
                  <Textarea
                    rows={2}
                    value={notes[r.domain]?.gaps ?? ''}
                    onChange={(e) => setNote(r.domain, 'gaps', e.target.value)}
                  />
                </Field>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* -------------------------------------------------- the summary ----- */}
      <div className="card card-pad">
        <div className="section-title">Overall diagnostic summary</div>
        <Field label="Time management" hint="The pace numbers are computed; this is your read of them.">
          <Textarea
            rows={2}
            value={meta.time_management ?? ''}
            onChange={(e) => setMeta({ ...meta, time_management: e.target.value })}
          />
        </Field>
        <Field label="Engagement / confidence">
          <Textarea
            rows={2}
            value={meta.engagement ?? ''}
            onChange={(e) => setMeta({ ...meta, engagement: e.target.value })}
          />
        </Field>
        <Field
          label="Recommended practice priority"
          hint={
            suggested
              ? `The answers point at ${sectionLabel(suggested)}.`
              : 'Nothing stands out from the answers.'
          }
        >
          <Select
            value={meta.practice_priority ?? ''}
            onChange={(e) => setMeta({ ...meta, practice_priority: e.target.value || null })}
          >
            <option value="">
              {suggested ? `From the answers — ${sectionLabel(suggested)}` : 'None'}
            </option>
            {DOMAIN_ORDER.map((k) => (
              <option key={k} value={k}>
                {sectionLabel(k)}
              </option>
            ))}
          </Select>
        </Field>
        <Field label="Anything else">
          <Textarea
            rows={3}
            value={meta.summary ?? ''}
            onChange={(e) => setMeta({ ...meta, summary: e.target.value })}
          />
        </Field>
      </div>

      <div className="form-actions">
        <Link className="btn btn-ghost" to={`/sessions/${id}/report`}>
          Cancel
        </Link>
        <button type="button" className="btn btn-ghost" disabled={busy} onClick={() => void save(false)}>
          Save draft
        </button>
        <button type="button" className="btn btn-primary" disabled={busy} onClick={() => void save(true)}>
          Publish report
        </button>
      </div>
    </div>
  )
}
