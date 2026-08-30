import { useCallback, useEffect, useRef, useState } from 'react'
import { row, rows, supabase } from '../lib/supabase'
import type { Session, SessionItem } from '../lib/types'

const SESSION_SELECT =
  '*, teacher:profiles!sessions_teacher_id_fkey(id,full_name,display_id),' +
  ' student:profiles!sessions_student_id_fkey(id,full_name,display_id)'

// Teachers get the answer key embedded; students are not offered it, and RLS
// would withhold it even if they asked.
const QUESTION_EMBED = 'questions(*, question_options(*))'
const QUESTION_EMBED_WITH_KEY = 'questions(*, question_options(*), question_keys(*))'

/**
 * Loads a session and its items, then keeps them fresh.
 *
 * Realtime is the fast path, but a dropped websocket during a lesson means a
 * student staring at a blank screen, so a 10s poll runs alongside it whenever
 * the session is live. Both funnel into the same reload.
 */
export function useLiveSession(sessionId: string, opts: { withAssessments: boolean }) {
  const [session, setSession] = useState<Session | null>(null)
  const [items, setItems] = useState<SessionItem[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const withAssessments = opts.withAssessments
  // Kept in a ref so the polling effect does not resubscribe on every render.
  const reloadRef = useRef<() => void>(() => {})

  const reload = useCallback(async () => {
    const itemSelect = withAssessments
      ? `*, ${QUESTION_EMBED_WITH_KEY}, session_item_assessments(*)`
      : `*, ${QUESTION_EMBED}`

    const [s, i] = await Promise.all([
      supabase.from('sessions').select(SESSION_SELECT).eq('id', sessionId).maybeSingle(),
      supabase
        .from('session_items')
        .select(itemSelect)
        .eq('session_id', sessionId)
        .order('sequence_no'),
    ])

    if (s.error) setError(s.error.message)
    else setSession(row<Session>(s.data))

    if (i.error) setError(i.error.message)
    else setItems(rows<SessionItem>(i.data))

    setLoading(false)
  }, [sessionId, withAssessments])

  reloadRef.current = () => void reload()

  useEffect(() => {
    void reload()
  }, [reload])

  useEffect(() => {
    const channel = supabase
      .channel(`session:${sessionId}`)
      .on(
        'postgres_changes',
        { event: '*', schema: 'public', table: 'session_items', filter: `session_id=eq.${sessionId}` },
        () => reloadRef.current(),
      )
      .on(
        'postgres_changes',
        { event: '*', schema: 'public', table: 'sessions', filter: `id=eq.${sessionId}` },
        () => reloadRef.current(),
      )
      .subscribe()

    return () => {
      void supabase.removeChannel(channel)
    }
  }, [sessionId])

  const isLive = session?.status === 'live'
  useEffect(() => {
    if (!isLive) return
    const t = setInterval(() => reloadRef.current(), 10_000)
    return () => clearInterval(t)
  }, [isLive])

  return { session, items, loading, error, reload }
}
