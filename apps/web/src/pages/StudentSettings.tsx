import { useEffect, useState, type FormEvent } from 'react'
import { Navigate } from 'react-router-dom'
import { StudentShell } from '../components/StudentShell'
import { Field, Input, Notice } from '../components/ui'
import { storeStudentKey, storedStudentKey } from '../lib/studentAccount'
import { changeStudentPin, loadStudentReports } from '../lib/studentApi'
import { formatUtc } from '../lib/time'

/**
 * The student's settings (0100): who they are, and a new PIN when they want
 * one. The current PIN is asked for, so a device left signed in is not enough
 * to change it; a changed PIN signs every other device out.
 */
export function StudentSettings() {
  const [key] = useState(() => storedStudentKey())
  const [me, setMe] = useState<{ full_name: string; display_id: string; pc: string | null } | null>(null)
  const [signedOut, setSignedOut] = useState(false)

  useEffect(() => {
    if (!key) return
    loadStudentReports(key)
      .then((l) => setMe(l.student))
      .catch((err: unknown) => {
        if (err instanceof Error && /signed out/i.test(err.message)) {
          storeStudentKey(null)
          setSignedOut(true)
        }
      })
  }, [key])

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  return (
    <StudentShell student={me}>
      <main className="student-main dashboard settings-main">
        <h1 className="dash-hello">Settings</h1>

        <div className="settings-grid">
          <section className="dash-panel">
            <div className="dash-panel-head">
              <h2>Your details</h2>
            </div>
            <dl className="settings-facts">
              <dt>Name</dt>
              <dd>{me?.full_name ?? '…'}</dd>
              <dt>Student ID</dt>
              <dd className="num">{me?.display_id ?? '…'}</dd>
              <dt>PC</dt>
              <dd>{me ? (me.pc ?? 'Not assigned yet') : '…'}</dd>
            </dl>
            <p className="settings-note">To change your name or PC, ask your teacher.</p>
          </section>

          <ChangePin pinKey={key} />
        </div>
      </main>
    </StudentShell>
  )
}

function ChangePin({ pinKey }: { pinKey: string }) {
  const [current, setCurrent] = useState('')
  const [next, setNext] = useState('')
  const [again, setAgain] = useState('')
  const [show, setShow] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [done, setDone] = useState(false)

  const four = (v: string) => /^[0-9]{4}$/.test(v)
  const mismatch = again !== '' && next !== again
  const ready = !busy && four(current) && four(next) && next === again

  async function submit(e: FormEvent) {
    e.preventDefault()
    if (!ready) return
    setBusy(true)
    setError(null)
    setDone(false)
    try {
      const r = await changeStudentPin(pinKey, current, next)
      if (r.ok) {
        setDone(true)
        setCurrent('')
        setNext('')
        setAgain('')
      } else if (r.reason === 'wrong') setError('That isn’t your current PIN.')
      else if (r.reason === 'locked') setError(`Too many tries. Try again after ${formatUtc(r.until)}.`)
      else if (r.reason === 'same') setError('Choose a PIN different from your current one.')
      else setError('A PIN is four digits.')
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    }
    setBusy(false)
  }

  const digits = (set: (v: string) => void) => (e: React.ChangeEvent<HTMLInputElement>) =>
    set(e.target.value.replace(/\D/g, '').slice(0, 4))

  return (
    <section className="dash-panel">
      <div className="dash-panel-head">
        <h2>Change PIN</h2>
        <button type="button" className="link-btn" onClick={() => setShow((s) => !s)}>
          {show ? 'Hide' : 'Show'}
        </button>
      </div>
      <form className="settings-form" onSubmit={submit} noValidate>
        {done && <Notice kind="ok">PIN changed. Other devices have been signed out.</Notice>}
        {error && <Notice kind="error">{error}</Notice>}
        <Field label="Current PIN">
          <Input
            type={show ? 'text' : 'password'}
            inputMode="numeric"
            autoComplete="current-password"
            value={current}
            onChange={digits(setCurrent)}
          />
        </Field>
        <Field label="New PIN" hint="Four digits.">
          <Input
            type={show ? 'text' : 'password'}
            inputMode="numeric"
            autoComplete="new-password"
            value={next}
            onChange={digits(setNext)}
          />
        </Field>
        <Field label="New PIN again" hint={mismatch ? 'The two don’t match.' : undefined}>
          <Input
            type={show ? 'text' : 'password'}
            inputMode="numeric"
            autoComplete="new-password"
            value={again}
            onChange={digits(setAgain)}
          />
        </Field>
        <button type="submit" className="btn btn-primary" disabled={!ready}>
          {busy ? 'Saving…' : 'Save new PIN'}
        </button>
      </form>
    </section>
  )
}
