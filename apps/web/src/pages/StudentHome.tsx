import { useCallback, useEffect, useMemo, useState, type ReactNode } from 'react'
import { Link, Navigate, useNavigate } from 'react-router-dom'
import { CountUp } from '../components/Motion'
import { GoalCalendar } from '../components/GoalCalendar'
import { GoalBar } from '../components/StudentGoal'
import { RagChip } from '../components/SubjectProgress'
import { StudentShell } from '../components/StudentShell'
import { Notice } from '../components/ui'
import { byDay, dayLabel, type BluebookRow } from '../lib/bluebook'
import { latestSat, toGo, type StudentGoal } from '../lib/goal'
import { asProgress, type ReportSubject, type StudentReport } from '../lib/parentReport'
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
import {
  loadStudentGoal,
  loadStudentHome,
  loadStudentReport,
  loadStudentReports,
  studentTestTitle,
} from '../lib/studentApi'
import { rememberEntry } from '../lib/studentEntry'
import type { StudentReportEntry } from '../lib/studentReports'
import {
  measureSubject,
  percent,
  strongestAndWeakest,
  SUBJECT_ORDER,
  SUBJECT_VIEW,
  testBySection,
  type SubjectMeasure,
} from '../lib/subjectProgress'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { Subject } from '../lib/types'

/**
 * The student's dashboard (0067): their goal and next SAT across the top
 * (0101), then English and Math side by side, each with its own figures, its
 * last test split by section, what is next and its results. Opening a test
 * hands its entry key to the tab (0066) and goes to its link, so it asks
 * nothing more.
 */
export function StudentHome() {
  const navigate = useNavigate()
  const [key] = useState(() => storedStudentKey())
  const [home, setHome] = useState<Home | null>(null)
  const [reports, setReports] = useState<StudentReportEntry[] | null>(null)
  const [detail, setDetail] = useState<StudentReport | null>(null)
  const [sat, setSat] = useState<BluebookRow[]>([])
  const [goal, setGoal] = useState<StudentGoal | null>(null)
  // Only once it has loaded does "no goal" mean "set them now".
  const [goalLoaded, setGoalLoaded] = useState(false)
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
      loadStudentReport(key)
        .then(setDetail)
        .catch(() => setDetail(null))
      loadStudentGoal(key)
        .then((g) => {
          setGoal(g)
          setGoalLoaded(true)
        })
        .catch(() => undefined)
      void supabase.rpc('student_bluebook_scores', { p_key: key }).then(({ data }) => {
        setSat(byDay((data ?? []) as BluebookRow[]))
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
  const reportFor = useMemo(() => new Set((reports ?? []).map((r) => r.session_id)), [reports])
  const latest = useMemo(() => latestSat(sat), [sat])
  // Each subject by domain, for its strengths and weaknesses.
  const measures = useMemo(() => {
    const out: Partial<Record<Subject, SubjectMeasure>> = {}
    for (const s of SUBJECT_ORDER) {
      const payload = detail?.subjects[s]
      if (payload) out[s] = measureSubject(s, asProgress(payload))
    }
    return out
  }, [detail])

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  function open(t: StudentTest) {
    rememberEntry(t.link, t.entry_key)
    navigate(`/s/${t.link}`)
  }

  const first = home?.student.full_name.split(' ')[0]

  return (
    <StudentShell student={home?.student}>
      <main className="student-main dashboard">
        <h1 className="dash-hello">{first ? `Hi, ${first}` : 'Your dashboard'}</h1>

        {error && <Notice kind="error">{error}</Notice>}
        {!home && !error && <p className="muted">Loading…</p>}

        {home && (
          <>
            <GoalBar pinKey={key} goal={goal} sat={latest} onSaved={setGoal} onboarding={goalLoaded} />

            <div className="subject-cols">
              {SUBJECT_ORDER.map((s) => (
                <SubjectColumn
                  key={s}
                  subject={s}
                  tests={sessions.filter((t) => t.subject === s)}
                  items={detail?.subjects[s]?.items ?? null}
                  measure={measures[s] ?? null}
                  satScore={latest ? (s === 'english' ? latest.rw : latest.math) : null}
                  target={s === 'english' ? (goal?.target_rw ?? null) : (goal?.target_math ?? null)}
                  reportFor={reportFor}
                  onOpen={open}
                />
              ))}
            </div>

            <div className="home-bottom">
              <GoalCalendar goal={goal} tests={sessions} />
              <section className="dash-panel dash-practice">
                <div className="dash-panel-head">
                  <h2>More practice</h2>
                </div>
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
              </section>
            </div>
          </>
        )}
      </main>
    </StudentShell>
  )
}

/** One subject's half of the page: its figures, its last test by section, what is next, and its results. */
function SubjectColumn({
  subject,
  tests,
  items,
  measure,
  satScore,
  target,
  reportFor,
  onOpen,
}: {
  subject: Subject
  tests: StudentTest[]
  items: ReportSubject['items'] | null
  measure: SubjectMeasure | null
  satScore: number | null
  target: number | null
  reportFor: Set<string>
  onOpen: (t: StudentTest) => void
}) {
  const view = SUBJECT_VIEW[subject]
  const { ahead, done } = useMemo(() => splitTests(tests), [tests])
  const stats = useMemo(() => studentStats(tests), [tests])
  const pct = percentRight(stats.marked)

  // What to do next: the one a student can get on with, else the soonest.
  const next =
    ahead.find((t) => standingOf(t).kind === 'live') ??
    ahead.find((t) => standingOf(t).kind === 'open') ??
    ahead[0] ??
    null
  const rest = ahead.filter((t) => t.id !== next?.id)
  // The last test the student has been given back.
  const last = done.find((t) => standingOf(t).kind === 'results') ?? null
  const gap = toGo(satScore, target)

  return (
    <section className={`subject-home tone-${view.tone}`} aria-label={view.name}>
      <header className="subject-home-head">
        <div className="subject-home-title">
          <span className="subject-mark" aria-hidden="true" />
          <h2>{view.name}</h2>
          {subject === 'english' && <small>{view.sat}</small>}
        </div>
        <Link className="subject-home-more" to={`/student/report?subject=${subject}`}>
          Progress by section
        </Link>
      </header>

      <div className="subject-home-figures">
        <Figure icon={<IconCheck />} label="Tests done" value={String(stats.completed)} />
        <Figure icon={<IconTarget />} label="Accuracy" value={pct === null ? '—' : `${pct}%`} />
        <Figure icon={<IconClock />} label="To do" value={String(stats.ahead)} />
        <Figure
          icon={<IconStar />}
          label="SAT score"
          value={satScore === null ? '—' : String(satScore)}
          foot={target !== null ? `Goal ${target}${gap ? ` · ${gap.toLowerCase()}` : ''}` : undefined}
        />
      </div>

      {measure && measure.tests > 0 && <DomainStanding measure={measure} />}

      <div className="subject-block">
        <h3>Last test</h3>
        {last ? (
          <LastTest test={last} items={items} reportFor={reportFor} onOpen={onOpen} />
        ) : (
          <p className="dash-empty">
            {done.length > 0 ? 'Your score shows here once it’s ready.' : `No ${view.name} test done yet.`}
          </p>
        )}
      </div>

      <div className="subject-block">
        <h3>Up next</h3>
        <NextUp test={next} subject={subject} onOpen={onOpen} />
        {rest.length > 0 && (
          <ul className="dash-list dash-after">
            {rest.slice(0, 3).map((t) => (
              <li key={t.id}>
                <span className="dash-dot" />
                <div className="dash-list-main">
                  <strong>{studentTestTitle(t)}</strong>
                  <span>{formatUtc(t.scheduled_at)}</span>
                </div>
                <button type="button" className="dash-chip" onClick={() => onOpen(t)}>
                  Open
                </button>
              </li>
            ))}
          </ul>
        )}
      </div>

      {done.length > 1 && (
        <div className="subject-block">
          <div className="subject-block-head">
            <h3>Earlier results</h3>
            {reportFor.size > 0 && <Link to="/student/reports">All reports</Link>}
          </div>
          <ul className="dash-list">
            {done
              .filter((t) => t.id !== last?.id)
              .slice(0, 4)
              .map((t) => (
                <ResultRow key={t.id} test={t} hasReport={reportFor.has(t.id)} onOpen={onOpen} />
              ))}
          </ul>
        </div>
      )}
    </section>
  )
}

/** Strengths and weaknesses by domain: each of the four, where it stands now, the strongest and the weakest named. */
function DomainStanding({ measure }: { measure: SubjectMeasure }) {
  const { strongest, weakest } = strongestAndWeakest(measure)
  return (
    <div className="subject-block">
      <h3>By domain</h3>
      <ul className="home-domains">
        {measure.sections.map((s) => (
          <li key={s.section}>
            <span className="home-domain-name">
              {s.label}
              {s === strongest && <em className="home-domain-tag is-strong">Strongest</em>}
              {s === weakest && <em className="home-domain-tag is-weak">Focus</em>}
            </span>
            <span className="home-domain-score num">{s.latest ? `${s.latest.right}/${s.latest.of}` : '—'}</span>
            <RagChip rag={s.rag} small />
          </li>
        ))}
      </ul>
    </div>
  )
}

/** The last test: its score, and the same score split by section. */
function LastTest({
  test,
  items,
  reportFor,
  onOpen,
}: {
  test: StudentTest
  items: ReportSubject['items'] | null
  reportFor: Set<string>
  onOpen: (t: StudentTest) => void
}) {
  const s = standingOf(test)
  if (s.kind !== 'results') return null
  const pct = percent({ right: s.right, of: s.of }) ?? 0
  const parts = items ? testBySection(test.subject, items, test.id, test.mode !== 'targeted') : []

  return (
    <div className="last-test">
      <div className="last-test-head">
        <div className="dash-list-main">
          <strong>{studentTestTitle(test)}</strong>
          <span>
            {test.mode === 'targeted' ? 'Practice test' : 'Diagnostic'} · {dayLabel(test.scheduled_at.slice(0, 10))}
          </span>
        </div>
        <div className="last-test-score">
          <span className="last-test-big num">
            {s.right}
            <span className="of">/{s.of}</span>
          </span>
          <span className={`score-chip${tone(s.right, s.of)}`}>{pct}%</span>
        </div>
      </div>

      {parts.length > 0 && (
        <ul className="last-test-parts" aria-label="By section">
          {parts.map((p) => {
            const share = percent(p) ?? 0
            return (
              <li key={p.section}>
                <span className="last-test-part-name">{p.label}</span>
                <span className="last-test-part-track" aria-hidden="true">
                  <span style={{ width: `${Math.max(share, 3)}%` }} />
                </span>
                <span className="last-test-part-score num">
                  {p.right}/{p.of}
                </span>
              </li>
            )
          })}
        </ul>
      )}

      <div className="last-test-actions">
        {reportFor.has(test.id) ? (
          <Link className="dash-chip" to={`/student/reports/${test.id}`}>
            Report
          </Link>
        ) : (
          <button type="button" className="dash-chip" onClick={() => onOpen(test)}>
            {s.answers ? 'Answers' : 'Score'}
          </button>
        )}
      </div>
    </div>
  )
}

function ResultRow({ test, hasReport, onOpen }: { test: StudentTest; hasReport: boolean; onOpen: (t: StudentTest) => void }) {
  const s = standingOf(test)
  return (
    <li>
      <span className="dash-dot" />
      <div className="dash-list-main">
        <strong>{studentTestTitle(test)}</strong>
        <span>{dayLabel(test.scheduled_at.slice(0, 10))}</span>
      </div>
      {s.kind === 'results' ? (
        <span className={`score-chip${tone(s.right, s.of)}`}>
          {s.right}
          <span className="of">/{s.of}</span>
        </span>
      ) : (
        <span className="dash-muted">Soon</span>
      )}
      {hasReport ? (
        <Link className="dash-chip" to={`/student/reports/${test.id}`}>
          Report
        </Link>
      ) : s.kind === 'results' ? (
        <button type="button" className="dash-chip" onClick={() => onOpen(test)}>
          {s.answers ? 'Answers' : 'Score'}
        </button>
      ) : (
        <span />
      )}
    </li>
  )
}

function Figure({ icon, label, value, foot }: { icon: ReactNode; label: string; value: string; foot?: string }) {
  return (
    <div className="subject-home-figure">
      <div className="subject-home-figure-top">
        <span className="dash-stat-icon" aria-hidden="true">
          {icon}
        </span>
        <span>{label}</span>
      </div>
      <div className="subject-home-figure-bottom">
        <CountUp className="subject-home-figure-value" value={value} />
        {foot && <span className="subject-home-figure-foot">{foot}</span>}
      </div>
    </div>
  )
}

/** The next test, with the one button on it. */
function NextUp({ test, subject, onOpen }: { test: StudentTest | null; subject: Subject; onOpen: (t: StudentTest) => void }) {
  if (!test) return <p className="dash-empty">Nothing booked in {SUBJECT_VIEW[subject].name} — you’re all caught up.</p>
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
          {test.mode === 'targeted' ? 'Practice test' : 'Diagnostic'}
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

const svg = { width: 16, height: 16, viewBox: '0 0 24 24', fill: 'none', stroke: 'currentColor', strokeWidth: 2, strokeLinecap: 'round' as const, strokeLinejoin: 'round' as const }
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
