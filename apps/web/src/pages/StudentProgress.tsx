import { useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { BluebookScores } from '../components/BluebookScores'
import { DomainDashboard, useBothSubjects } from '../components/DomainDashboard'
import { ColourKey, Guidance, PerformanceTimeline, SectionBoxes } from '../components/StudentDashboard'
import { AimingFor, GoalPanel } from '../components/StudentGoal'
import { IconBack } from '../components/icons'
import {
  ProgressLineView,
  ScoringNote,
  SkillNotesPanel,
  skillTitle,
  useLongPattern,
} from '../components/ProgressPanels'
import { TestsSummary } from '../components/TestsSummary'
import { Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { SUBJECTS } from '../lib/constants'
import {
  progressLines,
  type ProgressConfig,
  type ProgressLine,
  type StudentProgress as Progress,
} from '../lib/progress'
import { signedInBluebook } from '../lib/bluebookApi'
import { loadConfig, loadProgress } from '../lib/progressApi'
import { EMPTY_PROGRESS, measureSubject, SUBJECT_ORDER, type SubjectMeasure } from '../lib/subjectProgress'
import { row, rows, supabase } from '../lib/supabase'
import type { BluebookRow } from '../lib/bluebook'
import { daysUntil, hasGoal, latestSat, localToday, type StudentGoal } from '../lib/goal'
import { askForPlan, readScorePicture } from '../lib/studentApi'
import { asOfDay, defaultPoint, timelinePoints } from '../lib/timeline'
import { formatUtc } from '../lib/time'
import type { Profile, Subject } from '../lib/types'

/**
 * A student's progress, skill by skill: from their baseline through every
 * targeted test, with the sessions between — every teacher's (0063).
 *
 * Staff read it and write about it here: the private note and the summary the
 * PC is given. The PC reads it and writes only a Bluebook score for their own
 * student (0099): a test shows as soon as it
 * is completed, its computed verdict with it, and the teacher's wording and
 * summary only once they are shared — student_progress sends nothing else.
 */
export function StudentProgress() {
  const { id } = useParams<{ id: string }>()
  const { isTeacher, isAdmin, isPc, profile } = useAuth()
  const [student, setStudent] = useState<Profile | null>(null)
  const [subject, setSubject] = useState<Subject>('english')
  const [progress, setProgress] = useState<Progress | null>(null)
  const [cfg, setCfg] = useState<ProgressConfig | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!id) return
    void supabase
      .from('profiles')
      .select('*')
      .eq('id', id)
      .maybeSingle()
      .then(({ data }) => setStudent(row<Profile>(data)))
  }, [id])

  useEffect(() => {
    if (!id) return
    let active = true
    setLoading(true)
    void Promise.all([loadProgress(id, subject), loadConfig(subject)]).then(([p, c]) => {
      if (!active) return
      setProgress(p.progress)
      setError(p.error)
      setCfg(c)
      setLoading(false)
    })
    return () => {
      active = false
    }
  }, [id, subject])

  const lines = useMemo(() => (progress ? progressLines(progress) : []), [progress])
  // Staff for any student, the PC for their own (0099): the database decides.
  const bluebook = useMemo(
    () =>
      id
        ? signedInBluebook({
            studentId: id,
            me: profile?.id ?? null,
            isAdmin,
            audience: isTeacher ? 'staff' : 'pc',
          })
        : null,
    [id, profile?.id, isAdmin, isTeacher],
  )
  const completed = progress?.sessions.filter((s) => s.status === 'completed').length ?? 0

  // The student's own view (the dashboard blueprint: "teacher sees the same
  // view"): their SAT scores on the timeline, their goal, and both subjects'
  // eight domains.
  const [satRows, setSatRows] = useState<BluebookRow[]>([])
  const [goal, setGoal] = useState<StudentGoal | null>(null)
  const [version, setVersion] = useState(0)
  const [selected, setSelected] = useState<string | null>(null)
  useEffect(() => {
    if (!id) return
    void supabase
      .from('bluebook_scores')
      .select('test_name, taken_on, total, reading_writing, math, official, domains')
      .eq('student_id', id)
      .then(({ data }) => setSatRows(rows<BluebookRow>(data)))
    void supabase
      .from('student_goals')
      .select('target_total, target_rw, target_math, next_test_on, registration_deadline_on, college_note, confirmed_at')
      .eq('student_id', id)
      .maybeSingle()
      .then(({ data }) => setGoal(row<StudentGoal>(data)))
  }, [id, version])

  const both = useBothSubjects(id)
  const measures = useMemo(() => {
    const out: Partial<Record<Subject, SubjectMeasure>> = {}
    for (const s of SUBJECT_ORDER) out[s] = measureSubject(s, both.progress[s] ?? EMPTY_PROGRESS, satRows)
    return out
  }, [both.progress, satRows])
  const points = useMemo(
    () => timelinePoints(satRows, hasGoal(goal) ? goal : null, student?.created_at?.slice(0, 10) ?? null),
    [satRows, goal, student?.created_at],
  )
  const chosen = selected && points.some((p) => p.id === selected) ? selected : defaultPoint(points)
  const days = goal?.next_test_on ? daysUntil(goal.next_test_on, localToday()) : null

  if (!id) return <div className="page">No such student.</div>

  return (
    <div className="page page-wide">
      <Link className="back-link" to="/students">
        <IconBack /> Students
      </Link>

      <div className="page-head">
        <h1>
          {student?.full_name ?? 'Student'}{' '}
          {student?.display_id && <span className="num muted">({student.display_id})</span>}
        </h1>
      </div>
      {student?.pc && <p className="muted">PC: {student.pc}</p>}
      <GoalPanel
        key={version}
        studentId={id}
        canEdit={isAdmin || (isPc && !!student && student.pc_id === profile?.id)}
      />

      {/* What the student sees, as they see it: one place for the whole journey. */}
      <section className="staff-same-view blueprint">
        <div className="staff-domains-head">
          <h2>The student’s view</h2>
          <Link className="btn btn-ghost btn-sm" to={`/students/${id}/section-report`}>
            Section Progress Report
          </Link>
        </div>
        <div className="dash-top">
          <AimingFor goal={hasGoal(goal) ? goal : null} sat={latestSat(satRows)} who="their" />
          <Guidance who="they" daysToExam={days} ask={(h) => askForPlan({ studentId: id, horizon: h })} />
        </div>
        <PerformanceTimeline
          points={points}
          selected={chosen}
          onSelect={setSelected}
          empty="No SAT scores yet. Add one below — read from the report, or a screenshot of it."
        />
        {both.loading ? (
          <div className="page-loading">Loading…</div>
        ) : (
          <SectionBoxes
            measures={measures}
            point={points.find((p) => p.id === chosen) ?? null}
            asOf={asOfDay(points, chosen)}
            action={(_, d) =>
              isTeacher && d.rag !== 'green' ? (
                <Link className="dash-chip" to="/sessions/new/targeted">
                  Book a check-in →
                </Link>
              ) : null
            }
          />
        )}
        <ColourKey />
        {!both.loading && (
          <details className="staff-domain-detail">
            <summary>Baseline, change and sessions by domain</summary>
            <DomainDashboard measures={measures} />
          </details>
        )}
      </section>

      {/* The whole SAT, both sections: above the subjects, not inside one (0088). */}
      {bluebook && (isTeacher || isPc) && (
        <BluebookScores
          api={bluebook}
          studentName={student?.full_name ?? null}
          readPicture={(file) => readScorePicture(file)}
          onChanged={() => setVersion((v) => v + 1)}
        />
      )}

      <div className="progress-tabs subject-tabs" role="group" aria-label="Subject">
        {SUBJECTS.map((s) => (
          <button
            key={s.value}
            type="button"
            className={subject === s.value ? 'on' : ''}
            onClick={() => setSubject(s.value)}
          >
            {s.label}
          </button>
        ))}
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {loading ? (
        <div className="page-loading">Loading…</div>
      ) : lines.length === 0 ? (
        <div className="card card-pad">
          <p>
            No targeted test has been completed in this subject yet. {completed} session
            {completed === 1 ? '' : 's'} completed.
          </p>
        </div>
      ) : (
        <>
          {cfg && <ScoringNote config={cfg} />}
          {isTeacher && (
            <TestsSummary studentId={id} subject={subject} studentName={student?.full_name ?? ''} />
          )}
          {lines.map((line) => (
            <SkillCard
              key={`${line.section}/${line.skill ?? ''}`}
              line={line}
              progress={progress}
              cfg={cfg}
              staff={isTeacher}
              studentId={id}
              subject={subject}
            />
          ))}
        </>
      )}
    </div>
  )
}

function SkillCard({
  line,
  progress,
  cfg,
  staff,
  studentId,
  subject,
}: {
  line: ProgressLine
  progress: Progress | null
  cfg: ProgressConfig | null
  staff: boolean
  studentId: string
  subject: Subject
}) {
  const pattern = useLongPattern(progress, line, cfg)
  return (
    <section className="progress-skill">
      <div className="card card-pad">
        <div className="section-title">{skillTitle(line.section, line.skill)}</div>
        <ProgressLineView line={line} />
        {pattern && <p className="muted">{pattern.text}</p>}
        {line.summary && (
          <div className="override-shared">
            <strong>Summary:</strong> {line.summary.shared}{' '}
            <span className="muted">({formatUtc(line.summary.shared_at)})</span>
          </div>
        )}
      </div>
      {staff && (
        <SkillNotesPanel
          studentId={studentId}
          subject={subject}
          section={line.section}
          skill={line.skill}
        />
      )}
    </section>
  )
}
