import type { ReactNode } from 'react'
import { Passage } from './ui'
import { OPTION_LABELS } from '../lib/constants'
import type { OptionLabel, Question } from '../lib/types'

/**
 * One question, laid out the way the student meets it: stimulus on the left,
 * question and choices on the right.
 *
 * The teachers read these screens against the test their students sit, so a
 * question should not look like one thing in the bank and another in the exam.
 * This is that one shape — the bank card, the printed test and the student's
 * own screen all mount it, and the only thing they vary is what sits in the
 * header bar and what follows the choices.
 *
 * Its labels — level, section, skill — go under the stimulus rather than over
 * the question, because a stimulus rarely fills its half and the choices ought
 * to follow the question they belong to without a row of chips in between.
 *
 * Below 900px it stacks, which is the same breakpoint the exam screen uses.
 *
 * `layout="stacked"` drops the stimulus pane for the case where the passage is
 * already printed above — a paper sets a shared passage once and hangs five
 * questions off it, and repeating it five times down the left would be worse,
 * not better.
 */
export function QuestionView({
  question,
  number,
  header,
  tags,
  footer,
  showKey = true,
  layout = 'split',
  correct,
  chosen,
}: {
  question: Question
  /** The number badge, if this question has a position worth showing. */
  number?: string
  /** Controls for the header bar — a checkbox, a drag handle, reorder buttons. */
  header?: ReactNode
  /** Level, section, skill. Set under the stimulus, where there is room. */
  tags?: ReactNode
  /** Anything that belongs under the choices: an explanation, a rationale. */
  footer?: ReactNode
  /** Marks the key. Off when a teacher is sharing the screen with a student. */
  showKey?: boolean
  /** 'stacked' when the passage is already set above this question. */
  layout?: 'split' | 'stacked'
  /**
   * The key, when the caller has it and the question does not carry it. A
   * student never reads question_keys — RLS keeps it out of their reach — so
   * their own results screen passes the revealed answer in from the item.
   */
  correct?: OptionLabel | null
  /** What this student picked, marked alongside the key. */
  chosen?: OptionLabel | null
}) {
  const key = correct ?? question.question_keys?.correct_option ?? null
  const options = [...question.question_options].sort(
    (a, b) => OPTION_LABELS.indexOf(a.label) - OPTION_LABELS.indexOf(b.label),
  )

  return (
    <div className={`qsplit ${layout === 'stacked' ? 'stacked' : ''}`}>
      {layout === 'split' && (
        <div className="qsplit-stim">
          {question.passage ? (
            <Passage
              body={question.passage}
              underline={question.passage_underline}
              className="stim"
            />
          ) : question.image_url ? null : (
            <p className="stim-empty">This question stands on its own — read it on the right.</p>
          )}
          {question.image_url && (
            <img className="stim-figure" src={question.image_url} alt="Figure for this question" />
          )}
          {tags && <div className="qsplit-tags">{tags}</div>}
        </div>
      )}

      <div className="qsplit-main">
        {(number || header || (tags && layout === 'stacked')) && (
          <div className="qsplit-head">
            {number && <span className="qn">{number.padStart(2, '0')}</span>}
            {header}
            {layout === 'stacked' && tags}
          </div>
        )}

        <p className="qsplit-stem">{question.stem}</p>

        <div className="qsplit-choices">
          {options.map((o) => {
            const isKey = showKey && o.label === key
            const isChosen = o.label === chosen
            return (
              <div
                key={o.id}
                className={`qch ${isKey ? 'is-key' : ''} ${isChosen && !isKey ? 'is-chosen' : ''}`}
              >
                <span className="lab">{o.label}</span>
                <span className="body">{o.body}</span>
                {isChosen && <span className="pick">You chose this</span>}
                {isKey && <span className="tick">Correct</span>}
              </div>
            )
          })}
        </div>

        {footer}
      </div>
    </div>
  )
}
