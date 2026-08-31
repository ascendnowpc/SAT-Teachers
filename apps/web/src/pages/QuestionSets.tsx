import { useCallback, useEffect, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { IconStack } from '../components/icons'
import { Notice } from '../components/ui'
import { subjectLabel } from '../lib/constants'
import { rows, supabase } from '../lib/supabase'
import type { QuestionSet } from '../lib/types'

/**
 * Pre-tests: a paper built once and run with every student after that.
 *
 * The set is the unit of work here, not the session. A teacher assembles the
 * questions, and every session that uses it gets the same paper in the same
 * order — which is what makes two students' reports comparable.
 */
export function QuestionSets() {
  const [params, setParams] = useSearchParams()
  const notice = params.get('saved')

  const [sets, setSets] = useState<QuestionSet[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    const { data, error: err } = await supabase
      .from('question_sets')
      .select('*, question_set_items(count)')
      .order('created_at', { ascending: false })
    if (err) setError(err.message)
    else setSets(rows<QuestionSet>(data))
    setLoading(false)
  }, [])

  useEffect(() => {
    void load()
  }, [load])

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Pre-tests</h1>
          <p className="sub">
            {sets.length} set{sets.length === 1 ? '' : 's'}
          </p>
        </div>
        <div className="spring" />
        <Link className="btn btn-primary" to="/pretests/new">
          Add pre-test
        </Link>
      </div>

      {notice && (
        <Notice kind="ok">
          Pre-test saved.{' '}
          <button
            type="button"
            className="btn btn-ghost btn-sm"
            style={{ marginLeft: 8 }}
            onClick={() => setParams({}, { replace: true })}
          >
            Dismiss
          </button>
        </Notice>
      )}
      {error && <Notice kind="error">{error}</Notice>}

      {loading ? (
        <div className="empty">Loading…</div>
      ) : sets.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No pre-tests yet</h3>
            <p>Build a paper once and run it with every student.</p>
            <Link className="btn btn-primary" to="/pretests/new">
              Add pre-test
            </Link>
          </div>
        </div>
      ) : (
        <div className="set-list">
          {sets.map((s) => (
            <Link key={s.id} className="set-card" to={`/pretests/${s.id}/edit`}>
              <span className="ico">
                <IconStack />
              </span>
              <span className="main">
                <span className="t">{s.title}</span>
                {s.description && <span className="d">{s.description}</span>}
              </span>
              <span className="tags">
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
