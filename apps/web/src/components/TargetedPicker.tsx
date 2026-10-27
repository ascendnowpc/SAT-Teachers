import { useEffect, useMemo, useState } from 'react'
import { byLevel, chosenSet, LEVEL_ORDER, levelCounts, type Candidate } from '../lib/targetedSet'
import type { Difficulty, Question } from '../lib/types'
import { MathText } from './MathText'
import { QuestionView } from './QuestionView'
import { DifficultyBadge } from './ui'

const LEVEL_LABEL: Record<Difficulty, string> = { easy: 'Easy', medium: 'Medium', hard: 'Hard' }

/** The most a set can hold (write_targeted_set). */
export const MAX_SET = 20

/** Where a question comes from, and whether this student has met it. */
export function whereFrom(c: Candidate): string {
  const from =
    c.source === 'practice'
      ? 'Practice pool'
      : `${LEVEL_LABEL[c.set_level ?? c.difficulty]} test, #${c.set_position}`
  return c.seen ? `${from} · seen before` : from
}

/**
 * Choosing a targeted test's questions by hand, in a pop-up rather than down
 * the booking form: a skill can hold fifty questions, and the form is for
 * what was chosen, not for choosing.
 *
 * The levels are tabs. On the left, each question with a box to tick; on the
 * right, the one last clicked, the way the student will see it — a skill's
 * stems are often word for word the same, and the passage is how two of them
 * are told apart. Nothing reaches the form until "Use these": Cancel, Close
 * and Escape leave the set as it was. The look is the console's question
 * picker (.picker-*), so choosing a question reads the same everywhere.
 */
export function TargetedPicker({
  candidates,
  questions,
  initial,
  title,
  onUse,
  onClose,
}: {
  candidates: Candidate[]
  /** The questions behind the candidates, read from the bank. */
  questions: Map<string, Question>
  /** What is ticked when it opens. */
  initial: string[]
  /** The skill, or the section, the test is on. */
  title: string
  onUse: (ids: string[]) => void
  onClose: () => void
}) {
  const levels = useMemo(() => byLevel(candidates), [candidates])
  const [ticked, setTicked] = useState(() => new Set(initial))
  const [tab, setTab] = useState<Difficulty>(
    () => LEVEL_ORDER.find((l) => levels[l].length > 0) ?? 'easy',
  )
  const [focus, setFocus] = useState<string | null>(() => levels[tab][0]?.question_id ?? null)

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') onClose()
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [onClose])

  const chosen = chosenSet(ticked, candidates)
  const counts = levelCounts(chosen)
  const full = ticked.size >= MAX_SET
  const list = levels[tab]
  const focused = focus ? (questions.get(focus) ?? null) : null
  const focusedCandidate = list.find((c) => c.question_id === focus) ?? null

  function toggle(id: string) {
    setTicked((prev) => {
      const next = new Set(prev)
      if (next.has(id)) next.delete(id)
      else if (next.size < MAX_SET) next.add(id)
      return next
    })
  }

  function tickLevel(on: boolean) {
    setTicked((prev) => {
      const next = new Set(prev)
      for (const c of list) {
        if (on && next.size >= MAX_SET) break
        if (on) next.add(c.question_id)
        else next.delete(c.question_id)
      }
      return next
    })
  }

  const allTicked = list.length > 0 && list.every((c) => ticked.has(c.question_id))

  return (
    <div
      className="leave-veil picker-veil"
      role="dialog"
      aria-modal="true"
      aria-labelledby="tpick-title"
    >
      <div className="picker-box">
        <div className="picker-head">
          <div>
            <h2 id="tpick-title">Choose the questions</h2>
            <p className="tpick-sub">{title}</p>
          </div>
          <span className="spring" />
          <button type="button" className="btn btn-ghost btn-sm" onClick={onClose}>
            Close
          </button>
        </div>

        <div className="picker-tabs tpick-tabs">
          <div className="level-btns" role="tablist" aria-label="Level">
            {LEVEL_ORDER.map((l) => (
              <button
                key={l}
                type="button"
                role="tab"
                aria-selected={tab === l}
                className={`level-btn ${tab === l ? 'on' : ''}`}
                disabled={levels[l].length === 0}
                onClick={() => {
                  setTab(l)
                  setFocus(levels[l][0]?.question_id ?? null)
                }}
              >
                {LEVEL_LABEL[l]}{' '}
                <span className="picker-left">
                  {counts[l]}/{levels[l].length}
                </span>
              </button>
            ))}
          </div>
          <span className="spring" />
          <button
            type="button"
            className="btn btn-ghost btn-sm"
            disabled={list.length === 0 || (!allTicked && full)}
            onClick={() => tickLevel(!allTicked)}
          >
            {allTicked
              ? `Untick all ${LEVEL_LABEL[tab].toLowerCase()}`
              : `Tick all ${LEVEL_LABEL[tab].toLowerCase()}`}
          </button>
        </div>

        <div className="picker-body">
          <ol className="picker-list tpick-list">
            {list.map((c, i) => {
              const q = questions.get(c.question_id)
              const on = ticked.has(c.question_id)
              return (
                <li
                  key={c.question_id}
                  className={`tpick-row ${focus === c.question_id ? 'focus' : ''} ${on ? 'on' : ''}`}
                >
                  <input
                    type="checkbox"
                    checked={on}
                    disabled={!on && full}
                    aria-label={`Question ${i + 1}`}
                    onChange={() => {
                      toggle(c.question_id)
                      setFocus(c.question_id)
                    }}
                  />
                  <button
                    type="button"
                    className="tpick-text"
                    onClick={() => setFocus(c.question_id)}
                  >
                    <span className="picker-stem">
                      <span className="tpick-num">{i + 1}.</span>{' '}
                      <MathText text={q?.stem ?? '—'} math={q?.subject === 'mathematics'} />
                    </span>
                    <span className="picker-skill">{whereFrom(c)}</span>
                  </button>
                </li>
              )
            })}
          </ol>

          <div className="picker-preview">
            {focused && focusedCandidate ? (
              <QuestionView
                question={focused}
                showKey={false}
                header={
                  <button
                    type="button"
                    className={`btn btn-sm ${ticked.has(focused.id) ? 'btn-primary' : ''}`}
                    disabled={!ticked.has(focused.id) && full}
                    onClick={() => toggle(focused.id)}
                  >
                    {ticked.has(focused.id) ? '✓ In the test' : 'Add to the test'}
                  </button>
                }
                tags={
                  <>
                    <DifficultyBadge level={focused.difficulty} />
                    <span className="badge badge-neutral">{whereFrom(focusedCandidate)}</span>
                  </>
                }
              />
            ) : (
              <p className="picker-empty">Click a question to read it the way the student will.</p>
            )}
          </div>
        </div>

        <div className="picker-foot">
          <p className="picker-hint">
            <strong>
              {chosen.length} ticked
            </strong>
            {chosen.length > 0 &&
              ` · ${counts.easy} easy, ${counts.medium} medium, ${counts.hard} hard`}
            {full && ` · ${MAX_SET} is the most a test can hold`}
            {chosen.some((c) => c.seen) && ' · includes questions they have seen'}
          </p>
          <button type="button" className="btn" onClick={onClose}>
            Cancel
          </button>
          <button
            type="button"
            className="btn btn-primary"
            disabled={chosen.length === 0}
            onClick={() => onUse(chosen.map((c) => c.question_id))}
          >
            {chosen.length === 0
              ? 'Tick at least one'
              : `Use these ${chosen.length} question${chosen.length === 1 ? '' : 's'}`}
          </button>
        </div>
      </div>
    </div>
  )
}
