import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { SessionCard } from '../components/SessionCard'
import { useAuth } from '../context/AuthContext'
import { rows, supabase } from '../lib/supabase'
import type { Difficulty, Session } from '../lib/types'


const SESSION_SELECT =
  '*, teacher:profiles!sessions_teacher_id_fkey(id,full_name,display_id),' +
  ' student:profiles!sessions_student_id_fkey(id,full_name,display_id,pc)'

export function Dashboard() {
  const { profile, isTeacher } = useAuth()
  const [counts, setCounts] = useState<Record<Difficulty, number> | null>(null)
  const [next, setNext] = useState<Session[]>([])

  useEffect(() => {
    let active = true

    void supabase
      .from('sessions')
      .select(SESSION_SELECT)
      .in('status', ['scheduled', 'live'])
      .order('scheduled_at')
      .limit(3)
      .then(({ data }) => {
        if (active && data) setNext(rows<Session>(data))
      })

    if (isTeacher) {
      // Only what a session can actually ask, counted where it can be asked
      // from: the level tests. This used to tally the questions table by
      // difficulty, which counts a question saved outside every test — and
      // that is how the bank came to report a twenty-first medium question
      // that no screen in the product would show. A number nothing can open
      // is worse than no number.
      void supabase
        .from('question_sets')
        .select('level, question_set_items(count)')
        .not('level', 'is', null)
        .eq('is_active', true)
        .then(({ data }) => {
          if (!active || !data) return
          const tally: Record<Difficulty, number> = { easy: 0, medium: 0, hard: 0 }
          for (const t of data as { level: Difficulty; question_set_items: { count: number }[] }[]) {
            tally[t.level] += t.question_set_items?.[0]?.count ?? 0
          }
          setCounts(tally)
        })
    }

    return () => {
      active = false
    }
  }, [isTeacher])

  if (!profile) return null

  const total = counts ? counts.easy + counts.medium + counts.hard : null
  const firstName = profile.full_name.trim().split(/\s+/)[0] || 'there'

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Welcome back, {firstName}.</h1>
          <p className="sub">
            <span className="badge badge-role">{profile.role}</span>
            <span style={{ marginLeft: 8 }}>
              Your ID is <strong className="num">{profile.display_id}</strong>
            </span>
          </p>
        </div>
      </div>

      {isTeacher && (
        <div className="stats">
          <div className="stat">
            <div className="k">Questions</div>
            <div className="v">{total ?? '—'}</div>
          </div>
          <div className="stat">
            <div className="k">Easy</div>
            <div className="v">{counts?.easy ?? '—'}</div>
          </div>
          <div className="stat">
            <div className="k">Medium</div>
            <div className="v">{counts?.medium ?? '—'}</div>
          </div>
          <div className="stat">
            <div className="k">Hard</div>
            <div className="v">{counts?.hard ?? '—'}</div>
          </div>
        </div>
      )}

      <div className="section-title">Coming up</div>
      {next.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No sessions scheduled</h3>
            <p>
              {isTeacher
                ? 'Create a session with a student and send them the link — they need no account to open it.'
                : `Nothing booked yet. Give your teacher your ID — ${profile.display_id} — so they can schedule one.`}
            </p>
            {isTeacher && (
              <Link className="btn btn-primary" to="/sessions/new">
                New session
              </Link>
            )}
          </div>
        </div>
      ) : (
        <div className="sess-list" style={{ marginBottom: 26 }}>
          {next.map((s) => (
            <SessionCard key={s.id} session={s} isTeacher={isTeacher} />
          ))}
        </div>
      )}

      {isTeacher && (
        <div className="card card-pad">
          <div className="section-title">Question bank</div>
          <h3 style={{ fontSize: 16.5, marginBottom: 6 }}>Keep the bank ahead of your sessions</h3>
          <p
            style={{
              color: 'var(--muted)',
              fontSize: 14.5,
              fontWeight: 300,
              marginBottom: 16,
              maxWidth: '54ch',
            }}
          >
            Every question lives in one of the level tests, and its level is that test's — so the
            numbers above are the papers your students actually sit.
          </p>
          <div style={{ display: 'flex', gap: 10, flexWrap: 'wrap' }}>
            <Link className="btn btn-primary" to="/questions/new">
              Add question
            </Link>
            <Link className="btn btn-ghost" to="/questions">
              Browse bank
            </Link>
          </div>
        </div>
      )}
    </div>
  )
}
