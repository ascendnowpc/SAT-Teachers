import { useCallback, useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import { Input, Notice } from './ui'

interface Due {
  student_id: string
  full_name: string
  display_id: string
  last_active: string
  due_at: string
}

interface Preview {
  policy: {
    enabled: boolean
    student_months: number
    transcript_days: number
    updated_at: string
    last_run_at: string | null
    last_run: { ran: boolean; reason?: string; students?: number; sessions?: number; transcripts?: number; readings?: number } | null
  }
  students_due: Due[]
  students_soon: Due[]
  transcripts_due: number
}

/**
 * When old data is deleted (0071). Off until an admin turns it on; what it
 * would delete is listed by name before it does, and a deletion cannot be
 * undone — so turning it on asks first.
 */
export function RetentionSettings() {
  const [preview, setPreview] = useState<Preview | null>(null)
  const [months, setMonths] = useState('12')
  const [days, setDays] = useState('90')
  const [error, setError] = useState<string | null>(null)
  const [saved, setSaved] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  const load = useCallback(async () => {
    const { data, error: err } = await supabase.rpc('retention_preview')
    if (err) {
      setError(err.message)
      return
    }
    const p = data as Preview
    setPreview(p)
    setMonths(String(p.policy.student_months))
    setDays(String(p.policy.transcript_days))
  }, [])

  useEffect(() => {
    void load()
  }, [load])

  async function save(enabled: boolean) {
    if (!preview) return
    const m = Number(months)
    const d = Number(days)
    if (enabled && !preview.policy.enabled) {
      const n = preview.students_due.length
      const ok = window.confirm(
        `Turn on the clean-up?\n\n${n === 0 ? 'No student is due yet' : `${n} student${n === 1 ? ' is' : 's are'} due now and will be deleted with all their records`} at the next daily run (03:17 UTC), and recordings older than ${d} days with them. A deletion cannot be undone.`,
      )
      if (!ok) return
    }
    setBusy(true)
    setError(null)
    setSaved(null)
    const { error: err } = await supabase.rpc('set_retention_policy', {
      p_enabled: enabled,
      p_student_months: m,
      p_transcript_days: d,
    })
    setBusy(false)
    if (err) setError(err.message)
    else {
      setSaved(enabled ? 'Saved. The clean-up is on.' : 'Saved. The clean-up is off: nothing will be deleted.')
      await load()
    }
  }

  async function runNow() {
    if (!window.confirm('Run the clean-up now? Everything listed as due is deleted, and this cannot be undone.')) return
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
          A student is deleted with all their records — sessions, answers, reports, notes and PIN —
          once nothing has been booked for them for the time below. A session's recording and its
          reading are deleted sooner; the session and its scores stay. Nothing is deleted while the
          clean-up is off.
        </p>
        <div className="grid-2">
          <label className="field">
            <span className="label">Keep a student for (months)</span>
            <Input type="number" min={3} max={60} value={months} onChange={(e) => setMonths(e.target.value)} />
          </label>
          <label className="field">
            <span className="label">Keep a recording for (days)</span>
            <Input type="number" min={30} max={730} value={days} onChange={(e) => setDays(e.target.value)} />
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
          Runs every day at 03:17 UTC.{' '}
          {p.last_run_at
            ? `Last run ${formatUtc(p.last_run_at)}: ${
                last?.ran
                  ? `${last.students ?? 0} students, ${last.transcripts ?? 0} recordings deleted.`
                  : 'off, nothing deleted.'
              }`
            : 'It has not run yet.'}
        </p>
      </section>

      <section className="card card-pad">
        <div className="section-title">What it would delete</div>
        <DueList title="Students due now" rows={preview.students_due} empty="No student is due." />
        <DueList
          title="Students due in the next 30 days"
          rows={preview.students_soon}
          empty="None in the next 30 days."
        />
        <p className="retention-last">
          Recordings due now: <strong className="num">{preview.transcripts_due}</strong>
        </p>
      </section>
    </div>
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
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  )
}
