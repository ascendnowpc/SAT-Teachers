import { useCallback, useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { DifficultyBadge, Field, Input, Notice, Select, Textarea } from '../components/ui'
import { SECTIONS, SUBJECTS, sectionLabel, skillLabel } from '../lib/constants'
import { row, rows, supabase } from '../lib/supabase'
import type { Question, QuestionSet, Subject } from '../lib/types'

/**
 * Build a pre-test: name it, then pick the questions and put them in order.
 *
 * Order matters, so it is explicit rather than implied by when a question was
 * added — "question 7" has to mean the same thing for every student who sits
 * the paper.
 */
export function QuestionSetEdit() {
  const { id } = useParams()
  const navigate = useNavigate()
  const isNew = !id

  const [title, setTitle] = useState('')
  const [subject, setSubject] = useState<Subject>('english')
  const [description, setDescription] = useState('')
  const [chosen, setChosen] = useState<string[]>([])

  const [bank, setBank] = useState<Question[]>([])
  const [section, setSection] = useState('')
  const [search, setSearch] = useState('')

  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(true)

  const load = useCallback(async () => {
    const [q, s] = await Promise.all([
      supabase
        .from('questions')
        .select('*, question_options(*)')
        .eq('status', 'published')
        .order('source_ref', { nullsFirst: false }),
      id
        ? supabase
            .from('question_sets')
            .select('*, question_set_items(question_id, position)')
            .eq('id', id)
            .maybeSingle()
        : Promise.resolve({ data: null, error: null }),
    ])

    if (q.error) setError(q.error.message)
    else setBank(rows<Question>(q.data))

    if (s.error) setError(s.error.message)
    else if (s.data) {
      const set = row<QuestionSet & { question_set_items: { question_id: string; position: number }[] }>(
        s.data,
      )
      if (set) {
        setTitle(set.title)
        setSubject(set.subject)
        setDescription(set.description ?? '')
        setChosen(
          [...set.question_set_items]
            .sort((a, b) => a.position - b.position)
            .map((i) => i.question_id),
        )
      }
    }
    setLoading(false)
  }, [id])

  useEffect(() => {
    void load()
  }, [load])

  const byId = useMemo(() => new Map(bank.map((q) => [q.id, q])), [bank])

  const available = useMemo(() => {
    const needle = search.trim().toLowerCase()
    return bank.filter((q) => {
      if (q.subject !== subject) return false
      if (chosen.includes(q.id)) return false
      if (section && q.section !== section) return false
      if (needle && !`${q.stem} ${q.passage ?? ''}`.toLowerCase().includes(needle)) return false
      return true
    })
  }, [bank, subject, chosen, section, search])

  function move(index: number, by: number) {
    const next = [...chosen]
    const to = index + by
    if (to < 0 || to >= next.length) return
    ;[next[index], next[to]] = [next[to], next[index]]
    setChosen(next)
  }

  async function save(e: FormEvent) {
    e.preventDefault()
    setError(null)
    if (!title.trim()) return setError('Give the pre-test a name.')
    if (chosen.length === 0) return setError('Pick at least one question.')

    setBusy(true)
    try {
      let setId = id
      if (isNew) {
        const { data, error: err } = await supabase
          .from('question_sets')
          .insert({ title: title.trim(), subject, description: description.trim() || null })
          .select('id')
          .single()
        if (err) throw new Error(err.message)
        setId = (data as { id: string }).id
      } else {
        const { error: err } = await supabase
          .from('question_sets')
          .update({ title: title.trim(), subject, description: description.trim() || null })
          .eq('id', setId!)
        if (err) throw new Error(err.message)
      }

      // Replace the membership wholesale: positions have to stay contiguous,
      // and a diff would leave gaps whenever a question is removed.
      const { error: delErr } = await supabase
        .from('question_set_items')
        .delete()
        .eq('set_id', setId!)
      if (delErr) throw new Error(delErr.message)

      const { error: insErr } = await supabase.from('question_set_items').insert(
        chosen.map((questionId, i) => ({
          set_id: setId!,
          question_id: questionId,
          position: i + 1,
        })),
      )
      if (insErr) throw new Error(insErr.message)

      navigate('/pretests?saved=1')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save the pre-test.')
    } finally {
      setBusy(false)
    }
  }

  if (loading) return <div className="page">Loading…</div>

  return (
    <div className="page">
      <Link className="back-link" to="/pretests">
        <IconBack /> Pre-tests
      </Link>

      <div className="page-head">
        <h1>{isNew ? 'New pre-test' : 'Edit pre-test'}</h1>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <form onSubmit={(e) => void save(e)} className="form-stack">
        <div className="card card-pad">
          <div className="two-col">
            <Field label="Name" required>
              <Input
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="English Diagnostic — Module 2"
                required
              />
            </Field>
            <Field label="Subject">
              <Select
                value={subject}
                onChange={(e) => {
                  setSubject(e.target.value as Subject)
                  setSection('')
                  setChosen([])
                }}
              >
                {SUBJECTS.map((s) => (
                  <option key={s.value} value={s.value}>
                    {s.label}
                  </option>
                ))}
              </Select>
            </Field>
          </div>
          <Field label="Description">
            <Textarea
              rows={2}
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              placeholder="What this paper is for."
            />
          </Field>
        </div>

        <div className="pretest-cols">
          <div className="card card-pad">
            <div className="section-title">In this pre-test · {chosen.length}</div>
            {chosen.length === 0 ? (
              <p className="muted">Nothing picked yet.</p>
            ) : (
              <ol className="picked">
                {chosen.map((qid, i) => {
                  const q = byId.get(qid)
                  return (
                    <li key={qid}>
                      <span className="n">{i + 1}</span>
                      <span className="s">{q?.stem ?? 'Question'}</span>
                      <span className="ctl">
                        <button type="button" onClick={() => move(i, -1)} disabled={i === 0}
                          aria-label="Move up">↑</button>
                        <button type="button" onClick={() => move(i, 1)}
                          disabled={i === chosen.length - 1} aria-label="Move down">↓</button>
                        <button type="button" onClick={() => setChosen(chosen.filter((c) => c !== qid))}
                          aria-label="Remove">×</button>
                      </span>
                    </li>
                  )
                })}
              </ol>
            )}
          </div>

          <div className="card card-pad">
            <div className="section-title">The bank</div>
            <div className="toolbar">
              <div className="grow">
                <Input
                  type="search"
                  placeholder="Search…"
                  value={search}
                  onChange={(e) => setSearch(e.target.value)}
                  aria-label="Search the bank"
                />
              </div>
              <Select value={section} onChange={(e) => setSection(e.target.value)}
                aria-label="Filter by section">
                <option value="">All sections</option>
                {SECTIONS[subject].map((s) => (
                  <option key={s.value} value={s.value}>
                    {s.label}
                  </option>
                ))}
              </Select>
            </div>

            <div className="bank-list">
              {available.slice(0, 60).map((q) => (
                <button
                  key={q.id}
                  type="button"
                  className="bank-row"
                  onClick={() => setChosen([...chosen, q.id])}
                >
                  <span className="s">{q.stem}</span>
                  <span className="tags">
                    <DifficultyBadge level={q.difficulty} />
                    {q.skill && <span className="badge badge-neutral">{skillLabel(q.skill)}</span>}
                    {!q.skill && q.section && (
                      <span className="badge badge-neutral">{sectionLabel(q.section)}</span>
                    )}
                  </span>
                </button>
              ))}
              {available.length === 0 && <p className="muted">Nothing left to add.</p>}
            </div>
          </div>
        </div>

        <div className="form-actions">
          <Link className="btn btn-ghost" to="/pretests">
            Cancel
          </Link>
          <button type="submit" className="btn btn-primary" disabled={busy}>
            {busy ? 'Saving…' : 'Save pre-test'}
          </button>
        </div>
      </form>
    </div>
  )
}
