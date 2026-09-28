import { useState, type FormEvent } from 'react'
import { Field, Input, Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { supabase } from '../lib/supabase'

/**
 * Your own account: who the platform thinks you are, and your password.
 *
 * Anybody can change their password here: a PC who chose theirs on the join
 * page and wants another, and a teacher, since nothing about changing a
 * password is particular to a PC.
 */
export function Account() {
  const { profile, session, isPc } = useAuth()
  const [password, setPassword] = useState('')
  const [again, setAgain] = useState('')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [done, setDone] = useState(false)

  if (!profile) return null

  const tooShort = password.length > 0 && password.length < 8
  const mismatch = again.length > 0 && again !== password
  const canSave = !busy && password.length >= 8 && password === again

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)
    setDone(false)
    setBusy(true)
    const { error: err } = await supabase.auth.updateUser({ password })
    setBusy(false)
    if (err) {
      setError(err.message)
      return
    }
    setPassword('')
    setAgain('')
    setDone(true)
  }

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Account</h1>
          <p className="sub">
            {profile.full_name || 'Unnamed'} · <span className="num">{profile.display_id}</span>
            {session?.user.email && <> · {session.user.email}</>}
          </p>
        </div>
      </div>

      {isPc && (
        <Notice kind="info">
          You are a PC. You see the sessions and reports of the students assigned to you, and each
          report is emailed to you as a PDF when it is generated.
        </Notice>
      )}

      <form onSubmit={onSubmit} noValidate>
        <div className="card card-pad">
          <div className="section-title">Change your password</div>
          {error && <Notice kind="error">{error}</Notice>}
          {done && <Notice kind="ok">Your password is changed. Use the new one next time you sign in.</Notice>}

          <div className="grid-2">
            <Field label="New password" required hint={tooShort ? 'At least 8 characters.' : undefined}>
              <Input
                type="password"
                autoComplete="new-password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
            </Field>
            <Field label="The same again" required hint={mismatch ? 'The two do not match.' : undefined}>
              <Input
                type="password"
                autoComplete="new-password"
                value={again}
                onChange={(e) => setAgain(e.target.value)}
              />
            </Field>
          </div>

          <button type="submit" className="btn btn-primary" disabled={!canSave}>
            {busy ? 'Saving…' : 'Change password'}
          </button>
        </div>
      </form>
    </div>
  )
}
