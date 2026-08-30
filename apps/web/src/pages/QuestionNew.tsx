import { useMemo, useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { Field, Input, Notice, Select, Textarea } from '../components/ui'
import { DIFFICULTIES, OPTION_LABELS, SECTIONS, SUBJECTS } from '../lib/constants'
import { supabase } from '../lib/supabase'
import type { Difficulty, OptionLabel, Subject } from '../lib/types'

export function QuestionNew() {
  const navigate = useNavigate()

  const [subject, setSubject] = useState<Subject>('english')
  const [section, setSection] = useState('')
  const [passage, setPassage] = useState('')
  const [underline, setUnderline] = useState('')
  const [stem, setStem] = useState('')
  const [difficulty, setDifficulty] = useState<Difficulty>('medium')
  const [rationale, setRationale] = useState('')
  const [options, setOptions] = useState<Record<OptionLabel, string>>({ A: '', B: '', C: '', D: '' })
  const [correct, setCorrect] = useState<OptionLabel>('A')
  const [explanation, setExplanation] = useState('')

  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  const sectionChoices = useMemo(() => SECTIONS[subject], [subject])

  function setOption(label: OptionLabel, value: string) {
    setOptions((prev) => ({ ...prev, [label]: value }))
  }

  function onSubjectChange(next: Subject) {
    setSubject(next)
    setSection('') // sections are subject-specific, so the old pick is invalid
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
      const { data, error: rpcError } = await supabase.rpc('create_question', {
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
      })
      if (rpcError) throw new Error(rpcError.message)
      navigate(`/questions?added=${data as string}`)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not save the question.')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className="page">
      <Link className="back-link" to="/questions">
        <IconBack /> Question bank
      </Link>

      <div className="page-head">
        <div>
          <h1>New question</h1>
          <p className="sub">Text-only multiple choice. The answer key is visible to teachers only.</p>
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
              <Select value={section} onChange={(e) => setSection(e.target.value)}>
                <option value="">Not set</option>
                {sectionChoices.map((d) => (
                  <option key={d.value} value={d.value}>
                    {d.label}
                  </option>
                ))}
              </Select>
            </Field>
          </div>

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
          <button type="submit" className="btn btn-primary" disabled={busy}>
            {busy ? 'Saving…' : 'Save question'}
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
