import { useState, type CSSProperties } from 'react'
import { dayLabel, type BluebookReading } from '../lib/bluebook'
import type { BluebookApi } from '../lib/bluebookApi'
import { localToday, parseTotal, type StudentGoal } from '../lib/goal'
import { deadlineFor } from '../lib/satDates'
import { BluebookAdd } from './BluebookScores'
import { Icon, type IconName } from './Icon'
import { SatDatePicker } from './StudentGoal'
import { Notice } from './ui'

const STEPS: { label: string; icon: IconName }[] = [
  { label: 'Welcome', icon: 'rocket' },
  { label: 'SAT date?', icon: 'calendar' },
  { label: 'Taken it before?', icon: 'trend' },
  { label: 'Target + why', icon: 'target' },
  { label: 'Let’s start', icon: 'sparkles' },
]

const QUICK_TARGETS = [1200, 1300, 1400, 1500]

/**
 * The first login (the dashboard blueprint's onboarding): welcome, when is
 * the SAT, taken it before (upload the report or type the score), what they
 * are aiming for and what their college needs, and on to the dashboard.
 * Every step can be skipped, and everything stays editable — nothing is
 * locked in. Finishing, or skipping to the end, is remembered (0105).
 */
export function Onboarding({
  name,
  initial,
  scores,
  readPicture,
  onSave,
  onFinish,
}: {
  name: string
  initial: StudentGoal | null
  /** Their own door for SAT scores, for "taken it before". */
  scores: BluebookApi
  readPicture: (file: File) => Promise<BluebookReading>
  /** Saves the goal as it stands. */
  onSave: (g: StudentGoal) => Promise<void>
  /** Done, or skipped: on to the dashboard. */
  onFinish: () => Promise<void>
}) {
  const today = localToday()
  const [step, setStep] = useState(0)
  const [nextOn, setNextOn] = useState(initial?.next_test_on ?? '')
  const [regOn, setRegOn] = useState(initial?.registration_deadline_on ?? '')
  const [before, setBefore] = useState<'no' | 'yes' | null>(null)
  const [added, setAdded] = useState(0)
  const [total, setTotal] = useState(initial?.target_total?.toString() ?? '')
  const [college, setCollege] = useState(initial?.college_note ?? '')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const first = name.split(' ')[0]
  const last = STEPS.length - 1
  const target = parseTotal(total)

  const goal = (): StudentGoal => ({
    target_total: target ?? null,
    target_rw: initial?.target_rw ?? null,
    target_math: initial?.target_math ?? null,
    next_test_on: nextOn || null,
    registration_deadline_on: regOn || null,
    college_note: college.trim() || null,
  })

  async function next() {
    setError(null)
    if (step === 3 && target === undefined) {
      setError('A target is 400 to 1600, in tens — or leave it for later.')
      return
    }
    if (step === 1 || step === 3) {
      setBusy(true)
      try {
        await onSave(goal())
      } catch (e) {
        setError(e instanceof Error ? e.message : String(e))
        setBusy(false)
        return
      }
      setBusy(false)
    }
    setStep((s) => Math.min(last, s + 1))
  }

  async function finish() {
    setBusy(true)
    setError(null)
    try {
      await onFinish()
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
      setBusy(false)
    }
  }

  return (
    <section className="onboard" aria-label="Let’s start">
      <div className="onboard-label">
        <Icon name="sparkles" size={14} /> First login
      </div>
      <ol className="onboard-steps" style={{ ['--done' as string]: step / last } as CSSProperties}>
        {STEPS.map((s, i) => (
          <li key={s.label} className={i === step ? 'on' : i < step ? 'done' : ''} aria-current={i === step ? 'step' : undefined}>
            <span className="onboard-step-dot">
              <Icon name={i < step ? 'tick' : s.icon} size={15} />
            </span>
            <span className="onboard-step-name">{s.label}</span>
          </li>
        ))}
      </ol>

      <div className={`onboard-card${step === last ? ' is-done' : ''}`} key={step}>
        {step === last && <Confetti />}
        <span className="onboard-art" aria-hidden="true">
          <Icon name={STEPS[step].icon} size={26} />
        </span>
        {error && <Notice kind="error">{error}</Notice>}

        {step === 0 && (
          <>
            <h2>Hi {first}, welcome!</h2>
            <p>Four quick questions, then your dashboard. Skip any of them.</p>
            <ul className="onboard-preview">
              {STEPS.slice(1, last).map((st, i) => (
                <li key={st.label} style={{ ['--i' as string]: i } as CSSProperties}>
                  <Icon name={st.icon} size={15} /> {st.label}
                </li>
              ))}
            </ul>
          </>
        )}

        {step === 1 && (
          <>
            <h2>When’s your SAT?</h2>
            <p>Pick a date, or not sure yet.</p>
            <SatDatePicker
              value={nextOn}
              today={today}
              onChange={(day) => {
                setNextOn(day)
                setRegOn(deadlineFor(day, today) ?? '')
              }}
            />
            {regOn && (
              <p className="onboard-note">
                <Icon name="alert" size={15} /> Register by <b>{dayLabel(regOn)}</b>
              </p>
            )}
          </>
        )}

        {step === 2 && (
          <>
            <h2>Taken the SAT before?</h2>
            <p>Official or practice — it goes on your chart.</p>
            <div className="choice-cards" role="group" aria-label="Taken it before">
              <button type="button" className={`choice-card${before === 'no' ? ' on' : ''}`} aria-pressed={before === 'no'} onClick={() => setBefore('no')}>
                <span className="choice-icon">
                  <Icon name="flag" size={20} />
                </span>
                <b>First time</b>
                <span>Start fresh</span>
              </button>
              <button type="button" className={`choice-card${before === 'yes' ? ' on' : ''}`} aria-pressed={before === 'yes'} onClick={() => setBefore('yes')}>
                <span className="choice-icon">
                  <Icon name="trend" size={20} />
                </span>
                <b>I have a score</b>
                <span>Upload or type it</span>
              </button>
            </div>
            {before === 'yes' && (
              <div className="onboard-upload">
                {added > 0 && <Notice kind="ok">Added to your chart. Add another, or carry on.</Notice>}
                <BluebookAdd
                  key={added}
                  api={scores}
                  studentName={name}
                  readPicture={readPicture}
                  cancelLabel="Not now"
                  onDone={async (saved) => {
                    if (saved) setAdded((n) => n + 1)
                    else setBefore(null)
                  }}
                />
              </div>
            )}
          </>
        )}

        {step === 3 && (
          <>
            <h2>What’s your target?</h2>
            <p>Your total — and what your college needs.</p>
            <div className="target-pick">
              <div className="target-figure">
                <b className="num">{target ?? '—'}</b>
                <span>{target ? 'out of 1600' : 'Drag or pick one'}</span>
              </div>
              <input
                className="target-slider"
                type="range"
                min={400}
                max={1600}
                step={10}
                aria-label="Target score"
                value={target ?? 1200}
                style={{ ['--fill' as string]: `${(((target ?? 1200) - 400) / 1200) * 100}%` } as CSSProperties}
                onChange={(e) => setTotal(e.target.value)}
              />
              <div className="target-quick" role="group" aria-label="Quick picks">
                {QUICK_TARGETS.map((v) => (
                  <button key={v} type="button" className={`sat-chip${target === v ? ' on' : ''}`} aria-pressed={target === v} onClick={() => setTotal(String(v))}>
                    {v}
                  </button>
                ))}
                <button type="button" className={`sat-chip${!total ? ' on' : ''}`} aria-pressed={!total} onClick={() => setTotal('')}>
                  Not sure
                </button>
              </div>
            </div>
            <label className="field onboard-college">
              <span className="label">
                <Icon name="cap" size={15} /> Dream college <small>optional</small>
              </span>
              <input
                className="input"
                maxLength={200}
                placeholder="e.g. NYU, 1450+"
                value={college}
                onChange={(e) => setCollege(e.target.value)}
              />
            </label>
          </>
        )}

        {step === last && (
          <>
            <h2>You’re all set, {first}!</h2>
            <p>Your chart, your sections, your plan — all in one place.</p>
          </>
        )}

        <div className="onboard-actions">
          {step > 0 && step < last && (
            <button type="button" className="ui-btn ui-btn--ghost ui-btn--sm" disabled={busy} onClick={() => setStep((s) => s - 1)}>
              <Icon name="back" size={15} /> Back
            </button>
          )}
          <span className="spring" />
          {step < last ? (
            <>
              <button type="button" className="link-btn" disabled={busy} onClick={() => setStep(last)}>
                Skip all
              </button>
              <button type="button" className="ui-btn ui-btn--primary" disabled={busy} onClick={() => void next()}>
                {busy ? <span className="spinner" aria-hidden="true" /> : null}
                {busy ? 'Saving…' : step === 0 ? 'Let’s go' : step === 2 && before === null ? 'Skip' : 'Next'}
                {!busy && <Icon name="arrow" size={16} className="nudge" />}
              </button>
            </>
          ) : (
            <button type="button" className="ui-btn ui-btn--go ui-btn--lg" disabled={busy} onClick={() => void finish()}>
              {busy ? <span className="spinner" aria-hidden="true" /> : null}
              Go to my dashboard
              <Icon name="arrow" size={17} className="nudge" />
            </button>
          )}
        </div>
      </div>
    </section>
  )
}

/** A short burst of colour on the last step. */
function Confetti() {
  const colours = ['#1E2752', '#3D4D8F', '#8796C6', '#AFB9D9', '#2F9E6B']
  return (
    <span className="confetti" aria-hidden="true">
      {Array.from({ length: 22 }, (_, i) => (
        <i
          key={i}
          style={
            {
              ['--x' as string]: `${((i * 37) % 100) - 50}%`,
              ['--r' as string]: `${(i * 71) % 360}deg`,
              ['--d' as string]: `${(i % 7) * 60}ms`,
              background: colours[i % colours.length],
              left: `${8 + ((i * 41) % 84)}%`,
            } as CSSProperties
          }
        />
      ))}
    </span>
  )
}
