import { useCallback, useEffect, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { dayLabel } from '../lib/bluebook'
import {
  countdownLabel,
  gapFlag,
  goalProblem,
  goalTotal,
  hasGoal,
  localToday,
  parseTarget,
  registrationLabel,
  toGo,
  type StudentGoal,
} from '../lib/goal'
import { saveStudentGoal } from '../lib/studentApi'
import { rows, supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import { Field, Notice } from './ui'

export interface LatestSat {
  total: number
  rw: number
  math: number
  on: string
}

/**
 * The student's goals (0101), across the top of their home and progress
 * pages: the score they aim for in each half of the SAT beside the latest one,
 * and the day of their next SAT and its registration deadline, with the days
 * left. With none yet, the home page opens on "Let's set our goals". Their PC
 * confirms them; from then on the student reads them and the PC changes them.
 */
export function GoalBar({
  pinKey,
  goal,
  sat,
  onSaved,
  onboarding = false,
}: {
  pinKey: string
  goal: StudentGoal | null
  sat: LatestSat | null
  onSaved: (g: StudentGoal | null) => void
  /** The home page: with no goal yet, the form itself, open. */
  onboarding?: boolean
}) {
  const [editing, setEditing] = useState(false)
  const today = localToday()
  const confirmed = !!goal?.confirmed_at

  async function save(g: StudentGoal) {
    onSaved(await saveStudentGoal(pinKey, g))
    setEditing(false)
  }

  if (onboarding && !hasGoal(goal)) {
    return (
      <GoalForm
        title="Let’s set our goals"
        intro="The day of your SAT, its registration deadline, and the score you’re aiming for in each half. Your PC will go through them with you and confirm them."
        initial={goal}
        today={today}
        submitLabel="Save my goals"
        onSubmit={save}
      />
    )
  }
  if (editing) {
    return <GoalForm title="Your goals" initial={goal} today={today} onSubmit={save} onCancel={() => setEditing(false)} />
  }

  const total = goalTotal(goal)
  const next = goal?.next_test_on ?? null
  const passed = next !== null && next < today
  const reg = !passed ? registrationLabel(goal?.registration_deadline_on, today) : null
  const flag = gapFlag(goal, sat, today)

  return (
    <>
      <section className={`goal-bar${flag ? ' is-flagged' : ''}`} aria-label="Your goals">
        <div className="goal-cell">
          <div className="goal-label">Your goal</div>
          {goal && (goal.target_rw !== null || goal.target_math !== null) ? (
            <>
              <div className="goal-figure num">{total ?? '—'}</div>
              <div className="goal-parts">
                <GoalPart name="Reading & Writing" target={goal.target_rw} score={sat?.rw ?? null} />
                <GoalPart name="Math" target={goal.target_math} score={sat?.math ?? null} />
              </div>
            </>
          ) : (
            <p className="goal-empty">Set the score you’re aiming for in Reading &amp; Writing and in Math.</p>
          )}
        </div>

        <div className="goal-cell">
          <div className="goal-label">Latest SAT</div>
          {sat ? (
            <>
              <div className="goal-figure num">{sat.total}</div>
              <div className="goal-sub">
                {dayLabel(sat.on)}
                {total !== null && <span className="goal-gap">{toGo(sat.total, total)}</span>}
              </div>
            </>
          ) : (
            <p className="goal-empty">
              No SAT score yet. <Link to="/student/report#sat-scores">Add one</Link>
            </p>
          )}
        </div>

        <div className="goal-cell">
          <div className="goal-label">Next SAT</div>
          {next && !passed ? (
            <>
              <div className="goal-figure goal-date">{dayLabel(next)}</div>
              <div className="goal-sub">
                <span className="goal-countdown">{countdownLabel(next, today)}</span>
              </div>
            </>
          ) : (
            <p className="goal-empty">
              {passed ? `${dayLabel(next!)} has passed — add your next one.` : 'Add the day of your next SAT.'}
            </p>
          )}
          {reg && (
            <div className={`goal-reg${reg.urgent ? ' is-urgent' : ''}`}>
              {reg.text}
              {goal?.registration_deadline_on && <span> · {dayLabel(goal.registration_deadline_on)}</span>}
            </div>
          )}
        </div>

        <div className="goal-action no-print">
          {confirmed ? (
            <span className="goal-confirmed" title={`Confirmed ${formatUtc(goal!.confirmed_at!)}`}>
              ✓ Confirmed by your PC
            </span>
          ) : (
            <>
              <button type="button" className={hasGoal(goal) ? 'goal-edit' : 'btn-lime'} onClick={() => setEditing(true)}>
                {hasGoal(goal) ? 'Edit' : 'Set goals'}
              </button>
              {hasGoal(goal) && <span className="goal-waiting">Your PC will confirm these</span>}
            </>
          )}
        </div>
      </section>
      {flag && (
        <p className="goal-flag" role="status">
          <b>{flag.days === 0 ? 'Test day.' : `${flag.days} day${flag.days === 1 ? '' : 's'} to the SAT.`}</b>{' '}
          {flag.parts.map((p) => `${p.name}: ${p.gap} points to go`).join(' · ')}
        </p>
      )}
    </>
  )
}

function GoalPart({ name, target, score }: { name: string; target: number | null; score: number | null }) {
  const gap = toGo(score, target)
  return (
    <span className="goal-part">
      <span className="goal-part-name">{name}</span> <b className="num">{target ?? '—'}</b>
      {gap && <span className={`goal-part-gap${gap === 'Reached' ? ' is-reached' : ''}`}>{gap}</span>}
    </span>
  )
}

/** The four fields — two targets, two days — for the student or their PC. All empty forgets the goal. */
export function GoalForm({
  title,
  intro,
  initial,
  today,
  submitLabel = 'Save',
  onSubmit,
  onCancel,
}: {
  title: string
  intro?: string
  initial: StudentGoal | null
  today: string
  submitLabel?: string
  onSubmit: (g: StudentGoal) => Promise<void>
  onCancel?: () => void
}) {
  const [rw, setRw] = useState(initial?.target_rw?.toString() ?? '')
  const [math, setMath] = useState(initial?.target_math?.toString() ?? '')
  const [nextOn, setNextOn] = useState(initial?.next_test_on ?? '')
  const [regOn, setRegOn] = useState(initial?.registration_deadline_on ?? '')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const problem = goalProblem(rw, math, nextOn, today, regOn)
  const r = parseTarget(rw)
  const m = parseTarget(math)
  const sum = typeof r === 'number' && typeof m === 'number' ? r + m : null

  async function submit(e: FormEvent) {
    e.preventDefault()
    if (problem) {
      setError(problem)
      return
    }
    setBusy(true)
    setError(null)
    try {
      await onSubmit({
        target_rw: r ?? null,
        target_math: m ?? null,
        next_test_on: nextOn || null,
        registration_deadline_on: regOn || null,
      })
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    }
    setBusy(false)
  }

  const number = (value: string, set: (v: string) => void, placeholder: string) => (
    <input
      className="input"
      type="number"
      inputMode="numeric"
      min={200}
      max={800}
      step={10}
      placeholder={placeholder}
      value={value}
      onChange={(e) => set(e.target.value)}
    />
  )

  return (
    <section className="dash-panel goal-form-panel" aria-label={title}>
      <div className="dash-panel-head">
        <h2>{title}</h2>
        {sum !== null && <span className="goal-form-total num">Total {sum}</span>}
      </div>
      {intro && <p className="goal-form-intro">{intro}</p>}
      <form className="goal-form" onSubmit={submit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}
        <div className="goal-form-fields">
          <Field label="SAT date" hint="The day you sit it">
            <input className="input" type="date" min={today} value={nextOn} onChange={(e) => setNextOn(e.target.value)} />
          </Field>
          <Field label="Registration deadline" hint="Register before this day">
            <input className="input" type="date" max={nextOn || undefined} value={regOn} onChange={(e) => setRegOn(e.target.value)} />
          </Field>
          <Field label="Reading & Writing goal" hint="200–800">
            {number(rw, setRw, 'e.g. 700')}
          </Field>
          <Field label="Math goal" hint="200–800">
            {number(math, setMath, 'e.g. 750')}
          </Field>
        </div>
        <div className="goal-form-actions">
          <button type="submit" className="btn btn-primary btn-sm" disabled={busy}>
            {busy ? 'Saving…' : submitLabel}
          </button>
          {onCancel && (
            <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={onCancel}>
              Cancel
            </button>
          )}
        </div>
      </form>
    </section>
  )
}

interface HistoryRow extends StudentGoal {
  id: string
  set_role: 'student' | 'pc' | 'admin'
  set_at: string
}

const SET_BY: Record<HistoryRow['set_role'], string> = { student: 'the student', pc: 'the PC', admin: 'an admin' }

function goalWords(g: StudentGoal): string {
  const parts = [
    g.target_rw !== null ? `R&W ${g.target_rw}` : null,
    g.target_math !== null ? `Math ${g.target_math}` : null,
    goalTotal(g) !== null ? `(${goalTotal(g)})` : null,
    g.next_test_on ? `SAT ${dayLabel(g.next_test_on)}` : null,
    g.registration_deadline_on ? `register by ${dayLabel(g.registration_deadline_on)}` : null,
  ].filter(Boolean)
  return parts.length > 0 ? parts.join(' · ') : 'cleared'
}

/**
 * The student's goals on the staff side (0101): what they are, whether the PC
 * has confirmed them, and every version. The student's PC — or an admin —
 * confirms them as they are, or changes them; teachers read.
 */
export function GoalPanel({ studentId, canEdit }: { studentId: string; canEdit: boolean }) {
  const [goal, setGoal] = useState<StudentGoal | null>(null)
  const [history, setHistory] = useState<HistoryRow[]>([])
  const [editing, setEditing] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const today = localToday()

  const load = useCallback(async () => {
    const [{ data: g }, { data: h }] = await Promise.all([
      supabase
        .from('student_goals')
        .select('target_rw, target_math, next_test_on, registration_deadline_on, confirmed_at')
        .eq('student_id', studentId)
        .maybeSingle(),
      supabase
        .from('student_goal_history')
        .select('id, target_rw, target_math, next_test_on, registration_deadline_on, set_role, set_at')
        .eq('student_id', studentId)
        .order('set_at', { ascending: false })
        .limit(20),
    ])
    setGoal((g ?? null) as StudentGoal | null)
    setHistory(rows<HistoryRow>(h))
  }, [studentId])

  useEffect(() => {
    void load()
  }, [load])

  async function set(g: StudentGoal) {
    const { error: err } = await supabase.rpc('set_student_goal', {
      p_student: studentId,
      p_target_rw: g.target_rw,
      p_target_math: g.target_math,
      p_next_test_on: g.next_test_on,
      p_reg_on: g.registration_deadline_on ?? null,
    })
    if (err) throw new Error(err.message)
    setEditing(false)
    await load()
  }

  if (editing) {
    return (
      <GoalForm
        title="Their goals"
        intro="Saving confirms them. The student can no longer change them; the old version is kept below."
        initial={goal}
        today={today}
        submitLabel="Save and confirm"
        onSubmit={set}
        onCancel={() => setEditing(false)}
      />
    )
  }

  return (
    <section className="card card-pad goal-panel">
      <div className="goal-panel-head">
        <h2 className="section-title">Goals</h2>
        {goal?.confirmed_at ? (
          <span className="goal-panel-state is-ok">Confirmed {formatUtc(goal.confirmed_at)}</span>
        ) : hasGoal(goal) ? (
          <span className="goal-panel-state is-wait">Waiting for the PC to confirm</span>
        ) : (
          <span className="goal-panel-state">Not set yet</span>
        )}
      </div>
      {error && <Notice kind="error">{error}</Notice>}
      <p className="goal-panel-line">{hasGoal(goal) ? goalWords(goal!) : 'The student sets them on joining, or you can set them here.'}</p>
      {canEdit && (
        <div className="goal-form-actions">
          {hasGoal(goal) && !goal?.confirmed_at && (
            <button
              type="button"
              className="btn btn-primary btn-sm"
              onClick={() => set(goal!).catch((e: unknown) => setError(e instanceof Error ? e.message : String(e)))}
            >
              Confirm as they are
            </button>
          )}
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => setEditing(true)}>
            {hasGoal(goal) ? 'Change' : 'Set goals'}
          </button>
        </div>
      )}
      {history.length > 1 && (
        <details className="goal-history">
          <summary>Earlier versions ({history.length - 1})</summary>
          <ul>
            {history.slice(1).map((h) => (
              <li key={h.id}>
                <span className="muted">
                  {formatUtc(h.set_at)} · by {SET_BY[h.set_role]}
                </span>
                <br />
                {goalWords(h)}
              </li>
            ))}
          </ul>
        </details>
      )}
    </section>
  )
}
