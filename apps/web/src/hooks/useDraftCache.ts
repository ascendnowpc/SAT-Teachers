import { useCallback, useEffect, useRef, useState } from 'react'

/**
 * Keeps what is typed into a form in the browser until it is saved, so leaving
 * the page does not lose it.
 *
 * A teacher writing up a session goes back to the questions — to look at the
 * ones the student got wrong — and comes back to write about them. The form
 * read the last saved copy from the database on arrival, so everything written
 * since the last Save was gone. Now each change is kept in localStorage under
 * the session, and coming back puts it back: on top of what was saved, with a
 * notice saying so and a way to throw it away.
 *
 * `baseline` is the form as the database has it: null until it has loaded,
 * then whatever the page set from it, and again after every save. While the
 * form matches it there is nothing unsaved and nothing kept, which is also how
 * a draft is cleared — saving makes the baseline what is on screen.
 *
 * Only the first load restores. A save reloads the baseline too, and reading
 * the draft back then would be reading back what was just saved.
 */
export function useDraftCache<T>(
  key: string | null,
  value: T,
  baseline: T | null,
  restore: (draft: T) => void,
): { restored: boolean; discard: () => void; forget: () => void } {
  const [restored, setRestored] = useState(false)
  const checked = useRef<string | null>(null)
  // Set for the one render in which the restore has been asked for and has
  // not landed: `value` there is still the saved copy, and taking that as the
  // form being back in step would delete the draft it is about to show.
  const restoring = useRef(false)
  const restoreRef = useRef(restore)
  restoreRef.current = restore

  // The first time the saved copy is in, put any unsaved draft over it.
  useEffect(() => {
    if (!key || baseline === null || checked.current === key) return
    checked.current = key
    const draft = readDraft<T>(key)
    if (draft !== null && JSON.stringify(draft) !== JSON.stringify(baseline)) {
      restoring.current = true
      restoreRef.current(draft)
      setRestored(true)
    }
  }, [key, baseline])

  // Every change after that is kept, until it matches what is saved.
  useEffect(() => {
    if (!key || baseline === null || checked.current !== key) return
    if (restoring.current) {
      restoring.current = false
      return
    }
    if (JSON.stringify(value) === JSON.stringify(baseline)) {
      clearDraft(key)
      setRestored(false)
    } else {
      writeDraft(key, value)
    }
  }, [key, value, baseline])

  const discard = useCallback(() => {
    if (!key || baseline === null) return
    clearDraft(key)
    restoreRef.current(baseline)
    setRestored(false)
  }, [key, baseline])

  // Called once the form is saved, for a page that leaves straight after —
  // handing a form in goes back to the session, and there is no reload of the
  // saved copy for the form to be seen matching.
  const forget = useCallback(() => {
    if (!key) return
    clearDraft(key)
    setRestored(false)
  }, [key])

  return { restored, discard, forget }
}

const PREFIX = 'sat-draft:'

// Storage can be full, switched off or missing (a private window); a form
// that cannot keep a draft still has to work, so every touch of it is guarded.
function readDraft<T>(key: string): T | null {
  try {
    const raw = localStorage.getItem(PREFIX + key)
    return raw === null ? null : (JSON.parse(raw) as T)
  } catch {
    return null
  }
}

function writeDraft<T>(key: string, value: T) {
  try {
    localStorage.setItem(PREFIX + key, JSON.stringify(value))
  } catch {
    // Nothing kept; the page still saves to the database as before.
  }
}

function clearDraft(key: string) {
  try {
    localStorage.removeItem(PREFIX + key)
  } catch {
    // As above.
  }
}
