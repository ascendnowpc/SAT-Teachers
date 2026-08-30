import {
  cloneElement,
  useId,
  type InputHTMLAttributes,
  type ReactElement,
  type ReactNode,
  type SelectHTMLAttributes,
  type TextareaHTMLAttributes,
} from 'react'
import { splitPassage } from '../lib/passage'
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
      {splitPassage(body, underline).map((seg, i) =>
        seg.underlined ? (
          <u key={i} className="underlined">
            {seg.text}
          </u>
        ) : (
          <span key={i}>{seg.text}</span>
        ),
      )}
    </div>
  )
}
