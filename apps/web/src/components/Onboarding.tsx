import { useState } from 'react'
import { dayLabel, type BluebookReading } from '../lib/bluebook'
import type { BluebookApi } from '../lib/bluebookApi'
import { localToday, parseTotal, type StudentGoal } from '../lib/goal'
import { deadlineFor } from '../lib/satDates'
import { BluebookAdd } from './BluebookScores'
import { SatDatePicker } from './StudentGoal'
import { Notice } from './ui'

const STEPS = ['Welcome', 'SAT date?', 'Taken it before?', 'Target + why', 'Let’s start'] as const

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

  const goal = (): StudentGoal => ({
    target_total: parseTotal(total) ?? null,
    target_rw: initial?.target_rw ?? null,
    target_math: initial?.target_math ?? null,
    next_test_on: nextOn || null,
    registration_deadline_on: regOn || null,
    college_note: college.trim() || null,
  })

  async function next() {
    setError(null)
    if (step === 3 && parseTotal(total) === undefined) {
      setError('Your goal is a score from 400 to 1600, in tens — or leave it for later.')
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
    setStep((s) => Math.min(STEPS.length - 1, s + 1))
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
      <div className="onboard-label">First login — let’s start</div>
      <ol className="onboard-steps">
        {STEPS.map((s, i) => (
          <li key={s} className={i === step ? 'on' : i < step ? 'done' : ''}>
            <span className="num">{i + 1}</span> {s}
          </li>
        ))}
      </ol>

      <div className="onboard-card">
        {error && <Notice kind="error">{error}</Notice>}

        {step === 0 && (
          <>
            <h2>Hi {first} — welcome to Ascend Now</h2>
            <p>
              Four quick questions, then your dashboard. We coach the SAT by its parts — English and Math, and the domains
              inside them — so that is what your dashboard shows. Skip anything; you can change it all later.
            </p>
          </>
        )}

        {step === 1 && (
          <>
            <h2>When’s your SAT?</h2>
            <p>An official date in a tap, another day, or not sure yet.</p>
            <SatDatePicker
              value={nextOn}
              today={today}
              onChange={(day) => {
                setNextOn(day)
                setRegOn(deadlineFor(day, today) ?? '')
              }}
            />
            {regOn && <p className="onboard-note">Registration closes {dayLabel(regOn)} — from College Board’s calendar.</p>}
          </>
        )}

        {step === 2 && (
          <>
            <h2>Taken it before?</h2>
            <p>A real SAT or a Bluebook practice test, before you joined us. It goes on your timeline.</p>
            <div className="onboard-choice" role="group" aria-label="Taken it before">
              <button type="button" className={`sat-chip${before === 'no' ? ' on' : ''}`} onClick={() => setBefore('no')}>
                No, this is my first
              </button>
              <button type="button" className={`sat-chip${before === 'yes' ? ' on' : ''}`} onClick={() => setBefore('yes')}>
                Yes
              </button>
            </div>
            {before === 'yes' && (
              <div className="onboard-upload">
                {added > 0 && <Notice kind="ok">Added — {added === 1 ? 'it is' : 'they are'} on your timeline. Add another, or carry on.</Notice>}
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
            <h2>What are you aiming for — and why?</h2>
            <p>Your total goal, and what your college needs. We keep the big number small: the work is in the sections.</p>
            <div className="goal-form-fields">
              <label className="field">
                <span className="label">Aiming for</span>
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
              </label>
              <label className="field">
                <span className="label">What your college needs</span>
                <input
                  className="input"
                  maxLength={200}
                  placeholder="e.g. NYU, 1450+"
                  value={college}
                  onChange={(e) => setCollege(e.target.value)}
                />
              </label>
            </div>
          </>
        )}

        {step === 4 && (
          <>
            <h2>You’re set, {first}</h2>
            <p>
              Your dashboard shows every test on a timeline, and English and Math broken into their domains — green when it’s
              mastered, amber when it needs work, red to focus on now. “What should I do?” turns your scores into a plan.
            </p>
          </>
        )}

        <div className="onboard-actions">
          {step > 0 && step < 4 && (
            <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={() => setStep((s) => s - 1)}>
              Back
            </button>
          )}
          <span className="spring" />
          {step < 4 ? (
            <>
              <button type="button" className="link-btn" disabled={busy} onClick={() => setStep(4)}>
                Skip to the end
              </button>
              <button type="button" className="btn btn-primary btn-sm" disabled={busy} onClick={() => void next()}>
                {busy ? 'Saving…' : step === 0 ? 'Start' : step === 2 && before === null ? 'Skip' : 'Next'}
              </button>
            </>
          ) : (
            <button type="button" className="btn-lime" disabled={busy} onClick={() => void finish()}>
              Go to my dashboard →
            </button>
          )}
        </div>
      </div>
    </section>
  )
}
