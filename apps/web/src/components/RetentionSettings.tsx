import { useCallback, useEffect, useState } from 'react'
import {
  ARCHIVE_BUCKET,
  groupSaved,
  lastRunText,
  type RetentionRun,
  type SavedReport,
  type SavedStudent,
} from '../lib/reportArchive'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import { Input, Notice } from './ui'

interface Due {
  student_id: string
  full_name: string
  display_id: string
  last_active: string
  due_at: string
  /** Reports of theirs not saved yet: they are held until these are (0087). */
  reports_waiting?: number
}

interface NoticeRow {
  student_id: string
  full_name: string
  display_id: string | null
  pc: string | null
  last_active: string
  delete_at: string
  decision: 'delete' | null
  stage: 'noticed' | 'due'
  emailed_at: string | null
  email_error: string | null
}

interface Preview {
  policy: {
    enabled: boolean
    notice_days: number
    grace_days: number
    archive_years: number
    transcript_days: number
    updated_at: string
    last_run_at: string | null
    last_run: RetentionRun | null
  }
  students_due: Due[]
  students_soon: Due[]
  /** Told, and not answered yet (0107). */
  notices: NoticeRow[]
  /** To be told at the next run. */
  to_notice: { student_id: string; full_name: string; display_id: string | null; last_active: string }[]
  reports_expiring: number
  transcripts_due: number
  /** Reports a deletion due now would take that are not saved yet (0087). */
  reports_waiting: number
  reports_saved: number
}

/**
 * When old data is deleted (0071). Off until an admin turns it on; what it
 * would delete is listed by name before it does, and a deletion cannot be
 * undone — so turning it on asks first.
 *
 * Nothing a report was drawn from is deleted until the report is saved as a
 * PDF (0087): a student is held until every report of theirs is, a recording
 * until its session's is. The saved reports are listed at the foot, to open
 * or — when a family asks to be forgotten — to delete.
 */
export function RetentionSettings() {
  const [preview, setPreview] = useState<Preview | null>(null)
  const [notice, setNotice] = useState('60')
  const [grace, setGrace] = useState('14')
  const [days, setDays] = useState('90')
  const [years, setYears] = useState('2')
  const [error, setError] = useState<string | null>(null)
  const [saved, setSaved] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const [archive, setArchive] = useState<SavedReport[]>([])

  const load = useCallback(async () => {
    const [{ data, error: err }, kept] = await Promise.all([
      supabase.rpc('retention_preview'),
      supabase.from('report_archive').select('*').order('archived_at', { ascending: false }),
    ])
    if (err) {
      setError(err.message)
      return
    }
    const p = data as Preview
    setPreview(p)
    setNotice(String(p.policy.notice_days))
    setGrace(String(p.policy.grace_days))
    setDays(String(p.policy.transcript_days))
    setYears(String(p.policy.archive_years))
    setArchive((kept.data ?? []) as SavedReport[])
  }, [])

  useEffect(() => {
    void load()
  }, [load])

  async function save(enabled: boolean) {
    if (!preview) return
    const d = Number(days)
    if (enabled && !preview.policy.enabled) {
      const n = preview.to_notice.length
      const ok = window.confirm(
        `Turn on the clean-up?\n\nAt the next daily run (03:17 UTC) ${n === 0 ? 'no PC is told yet' : `the PCs of ${n} inactive student${n === 1 ? '' : 's'} are emailed`}. A student is deleted only ${grace} days after their PC was told, if the PC does not keep them — reports saved as PDFs first. Recordings older than ${d} days go too. A deletion cannot be undone.`,
      )
      if (!ok) return
    }
    setBusy(true)
    setError(null)
    setSaved(null)
    const { error: err } = await supabase.rpc('set_retention_rules', {
      p_enabled: enabled,
      p_notice_days: Number(notice),
      p_grace_days: Number(grace),
      p_transcript_days: d,
      p_archive_years: Number(years),
    })
    setBusy(false)
    if (err) setError(err.message)
    else {
      setSaved(enabled ? 'Saved. The clean-up is on.' : 'Saved. The clean-up is off: nothing will be deleted.')
      await load()
    }
  }

  async function runNow() {
    if (
      !window.confirm(
        'Run the clean-up now? Everything listed as due is deleted once its reports are saved, and this cannot be undone.',
      )
    )
      return
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.rpc('run_retention_now')
    setBusy(false)
    if (err) setError(err.message)
    await load()
  }

  if (!preview) return error ? <Notice kind="error">{error}</Notice> : <p className="muted">Loading…</p>

  const p = preview.policy
  const last = p.last_run

  return (
    <div className="settings">
      {error && <Notice kind="error">{error}</Notice>}
      {saved && <Notice kind="ok">{saved}</Notice>}

      <section className="card card-pad">
        <div className="section-title">When old data is deleted</div>
        <p className="settings-lead">
          A student with no check-in or session for the days below: their PC is emailed, with Keep and Delete
          now. Unanswered after the grace, they are deleted — their reports saved as PDFs first.
        </p>
        <div className="grid-2">
          <label className="field">
            <span className="label">Tell the PC after (days quiet)</span>
            <Input type="number" min={14} max={365} value={notice} onChange={(e) => setNotice(e.target.value)} />
          </label>
          <label className="field">
            <span className="label">Then delete after (days of grace)</span>
            <Input type="number" min={7} max={60} value={grace} onChange={(e) => setGrace(e.target.value)} />
          </label>
          <label className="field">
            <span className="label">Keep a recording for (days)</span>
            <Input type="number" min={30} max={730} value={days} onChange={(e) => setDays(e.target.value)} />
          </label>
          <label className="field">
            <span className="label">Keep a saved report PDF for (years)</span>
            <Input type="number" min={1} max={10} value={years} onChange={(e) => setYears(e.target.value)} />
          </label>
        </div>
        <div className="retention-actions">
          <span className={`badge ${p.enabled ? 'badge-ok' : 'badge-neutral'}`}>{p.enabled ? 'On' : 'Off'}</span>
          <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={() => void save(p.enabled)}>
            Save the times
          </button>
          {p.enabled ? (
            <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={() => void save(false)}>
              Turn off
            </button>
          ) : (
            <button type="button" className="btn btn-primary btn-sm" disabled={busy} onClick={() => void save(true)}>
              Turn on
            </button>
          )}
          {p.enabled && (
            <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={() => void runNow()}>
              Run now
            </button>
          )}
        </div>
        <p className="retention-last">
          Runs every day at 03:17 UTC. {lastRunText(p.last_run_at, last)}
        </p>
      </section>

      <section className="card card-pad">
        <div className="section-title">Who is flagged</div>
        <NoticeList rows={preview.notices} />
        <div className="retention-sub">To be told at the next run</div>
        {preview.to_notice.length === 0 ? (
          <p className="muted">Nobody.</p>
        ) : (
          <p className="retention-names">
            {preview.to_notice.map((t) => t.full_name).join(', ')}
          </p>
        )}
        <DueList title="Deleted at the next run" rows={preview.students_due} empty="Nobody." />
        <p className="retention-last">
          Recordings due now: <strong className="num">{preview.transcripts_due}</strong>
          {preview.reports_waiting > 0 && (
            <>
              {' '}
              · Reports to save before these go:{' '}
              <strong className="num">{preview.reports_waiting}</strong>
            </>
          )}
          {preview.reports_expiring > 0 && (
            <>
              {' '}
              · Saved PDFs past {p.archive_years} years: <strong className="num">{preview.reports_expiring}</strong>
            </>
          )}
        </p>
      </section>

      <SavedReports
        students={groupSaved(archive)}
        busy={busy}
        onError={setError}
        onChanged={load}
        setBusy={setBusy}
      />
    </div>
  )
}

/** The students whose PC was told, when they go, and whether the mail went. */
function NoticeList({ rows }: { rows: NoticeRow[] }) {
  if (rows.length === 0) return <p className="muted">No PC has been told about anyone.</p>
  return (
    <table className="retention-table">
      <thead>
        <tr>
          <th>Student</th>
          <th>PC</th>
          <th>Last active</th>
          <th>Deleted</th>
          <th>Mail</th>
        </tr>
      </thead>
      <tbody>
        {rows.map((r) => (
          <tr key={r.student_id}>
            <td>
              {r.full_name} <span className="muted num">{r.display_id}</span>
            </td>
            <td>{r.pc ?? <span className="muted">no PC — admins told</span>}</td>
            <td className="num">{formatUtc(r.last_active).split(',')[0]}</td>
            <td className="num">
              {r.decision === 'delete' ? 'now (Delete now)' : r.stage === 'due' ? 'at the next run' : formatUtc(r.delete_at).split(',')[0]}
            </td>
            <td>{r.email_error ? <span className="text-danger">{r.email_error}</span> : r.emailed_at ? 'sent' : 'sending'}</td>
          </tr>
        ))}
      </tbody>
    </table>
  )
}

/**
 * Every report saved before its data went, by student (0087): open one, or
 * delete a student's — the files through the bucket, then their rows.
 */
function SavedReports({
  students,
  busy,
  setBusy,
  onError,
  onChanged,
}: {
  students: SavedStudent[]
  busy: boolean
  setBusy: (b: boolean) => void
  onError: (e: string | null) => void
  onChanged: () => Promise<void>
}) {
  const [open, setOpen] = useState<string | null>(null)

  async function view(path: string) {
    // A link that works for a minute: the bucket is private.
    const { data, error } = await supabase.storage.from(ARCHIVE_BUCKET).createSignedUrl(path, 60)
    if (error || !data) onError(error?.message ?? 'The file could not be opened.')
    else window.open(data.signedUrl, '_blank', 'noopener')
  }

  async function forget(s: SavedStudent) {
    const n = s.reports.length
    if (
      !window.confirm(
        `Delete ${s.student_name}'s ${n} saved report${n === 1 ? '' : 's'}? This cannot be undone.`,
      )
    )
      return
    setBusy(true)
    onError(null)
    const removed = await supabase.storage.from(ARCHIVE_BUCKET).remove(s.reports.map((r) => r.path))
    if (removed.error) {
      onError(removed.error.message)
    } else {
      const { error } = await supabase.rpc('forget_saved_reports', { p_student: s.student_id })
      if (error) onError(error.message)
    }
    await onChanged()
    setBusy(false)
  }

  return (
    <section className="card card-pad">
      <div className="section-title">Saved reports</div>
      {students.length === 0 ? (
        <p className="muted">
          None yet.
        </p>
      ) : (
        <table className="retention-table">
          <thead>
            <tr>
              <th>Student</th>
              <th className="num">Reports</th>
              <th>Last saved</th>
              <th />
            </tr>
          </thead>
          <tbody>
            {students.map((s) => (
              <SavedRow
                key={s.student_id}
                s={s}
                open={open === s.student_id}
                busy={busy}
                onToggle={() => setOpen(open === s.student_id ? null : s.student_id)}
                onView={view}
                onForget={() => void forget(s)}
              />
            ))}
          </tbody>
        </table>
      )}
    </section>
  )
}

function SavedRow({
  s,
  open,
  busy,
  onToggle,
  onView,
  onForget,
}: {
  s: SavedStudent
  open: boolean
  busy: boolean
  onToggle: () => void
  onView: (path: string) => Promise<void>
  onForget: () => void
}) {
  return (
    <>
      <tr>
        <td>
          <button type="button" className="link-btn" aria-expanded={open} onClick={onToggle}>
            {s.student_name}
          </button>{' '}
          {s.display_id && <span className="muted num">{s.display_id}</span>}
        </td>
        <td className="num">{s.reports.length}</td>
        <td>{formatUtc(s.last)}</td>
        <td className="num">
          <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={onForget}>
            Delete
          </button>
        </td>
      </tr>
      {open &&
        s.reports.map((r) => (
          <tr key={r.id} className="retention-saved">
            <td colSpan={2}>
              {r.kind === 'targeted' ? 'Targeted test' : 'Report'} · {formatUtc(r.session_at)}
              {r.made_from !== r.session_at && r.kind === 'report' && (
                <span className="muted"> · generated {formatUtc(r.made_from)}</span>
              )}
            </td>
            <td>{formatUtc(r.archived_at)}</td>
            <td className="num">
              <button type="button" className="btn btn-ghost btn-sm" onClick={() => void onView(r.path)}>
                Open
              </button>
            </td>
          </tr>
        ))}
    </>
  )
}

function DueList({ title, rows, empty }: { title: string; rows: Due[]; empty: string }) {
  return (
    <div className="retention-list">
      <h4>{title}</h4>
      {rows.length === 0 ? (
        <p className="muted">{empty}</p>
      ) : (
        <table className="retention-table">
          <thead>
            <tr>
              <th>Student</th>
              <th>Last session</th>
              <th>Deleted from</th>
              {rows.some((r) => r.reports_waiting !== undefined) && (
                <th className="num">Reports to save first</th>
              )}
            </tr>
          </thead>
          <tbody>
            {rows.map((r) => (
              <tr key={r.student_id}>
                <td>
                  {r.full_name} <span className="muted num">{r.display_id}</span>
                </td>
                <td>{formatUtc(r.last_active)}</td>
                <td>{formatUtc(r.due_at)}</td>
                {r.reports_waiting !== undefined && <td className="num">{r.reports_waiting}</td>}
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  )
}
