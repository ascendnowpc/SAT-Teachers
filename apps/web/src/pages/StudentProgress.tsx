import { useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { BluebookScores } from '../components/BluebookScores'
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
import { row, supabase } from '../lib/supabase'
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

  if (!id) return <div className="page">No such student.</div>

  return (
    <div className="page page-wide">
      <Link className="back-link" to="/sessions">
        <IconBack /> Sessions
      </Link>

      <div className="page-head">
        <h1>
          {student?.full_name ?? 'Student'}{' '}
          {student?.display_id && <span className="num muted">({student.display_id})</span>}
        </h1>
      </div>
      <p className="muted">
        SAT scores — official SATs and Bluebook practice tests — then progress on each skill a targeted test
        has been set on: the baseline, every test since, and the sessions in between, whoever taught
        them.
        {student?.pc && <> PC: {student.pc}.</>}
      </p>

      {/* The whole SAT, both sections: above the subjects, not inside one (0088). */}
      {bluebook && (isTeacher || isPc) && (
        <BluebookScores api={bluebook} studentName={student?.full_name ?? null} />
      )}

      <div className="mode-pick" role="group" aria-label="Subject">
        {SUBJECTS.map((s) => (
          <button
            key={s.value}
            type="button"
            className={`mode-opt ${subject === s.value ? 'on' : ''}`}
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
