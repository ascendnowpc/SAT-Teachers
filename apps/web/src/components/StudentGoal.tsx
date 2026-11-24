import { useState, type FormEvent } from 'react'
import { dayLabel } from '../lib/bluebook'
import {
  countdownLabel,
  goalProblem,
  goalTotal,
  hasGoal,
  localToday,
  parseTarget,
  toGo,
  type StudentGoal,
} from '../lib/goal'
import { saveStudentGoal } from '../lib/studentApi'
import { Field, Notice } from './ui'

export interface LatestSat {
  total: number
  rw: number
  math: number
  on: string
}

/**
 * The student's goal (0101), across the top of their home and progress pages:
 * the score they aim for in each half of the SAT beside the latest one they
 * have, and the day of their next SAT with the days left. The student — or
 * their parent, on the student's account — sets it here.
 */
export function GoalBar({
  pinKey,
  goal,
  sat,
  onSaved,
  editable = true,
}: {
  pinKey: string
  goal: StudentGoal | null
  sat: LatestSat | null
  onSaved: (g: StudentGoal | null) => void
  editable?: boolean
}) {
  const [editing, setEditing] = useState(false)
  const today = localToday()

  if (editing) {
    return (
      <GoalForm
        pinKey={pinKey}
        goal={goal}
        today={today}
        onDone={(g) => {
          if (g !== undefined) onSaved(g)
          setEditing(false)
        }}
      />
    )
  }

  const total = goalTotal(goal)
  const next = goal?.next_test_on ?? null
  const passed = next !== null && next < today

  return (
    <section className="goal-bar" aria-label="Your goal">
      <div className="goal-cell">
        <div className="goal-label">Your goal</div>
        {hasGoal(goal) && (goal!.target_rw !== null || goal!.target_math !== null) ? (
          <>
            <div className="goal-figure num">{total ?? '—'}</div>
            <div className="goal-parts">
              <GoalPart name="Reading & Writing" target={goal!.target_rw} score={sat?.rw ?? null} />
              <GoalPart name="Math" target={goal!.target_math} score={sat?.math ?? null} />
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
          <p className="goal-empty">No SAT score yet.</p>
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
          <p className="goal-empty">{passed ? `${dayLabel(next!)} has passed — add your next one.` : 'Add the day of your next SAT.'}</p>
        )}
      </div>

      {editable && (
        <div className="goal-action no-print">
          <button type="button" className={hasGoal(goal) ? 'goal-edit' : 'btn-lime'} onClick={() => setEditing(true)}>
            {hasGoal(goal) ? 'Edit' : 'Set goal'}
          </button>
        </div>
      )}
    </section>
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

/** The three fields. All three empty forgets the goal. */
function GoalForm({
  pinKey,
  goal,
  today,
  onDone,
}: {
  pinKey: string
  goal: StudentGoal | null
  today: string
  /** The saved goal, null once forgotten, or undefined for Cancel. */
  onDone: (g: StudentGoal | null | undefined) => void
}) {
  const [rw, setRw] = useState(goal?.target_rw?.toString() ?? '')
  const [math, setMath] = useState(goal?.target_math?.toString() ?? '')
  const [nextOn, setNextOn] = useState(goal?.next_test_on ?? '')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const problem = goalProblem(rw, math, nextOn, today)
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
      const saved = await saveStudentGoal(pinKey, {
        target_rw: r ?? null,
        target_math: m ?? null,
        next_test_on: nextOn || null,
      })
      onDone(saved)
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
      setBusy(false)
    }
  }

  return (
    <section className="dash-panel goal-form-panel" aria-label="Set your goal">
      <div className="dash-panel-head">
        <h2>Your goal</h2>
        {sum !== null && <span className="goal-form-total num">Total {sum}</span>}
      </div>
      <form className="goal-form" onSubmit={submit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}
        <div className="goal-form-fields">
          <Field label="Reading & Writing" hint="200–800">
            <input
              className="input"
              type="number"
              inputMode="numeric"
              min={200}
              max={800}
              step={10}
              placeholder="e.g. 700"
              value={rw}
              onChange={(e) => setRw(e.target.value)}
            />
          </Field>
          <Field label="Math" hint="200–800">
            <input
              className="input"
              type="number"
              inputMode="numeric"
              min={200}
              max={800}
              step={10}
              placeholder="e.g. 750"
              value={math}
              onChange={(e) => setMath(e.target.value)}
            />
          </Field>
          <Field label="Next SAT" hint="The day you sit it">
            <input className="input" type="date" min={today} value={nextOn} onChange={(e) => setNextOn(e.target.value)} />
          </Field>
        </div>
        <div className="goal-form-actions">
          <button type="submit" className="btn btn-primary btn-sm" disabled={busy}>
            {busy ? 'Saving…' : 'Save'}
          </button>
          <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={() => onDone(undefined)}>
            Cancel
          </button>
        </div>
      </form>
    </section>
  )
}
