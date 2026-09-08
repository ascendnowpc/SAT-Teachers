import { useEffect, useMemo, useRef, useState } from 'react'
import { IconChevron } from './icons'

export interface ComboboxOption {
  value: string
  label: string
  /** Set beside the label, and searched along with it. */
  hint?: string | null
}

/**
 * A dropdown you can type into.
 *
 * A `<select>` of two hundred students is a scroll, and the fix for that used
 * to be a search box above it — two controls for one decision, where filling
 * in the first one does nothing until you look at the second. This is the one
 * control: it opens as a list, typing narrows the list, and picking closes it.
 *
 * Clicking it clears the box and shows everything, with the current choice as
 * the placeholder — so the list is always one click away and typing always
 * filters from the whole roster rather than from whatever text happened to be
 * left in the field.
 */
export function Combobox({
  options,
  value,
  onChange,
  placeholder = 'Type to search…',
  emptyText = 'Nothing matches',
  disabled = false,
  id,
  'aria-describedby': describedBy,
}: {
  options: ComboboxOption[]
  value: string
  onChange: (value: string) => void
  placeholder?: string
  emptyText?: string
  disabled?: boolean
  id?: string
  'aria-describedby'?: string
}) {
  const [open, setOpen] = useState(false)
  const [query, setQuery] = useState('')
  const [active, setActive] = useState(0)

  const inputRef = useRef<HTMLInputElement>(null)
  const listRef = useRef<HTMLUListElement>(null)

  const selected = options.find((o) => o.value === value) ?? null

  // Every word has to match, so "amara hard" narrows rather than widens.
  const shown = useMemo(() => {
    const words = query.trim().toLowerCase().split(/\s+/).filter(Boolean)
    if (words.length === 0) return options
    return options.filter((o) => {
      const hay = `${o.label} ${o.hint ?? ''}`.toLowerCase()
      return words.every((w) => hay.includes(w))
    })
  }, [options, query])

  // The highlight belongs to the list as it stands now: narrowing it to two
  // options with the fifth highlighted would put Enter on nothing.
  useEffect(() => setActive(0), [query, open])

  useEffect(() => {
    if (!open) return
    listRef.current?.querySelector('[data-active="true"]')?.scrollIntoView({ block: 'nearest' })
  }, [active, open])

  function choose(option: ComboboxOption) {
    onChange(option.value)
    setQuery('')
    setOpen(false)
    inputRef.current?.focus()
  }

  function openList() {
    if (disabled) return
    setQuery('')
    setOpen(true)
  }

  function onKeyDown(e: React.KeyboardEvent) {
    if (e.key === 'ArrowDown' || e.key === 'ArrowUp') {
      e.preventDefault()
      if (!open) return openList()
      if (shown.length === 0) return
      const step = e.key === 'ArrowDown' ? 1 : -1
      setActive((i) => (i + step + shown.length) % shown.length)
      return
    }
    if (e.key === 'Enter' && open) {
      const pick = shown[active]
      if (pick) {
        e.preventDefault()
        choose(pick)
      }
      return
    }
    if (e.key === 'Escape' && open) {
      e.preventDefault()
      setOpen(false)
      setQuery('')
    }
  }

  return (
    <div
      className={`combo ${open ? 'open' : ''} ${disabled ? 'disabled' : ''}`}
      // Leaving for anything outside this control closes it; moving between
      // the input and its own list does not.
      onBlur={(e) => {
        if (e.currentTarget.contains(e.relatedTarget as Node | null)) return
        setOpen(false)
        setQuery('')
      }}
    >
      <div className="combo-field">
        <input
          id={id}
          ref={inputRef}
          className="input combo-input"
          type="text"
          role="combobox"
          autoComplete="off"
          disabled={disabled}
          aria-expanded={open}
          aria-controls={id ? `${id}-list` : undefined}
          aria-autocomplete="list"
          aria-describedby={describedBy}
          value={open ? query : (selected?.label ?? '')}
          placeholder={open ? (selected?.label ?? placeholder) : placeholder}
          onChange={(e) => {
            setQuery(e.target.value)
            setOpen(true)
          }}
          onMouseDown={() => {
            // Clicking an open list's input should shut it again, the way a
            // select does, rather than reopening it under the pointer.
            if (open) setOpen(false)
            else openList()
          }}
          onKeyDown={onKeyDown}
        />
        <button
          type="button"
          className="combo-toggle"
          tabIndex={-1}
          disabled={disabled}
          aria-label={open ? 'Close the list' : 'Show the list'}
          onMouseDown={(e) => {
            e.preventDefault()
            if (open) {
              setOpen(false)
              setQuery('')
            } else {
              openList()
              inputRef.current?.focus()
            }
          }}
        >
          <IconChevron />
        </button>
      </div>

      {open && (
        <ul className="combo-list" id={id ? `${id}-list` : undefined} role="listbox" ref={listRef}>
          {shown.length === 0 ? (
            <li className="combo-empty">{emptyText}</li>
          ) : (
            shown.map((o, i) => (
              <li key={o.value}>
                <button
                  type="button"
                  role="option"
                  aria-selected={o.value === value}
                  data-active={i === active}
                  className={`combo-opt ${i === active ? 'active' : ''} ${
                    o.value === value ? 'chosen' : ''
                  }`}
                  onMouseEnter={() => setActive(i)}
                  // mousedown, not click: the input's blur would close the
                  // list before a click ever landed on it.
                  onMouseDown={(e) => {
                    e.preventDefault()
                    choose(o)
                  }}
                >
                  <span className="lab">{o.label}</span>
                  {o.hint && <span className="hint">{o.hint}</span>}
                </button>
              </li>
            ))
          )}
        </ul>
      )}
    </div>
  )
}
