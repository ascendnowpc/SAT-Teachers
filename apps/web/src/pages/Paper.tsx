import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { DifficultyBadge, Notice } from '../components/ui'
import { QuestionView } from '../components/QuestionView'
import { IconBack } from '../components/icons'
import { sectionLabel, skillLabel, subjectLabel } from '../lib/constants'
import { buildPaper, type PaperGroup } from '../lib/paper'
import { row, rows, supabase } from '../lib/supabase'
import type { Question, QuestionSet } from '../lib/types'

/**
 * One paper, read.
 *
 * Two things open here and they are the same object: a source paper from the
 * bank, and a test a teacher assembled. The only difference is where Back
 * goes, and that a test can be edited — which is why opening a test lands
 * here rather than in the builder. You read it first; you edit it if you meant
 * to.
 *
 * Each question is drawn the way the student meets it, stimulus and all, so a
 * teacher reading a paper is reading the screen their student will sit.
 *
 * The answers are marked on it — the correct choice ticked where it stands,
 * the way a worked paper is marked — because that is what a teacher reads a
 * paper for. Hiding them is one click, for going through a question with a
 * student watching.
 */
export function Paper() {
  const { id } = useParams<{ id: string }>()

  const [set, setSet] = useState<QuestionSet | null>(null)
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  // Marked by default: a teacher opening a paper is reading it against the
  // key, not sitting it. The toggle is there for the times they want it blank
  // — going through a question with a student on a shared screen.
  const [showKey, setShowKey] = useState(true)

  const load = useCallback(async () => {
    if (!id) return
    setLoading(true)

    const [setRes, itemRes] = await Promise.all([
      supabase.from('question_sets').select('*').eq('id', id).maybeSingle(),
      supabase
        .from('question_set_items')
        .select('position, questions(*, question_options(*), question_keys(*))')
        .eq('set_id', id)
        .order('position'),
    ])

    if (setRes.error) setError(setRes.error.message)
    else setSet(row<QuestionSet>(setRes.data))

    if (itemRes.error) setError(itemRes.error.message)
    else {
      const items = rows<{ position: number; questions: Question | null }>(itemRes.data)
      setQuestions(items.map((i) => i.questions).filter((q): q is Question => q !== null))
    }

    setLoading(false)
  }, [id])

  useEffect(() => {
    void load()
  }, [load])

  const groups = useMemo(() => buildPaper(questions), [questions])
  const isTest = set?.kind === 'test'
  // A paper the teacher made is one they can write into; a source paper is a
  // record of a document and gains nothing by being added to.
  const isOwnPaper = set?.kind === 'paper' && set.source_ref === null

  if (loading) return <div className="page">Loading…</div>
  if (error) {
    return (
      <div className="page">
        <Notice kind="error">{error}</Notice>
      </div>
    )
  }
  if (!set) {
    return (
      <div className="page">
        <div className="card">
          <div className="empty">
            <h3>Not found</h3>
            <Link className="btn btn-primary" to="/questions">
              Back to the question bank
            </Link>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="page page-wide">
      <div className="page-head paper-head">
        <Link
          className="paper-back"
          to={isTest ? '/tests' : '/questions'}
          aria-label={isTest ? 'Back to tests' : 'Back to the question bank'}
        >
          <IconBack />
        </Link>
        <div>
          <h1>{set.title}</h1>
          <p className="sub">
            {questions.length} question{questions.length === 1 ? '' : 's'} ·{' '}
            {subjectLabel(set.subject)}
            {set.source_ref ? ` · ${set.source_ref}` : ''}
          </p>
        </div>
        <div className="spring" />
        <button
          type="button"
          className="btn"
          onClick={() => setShowKey((v) => !v)}
          aria-pressed={showKey}
        >
          {showKey ? 'Hide answers' : 'Show answers'}
        </button>
        <button type="button" className="btn" onClick={() => window.print()}>
          Print
        </button>
        {isTest && (
          <Link className="btn btn-primary" to={`/tests/${id}/edit`}>
            Edit
          </Link>
        )}
        {isOwnPaper && (
          <Link className="btn btn-primary" to={`/questions/new?paper=${id}`}>
            Add question
          </Link>
        )}
      </div>

      <article className="paper">
        <header className="paper-title">
          <h2>{set.title}</h2>
          {set.instructions && <p className="paper-directions">{set.instructions}</p>}
        </header>

        {groups.length === 0 ? (
          <div className="empty">
            <h3>Nothing in this paper yet</h3>
            {isOwnPaper ? (
              <Link className="btn btn-primary" to={`/questions/new?paper=${id}`}>
                Write the first question
              </Link>
            ) : (
              <p>{isTest ? 'Edit it to add questions.' : 'This paper loaded empty.'}</p>
            )}
          </div>
        ) : (
          groups.map((g) => <Group key={g.key} group={g} showKey={showKey} />)
        )}
      </article>
    </div>
  )
}

/**
 * A passage and its questions, each in the shape the student meets it.
 *
 * The passage repeats down the left of every question that shares it rather
 * than being set once above them. That is a page of repetition on a paper
 * where five questions share a stimulus — and it is what the teachers asked
 * for, because it is what they will be looking at question by question when
 * they go through it.
 */
function Group({ group, showKey }: { group: PaperGroup; showKey: boolean }) {
  return (
    <section className="paper-group">
      {group.label && <h3 className="paper-passage-label">{group.label}</h3>}

      {group.questions.map(({ question, number }) => (
        <article className="paper-q" key={question.id}>
          <QuestionView
            question={question}
            number={number}
            showKey={showKey}
            header={
              <Link className="btn btn-ghost btn-sm" to={`/questions/${question.id}/edit`}>
                Edit
              </Link>
            }
            tags={
              <>
                <DifficultyBadge level={question.difficulty} />
                {question.section && (
                  <span className="badge badge-neutral">{sectionLabel(question.section)}</span>
                )}
                {question.skill && (
                  <span className="badge badge-sky">{skillLabel(question.skill)}</span>
                )}
              </>
            }
            footer={
              showKey && (
                <>
                  {question.question_keys?.explanation && (
                    <div className="q-note">
                      <div className="section-title">Explanation</div>
                      {question.question_keys.explanation}
                    </div>
                  )}
                  {question.difficulty_rationale && (
                    <div className="q-note">
                      <div className="section-title">Why {question.difficulty}</div>
                      {question.difficulty_rationale}
                    </div>
                  )}
                </>
              )
            }
          />
        </article>
      ))}
    </section>
  )
}
