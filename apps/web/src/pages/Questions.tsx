import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { DifficultyBadge, Input, Notice, Select } from '../components/ui'
import { QuestionView } from '../components/QuestionView'
import { IconChevron, IconStack } from '../components/icons'
import {
  DIFFICULTIES,
  LEVELS,
  SECTIONS,
  SUBJECTS,
  sectionLabel,
  skillLabel,
  skillsFor,
} from '../lib/constants'
import { rows, supabase } from '../lib/supabase'
import type { Difficulty, Question, QuestionSet, Subject } from '../lib/types'

/**
 * The bank, in the two units a teacher actually asks for it in.
 *
 * *Tests* is the default and the one a session runs: easy, medium and hard,
 * each opening as the paper itself in its order. *All questions* is the flat
 * bank underneath, which is the right unit only when hunting one item by skill
 * or level, or when writing a new one.
 *
 * The bank still holds items that are in none of the three — the in-class 25Q
 * diagnostic among them — and they are here under All questions. What they are
 * not is runnable: a session is a level, and there are three. 0029 marked them
 * retired for exactly that reason, so this list shows what is in use by default
 * and keeps them one dropdown away rather than mixed in with the sixty.
 */
export function Questions() {
  const [params, setParams] = useSearchParams()
  const justAdded = params.get('added')

  const [view, setView] = useState<'tests' | 'questions'>(justAdded ? 'questions' : 'tests')
  const [tests, setTests] = useState<QuestionSet[]>([])
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const [subject, setSubject] = useState<Subject | ''>('')
  const [section, setSection] = useState('')
  const [skill, setSkill] = useState('')
  const [difficulty, setDifficulty] = useState<Difficulty | ''>('')
  // In use unless asked otherwise: a retired question cannot be put in front of
  // a student, so it is not what a teacher is looking at the bank to find.
  const [status, setStatus] = useState<'published' | 'retired' | ''>('published')
  const [search, setSearch] = useState('')

  const load = useCallback(async () => {
    setLoading(true)

    const [qRes, pRes] = await Promise.all([
      supabase
        .from('questions')
        .select('*, question_options(*), question_keys(*)')
        .order('created_at', { ascending: false }),
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

  const sectionChoices = subject ? SECTIONS[subject] : [...SECTIONS.english, ...SECTIONS.mathematics]
  const skillChoices = skillsFor(section || null)

  const visible = useMemo(() => {
    const needle = search.trim().toLowerCase()
    return questions.filter((q) => {
      if (status && q.status !== status) return false
      if (subject && q.subject !== subject) return false
      if (section && q.section !== section) return false
      if (skill && q.skill !== skill) return false
      if (difficulty && q.difficulty !== difficulty) return false
      if (needle) {
        const hay = `${q.stem} ${q.passage ?? ''} ${q.question_options.map((o) => o.body).join(' ')}`
        if (!hay.toLowerCase().includes(needle)) return false
      }
      return true
    })
  }, [questions, status, subject, section, skill, difficulty, search])

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
          Question saved.{' '}
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

      <div className="tabs" role="tablist" aria-label="How to look at the bank">
        <button
          type="button"
          role="tab"
          aria-selected={view === 'tests'}
          className={`tab ${view === 'tests' ? 'on' : ''}`}
          onClick={() => setView('tests')}
        >
          Tests
        </button>
        <button
          type="button"
          role="tab"
          aria-selected={view === 'questions'}
          className={`tab ${view === 'questions' ? 'on' : ''}`}
          onClick={() => setView('questions')}
        >
          All questions
        </button>
      </div>

      {view === 'tests' ? (
        loading ? (
          <div className="empty">Loading…</div>
        ) : tests.length === 0 ? (
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
            {tests.map((p) => (
              <Link key={p.id} className="set-card" to={`/tests/${p.id}`}>
                <span className="ico">
                  <IconStack />
                </span>
                <span className="main">
                  <span className="t">{p.title}</span>
                  {p.description && <span className="d">{p.description}</span>}
                </span>
                <span className="tags">
                  {p.level && <DifficultyBadge level={p.level} />}
                  <span className="badge badge-neutral">
                    {SUBJECTS.find((s) => s.value === p.subject)?.label ?? p.subject}
                  </span>
                  <span className="badge badge-sky">
                    {p.question_set_items?.[0]?.count ?? 0} questions
                  </span>
                </span>
              </Link>
            ))}
          </div>
        )
      ) : (
        <>
        <div className="toolbar">
          <div className="grow">
            <Input
              type="search"
              placeholder="Search questions…"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>
          <Select
            value={subject}
            aria-label="Filter by subject"
            onChange={(e) => {
              setSubject(e.target.value as Subject | '')
              setSection('')
            }}
          >
            <option value="">All subjects</option>
            {SUBJECTS.map((s) => (
              <option key={s.value} value={s.value}>
                {s.label}
              </option>
            ))}
          </Select>
          <Select
            value={section}
            aria-label="Filter by section"
            onChange={(e) => {
              setSection(e.target.value)
              setSkill('')
            }}
          >
            <option value="">All sections</option>
            {sectionChoices.map((d) => (
              <option key={d.value} value={d.value}>
                {d.label}
              </option>
            ))}
          </Select>
          <Select value={skill} aria-label="Filter by skill" onChange={(e) => setSkill(e.target.value)}>
            <option value="">All skills</option>
            {skillChoices.map((s) => (
              <option key={s.value} value={s.value}>
                {s.label}
              </option>
            ))}
          </Select>
          <Select
            value={difficulty}
            aria-label="Filter by difficulty"
            onChange={(e) => setDifficulty(e.target.value as Difficulty | '')}
          >
            <option value="">All levels</option>
            {DIFFICULTIES.map((d) => (
              <option key={d.value} value={d.value}>
                {d.label}
              </option>
            ))}
          </Select>
          <Select
            value={status}
            aria-label="Filter by whether the question is in use"
            onChange={(e) => setStatus(e.target.value as 'published' | 'retired' | '')}
          >
            <option value="published">In use</option>
            <option value="retired">Retired</option>
            <option value="">In use and retired</option>
          </Select>
        </div>

        {loading ? (
          <div className="empty">Loading…</div>
        ) : visible.length === 0 ? (
          <div className="card">
            <div className="empty">
              <h3>{questions.length === 0 ? 'No questions yet' : 'Nothing matches those filters'}</h3>
              <p>
                {questions.length === 0
                  ? 'Add your first multiple-choice question and set its difficulty.'
                  : status === 'retired'
                    ? 'Nothing retired matches. Retired questions are the ones no level test holds — they stay in the bank but no session can ask them.'
                    : 'Try widening the subject, section or level.'}
              </p>
              {questions.length === 0 && (
                <Link className="btn btn-primary" to="/questions/new">
                  Add question
                </Link>
              )}
            </div>
          </div>
        ) : (
          <div className="q-list">
            {visible.map((q) => (
              <QuestionCard key={q.id} question={q} defaultOpen={q.id === justAdded} />
            ))}
          </div>
        )}
        </>
      )}
    </div>
  )
}

function QuestionCard({ question: q, defaultOpen }: { question: Question; defaultOpen: boolean }) {
  return (
    <details className="q-card" open={defaultOpen}>
      <summary>
        <IconChevron />
        <div className="q-main">
          <div className="q-stem">{q.stem}</div>
          <div className="q-tags">
            <DifficultyBadge level={q.difficulty} />
            <span className="badge badge-neutral">
              {SUBJECTS.find((s) => s.value === q.subject)?.label ?? q.subject}
            </span>
            {q.section && <span className="badge badge-neutral">{sectionLabel(q.section)}</span>}
            {q.skill && <span className="badge badge-sky">{skillLabel(q.skill)}</span>}
            {q.status === 'retired' && <span className="badge badge-neutral">Retired</span>}
          </div>
        </div>
      </summary>

      <QuestionView
        question={q}
        header={
          <>
            <Link className="btn btn-ghost btn-sm" to={`/questions/${q.id}/edit`}>
              Edit
            </Link>
            {q.created_by === null && <span className="muted">house question</span>}
          </>
        }
        footer={
          <>
            {q.question_keys?.explanation && (
              <div className="q-note">
                <div className="section-title">Explanation</div>
                {q.question_keys.explanation}
              </div>
            )}
            {q.difficulty_rationale && (
              <div className="q-note">
                <div className="section-title">Why {q.difficulty}</div>
                {q.difficulty_rationale}
              </div>
            )}
          </>
        }
      />
    </details>
  )
}
