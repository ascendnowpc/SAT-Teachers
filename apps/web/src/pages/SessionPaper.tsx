import { useCallback, useEffect, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { PaperBuilder, useBankData } from '../components/PaperBuilder'
import { Notice } from '../components/ui'
import { row, rows, supabase } from '../lib/supabase'
import type { Session, SessionItem } from '../lib/types'

/**
 * Building the paper for one session, before the day.
 *
 * This is where the teacher's whole job now happens: read the bank as the
 * papers it came from, tick the questions this student should sit, put them in
 * the order they should arrive in, save. Nothing is handed over during the
 * lesson — the student opens the session themselves at the scheduled time and
 * works through exactly this list.
 *
 * The picking and ordering is the same job as building a pre-test, so it is
 * the same component; all that is different here is where the list lands.
 */
export function SessionPaper() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()

  const [session, setSession] = useState<Session | null>(null)
  const [picked, setPicked] = useState<string[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const [saved, setSaved] = useState(false)

  const { data, loading: bankLoading } = useBankData(session?.subject ?? 'english')

  const load = useCallback(async () => {
    if (!id) return

    const s = await supabase
      .from('sessions')
      .select('*, student:profiles!sessions_student_id_fkey(id,full_name,display_id)')
      .eq('id', id)
      .maybeSingle()

    if (s.error) {
      setError(s.error.message)
      setLoading(false)
      return
    }
    setSession(row<Session>(s.data))

    const items = await supabase
      .from('session_items')
      .select('*')
      .eq('session_id', id)
      .order('sequence_no')

    if (items.error) setError(items.error.message)
    else setPicked(rows<SessionItem>(items.data).map((i) => i.question_id))

    setLoading(false)
  }, [id])

  useEffect(() => {
    void load()
  }, [load])

  async function save() {
    if (!id) return
    setSaving(true)
    setError(null)
    const { error: err } = await supabase.rpc('set_session_paper', {
      p_session: id,
      p_questions: picked,
    })
    if (err) setError(err.message)
    else {
      setSaved(true)
      setTimeout(() => setSaved(false), 2500)
    }
    setSaving(false)
  }

  if (loading) return <div className="page">Loading…</div>
  if (!session) {
    return (
      <div className="page">
        <div className="card">
          <div className="empty">
            <h3>Session not found</h3>
            <Link className="btn btn-primary" to="/sessions">
              Back to sessions
            </Link>
          </div>
        </div>
      </div>
    )
  }

  // Once the student has opened the session the questions are numbered on
  // their screen, so renumbering underneath is not something the server will
  // accept either.
  const locked = session.status !== 'scheduled'
  const when = new Date(session.scheduled_at)

  return (
    <div className="page page-wide">
      <Link className="back-link" to={`/sessions/${id}`}>
        <IconBack /> Session
      </Link>

      <div className="page-head">
        <div>
          <h1>Build the paper</h1>
          <p className="sub">
            {session.student?.full_name}
            {session.student && <span className="num"> ({session.student.display_id})</span>} ·
            opens{' '}
            {when.toLocaleString(undefined, {
              weekday: 'short',
              day: 'numeric',
              month: 'short',
              hour: 'numeric',
              minute: '2-digit',
            })}
          </p>
        </div>
        <div className="spring" />
        {!locked && (
          <>
            <button
              type="button"
              className="btn btn-primary"
              disabled={saving}
              onClick={() => void save()}
            >
              {saving ? 'Saving…' : `Save ${picked.length} question${picked.length === 1 ? '' : 's'}`}
            </button>
            <button type="button" className="btn" onClick={() => navigate(`/sessions/${id}`)}>
              Done
            </button>
          </>
        )}
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {saved && <Notice kind="ok">Saved. The student sits exactly this paper, in this order.</Notice>}
      {locked && (
        <Notice kind="info">
          This session has already opened, so its paper is fixed — renumbering it now would
          renumber questions the student has answered.
        </Notice>
      )}

      {bankLoading ? (
        <div className="empty">Loading the bank…</div>
      ) : (
        <PaperBuilder
          data={data}
          subject={session.subject}
          picked={picked}
          onChange={setPicked}
          locked={locked}
        />
      )}
    </div>
  )
}
