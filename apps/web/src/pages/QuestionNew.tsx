import { useCallback, useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link, useNavigate, useParams, useSearchParams } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { Field, Input, Notice, Select, Textarea } from '../components/ui'
import {
  DIFFICULTIES,
  LEVELS,
  OPTION_LABELS,
  SECTIONS,
  SUBJECTS,
  levelLabel,
  skillsFor,
  subjectLabel,
} from '../lib/constants'
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
 * A NEW QUESTION IS ALWAYS WRITTEN INTO A TEST. The bank page used to carry an
 * Add question button of its own, which opened this form with nothing to file
 * the result into: the question was created, counted in the headline, and
 * shown on no screen in the product, because every screen that shows a
 * question shows it inside the test that holds it. Reaching this form without
 * a test is now the one thing it will not do — it offers the tests instead.
 *
 * Which test it is decides the subject and the level, so neither is asked for.
 * That is 0026's rule (an item in the easy test is easy), and it is what stops
 * the bank's counts and the tests from ever disagreeing again.
 * `create_question_in_set` writes the question and files it in one
 * transaction, so a failure on the way leaves nothing behind.
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

  // The test this question lives in. On the way in it is /questions/new?paper=
  // <id>, from that test's own Add question button; on an edit it is looked up
  // from the question. Either way it is where the subject and the level come
  // from, and without one there is nothing to write into.
  const [params] = useSearchParams()
  const paperId = params.get('paper')
  const [home, setHome] = useState<QuestionSet | null>(null)
  const [homeLoading, setHomeLoading] = useState(true)

  // Only for the screen shown when this form is reached with no test: the
  // tests themselves, so the answer to "where does it go" is one click.
  const [tests, setTests] = useState<QuestionSet[]>([])

  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  const [loading, setLoading] = useState(editing)

  // A test is one of the live level tests or it is not a test: filing into a
  // deactivated paper puts a question somewhere no session reads from, which
  // is the same dead end by a longer road.
  const runnable = useCallback(
    (s: QuestionSet | null): s is QuestionSet => Boolean(s && s.level && s.is_active),
    [],
  )

  useEffect(() => {
    // Editing reads the test off the question; the effect below does that.
    if (editing) return
    if (!paperId) {
      setHomeLoading(false)
      return
    }
    void supabase
      .from('question_sets')
      .select('*')
      .eq('id', paperId)
      .maybeSingle()
      .then(({ data }) => {
        const found = row<QuestionSet>(data)
        if (runnable(found)) {
          setHome(found)
          setSubject(found.subject)
          if (found.level) setDifficulty(found.level)
        }
        setHomeLoading(false)
      })
  }, [editing, paperId, runnable])

  // Which test holds the question being edited. The level is its test's, here
  // too — an item in the easy test is easy — so an edit cannot move a question
  // out of step with the test it is printed in.
  useEffect(() => {
    if (!editing || !id) return
    void supabase
      .from('question_set_items')
      .select('question_sets(*)')
      .eq('question_id', id)
      .then(({ data }) => {
        const held = rows<{ question_sets: QuestionSet | null }>(data)
          .map((r) => r.question_sets)
          .find(runnable)
        if (held) setHome(held)
        setHomeLoading(false)
      })
  }, [editing, id, runnable])

  // The chooser's list, loaded only when there is a choice to offer.
  useEffect(() => {
    if (editing || paperId) return
    void supabase
      .from('question_sets')
      .select('*')
      .not('level', 'is', null)
      .eq('is_active', true)
      .then(({ data }) => {
        setTests(
          [...rows<QuestionSet>(data)].sort(
            (a, b) =>
              SUBJECTS.findIndex((x) => x.value === a.subject) -
                SUBJECTS.findIndex((x) => x.value === b.subject) ||
              LEVELS.indexOf(a.level ?? 'easy') - LEVELS.indexOf(b.level ?? 'easy'),
          ),
        )
      })
  }, [editing, paperId])

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

  // The test decides both, wherever there is one, and the form shows them
  // rather than asking: reading them off `home` at the point of use means a
  // slow load of the question and a slow load of its test cannot race to
  // decide what gets saved.
  const effectiveSubject: Subject = home ? home.subject : subject
  const effectiveDifficulty: Difficulty = home?.level ?? difficulty

  const sectionChoices = useMemo(() => SECTIONS[effectiveSubject], [effectiveSubject])
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

    if (!editing && !home) {
      setError('Open the test this question belongs to and add it there.')
      return
    }

    setBusy(true)
    try {
      const shared = {
        p_section: section,
        p_passage: passage,
        p_stem: stem.trim(),
        p_difficulty_rationale: rationale,
        p_options: filled.map((l) => ({ label: l, body: options[l].trim() })),
        p_correct: correct,
        p_explanation: explanation,
        p_passage_underline: underline,
        p_skill: skill,
        p_image_url: imageUrl,
      }

      // Writing and filing are one call (0040), so a question cannot be
      // created and then fail to land in the test — which is how the bank
      // came to count a question no screen could show.
      const { error: rpcError } = editing
        ? await supabase.rpc('update_question', {
            p_question: id,
            p_subject: effectiveSubject,
            p_difficulty: effectiveDifficulty,
            ...shared,
          })
        : await supabase.rpc('create_question_in_set', { p_set: home!.id, ...shared })
      if (rpcError) throw new Error(rpcError.message)

      navigate(home ? `/tests/${home.id}` : '/questions')
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save the question.')
    } finally {
      setBusy(false)
    }
  }

  if (loading || homeLoading) return <div className="page">Loading…</div>

  // A new question with no test to go in. Not an error the teacher made — the
  // bank page used to offer exactly this — so it is answered rather than
  // refused: here are the tests, pick the one it belongs to.
  if (!editing && !home) {
    return (
      <div className="page">
        <Link className="back-link" to="/questions">
          <IconBack /> Question bank
        </Link>

        <div className="page-head">
          <div>
            <h1>New question</h1>
            <p className="sub">
              A question is written inside the test that holds it. Pick the test and the form opens
              on it.
            </p>
          </div>
        </div>

        <div className="card card-pad">
          {tests.length === 0 ? (
            <div className="empty">
              <h3>No tests loaded</h3>
              <p>The content migrations have not been run against this database.</p>
            </div>
          ) : (
            <div className="pick-test">
              {tests.map((t) => (
                <Link key={t.id} className="btn" to={`/questions/new?paper=${t.id}`}>
                  {t.title}
                </Link>
              ))}
            </div>
          )}
        </div>
      </div>
    )
  }

  return (
    <div className="page">
      <Link className="back-link" to={home ? `/tests/${home.id}` : '/questions'}>
        <IconBack /> {home ? home.title : 'Question bank'}
      </Link>

      <div className="page-head">
        <div>
          <h1>{editing ? 'Edit question' : 'New question'}</h1>
          <p className="sub">
            {editing
              ? 'The answer key is visible to teachers only.'
              : `It goes on the end of ${home!.title}.`}
          </p>
        </div>
      </div>

      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <div className="card card-pad">
          <div className="section-title">Classification</div>

          <div className="grid-2">
            <Field
              label="Subject"
              required
              hint={home ? `From ${home.title}.` : undefined}
            >
              {home ? (
                <Input readOnly value={subjectLabel(home.subject)} />
              ) : (
                <Select value={subject} onChange={(e) => onSubjectChange(e.target.value as Subject)}>
                  {SUBJECTS.map((s) => (
                    <option key={s.value} value={s.value}>
                      {s.label}
                    </option>
                  ))}
                </Select>
              )}
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

          <Field
            label="Difficulty"
            required
            hint={
              home
                ? `An item in the ${levelLabel(home.level!).toLowerCase()} test is ${home.level}. Move it to another test to change this.`
                : undefined
            }
          >
            {home ? (
              <Input readOnly value={levelLabel(home.level!)} />
            ) : (
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
            )}
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

        <div style={{ display: 'flex', gap: 10, marginTop: 18 }}>
          <button type="submit" className="btn btn-primary" disabled={busy || uploading}>
            {busy ? 'Saving…' : editing ? 'Save changes' : 'Save question'}
          </button>
          <button
            type="button"
            className="btn btn-ghost"
            onClick={() => navigate(home ? `/tests/${home.id}` : '/questions')}
            disabled={busy}
          >
            Cancel
          </button>
        </div>
      </form>
    </div>
  )
}
