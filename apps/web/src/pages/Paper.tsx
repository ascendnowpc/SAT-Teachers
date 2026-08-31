import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useParams } from 'react-router-dom'
import { DifficultyBadge, Notice, Passage } from '../components/ui'
import { IconBack } from '../components/icons'
import { OPTION_LABELS, sectionLabel, skillLabel, subjectLabel } from '../lib/constants'
import { buildPaper, type PaperGroup } from '../lib/paper'
import { row, rows, supabase } from '../lib/supabase'
import type { Question, QuestionSet } from '../lib/types'

/**
 * One paper, printed.
 *
 * The Questions tab lists the papers; this is what opening one shows — the
 * source document itself, in its own order and its own numbering, with the
 * directions at the top and each passage set once above the questions that
 * hang off it. A teacher reading it here should be reading the same page the
 * student is sitting, which is why the choices are the plain A)–D) run of the
 * paper rather than the bank's cards.
 *
 * The one thing the paper does not print is the answer, so that is a toggle
 * and it starts off. A key on screen while a teacher is talking a student
 * through a question is a key read out by accident.
 */
export function Paper() {
  const { id } = useParams<{ id: string }>()

  const [set, setSet] = useState<QuestionSet | null>(null)
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [showKey, setShowKey] = useState(false)

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
            <h3>Paper not found</h3>
            <Link className="btn btn-primary" to="/questions">
              Back to the question bank
            </Link>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="page">
      <div className="page-head paper-head">
        <Link className="paper-back" to="/questions" aria-label="Back to the question bank">
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
          className={showKey ? 'btn btn-primary' : 'btn'}
          onClick={() => setShowKey((v) => !v)}
          aria-pressed={showKey}
        >
          {showKey ? 'Hide answers' : 'Show answers'}
        </button>
        <button type="button" className="btn" onClick={() => window.print()}>
          Print
        </button>
      </div>

      <article className="paper">
        <header className="paper-title">
          <h2>{set.title}</h2>
          {set.instructions && <p className="paper-directions">{set.instructions}</p>}
        </header>

        {groups.length === 0 ? (
          <div className="empty">
            <h3>Nothing in this paper yet</h3>
            <p>Add questions to it from the pre-test editor.</p>
          </div>
        ) : (
          groups.map((g) => <Group key={g.key} group={g} showKey={showKey} />)
        )}
      </article>
    </div>
  )
}

/**
 * A passage and its questions. A stimulus carrying several questions is set
 * once under its heading; a stimulus belonging to one question sits inside
 * that question, above the stem, exactly as the paper sets it.
 */
function Group({ group, showKey }: { group: PaperGroup; showKey: boolean }) {
  const shared = group.label !== null

  return (
    <section className="paper-group">
      {shared && group.passage && (
        <>
          <h3 className="paper-passage-label">{group.label}</h3>
          <Passage body={group.passage} underline={group.underline} className="paper-passage" />
        </>
      )}

      {group.questions.map(({ question, number }) => (
        <div className="paper-q" key={question.id}>
          <div className="paper-q-body">
            <span className="paper-n">{number}.</span>
            <div className="paper-q-main">
              {!shared && group.passage && (
                <Passage
                  body={group.passage}
                  underline={group.underline}
                  className="paper-passage inline"
                />
              )}
              <p className="paper-stem">{question.stem}</p>
              <Choices question={question} showKey={showKey} />
              {showKey && <Key question={question} />}
            </div>
          </div>
        </div>
      ))}
    </section>
  )
}

function Choices({ question, showKey }: { question: Question; showKey: boolean }) {
  const correct = question.question_keys?.correct_option
  const options = [...question.question_options].sort(
    (a, b) => OPTION_LABELS.indexOf(a.label) - OPTION_LABELS.indexOf(b.label),
  )

  return (
    <ol className="paper-choices">
      {options.map((o) => (
        <li key={o.id} className={showKey && o.label === correct ? 'is-key' : undefined}>
          <span className="lab">{o.label})</span>
          <span className="body">{o.body}</span>
        </li>
      ))}
    </ol>
  )
}

/** Everything the paper itself does not carry: the key, the level, the filing. */
function Key({ question: q }: { question: Question }) {
  return (
    <div className="paper-key">
      <div className="paper-key-head">
        <span className="ans">Answer {q.question_keys?.correct_option ?? '—'}</span>
        <DifficultyBadge level={q.difficulty} />
        {q.section && <span className="badge badge-neutral">{sectionLabel(q.section)}</span>}
        {q.skill && <span className="badge badge-sky">{skillLabel(q.skill)}</span>}
      </div>
      {q.question_keys?.explanation && <p>{q.question_keys.explanation}</p>}
    </div>
  )
}
