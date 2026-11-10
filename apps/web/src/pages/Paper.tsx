import { useCallback, useDeferredValue, useEffect, useMemo, useState } from 'react'
import { Link, useLocation, useParams, useSearchParams } from 'react-router-dom'
import { Explanation, LevelReason } from '../components/Explanation'
import { PaperFilterBar } from '../components/PaperFilterBar'
import { DifficultyBadge, Notice } from '../components/ui'
import { QuestionView } from '../components/QuestionView'
import { IconBack } from '../components/icons'
import { sectionLabel, subjectLabel } from '../lib/constants'
import { buildPaper, type PaperGroup } from '../lib/paper'
import {
  NO_PAPER_FILTERS,
  countLabel,
  describeFilters,
  facetOptions,
  filtersFromParams,
  isNarrowed,
  matches,
  paramsOf,
  searchText,
  skillName,
  type PaperFilters,
} from '../lib/paperFilter'
import { allRows } from '../lib/allRows'
import { row, supabase } from '../lib/supabase'
import type { Question, QuestionSet } from '../lib/types'

/**
 * One test, read.
 *
 * Each question is drawn the way the student meets it, stimulus and all, so a
 * teacher reading a level is reading the screen their student will sit — which
 * is the point of reading it before moving anybody onto it.
 *
 * The answers are marked on it — the correct choice ticked where it stands,
 * the way a worked paper is marked — because that is what a teacher reads a
 * paper for. Hiding them is one click, for going through a question with a
 * student watching. Under each one, why the item sits at this level: the
 * sentence the teachers wrote about what makes it easy, medium or hard.
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

    // Read whole, a page at a time: a practice pool holds more questions than
    // PostgREST hands back in one answer, and opened as one it used to show
    // its first thousand as though they were all of it. Position is unique
    // within a set, so it orders the pages.
    const [setRes, itemRes] = await Promise.all([
      supabase.from('question_sets').select('*').eq('id', id).maybeSingle(),
      allRows<{ position: number; questions: Question | null }>((from, to) =>
        supabase
          .from('question_set_items')
          .select('position, questions(*, question_options(*), question_keys(*))', {
            count: 'exact',
          })
          .eq('set_id', id)
          .order('position')
          .range(from, to),
      ),
    ])

    if (setRes.error) setError(setRes.error.message)
    else setSet(row<QuestionSet>(setRes.data))

    if (itemRes.error) setError(itemRes.error)
    else {
      setQuestions(
        itemRes.rows.map((i) => i.questions).filter((q): q is Question => q !== null),
      )
    }

    setLoading(false)
  }, [id])

  useEffect(() => {
    void load()
  }, [load])

  // Numbered from the whole test, so a question keeps its number however the
  // test is narrowed: "question 10" is the same question filtered or not.
  const groups = useMemo(() => buildPaper(questions), [questions])

  // The filters live in the address (lib/paperFilter), so a narrowed test
  // survives a reload, comes back after Edit, and can be sent to a colleague.
  const [params, setParams] = useSearchParams()
  const filters = useMemo(() => filtersFromParams(params), [params])
  // The list redraws behind the typing rather than holding it up: a pool is
  // nearly two thousand questions.
  const deferred = useDeferredValue(filters)
  const haystacks = useMemo(() => questions.map(searchText), [questions])
  const haystackOf = useMemo(
    () => new Map(questions.map((q, i) => [q.id, haystacks[i]])),
    [questions, haystacks],
  )
  const options = useMemo(
    () => facetOptions(questions, haystacks, deferred),
    [questions, haystacks, deferred],
  )
  const narrowed = isNarrowed(deferred)
  const shownGroups = useMemo(() => {
    if (!narrowed) return groups
    return groups
      .map((g) => ({
        ...g,
        questions: g.questions.filter((pq) =>
          matches(pq.question, deferred, haystackOf.get(pq.question.id) ?? ''),
        ),
      }))
      .filter((g) => g.questions.length > 0)
  }, [groups, deferred, narrowed, haystackOf])
  const shownCount = shownGroups.reduce((n, g) => n + g.questions.length, 0)

  function setFilter<K extends keyof PaperFilters>(key: K, value: PaperFilters[K]) {
    const next: PaperFilters = { ...filters, [key]: value }
    // A skill from another section would leave nothing; the section wins.
    if (key === 'section' && value && next.skill) {
      const fits = questions.some((q) => q.skill === next.skill && q.section === value)
      if (!fits) next.skill = ''
    }
    setParams(paramsOf(next), { replace: true })
  }

  function clearFilters() {
    setParams(paramsOf(NO_PAPER_FILTERS), { replace: true })
  }

  // Only a live level test can be written into (0040), so only a live level
  // test offers it. The deactivated source papers are archives: a button here
  // would open a form that refuses.
  // …and the subject's practice pool (0060), written into the same way.
  const writable = Boolean(set?.is_active && (set.level || set.kind === 'practice'))

  if (loading) return <div className="page page-loading">Loading…</div>
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
        <Link className="paper-back" to="/questions" aria-label="Back to the question bank">
          <IconBack />
        </Link>
        <div>
          <h1>{set.title}</h1>
          <p className="sub">
            {countLabel(questions.length)} question{questions.length === 1 ? '' : 's'} ·{' '}
            {subjectLabel(set.subject)}
            {set.level ? ` · ${set.level} level` : ''}
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
        {writable && (
          <Link className="btn btn-primary" to={`/questions/new?paper=${id}`}>
            Add question
          </Link>
        )}
      </div>

      {questions.length > 0 && (
        <PaperFilterBar
          filters={filters}
          options={options}
          shown={shownCount}
          total={questions.length}
          onChange={setFilter}
          onClear={clearFilters}
        />
      )}

      <article className="paper">
        <header className="paper-title">
          <h2>{set.title}</h2>
          {/* On paper the filter row is gone, so the copy says what it was narrowed to. */}
          {narrowed && (
            <p className="paper-filtered">
              {describeFilters(deferred)} — {countLabel(shownCount)} of {countLabel(questions.length)}{' '}
              questions
            </p>
          )}
          {set.instructions && <p className="paper-directions">{set.instructions}</p>}
        </header>

        {groups.length === 0 ? (
          <div className="empty">
            <h3>Nothing in this test yet</h3>
            {writable && (
              <Link className="btn btn-primary" to={`/questions/new?paper=${id}`}>
                Write the first question
              </Link>
            )}
          </div>
        ) : shownGroups.length === 0 ? (
          <div className="empty">
            <h3>No question fits these filters</h3>
            <p>Widen them, or clear them to see the whole test.</p>
            <button type="button" className="btn" onClick={clearFilters}>
              Clear filters
            </button>
          </div>
        ) : (
          shownGroups.map((g) => <Group key={g.key} group={g} showKey={showKey} />)
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
  // Where Edit should come back to: this test, narrowed as it is now.
  const location = useLocation()
  const back = `${location.pathname}${location.search}`

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
              <Link
                className="btn btn-ghost btn-sm"
                to={`/questions/${question.id}/edit`}
                state={{ back }}
              >
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
                  <span className="badge badge-sky">{skillName(question.skill)}</span>
                )}
              </>
            }
            footer={
              showKey && (
                <>
                  <Explanation
                    text={question.question_keys?.explanation}
                    math={question.subject === 'mathematics'}
                  />
                  <LevelReason text={question.difficulty_rationale} level={question.difficulty} />
                </>
              )
            }
          />
        </article>
      ))}
    </section>
  )
}
