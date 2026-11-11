import { useState } from 'react'
import { isSuspended } from '../lib/admin'
import { sendPcInvite } from '../lib/pcApi'
import { choosable, type PcResult } from '../lib/pcs'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { PcInvite, Profile } from '../lib/types'
import { CopyButton, Notice } from './ui'

/**
 * What an admin does to a PC and to a student's PC, wherever they do it: the
 * Users list and the PC's and the student's own pages. Written once, so the
 * confirmations say the same thing from every seat.
 */

/**
 * Another link for a PC (to join, or for a new password), and suspending the
 * account or letting it back in.
 */
export function usePcActions(invites: Map<string, PcInvite>, onChanged: () => Promise<void>) {
  const [busy, setBusy] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [result, setResult] = useState<PcResult | null>(null)

  async function invite(pc: Profile) {
    const joined = invites.get(pc.id)?.joined_at != null
    const ask = joined
      ? `Email ${pc.full_name} a link to choose a new password? Their current one keeps working until they use it.`
      : `Email ${pc.full_name} a new link to set up their account? Any link sent before stops working.`
    if (!window.confirm(ask)) return
    setBusy(pc.id)
    setError(null)
    setResult(null)
    try {
      setResult(await sendPcInvite(pc.id))
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    }
    await onChanged()
    setBusy(null)
  }

  async function toggle(pc: Profile) {
    const suspending = !isSuspended(pc)
    if (
      suspending &&
      !window.confirm(
        `Suspend ${pc.full_name}? They will not be able to sign in, and reports on their students will not be emailed to anybody until you let them back in or give the students another PC.`,
      )
    ) {
      return
    }
    setBusy(pc.id)
    setError(null)
    setResult(null)
    const { error: err } = await supabase.rpc('set_profile_active', { p_profile: pc.id, p_active: !suspending })
    if (err) setError(err.message)
    else await onChanged()
    setBusy(null)
  }

  return { busy, error, result, invite, toggle }
}

/**
 * What an admin is told once a PC has been made or sent a link.
 *
 * When the email went, where it went. When it did not — no mail provider set
 * up yet, or the server said no — the PC is still made, and the link is on
 * this screen once, for the admin to send themselves. It is not stored
 * anywhere to show again: another is a click away, and it replaces this one.
 */
export function InviteResult({ result, again }: { result: PcResult; again: boolean }) {
  const name = result.profile.full_name
  const email = result.profile.email ?? ''
  const what = result.joined ? 'a link to choose a new password' : 'a link to set up their account'
  const done = again ? `${name} has a new link` : `${name} is a PC now`
  const until = result.expires_at ? ` It works once, until ${formatUtc(result.expires_at)}.` : ''

  if (result.emailed) {
    return (
      <Notice kind="ok">
        {done}. {result.joined ? 'A link to choose a new password' : 'The link to set up their account'} went
        to <strong>{email}</strong>.{until}
      </Notice>
    )
  }

  if (!result.link) {
    return (
      <Notice kind="info">
        <strong>{done}, but no link could be made</strong>
        {result.reason ? ` — ${result.reason}` : ''}. Use <em>Send the invitation</em> on their row to try
        again.
      </Notice>
    )
  }

  return (
    <Notice kind="info">
      <p className="notice-lead">
        <strong>{done}, but the email did not go</strong>
        {result.reason ? ` — ${result.reason}` : ''}. Send {email || 'them'} {what} yourself. It is shown this
        once.{until}
      </p>
      <div className="credentials">
        <code className="invite-link">{result.link}</code>
        <CopyButton value={result.link} label="Copy the link" />
      </div>
    </Notice>
  )
}

/**
 * A student's PC, which an admin can change. A teacher chooses it once, at the
 * student's first booking; moving a student to another PC — and every report
 * they have with them — is this.
 */
export function StudentPcSelect({
  student,
  pcs,
  onChanged,
}: {
  student: Profile
  pcs: Profile[]
  onChanged: () => Promise<void>
}) {
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const options = pcs.filter(choosable)
  const current = pcs.find((p) => p.id === student.pc_id) ?? null

  async function change(id: string) {
    if (!id || id === student.pc_id) return
    const to = pcs.find((p) => p.id === id)?.full_name ?? 'that PC'
    if (
      student.pc_id &&
      !window.confirm(`Move ${student.full_name} from ${current?.full_name ?? 'their PC'} to ${to}? Their sessions and reports go with them.`)
    ) {
      return
    }
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.rpc('assign_student_pc', { p_student: student.id, p_pc_id: id })
    if (err) setError(err.message)
    else await onChanged()
    setBusy(false)
  }

  return (
    <>
      <select
        className="select pc-select"
        value={student.pc_id ?? ''}
        disabled={busy || options.length === 0}
        aria-label={`PC for ${student.full_name}`}
        onChange={(e) => void change(e.target.value)}
      >
        {!student.pc_id && (
          <option value="">{student.pc ? `“${student.pc}” — choose` : 'None — choose'}</option>
        )}
        {current && !choosable(current) && (
          <option value={current.id}>{current.full_name} (suspended)</option>
        )}
        {options.map((p) => (
          <option key={p.id} value={p.id}>
            {p.full_name}
          </option>
        ))}
      </select>
      {error && <div className="cell-sub overdue">{error}</div>}
    </>
  )
}
