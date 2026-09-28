import { useCallback, useEffect, useState } from 'react'
import { loadReportEmail, sendReportAgain } from '../lib/pcApi'
import { deliveryLine, type DeliveryLine } from '../lib/pcs'
import type { ReportEmail } from '../lib/types'
import { Notice } from './ui'

const BADGE: Record<DeliveryLine['tone'], { cls: string; label: string }> = {
  ok: { cls: 'badge-ok', label: 'PC emailed' },
  wait: { cls: 'badge-sky', label: 'Emailing the PC' },
  bad: { cls: 'badge-bad', label: 'PC email failed' },
  none: { cls: 'badge-neutral', label: 'PC not emailed' },
}

/**
 * Whether the generated report reached the student's PC.
 *
 * Generating queues the email (0055) and a function sends it a few seconds
 * later, so the line watches for it for a moment rather than saying "not sent"
 * to somebody who pressed the button two seconds ago. What it shows is the
 * record the function keeps — sent, and where; failed, and why; skipped, and
 * why — so a teacher is never left to wonder whether the PC has it.
 *
 * Sending it again is the session's teacher's and an admin's: after a
 * failure, after the PC was only chosen once the report existed, or because a
 * PC asked for another copy.
 */
export function PcDelivery({
  sessionId,
  generatedAt,
  pcName,
  canResend,
}: {
  sessionId: string
  /** The report's generation. Nothing is shown until there is one. */
  generatedAt: string | null
  pcName: string | null
  canResend: boolean
}) {
  const [email, setEmail] = useState<ReportEmail | null>(null)
  const [loaded, setLoaded] = useState(false)
  const [now, setNow] = useState(() => Date.now())
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    setEmail(await loadReportEmail(sessionId))
    setNow(Date.now())
    setLoaded(true)
  }, [sessionId])

  // Again whenever the report is generated again.
  useEffect(() => {
    void load()
  }, [load, generatedAt])

  const line = deliveryLine(email, generatedAt, pcName, now)

  // While it is on its way, look again every few seconds. Each look moves
  // `now`, which re-arms this; the line stops saying "sending" by itself once
  // the email has had its chance, and that stops it.
  useEffect(() => {
    if (line?.tone !== 'wait') return
    const t = setTimeout(() => void load(), 3000)
    return () => clearTimeout(t)
  }, [line?.tone, now, load])

  async function again() {
    setBusy(true)
    setError(null)
    try {
      const result = await sendReportAgain(sessionId)
      if (!result.sent) setError(result.reason ?? 'The email did not go.')
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
    }
    await load()
    setBusy(false)
  }

  if (!generatedAt || !loaded || !line) return null
  const badge = BADGE[line.tone]

  return (
    <>
      <div className="step-actions pc-delivery">
        <span className={`badge ${badge.cls}`}>{badge.label}</span>
        <span className="muted">{line.text}</span>
        {canResend && line.tone !== 'wait' && (
          <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={() => void again()}>
            {busy ? 'Sending…' : line.tone === 'ok' ? 'Send it again' : 'Send it to the PC'}
          </button>
        )}
      </div>
      {error && <Notice kind="error">{error}</Notice>}
    </>
  )
}
