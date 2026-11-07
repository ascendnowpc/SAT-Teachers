import { PRACTICE_RESOURCES } from '../lib/satGuide'

/** The brief's practice resources: on About the SAT and on the student's own page. */
export function PracticeList() {
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
