import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { DifficultyBadge, Notice } from '../components/ui'
import { LEVELS, SUBJECTS, subjectLabel } from '../lib/constants'
import { rows, supabase } from '../lib/supabase'
import type { Question, QuestionSet, Subject } from '../lib/types'

/**
 * The bank, in the unit a teacher actually asks for it in: the level tests.
 *
 * Easy, medium and hard, each opening as the paper itself in its order — which
 * is how a session runs them. There used to be a second tab holding the flat
 * list of every question, and having both was the confusing part: two lists of
 * the same sixty questions, one of them in an order nothing uses, and no way
 * to tell from the page which one you were meant to be reading. A question is
 * read, edited and added inside the test that holds it.
 *
 * THE COUNTS ARE THE TESTS' OWN. They used to be a separate tally of the
 * questions table by difficulty, which is how the page came to say "21 medium"
 * while the medium test held twenty and nothing anywhere showed the
 * twenty-first: a question saved outside every test counted towards the
 * headline and appeared on no screen. Every number here is now summed from
 * the tests below it, so a number that moves has a row you can open.
 *
 * 0040 made that hard to break — a question is written into a test in one
 * call, or not at all — but "hard" is not "impossible", so anything the bank
 * still holds outside a test is named at the top rather than folded into a
 * total.
 */
export function Questions() {
  const navigate = useNavigate()

  const [tests, setTests] = useState<QuestionSet[]>([])
  const [strays, setStrays] = useState(0)
  const [retired, setRetired] = useState(0)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    setLoading(true)

    // The level tests, which are the only sets a session can run.
    const testRes = await supabase
      .from('question_sets')
      .select('*, question_set_items(count)')
      .not('level', 'is', null)
      .eq('is_active', true)

    if (testRes.error) {
      setError(testRes.error.message)
      setLoading(false)
      return
    }

    const found = rows<QuestionSet>(testRes.data)
    setTests(
      [...found].sort(
        (a, b) =>
          SUBJECTS.findIndex((s) => s.value === a.subject) -
            SUBJECTS.findIndex((s) => s.value === b.subject) ||
          LEVELS.indexOf(a.level ?? 'easy') - LEVELS.indexOf(b.level ?? 'easy'),
      ),
    )

    // Anything the bank holds that none of those tests does. Retired is the
    // deliberate version of that and is counted separately; a stray is the
    // accidental one, and is the fault this page used to hide.
    const [itemRes, qRes] = await Promise.all([
      supabase
        .from('question_set_items')
        .select('question_id')
        .in(
          'set_id',
          found.map((t) => t.id),
        ),
      supabase.from('questions').select('id,status'),
    ])

    if (itemRes.error) setError(itemRes.error.message)
    if (qRes.error) setError(qRes.error.message)

    if (!itemRes.error && !qRes.error) {
      const filed = new Set(
        rows<{ question_id: string }>(itemRes.data).map((i) => i.question_id),
      )
      const all = rows<Pick<Question, 'id' | 'status'>>(qRes.data)
      setRetired(all.filter((q) => q.status === 'retired').length)
      setStrays(all.filter((q) => q.status !== 'retired' && !filed.has(q.id)).length)
    }

    setLoading(false)
  }, [])

  useEffect(() => {
    void load()
  }, [load])

  const size = useCallback((t: QuestionSet) => t.question_set_items?.[0]?.count ?? 0, [])

  // One group per subject, in the order the subject list gives them, and only
  // the subjects that have tests.
  const groups = useMemo(() => {
    const by = new Map<Subject, QuestionSet[]>()
    for (const t of tests) by.set(t.subject, [...(by.get(t.subject) ?? []), t])
    return [...by.entries()].map(([subject, list]) => ({
      subject,
      tests: list,
      questions: list.reduce((n, t) => n + size(t), 0),
    }))
  }, [tests, size])

  const total = useMemo(() => tests.reduce((n, t) => n + size(t), 0), [tests, size])

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Question bank</h1>
          <p className="sub">
            {tests.length} test{tests.length === 1 ? '' : 's'} · {total} question
            {total === 1 ? '' : 's'} in use
            {retired > 0 && ` · ${retired} retired`}
          </p>
        </div>
        <div className="spring" />
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      {strays > 0 && (
        <Notice kind="error">
          {strays} question{strays === 1 ? ' is' : 's are'} in no test and cannot be put in front of
          a student. A question is written inside the test that holds it — open a test below and
          add it there.
        </Notice>
      )}

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
        groups.map((g) => (
          <section className="sess-group" key={g.subject}>
            <div className="sess-group-head">
              <h2>{subjectLabel(g.subject)}</h2>
              <span className="sess-group-count">
                {g.tests.length} test{g.tests.length === 1 ? '' : 's'} · {g.questions} question
                {g.questions === 1 ? '' : 's'}
              </span>
            </div>

            <div className="board">
              <div className="board-scroll">
                <table className="board-table">
                  <thead>
                    <tr>
                      <th>Test</th>
                      <th>Level</th>
                      <th>Questions</th>
                      <th aria-label="Actions" />
                    </tr>
                  </thead>
                  <tbody>
                    {g.tests.map((t) => (
                      <tr
                        key={t.id}
                        className="row-link"
                        onClick={() => navigate(`/tests/${t.id}`)}
                      >
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
                        <td className={size(t) === 0 ? 'num muted-cell' : 'num'}>{size(t)}</td>
                        <td className="row-actions">
                          {/* Adding is only ever from inside a test, so the
                              button carries the test with it. */}
                          <Link
                            className="btn btn-ghost btn-sm"
                            to={`/questions/new?paper=${t.id}`}
                            onClick={(e) => e.stopPropagation()}
                          >
                            Add question
                          </Link>
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
          </section>
        ))
      )}
    </div>
  )
}
