import { useCallback, useEffect, useState, type FormEvent } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { PaperBuilder, useBankData } from '../components/PaperBuilder'
import { Field, Input, Notice, Select, Textarea } from '../components/ui'
import { SUBJECTS } from '../lib/constants'
import { row, supabase } from '../lib/supabase'
import type { QuestionSet, Subject } from '../lib/types'

/**
 * Build a pre-test: name it, take questions from the source papers, order them.
 *
 * Same builder as a session's paper — open one of the three diagnostics, read
 * the questions whole, tick what this paper should carry, then arrange the lot.
 * The difference is only that this one is reusable: built once and run with
 * every student after that, which is what makes two students' reports
 * comparable.
 *
 * Order is explicit rather than implied by when a question was ticked, because
 * "question 7" has to mean the same thing for everybody who sits it.
 */
export function QuestionSetEdit() {
  const { id } = useParams()
  const navigate = useNavigate()
  const isNew = !id

  const [title, setTitle] = useState('')
  const [subject, setSubject] = useState<Subject>('english')
  const [description, setDescription] = useState('')
  const [picked, setPicked] = useState<string[]>([])

  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(!!id)

  const { data, loading: bankLoading } = useBankData(subject)

  const load = useCallback(async () => {
    if (!id) return
    const { data: found, error: err } = await supabase
      .from('question_sets')
      .select('*, question_set_items(question_id, position)')
      .eq('id', id)
      .maybeSingle()

    if (err) setError(err.message)
    else {
      const set = row<QuestionSet & { question_set_items: { question_id: string; position: number }[] }>(
        found,
      )
      if (set) {
        setTitle(set.title)
        setSubject(set.subject)
        setDescription(set.description ?? '')
        setPicked(
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

  async function save(e: FormEvent) {
    e.preventDefault()
    setError(null)
    if (!title.trim()) return setError('Give the pre-test a name.')
    if (picked.length === 0) return setError('Pick at least one question.')

    setBusy(true)
    try {
      let setId = id
      if (isNew) {
        const { data: made, error: err } = await supabase
          .from('question_sets')
          .insert({ title: title.trim(), subject, description: description.trim() || null })
          .select('id')
          .single()
        if (err) throw new Error(err.message)
        setId = (made as { id: string }).id
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
        picked.map((questionId, i) => ({
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
    <div className="page page-wide">
      <Link className="back-link" to="/pretests">
        <IconBack /> Pre-tests
      </Link>

      <form onSubmit={(e) => void save(e)}>
        <div className="page-head">
          <div>
            <h1>{isNew ? 'New pre-test' : 'Edit pre-test'}</h1>
            <p className="sub">
              Take questions from any of the papers, in any combination, then put them in the order
              the students will sit them.
            </p>
          </div>
          <div className="spring" />
          <Link className="btn" to="/pretests">
            Cancel
          </Link>
          <button type="submit" className="btn btn-primary" disabled={busy}>
            {busy ? 'Saving…' : `Save ${picked.length} question${picked.length === 1 ? '' : 's'}`}
          </button>
        </div>

        {error && <Notice kind="error">{error}</Notice>}

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
                  // The bank reloads for the new subject, and a question from
                  // the old one cannot be in this paper.
                  setPicked([])
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

        {bankLoading ? (
          <div className="empty">Loading the bank…</div>
        ) : (
          <PaperBuilder data={data} subject={subject} picked={picked} onChange={setPicked} />
        )}
      </form>
    </div>
  )
}
