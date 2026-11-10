import { Input, Select } from './ui'
import {
  countLabel,
  isNarrowed,
  type Facet,
  type FacetOption,
  type PaperFilters,
} from '../lib/paperFilter'

/**
 * The row above a test that narrows it: a search, a list per thing a question
 * can be filtered by, and how many questions are left out of how many.
 *
 * Each option carries the count it would leave, and an option that would leave
 * nothing is shown but cannot be picked, so a teacher sees at once that the
 * pool has no hard Boundaries questions rather than finding out by trying.
 * A list with only one thing in it — a level test is all one difficulty — is
 * not shown, since there is nothing to choose.
 */
export function PaperFilterBar({
  filters,
  options,
  shown,
  total,
  onChange,
  onClear,
}: {
  filters: PaperFilters
  options: Record<Facet, FacetOption[]>
  shown: number
  total: number
  onChange: <K extends keyof PaperFilters>(key: K, value: PaperFilters[K]) => void
  onClear: () => void
}) {
  const narrowed = isNarrowed(filters)

  return (
    <div className="filters paper-filters no-print" role="search" aria-label="Filter the questions">
      <Input
        className="filter-search"
        type="search"
        value={filters.query}
        placeholder="Search the questions, their choices or an id…"
        aria-label="Search the questions"
        onChange={(e) => onChange('query', e.target.value)}
      />

      <FacetSelect facet="section" any="Any section" filters={filters} options={options.section} onChange={onChange} />
      <FacetSelect
        facet="skill"
        any="Any skill"
        filters={filters}
        options={options.skill}
        onChange={onChange}
        grouped={!filters.section}
      />
      <FacetSelect facet="difficulty" any="Any difficulty" filters={filters} options={options.difficulty} onChange={onChange} />
      <FacetSelect facet="answer" any="Any answer type" filters={filters} options={options.answer} onChange={onChange} />
      <FacetSelect facet="source" any="Any source" filters={filters} options={options.source} onChange={onChange} />
      <FacetSelect facet="figure" any="With or without a picture" filters={filters} options={options.figure} onChange={onChange} />

      <span className="spring" />
      <span className="filter-count" aria-live="polite">
        {narrowed
          ? `Showing ${countLabel(shown)} of ${countLabel(total)} questions`
          : `${countLabel(total)} question${total === 1 ? '' : 's'}`}
      </span>
      {narrowed && (
        <button type="button" className="btn btn-ghost btn-sm" onClick={onClear}>
          Clear filters
        </button>
      )}
    </div>
  )
}

const ARIA: Record<Facet, string> = {
  section: 'Filter by section',
  skill: 'Filter by skill',
  difficulty: 'Filter by difficulty',
  answer: 'Filter by answer type',
  source: 'Filter by source',
  figure: 'Filter by picture',
}

function FacetSelect({
  facet,
  any,
  filters,
  options,
  onChange,
  grouped = false,
}: {
  facet: Facet
  any: string
  filters: PaperFilters
  options: FacetOption[]
  onChange: <K extends keyof PaperFilters>(key: K, value: PaperFilters[K]) => void
  grouped?: boolean
}) {
  const value = filters[facet]
  // Nothing to choose between — unless a choice came in on the address and
  // has to stay visible to be undone.
  if (options.length < 2 && !value) return null

  const option = (o: FacetOption) => (
    <option key={o.value} value={o.value} disabled={o.count === 0 && o.value !== value}>
      {o.label} ({countLabel(o.count)})
    </option>
  )

  let body
  if (grouped && options.some((o) => o.group)) {
    const groups = new Map<string, FacetOption[]>()
    for (const o of options) {
      const g = o.group ?? 'Other'
      groups.set(g, [...(groups.get(g) ?? []), o])
    }
    body = [...groups.entries()].map(([label, list]) => (
      <optgroup key={label} label={label}>
        {list.map(option)}
      </optgroup>
    ))
  } else {
    body = options.map(option)
  }

  return (
    <Select
      value={value}
      aria-label={ARIA[facet]}
      className={value ? 'is-set' : undefined}
      onChange={(e) => onChange(facet, e.target.value as PaperFilters[typeof facet])}
    >
      <option value="">{any}</option>
      {/* A value from the address the test no longer holds, so it can be seen and cleared. */}
      {value && !options.some((o) => o.value === value) && <option value={value}>{value} (0)</option>}
      {body}
    </Select>
  )
}
