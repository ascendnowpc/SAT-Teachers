import { useCallback, useEffect, useState, type FormEvent } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { PaperBuilder, useBankData } from '../components/PaperBuilder'
import { Field, Input, Notice, Select, Textarea } from '../components/ui'
import { SUBJECTS } from '../lib/constants'
import { row, supabase } from '../lib/supabase'
import type { QuestionSet, Subject } from '../lib/types'

/**
 * Build a test: name it, take questions from the bank, put them in order.
 *
 * Same builder as a session's paper, because it is the same job. The
 * difference is that this one is saved and reused: "question 7" has to mean
 * the same thing for everybody who sits it, which is why the order is explicit
 * rather than implied by the order things were ticked.
 */
export function TestEdit() {
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
    if (!title.trim()) return setError('Give the test a name.')
    if (picked.length === 0) return setError('Pick at least one question.')

    setBusy(true)
    try {
      let setId = id
      if (isNew) {
        const { data: made, error: err } = await supabase
          .from('question_sets')
          .insert({ title: title.trim(), subject, description: description.trim() || null, kind: 'test' })
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

      navigate('/tests?saved=1')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save the test.')
    } finally {
      setBusy(false)
    }
  }

  if (loading) return <div className="page">Loading…</div>

  return (
    <div className="page page-wide">
      <Link className="back-link" to={id ? `/tests/${id}` : '/tests'}>
        <IconBack /> {id ? 'Test' : 'Tests'}
      </Link>

      <form onSubmit={(e) => void save(e)}>
        <div className="page-head">
          <div>
            <h1>{isNew ? 'New test' : 'Edit test'}</h1>
          </div>
          <div className="spring" />
          <Link className="btn" to={id ? `/tests/${id}` : '/tests'}>
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
                placeholder="Diagnostic — first session"
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
              placeholder="What this test is for."
            />
          </Field>
        </div>

        {bankLoading ? (
          <div className="empty">Loading the bank…</div>
        ) : (
          <PaperBuilder
            data={data}
            subject={subject}
            picked={picked}
            onChange={setPicked}
            excludePaper={id}
          />
        )}
      </form>
    </div>
  )
}
