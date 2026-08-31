import { useCallback, useEffect, useMemo, useState, type ChangeEvent } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { Field, Notice, Select, Textarea } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import { sectionLabel, skillLabel } from '../lib/constants'
import {
  MARKER_LABELS,
  VERDICT_LABELS,
  analyseSession,
  inferRoles,
  suggestOffset,
  type Role,
  type SessionAnalysis,
  type Suggestion,
} from '../lib/analysis'
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
 * transcript, the page lines the recording up against the questions so each one
 * carries what was actually said about it, and it reads that conversation back
 * as findings — who explained what, who was talked out of a right answer, which
 * ticks nobody could account for.
 *
 * The findings are offered, not written in. Each one names the questions it came
 * from and the line that raised it, and the teacher puts it into the grid or
 * writes their own instead. That keeps the same split the rest of the report
 * keeps: the numbers are computed, the words are the teacher's, and nothing on
 * the page says something the session did not.
 */
export function ReportEdit() {
  const { id = '' } = useParams()
  const navigate = useNavigate()
  const { session, items, loading } = useLiveSession(id, { withAssessments: true })

  const [transcript, setTranscript] = useState<SessionTranscript | null>(null)
  const [draftBody, setDraftBody] = useState('')
  const [filename, setFilename] = useState<string | null>(null)
  const [offset, setOffset] = useState(DEFAULT_OFFSET_SECONDS)
  const [roles, setRoles] = useState<Record<string, Role>>({})

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

  // Fathom labels a turn with whatever the person typed into Zoom, which is
  // frequently neither name on the account. Guess from the given names, then let
  // it be corrected — mistaking the teacher's explanation for the student's
  // reasoning would make every finding below it wrong.
  useEffect(() => {
    if (!parsed || parsed.speakers.length === 0) return
    setRoles((prev) => {
      if (parsed.speakers.every((s) => s in prev)) return prev
      return {
        ...inferRoles(parsed.speakers, session?.teacher?.full_name, session?.student?.full_name),
        ...prev,
      }
    })
  }, [parsed, session])

  const analysis: SessionAnalysis | null = useMemo(() => {
    if (!parsed || parsed.lines.length === 0) return null
    if (!Object.values(roles).includes('student')) return null
    return analyseSession(report, parsed, windows, roles)
  }, [parsed, report, windows, roles])

  function findOffset() {
    if (!parsed) return
    setOffset(
      suggestOffset(
        parsed,
        (o) =>
          windowsFor(
            items.map((i) => ({ id: i.id, startedAt: i.first_viewed_at ?? i.published_at })),
            parsed.duration,
            o,
          ),
        items.map((i) => i.id),
        roles,
      ),
    )
  }

  function setNote(domain: string, field: 'strengths' | 'gaps', value: string) {
    setNotes((prev) => ({
      ...prev,
      [domain]: { ...(prev[domain] ?? { strengths: '', gaps: '' }), [field]: value },
    }))
  }

  /** Puts a finding into a box without overwriting what is already typed. */
  function appendNote(domain: string, field: 'strengths' | 'gaps', text: string) {
    setNotes((prev) => {
      const row = prev[domain] ?? { strengths: '', gaps: '' }
      const current = row[field].trim()
      if (current.includes(text)) return prev
      return { ...prev, [domain]: { ...row, [field]: current ? `${current} ${text}` : text } }
    })
  }

  function appendMeta(field: 'time_management' | 'engagement', text: string) {
    setMeta((prev) => {
      const current = (prev[field] ?? '').trim()
      if (current.includes(text)) return prev
      return { ...prev, [field]: current ? `${current} ${text}` : text }
    })
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
  const found = (domain: string) => analysis?.domains.find((d) => d.domain === domain) ?? null

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
          <>
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
              <button type="button" className="btn btn-ghost btn-sm" onClick={findOffset}>
                Find it
              </button>
              <span className="muted">
                seconds into the recording — Fathom starts before the lesson does, and this is what
                lines the quotes up with the right questions.
              </span>
            </div>

            <div className="speaker-row">
              <span className="muted">Who is who in the recording</span>
              {parsed.speakers.map((name) => (
                <label key={name} className="speaker">
                  <span>{name}</span>
                  <Select
                    value={roles[name] ?? 'other'}
                    onChange={(e) =>
                      setRoles((prev) => ({ ...prev, [name]: e.target.value as Role }))
                    }
                  >
                    <option value="student">Student</option>
                    <option value="teacher">Teacher</option>
                    <option value="other">Someone else</option>
                  </Select>
                </label>
              ))}
            </div>
          </>
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
              const read = analysis?.items.find((i) => i.itemId === a.itemId) ?? null
              return (
                <details key={a.itemId} className="qtalk-row">
                  <summary>
                    <span className={`badge ${a.correct ? 'badge-ok' : 'badge-bad'}`}>
                      Q{a.sequence}
                    </span>
                    <span className="sk">{skillLabel(a.skill) ?? '—'}</span>
                    <span className="muted">{formatDuration(a.seconds)}</span>
                    {read && read.verdict !== 'not_covered' && (
                      <span className="badge badge-sky">{VERDICT_LABELS[read.verdict]}</span>
                    )}
                    <span className="spring" />
                    {read?.talkShare !== null && read?.talkShare !== undefined && (
                      <span className="muted">
                        she spoke {Math.round(read.talkShare * 100)}%
                      </span>
                    )}
                    <span className="muted">{said.length} turns</span>
                  </summary>
                  <div className="qtalk-body">
                    {read && read.markers.length > 0 && (
                      <div className="marker-row">
                        {read.markers.map((m) => (
                          <span key={m} className="badge badge-neutral">
                            {MARKER_LABELS[m]}
                          </span>
                        ))}
                      </div>
                    )}
                    {said.length === 0 ? (
                      <p className="muted">
                        Nothing lines up here — check the offset above.
                      </p>
                    ) : (
                      said.map((l, i) => (
                        <p key={i} className={`qtalk-line ${roles[l.speaker] ?? 'other'}`}>
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

      {/* -------------------------------------------------- what it shows --- */}
      {analysis && (
        <div className="card card-pad">
          <div className="section-title">What the transcript shows</div>

          {!analysis.alignment.ok && (
            <Notice kind="info">
              Only {analysis.alignment.covered} of {analysis.alignment.total} questions have the
              student talking in them. That is the offset, not the lesson — press <b>Find it</b>{' '}
              above, or nudge the number until the quotes sit under the right questions.
            </Notice>
          )}

          <div className="read-row">
            {analysis.talkShare !== null && (
              <span className="badge badge-sky">
                Student did {Math.round(analysis.talkShare * 100)}% of the talking
              </span>
            )}
            <span className="badge badge-neutral">
              Reasoning given on {analysis.explained} of {analysis.alignment.covered}
            </span>
            {analysis.secondGuess.total > 0 && (
              <span className="badge badge-neutral">
                Second-guessed {analysis.secondGuess.total}×, wrong {analysis.secondGuess.wrong}
              </span>
            )}
          </div>

          <p className="muted read-note">
            Every line below names the questions it came from. Click one to put it in the box it
            belongs to — then edit it into your own words, or ignore it and write your own.
          </p>
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
                <div>
                  <Field label="Strengths observed">
                    <Textarea
                      rows={2}
                      value={notes[r.domain]?.strengths ?? ''}
                      onChange={(e) => setNote(r.domain, 'strengths', e.target.value)}
                    />
                  </Field>
                  <Suggestions
                    items={found(r.domain)?.strengths ?? []}
                    onPick={(t) => appendNote(r.domain, 'strengths', t)}
                  />
                </div>
                <div>
                  <Field label="Gaps observed">
                    <Textarea
                      rows={2}
                      value={notes[r.domain]?.gaps ?? ''}
                      onChange={(e) => setNote(r.domain, 'gaps', e.target.value)}
                    />
                  </Field>
                  <Suggestions
                    items={found(r.domain)?.gaps ?? []}
                    onPick={(t) => appendNote(r.domain, 'gaps', t)}
                  />
                </div>
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
        <Suggestions
          items={analysis?.timeManagement ?? []}
          onPick={(t) => appendMeta('time_management', t)}
        />
        <Field label="Engagement / confidence">
          <Textarea
            rows={2}
            value={meta.engagement ?? ''}
            onChange={(e) => setMeta({ ...meta, engagement: e.target.value })}
          />
        </Field>
        <Suggestions
          items={analysis?.engagement ?? []}
          onPick={(t) => appendMeta('engagement', t)}
        />
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

/**
 * The findings, offered.
 *
 * A finding is a button rather than a filled-in box on purpose. The teacher
 * signs the report, so the sentence has to pass through them — and the quote
 * underneath is what they check it against before it does.
 */
function Suggestions({
  items,
  onPick,
}: {
  items: Suggestion[]
  onPick: (text: string) => void
}) {
  if (items.length === 0) return null
  return (
    <div className="suggests">
      {items.map((s) => (
        <button key={s.text} type="button" className="suggest" onClick={() => onPick(s.text)}>
          <span className="suggest-text">{s.text}</span>
          {s.quote && <span className="suggest-quote">“{s.quote.text}”</span>}
        </button>
      ))}
    </div>
  )
}
