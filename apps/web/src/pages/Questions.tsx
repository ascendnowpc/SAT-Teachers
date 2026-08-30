import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useSearchParams } from 'react-router-dom'
import { Chevron, DifficultyBadge, Input, Notice, Select } from '../components/ui'
import { DIFFICULTIES, DOMAINS, OPTION_LABELS, SUBJECTS, domainLabel } from '../lib/constants'
import { supabase } from '../lib/supabase'
import type { Difficulty, Question, Subject } from '../lib/types'

export function Questions() {
  const [params, setParams] = useSearchParams()
  const justAdded = params.get('added')

  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const [subject, setSubject] = useState<Subject | ''>('')
  const [domain, setDomain] = useState('')
  const [difficulty, setDifficulty] = useState<Difficulty | ''>('')
  const [search, setSearch] = useState('')

  const load = useCallback(async () => {
    setLoading(true)
    const { data, error: err } = await supabase
      .from('questions')
      .select('*, question_options(*), question_keys(*)')
      .order('created_at', { ascending: false })

    if (err) setError(err.message)
    else setQuestions((data ?? []) as Question[])
    setLoading(false)
  }, [])

  useEffect(() => {
    void load()
  }, [load])

  const domainChoices = subject ? DOMAINS[subject] : [...DOMAINS.english, ...DOMAINS.math]

  const visible = useMemo(() => {
    const needle = search.trim().toLowerCase()
    return questions.filter((q) => {
      if (subject && q.subject !== subject) return false
      if (domain && q.domain !== domain) return false
      if (difficulty && q.difficulty !== difficulty) return false
      if (needle) {
        const hay = `${q.stem} ${q.passage ?? ''} ${q.question_options.map((o) => o.body).join(' ')}`
        if (!hay.toLowerCase().includes(needle)) return false
      }
      return true
    })
  }, [questions, subject, domain, difficulty, search])

  const counts = useMemo(() => {
    const by = { easy: 0, medium: 0, hard: 0 }
    for (const q of questions) by[q.difficulty] += 1
    return by
  }, [questions])

  return (
    <>
      <div className="page-head">
        <div>
          <h1>Question bank</h1>
          <p className="sub">
            {questions.length} question{questions.length === 1 ? '' : 's'} · {counts.easy} easy ·{' '}
            {counts.medium} medium · {counts.hard} hard
          </p>
        </div>
        <div className="spacer" />
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

      <div className="q-toolbar">
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
            setDomain('')
          }}
        >
          <option value="">All subjects</option>
          {SUBJECTS.map((s) => (
            <option key={s.value} value={s.value}>
              {s.label}
            </option>
          ))}
        </Select>
        <Select value={domain} aria-label="Filter by domain" onChange={(e) => setDomain(e.target.value)}>
          <option value="">All domains</option>
          {domainChoices.map((d) => (
            <option key={d.value} value={d.value}>
              {d.label}
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
                : 'Try widening the subject, domain or level.'}
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
  )
}

function QuestionCard({ question: q, defaultOpen }: { question: Question; defaultOpen: boolean }) {
  const correct = q.question_keys?.correct_option
  const options = [...q.question_options].sort(
    (a, b) => OPTION_LABELS.indexOf(a.label) - OPTION_LABELS.indexOf(b.label),
  )

  return (
    <details className="q-card" open={defaultOpen}>
      <summary>
        <Chevron />
        <div className="q-main">
          <div className="q-stem">{q.stem}</div>
          <div className="q-tags">
            <DifficultyBadge level={q.difficulty} />
            <span className="badge badge-neutral">
              {SUBJECTS.find((s) => s.value === q.subject)?.label ?? q.subject}
            </span>
            {q.domain && <span className="badge badge-neutral">{domainLabel(q.domain)}</span>}
          </div>
        </div>
      </summary>

      <div className="q-body">
        {q.passage && <div className="q-passage">{q.passage}</div>}

        <div className="q-options">
          {options.map((o) => (
            <div key={o.id} className={o.label === correct ? 'q-option correct' : 'q-option'}>
              <span className="lab">{o.label}</span>
              <span>{o.body}</span>
              {o.label === correct && <span className="tick">Correct</span>}
            </div>
          ))}
        </div>

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
      </div>
    </details>
  )
}
