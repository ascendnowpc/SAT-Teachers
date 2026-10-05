import { Fragment } from 'react'
import { splitFractions, type MathSegment } from '../lib/fractions'

/**
 * Text that may hold mathematics, with every "a/b" set as a stacked fraction —
 * the way the test prints it, rather than the way it was typed.
 *
 * Off unless `math` is set, because only a mathematics question is written
 * like this: an English passage with "and/or" or a date in it is prose, and is
 * left exactly as it is. See lib/fractions for what is read as a fraction.
 *
 * The slash is still there for a screen reader and for a copy and paste, in a
 * span nobody sees, so "1/14" reads and pastes as "1/14" and not as "114".
 */
export function MathText({ text, math = true }: { text: string | null | undefined; math?: boolean }) {
  if (!text) return null
  if (!math || !text.includes('/')) return <>{text}</>
  return <Segments segments={splitFractions(text)} />
}

function Segments({ segments }: { segments: MathSegment[] }) {
  return (
    <>
      {segments.map((s, i) =>
        s.kind === 'text' ? (
          <Fragment key={i}>{s.text}</Fragment>
        ) : (
          <span key={i} className="frac">
            <span className="frac-num">
              <Segments segments={s.num} />
            </span>
            <span className="sr-only">/</span>
            <span className="frac-den">
              <Segments segments={s.den} />
            </span>
          </span>
        ),
      )}
    </>
  )
}
