import { useEffect, useState, type FormEvent } from 'react'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import { AuthLayout } from '../components/AuthLayout'
import { Field, Input, Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { MIN_PASSWORD, passwordProblem, tokenFrom } from '../lib/invite'
import { acceptInvite, openInvite } from '../lib/pcApi'

type Opened = { email: string; full_name: string; joined: boolean }

/**
 * Where a PC's link lands: their address, already filled in, and a password to
 * choose. That is all there is to joining. The address was confirmed by the
 * link reaching it, so there is no email to wait for afterwards — choosing the
 * password signs them straight in.
 *
 * The same page, from a later link, is how a PC who has joined chooses a new
 * password; it says so rather than welcoming them twice.
 *
 * The link is read from the fragment (see lib/invite), and the page is matched
 * before the app asks who is signed in: it is for somebody who cannot sign in
 * yet. Opening it spends nothing — only choosing the password does.
 */
export function Join() {
  const { signIn } = useAuth()
  const navigate = useNavigate()
  const { hash } = useLocation()
  const [token] = useState(() => tokenFrom(hash))

  const [opened, setOpened] = useState<Opened | null>(null)
  const [dead, setDead] = useState<string | null>(
    token
      ? null
      : 'This link is not complete. Open it from the email again, or ask an admin to send you a new one.',
  )
  const [password, setPassword] = useState('')
  const [again, setAgain] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  useEffect(() => {
    if (!token) return
    openInvite(token)
      .then(setOpened)
      .catch((e: unknown) => setDead(e instanceof Error ? e.message : String(e)))
  }, [token])

  const problem = passwordProblem(password, again)
  const tooShort = password.length > 0 && password.length < MIN_PASSWORD
  const mismatch = again.length > 0 && again !== password

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    if (!token || !opened || problem) return
    setError(null)
    setBusy(true)
    let email: string
    try {
      ;({ email } = await acceptInvite(token, password))
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
      setBusy(false)
      return
    }
    try {
      await signIn(email, password)
      // Off the link, so Back does not return to a page whose link is spent.
      navigate('/', { replace: true })
    } catch (err) {
      // The password is saved and the link spent; only the sign-in after it
      // failed. The sign-in page is the way on from here.
      const why = err instanceof Error ? err.message : String(err)
      setDead(`Your password is saved, but signing you in did not work (${why}). Sign in with it.`)
    }
  }

  if (dead) {
    return (
      <AuthLayout
        title="This link has stopped working"
        subtitle="Links to set up an account work once, for a week."
        footer={<Link to="/login">Go to sign in</Link>}
      >
        <Notice kind="info">{dead}</Notice>
      </AuthLayout>
    )
  }

  if (!opened) {
    return (
      <AuthLayout title="One moment" subtitle="Checking your link…">
        <div />
      </AuthLayout>
    )
  }

  const first = opened.full_name.trim().split(/\s+/)[0]
  return (
    <AuthLayout
      title={opened.joined ? 'Choose a new password' : `Welcome${first ? `, ${first}` : ''}`}
      subtitle={
        opened.joined
          ? 'Your old password stops working once you save this one.'
          : 'Choose a password to finish setting up your PC account. Your email is already confirmed.'
      }
      footer={
        <>
          Already set up? <Link to="/login">Sign in</Link>
        </>
      }
    >
      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <Field label="Email">
          <Input type="email" value={opened.email} readOnly autoComplete="username" />
        </Field>

        <Field
          label={opened.joined ? 'New password' : 'Password'}
          required
          hint={tooShort ? `At least ${MIN_PASSWORD} characters.` : undefined}
        >
          <Input
            type="password"
            autoComplete="new-password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            autoFocus
            required
          />
        </Field>

        <Field
          label="The same again"
          required
          hint={mismatch ? 'The two passwords are not the same.' : undefined}
        >
          <Input
            type="password"
            autoComplete="new-password"
            value={again}
            onChange={(e) => setAgain(e.target.value)}
            required
          />
        </Field>

        <button type="submit" className="btn btn-primary btn-block" disabled={busy || problem !== null}>
          {busy ? 'Setting it up…' : opened.joined ? 'Save and sign in' : 'Create my account'}
        </button>
      </form>
    </AuthLayout>
  )
}
