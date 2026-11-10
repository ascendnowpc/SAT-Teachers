import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, Navigate, useNavigate } from 'react-router-dom'
import { PracticeList } from '../components/PracticeList'
import { StudentShell } from '../components/StudentShell'
import { Notice } from '../components/ui'
import { subjectLabel } from '../lib/constants'
import {
  percentRight,
  splitTests,
  standingOf,
  storeStudentKey,
  storedStudentKey,
  studentStats,
  type StudentHome as Home,
  type StudentTest,
  type TestStanding,
} from '../lib/studentAccount'
import { loadStudentHome, loadStudentReports, studentTestTitle } from '../lib/studentApi'
import { rememberEntry } from '../lib/studentEntry'
import type { StudentReportEntry } from '../lib/studentReports'
import { ReportRow } from './StudentReports'
import { formatUtc } from '../lib/time'

/**
 * The student's own page, once they have signed in with their ID and PIN
 * (0067): what to do next, how they are getting on, and every test they have.
 *
 * A student opens this to answer one question — "what am I meant to be doing?"
 * — so the page answers it before anything else: the test they can start now,
 * or the next one and when it opens, as the one thing above the fold with the
 * one button on it. Their standing comes next, from their own tests and
 * nothing else, then the full list, then somewhere to go when there is
 * nothing booked.
 *
 * Opening a test hands its entry key to the tab (0066) and goes to its link,
 * so the test runs on exactly the screen it runs on from a link — the student
 * has already said who they are, so it asks nothing more.
 */
export function StudentHome() {
  const navigate = useNavigate()
  const [key] = useState(() => storedStudentKey())
  const [home, setHome] = useState<Home | null>(null)
  const [reports, setReports] = useState<StudentReportEntry[] | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [signedOut, setSignedOut] = useState(false)

  const load = useCallback(async () => {
    if (!key) return
    try {
      setHome(await loadStudentHome(key))
      setError(null)
      // The reports are a second door: one that fails (before 0098 is
      // applied, say) costs the page its reports section, not the tests.
      loadStudentReports(key)
        .then((l) => setReports(l.reports))
        .catch(() => setReports(null))
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

  const sessions = useMemo(() => home?.sessions ?? [], [home])
  const { ahead, done } = useMemo(() => splitTests(sessions), [sessions])
  const stats = useMemo(() => studentStats(sessions), [sessions])

  // What to do next: the one a student can get on with, else the soonest.
  const next = useMemo(
    () => ahead.find((t) => standingOf(t).kind === 'live')
      ?? ahead.find((t) => standingOf(t).kind === 'open')
      ?? ahead[0]
      ?? null,
    [ahead],
  )

  // Which tests have a report to open, by session.
  const reportFor = useMemo(() => new Set((reports ?? []).map((r) => r.session_id)), [reports])

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  function open(t: StudentTest) {
    rememberEntry(t.link, t.entry_key)
    navigate(`/s/${t.link}`)
  }

  const first = home?.student.full_name.split(' ')[0]
  const rest = ahead.filter((t) => t.id !== next?.id)

  return (
    <StudentShell student={home?.student}>
      <main className="student-main">
        <div className="student-greet">
          <div>
            <h1>{first ? `Hi, ${first}` : 'Your tests'}</h1>
            <p>Here is what is next, and how you are getting on.</p>
          </div>
        </div>

        {error && <Notice kind="error">{error}</Notice>}
        {!home && !error && <p className="muted">Loading…</p>}

        {home && (
          <>
            <NextUp test={next} onOpen={open} />

            {(stats.completed > 0 || stats.ahead > 0) && (
              <dl className="student-stats">
                <Stat value={String(stats.completed)} label="Tests done" />
                <Stat
                  value={percentRight(stats.marked) === null ? '—' : String(percentRight(stats.marked))}
                  unit={percentRight(stats.marked) === null ? undefined : '%'}
                  label="Answers right"
                />
                <Stat value={String(stats.ahead)} label="Still to sit" />
              </dl>
            )}

            {reports && reports.length > 0 && (
              <Section
                title="Latest reports"
                count={
                  <Link className="student-section-link" to="/student/reports">
                    See all {reports.length}
                  </Link>
                }
              >
                <ul className="student-tests">
                  {reports.slice(0, 3).map((r) => (
                    <ReportRow key={r.session_id} report={r} />
                  ))}
                </ul>
              </Section>
            )}

            {rest.length > 0 && (
              <Section title="Also coming up" count={`${rest.length} ${rest.length === 1 ? 'test' : 'tests'}`}>
                <ul className="student-tests">
                  {rest.map((t) => (
                    <TestRow key={t.id} test={t} onOpen={() => open(t)} />
                  ))}
                </ul>
              </Section>
            )}

            {done.length > 0 && (
              <Section title="Completed" count={`${done.length} ${done.length === 1 ? 'test' : 'tests'}`}>
                <ul className="student-tests">
                  {done.map((t) => (
                    <TestRow
                      key={t.id}
                      test={t}
                      onOpen={() => open(t)}
                      report={reportFor.has(t.id) ? `/student/reports/${t.id}` : null}
                    />
                  ))}
                </ul>
              </Section>
            )}

            <Section title="Practise on your own">
              <PracticeList cards />
            </Section>

            <p className="student-foot">Times are shown in UTC.</p>
          </>
        )}
      </main>
    </StudentShell>
  )
}

function Section({ title, count, children }: { title: string; count?: React.ReactNode; children: React.ReactNode }) {
  return (
    <section className="student-section">
      <div className="student-section-head">
        <h2>{title}</h2>
        {count && <span className="student-section-count">{count}</span>}
      </div>
      {children}
    </section>
  )
}

function Stat({ value, unit, label }: { value: string; unit?: string; label: string }) {
  return (
    <div className="stat-tile">
      <dt className="stat-label">{label}</dt>
      <dd className="stat-num">
        {value}
        {unit && <small>{unit}</small>}
      </dd>
    </div>
  )
}

/**
 * The one thing to do next, or the reason there is nothing: the test a student
 * can start now in full colour, the next one still to open in a quiet card,
 * and an invitation to practise where there is neither.
 */
function NextUp({ test, onOpen }: { test: StudentTest | null; onOpen: (t: StudentTest) => void }) {
  if (!test) {
    return (
      <section className="next-up is-quiet">
        <div className="next-up-tag">
          <span className="next-up-dot" />
          Nothing booked
        </div>
        <h2>You are all caught up</h2>
        <p className="next-up-meta">
          Your teacher will add your next test. Until then, the practice below is the best use of your time.
        </p>
      </section>
    )
  }

  const standing = standingOf(test)
  const ready = standing.kind === 'open' || standing.kind === 'live'
  const meta = [
    subjectLabel(test.subject),
    test.mode === 'targeted' ? 'Practice test' : 'Diagnostic',
    test.set_size ? `${test.set_size} questions` : null,
  ].filter(Boolean) as string[]

  return (
    <section className={`next-up${ready ? '' : ' is-quiet'}`}>
      <div className="next-up-tag">
        <span className="next-up-dot" />
        {standing.kind === 'live' ? 'In progress' : standing.kind === 'open' ? 'Open now' : 'Up next'}
      </div>
      <h2>{studentTestTitle(test)}</h2>
      <div className="next-up-meta">
        {meta.map((m) => (
          <span key={m}>{m}</span>
        ))}
        <span>
          {ready ? 'Opened ' : 'Opens '}
          {formatUtc(test.scheduled_at)}
        </span>
      </div>
      <div className="next-up-actions">
        <button
          type="button"
          className={ready ? 'btn-lime' : 'btn btn-primary'}
          onClick={() => onOpen(test)}
        >
          {standing.kind === 'live' ? 'Carry on' : ready ? 'Start test' : 'Open the waiting room'}
        </button>
        <span className="next-up-note">
          {ready
            ? 'Find a quiet spot — the clock starts when you do.'
            : 'You can open it now to check your link works.'}
        </span>
      </div>
    </section>
  )
}

function TestRow({ test, onOpen, report = null }: { test: StudentTest; onOpen: () => void; report?: string | null }) {
  const standing = standingOf(test)
  const sub = [
    subjectLabel(test.subject),
    test.mode === 'targeted' ? 'practice test' : 'diagnostic',
    test.set_size ? `${test.set_size} questions` : null,
    formatUtc(test.scheduled_at),
  ].filter(Boolean) as string[]

  return (
    <li className="student-test">
      <span className={`test-icon${standing.kind === 'results' || standing.kind === 'waiting' ? ' is-done' : test.subject === 'mathematics' ? ' is-math' : ''}`} aria-hidden="true">
        <TestMark standing={standing} subject={test.subject} />
      </span>
      <div className="student-test-main">
        <div className="student-test-title">{studentTestTitle(test)}</div>
        <div className="student-test-sub">{sub.join(' · ')}</div>
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
            <span className={`score-chip${scoreTone(standing.right, standing.of)}`}>
              {standing.right}
              <span className="of">/{standing.of}</span>
            </span>
            <button type="button" className="btn btn-ghost btn-sm" onClick={onOpen}>
              {standing.answers ? 'See answers' : 'See score'}
            </button>
          </>
        )}
        {standing.kind === 'waiting' && <span className="badge badge-neutral">Results coming soon</span>}
        {report && (
          <Link className="btn btn-primary btn-sm" to={report}>
            Report
          </Link>
        )}
      </div>
    </li>
  )
}

/** Green at three quarters, amber at half, and plain below it. */
function scoreTone(right: number, of: number): string {
  if (of <= 0) return ''
  const share = right / of
  if (share >= 0.75) return ''
  return share >= 0.5 ? ' is-mid' : ' is-low'
}

function TestMark({ standing, subject }: { standing: TestStanding; subject: StudentTest['subject'] }) {
  if (standing.kind === 'results' || standing.kind === 'waiting') {
    return (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.2" strokeLinecap="round" strokeLinejoin="round">
        <path d="M20 6 9 17l-5-5" />
      </svg>
    )
  }
  if (subject === 'mathematics') {
    return (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round">
        <path d="M4 7h7M7.5 3.5v7M13.5 17h7M13.5 7h7M15 14.5l4 5M19 14.5l-4 5" />
      </svg>
    )
  }
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M5 4h14v16H5zM8.5 9h7M8.5 13h7M8.5 17h4" />
    </svg>
  )
}
