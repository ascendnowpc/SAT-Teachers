import { useState } from 'react'
import { supabase } from '../lib/supabase'
import { Notice } from './ui'

/**
 * Switching an account off, and back on.
 *
 * It is the one write the portal has, and since signup lets a teacher straight
 * in (0058) it is the only answer to an account nobody recognises. Suspending
 * does two things at once (0045): is_teacher() asks is_active, so the account
 * loses every policy in the schema, and the auth user is banned, so the
 * password stops working and their open tab stops refreshing.
 * Their sessions and their reports are untouched — this is a door, not an
 * eraser, and letting them back in is the same button.
 */
export function SuspendAccount({
  profile,
  onDone,
}: {
  profile: { id: string; is_active: boolean; full_name: string; role?: string }
  onDone: () => Promise<void>
}) {
  // A student signs in with their ID and PIN rather than a password (0067).
  const consequence =
    profile.role === 'student'
      ? 'will be signed out, and their ID and PIN will stop opening their account.'
      : 'will be signed out and their password will stop working.'
  const [busy, setBusy] = useState(false)
  const [failed, setFailed] = useState<string | null>(null)
  const [confirming, setConfirming] = useState(false)

  async function set(active: boolean) {
    setBusy(true)
    setFailed(null)
    const { error } = await supabase.rpc('set_profile_active', {
      p_profile: profile.id,
      p_active: active,
    })
    if (error) setFailed(error.message)
    else await onDone()
    setBusy(false)
    setConfirming(false)
  }

  if (!profile.is_active) {
    return (
      <div className="suspend">
        {failed && <Notice kind="error">{failed}</Notice>}
        <button
          type="button"
          className="btn btn-primary btn-sm"
          disabled={busy}
          onClick={() => void set(true)}
        >
          {busy ? 'Working…' : 'Let them in'}
        </button>
      </div>
    )
  }

  return (
    <div className="suspend">
      {failed && <Notice kind="error">{failed}</Notice>}
      {confirming ? (
        <>
          <span className="cell-sub">
            {profile.full_name || 'They'} {consequence}
          </span>
          <button
            type="button"
            className="btn btn-danger btn-sm"
            disabled={busy}
            onClick={() => void set(false)}
          >
            {busy ? 'Working…' : 'Yes, suspend'}
          </button>
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => setConfirming(false)}>
            Cancel
          </button>
        </>
      ) : (
        <button type="button" className="btn btn-ghost btn-sm" onClick={() => setConfirming(true)}>
          Suspend
        </button>
      )}
    </div>
  )
}
