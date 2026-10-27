import { useCallback, useEffect, useMemo, useState, type ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { IconBack, IconClock } from '../components/icons'
import { OverridePanel, SkillNotesPanel, skillTitle } from '../components/ProgressPanels'
import { DifficultyBadge, Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { sectionLabel, skillLabel, subjectLabel } from '../lib/constants'
import { clock } from '../lib/countdown'
import { progressLine, type StudentProgress } from '../lib/progress'
import { loadProgress } from '../lib/progressApi'
import { questionEndsAt, secondsLeft } from '../lib/targetedClock'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { Difficulty, Session, SessionItem, TargetedTest } from '../lib/types'
import { StatusBadge } from './Sessions'

/**
 * The console for a targeted test (0062).
 *
 * Nothing here runs the test. The student starts it, answers or runs out of
 * time, and the server puts each question of the set up in turn — so there is
 * no Choose a question, no level buttons, no answering for them and no
 * starting it from here. What the teacher has is the watch: where the student
 * is in the set, each answer as it lands, the clock on the question on screen;
 * and the buttons around it — Let them start now before its time (0025's
 * waiver, which the targeted start goes through like a lesson's: the student
 * still presses Start, and the scheduled time stays what was arranged), End
 * test, and Publish results once it is over.
 *
 * While it runs the console asks the server to expire anything overdue
 * (targeted_tick) as it reloads, so a student who walked away does not leave
 * the board showing a clock that ran out minutes ago. The tick never puts a
 * question up: a question's clock starts when the student can see it.
 */

interface SetRow {
  position: number
  question_id: string
  questions: {
    id: string
    stem: string
    difficulty: Difficulty
    target_seconds: number | null
  } | null
}

/** Where one question of the set stands, from the teacher's chair. */
type Standing = 'upcoming' | 'on_screen' | 'answered' | 'timed_out' | 'set_aside' | 'not_reached'

function standingOf(item: SessionItem | undefined, over: boolean): Standing {
  if (!item) return over ? 'not_reached' : 'upcoming'
  if (item.status === 'published') return 'on_screen'
  if (item.status === 'voided') return 'set_aside'
  if (item.session_item_assessments?.timed_out) return 'timed_out'
  return 'answered'
}

export function TargetedConsole({
  session,
  items,
  reload,
  linkCard,
}: {
  session: Session
  items: SessionItem[]
  reload: () => Promise<void>
  /** The student's link, which the lesson console already knows how to show. */
  linkCard: ReactNode
}) {
  const { profile } = useAuth()
  const [test, setTest] = useState<TargetedTest | null>(null)
  const [set, setSet] = useState<SetRow[]>([])
  const [loadError, setLoadError] = useState<string | null>(null)
  const [actionError, setActionError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  const loadSet = useCallback(async () => {
    const [t, s] = await Promise.all([
      supabase.from('targeted_tests').select('*').eq('session_id', session.id).maybeSingle(),
      supabase
        .from('targeted_set_items')
        .select('position, question_id, questions(id, stem, difficulty, target_seconds)')
        .eq('session_id', session.id)
        .order('position'),
    ])
    if (t.error || s.error) setLoadError((t.error ?? s.error)!.message)
    setTest((t.data as TargetedTest | null) ?? null)
    setSet((s.data ?? []) as unknown as SetRow[])
  }, [session.id])

  useEffect(() => {
    void loadSet()
  }, [loadSet])

  const live = session.status === 'live'
  const over = session.status === 'completed' || session.status === 'cancelled'
  const notStarted = session.status === 'scheduled'
  // Open: its time has come, or a teacher or admin let the student in early.
  const due = new Date(session.scheduled_at).getTime() <= Date.now()
  const isOpen = due || session.opened_early_at !== null
  const first = session.student?.full_name?.split(' ')[0] ?? 'the student'

  // The line on this skill, once it is over: the override panel writes
  // against the point before this one. Everything else it says is the report's.
  const [progress, setProgress] = useState<StudentProgress | null>(null)
  useEffect(() => {
    if (!over) return
    let active = true
    void loadProgress(session.student_id, session.subject).then((p) => {
      if (!active) return
      setProgress(p.progress)
      if (p.error) setLoadError(p.error)
    })
    return () => {
      active = false
    }
  }, [over, session.subject, session.student_id, items.length])

  // Expire what is overdue, then read again. The lesson's hook polls too; this
  // is the half of it only a targeted test needs.
  useEffect(() => {
    if (!live) return
    const t = setInterval(async () => {
      await supabase.rpc('targeted_tick', { p_session: session.id })
      await reload()
    }, 5_000)
    return () => clearInterval(t)
  }, [live, session.id, reload])

  async function call(fn: string, args: Record<string, unknown> = {}) {
    setActionError(null)
    setBusy(true)
    const { error } = await supabase.rpc(fn, { p_session: session.id, ...args })
    if (error) setActionError(error.message)
    await reload()
    setBusy(false)
  }

  const byQuestion = useMemo(() => {
    const m = new Map<string, SessionItem>()
    for (const i of items) m.set(i.question_id, i)
    return m
  }, [items])

  const rows = set.map((r) => ({ ...r, item: byQuestion.get(r.question_id) }))
  const standings = rows.map((r) => standingOf(r.item, over))
  const reached = standings.filter((s) => s === 'answered' || s === 'timed_out').length
  const correct = rows.filter((r) => r.item?.session_item_assessments?.is_correct).length
  const timedOut = standings.filter((s) => s === 'timed_out').length
  const notReached = standings.filter((s) => s === 'not_reached' || s === 'set_aside').length
  const unrevealed = items.filter((i) => i.status === 'answered').length
  const onScreen = rows.findIndex((r) => standingOf(r.item, over) === 'on_screen')

  const line = useMemo(
    () => (progress && test ? progressLine(progress, test.section, test.skill) : null),
    [progress, test],
  )
  const here = line?.points.findIndex((p) => p.sessionId === session.id) ?? -1
  const previous = line && here > 0 ? line.points[here - 1].sessionId : null

  return (
    <div className="page page-wide targeted-console">
      <Link className="back-link" to="/sessions?tab=targeted">
        <IconBack /> Targeted tests
      </Link>

      <div className="room-head">
        <div>
          <h1>{session.title || `${subjectLabel(session.subject)} targeted test`}</h1>
          <div className="meta">
            {session.student?.full_name}{' '}
            <span className="num">({session.student?.display_id})</span>
            {session.student?.pc && <> · {session.student.pc}</>} ·{' '}
            {formatUtc(session.scheduled_at)}
            {session.teacher_id !== profile?.id && session.teacher?.full_name && (
              <> · taught by {session.teacher.full_name}</>
            )}
          </div>
        </div>
        <div className="spring" />
        <span className="badge badge-sky">Targeted test</span>
        <StatusBadge status={session.status} />
        <div className="actions">
          {notStarted && !isOpen && (
            <button
              type="button"
              className="btn btn-primary btn-sm"
              disabled={busy}
              title={`Let ${first} start the test now instead of waiting for the scheduled time.`}
              onClick={() => void call('set_session_open_early', { p_open: true })}
            >
              Let them start now
            </button>
          )}
          {notStarted && session.opened_early_at !== null && !due && (
            <button
              type="button"
              className="btn btn-ghost btn-sm"
              disabled={busy}
              title="Put the scheduled time back."
              onClick={() => void call('set_session_open_early', { p_open: false })}
            >
              Undo early access
            </button>
          )}
          {over && reached > 0 && (
            <button
              type="button"
              className="btn btn-primary btn-sm"
              disabled={busy || unrevealed === 0}
              title="The student sees their questions, their answers and the explanations. Never the level scores."
              onClick={() => void call('reveal_answered_items')}
            >
              {unrevealed > 0 ? `Publish results (${reached})` : 'Results published'}
            </button>
          )}
          {live && (
            <button
              type="button"
              className="btn btn-navy btn-sm"
              disabled={busy}
              title="Ends the test now. The question on screen and the ones after it are not reached."
              onClick={() => void call('teacher_finish_session')}
            >
              End test
            </button>
          )}
        </div>
      </div>

      {loadError && <Notice kind="error">{loadError}</Notice>}
      {actionError && <Notice kind="error">{actionError}</Notice>}

      {!over && linkCard}

      {test && (
        <div className="card card-pad">
          <div className="section-title">The test</div>
          <p>
            {sectionLabel(test.section)}
            {test.skill && <> — {skillLabel(test.skill)}</>} · {set.length} of {test.set_size}{' '}
            question{test.set_size === 1 ? '' : 's'} ·{' '}
            {test.question_seconds
              ? `${test.question_seconds} s a question`
              : 'each question’s own target time'}{' '}
            · {Math.round(test.overall_seconds / 60)} minutes in all
            {test.allow_repeats && ' · repeats allowed'}
          </p>
          {notStarted && (
            <p className="muted">
              {isOpen
                ? session.opened_early_at !== null && !due
                  ? `Opened early — ${first} can start it from their link now.`
                  : `Open — ${first} can start it from their link now.`
                : `${first} can start it from their link from ${formatUtc(session.scheduled_at)}, or now if you let them start early.`}{' '}
              Nothing is shown before they press Start, and the set cannot change once they have.
            </p>
          )}
          {live && onScreen >= 0 && (
            <p className="muted">
              On question {onScreen + 1} of {set.length}.
            </p>
          )}
          {(live || over) && (
            <p>
              {correct} of {reached} reached right{timedOut > 0 && ` · ${timedOut} timed out`}
              {notReached > 0 && ` · ${notReached} not reached`}
            </p>
          )}
        </div>
      )}

      {/* What it says lives on the report alone — the analysis, the line on
          the skill and the summary — so the console only points to it. */}
      {over && reached > 0 && (
        <div className="card card-pad report-cta">
          <div>
            <div className="section-title">The report</div>
            <p className="muted">
              What the answers say, how it is scored, progress on{' '}
              {test ? skillTitle(test.section, test.skill) : 'the skill'} and a summary of every
              targeted test.
            </p>
          </div>
          <Link className="btn btn-primary" to={`/sessions/${session.id}/report`}>
            Open the report
          </Link>
        </div>
      )}

      {over && test && line && here > 0 && (
        <OverridePanel sessionId={session.id} previousSessionId={previous} />
      )}
      {over && test && (
        <SkillNotesPanel
          studentId={session.student_id}
          subject={session.subject}
          section={test.section}
          skill={test.skill}
        />
      )}

      <div className="board">
        <div className="board-scroll">
          <table className="board-table">
            <thead>
              <tr>
                <th className="num">#</th>
                <th>Question</th>
                <th>Level</th>
                <th>Where it stands</th>
                <th>Answer</th>
                <th className="num">Time</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((r, i) => (
                <tr key={r.position}>
                  <td className="num">{i + 1}</td>
                  <td className="clip">{r.questions?.stem ?? '—'}</td>
                  <td>{r.questions && <DifficultyBadge level={r.questions.difficulty} />}</td>
                  <td>
                    <StandingBadge standing={standings[i]} item={r.item} />
                  </td>
                  <td>{r.item?.selected_option ?? '—'}</td>
                  <td className="num">
                    <ItemTime item={r.item} />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  )
}

function StandingBadge({ standing, item }: { standing: Standing; item: SessionItem | undefined }) {
  switch (standing) {
    case 'upcoming':
      return <span className="badge badge-neutral">Not yet</span>
    case 'on_screen':
      return <span className="badge badge-sky">On screen</span>
    case 'timed_out':
      return <span className="badge badge-bad">Timed out</span>
    case 'set_aside':
      return <span className="badge badge-neutral">Not reached — ended on it</span>
    case 'not_reached':
      return <span className="badge badge-neutral">Not reached</span>
    case 'answered':
      return item?.session_item_assessments?.is_correct ? (
        <span className="badge badge-ok">Right</span>
      ) : (
        <span className="badge badge-bad">Wrong</span>
      )
  }
}

/** Seconds taken against the clock it had; on screen, the time left on it. */
function ItemTime({ item }: { item: SessionItem | undefined }) {
  const [now, setNow] = useState(() => Date.now())
  const onScreen = item?.status === 'published'
  useEffect(() => {
    if (!onScreen) return
    const t = setInterval(() => setNow(Date.now()), 1000)
    return () => clearInterval(t)
  }, [onScreen])

  if (!item) return <span className="dash">—</span>
  const limit = item.time_limit_seconds
  if (onScreen) {
    const left = secondsLeft(questionEndsAt(item), now, 0)
    return left === null ? (
      <span className="dash">no clock</span>
    ) : (
      <span className="q-clock">
        <IconClock /> {clock(left)} left
      </span>
    )
  }
  const took = item.session_item_assessments?.elapsed_seconds
  if (took === null || took === undefined) return <span className="dash">—</span>
  return (
    <span>
      {took}s{limit ? ` / ${limit}s` : ''}
    </span>
  )
}
