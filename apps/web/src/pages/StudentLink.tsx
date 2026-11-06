import { useMemo, useState, type FormEvent } from 'react'
import { useParams } from 'react-router-dom'
import { AuthLayout } from '../components/AuthLayout'
import { Field, Input, Notice } from '../components/ui'
import { enterByLink, linkGateway } from '../lib/gateway'
import { rememberEntry, rememberedEntry } from '../lib/studentEntry'
import { StudentStage } from './StudentStage'

/**
 * The session, opened from the link the teacher sent.
 *
 * The link is the address and the student ID is the login (0066). Opening it
 * asks for the ID; the right one is exchanged for the session's entry key,
 * and everything the test does after that — start, answer, hand in — goes
 * through the token RPCs with that key. The tab keeps the key, so a refresh
 * mid-test does not ask again, and a new tab does.
 *
 * It sits outside the auth gate in App, so a teacher who happens to be signed
 * in on the same browser sees the student's screen here, once they type the
 * student's ID. That is the point of the route: it is what the student sees.
 */
export function StudentLink() {
  const { token } = useParams<{ token: string }>()
  const [key, setKey] = useState<string | null>(() => (token ? rememberedEntry(token) : null))
  const gateway = useMemo(() => (key ? linkGateway(key) : null), [key])

  if (!token) {
    return (
      <div className="exam-wait">
        <h2>That link is not valid</h2>
        <p>Ask your teacher to send it again.</p>
      </div>
    )
  }

  if (!gateway) {
    return (
      <EnterStudentId
        link={token}
        onEntered={(k) => {
          rememberEntry(token, k)
          setKey(k)
        }}
      />
    )
  }

  return <StudentStage gateway={gateway} />
}

/** The login: one box, the student's ID. */
function EnterStudentId({ link, onEntered }: { link: string; onEntered: (key: string) => void }) {
  const [studentId, setStudentId] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    if (!studentId.trim()) {
      setError('Enter your student ID.')
      return
    }
    setError(null)
    setBusy(true)
    try {
      onEntered(await enterByLink(link, studentId))
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not open the test. Try again.')
      setBusy(false)
    }
  }

  return (
    <AuthLayout
      title="Enter your student ID"
      subtitle="Your teacher sent you this test. Type your student ID to open it."
      headline="Ready when you are."
      tagline="One question at a time, on the clock."
    >
      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <Field label="Student ID" required hint="It looks like BATO26-1. Ask your teacher if you do not know it.">
          <Input
            className="input-code"
            value={studentId}
            onChange={(e) => setStudentId(e.target.value)}
            autoComplete="off"
            autoCapitalize="characters"
            spellCheck={false}
            autoFocus
            required
          />
        </Field>

        <button type="submit" className="btn btn-primary btn-block" disabled={busy}>
          {busy ? 'Opening…' : 'Open my test'}
        </button>
      </form>
    </AuthLayout>
  )
}
