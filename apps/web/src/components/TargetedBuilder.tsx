import { useEffect, useMemo, useState } from 'react'
import { SECTIONS, skillsFor } from '../lib/constants'
import { sessionsSinceLastTest, type StudentProgress } from '../lib/progress'
import { loadCandidates, loadConfig } from '../lib/progressApi'
import { supabase } from '../lib/supabase'
import {
  buildSet,
  describeSet,
  levelCounts,
  swapAt,
  swapOptions,
  type Candidate,
} from '../lib/targetedSet'
import type { Difficulty, Subject } from '../lib/types'
import { DifficultyBadge, Field, Input, Notice, Select } from './ui'

/**
 * What the teacher asks for when they book a targeted test (0061): the skill,
 * the size, the clocks, whether a question the student has seen may come back
 * — and the set itself, built by lib/targetedSet from targeted_candidates and
 * theirs to swap question by question before it is booked.
 */
export interface TargetedDraft {
  section: string
  /** Null: the whole section. */
  skill: string | null
  size: number
  /** One clock for every question; null — each question's own target time. */
  questionSeconds: number | null
  overallMinutes: number
  allowRepeats: boolean
  /** The set, in the order it will be sat. */
  questions: string[]
}

export function emptyDraft(subject: Subject): TargetedDraft {
  return {
    section: SECTIONS[subject][0].value,
    skill: null,
    size: 0,
    questionSeconds: null,
    overallMinutes: 15,
    allowRepeats: false,
    questions: [],
  }
}

/** What create_targeted_session would refuse, said before it is pressed. Null when it is ready. */
export function draftProblem(d: TargetedDraft): string | null {
  if (d.questions.length === 0)
    return 'The set is empty — there are no questions on this skill to use.'
  if (d.size < 1 || d.size > 20) return 'A targeted test is 1 to 20 questions.'
  if (d.questionSeconds !== null && (d.questionSeconds < 10 || d.questionSeconds > 900))
    return 'A question’s clock is 10 to 900 seconds.'
  if (d.overallMinutes < 1 || d.overallMinutes > 180) return 'The whole test is 1 to 180 minutes.'
  return null
}

interface QuestionRow {
  id: string
  stem: string
  difficulty: Difficulty
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
  const [questions, setQuestions] = useState<Map<string, QuestionRow>>(new Map())
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

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
            .select('id, stem, difficulty')
            .in('id', ids)
          if (!active) return
          setQuestions(new Map(((data ?? []) as QuestionRow[]).map((q) => [q.id, q])))
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
    () => buildSet(candidates, draft.size, { allowRepeats: draft.allowRepeats }),
    [candidates, draft.size, draft.allowRepeats],
  )

  // A new skill, size or repeat rule rebuilds the set; a swap does not.
  const builtKey = built.questions.map((c) => c.question_id).join(',')
  useEffect(() => {
    if (loading) return
    onChange({ ...draft, questions: built.questions.map((c) => c.question_id) })
  }, [builtKey, loading])

  const byId = useMemo(() => new Map(candidates.map((c) => [c.question_id, c])), [candidates])
  const set = draft.questions.map((id) => byId.get(id)).filter((c): c is Candidate => !!c)
  const counts = levelCounts(set)
  const since = progress ? sessionsSinceLastTest(progress, draft.section, draft.skill) : null
  const notes = describeSet(built)

  return (
    <div className="targeted-builder">
      <div className="grid-2">
        <Field label="Section" required>
          <Select
            value={draft.section}
            onChange={(e) => onChange({ ...draft, section: e.target.value, skill: null })}
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
            onChange={(e) => onChange({ ...draft, skill: e.target.value || null })}
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

      <div className="grid-2">
        <Field
          label="Questions"
          hint="Easy → medium → hard. The set may be shorter if the bank is."
        >
          <Input
            type="number"
            min={1}
            max={20}
            value={draft.size || ''}
            onChange={(e) => onChange({ ...draft, size: Math.max(0, Number(e.target.value) || 0) })}
          />
        </Field>
        <Field label="The whole test (minutes)">
          <Input
            type="number"
            min={1}
            max={180}
            value={draft.overallMinutes}
            onChange={(e) => onChange({ ...draft, overallMinutes: Number(e.target.value) || 0 })}
          />
        </Field>
      </div>

      <div className="grid-2">
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
        {draft.questionSeconds !== null && (
          <Field label="Seconds a question">
            <Input
              type="number"
              min={10}
              max={900}
              value={draft.questionSeconds}
              onChange={(e) => onChange({ ...draft, questionSeconds: Number(e.target.value) || 0 })}
            />
          </Field>
        )}
      </div>

      <label className="check">
        <input
          type="checkbox"
          checked={draft.allowRepeats}
          onChange={(e) => onChange({ ...draft, allowRepeats: e.target.checked })}
        />{' '}
        Allow questions the student has seen before (unseen ones still come first)
      </label>

      {error && <Notice kind="error">{error}</Notice>}

      <div className="section-title" style={{ marginTop: 16 }}>
        The set — {set.length} of {draft.size} · {counts.easy} easy, {counts.medium} medium,{' '}
        {counts.hard} hard
      </div>
      {loading ? (
        <p className="muted">Reading the bank…</p>
      ) : (
        <>
          {notes.length > 0 && (
            <Notice kind="info">
              {notes.map((n) => (
                <div key={n}>{n}</div>
              ))}
            </Notice>
          )}
          <ol className="targeted-set">
            {draft.questions.map((id, position) => {
              const c = byId.get(id)
              const q = questions.get(id)
              const offers = swapOptions(draft.questions, candidates, position, {
                allowRepeats: draft.allowRepeats,
              })
              return (
                <li key={id}>
                  {c && <DifficultyBadge level={c.difficulty} />}
                  <span className="stem">{q?.stem ?? '—'}</span>
                  <span className="muted">
                    {c?.source === 'practice'
                      ? 'pool'
                      : `${c?.set_level} test, #${c?.set_position}`}
                    {c?.seen ? ' · seen before' : ''}
                  </span>
                  {offers.length > 0 && (
                    <Select
                      aria-label="Swap this question"
                      value=""
                      onChange={(e) =>
                        e.target.value &&
                        onChange({
                          ...draft,
                          questions: swapAt(draft.questions, candidates, position, e.target.value),
                        })
                      }
                    >
                      <option value="">Swap…</option>
                      {offers.map((o) => (
                        <option key={o.question_id} value={o.question_id}>
                          {o.difficulty} · {(questions.get(o.question_id)?.stem ?? '').slice(0, 60)}
                          {o.seen ? ' (seen)' : ''}
                        </option>
                      ))}
                    </Select>
                  )}
                </li>
              )
            })}
          </ol>
        </>
      )}
    </div>
  )
}
