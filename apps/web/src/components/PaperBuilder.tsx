import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { IconGrip, IconTrash } from './icons'
import { QuestionView } from './QuestionView'
import { DifficultyBadge, Input, Passage, Select } from './ui'
import { DIFFICULTIES, SECTIONS, sectionLabel, skillLabel } from '../lib/constants'
import { buildPaper } from '../lib/paper'
import { addAll, move, removeAll, toggle } from '../lib/reorder'
import { rows, supabase } from '../lib/supabase'
import type { Difficulty, Question, QuestionSet, Subject } from '../lib/types'

/**
 * Choosing questions and putting them in order — the same job in two places.
 *
 * A pre-test and a session's paper are the same act of building: open one of
 * the source papers, read the questions, tick the ones this paper should
 * carry, then arrange them. So both screens mount this, and the only thing
 * they do differently is where the list is saved.
 *
 * Questions are shown whole, wherever they are shown. A stem on its own does
 * not tell a teacher whether the question belongs in this paper — the passage
 * it hangs off and the four choices are the question.
 */

export interface Membership {
  set_id: string
  question_id: string
  position: number
}

export interface BankData {
  questions: Question[]
  papers: QuestionSet[]
  membership: Membership[]
}

const EMPTY: BankData = { questions: [], papers: [], membership: [] }

/**
 * The bank, the papers it is filed under, and which question sits in which.
 *
 * Draft questions are the ones whose key is still disputed; they stay out of
 * every paper a student might sit.
 */
export function useBankData(subject: Subject) {
  const [data, setData] = useState<BankData>(EMPTY)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    setLoading(true)
    const [qs, sets, setItems] = await Promise.all([
      supabase
        .from('questions')
        .select('*, question_options(*), question_keys(*)')
        .eq('subject', subject)
        .eq('status', 'published'),
      supabase.from('question_sets').select('*').eq('subject', subject).order('source_ref'),
      supabase.from('question_set_items').select('set_id, question_id, position').order('position'),
    ])

    for (const r of [qs, sets, setItems]) if (r.error) setError(r.error.message)

    setData({
      questions: rows<Question>(qs.data),
      papers: rows<QuestionSet>(sets.data),
      membership: rows<Membership>(setItems.data),
    })
    setLoading(false)
  }, [subject])

  useEffect(() => {
    void load()
  }, [load])

  return { data, loading, error, reload: load }
}

/* -------------------------------------------------------------- builder --- */

export function PaperBuilder({
  data,
  subject,
  picked,
  onChange,
  locked = false,
  excludePaper,
}: {
  data: BankData
  subject: Subject
  picked: string[]
  onChange: (next: string[]) => void
  locked?: boolean
  /** The paper being edited, so it does not offer itself as a source. */
  excludePaper?: string
}) {
  const [tab, setTab] = useState<'choose' | 'order'>('choose')

  return (
    <>
      <div className="tabs" role="tablist" aria-label="Building the paper">
        <button
          type="button"
          role="tab"
          aria-selected={tab === 'choose'}
          className={`tab ${tab === 'choose' ? 'on' : ''}`}
          onClick={() => setTab('choose')}
        >
          Choose questions
        </button>
        <button
          type="button"
          role="tab"
          aria-selected={tab === 'order'}
          className={`tab ${tab === 'order' ? 'on' : ''}`}
          onClick={() => setTab('order')}
        >
          The paper · {picked.length}
        </button>
      </div>

      {tab === 'choose' ? (
        <Choose
          data={data}
          subject={subject}
          picked={picked}
          onChange={onChange}
          locked={locked}
          excludePaper={excludePaper}
          onDone={() => setTab('order')}
        />
      ) : (
        <Order data={data} picked={picked} onChange={onChange} locked={locked} />
      )}
    </>
  )
}

/* --------------------------------------------------------------- choose --- */

function Choose({
  data,
  subject,
  picked,
  onChange,
  locked,
  excludePaper,
  onDone,
}: {
  data: BankData
  subject: Subject
  picked: string[]
  onChange: (next: string[]) => void
  locked: boolean
  excludePaper?: string
  onDone: () => void
}) {
  const [source, setSource] = useState<string | null>(null)
  const [search, setSearch] = useState('')
  const [section, setSection] = useState('')
  const [difficulty, setDifficulty] = useState<Difficulty | ''>('')

  const byId = useMemo(
    () => new Map(data.questions.map((q) => [q.id, q])),
    [data.questions],
  )
  const pickedSet = useMemo(() => new Set(picked), [picked])

  /** How many of each paper's questions are already in. */
  const counts = useMemo(() => {
    const by = new Map<string, { total: number; picked: number }>()
    for (const m of data.membership) {
      if (!byId.has(m.question_id)) continue
      const row = by.get(m.set_id) ?? { total: 0, picked: 0 }
      row.total += 1
      if (pickedSet.has(m.question_id)) row.picked += 1
      by.set(m.set_id, row)
    }
    return by
  }, [data.membership, byId, pickedSet])

  const inSource = useMemo(() => {
    if (!source) return []
    if (source === 'bank') {
      const filed = new Set(data.membership.map((m) => m.question_id))
      return data.questions.filter((q) => !filed.has(q.id))
    }
    return data.membership
      .filter((m) => m.set_id === source)
      .sort((a, b) => a.position - b.position)
      .map((m) => byId.get(m.question_id))
      .filter((q): q is Question => q !== undefined)
  }, [source, data.membership, data.questions, byId])

  const visible = useMemo(() => {
    const needle = search.trim().toLowerCase()
    return inSource.filter((q) => {
      if (section && q.section !== section) return false
      if (difficulty && q.difficulty !== difficulty) return false
      if (needle) {
        const hay = `${q.stem} ${q.passage ?? ''} ${q.question_options.map((o) => o.body).join(' ')}`
        if (!hay.toLowerCase().includes(needle)) return false
      }
      return true
    })
  }, [inSource, search, section, difficulty])

  const groups = useMemo(() => buildPaper(visible), [visible])

  // ---- the shelf: which paper are we picking from ----
  if (!source) {
    const unfiled = data.questions.filter(
      (q) => !data.membership.some((m) => m.question_id === q.id),
    ).length

    // Two kinds of paper sit here. The source papers are the diagnostics the
    // bank was loaded from; a pre-test is a paper a teacher assembled and
    // saved to run with every student. Taking a whole pre-test is the point of
    // having built one, so that is one button rather than a page of ticking.
    const shelved = data.papers.filter((p) => p.id !== excludePaper)
    const sources = shelved.filter((p) => p.source_ref)
    const mine = shelved.filter((p) => !p.source_ref)

    const shelf = (papers: QuestionSet[]) =>
      papers.map((p) => {
        const c = counts.get(p.id) ?? { total: 0, picked: 0 }
        const ids = data.membership
          .filter((m) => m.set_id === p.id)
          .sort((x, y) => x.position - y.position)
          .map((m) => m.question_id)
          .filter((qid) => byId.has(qid))

        return (
          <div className="shelf-item" key={p.id}>
            <button type="button" className="set-card" onClick={() => setSource(p.id)}>
              <span className="ico">
                <PaperMark />
              </span>
              <span className="main">
                <span className="t">{p.title}</span>
                {p.description && <span className="d">{p.description}</span>}
              </span>
              <span className="tags">
                {c.picked > 0 && <span className="badge badge-ok">{c.picked} picked</span>}
                <span className="badge badge-sky">{c.total} questions</span>
              </span>
            </button>
            <button
              type="button"
              className="btn btn-ghost btn-sm"
              disabled={locked || ids.length === 0 || c.picked === c.total}
              onClick={() => onChange(addAll(picked, ids))}
            >
              {c.picked === c.total && c.total > 0 ? 'All in' : `Take all ${c.total}`}
            </button>
          </div>
        )
      })

    return (
      <div>
        <p className="builder-lede">
          Take a whole paper in one go, or open one and pick from it. You can take from more than
          one — what you tick builds up across all of them.
        </p>

        {mine.length > 0 && (
          <>
            <div className="section-title">Your pre-tests</div>
            <div className="set-list" style={{ marginBottom: 24 }}>
              {shelf(mine)}
            </div>
          </>
        )}

        <div className="section-title">The source papers</div>
        <div className="set-list">
          {shelf(sources)}

          {unfiled > 0 && (
            <div className="shelf-item">
              <button type="button" className="set-card" onClick={() => setSource('bank')}>
                <span className="ico">
                  <PaperMark />
                </span>
                <span className="main">
                  <span className="t">Everything else</span>
                  <span className="d">Questions written here rather than taken from a paper.</span>
                </span>
                <span className="tags">
                  <span className="badge badge-sky">{unfiled} questions</span>
                </span>
              </button>
            </div>
          )}
        </div>

        {picked.length > 0 && (
          <div className="builder-cta">
            <button type="button" className="btn btn-primary" onClick={onDone}>
              {picked.length} picked — put them in order
            </button>
          </div>
        )}
      </div>
    )
  }

  // ---- one paper, read properly ----
  const paper = data.papers.find((p) => p.id === source)

  return (
    <div>
      <div className="builder-filters">
        <button type="button" className="btn btn-ghost btn-sm" onClick={() => setSource(null)}>
          ← All papers
        </button>
        <Input
          type="search"
          placeholder="Search…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          aria-label="Search questions"
        />
        <Select
          value={section}
          onChange={(e) => setSection(e.target.value)}
          aria-label="Filter by section"
        >
          <option value="">All sections</option>
          {SECTIONS[subject].map((d) => (
            <option key={d.value} value={d.value}>
              {d.label}
            </option>
          ))}
        </Select>
        <Select
          value={difficulty}
          onChange={(e) => setDifficulty(e.target.value as Difficulty | '')}
          aria-label="Filter by level"
        >
          <option value="">All levels</option>
          {DIFFICULTIES.map((d) => (
            <option key={d.value} value={d.value}>
              {d.label}
            </option>
          ))}
        </Select>
        <span className="spring" />
        <button
          type="button"
          className="btn btn-ghost btn-sm"
          disabled={locked || visible.length === 0}
          onClick={() =>
            onChange(addAll(picked, visible.map((q) => q.id)))
          }
        >
          Add all {visible.length}
        </button>
      </div>

      <h2 className="builder-source">{paper?.title ?? 'The bank'}</h2>

      {groups.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nothing matches</h3>
            <p>Try another paper, or widen the section and level.</p>
          </div>
        </div>
      ) : (
        groups.map((g) => {
          const ids = g.questions.map((q) => q.question.id)
          const all = ids.every((x) => pickedSet.has(x))

          return (
            <section className="bank-group" key={g.key}>
              <div className="bank-group-head">
                <h3>{g.label ?? `Question ${g.questions[0].number}`}</h3>
                <span className="spring" />
                <span className="muted">
                  {ids.filter((x) => pickedSet.has(x)).length} of {ids.length} picked
                </span>
                <button
                  type="button"
                  className="btn btn-ghost btn-sm"
                  disabled={locked}
                  onClick={() => onChange(all ? removeAll(picked, ids) : addAll(picked, ids))}
                >
                  {all ? 'Remove all' : `Add all ${ids.length}`}
                </button>
              </div>

              {g.label && g.passage && (
                <details className="bank-passage" open>
                  <summary>The passage these {g.questions.length} share</summary>
                  <Passage body={g.passage} underline={g.underline} className="q-passage" />
                </details>
              )}

              {g.questions.map(({ question, number }) => (
                <QuestionCard
                  key={question.id}
                  question={question}
                  number={number}
                  picked={pickedSet.has(question.id)}
                  locked={locked}
                  onToggle={() => onChange(toggle(picked, question.id))}
                />
              ))}
            </section>
          )
        })
      )}

      {picked.length > 0 && (
        <div className="builder-cta">
          <button type="button" className="btn btn-primary" onClick={onDone}>
            {picked.length} picked — put them in order
          </button>
        </div>
      )}
    </div>
  )
}

/* ---------------------------------------------------------------- order --- */

/**
 * Everything picked, in full, in the order it will be sat.
 *
 * Not a list of stems: at this point the teacher is reading the paper they
 * have just made, and "does question 6 follow from question 5" is a question
 * about the questions, not about their first lines. Drag a card to move it;
 * the arrows do the same thing for anyone not using a mouse.
 */
function Order({
  data,
  picked,
  onChange,
  locked,
}: {
  data: BankData
  picked: string[]
  onChange: (next: string[]) => void
  locked: boolean
}) {
  const byId = useMemo(() => new Map(data.questions.map((q) => [q.id, q])), [data.questions])
  const dragFrom = useRef<number | null>(null)
  const [over, setOver] = useState<number | null>(null)

  const minutes = useMemo(() => {
    const seconds = picked.reduce((sum, qid) => sum + (byId.get(qid)?.target_seconds ?? 75), 0)
    return Math.round(seconds / 60)
  }, [picked, byId])

  if (picked.length === 0) {
    return (
      <div className="card">
        <div className="empty">
          <h3>Nothing picked yet</h3>
          <p>Choose questions first; they arrive here in the order you ticked them.</p>
        </div>
      </div>
    )
  }

  return (
    <div className="order-pane">
      <p className="builder-lede">
        {picked.length} question{picked.length === 1 ? '' : 's'} · about {minutes} minutes at
        target pace. Drag a card to move it.
      </p>

      <ol className="order-list">
        {picked.map((qid, i) => {
          const q = byId.get(qid)
          return (
            <li
              key={qid}
              className={`order-card ${over === i ? 'over' : ''}`}
              draggable={!locked}
              onDragStart={() => {
                dragFrom.current = i
              }}
              onDragOver={(e) => {
                e.preventDefault()
                setOver(i)
              }}
              onDragLeave={() => setOver((o) => (o === i ? null : o))}
              onDrop={(e) => {
                e.preventDefault()
                const from = dragFrom.current
                dragFrom.current = null
                setOver(null)
                if (from !== null) onChange(move(picked, from, i))
              }}
              onDragEnd={() => {
                dragFrom.current = null
                setOver(null)
              }}
            >
              {q ? (
                <QuestionView
                  question={q}
                  number={String(i + 1)}
                  header={
                    <>
                      <span className="grip" aria-hidden="true">
                        <IconGrip />
                      </span>
                      <DifficultyBadge level={q.difficulty} />
                      {q.skill && <span className="badge badge-sky">{skillLabel(q.skill)}</span>}
                      {!q.skill && q.section && (
                        <span className="badge badge-neutral">{sectionLabel(q.section)}</span>
                      )}
                      <span className="spring" />
                      <button
                        type="button"
                        className="btn btn-ghost btn-sm"
                        disabled={locked || i === 0}
                        onClick={() => onChange(move(picked, i, i - 1))}
                        aria-label={`Move question ${i + 1} up`}
                      >
                        ↑
                      </button>
                      <button
                        type="button"
                        className="btn btn-ghost btn-sm"
                        disabled={locked || i === picked.length - 1}
                        onClick={() => onChange(move(picked, i, i + 1))}
                        aria-label={`Move question ${i + 1} down`}
                      >
                        ↓
                      </button>
                      <button
                        type="button"
                        className="btn btn-ghost btn-sm"
                        disabled={locked}
                        onClick={() => onChange(picked.filter((x) => x !== qid))}
                        aria-label={`Remove question ${i + 1}`}
                      >
                        <IconTrash />
                      </button>
                    </>
                  }
                />
              ) : (
                <div className="order-body">
                  <p className="muted">This question is no longer in the bank.</p>
                </div>
              )}
            </li>
          )
        })}
      </ol>
    </div>
  )
}

/* ----------------------------------------------------------- the pieces --- */

function QuestionCard({
  question: q,
  number,
  picked,
  locked,
  onToggle,
}: {
  question: Question
  number: string
  picked: boolean
  locked: boolean
  onToggle: () => void
}) {
  return (
    <div className={`bank-q ${picked ? 'picked' : ''}`}>
      <QuestionView
        question={q}
        number={number}
        header={
          <>
            <label className="bank-pick">
              <input type="checkbox" checked={picked} disabled={locked} onChange={onToggle} />
              <span>{picked ? 'In this paper' : 'Add'}</span>
            </label>
            <span className="spring" />
            <DifficultyBadge level={q.difficulty} />
            {q.section && <span className="badge badge-neutral">{sectionLabel(q.section)}</span>}
            {q.skill && <span className="badge badge-sky">{skillLabel(q.skill)}</span>}
          </>
        }
      />
    </div>
  )
}

function PaperMark() {
  return (
    <svg
      width="17"
      height="17"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.8"
      strokeLinecap="round"
      strokeLinejoin="round"
      aria-hidden="true"
    >
      <path d="M6 3h9l4 4v14a1 1 0 0 1-1 1H6a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1Z" />
      <path d="M14 3v5h5M9 13h6M9 17h4" />
    </svg>
  )
}
