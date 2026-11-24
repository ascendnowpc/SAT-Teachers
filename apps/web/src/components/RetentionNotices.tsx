import { useCallback, useEffect, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { dayLabel } from '../lib/bluebook'
import { supabase } from '../lib/supabase'
import { Notice } from './ui'

interface Flagged {
  student_id: string
  full_name: string
  display_id: string | null
  last_active: string
  noticed_at: string
  delete_at: string
  decision: 'delete' | null
  stage: 'noticed' | 'due'
}

/**
 * The students the clean-up has flagged (0107): no check-in or session for 60
 * days. The PC keeps them — another 60 days — or deletes them now; unanswered,
 * they go on the day shown, after their reports are saved. The notice mail's
 * buttons land here (?retention=keep|delete&student=…), with that student
 * picked out; nothing happens until the PC presses the button here.
 */
export function RetentionNotices() {
  const [rows, setRows] = useState<Flagged[] | null>(null)
  const [busy, setBusy] = useState<string | null>(null)
  const [done, setDone] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [params] = useSearchParams()
  const picked = params.get('student')
  const asked = params.get('retention')

  const load = useCallback(async () => {
    const { data, error: err } = await supabase.rpc('retention_notices_mine')
    // A teacher is not asked; the panel simply is not there for them.
    if (err) setRows([])
    else setRows((data ?? []) as Flagged[])
  }, [])

  useEffect(() => {
    void load()
  }, [load])

  async function decide(r: Flagged, keep: boolean) {
    if (
      !keep &&
      !window.confirm(
        `Delete ${r.full_name} now?\n\nTheir reports are saved as PDFs first; then the account and every record of theirs is deleted. This cannot be undone.`,
      )
    )
      return
    setBusy(r.student_id)
    setError(null)
    setDone(null)
    const { error: err } = await supabase.rpc('retention_decide', { p_student: r.student_id, p_keep: keep })
    setBusy(null)
    if (err) {
      setError(err.message)
      return
    }
    setDone(keep ? `${r.full_name} is kept — the next check is in 60 days.` : `${r.full_name} is being deleted, once their reports are saved.`)
    await load()
  }

  if (!rows || (rows.length === 0 && !done && !error)) return null

  return (
    <section className="card card-pad retention-notices" aria-label="Inactive students">
      <div className="retention-notices-head">
        <div>
          <div className="section-title">No activity for 60 days</div>
          <p className="muted">
            Keep a student, or they are deleted on the day shown — their reports are saved as PDFs first.
          </p>
        </div>
      </div>
      {error && <Notice kind="error">{error}</Notice>}
      {done && <Notice kind="ok">{done}</Notice>}
      {rows.length > 0 && (
        <ul className="retention-rows">
          {rows.map((r) => {
            const here = picked === r.student_id
            return (
              <li key={r.student_id} className={here ? 'is-picked' : ''}>
                <div className="retention-who">
                  <strong>{r.full_name}</strong>
                  <span className="muted num">
                    {r.display_id ? `${r.display_id} · ` : ''}last active {dayLabel(r.last_active.slice(0, 10))}
                  </span>
                </div>
                <span className={`badge ${r.stage === 'due' ? 'badge-warn' : 'badge-neutral'}`}>
                  {r.decision === 'delete'
                    ? 'Deleting'
                    : r.stage === 'due'
                      ? 'Deleting at the next run'
                      : `Deleted on ${dayLabel(r.delete_at.slice(0, 10))}`}
                </span>
                <div className="retention-act">
                  <button
                    type="button"
                    className={`btn btn-sm ${here && asked === 'keep' ? 'btn-primary' : 'btn-ghost'}`}
                    disabled={busy !== null}
                    onClick={() => void decide(r, true)}
                  >
                    Keep
                  </button>
                  <button
                    type="button"
                    className={`btn btn-sm ${here && asked === 'delete' ? 'btn-danger' : 'btn-ghost'}`}
                    disabled={busy !== null || r.decision === 'delete'}
                    onClick={() => void decide(r, false)}
                  >
                    Delete now
                  </button>
                </div>
              </li>
            )
          })}
        </ul>
      )}
    </section>
  )
}
