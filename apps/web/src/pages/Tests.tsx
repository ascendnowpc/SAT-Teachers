import { useCallback, useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { IconStack } from '../components/icons'
import { DifficultyBadge, Notice } from '../components/ui'
import { LEVELS, subjectLabel } from '../lib/constants'
import { rows, supabase } from '../lib/supabase'
import type { QuestionSet } from '../lib/types'

/**
 * The three tests.
 *
 * English is easy, medium and hard, and that is the whole of it — there is no
 * fourth test to build and no paper to assemble for a particular student. A
 * session opens on the easy one and the teacher moves the student up or down
 * while it runs, so what a teacher wants from this screen is to read what is
 * in each level before they send anyone to it.
 *
 * They are ordered easy → hard rather than by when they were made, because
 * that is the order they are climbed in.
 */
export function Tests() {
  const [sets, setSets] = useState<QuestionSet[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    const { data, error: err } = await supabase
      .from('question_sets')
      .select('*, question_set_items(count)')
      .not('level', 'is', null)
      .eq('is_active', true)
    if (err) setError(err.message)
    else {
      const found = rows<QuestionSet>(data)
      setSets(
        [...found].sort(
          (a, b) => LEVELS.indexOf(a.level ?? 'easy') - LEVELS.indexOf(b.level ?? 'easy'),
        ),
      )
    }
    setLoading(false)
  }, [])

  useEffect(() => {
    void load()
  }, [load])

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Tests</h1>
          <p className="sub">
            Three levels. A session starts on easy and moves with the student.
          </p>
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      {loading ? (
        <div className="empty">Loading…</div>
      ) : sets.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No tests loaded</h3>
            <p>
              The three English tests come in with the bank. If none are here the content
              migrations have not been run against this database.
            </p>
          </div>
        </div>
      ) : (
        <div className="set-list">
          {sets.map((s) => (
            <Link key={s.id} className="set-card" to={`/tests/${s.id}`}>
              <span className="ico">
                <IconStack />
              </span>
              <span className="main">
                <span className="t">{s.title}</span>
                {s.description && <span className="d">{s.description}</span>}
              </span>
              <span className="tags">
                {s.level && <DifficultyBadge level={s.level} />}
                <span className="badge badge-neutral">{subjectLabel(s.subject)}</span>
                <span className="badge badge-sky">
                  {s.question_set_items?.[0]?.count ?? 0} questions
                </span>
              </span>
            </Link>
          ))}
        </div>
      )}
    </div>
  )
}
