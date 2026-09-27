import { useEffect, useRef } from 'react'
import { useLocation, useNavigate } from 'react-router-dom'

/**
 * What the diagnostic form leaves in the router state when it has been handed
 * in again: the page it returns to reads the recording again and generates the
 * report from the form as it now is.
 */
export const HANDED_IN_AGAIN = { readAgain: true } as const

/**
 * Reading the recording again once the form has been handed in again.
 *
 * The reading is taken against the form (0051), so handing the form in again
 * leaves it out of date — and whoever handed it in has already said the report
 * is to be made from it. So the page the form returns to does it, rather than
 * leaving a Generate button for them to find: `run` is called once, as soon as
 * the page says it is `ready`, and the state is cleared so that a reload or
 * the back button does not read the recording a second time.
 */
export function useReadAgain(ready: boolean, run: () => Promise<void>) {
  const location = useLocation()
  const navigate = useNavigate()
  const asked = (location.state as { readAgain?: boolean } | null)?.readAgain === true
  // Survives StrictMode's second run of the effect, which the cleared state
  // alone would not: that run still sees the state it was rendered with.
  const done = useRef(false)

  useEffect(() => {
    if (!asked || !ready || done.current) return
    done.current = true
    navigate(`${location.pathname}${location.search}`, { replace: true, state: null })
    void run()
  }, [asked, ready, run, navigate, location.pathname, location.search])
}
