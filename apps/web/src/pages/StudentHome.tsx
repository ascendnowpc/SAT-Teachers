import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, Navigate, useNavigate } from 'react-router-dom'
import { BluebookAdd } from '../components/BluebookScores'
import { Onboarding } from '../components/Onboarding'
import {
  ColourKey,
  Guidance,
  PerformanceTimeline,
  SectionBoxes,
  UploadCard,
  YourTests,
} from '../components/StudentDashboard'
import { AimingFor, GoalForm } from '../components/StudentGoal'
import { StudentShell } from '../components/StudentShell'
import { Notice } from '../components/ui'
import { byDay, type BluebookRow } from '../lib/bluebook'
import { studentBluebook } from '../lib/bluebookApi'
import { daysUntil, latestSat, localToday, type GoalState } from '../lib/goal'
import { asProgress, type StudentReport } from '../lib/parentReport'
import { PRACTICE_RESOURCES } from '../lib/satGuide'
import { storeStudentKey, storedStudentKey, type StudentHome as Home, type StudentTest } from '../lib/studentAccount'
import {
  askForPlan,
  finishOnboarding,
  loadStudentGoal,
  loadStudentHome,
  loadStudentReport,
  loadStudentReports,
  readScorePicture,
  saveStudentGoal,
} from '../lib/studentApi'
import { rememberEntry } from '../lib/studentEntry'
import type { StudentReportEntry } from '../lib/studentReports'
import { measureSubject, SUBJECT_ORDER, type SubjectMeasure } from '../lib/subjectProgress'
import { asOfDay, defaultPoint, timelinePoints } from '../lib/timeline'
import type { Subject } from '../lib/types'

/**
 * The student's dashboard, as the blueprint Ascend Now aligned on lays it out
 * (0067, 0105). On the first login, "let's start": the SAT date, a score from
 * before, the goal and why. Then: what they are aiming for — kept small on
 * purpose — and "What should I do?"; every test on a timeline; English and
 * Math, each opening into its domains out of 40, coloured; the score report
 * upload; and their tests. The total is de-emphasised: the platform lives in
 * the two sections, the domains and the timeline.
 */
export function StudentHome() {
  const navigate = useNavigate()
  const [key] = useState(() => storedStudentKey())
  const [home, setHome] = useState<Home | null>(null)
  const [reports, setReports] = useState<StudentReportEntry[] | null>(null)
  const [detail, setDetail] = useState<StudentReport | null>(null)
  const [sat, setSat] = useState<BluebookRow[]>([])
  const [goalState, setGoalState] = useState<GoalState | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [signedOut, setSignedOut] = useState(false)
  const [selected, setSelected] = useState<string | null>(null)
  const [editing, setEditing] = useState(false)
  const [uploading, setUploading] = useState(false)

  const scores = useMemo(() => (key ? studentBluebook(key) : null), [key])

  const loadScores = useCallback(async () => {
    if (!scores) return
    try {
      setSat(byDay((await scores.load()) as unknown as BluebookRow[]))
    } catch {
      // On the side: a failure costs the timeline, not the page.
    }
  }, [scores])

  const load = useCallback(async () => {
    if (!key) return
    try {
      setHome(await loadStudentHome(key))
      setError(null)
      loadStudentReports(key)
        .then((l) => setReports(l.reports))
        .catch(() => setReports(null))
      loadStudentReport(key)
        .then(setDetail)
        .catch(() => setDetail(null))
      loadStudentGoal(key)
        .then(setGoalState)
        .catch(() => undefined)
      void loadScores()
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Could not load your tests.'
      if (/signed out/i.test(message)) {
        storeStudentKey(null)
        setSignedOut(true)
      } else {
        setError(message)
      }
    }
  }, [key, loadScores])

  useEffect(() => {
    void load()
    // A test opened early, or results just shared, show up without a refresh.
    const t = setInterval(() => void load(), 30_000)
    return () => clearInterval(t)
  }, [load])

  const goal = goalState?.goal ?? null
  const latest = useMemo(() => latestSat(sat), [sat])
  const measures = useMemo(() => {
    const out: Partial<Record<Subject, SubjectMeasure>> = {}
    for (const s of SUBJECT_ORDER) {
      const payload = detail?.subjects[s]
      if (payload) out[s] = measureSubject(s, asProgress(payload), sat)
    }
    return out
  }, [detail, sat])
  const points = useMemo(() => timelinePoints(sat, goal, goalState?.joined_on ?? null), [sat, goal, goalState])
  const chosen = selected && points.some((p) => p.id === selected) ? selected : defaultPoint(points)
  const point = points.find((p) => p.id === chosen) ?? null
  const reportFor = useMemo(() => new Set((reports ?? []).map((r) => r.session_id)), [reports])
  const today = localToday()
  const days = goal?.next_test_on ? daysUntil(goal.next_test_on, today) : null

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  function open(t: StudentTest) {
    rememberEntry(t.link, t.entry_key)
    navigate(`/s/${t.link}`)
  }
  const readPicture = (file: File) => readScorePicture(file, key)
  const first = home?.student.full_name.split(' ')[0]

  // The first login: "let's start", once.
  if (home && goalState && !goalState.onboarded_at && scores) {
    return (
      <StudentShell student={home.student}>
        <main className="student-main dashboard">
          <Onboarding
            name={home.student.full_name}
            initial={goal}
            scores={scores}
            readPicture={readPicture}
            onSave={async (g) => setGoalState(await saveStudentGoal(key, g))}
            onFinish={async () => {
              setGoalState(await finishOnboarding(key))
              await loadScores()
            }}
          />
        </main>
      </StudentShell>
    )
  }

  return (
    <StudentShell student={home?.student}>
      <main className="student-main dashboard blueprint">
        <h1 className="dash-hello">{first ? `Hi, ${first}` : 'Your dashboard'}</h1>

        {error && <Notice kind="error">{error}</Notice>}
        {!home && !error && <p className="muted">Loading…</p>}

        {home && (
          <>
            {editing ? (
              <GoalForm
                title="Your goal"
                intro="Change anything, any time — nothing is locked in. Your PC sees the change."
                initial={goal}
                onSubmit={async (g) => {
                  setGoalState(await saveStudentGoal(key, g))
                  setEditing(false)
                }}
                onCancel={() => setEditing(false)}
              />
            ) : (
              <div className="dash-top">
                <AimingFor goal={goal} sat={latest} onEdit={() => setEditing(true)} editLabel="editable" />
                <Guidance daysToExam={days} ask={(h) => askForPlan({ key, horizon: h })} />
              </div>
            )}

            <PerformanceTimeline
              points={points}
              selected={chosen}
              onSelect={setSelected}
              empty={
                <>
                  No SAT scores yet. Upload a score report below — an official SAT or a Bluebook practice test, from before
                  you joined too — and it starts your timeline.
                </>
              }
            />

            <SectionBoxes measures={measures} point={point} asOf={asOfDay(points, chosen)} />
            <ColourKey />

            <div className="dash-bottom">
              <UploadCard open={uploading} onOpen={() => setUploading(true)}>
                {scores && (
                  <BluebookAdd
                    api={scores}
                    studentName={home.student.full_name}
                    readPicture={readPicture}
                    onDone={async (saved) => {
                      setUploading(false)
                      if (saved) {
                        await loadScores()
                        setSelected(null)
                      }
                    }}
                  />
                )}
              </UploadCard>
              <YourTests
                tests={home.sessions}
                reportFor={reportFor}
                onOpen={open}
                footer={reportFor.size > 0 ? <Link to="/student/reports">All reports</Link> : null}
              />
            </div>

            <p className="practice-line">
              More practice:{' '}
              {PRACTICE_RESOURCES.map((r, i) => (
                <span key={r.href}>
                  {i > 0 && ' · '}
                  <a href={r.href} target="_blank" rel="noreferrer">
                    {r.label}
                  </a>
                </span>
              ))}
            </p>
          </>
        )}
      </main>
    </StudentShell>
  )
}
