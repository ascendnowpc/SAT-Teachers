import {
  cloneElement,
  useId,
  type InputHTMLAttributes,
  type ReactElement,
  type ReactNode,
  type SelectHTMLAttributes,
  type TextareaHTMLAttributes,
} from 'react'
import { parsePassage } from '../lib/paper'
import type { Difficulty } from '../lib/types'

/**
 * The hint is tied to the control with aria-describedby rather than living
 * inside the <label>. Nesting it would fold the hint text into the control's
 * accessible name, so "Passage or stimulus" would announce as "Passage or
 * stimulus, optional — leave empty for a standalone question".
 */
export function Field({
  label,
  required,
  hint,
  children,
}: {
  label: string
  required?: boolean
  hint?: string
  children: ReactElement<{ id?: string; 'aria-describedby'?: string }>
}) {
  const id = useId()
  const hintId = hint ? `${id}-hint` : undefined

  return (
    <div className="field">
      <label className="label" htmlFor={id}>
        {label}
        {required && (
          <span className="req" aria-hidden="true">
            *
          </span>
        )}
      </label>
      {cloneElement(children, { id, 'aria-describedby': hintId })}
      {hint && (
        <span className="hint" id={hintId}>
          {hint}
        </span>
      )}
    </div>
  )
}

export function Input(props: InputHTMLAttributes<HTMLInputElement>) {
  return <input {...props} className={`input ${props.className ?? ''}`.trim()} />
}

export function Textarea(props: TextareaHTMLAttributes<HTMLTextAreaElement>) {
  return <textarea {...props} className={`textarea ${props.className ?? ''}`.trim()} />
}

export function Select(props: SelectHTMLAttributes<HTMLSelectElement>) {
  return <select {...props} className={`select ${props.className ?? ''}`.trim()} />
}

export function DifficultyBadge({ level }: { level: Difficulty }) {
  return <span className={`badge badge-${level}`}>{level}</span>
}

export function Notice({
  kind = 'info',
  children,
}: {
  kind?: 'error' | 'ok' | 'info'
  children: ReactNode
}) {
  return (
    <div className={`notice notice-${kind}`} role={kind === 'error' ? 'alert' : undefined}>
      {children}
    </div>
  )
}

/**
 * The stimulus a question is about. `className` picks the surface it sits on
 * (the bank card, the student's stage); the underline handling is the same
 * everywhere, because it is part of the question rather than of the styling.
 */
/**
 * A stimulus, set the way its paper sets it.
 *
 * The bank stores a passage as one text field, but a paper does not print one:
 * it prints paragraphs, the "Text 1"/"Text 2" headings of a paired-text item,
 * and — for the chart and table items — an actual table. Rendering the field
 * as a single pre-wrapped paragraph is what turned the sleep table into a run
 * of loose numbers, so every view goes through this instead.
 */
export function Passage({
  body,
  underline,
  className = 'q-passage',
}: {
  body: string
  underline?: string | null
  className?: string
}) {
  return (
    <div className={className}>
      {parsePassage(body, underline).map((block, i) => {
        if (block.kind === 'heading') {
          return (
            <p key={i} className="passage-heading">
              {block.text}
            </p>
          )
        }
        if (block.kind === 'table') {
          return (
            <div key={i} className="passage-table-wrap">
              <table className="passage-table">
                <thead>
                  <tr>
                    {block.head.map((h, c) => (
                      <th key={c} scope="col">
                        {h}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {block.rows.map((row, r) => (
                    <tr key={r}>
                      {row.map((cell, c) => (
                        <td key={c}>{cell}</td>
                      ))}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )
        }
        return (
          <p key={i} className="passage-text">
            {block.segments.map((seg, j) =>
              seg.underlined ? (
                <u key={j} className="underlined">
                  {seg.text}
                </u>
              ) : (
                <span key={j}>{seg.text}</span>
              ),
            )}
          </p>
        )
      })}
    </div>
  )
}
