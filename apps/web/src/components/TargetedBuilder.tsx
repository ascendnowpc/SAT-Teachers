import { useEffect, useMemo, useState } from 'react'
import { SECTIONS, sectionLabel, skillLabel, skillsFor } from '../lib/constants'
import { sessionsSinceLastTest, type StudentProgress } from '../lib/progress'
import { loadCandidates, loadConfig } from '../lib/progressApi'
import { rows, supabase } from '../lib/supabase'
import {
  buildSet,
  chosenSet,
  describeSet,
  levelCounts,
  seededRandom,
  type Candidate,
} from '../lib/targetedSet'
import type { Question, Subject } from '../lib/types'
import { MathText } from './MathText'
import { MAX_SET, TargetedPicker, whereFrom } from './TargetedPicker'
import { DifficultyBadge, Field, Input, Notice, Select } from './ui'

/**
 * What the teacher asks for when they book a targeted test (0061): the skill
 * first, then how the questions are chosen, then the clocks.
 *
 * Neither way is chosen until the teacher picks one. **Choose them myself**
 * opens the questions on the skill in a pop-up (TargetedPicker) to tick;
 * **Pick for me** draws a balanced set at random (lib/targetedSet: easy →
 * medium → hard, unseen before seen), and Pick again draws another. Either
 * way the form then shows the set as a short numbered list, with Edit to open
 * the pop-up on it — a pick edited by hand becomes a set chosen by hand.
 *
 * The questions used to be listed down the form itself, fifty boxes deep on a
 * well-stocked skill, and before that a Swap menu under every question.
 */
export interface TargetedDraft {
  section: string
  /** Null: the whole section. */
  skill: string | null
  /** Ticked by the teacher, drawn at random, or not chosen yet. */
  how: 'manual' | 'auto' | null
  /** Pick for me: how many to draw. A ticked set is as long as what is ticked. */
  size: number
  /** Pick for me: the draw. Pick again is a new one. */
  seed: number
  /** One clock for every question; null — each question's own target time. */
  questionSeconds: number | null
  overallMinutes: number
  /**
   * Pick for me: whether a question the student has seen may be drawn. A
   * ticked set allows it exactly when a ticked question was seen.
   */
  allowRepeats: boolean
  /** The set, in the order it will be sat. */
  questions: string[]
}

const newSeed = () => Math.floor(Math.random() * 2 ** 31)

export function emptyDraft(subject: Subject): TargetedDraft {
  return {
    section: SECTIONS[subject][0].value,
    skill: null,
    how: null,
    size: 0,
    seed: newSeed(),
    questionSeconds: null,
    overallMinutes: 15,
    allowRepeats: false,
    questions: [],
  }
}

/** The size the test is booked with: what was asked for, or what was ticked. */
export function bookedSize(d: TargetedDraft): number {
  return d.how === 'auto' ? d.size : d.questions.length
}

/** What create_targeted_session would refuse, said before it is pressed. Null when it is ready. */
export function draftProblem(d: TargetedDraft): string | null {
  if (d.how === null) return 'Choose how the questions are picked.'
  if (d.questions.length === 0)
    return d.how === 'manual'
      ? 'Choose the questions for the test.'
      : 'The set is empty — there are no questions on this skill to use.'
  const size = bookedSize(d)
  if (size < 1 || size > MAX_SET || d.questions.length > MAX_SET)
    return `A targeted test is 1 to ${MAX_SET} questions.`
  if (d.questionSeconds !== null && (d.questionSeconds < 10 || d.questionSeconds > 900))
    return 'A question’s clock is 10 to 900 seconds.'
  if (d.overallMinutes < 1 || d.overallMinutes > 180) return 'The whole test is 1 to 180 minutes.'
  return null
}

export function TargetedBuilder({
  studentId,
  subject,
  draft,
  onChange,
  progress,
}: {
  studentId: string
  subject: Subject
  draft: TargetedDraft
  onChange: (d: TargetedDraft) => void
  /** The student's progress, for "N sessions since the last test on this skill". */
  progress: StudentProgress | null
}) {
  const [candidates, setCandidates] = useState<Candidate[]>([])
  const [questions, setQuestions] = useState<Map<string, Question>>(new Map())
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [picking, setPicking] = useState(false)

  // The admin's default size, once per subject, when nothing has been chosen.
  useEffect(() => {
    if (draft.size > 0) return
    let active = true
    void loadConfig(subject).then((cfg) => {
      if (active) onChange({ ...draft, size: cfg.default_set_size })
    })
    return () => {
      active = false
    }
  }, [subject, draft.size])

  // The questions themselves too, without their keys: the pop-up shows each
  // one the way the student will see it.
  useEffect(() => {
    let active = true
    setLoading(true)
    void loadCandidates(studentId, subject, draft.section, draft.skill).then(
      async ({ candidates: list, error: err }) => {
        if (!active) return
        setError(err)
        setCandidates(list)
        const ids = list.map((c) => c.question_id)
        if (ids.length) {
          const { data } = await supabase
            .from('questions')
            .select('*, question_options(*)')
            .in('id', ids)
          if (!active) return
          setQuestions(new Map(rows<Question>(data).map((q) => [q.id, q])))
        } else {
          setQuestions(new Map())
        }
        setLoading(false)
      },
    )
    return () => {
      active = false
    }
  }, [studentId, subject, draft.section, draft.skill])

  const built = useMemo(
    () =>
      buildSet(candidates, draft.size, {
        allowRepeats: draft.allowRepeats,
        random: seededRandom(draft.seed),
      }),
    [candidates, draft.size, draft.allowRepeats, draft.seed],
  )

  // Picked for them: a new skill, size, rule or draw is a new set. Ticked:
  // only what is on this skill stays ticked.
  const builtKey = built.questions.map((c) => c.question_id).join(',')
  useEffect(() => {
    if (loading) return
    if (draft.how === 'auto') {
      onChange({ ...draft, questions: built.questions.map((c) => c.question_id) })
    } else if (draft.how === 'manual') {
      const kept = chosenSet(draft.questions, candidates).map((c) => c.question_id)
      if (kept.join() !== draft.questions.join()) onChange({ ...draft, questions: kept })
    }
  }, [builtKey, loading, draft.how])

  const byId = useMemo(() => new Map(candidates.map((c) => [c.question_id, c])), [candidates])
  const set = draft.questions.map((id) => byId.get(id)).filter((c): c is Candidate => !!c)
  const since = progress ? sessionsSinceLastTest(progress, draft.section, draft.skill) : null
  const notes = describeSet(built)
  const on = draft.skill ? skillLabel(draft.skill) : `${sectionLabel(draft.section)} — whole section`

  function applyTicked(ids: string[]) {
    const chosen = chosenSet(ids, candidates)
    onChange({
      ...draft,
      how: 'manual',
      questions: chosen.map((c) => c.question_id),
      // The server refuses a seen question unless repeats are allowed, and a
      // ticked one was ticked on purpose.
      allowRepeats: chosen.some((c) => c.seen),
    })
    setPicking(false)
  }

  return (
    <div className="targeted-builder">
      <div className="grid-2">
        <Field label="Section" required>
          <Select
            value={draft.section}
            onChange={(e) =>
              onChange({ ...draft, section: e.target.value, skill: null, questions: [] })
            }
          >
            {SECTIONS[subject].map((s) => (
              <option key={s.value} value={s.value}>
                {s.label}
              </option>
            ))}
          </Select>
        </Field>
        <Field
          label="Skill"
          hint={
            since === null
              ? undefined
              : `${since} session${since === 1 ? '' : 's'} since the last test on this ${draft.skill ? 'skill' : 'section'}`
          }
        >
          <Select
            value={draft.skill ?? ''}
            onChange={(e) => onChange({ ...draft, skill: e.target.value || null, questions: [] })}
          >
            <option value="">The whole section</option>
            {skillsFor(draft.section).map((s) => (
              <option key={s.value} value={s.value}>
                {s.label}
              </option>
            ))}
          </Select>
        </Field>
      </div>

      <div className="targeted-how-label">
        The questions
        <span className="muted">
          {loading
            ? ' · reading the bank…'
            : ` · ${candidates.length} on ${draft.skill ? 'this skill' : 'this section'}`}
        </span>
      </div>
      <div className="mode-pick" role="group" aria-label="How the questions are chosen">
        <button
          type="button"
          className={`mode-opt ${draft.how === 'manual' ? 'on' : ''}`}
          aria-pressed={draft.how === 'manual'}
          disabled={loading || candidates.length === 0}
          onClick={() => setPicking(true)}
        >
          <strong>Choose them myself</strong>
          <span className="mode-hint">Read each question and tick the ones you want.</span>
        </button>
        <button
          type="button"
          className={`mode-opt ${draft.how === 'auto' ? 'on' : ''}`}
          aria-pressed={draft.how === 'auto'}
          disabled={loading || candidates.length === 0}
          onClick={() =>
            draft.how !== 'auto' &&
            onChange({ ...draft, how: 'auto', allowRepeats: false, seed: newSeed() })
          }
        >
          <strong>Pick for me</strong>
          <span className="mode-hint">A balanced mix at random, easy → hard, unseen first.</span>
        </button>
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {!loading && candidates.length === 0 && !error && (
        <p className="field-hint">
          There are no questions on this {draft.skill ? 'skill' : 'section'} yet. Choose another,
          or add some to the practice pool.
        </p>
      )}

      {draft.how === 'auto' && (
        <div className="targeted-auto">
          <label className="targeted-auto-size">
            How many
            <Input
              type="number"
              min={1}
              max={MAX_SET}
              value={draft.size || ''}
              onChange={(e) =>
                onChange({ ...draft, size: Math.max(0, Number(e.target.value) || 0) })
              }
            />
          </label>
          <label className="check">
            <input
              type="checkbox"
              checked={draft.allowRepeats}
              onChange={(e) => onChange({ ...draft, allowRepeats: e.target.checked })}
            />{' '}
            Include questions they have seen (unseen still come first)
          </label>
        </div>
      )}

      {draft.how !== null && !loading && (
        <ChosenSet
          set={set}
          questions={questions}
          notes={draft.how === 'auto' ? notes : []}
          onEdit={() => setPicking(true)}
          onPickAgain={
            draft.how === 'auto' ? () => onChange({ ...draft, seed: newSeed() }) : undefined
          }
        />
      )}

      <div className="section-title targeted-timing">Timing</div>
      <div className="grid-2">
        <Field label="The whole test (minutes)">
          <Input
            type="number"
            min={1}
            max={180}
            value={draft.overallMinutes}
            onChange={(e) => onChange({ ...draft, overallMinutes: Number(e.target.value) || 0 })}
          />
        </Field>
        <Field label="Each question’s clock">
          <Select
            value={draft.questionSeconds === null ? 'own' : 'fixed'}
            onChange={(e) =>
              onChange({ ...draft, questionSeconds: e.target.value === 'own' ? null : 75 })
            }
          >
            <option value="own">Each question’s own target time</option>
            <option value="fixed">The same for every question</option>
          </Select>
        </Field>
      </div>
      {draft.questionSeconds !== null && (
        <div className="grid-2">
          <Field label="Seconds a question">
            <Input
              type="number"
              min={10}
              max={900}
              value={draft.questionSeconds}
              onChange={(e) => onChange({ ...draft, questionSeconds: Number(e.target.value) || 0 })}
            />
          </Field>
        </div>
      )}

      {picking && (
        <TargetedPicker
          candidates={candidates}
          questions={questions}
          initial={draft.questions}
          title={on ?? ''}
          onUse={applyTicked}
          onClose={() => setPicking(false)}
        />
      )}
    </div>
  )
}

/**
 * The set, as the form shows it once it is chosen: how many and how they
 * split by level, then one line a question in the order they are sat.
 */
function ChosenSet({
  set,
  questions,
  notes,
  onEdit,
  onPickAgain,
}: {
  set: Candidate[]
  questions: Map<string, Question>
  /** What the draw could not balance. */
  notes: string[]
  onEdit: () => void
  /** Only for a set picked at random. */
  onPickAgain?: () => void
}) {
  const counts = levelCounts(set)

  if (set.length === 0) {
    return (
      <div className="chosen-empty">
        <p>No questions chosen yet.</p>
        <button type="button" className="btn btn-primary btn-sm" onClick={onEdit}>
          Choose questions
        </button>
      </div>
    )
  }

  return (
    <div className="chosen">
      <div className="chosen-head">
        <div>
          <div className="chosen-count">
            {set.length} question{set.length === 1 ? '' : 's'}
          </div>
          <div className="chosen-mix">
            {(['easy', 'medium', 'hard'] as const).map((l) =>
              counts[l] > 0 ? (
                <span key={l} className={`badge badge-${l}`}>
                  {counts[l]} {l}
                </span>
              ) : null,
            )}
          </div>
        </div>
        <span className="spring" />
        {onPickAgain && (
          <button type="button" className="btn btn-ghost btn-sm" onClick={onPickAgain}>
            Pick again
          </button>
        )}
        <button type="button" className="btn btn-ghost btn-sm" onClick={onEdit}>
          {onPickAgain ? 'Change by hand' : 'Edit'}
        </button>
      </div>

      {notes.length > 0 && (
        <Notice kind="info">
          {notes.map((n) => (
            <div key={n}>{n}</div>
          ))}
        </Notice>
      )}

      <ol className="chosen-list">
        {set.map((c, i) => {
          const q = questions.get(c.question_id)
          return (
            <li key={c.question_id}>
              <span className="chosen-n">{i + 1}</span>
              <span className="chosen-text">
                <span className="chosen-stem">
                  <MathText text={q?.stem ?? '—'} math={q?.subject === 'mathematics'} />
                </span>
                <span className="chosen-from">{whereFrom(c)}</span>
              </span>
              <DifficultyBadge level={c.difficulty} />
            </li>
          )
        })}
      </ol>
    </div>
  )
}
