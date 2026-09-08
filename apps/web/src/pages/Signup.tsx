import { useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { AuthLayout } from '../components/AuthLayout'
import { Field, Input, Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'

/**
 * Signing up, which is a thing teachers do and students do not.
 *
 * There was a role picker here and a student half of it, and the student half
 * was a week of chasing before a lesson on Thursday: choose a password,
 * confirm an email, sign in, find the session. A student is a roster row their
 * teacher types in now (0032) and the session reaches them as a link (0033),
 * so there is nothing on this page for them to do.
 *
 * Students who already have an account still sign in with it and still see
 * their sessions — that door is not shut, it is only no longer the way in.
 */
export function Signup() {
  const { signUp } = useAuth()
  const navigate = useNavigate()

  const [fullName, setFullName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [confirmSent, setConfirmSent] = useState(false)
  const [busy, setBusy] = useState(false)

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)

    if (password.length < 8) {
      setError('Use at least 8 characters for your password.')
      return
    }

    setBusy(true)
    try {
      const { needsConfirmation } = await signUp({ email, password, fullName, role: 'teacher' })
      if (needsConfirmation) setConfirmSent(true)
      else navigate('/', { replace: true })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not create the account.')
    } finally {
      setBusy(false)
    }
  }

  if (confirmSent) {
    return (
      <AuthLayout
        title="Check your email"
        subtitle={`We sent a confirmation link to ${email}. Open it to activate your account.`}
        footer={<Link to="/login">Back to sign in</Link>}
      >
        <Notice kind="info">
          Not expecting this? Email confirmation is switched on for this project. An admin can turn
          it off in Supabase under Authentication → Sign In / Providers → Email.
        </Notice>
      </AuthLayout>
    )
  }

  return (
    <AuthLayout
      title="Create your teacher account"
      subtitle="You'll get a TCH- id. Students need no account — you add them and send them a link."
      footer={
        <>
          Already have an account? <Link to="/login">Sign in</Link>
        </>
      }
    >
      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <Field label="Full name" required>
          <Input
            autoComplete="name"
            value={fullName}
            onChange={(e) => setFullName(e.target.value)}
            required
          />
        </Field>

        <Field label="Email" required>
          <Input
            type="email"
            autoComplete="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </Field>

        <Field label="Password" required hint="At least 8 characters.">
          <Input
            type="password"
            autoComplete="new-password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </Field>

        <button type="submit" className="btn btn-primary btn-block" disabled={busy}>
          {busy ? 'Creating account…' : 'Create account'}
        </button>
      </form>
    </AuthLayout>
  )
}
