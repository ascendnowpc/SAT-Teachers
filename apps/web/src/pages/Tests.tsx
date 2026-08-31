import { useCallback, useEffect, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { IconStack } from '../components/icons'
import { Notice } from '../components/ui'
import { subjectLabel } from '../lib/constants'
import { rows, supabase } from '../lib/supabase'
import type { QuestionSet } from '../lib/types'

/**
 * A test: questions taken from the bank, in an order, saved to be used again.
 *
 * The test is the unit of work here, not the session. A teacher assembles it
 * once and every session that uses it gets the same questions in the same
 * order — which is what makes two students' reports comparable.
 *
 * Only tests a teacher built are listed. The bank's own source papers are
 * filed under Questions, where they came from; they are not something anybody
 * here assembled.
 */
export function Tests() {
  const [params, setParams] = useSearchParams()
  const notice = params.get('saved')

  const [sets, setSets] = useState<QuestionSet[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    const { data, error: err } = await supabase
      .from('question_sets')
      .select('*, question_set_items(count)')
      .is('source_ref', null)
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
          <h1>Tests</h1>
          <p className="sub">
            {sets.length} test{sets.length === 1 ? '' : 's'}
          </p>
        </div>
        <div className="spring" />
        <Link className="btn btn-primary" to="/tests/new">
          New test
        </Link>
      </div>

      {notice && (
        <Notice kind="ok">
          Test saved.{' '}
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
            <h3>No tests yet</h3>
            <p>Build one once and use it with every student.</p>
            <Link className="btn btn-primary" to="/tests/new">
              New test
            </Link>
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
