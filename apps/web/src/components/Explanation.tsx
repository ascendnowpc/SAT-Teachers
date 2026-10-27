import { useMemo } from 'react'
import {
  parseExplanation,
  parseSourceStats,
  type ExplanationPart,
} from '../lib/explanation'
import { MathText } from './MathText'

/**
 * An explanation, laid out the way OnePrep lays it out: why the key is right,
 * with its step, then each other choice on its own row — the one-line reason,
 * the step it comes from and the key phrase it turns on. lib/explanation finds
 * the parts; an explanation in neither OnePrep's shape nor the College
 * Board's is shown as it was written, its line breaks kept.
 */
export function Explanation({
  text,
  math,
  title = 'Explanation',
}: {
  text: string | null | undefined
  /** A mathematics question: fractions are set stacked (MathText). */
  math: boolean
  title?: string
}) {
  const parsed = useMemo(() => parseExplanation(text), [text])
  if (!text) return null

  if (!parsed) {
    return (
      <div className="q-note">
        <div className="section-title">{title}</div>
        <div className="expl-plain">
          <MathText text={text} math={math} />
        </div>
      </div>
    )
  }

  return (
    <div className="q-note expl">
      <div className="section-title">{title}</div>

      <section className="expl-right">
        <h4 className="expl-head">
          <span className="expl-letter expl-letter-ok">{parsed.correct}</span>
          Why {parsed.correct} is correct
        </h4>
        <Part part={parsed.why} math={math} />
      </section>

      {parsed.others.length > 0 && (
        <section className="expl-wrong">
          <h4 className="expl-head">Why the others are wrong</h4>
          <ul>
            {parsed.others.map((o) => (
              <li key={o.option}>
                <span className="expl-letter">{o.option}</span>
                <div>
                  <Part part={o.part} math={math} />
                </div>
              </li>
            ))}
          </ul>
        </section>
      )}
    </div>
  )
}

function Part({ part, math }: { part: ExplanationPart; math: boolean }) {
  return (
    <>
      {part.lead && (
        <p className="expl-lead">
          <MathText text={part.lead} math={math} />
        </p>
      )}
      {part.steps.map((s) => (
        <div className="expl-step" key={s.n}>
          <div className="expl-step-head">
            <span className="expl-step-n">Step {s.n}</span>
            {s.label}
          </div>
          {s.keyPhrase && (
            <div className="expl-key">
              Key phrase <q>{s.keyPhrase}</q>
            </div>
          )}
          <p>
            <MathText text={s.text} math={math} />
          </p>
        </div>
      ))}
    </>
  )
}

/**
 * Why a question sits at its level. For an item from OnePrep that is OnePrep's
 * numbers (0065), which read better as numbers; the teachers' own sentence is
 * shown as written.
 */
export function LevelReason({ text, level }: { text: string | null; level: string }) {
  const stats = useMemo(() => parseSourceStats(text), [text])
  if (!text) return null
  return (
    <div className="q-note">
      <div className="section-title">Why {level}</div>
      {stats ? (
        <>
          <dl className="expl-stats">
            <div>
              <dt>Answer it correctly</dt>
              <dd>{stats.accuracy}%</dd>
            </div>
            <div>
              <dt>Average time</dt>
              <dd>{stats.average}</dd>
            </div>
            <div>
              <dt>Middle half of correct answers</dt>
              <dd>
                {stats.middle[0]} – {stats.middle[1]}
              </dd>
            </div>
          </dl>
          <p className="expl-source">{stats.source}’s figures, from its own users.</p>
        </>
      ) : (
        text
      )}
    </div>
  )
}
