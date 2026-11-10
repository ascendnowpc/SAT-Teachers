import { SAT_DOMAINS, type Band } from '../lib/bluebook'

/**
 * The eight content domains' performance bands from an SAT score report
 * (0090), Reading and Writing beside Math, in College Board's order and words.
 */
export function DomainBands({ domains }: { domains: Record<string, Band> }) {
  return (
    <div className="bluebook-bands">
      {(['english', 'mathematics'] as const).map((subject) => (
        <div key={subject}>
          <div className="bluebook-bands-head">{subject === 'english' ? 'Reading and Writing' : 'Math'}</div>
          <dl>
            {SAT_DOMAINS.filter((d) => d.subject === subject).map((d) => (
              <div key={d.section} className="bluebook-band">
                <dt>{d.label}</dt>
                <dd className="num">
                  {domains[d.section] ? `${domains[d.section][0]}–${domains[d.section][1]}` : '—'}
                </dd>
              </div>
            ))}
          </dl>
        </div>
      ))}
    </div>
  )
}
