import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { DifficultyBadge, Input, Notice, Select } from '../components/ui'
import { QuestionView } from '../components/QuestionView'
import { IconChevron, IconStack } from '../components/icons'
import {
  DIFFICULTIES,
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
 * *Papers* is the default and the one the teachers named: the diagnostics as
 * whole documents — "SAT Diagnostic Test (Reading and Writing - 25Q)" — which
 * open as the paper itself, in its order. *All questions* is the flat bank
 * underneath, which is the right unit only when hunting one item by skill or
 * level.
 *
 * Only the source papers are here. A test a teacher assembled out of these
 * questions is under Tests: it is their paper, not the bank's.
 */
export function Questions() {
  const navigate = useNavigate()
  const [params, setParams] = useSearchParams()
  const justAdded = params.get('added')

  const [view, setView] = useState<'papers' | 'questions'>(justAdded ? 'questions' : 'papers')
  const [naming, setNaming] = useState(false)
  const [newPaper, setNewPaper] = useState('')
  const [newSubject, setNewSubject] = useState<Subject>('english')
  const [creating, setCreating] = useState(false)
  const [papers, setPapers] = useState<QuestionSet[]>([])
  const [questions, setQuestions] = useState<Question[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const [subject, setSubject] = useState<Subject | ''>('')
  const [section, setSection] = useState('')
  const [skill, setSkill] = useState('')
  const [difficulty, setDifficulty] = useState<Difficulty | ''>('')
  const [search, setSearch] = useState('')

  const load = useCallback(async () => {
    setLoading(true)

    const [qRes, pRes] = await Promise.all([
      supabase
        .from('questions')
        .select('*, question_options(*), question_keys(*)')
        .order('created_at', { ascending: false }),
      // Papers: the diagnostics the bank was loaded with, and any a teacher
      // has made to write into. A test — assembled from questions that already
      // exist, to be sat — is a different thing and lives under Tests.
      supabase
        .from('question_sets')
        .select('*, question_set_items(count)')
        .eq('kind', 'paper')
        .order('source_ref', { nullsFirst: false }),
    ])

    if (qRes.error) setError(qRes.error.message)
    else setQuestions(rows<Question>(qRes.data))

    if (pRes.error) setError(pRes.error.message)
    else setPapers(rows<QuestionSet>(pRes.data))

    setLoading(false)
  }, [])

  useEffect(() => {
    void load()
  }, [load])

  /** A paper of the teacher's own, empty, ready to be written into. */
  async function createPaper() {
    setCreating(true)
    setError(null)
    const { data, error: err } = await supabase
      .from('question_sets')
      .insert({ title: newPaper.trim(), subject: newSubject, kind: 'paper' })
      .select('id')
      .single()
    setCreating(false)
    if (err) return setError(err.message)
    navigate(`/questions/papers/${(data as { id: string }).id}`)
  }

  const sectionChoices = subject ? SECTIONS[subject] : [...SECTIONS.english, ...SECTIONS.mathematics]
  const skillChoices = skillsFor(section || null)

  const visible = useMemo(() => {
    const needle = search.trim().toLowerCase()
    return questions.filter((q) => {
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
  }, [questions, subject, section, skill, difficulty, search])

  const counts = useMemo(() => {
    const by = { easy: 0, medium: 0, hard: 0 }
    for (const q of questions) by[q.difficulty] += 1
    return by
  }, [questions])

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Question bank</h1>
          <p className="sub">
            {papers.length} paper{papers.length === 1 ? '' : 's'} · {questions.length} question
            {questions.length === 1 ? '' : 's'} · {counts.easy} easy · {counts.medium} medium ·{' '}
            {counts.hard} hard
          </p>
        </div>
        <div className="spring" />
        {view === 'papers' && (
          <button type="button" className="btn" onClick={() => setNaming(true)}>
            New paper
          </button>
        )}
        <Link className="btn btn-primary" to="/questions/new">
          Add question
        </Link>
      </div>

      {naming && (
        <div className="card card-pad" style={{ marginBottom: 16 }}>
          <div className="section-title">New paper</div>
          <p className="muted" style={{ marginBottom: 12 }}>
            A paper you write questions into — a module, a worksheet, a set of your own.
          </p>
          <div className="toolbar">
            <div className="grow">
              <Input
                value={newPaper}
                onChange={(e) => setNewPaper(e.target.value)}
                placeholder="English Module 3"
                aria-label="Paper name"
                autoFocus
              />
            </div>
            <Select
              value={newSubject}
              onChange={(e) => setNewSubject(e.target.value as Subject)}
              aria-label="Subject"
            >
              {SUBJECTS.map((s) => (
                <option key={s.value} value={s.value}>
                  {s.label}
                </option>
              ))}
            </Select>
            <button
              type="button"
              className="btn btn-primary"
              disabled={!newPaper.trim() || creating}
              onClick={() => void createPaper()}
            >
              {creating ? 'Creating…' : 'Create'}
            </button>
            <button type="button" className="btn btn-ghost" onClick={() => setNaming(false)}>
              Cancel
            </button>
          </div>
        </div>
      )}

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
          aria-selected={view === 'papers'}
          className={`tab ${view === 'papers' ? 'on' : ''}`}
          onClick={() => setView('papers')}
        >
          Papers
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

      {view === 'papers' ? (
        loading ? (
          <div className="empty">Loading…</div>
        ) : papers.length === 0 ? (
          <div className="card">
            <div className="empty">
              <h3>No papers yet</h3>
              <p>Make one to write questions into.</p>
              <button type="button" className="btn btn-primary" onClick={() => setNaming(true)}>
                New paper
              </button>
            </div>
          </div>
        ) : (
          <div className="set-list">
            {papers.map((p) => (
              <Link key={p.id} className="set-card" to={`/questions/papers/${p.id}`}>
                <span className="ico">
                  <IconStack />
                </span>
                <span className="main">
                  <span className="t">{p.title}</span>
                  {p.description && <span className="d">{p.description}</span>}
                </span>
                <span className="tags">
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
