import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { IconBack, IconGrip, IconTrash } from '../components/icons'
import { DifficultyBadge, Input, Notice, Passage, Select } from '../components/ui'
import {
  DIFFICULTIES,
  OPTION_LABELS,
  SECTIONS,
  sectionLabel,
  skillLabel,
} from '../lib/constants'
import { buildPaper } from '../lib/paper'
import { addAll, move, removeAll, toggle } from '../lib/reorder'
import { row, rows, supabase } from '../lib/supabase'
import type { Difficulty, Question, QuestionSet, Session, SessionItem } from '../lib/types'

/**
 * Building the paper for one session, before the day.
 *
 * This is where the teacher's whole job now happens: read the bank as the
 * papers it came from, tick the questions this student should sit, drag them
 * into the order they should arrive in, save. Nothing is handed over during
 * the lesson — the student opens the session themselves at the scheduled time
 * and works through exactly this list.
 *
 * Questions are shown whole, passage and all four options included, because
 * "which of these should this student sit" is not a decision anyone can make
 * off a truncated stem.
 */
export function SessionPaper() {
  const { id } = useParams<{ id: string }>()
  const navigate = useNavigate()

  const [session, setSession] = useState<Session | null>(null)
  const [questions, setQuestions] = useState<Question[]>([])
  const [papers, setPapers] = useState<QuestionSet[]>([])
  const [membership, setMembership] = useState<{ set_id: string; question_id: string; position: number }[]>([])
  const [picked, setPicked] = useState<string[]>([])

  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [saving, setSaving] = useState(false)
  const [saved, setSaved] = useState(false)

  const [source, setSource] = useState('')
  const [search, setSearch] = useState('')
  const [section, setSection] = useState('')
  const [difficulty, setDifficulty] = useState<Difficulty | ''>('')

  const load = useCallback(async () => {
    if (!id) return

    const s = await supabase
      .from('sessions')
      .select('*, student:profiles!sessions_student_id_fkey(id,full_name,display_id)')
      .eq('id', id)
      .maybeSingle()

    if (s.error) {
      setError(s.error.message)
      setLoading(false)
      return
    }
    const sess = row<Session>(s.data)
    setSession(sess)
    if (!sess) {
      setLoading(false)
      return
    }

    const [items, qs, sets, setItems] = await Promise.all([
      supabase.from('session_items').select('*').eq('session_id', id).order('sequence_no'),
      supabase
        .from('questions')
        .select('*, question_options(*), question_keys(*)')
        .eq('subject', sess.subject)
        // Drafts are the items whose key is still disputed; they stay out of a
        // paper a student will sit unseen.
        .eq('status', 'published'),
      supabase.from('question_sets').select('*').eq('subject', sess.subject).order('source_ref'),
      supabase.from('question_set_items').select('set_id, question_id, position').order('position'),
    ])

    for (const r of [items, qs, sets, setItems]) if (r.error) setError(r.error.message)

    setPicked(rows<SessionItem>(items.data).map((i) => i.question_id))
    setQuestions(rows<Question>(qs.data))
    const paperList = rows<QuestionSet>(sets.data)
    setPapers(paperList)
    setMembership(rows<{ set_id: string; question_id: string; position: number }>(setItems.data))
    setSource((cur) => cur || paperList[0]?.id || '')
    setLoading(false)
  }, [id])

  useEffect(() => {
    void load()
  }, [load])

  const byId = useMemo(() => new Map(questions.map((q) => [q.id, q])), [questions])

  // Whether the paper can still be changed. Once the student has opened the
  // session the questions are numbered on their screen, so renumbering them
  // underneath is not something the server will accept either.
  const locked = session ? session.status !== 'scheduled' : false

  /** The chosen paper's questions, in the paper's own order, then filtered. */
  const browsing = useMemo(() => {
    const inSource = source
      ? membership
          .filter((m) => m.set_id === source)
          .sort((a, b) => a.position - b.position)
          .map((m) => byId.get(m.question_id))
          .filter((q): q is Question => q !== undefined)
      : questions

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
  }, [source, membership, byId, questions, search, section, difficulty])

  const groups = useMemo(() => buildPaper(browsing), [browsing])
  const pickedSet = useMemo(() => new Set(picked), [picked])

  async function save() {
    if (!id) return
    setSaving(true)
    setError(null)
    const { error: err } = await supabase.rpc('set_session_paper', {
      p_session: id,
      p_questions: picked,
    })
    if (err) setError(err.message)
    else {
      setSaved(true)
      setTimeout(() => setSaved(false), 2500)
    }
    setSaving(false)
  }

  if (loading) return <div className="page">Loading…</div>
  if (!session) {
    return (
      <div className="page">
        <div className="card">
          <div className="empty">
            <h3>Session not found</h3>
            <Link className="btn btn-primary" to="/sessions">
              Back to sessions
            </Link>
          </div>
        </div>
      </div>
    )
  }

  const when = new Date(session.scheduled_at)

  return (
    <div className="page page-wide">
      <Link className="back-link" to={`/sessions/${id}`}>
        <IconBack /> Session
      </Link>

      <div className="page-head">
        <div>
          <h1>Build the paper</h1>
          <p className="sub">
            {session.student?.full_name}
            {session.student && <span className="num"> ({session.student.display_id})</span>} ·
            opens{' '}
            {when.toLocaleString(undefined, {
              weekday: 'short',
              day: 'numeric',
              month: 'short',
              hour: 'numeric',
              minute: '2-digit',
            })}
          </p>
        </div>
        <div className="spring" />
        {!locked && (
          <>
            <button
              type="button"
              className="btn btn-primary"
              disabled={saving}
              onClick={() => void save()}
            >
              {saving ? 'Saving…' : `Save ${picked.length} question${picked.length === 1 ? '' : 's'}`}
            </button>
            <button type="button" className="btn" onClick={() => navigate(`/sessions/${id}`)}>
              Done
            </button>
          </>
        )}
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {saved && <Notice kind="ok">Saved. The student sits exactly this paper, in this order.</Notice>}
      {locked && (
        <Notice kind="info">
          This session has already opened, so its paper is fixed — renumbering it now would
          renumber questions the student has answered.
        </Notice>
      )}

      <div className="builder">
        <section className="builder-bank">
          <div className="builder-filters">
            <Select value={source} onChange={(e) => setSource(e.target.value)} aria-label="Paper">
              {papers.map((p) => (
                <option key={p.id} value={p.id}>
                  {p.title}
                </option>
              ))}
              <option value="">The whole bank</option>
            </Select>
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
              {SECTIONS[session.subject].map((d) => (
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
          </div>

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
                      onClick={() =>
                        setPicked((p) => (all ? removeAll(p, ids) : addAll(p, ids)))
                      }
                    >
                      {all ? 'Remove all' : `Add all ${ids.length}`}
                    </button>
                  </div>

                  {g.label && g.passage && (
                    <details className="bank-passage">
                      <summary>The passage these {g.questions.length} share</summary>
                      <Passage body={g.passage} underline={g.underline} className="q-passage" />
                    </details>
                  )}

                  {g.questions.map(({ question, number }) => (
                    <BankQuestion
                      key={question.id}
                      question={question}
                      number={number}
                      passage={g.label ? null : g.passage}
                      underline={g.underline}
                      picked={pickedSet.has(question.id)}
                      locked={locked}
                      onToggle={() => setPicked((p) => toggle(p, question.id))}
                    />
                  ))}
                </section>
              )
            })
          )}
        </section>

        <Picked
          picked={picked}
          byId={byId}
          locked={locked}
          onReorder={(from, to) => setPicked((p) => move(p, from, to))}
          onRemove={(qid) => setPicked((p) => p.filter((x) => x !== qid))}
        />
      </div>
    </div>
  )
}

/* ---------------------------------------------------------------- bank --- */

function BankQuestion({
  question: q,
  number,
  passage,
  underline,
  picked,
  locked,
  onToggle,
}: {
  question: Question
  number: string
  passage: string | null
  underline: string | null
  picked: boolean
  locked: boolean
  onToggle: () => void
}) {
  const correct = q.question_keys?.correct_option
  const options = [...q.question_options].sort(
    (a, b) => OPTION_LABELS.indexOf(a.label) - OPTION_LABELS.indexOf(b.label),
  )

  return (
    <div className={`bank-q ${picked ? 'picked' : ''}`}>
      <label className="bank-pick">
        <input type="checkbox" checked={picked} disabled={locked} onChange={onToggle} />
        <span className="n">{number}</span>
      </label>

      <div className="bank-q-main">
        {passage && <Passage body={passage} underline={underline} className="q-passage" />}
        <p className="bank-stem">{q.stem}</p>

        <ol className="paper-choices">
          {options.map((o) => (
            <li key={o.id} className={o.label === correct ? 'is-key' : undefined}>
              <span className="lab">{o.label})</span>
              <span className="body">{o.body}</span>
            </li>
          ))}
        </ol>

        <div className="bank-tags">
          <DifficultyBadge level={q.difficulty} />
          {q.section && <span className="badge badge-neutral">{sectionLabel(q.section)}</span>}
          {q.skill && <span className="badge badge-sky">{skillLabel(q.skill)}</span>}
          {q.target_seconds && <span className="muted">{q.target_seconds}s target</span>}
        </div>
      </div>
    </div>
  )
}

/* -------------------------------------------------------------- picked --- */

/**
 * The paper as it stands: the order the student will meet the questions in.
 *
 * Dragging is the natural gesture and it is what the teachers asked for, but a
 * drag cannot be done from a keyboard, so every row also carries move-up and
 * move-down buttons that do exactly the same thing.
 */
function Picked({
  picked,
  byId,
  locked,
  onReorder,
  onRemove,
}: {
  picked: string[]
  byId: Map<string, Question>
  locked: boolean
  onReorder: (from: number, to: number) => void
  onRemove: (questionId: string) => void
}) {
  const dragFrom = useRef<number | null>(null)
  const [over, setOver] = useState<number | null>(null)

  const minutes = useMemo(() => {
    const seconds = picked.reduce((sum, qid) => sum + (byId.get(qid)?.target_seconds ?? 75), 0)
    return Math.round(seconds / 60)
  }, [picked, byId])

  return (
    <aside className="builder-picked">
      <div className="picked-head">
        <div className="section-title" style={{ marginBottom: 0 }}>
          This session · {picked.length}
        </div>
        {picked.length > 0 && <span className="muted">≈ {minutes} min at target pace</span>}
      </div>

      {picked.length === 0 ? (
        <p className="picked-empty">
          Nothing picked yet. Tick questions on the left; they land here in the order the student
          will meet them.
        </p>
      ) : (
        <ol className="picked-list">
          {picked.map((qid, i) => {
            const q = byId.get(qid)
            return (
              <li
                key={qid}
                className={`picked-row ${over === i ? 'over' : ''}`}
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
                  if (from !== null) onReorder(from, i)
                }}
                onDragEnd={() => {
                  dragFrom.current = null
                  setOver(null)
                }}
              >
                <span className="grip" aria-hidden="true">
                  <IconGrip />
                </span>
                <span className="no">{i + 1}</span>
                <span className="stem">{q?.stem ?? 'This question is no longer in the bank'}</span>
                <span className="ctrl">
                  <button
                    type="button"
                    className="btn btn-ghost btn-sm"
                    disabled={locked || i === 0}
                    onClick={() => onReorder(i, i - 1)}
                    aria-label={`Move question ${i + 1} up`}
                  >
                    ↑
                  </button>
                  <button
                    type="button"
                    className="btn btn-ghost btn-sm"
                    disabled={locked || i === picked.length - 1}
                    onClick={() => onReorder(i, i + 1)}
                    aria-label={`Move question ${i + 1} down`}
                  >
                    ↓
                  </button>
                  <button
                    type="button"
                    className="btn btn-ghost btn-sm"
                    disabled={locked}
                    onClick={() => onRemove(qid)}
                    aria-label={`Remove question ${i + 1}`}
                  >
                    <IconTrash />
                  </button>
                </span>
              </li>
            )
          })}
        </ol>
      )}
    </aside>
  )
}
