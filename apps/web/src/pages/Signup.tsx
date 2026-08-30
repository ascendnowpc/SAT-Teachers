import { useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { AuthLayout } from '../components/AuthLayout'
import { Field, Input, Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'

type SignupRole = 'teacher' | 'student'

const ROLES: { value: SignupRole; title: string; blurb: string }[] = [
  { value: 'teacher', title: 'Teacher', blurb: 'Write questions, run sessions' },
  { value: 'student', title: 'Student', blurb: 'Answer questions in a session' },
]

export function Signup() {
  const { signUp } = useAuth()
  const navigate = useNavigate()

  const [role, setRole] = useState<SignupRole>('teacher')
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
      const { needsConfirmation } = await signUp({ email, password, fullName, role })
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
      title="Create your account"
      subtitle="Pick your role, and we'll set you up with an ID."
      footer={
        <>
          Already have an account? <Link to="/login">Sign in</Link>
        </>
      }
    >
      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <span className="label" style={{ display: 'block', marginBottom: 6, fontSize: 13.5, fontWeight: 500 }}>
          I am a<span className="req" aria-hidden="true">*</span>
        </span>
        <div className="role-pick" role="radiogroup" aria-label="Role">
          {ROLES.map((r) => (
            <button
              key={r.value}
              type="button"
              role="radio"
              aria-checked={role === r.value}
              className={role === r.value ? 'role-opt on' : 'role-opt'}
              onClick={() => setRole(r.value)}
            >
              <span className="t">{r.title}</span>
              <span className="d">{r.blurb}</span>
            </button>
          ))}
        </div>

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
