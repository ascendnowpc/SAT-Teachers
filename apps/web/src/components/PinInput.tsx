import { useRef, type ClipboardEvent, type KeyboardEvent } from 'react'

const LENGTH = 4

/**
 * A four-digit PIN as four boxes, one digit each. Typing moves on, backspace
 * moves back, the arrows move between boxes, and a pasted or autofilled PIN
 * fills them all. Only digits go in. Masked unless `masked` is false.
 */
export function PinInput({
  value,
  onChange,
  label = 'PIN',
  masked = true,
  autoFocus = false,
  autoComplete = 'current-password',
  invalid = false,
}: {
  value: string
  onChange: (pin: string) => void
  /** Read out for the group, and as "digit 1 of 4" for each box. */
  label?: string
  masked?: boolean
  autoFocus?: boolean
  autoComplete?: string
  invalid?: boolean
}) {
  const boxes = useRef<(HTMLInputElement | null)[]>([])
  const digits = Array.from({ length: LENGTH }, (_, i) => value[i] ?? '')

  const focus = (i: number) => {
    const box = boxes.current[Math.max(0, Math.min(LENGTH - 1, i))]
    box?.focus()
    box?.select()
  }

  /** Writes `typed` from box `at` onwards: one digit, or a whole PIN. */
  function put(at: number, typed: string) {
    const clean = typed.replace(/\D/g, '')
    if (!clean) return
    const next = [...digits]
    // A whole PIN — pasted, or filled in by the browser — always starts at the first box.
    const from = clean.length >= LENGTH ? 0 : at
    for (let k = 0; k < clean.length && from + k < LENGTH; k++) next[from + k] = clean[k]
    onChange(next.join('').slice(0, LENGTH))
    focus(Math.min(from + clean.length, LENGTH - 1))
  }

  function onKeyDown(i: number, e: KeyboardEvent<HTMLInputElement>) {
    if (e.key === 'Backspace') {
      e.preventDefault()
      const next = [...digits]
      if (next[i]) {
        next[i] = ''
      } else if (i > 0) {
        next[i - 1] = ''
        focus(i - 1)
      }
      onChange(next.join(''))
    } else if (e.key === 'ArrowLeft') {
      e.preventDefault()
      focus(i - 1)
    } else if (e.key === 'ArrowRight') {
      e.preventDefault()
      focus(i + 1)
    }
  }

  function onPaste(i: number, e: ClipboardEvent<HTMLInputElement>) {
    e.preventDefault()
    put(i, e.clipboardData.getData('text'))
  }

  return (
    <div className={`pin-boxes${invalid ? ' is-invalid' : ''}`} role="group" aria-label={label}>
      {digits.map((d, i) => (
        <input
          key={i}
          ref={(el) => {
            boxes.current[i] = el
          }}
          className={`pin-box${d ? ' is-filled' : ''}`}
          type={masked ? 'password' : 'text'}
          inputMode="numeric"
          pattern="[0-9]*"
          autoComplete={i === 0 ? autoComplete : 'off'}
          autoFocus={autoFocus && i === 0}
          aria-label={`${label}, digit ${i + 1} of ${LENGTH}`}
          value={d}
          onFocus={(e) => e.target.select()}
          onKeyDown={(e) => onKeyDown(i, e)}
          onPaste={(e) => onPaste(i, e)}
          onChange={(e) => {
            const typed = e.target.value
            if (typed === '') return
            // The new digit is whichever was not there before.
            put(i, typed.length > 1 && typed.startsWith(d) ? typed.slice(d.length) : typed)
          }}
        />
      ))}
    </div>
  )
}
