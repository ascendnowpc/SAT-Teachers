import { useCallback, useEffect, useMemo, useState } from 'react'
import { stagesBySession, type Stages } from '../lib/admin'
import { rows, supabase } from '../lib/supabase'
import type { Profile, Session, SessionReportRow } from '../lib/types'

/** Both names on every session, the same embed the teacher's screens use. */
const SESSION_SELECT =
  '*, teacher:profiles!sessions_teacher_id_fkey(id,full_name,display_id),' +
  ' student:profiles!sessions_student_id_fkey(id,full_name,display_id,pc)'

export interface School {
  profiles: Profile[]
  sessions: Session[]
  reports: SessionReportRow[]
  stages: Stages
  loading: boolean
  error: string | null
  reload: () => Promise<void>
}

/**
 * The whole school, in three reads.
 *
 * Every admin page is a different arrangement of the same three lists, so they
 * are fetched once here and arranged in ./lib/admin rather than each page
 * inventing its own query. Three reads rather than one view: a view would need
 * its own RLS reasoning, and these three already have theirs — 0044's admin
 * SELECT policies are what makes them come back full rather than empty.
 *
 * It loads everything rather than a page at a time on purpose. An admin asks
 * questions that span the lot ("who has an unpublished report", "which teacher
 * has stopped"), and at this size — one school, tens of teachers, hundreds of
 * sessions — the honest answer is one round trip and an array. When that stops
 * being true the fix is a counting view, not a paginated version of this.
 */
export function useSchool(): School {
  const [profiles, setProfiles] = useState<Profile[]>([])
  const [sessions, setSessions] = useState<Session[]>([])
  const [reports, setReports] = useState<SessionReportRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const reload = useCallback(async () => {
    const [p, s, r] = await Promise.all([
      supabase.from('profiles').select('*').order('full_name'),
      supabase.from('sessions').select(SESSION_SELECT).order('scheduled_at', { ascending: false }),
      supabase.from('session_reports').select('*'),
    ])

    const failed = p.error ?? s.error ?? r.error
    setError(failed ? failed.message : null)

    setProfiles(rows<Profile>(p.data))
    setSessions(rows<Session>(s.data))
    setReports(rows<SessionReportRow>(r.data))
    setLoading(false)
  }, [])

  useEffect(() => {
    void reload()
  }, [reload])

  // Memoised because every page hands it to a useMemo of its own: a fresh Map
  // on every render would make all of them recompute on every render.
  const stages = useMemo(() => stagesBySession(reports), [reports])

  return { profiles, sessions, reports, stages, loading, error, reload }
}
