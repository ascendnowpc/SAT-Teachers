import { useCallback, useEffect, useState } from 'react'
import { Link, Navigate, useNavigate } from 'react-router-dom'
import { Logo } from '../components/Logo'
import { Notice } from '../components/ui'
import { subjectLabel } from '../lib/constants'
import {
  splitTests,
  standingOf,
  storeStudentKey,
  storedStudentKey,
  type StudentHome as Home,
  type StudentTest,
} from '../lib/studentAccount'
import { loadStudentHome, studentSignOut, studentTestTitle } from '../lib/studentApi'
import { rememberEntry } from '../lib/studentEntry'
import { formatUtc } from '../lib/time'

/**
 * The student's own page, once they have signed in with their ID and PIN
 * (0067): every test they have, the ones still to sit first.
 *
 * Opening a test hands its entry key to the tab (0066) and goes to its link,
 * so the test runs on exactly the screen it runs on from a link — the student
 * has already said who they are, so it asks nothing more.
 */
export function StudentHome() {
  const navigate = useNavigate()
  const [key] = useState(() => storedStudentKey())
  const [home, setHome] = useState<Home | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [signedOut, setSignedOut] = useState(false)

  const load = useCallback(async () => {
    if (!key) return
    try {
      setHome(await loadStudentHome(key))
      setError(null)
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Could not load your tests.'
      if (/signed out/i.test(message)) {
        storeStudentKey(null)
        setSignedOut(true)
      } else {
        setError(message)
      }
    }
  }, [key])

  useEffect(() => {
    void load()
    // A test opened early by the teacher, or results just shared, show up
    // without a refresh.
    const t = setInterval(() => void load(), 30_000)
    return () => clearInterval(t)
  }, [load])

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  async function signOut() {
    if (key) await studentSignOut(key)
    storeStudentKey(null)
    navigate('/login?as=student', { replace: true })
  }

  function open(t: StudentTest) {
    rememberEntry(t.link, t.entry_key)
    navigate(`/s/${t.link}`)
  }

  const { ahead, done } = splitTests(home?.sessions ?? [])
  const first = home?.student.full_name.split(' ')[0]

  return (
    <div className="student-home">
      <header className="student-bar">
        <Logo />
        <div className="student-bar-who">
          {home && (
            <span className="student-bar-id">
              {home.student.full_name} · <span className="num">{home.student.display_id}</span>
            </span>
          )}
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => void signOut()}>
            Sign out
          </button>
        </div>
      </header>

      <main className="student-main">
        <div className="student-head">
          <div>
            <h1>{first ? `Hi, ${first}` : 'Your tests'}</h1>
            <p className="muted">Your tests, and your results once your teacher shares them. Times are in UTC.</p>
          </div>
          <Link className="btn btn-primary btn-sm" to="/student/report">
            Progress report
          </Link>
        </div>

        {error && <Notice kind="error">{error}</Notice>}
        {!home && !error && <p className="muted">Loading…</p>}

        {home && (
          <>
            <section className="student-section">
              <h2>Coming up</h2>
              {ahead.length === 0 ? (
                <p className="muted">Nothing booked. Your teacher will add your next test.</p>
              ) : (
                <ul className="student-tests">
                  {ahead.map((t) => (
                    <TestRow key={t.id} test={t} onOpen={() => open(t)} />
                  ))}
                </ul>
              )}
            </section>

            {done.length > 0 && (
              <section className="student-section">
                <h2>Done</h2>
                <ul className="student-tests">
                  {done.map((t) => (
                    <TestRow key={t.id} test={t} onOpen={() => open(t)} />
                  ))}
                </ul>
              </section>
            )}
          </>
        )}
      </main>
    </div>
  )
}

function TestRow({ test, onOpen }: { test: StudentTest; onOpen: () => void }) {
  const standing = standingOf(test)
  const kind = test.mode === 'targeted' ? `${subjectLabel(test.subject)} · practice test` : `${subjectLabel(test.subject)} · diagnostic`

  return (
    <li className="student-test">
      <div className="student-test-main">
        <div className="student-test-title">{studentTestTitle(test)}</div>
        <div className="student-test-sub">
          {kind}
          {test.set_size ? ` · ${test.set_size} questions` : ''} · {formatUtc(test.scheduled_at)}
        </div>
      </div>
      <div className="student-test-side">
        {standing.kind === 'upcoming' && (
          <>
            <span className="badge badge-neutral">Not open yet</span>
            <button type="button" className="btn btn-ghost btn-sm" onClick={onOpen}>
              Open
            </button>
          </>
        )}
        {standing.kind === 'open' && (
          <>
            <span className="badge badge-sky">Open now</span>
            <button type="button" className="btn btn-primary btn-sm" onClick={onOpen}>
              Start
            </button>
          </>
        )}
        {standing.kind === 'live' && (
          <>
            <span className="badge badge-sky">In progress</span>
            <button type="button" className="btn btn-primary btn-sm" onClick={onOpen}>
              Continue
            </button>
          </>
        )}
        {standing.kind === 'results' && (
          <>
            <span className="badge badge-ok">
              {standing.right} of {standing.of} right
            </span>
            <button type="button" className="btn btn-ghost btn-sm" onClick={onOpen}>
              {standing.answers ? 'See answers' : 'See score'}
            </button>
          </>
        )}
        {standing.kind === 'waiting' && <span className="badge badge-neutral">Results coming soon</span>}
      </div>
    </li>
  )
}
