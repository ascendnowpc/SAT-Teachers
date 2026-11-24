import { useCallback, useEffect, useState, type FormEvent } from 'react'
import { dayLabel } from '../lib/bluebook'
import {
  countdownLabel,
  daysUntil,
  goalProblem,
  goalTotal,
  hasGoal,
  localToday,
  parseTarget,
  parseTotal,
  registrationLabel,
  toGo,
  type StudentGoal,
} from '../lib/goal'
import { deadlineFor, satDateFor, upcomingSatDates } from '../lib/satDates'
import { rows, supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import { Icon } from './Icon'
import { Field, Notice } from './ui'

export interface LatestSat {
  total: number
  rw: number
  math: number
  on: string
}

/**
 * "Aiming for" (the dashboard blueprint): the total the student aims for —
 * kept small on purpose, because the work is in the sections — with the day
 * of their SAT and what their college needs. Editable whenever they like.
 */
export function AimingFor({
  goal,
  sat,
  onEdit,
  editLabel = 'Edit',
  who = 'your',
}: {
  goal: StudentGoal | null
  sat: LatestSat | null
  onEdit?: () => void
  editLabel?: string
  /** "your" on the student's page, "their" on staff's. */
  who?: 'your' | 'their'
}) {
  const today = localToday()
  const total = goalTotal(goal)
  const next = goal?.next_test_on && goal.next_test_on >= today ? goal.next_test_on : null
  const reg = next ? registrationLabel(goal?.registration_deadline_on, today) : null
  const gap = toGo(sat?.total, total)
  return (
    <section className="dash-panel aim-card" aria-label="Aiming for">
      <header className="card-head">
        <span className="card-icon">
          <Icon name="target" />
        </span>
        <div>
          <h2>Aiming for</h2>
          <p>We work the sections, not the total</p>
        </div>
        {onEdit && (
          <button type="button" className="ui-btn ui-btn--ghost ui-btn--sm card-head-end" onClick={onEdit}>
            <Icon name="pencil" size={14} /> {editLabel}
          </button>
        )}
      </header>
      <div className="aim-row">
        <span className="aim-figure num">{total ?? '—'}</span>
        {gap && <span className={`aim-gap${gap === 'Reached' ? ' is-done' : ''}`}>{gap}</span>}
        {total === null && <span className="aim-unset">Set {who} goal</span>}
      </div>
      <ul className="aim-facts">
        {sat && (
          <li>
            <Icon name="trend" size={16} />
            <span>
              Latest SAT <b className="num">{sat.total}</b>
            </span>
          </li>
        )}
        <li>
          <Icon name="calendar" size={16} />
          {next ? (
            <span>
              SAT <b>{dayLabel(next)}</b> <span className="aim-chip">{countdownLabel(next, today)}</span>
            </span>
          ) : (
            <span className="muted">SAT date not set</span>
          )}
        </li>
        {reg && (
          <li className={reg.urgent ? 'is-urgent' : ''}>
            <Icon name={reg.urgent ? 'alert' : 'clock'} size={16} />
            <span>{reg.text}</span>
          </li>
        )}
        {goal?.college_note && (
          <li>
            <Icon name="cap" size={16} />
            <span>
              <b>{goal.college_note}</b>
            </span>
          </li>
        )}
        {hasGoal(goal) && (
          <li className={goal?.confirmed_at ? 'is-ok' : 'muted'}>
            <Icon name={goal?.confirmed_at ? 'check' : 'clock'} size={16} />
            <span>{goal?.confirmed_at ? 'Confirmed by the PC' : 'Waiting for the PC'}</span>
          </li>
        )}
      </ul>
    </section>
  )
}

/**
 * The goal's fields — the total, the SAT date (an official one in a tap, or
 * another day, or not sure yet), its registration deadline, what the college
 * needs, and the two sections if they like. Everything may be left empty.
 */
export function GoalForm({
  title,
  intro,
  initial,
  submitLabel = 'Save',
  onSubmit,
  onCancel,
}: {
  title: string
  intro?: string
  initial: StudentGoal | null
  submitLabel?: string
  onSubmit: (g: StudentGoal) => Promise<void>
  onCancel?: () => void
}) {
  const today = localToday()
  const [total, setTotal] = useState(initial?.target_total?.toString() ?? goalTotal(initial)?.toString() ?? '')
  const [rw, setRw] = useState(initial?.target_rw?.toString() ?? '')
  const [math, setMath] = useState(initial?.target_math?.toString() ?? '')
  const [nextOn, setNextOn] = useState(initial?.next_test_on ?? '')
  const [regOn, setRegOn] = useState(initial?.registration_deadline_on ?? '')
  const [college, setCollege] = useState(initial?.college_note ?? '')
  const [sections, setSections] = useState(initial?.target_rw != null || initial?.target_math != null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const problem = goalProblem(sections ? rw : '', sections ? math : '', nextOn, today, regOn, total)

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
        target_total: parseTotal(total) ?? null,
        target_rw: sections ? (parseTarget(rw) ?? null) : null,
        target_math: sections ? (parseTarget(math) ?? null) : null,
        next_test_on: nextOn || null,
        registration_deadline_on: regOn || null,
        college_note: college.trim() || null,
      })
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    }
    setBusy(false)
  }

  return (
    <section className="dash-panel goal-form-panel" aria-label={title}>
      <div className="dash-panel-head">
        <h2>{title}</h2>
      </div>
      {intro && <p className="goal-form-intro">{intro}</p>}
      <form className="goal-form" onSubmit={submit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}
        <div className="goal-form-fields">
          <Field label="Aiming for" hint="Your total, 400–1600">
            <input
              className="input"
              type="number"
              inputMode="numeric"
              min={400}
              max={1600}
              step={10}
              placeholder="e.g. 1450"
              value={total}
              onChange={(e) => setTotal(e.target.value)}
            />
          </Field>
          <Field label="What your college needs" hint="Optional, in your words">
            <input
              className="input"
              maxLength={200}
              placeholder="e.g. NYU, 1450+"
              value={college}
              onChange={(e) => setCollege(e.target.value)}
            />
          </Field>
        </div>
        <SatDatePicker
          value={nextOn}
          today={today}
          onChange={(day) => {
            setNextOn(day)
            setRegOn(deadlineFor(day, today) ?? (regOn && day && regOn > day ? '' : regOn))
          }}
        />
        <div className="goal-form-fields">
          <Field label="Registration deadline" hint={satDateFor(nextOn) ? 'From College Board’s calendar' : 'Register before this day'}>
            <input className="input" type="date" max={nextOn || undefined} value={regOn} onChange={(e) => setRegOn(e.target.value)} />
          </Field>
        </div>
        {sections ? (
          <div className="goal-form-fields">
            <Field label="Reading & Writing goal" hint="Optional, 200–800">
              <input className="input" type="number" min={200} max={800} step={10} value={rw} onChange={(e) => setRw(e.target.value)} />
            </Field>
            <Field label="Math goal" hint="Optional, 200–800">
              <input className="input" type="number" min={200} max={800} step={10} value={math} onChange={(e) => setMath(e.target.value)} />
            </Field>
          </div>
        ) : (
          <button type="button" className="link-btn goal-form-more" onClick={() => setSections(true)}>
            + A goal for each section
          </button>
        )}
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

/** The next official SAT dates in a tap, another day, or not sure yet. */
export function SatDatePicker({ value, today, onChange }: { value: string; today: string; onChange: (day: string) => void }) {
  const dates = upcomingSatDates(today)
  const official = dates.some((d) => d.day === value)
  const [other, setOther] = useState(!!value && !official)
  return (
    <div className="sat-pick">
      <div className="sat-pick-label">When’s your SAT?</div>
      <div className="sat-pick-chips" role="group" aria-label="SAT date">
        {dates.map((d) => (
          <button
            key={d.day}
            type="button"
            className={`sat-chip${value === d.day ? ' on' : ''}`}
            aria-pressed={value === d.day}
            onClick={() => {
              setOther(false)
              onChange(d.day)
            }}
          >
            {dayLabel(d.day)}
            <small>{daysUntil(d.day, today)} days</small>
          </button>
        ))}
        <button
          type="button"
          className={`sat-chip${other ? ' on' : ''}`}
          aria-pressed={other}
          onClick={() => setOther(true)}
        >
          Another day
        </button>
        <button
          type="button"
          className={`sat-chip${!value && !other ? ' on' : ''}`}
          aria-pressed={!value && !other}
          onClick={() => {
            setOther(false)
            onChange('')
          }}
        >
          Not sure yet
        </button>
      </div>
      {other && (
        <input
          className="input sat-pick-other"
          type="date"
          min={today}
          aria-label="Your SAT date"
          value={value}
          onChange={(e) => onChange(e.target.value)}
        />
      )}
    </div>
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
    goalTotal(g) !== null ? `${goalTotal(g)}` : null,
    g.target_rw !== null || g.target_math !== null ? `(R&W ${g.target_rw ?? '—'} · Math ${g.target_math ?? '—'})` : null,
    g.next_test_on ? `SAT ${dayLabel(g.next_test_on)}` : null,
    g.registration_deadline_on ? `register by ${dayLabel(g.registration_deadline_on)}` : null,
    g.college_note ? `college: ${g.college_note}` : null,
  ].filter(Boolean)
  return parts.length > 0 ? parts.join(' · ') : 'cleared'
}

/**
 * The goal on the staff side (0101, 0105): what it is, whether the PC has
 * been through it, and every version. The student's PC — or an admin —
 * confirms it as it is or changes it; a change by the student waits for them
 * again. Teachers read.
 */
export function GoalPanel({ studentId, canEdit }: { studentId: string; canEdit: boolean }) {
  const [goal, setGoal] = useState<StudentGoal | null>(null)
  const [history, setHistory] = useState<HistoryRow[]>([])
  const [editing, setEditing] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    const [{ data: g }, { data: h }] = await Promise.all([
      supabase
        .from('student_goals')
        .select('target_total, target_rw, target_math, next_test_on, registration_deadline_on, college_note, confirmed_at')
        .eq('student_id', studentId)
        .maybeSingle(),
      supabase
        .from('student_goal_history')
        .select('id, target_total, target_rw, target_math, next_test_on, registration_deadline_on, college_note, set_role, set_at')
        .eq('student_id', studentId)
        .order('set_at', { ascending: false })
        .limit(20),
    ])
    const row = (g ?? null) as StudentGoal | null
    setGoal(hasGoal(row) ? row : null)
    setHistory(rows<HistoryRow>(h))
  }, [studentId])

  useEffect(() => {
    void load()
  }, [load])

  async function set(g: StudentGoal) {
    const { error: err } = await supabase.rpc('set_student_goal', {
      p_student: studentId,
      p_target_total: g.target_total ?? null,
      p_target_rw: g.target_rw,
      p_target_math: g.target_math,
      p_next_test_on: g.next_test_on,
      p_reg_on: g.registration_deadline_on ?? null,
      p_college_note: g.college_note ?? null,
    })
    if (err) throw new Error(err.message)
    setEditing(false)
    await load()
  }

  if (editing) {
    return (
      <GoalForm
        title="Their goal"
        intro="Saving confirms it. The student can still change it; their change comes back to you to confirm."
        initial={goal}
        submitLabel="Save and confirm"
        onSubmit={set}
        onCancel={() => setEditing(false)}
      />
    )
  }

  return (
    <section className="card card-pad goal-panel">
      <div className="goal-panel-head">
        <h2 className="section-title">Goal</h2>
        {goal?.confirmed_at ? (
          <span className="goal-panel-state is-ok">Confirmed {formatUtc(goal.confirmed_at)}</span>
        ) : goal ? (
          <span className="goal-panel-state is-wait">For the PC to confirm</span>
        ) : (
          <span className="goal-panel-state">Not set yet</span>
        )}
      </div>
      {error && <Notice kind="error">{error}</Notice>}
      <p className="goal-panel-line">{goal ? goalWords(goal) : 'The student sets it on their first login, or you can set it here.'}</p>
      {canEdit && (
        <div className="goal-form-actions">
          {goal && !goal.confirmed_at && (
            <button
              type="button"
              className="btn btn-primary btn-sm"
              onClick={() => set(goal).catch((e: unknown) => setError(e instanceof Error ? e.message : String(e)))}
            >
              Confirm as it is
            </button>
          )}
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => setEditing(true)}>
            {goal ? 'Change' : 'Set the goal'}
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
