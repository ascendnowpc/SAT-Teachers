import { useLayoutEffect, useRef } from 'react'
import {
  FIELD_LABELS,
  hasProblem,
  type DiagnosticRow,
  type EditableField,
  type MarkedPerformance,
  type Problem,
  type RowField,
} from '../lib/diagnostic'

/**
 * The English reflection grid, as a form.
 *
 * Same six columns as the paper the teachers already fill in, in the same
 * order, so a teacher who has the printed one in front of them is filling the
 * same boxes on screen. Domain and Skill Focus are printed on it; the rest is
 * theirs, and everything but the note under the mark is required — an unfilled
 * one is marked here rather than only counted in a message at the bottom.
 */
export function DiagnosticGrid({
  rows,
  problems,
  disabled,
  onChange,
}: {
  rows: DiagnosticRow[]
  /** Empty until the teacher tries to hand the form in — nothing is red on arrival. */
  problems: Problem[]
  disabled: boolean
  onChange: (domain: string, field: EditableField, value: string) => void
}) {
  return (
    <div className="table-wrap">
      <table className="grid-table grid-form">
        <thead>
          <tr>
            <th>Domain</th>
            <th>Skill Focus</th>
            <th className="c">
              Student Performance <span className="hdr-note">(✓ / ✗)</span>
            </th>
            <th>Strengths observed</th>
            <th>Gaps observed</th>
            <th>Next steps / Targets</th>
          </tr>
        </thead>
        <tbody>
          {rows.map((r) => (
            <tr key={r.domain}>
              <th scope="row" className="dom">
                {r.label}
              </th>
              <td>
                <ul className="tight">
                  {r.skillFocus.map((s) => (
                    <li key={s}>{s}</li>
                  ))}
                </ul>
              </td>
              <td className="c">
                <MarkPicker
                  row={r}
                  bad={hasProblem(problems, r.domain, 'performance')}
                  disabled={disabled}
                  onPick={(mark) => onChange(r.domain, 'performance', mark)}
                />
                {/* The paper's box is bigger than a tick, and teachers write in
                    it. Optional: the mark is the part the report needs. */}
                <Box
                  row={r}
                  field="performanceNote"
                  disabled={disabled}
                  onChange={onChange}
                  className="perf-note"
                  placeholder="Optional"
                />
              </td>
              <Cell row={r} field="strengths" problems={problems} disabled={disabled} onChange={onChange} />
              <Cell row={r} field="gaps" problems={problems} disabled={disabled} onChange={onChange} />
              <Cell
                row={r}
                field="targets"
                problems={problems}
                disabled={disabled}
                onChange={onChange}
                className="targets-cell"
              />
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

/**
 * A box that grows with what is in it.
 *
 * A fixed height would be fine for the columns the teacher types into and
 * wrong for the targets: they arrive with three sentences already printed in
 * them, and a cell that clips its own default is a cell nobody reads before
 * agreeing with it.
 */
function Box({
  row,
  field,
  disabled,
  onChange,
  className,
  placeholder,
  bad = false,
}: {
  row: DiagnosticRow
  field: Exclude<EditableField, 'performance'>
  disabled: boolean
  onChange: (domain: string, field: EditableField, value: string) => void
  className?: string
  placeholder?: string
  bad?: boolean
}) {
  const ref = useRef<HTMLTextAreaElement>(null)
  const value = row[field]

  useLayoutEffect(() => {
    const el = ref.current
    if (!el) return
    // Also on resize: the columns are percentages, so a narrower window rewraps
    // the text and a height measured at the old width clips it.
    const fit = () => {
      el.style.height = 'auto'
      el.style.height = `${el.scrollHeight}px`
    }
    fit()
    window.addEventListener('resize', fit)
    return () => window.removeEventListener('resize', fit)
  }, [value])

  return (
    <textarea
      ref={ref}
      className={`cell-input ${className ?? ''} ${bad ? 'bad' : ''}`.trim()}
      rows={2}
      value={value}
      disabled={disabled}
      placeholder={placeholder}
      aria-invalid={bad || undefined}
      aria-label={`${FIELD_LABELS[field]} — ${row.label}`}
      onChange={(e) => onChange(row.domain, field, e.target.value)}
    />
  )
}

/** One of the written columns, in its own cell. */
function Cell({
  row,
  field,
  problems,
  disabled,
  onChange,
  className,
}: {
  row: DiagnosticRow
  field: Exclude<RowField, 'performance'>
  problems: Problem[]
  disabled: boolean
  onChange: (domain: string, field: EditableField, value: string) => void
  className?: string
}) {
  return (
    <td>
      <Box
        row={row}
        field={field}
        disabled={disabled}
        onChange={onChange}
        className={className}
        bad={hasProblem(problems, row.domain, field)}
      />
    </td>
  )
}

/**
 * The Student Performance column: a tick or a cross, and nothing else.
 *
 * The computed grid on the report has a third verdict — mixed — because two of
 * four right is neither. This form has two, because the paper has two: it is
 * one judgement the teacher signs about the domain, not an arithmetic on
 * answers that have not been marked yet.
 */
function MarkPicker({
  row,
  bad,
  disabled,
  onPick,
}: {
  row: DiagnosticRow
  bad: boolean
  disabled: boolean
  onPick: (mark: MarkedPerformance) => void
}) {
  const marks: { value: MarkedPerformance; symbol: string; title: string }[] = [
    { value: 'tick', symbol: '✓', title: 'Held up in this domain' },
    { value: 'cross', symbol: '✗', title: 'Did not hold up in this domain' },
  ]

  return (
    <div
      className={`mark-pick ${bad ? 'bad' : ''}`.trim()}
      role="group"
      aria-label={`Student performance — ${row.label}`}
    >
      {marks.map((m) => (
        <button
          key={m.value}
          type="button"
          className={`mark-opt ${m.value} ${row.performance === m.value ? 'on' : ''}`}
          aria-pressed={row.performance === m.value}
          disabled={disabled}
          title={m.title}
          onClick={() => onPick(m.value)}
        >
          {m.symbol}
        </button>
      ))}
    </div>
  )
}
