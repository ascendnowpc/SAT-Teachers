import { useState } from 'react'
import { diffLabel, versusGoal, type ExamStage, type Reflection } from '../lib/afterExam'
import { dayLabel } from '../lib/bluebook'
import type { StudentGoal } from '../lib/goal'
import { Icon } from './Icon'
import { Notice } from './ui'

const PROMPTS = [
  { key: 'went_well', label: 'What went well?', hint: 'e.g. timing on Math' },
  { key: 'was_hard', label: 'What was hard?', hint: 'e.g. long reading passages' },
  { key: 'next_time', label: 'What will you do differently?', hint: 'e.g. more timed sets' },
] as const

type Answers = Pick<Reflection, 'went_well' | 'was_hard' | 'next_time' | 'retake'>

/**
 * After the exam (0108): waiting for the results, then the result beside the
 * goal, three short answers and the retake, and the PC's line. The student
 * writes theirs; staff read them, and the PC (or an admin) writes the line.
 */
export function AfterExam({
  stage,
  goal,
  who = 'you',
  onAddScore,
  onSave,
  onNewGoals,
  onSummary,
}: {
  stage: Exclude<ExamStage, { kind: 'none' }>
  goal: StudentGoal | null
  who?: 'you' | 'they'
  /** The student's way to the upload. */
  onAddScore?: () => void
  /** The student's save. */
  onSave?: (a: Answers) => Promise<void>
  /** The student's way to new goals. */
  onNewGoals?: () => void
  /** The PC's line, when they may write it. */
  onSummary?: (text: string) => Promise<void>
}) {
  const your = who === 'you' ? 'Your' : 'Their'
  if (stage.kind === 'waiting') {
    return (
      <section className="dash-panel after-exam" aria-label="After the exam">
        <header className="card-head">
          <span className="card-icon">
            <Icon name="clock" />
          </span>
          <div>
            <h2>Waiting for {who === 'you' ? 'your' : 'their'} results</h2>
            <p>
              SAT on {dayLabel(stage.examOn)} · {stage.daysSince} day{stage.daysSince === 1 ? '' : 's'} ago
            </p>
          </div>
        </header>
        <p className="after-lead">
          Scores usually come about two weeks after the test.{' '}
          {who === 'you' ? 'Add the score report when it’s in.' : 'They add the score report when it’s in.'}
        </p>
        {onAddScore && (
          <button type="button" className="ui-btn ui-btn--primary ui-btn--sm" onClick={onAddScore}>
            <Icon name="upload" size={15} /> Add the score report
          </button>
        )}
      </section>
    )
  }

  const versus = versusGoal(stage.result, goal)
  return (
    <section className="dash-panel after-exam" aria-label="After the exam">
      <header className="card-head">
        <span className="card-icon">
          <Icon name="flag" />
        </span>
        <div>
          <h2>{your} SAT result</h2>
          <p>
            {stage.result.test_name} · {dayLabel(stage.result.taken_on)}
          </p>
        </div>
      </header>
      <ul className="after-versus">
        {versus.map((v) => {
          const label = diffLabel(v.diff)
          return (
            <li key={v.label}>
              <span>{v.label}</span>
              <b className="num">{v.score}</b>
              {v.goal !== null && <small className="num">goal {v.goal}</small>}
              {label && <span className={`aim-gap${v.diff !== null && v.diff >= 0 ? ' is-done' : ''}`}>{label}</span>}
            </li>
          )
        })}
      </ul>
      {onSave ? (
        <ReflectionForm stage={stage} onSave={onSave} onNewGoals={onNewGoals} />
      ) : (
        <ReflectionRead reflection={stage.reflection} who={who} />
      )}
      {(stage.reflection?.pc_summary || onSummary) && (
        <PcLine text={stage.reflection?.pc_summary ?? null} onSave={onSummary} />
      )}
    </section>
  )
}

function ReflectionRead({ reflection, who }: { reflection: Reflection | null; who: 'you' | 'they' }) {
  if (!reflection || !(reflection.went_well || reflection.was_hard || reflection.next_time || reflection.retake !== null)) {
    return <p className="after-lead muted">{who === 'they' ? 'They have not reflected yet.' : 'Not answered yet.'}</p>
  }
  return (
    <dl className="after-answers">
      {PROMPTS.map((p) =>
        reflection[p.key] ? (
          <div key={p.key}>
            <dt>{p.label}</dt>
            <dd>{reflection[p.key]}</dd>
          </div>
        ) : null,
      )}
      {reflection.retake !== null && (
        <div>
          <dt>Retaking?</dt>
          <dd>{reflection.retake ? 'Yes' : 'No'}</dd>
        </div>
      )}
    </dl>
  )
}

function ReflectionForm({
  stage,
  onSave,
  onNewGoals,
}: {
  stage: Extract<ExamStage, { kind: 'reflect' | 'done' }>
  onSave: (a: Answers) => Promise<void>
  onNewGoals?: () => void
}) {
  const r = stage.reflection
  const [editing, setEditing] = useState(stage.kind === 'reflect')
  const [answers, setAnswers] = useState<Answers>({
    went_well: r?.went_well ?? '',
    was_hard: r?.was_hard ?? '',
    next_time: r?.next_time ?? '',
    retake: r?.retake ?? null,
  })
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  if (!editing && r) {
    return (
      <>
        <ReflectionRead reflection={r} who="you" />
        <div className="after-actions">
          {r.retake && onNewGoals && (
            <button type="button" className="ui-btn ui-btn--primary ui-btn--sm" onClick={onNewGoals}>
              <Icon name="target" size={15} /> Set new goals
            </button>
          )}
          <button type="button" className="ui-btn ui-btn--ghost ui-btn--sm" onClick={() => setEditing(true)}>
            <Icon name="pencil" size={14} /> Edit
          </button>
        </div>
      </>
    )
  }

  async function save() {
    setBusy(true)
    setError(null)
    try {
      await onSave(answers)
      setEditing(false)
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
    }
    setBusy(false)
  }

  return (
    <div className="after-form">
      <p className="after-lead">Three quick questions — they help you and your PC plan what’s next.</p>
      {error && <Notice kind="error">{error}</Notice>}
      {PROMPTS.map((p) => (
        <label key={p.key} className="field">
          <span className="label">{p.label}</span>
          <textarea
            className="input"
            rows={2}
            maxLength={600}
            placeholder={p.hint}
            value={answers[p.key] ?? ''}
            onChange={(e) => setAnswers({ ...answers, [p.key]: e.target.value })}
          />
        </label>
      ))}
      <div className="after-retake" role="group" aria-label="Retaking?">
        <span className="label">Retaking?</span>
        <button type="button" className={`sat-chip${answers.retake === true ? ' on' : ''}`} aria-pressed={answers.retake === true} onClick={() => setAnswers({ ...answers, retake: true })}>
          Yes
        </button>
        <button type="button" className={`sat-chip${answers.retake === false ? ' on' : ''}`} aria-pressed={answers.retake === false} onClick={() => setAnswers({ ...answers, retake: false })}>
          No
        </button>
      </div>
      <div className="after-actions">
        <button type="button" className="ui-btn ui-btn--primary ui-btn--sm" disabled={busy} onClick={() => void save()}>
          {busy ? <span className="spinner is-small" aria-hidden="true" /> : <Icon name="check" size={15} />}
          {busy ? 'Saving…' : 'Save'}
        </button>
      </div>
    </div>
  )
}

function PcLine({ text, onSave }: { text: string | null; onSave?: (text: string) => Promise<void> }) {
  const [value, setValue] = useState(text ?? '')
  const [editing, setEditing] = useState(!text && !!onSave)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  if (!onSave || !editing) {
    return (
      <div className="after-pc">
        <span className="after-pc-label">From the PC</span>
        <p>{text ?? '—'}</p>
        {onSave && (
          <button type="button" className="link-btn" onClick={() => setEditing(true)}>
            Edit
          </button>
        )}
      </div>
    )
  }

  async function save() {
    setBusy(true)
    setError(null)
    try {
      await onSave!(value)
      setEditing(false)
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
    }
    setBusy(false)
  }

  return (
    <div className="after-pc">
      <label className="field">
        <span className="label">Your summary, in one line</span>
        <input className="input" maxLength={300} value={value} placeholder="e.g. Up 70 on Math; retake in March for the last 30." onChange={(e) => setValue(e.target.value)} />
      </label>
      {error && <Notice kind="error">{error}</Notice>}
      <button type="button" className="btn btn-primary btn-sm" disabled={busy} onClick={() => void save()}>
        {busy ? 'Saving…' : 'Save the line'}
      </button>
    </div>
  )
}
