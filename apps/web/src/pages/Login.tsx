import { useState, type FormEvent, type ReactNode } from 'react'
import { Link, useLocation, useNavigate, useSearchParams } from 'react-router-dom'
import { AuthLayout } from '../components/AuthLayout'
import { Field, Input, Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { PinInput } from '../components/PinInput'
import { cleanPin, signInMessage, storeStudentKey } from '../lib/studentAccount'
import { studentSignIn } from '../lib/studentApi'

/**
 * What Supabase says when the account has been suspended, and what to say back.
 *
 * 0045 bans the auth user, so the sign-in is refused before any of our own code
 * runs and the message comes back from the auth server in its own words —
 * "User is banned", which reads like a punishment from a service the teacher has
 * never heard of. They are owed the real reason and the one useful next step.
 */
function readable(message: string): string {
  if (/banned/i.test(message)) {
    return 'This account has been closed by an admin. Ask whoever runs the platform to reopen it.'
  }
  return message
}

type Who = 'staff' | 'student'

/**
 * Two ways in, one page. Staff — teachers, admins and PCs — sign in with an
 * email and password. A student signs in with their student ID and the PIN
 * their teacher gave them (0067), and lands on their own page of tests.
 * `?as=student` opens on the Student tab, for a link to give students.
 */
export function Login() {
  const [params, setParams] = useSearchParams()
  const who: Who = params.get('as') === 'student' ? 'student' : 'staff'

  function choose(next: Who) {
    setParams(next === 'student' ? { as: 'student' } : {}, { replace: true })
  }

  const tabs = (
    <div className="tabs auth-tabs" role="tablist" aria-label="Who is signing in">
      {(['staff', 'student'] as Who[]).map((w) => (
        <button
          key={w}
          type="button"
          role="tab"
          aria-selected={who === w}
          className={`tab ${who === w ? 'on' : ''}`}
          onClick={() => choose(w)}
        >
          {w === 'staff' ? 'Staff' : 'Student'}
        </button>
      ))}
    </div>
  )

  return who === 'student' ? <StudentSignIn tabs={tabs} /> : <StaffSignIn tabs={tabs} />
}

function StaffSignIn({ tabs }: { tabs: ReactNode }) {
  const { signIn } = useAuth()
  const navigate = useNavigate()
  // Where they were going before being sent here: a link from an email is a
  // link to a session, and signing in should arrive at it.
  const from = (useLocation().state as { from?: { pathname?: string; search?: string } } | null)?.from
  const next = from?.pathname && from.pathname !== '/login' ? `${from.pathname}${from.search ?? ''}` : '/'

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)
    setBusy(true)
    try {
      await signIn(email, password)
      navigate(next, { replace: true })
    } catch (err) {
      setError(err instanceof Error ? readable(err.message) : 'Could not sign in.')
    } finally {
      setBusy(false)
    }
  }

  return (
    <AuthLayout
      tabs={tabs}
      title="Sign in"
      subtitle="Teachers, admins and PCs: enter your email and password."
      footer={
        <>
          No account yet? <Link to="/signup">Create one</Link>
        </>
      }
    >
      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <Field label="Email" required>
          <Input
            type="email"
            autoComplete="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </Field>

        <Field label="Password" required>
          <Input
            type="password"
            autoComplete="current-password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </Field>

        <button type="submit" className="btn btn-primary btn-block" disabled={busy}>
          {busy ? 'Signing in…' : 'Sign in'}
        </button>
      </form>
    </AuthLayout>
  )
}

function StudentSignIn({ tabs }: { tabs: ReactNode }) {
  const navigate = useNavigate()
  const [studentId, setStudentId] = useState('')
  const [pin, setPin] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    if (!studentId.trim() || pin.length !== 4) {
      setError('Enter your student ID and your 4-digit PIN.')
      return
    }
    setError(null)
    setBusy(true)
    try {
      const result = await studentSignIn(studentId, pin)
      if (result.ok) {
        storeStudentKey(result.key)
        navigate('/student', { replace: true })
        return
      }
      setError(signInMessage(result))
      setPin('')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not sign in.')
    }
    setBusy(false)
  }

  return (
    <AuthLayout
      tabs={tabs}
      title="Student sign in"
      subtitle="Enter your student ID and the PIN your teacher gave you."
      headline="Ready when you are."
      tagline="Your tests and your results, in one place."
      footer="No ID or PIN? Ask your teacher."
    >
      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <Field label="Student ID" required hint="It looks like BATO26-1.">
          <Input
            className="input-code"
            value={studentId}
            onChange={(e) => setStudentId(e.target.value)}
            autoComplete="username"
            autoCapitalize="characters"
            spellCheck={false}
            required
          />
        </Field>

        <div className="field">
          <span className="label">
            PIN
            <span className="req" aria-hidden="true">
              *
            </span>
          </span>
          <PinInput value={pin} onChange={(v) => setPin(cleanPin(v))} />
        </div>

        <button type="submit" className="btn btn-primary btn-block" disabled={busy}>
          {busy ? 'Signing in…' : 'Sign in'}
        </button>
      </form>
    </AuthLayout>
  )
}
