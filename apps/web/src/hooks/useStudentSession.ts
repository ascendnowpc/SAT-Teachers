import { useCallback, useEffect, useRef, useState } from 'react'
import { supabase } from '../lib/supabase'
import type { SessionGateway } from '../lib/gateway'
import type { Session, SessionItem } from '../lib/types'

/**
 * The student's session, kept fresh.
 *
 * The same job useLiveSession does for the teacher's console, through a
 * gateway rather than a session id — because the student on a link cannot
 * query the tables at all, and cannot subscribe to them either. Where there is
 * a session id to filter on, Realtime is the fast path; where there is not,
 * and as a fallback in both cases, a poll runs while the session is live. A
 * dropped websocket mid-lesson is a student staring at a blank screen.
 */
export function useStudentSession(gateway: SessionGateway) {
  const [session, setSession] = useState<Session | null>(null)
  const [items, setItems] = useState<SessionItem[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  // Kept in a ref so the subscribe and poll effects do not tear down and
  // rebuild every time a render produces a new closure.
  const reloadRef = useRef<() => void>(() => {})

  const reload = useCallback(async () => {
    try {
      const next = await gateway.load()
      setSession(next.session)
      setItems(next.items)
      setError(null)
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Could not load this session.')
    } finally {
      setLoading(false)
    }
  }, [gateway])

  reloadRef.current = () => void reload()

  useEffect(() => {
    void reload()
  }, [reload])

  const realtimeId = gateway.sessionId
  useEffect(() => {
    if (!realtimeId) return
    const channel = supabase
      .channel(`session:${realtimeId}`)
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'session_items',
          filter: `session_id=eq.${realtimeId}`,
        },
        () => reloadRef.current(),
      )
      .on(
        'postgres_changes',
        { event: '*', schema: 'public', table: 'sessions', filter: `id=eq.${realtimeId}` },
        () => reloadRef.current(),
      )
      .subscribe()

    return () => {
      void supabase.removeChannel(channel)
    }
  }, [realtimeId])

  // A link has nothing else watching for it, so it looks more often.
  const every = realtimeId ? 10_000 : 4_000
  const isLive = session?.status === 'live' || session?.status === 'scheduled'
  useEffect(() => {
    if (!isLive) return
    const t = setInterval(() => reloadRef.current(), every)
    return () => clearInterval(t)
  }, [isLive, every])

  return { session, items, loading, error, reload }
}
