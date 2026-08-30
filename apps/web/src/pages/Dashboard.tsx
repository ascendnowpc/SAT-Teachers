import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { supabase } from '../lib/supabase'
import type { Difficulty } from '../lib/types'

export function Dashboard() {
  const { profile, isTeacher } = useAuth()
  const [counts, setCounts] = useState<Record<Difficulty, number> | null>(null)

  useEffect(() => {
    if (!isTeacher) return
    let active = true
    void supabase
      .from('questions')
      .select('difficulty')
      .then(({ data }) => {
        if (!active || !data) return
        const next: Record<Difficulty, number> = { easy: 0, medium: 0, hard: 0 }
        for (const row of data as { difficulty: Difficulty }[]) next[row.difficulty] += 1
        setCounts(next)
      })
    return () => {
      active = false
    }
  }, [isTeacher])

  if (!profile) return null

  const total = counts ? counts.easy + counts.medium + counts.hard : null
  const firstName = profile.full_name.trim().split(/\s+/)[0] || 'there'

  return (
    <>
      <div className="page-head">
        <div>
          <h1>Welcome back, {firstName}.</h1>
          <p className="sub">
            <span className="badge badge-role">{profile.role}</span>{' '}
            <span style={{ marginLeft: 6 }}>Your ID is {profile.display_id}</span>
          </p>
        </div>
      </div>

      {isTeacher ? (
        <>
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

          <div className="card card-pad">
            <div className="section-title">Next</div>
            <h3 style={{ fontSize: 17, marginBottom: 6 }}>Build out the question bank</h3>
            <p style={{ color: 'var(--muted)', fontSize: 14.5, fontWeight: 300, marginBottom: 16, maxWidth: '54ch' }}>
              Add multiple-choice questions and set a difficulty for each. Live sessions will
              publish them one at a time to a student.
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
        </>
      ) : (
        <div className="card card-pad">
          <div className="section-title">Student</div>
          <h3 style={{ fontSize: 17, marginBottom: 6 }}>No sessions yet</h3>
          <p style={{ color: 'var(--muted)', fontSize: 14.5, fontWeight: 300, maxWidth: '54ch' }}>
            When a teacher starts a session with you, the questions they publish will appear here,
            one at a time. Give them your ID: <strong>{profile.display_id}</strong>.
          </p>
        </div>
      )}
    </>
  )
}
