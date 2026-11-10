import { PRACTICE_RESOURCES } from '../lib/satGuide'

/**
 * The brief's practice resources: on About the SAT and on the student's own
 * page.
 *
 * `cards` sets them out as a grid of cards rather than a list. The student's
 * page uses it, because there this is somewhere to go rather than a reference
 * — it is what the page offers when nothing is booked — and a card is worth
 * reaching for where a line of a list is not.
 */
export function PracticeList({ cards = false }: { cards?: boolean }) {
  if (cards) {
    return (
      <div className="practice-grid">
        {PRACTICE_RESOURCES.map((r) => (
          <a key={r.href} className="practice-card" href={r.href} target="_blank" rel="noreferrer">
            <span className="practice-card-body">
              <strong>{r.label}</strong>
              <span>{r.note}</span>
            </span>
            <svg className="arrow" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
              <path d="M7 17 17 7M9 7h8v8" />
            </svg>
          </a>
        ))}
      </div>
    )
  }

  return (
    <ul className="practice-list">
      {PRACTICE_RESOURCES.map((r) => (
        <li key={r.href}>
          <a href={r.href} target="_blank" rel="noreferrer">
            {r.label}
          </a>
          <span>{r.note}</span>
        </li>
      ))}
    </ul>
  )
}
