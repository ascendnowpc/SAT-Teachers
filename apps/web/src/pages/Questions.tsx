import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { DifficultyBadge, Notice } from '../components/ui'
import { LEVELS, SUBJECTS } from '../lib/constants'
import { rows, supabase } from '../lib/supabase'
import type { Question, QuestionSet } from '../lib/types'

/**
 * The bank, in the unit a teacher actually asks for it in: the three tests.
 *
 * Easy, medium and hard, each opening as the paper itself in its order — which
 * is how a session runs them. There used to be a second tab holding the flat
 * list of every question, and having both was the confusing part: two lists of
 * the same sixty questions, one of them in an order nothing uses, and no way
 * to tell from the page which one you were meant to be reading. A question is
 * read, edited and added inside the test that holds it.
 *
 * The headline still counts the bank underneath, retired named separately
 * rather than folded in — the in-class 25Q diagnostic and anything else in
 * none of the three tests is retired (0029) and cannot be put in front of a
 * student, so adding it to the total is what made 86 look like stock.
 */
export function Questions() {
  const [params, setParams] = useSearchParams()
  const navigate = useNavigate()
  const justAdded = params.get('added')

  const [tests, setTests] = useState<QuestionSet[]>([])
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    setLoading(true)

    const [qRes, pRes] = await Promise.all([
      // Only for the count in the headline; the questions themselves are read
      // inside their test.
      supabase.from('questions').select('id,status,difficulty'),
      // The three level tests, which are the only sets a session can run.
      supabase
        .from('question_sets')
        .select('*, question_set_items(count)')
        .not('level', 'is', null)
        .eq('is_active', true),
    ])

    if (qRes.error) setError(qRes.error.message)
    else setQuestions(rows<Question>(qRes.data))

    if (pRes.error) setError(pRes.error.message)
    else {
      const found = rows<QuestionSet>(pRes.data)
      setTests(
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

  // The headline counts the bank a session can draw on. What is retired is
  // named separately rather than folded in, because the two are not the same
  // kind of thing and adding them together is what made 86 look like stock.
  const counts = useMemo(() => {
    const by = { easy: 0, medium: 0, hard: 0, live: 0, retired: 0 }
    for (const q of questions) {
      if (q.status === 'retired') {
        by.retired += 1
        continue
      }
      by[q.difficulty] += 1
      by.live += 1
    }
    return by
  }, [questions])

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Question bank</h1>
          <p className="sub">
            {tests.length} test{tests.length === 1 ? '' : 's'} · {counts.live} question
            {counts.live === 1 ? '' : 's'} in use · {counts.easy} easy · {counts.medium} medium ·{' '}
            {counts.hard} hard
            {counts.retired > 0 && ` · ${counts.retired} retired`}
          </p>
        </div>
        <div className="spring" />
        <Link className="btn btn-primary" to="/questions/new">
          Add question
        </Link>
      </div>

      {justAdded && (
        <Notice kind="ok">
          Question saved. Open the test it belongs to to read it.{' '}
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
      ) : tests.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No tests loaded</h3>
            <p>The content migrations have not been run against this database.</p>
          </div>
        </div>
      ) : (
        <div className="board">
          <div className="board-scroll">
            <table className="board-table">
              <thead>
                <tr>
                  <th>Test</th>
                  <th>Level</th>
                  <th>Subject</th>
                  <th>Questions</th>
                  <th aria-label="Actions" />
                </tr>
              </thead>
              <tbody>
                {tests.map((t) => (
                  <tr key={t.id} className="row-link" onClick={() => navigate(`/tests/${t.id}`)}>
                    <td>
                      <Link
                        className="cell-link cell-strong"
                        to={`/tests/${t.id}`}
                        onClick={(e) => e.stopPropagation()}
                      >
                        {t.title}
                      </Link>
                    </td>
                    <td>{t.level && <DifficultyBadge level={t.level} />}</td>
                    <td>{SUBJECTS.find((x) => x.value === t.subject)?.label ?? t.subject}</td>
                    <td className="num">{t.question_set_items?.[0]?.count ?? 0}</td>
                    <td className="row-actions">
                      <Link
                        className="btn btn-ghost btn-sm"
                        to={`/tests/${t.id}`}
                        onClick={(e) => e.stopPropagation()}
                      >
                        Open
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  )
}
