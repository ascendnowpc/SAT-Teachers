import { useCallback, useEffect, useMemo, useState, type ReactNode } from 'react'
import { Link, Navigate, useNavigate } from 'react-router-dom'
import { CountUp } from '../components/Motion'
import { StudentShell } from '../components/StudentShell'
import { Notice } from '../components/ui'
import { byDay, dayLabel } from '../lib/bluebook'
import { subjectLabel } from '../lib/constants'
import { PRACTICE_RESOURCES } from '../lib/satGuide'
import {
  percentRight,
  splitTests,
  standingOf,
  storeStudentKey,
  storedStudentKey,
  studentStats,
  type StudentHome as Home,
  type StudentTest,
} from '../lib/studentAccount'
import { loadStudentHome, loadStudentReports, studentTestTitle } from '../lib/studentApi'
import { rememberEntry } from '../lib/studentEntry'
import type { StudentReportEntry } from '../lib/studentReports'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'

/**
 * The student's dashboard (0067): four figures, the next test, and their
 * results — one glance, no reading. Opening a test hands its entry key to the
 * tab (0066) and goes to its link, so it asks nothing more.
 */
export function StudentHome() {
  const navigate = useNavigate()
  const [key] = useState(() => storedStudentKey())
  const [home, setHome] = useState<Home | null>(null)
  const [reports, setReports] = useState<StudentReportEntry[] | null>(null)
  const [sat, setSat] = useState<{ total: number; taken_on: string } | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [signedOut, setSignedOut] = useState(false)

  const load = useCallback(async () => {
    if (!key) return
    try {
      setHome(await loadStudentHome(key))
      setError(null)
      // On the side: a failure costs the page a figure, not the tests.
      loadStudentReports(key)
        .then((l) => setReports(l.reports))
        .catch(() => setReports(null))
      void supabase.rpc('student_bluebook_scores', { p_key: key }).then(({ data }) => {
        const rows = byDay((data ?? []) as { total: number; taken_on: string }[])
        setSat(rows[rows.length - 1] ?? null)
      })
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
    // A test opened early, or results just shared, show up without a refresh.
    const t = setInterval(() => void load(), 30_000)
    return () => clearInterval(t)
  }, [load])

  const sessions = useMemo(() => home?.sessions ?? [], [home])
  const { ahead, done } = useMemo(() => splitTests(sessions), [sessions])
  const stats = useMemo(() => studentStats(sessions), [sessions])
  const reportFor = useMemo(() => new Set((reports ?? []).map((r) => r.session_id)), [reports])

  // What to do next: the one a student can get on with, else the soonest.
  const next = useMemo(
    () =>
      ahead.find((t) => standingOf(t).kind === 'live') ??
      ahead.find((t) => standingOf(t).kind === 'open') ??
      ahead[0] ??
      null,
    [ahead],
  )

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  function open(t: StudentTest) {
    rememberEntry(t.link, t.entry_key)
    navigate(`/s/${t.link}`)
  }

  const first = home?.student.full_name.split(' ')[0]
  const rest = ahead.filter((t) => t.id !== next?.id)
  const pct = percentRight(stats.marked)

  return (
    <StudentShell student={home?.student}>
      <main className="student-main dashboard">
        <h1 className="dash-hello">{first ? `Hi, ${first}` : 'Your dashboard'}</h1>

        {error && <Notice kind="error">{error}</Notice>}
        {!home && !error && <p className="muted">Loading…</p>}

        {home && (
          <>
            <div className="dash-stats">
              <StatCard tone="violet" icon={<IconCheck />} label="Tests done" value={String(stats.completed)} />
              <StatCard tone="sky" icon={<IconTarget />} label="Accuracy" value={pct === null ? '—' : `${pct}%`} />
              <StatCard tone="mint" icon={<IconClock />} label="To do" value={String(stats.ahead)} />
              <StatCard
                tone="peach"
                icon={<IconStar />}
                label="SAT score"
                value={sat ? String(sat.total) : '—'}
                foot={
                  <Link to="/student/report#sat-scores">{sat ? dayLabel(sat.taken_on) : 'Add a score'}</Link>
                }
              />
            </div>

            <div className="dash-grid">
              <div className="dash-col">
                <Panel title="Up next">
                  <NextUp test={next} onOpen={open} />
                  {rest.length > 0 && (
                    <ul className="dash-list dash-after">
                      {rest.slice(0, 4).map((t) => (
                        <li key={t.id}>
                          <span className={`dash-dot ${t.subject === 'mathematics' ? 'is-sky' : 'is-violet'}`} />
                          <div className="dash-list-main">
                            <strong>{studentTestTitle(t)}</strong>
                            <span>{formatUtc(t.scheduled_at)}</span>
                          </div>
                          <button type="button" className="dash-chip" onClick={() => open(t)}>
                            Open
                          </button>
                        </li>
                      ))}
                    </ul>
                  )}
                </Panel>

                <Panel
                  title="Results"
                  action={reports && reports.length > 0 ? <Link to="/student/reports">All reports</Link> : null}
                >
                  {done.length === 0 ? (
                    <p className="dash-empty">Your scores show here after each test.</p>
                  ) : (
                    <ul className="dash-list">
                      {done.slice(0, 5).map((t) => {
                        const s = standingOf(t)
                        return (
                          <li key={t.id}>
                            <span className={`dash-dot ${t.subject === 'mathematics' ? 'is-sky' : 'is-violet'}`} />
                            <div className="dash-list-main">
                              <strong>{studentTestTitle(t)}</strong>
                              <span>
                                {subjectLabel(t.subject)} · {dayLabel(t.scheduled_at.slice(0, 10))}
                              </span>
                            </div>
                            {s.kind === 'results' ? (
                              <span className={`score-chip${tone(s.right, s.of)}`}>
                                {s.right}
                                <span className="of">/{s.of}</span>
                              </span>
                            ) : (
                              <span className="dash-muted">Soon</span>
                            )}
                            {reportFor.has(t.id) ? (
                              <Link className="dash-chip" to={`/student/reports/${t.id}`}>
                                Report
                              </Link>
                            ) : s.kind === 'results' ? (
                              <button type="button" className="dash-chip" onClick={() => open(t)}>
                                {s.answers ? 'Answers' : 'Score'}
                              </button>
                            ) : (
                              <span />
                            )}
                          </li>
                        )
                      })}
                    </ul>
                  )}
                </Panel>
              </div>

              <Panel title="Practice">
                <ul className="dash-links">
                  {PRACTICE_RESOURCES.map((r) => (
                    <li key={r.href}>
                      <a href={r.href} target="_blank" rel="noreferrer">
                        {r.label}
                        <span aria-hidden="true">↗</span>
                      </a>
                    </li>
                  ))}
                </ul>
              </Panel>
            </div>
          </>
        )}
      </main>
    </StudentShell>
  )
}

function Panel({ title, action, children }: { title: string; action?: ReactNode; children: ReactNode }) {
  return (
    <section className="dash-panel">
      <div className="dash-panel-head">
        <h2>{title}</h2>
        {action}
      </div>
      {children}
    </section>
  )
}

function StatCard({
  tone,
  icon,
  label,
  value,
  foot,
}: {
  tone: 'violet' | 'sky' | 'mint' | 'peach'
  icon: ReactNode
  label: string
  value: string
  foot?: ReactNode
}) {
  return (
    <div className={`dash-stat is-${tone}`}>
      <div className="dash-stat-top">
        <span className="dash-stat-icon" aria-hidden="true">
          {icon}
        </span>
        <span className="dash-stat-label">{label}</span>
      </div>
      <div className="dash-stat-bottom">
        <CountUp className="dash-stat-value" value={value} />
        {foot && <div className="dash-stat-foot">{foot}</div>}
      </div>
    </div>
  )
}

/** The next test, with the one button on it. */
function NextUp({ test, onOpen }: { test: StudentTest | null; onOpen: (t: StudentTest) => void }) {
  if (!test) return <p className="dash-empty">You’re all caught up.</p>
  const standing = standingOf(test)
  const ready = standing.kind === 'open' || standing.kind === 'live'
  return (
    <div className={`dash-next${ready ? ' is-ready' : ''}`}>
      <div>
        <div className="dash-next-tag">
          {standing.kind === 'live' ? 'In progress' : ready ? 'Open now' : `Opens ${formatUtc(test.scheduled_at)}`}
        </div>
        <div className="dash-next-title">{studentTestTitle(test)}</div>
        <div className="dash-next-meta">
          {subjectLabel(test.subject)} · {test.mode === 'targeted' ? 'Practice test' : 'Diagnostic'}
          {test.set_size ? ` · ${test.set_size} questions` : ''}
        </div>
      </div>
      <button type="button" className={ready ? 'btn-lime' : 'btn btn-ghost btn-sm'} onClick={() => onOpen(test)}>
        {standing.kind === 'live' ? 'Continue' : ready ? 'Start' : 'Open'}
      </button>
    </div>
  )
}

/** Green at three quarters, amber at half, and red below it. */
function tone(right: number, of: number): string {
  if (of <= 0) return ''
  const share = right / of
  if (share >= 0.75) return ''
  return share >= 0.5 ? ' is-mid' : ' is-low'
}

const svg = { width: 18, height: 18, viewBox: '0 0 24 24', fill: 'none', stroke: 'currentColor', strokeWidth: 2, strokeLinecap: 'round' as const, strokeLinejoin: 'round' as const }
const IconCheck = () => (
  <svg {...svg}>
    <path d="M20 6 9 17l-5-5" />
  </svg>
)
const IconTarget = () => (
  <svg {...svg}>
    <circle cx="12" cy="12" r="8" />
    <circle cx="12" cy="12" r="3" />
  </svg>
)
const IconClock = () => (
  <svg {...svg}>
    <circle cx="12" cy="12" r="8" />
    <path d="M12 8v4l3 2" />
  </svg>
)
const IconStar = () => (
  <svg {...svg}>
    <path d="m12 3 2.7 5.6 6.1.9-4.4 4.3 1 6.1L12 17l-5.4 2.9 1-6.1-4.4-4.3 6.1-.9z" />
  </svg>
)
