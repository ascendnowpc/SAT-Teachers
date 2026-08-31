import { useCallback, useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { Field, Input, Notice, Select, Textarea } from '../components/ui'
import { DIFFICULTIES, OPTION_LABELS, SECTIONS, SUBJECTS, skillsFor } from '../lib/constants'
import { row, rows, supabase } from '../lib/supabase'
import type { Difficulty, OptionLabel, Question, QuestionSet, Subject } from '../lib/types'

/**
 * Writing a question, and correcting one.
 *
 * The same form both ways: an id in the route means it is loaded and rewritten
 * rather than created, and `update_question` mirrors `create_question` exactly
 * — one call, one transaction, so an item never ends up with options that no
 * longer match its key.
 *
 * A new question can be filed into a test on the way past, including a test
 * that does not exist yet, because "write a question" and "put it somewhere"
 * are one thought and making them two screens loses the second half.
 */
export function QuestionNew() {
  const { id } = useParams<{ id: string }>()
  const editing = Boolean(id)
  const navigate = useNavigate()

  const [subject, setSubject] = useState<Subject>('english')
  const [section, setSection] = useState('')
  const [skill, setSkill] = useState('')
  const [passage, setPassage] = useState('')
  const [underline, setUnderline] = useState('')
  const [stem, setStem] = useState('')
  const [difficulty, setDifficulty] = useState<Difficulty>('medium')
  const [rationale, setRationale] = useState('')
  const [options, setOptions] = useState<Record<OptionLabel, string>>({ A: '', B: '', C: '', D: '' })
  const [correct, setCorrect] = useState<OptionLabel>('A')
  const [explanation, setExplanation] = useState('')

  const [imageUrl, setImageUrl] = useState('')
  const [uploading, setUploading] = useState(false)

  const [tests, setTests] = useState<QuestionSet[]>([])
  const [addTo, setAddTo] = useState('')
  const [newTestName, setNewTestName] = useState('')

  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const [loading, setLoading] = useState(editing)

  // The tests a new question can be filed into. Only teacher-built ones: the
  // bank's own papers are a record of what a source document contained.
  useEffect(() => {
    if (editing) return
    void supabase
      .from('question_sets')
      .select('*')
      .is('source_ref', null)
      .eq('subject', subject)
      .order('created_at', { ascending: false })
      .then(({ data }) => setTests(rows<QuestionSet>(data)))
  }, [editing, subject])

  const load = useCallback(async () => {
    if (!id) return
    const { data, error: err } = await supabase
      .from('questions')
      .select('*, question_options(*), question_keys(*)')
      .eq('id', id)
      .maybeSingle()

    if (err) setError(err.message)
    const q = row<Question>(data)
    if (q) {
      setSubject(q.subject)
      setSection(q.section ?? '')
      setSkill(q.skill ?? '')
      setPassage(q.passage ?? '')
      setUnderline(q.passage_underline ?? '')
      setStem(q.stem)
      setDifficulty(q.difficulty)
      setRationale(q.difficulty_rationale ?? '')
      setImageUrl(q.image_url ?? '')
      setExplanation(q.question_keys?.explanation ?? '')
      if (q.question_keys?.correct_option) setCorrect(q.question_keys.correct_option)
      const next: Record<OptionLabel, string> = { A: '', B: '', C: '', D: '' }
      for (const o of q.question_options) next[o.label] = o.body
      setOptions(next)
    }
    setLoading(false)
  }, [id])

  useEffect(() => {
    void load()
  }, [load])

  async function upload(file: File) {
    setUploading(true)
    setError(null)
    // A random path, so one question's figure cannot be guessed from another's.
    const ext = file.name.split('.').pop()?.toLowerCase() ?? 'png'
    const path = `${crypto.randomUUID()}.${ext}`
    const { error: upErr } = await supabase.storage
      .from('question-images')
      .upload(path, file, { cacheControl: '31536000', upsert: false })
    if (upErr) setError(upErr.message)
    else {
      const { data } = supabase.storage.from('question-images').getPublicUrl(path)
      setImageUrl(data.publicUrl)
    }
    setUploading(false)
  }

  const sectionChoices = useMemo(() => SECTIONS[subject], [subject])
  const skillChoices = useMemo(() => skillsFor(section || null), [section])

  function setOption(label: OptionLabel, value: string) {
    setOptions((prev) => ({ ...prev, [label]: value }))
  }

  function onSubjectChange(next: Subject) {
    setSubject(next)
    setSection('') // sections are subject-specific, so the old pick is invalid
    setSkill('')   // and the skill belonged to that section
  }

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)

    const filled = OPTION_LABELS.filter((l) => options[l].trim().length > 0)
    if (filled.length < 2) {
      setError('Give at least two options.')
      return
    }
    if (!filled.includes(correct)) {
      setError(`Option ${correct} is marked correct but has no text.`)
      return
    }

    setBusy(true)
    try {
      const args = {
        p_subject: subject,
        p_section: section,
        p_passage: passage,
        p_stem: stem.trim(),
        p_difficulty: difficulty,
        p_difficulty_rationale: rationale,
        p_options: filled.map((l) => ({ label: l, body: options[l].trim() })),
        p_correct: correct,
        p_explanation: explanation,
        p_passage_underline: underline,
        p_skill: skill,
        p_image_url: imageUrl,
      }

      const { data, error: rpcError } = editing
        ? await supabase.rpc('update_question', { p_question: id, ...args })
        : await supabase.rpc('create_question', args)
      if (rpcError) throw new Error(rpcError.message)

      const questionId = data as string

      if (!editing && addTo) {
        let setId = addTo
        if (addTo === 'new') {
          if (!newTestName.trim()) throw new Error('Name the new test.')
          const made = await supabase
            .from('question_sets')
            .insert({ title: newTestName.trim(), subject })
            .select('id')
            .single()
          if (made.error) throw new Error(made.error.message)
          setId = (made.data as { id: string }).id
        }

        // Onto the end of that test, wherever its numbering has got to.
        const last = await supabase
          .from('question_set_items')
          .select('position')
          .eq('set_id', setId)
          .order('position', { ascending: false })
          .limit(1)
        const next = ((last.data?.[0] as { position: number } | undefined)?.position ?? 0) + 1

        const added = await supabase
          .from('question_set_items')
          .insert({ set_id: setId, question_id: questionId, position: next })
        if (added.error) throw new Error(added.error.message)
      }

      navigate(editing ? `/questions?added=${questionId}` : `/questions?added=${questionId}`)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save the question.')
    } finally {
      setBusy(false)
    }
  }

  if (loading) return <div className="page">Loading…</div>

  return (
    <div className="page">
      <Link className="back-link" to="/questions">
        <IconBack /> Question bank
      </Link>

      <div className="page-head">
        <div>
          <h1>{editing ? 'Edit question' : 'New question'}</h1>
          <p className="sub">The answer key is visible to teachers only.</p>
        </div>
      </div>

      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <div className="card card-pad">
          <div className="section-title">Classification</div>

          <div className="grid-2">
            <Field label="Subject" required>
              <Select value={subject} onChange={(e) => onSubjectChange(e.target.value as Subject)}>
                {SUBJECTS.map((s) => (
                  <option key={s.value} value={s.value}>
                    {s.label}
                  </option>
                ))}
              </Select>
            </Field>

            <Field label="Section">
              <Select
                value={section}
                onChange={(e) => {
                  setSection(e.target.value)
                  setSkill('') // a skill belongs to one section; keeping it would mis-file the item
                }}
              >
                <option value="">Not set</option>
                {sectionChoices.map((d) => (
                  <option key={d.value} value={d.value}>
                    {d.label}
                  </option>
                ))}
              </Select>
            </Field>
          </div>

          <Field label="Skill">
            <Select
              value={skill}
              onChange={(e) => setSkill(e.target.value)}
              disabled={section === ''}
            >
              <option value="">Not set</option>
              {skillChoices.map((s) => (
                <option key={s.value} value={s.value}>
                  {s.label}
                </option>
              ))}
            </Select>
          </Field>

          <Field label="Difficulty" required>
            <Select
              value={difficulty}
              onChange={(e) => setDifficulty(e.target.value as Difficulty)}
            >
              {DIFFICULTIES.map((d) => (
                <option key={d.value} value={d.value}>
                  {d.label}
                </option>
              ))}
            </Select>
          </Field>

          <Field
            label="Why is it that level?"
            hint="Optional, but it is what makes a report explain an escalation rather than just report one."
          >
            <Textarea
              rows={2}
              value={rationale}
              onChange={(e) => setRationale(e.target.value)}
              placeholder="e.g. Two distractors are close synonyms, so it needs precise context reading."
            />
          </Field>
        </div>

        <div className="card card-pad">
          <div className="section-title">The question</div>

          <Field label="Passage or stimulus" hint="Optional — leave empty for a standalone question.">
            <Textarea
              rows={5}
              value={passage}
              onChange={(e) => setPassage(e.target.value)}
              placeholder="Paste the passage, notes, or poem the question refers to."
            />
          </Field>

          <Field
            label="Underlined sentence"
            hint="Optional — paste it exactly as it appears above, for “function of the underlined sentence”."
          >
            <Textarea
              rows={2}
              value={underline}
              onChange={(e) => setUnderline(e.target.value)}
              disabled={passage.trim().length === 0}
            />
          </Field>

          <Field
            label="Figure"
            hint="Optional. A diagram or chart, shown with the stimulus — for the maths items that are a picture rather than a paragraph."
          >
            <div className="figure-field">
              <input
                type="file"
                accept="image/*"
                disabled={uploading}
                onChange={(e) => {
                  const file = e.target.files?.[0]
                  if (file) void upload(file)
                }}
              />
              {uploading && <span className="muted">Uploading…</span>}
              {imageUrl && (
                <div className="figure-preview">
                  <img src={imageUrl} alt="The figure for this question" />
                  <button type="button" className="btn btn-ghost btn-sm" onClick={() => setImageUrl('')}>
                    Remove
                  </button>
                </div>
              )}
            </div>
          </Field>

          <Field label="Question" required>
            <Textarea
              rows={2}
              value={stem}
              onChange={(e) => setStem(e.target.value)}
              placeholder="Which choice completes the text with the most logical and precise word or phrase?"
              required
            />
          </Field>
        </div>

        <div className="card card-pad">
          <div className="section-title">Options and answer</div>
          <p className="opt-legend">
            Select the radio beside the correct option. Leave C or D blank for a shorter question.
          </p>

          {OPTION_LABELS.map((label) => (
            <div className="opt-row" key={label}>
              <label className={correct === label ? 'pick on' : 'pick'}>
                <input
                  type="radio"
                  name="correct"
                  value={label}
                  checked={correct === label}
                  onChange={() => setCorrect(label)}
                  aria-label={`Mark option ${label} correct`}
                />
                {label}
              </label>
              <Input
                value={options[label]}
                onChange={(e) => setOption(label, e.target.value)}
                placeholder={`Option ${label}`}
                aria-label={`Option ${label} text`}
              />
            </div>
          ))}

          <div style={{ marginTop: 18 }}>
            <Field label="Explanation" hint="Why the correct answer is correct. Shown to the student after the teacher reveals it.">
              <Textarea
                rows={3}
                value={explanation}
                onChange={(e) => setExplanation(e.target.value)}
              />
            </Field>
          </div>
        </div>

        {!editing && (
          <div className="card card-pad">
            <div className="section-title">Add it to a test</div>
            <Field label="Test" hint="Optional. It goes on the end of whichever test you pick.">
              <Select value={addTo} onChange={(e) => setAddTo(e.target.value)}>
                <option value="">Just the bank</option>
                {tests.map((t) => (
                  <option key={t.id} value={t.id}>
                    {t.title}
                  </option>
                ))}
                <option value="new">A new test…</option>
              </Select>
            </Field>
            {addTo === 'new' && (
              <Field label="Name the test" required>
                <Input
                  value={newTestName}
                  onChange={(e) => setNewTestName(e.target.value)}
                  placeholder="Algebra — week 3"
                />
              </Field>
            )}
          </div>
        )}

        <div style={{ display: 'flex', gap: 10, marginTop: 18 }}>
          <button type="submit" className="btn btn-primary" disabled={busy || uploading}>
            {busy ? 'Saving…' : editing ? 'Save changes' : 'Save question'}
          </button>
          <button
            type="button"
            className="btn btn-ghost"
            onClick={() => navigate('/questions')}
            disabled={busy}
          >
            Cancel
          </button>
        </div>
      </form>
    </div>
  )
}
