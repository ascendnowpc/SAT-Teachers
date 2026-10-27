import { useEffect, useMemo, useState } from 'react'
import { SECTIONS, skillsFor } from '../lib/constants'
import { sessionsSinceLastTest, type StudentProgress } from '../lib/progress'
import { loadCandidates, loadConfig } from '../lib/progressApi'
import { supabase } from '../lib/supabase'
import {
  buildSet,
  byLevel,
  chosenSet,
  describeSet,
  LEVEL_ORDER,
  levelCounts,
  seededRandom,
  type Candidate,
} from '../lib/targetedSet'
import type { Difficulty, Subject } from '../lib/types'
import { DifficultyBadge, Field, Input, Notice, Select } from './ui'

/**
 * What the teacher asks for when they book a targeted test (0061): the skill
 * first, then the questions on it, then the clocks.
 *
 * The questions are chosen one of two ways. **Choose them myself** lists every
 * question on the skill, by level, each with a box to tick — the start of its
 * passage under the stem, since a skill's stems are often word for word the
 * same. **Pick for me** draws a balanced set at random (lib/targetedSet:
 * easy → medium → hard, unseen before seen), and Pick again draws another.
 * Switching from a pick to choosing keeps the pick ticked, to adjust.
 *
 * This replaced a set built in printed order with a Swap menu under every
 * question, which made choosing a set ten menus long.
 */
export interface TargetedDraft {
  section: string
  /** Null: the whole section. */
  skill: string | null
  /** Ticked by the teacher, or drawn at random. */
  how: 'manual' | 'auto'
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
    how: 'manual',
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
  return d.how === 'manual' ? d.questions.length : d.size
}

/** What create_targeted_session would refuse, said before it is pressed. Null when it is ready. */
export function draftProblem(d: TargetedDraft): string | null {
  if (d.questions.length === 0)
    return d.how === 'manual'
      ? 'Tick the questions you want in the test.'
      : 'The set is empty — there are no questions on this skill to use.'
  const size = bookedSize(d)
  if (size < 1 || size > 20 || d.questions.length > 20) return 'A targeted test is 1 to 20 questions.'
  if (d.questionSeconds !== null && (d.questionSeconds < 10 || d.questionSeconds > 900))
    return 'A question’s clock is 10 to 900 seconds.'
  if (d.overallMinutes < 1 || d.overallMinutes > 180) return 'The whole test is 1 to 180 minutes.'
  return null
}

/** The most a set can hold (write_targeted_set). */
const MAX = 20

interface QuestionRow {
  id: string
  stem: string
  difficulty: Difficulty
  passage: string | null
}

const LEVEL_LABEL: Record<Difficulty, string> = { easy: 'Easy', medium: 'Medium', hard: 'Hard' }

/** The opening of a passage, on one line: enough to tell two "main idea" questions apart. */
function opening(passage: string | null): string | null {
  if (!passage) return null
  const flat = passage.replace(/\s+/g, ' ').trim()
  return flat.length > 150 ? `${flat.slice(0, 150).trimEnd()}…` : flat
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
            .select('id, stem, difficulty, passage')
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
    } else {
      const kept = chosenSet(draft.questions, candidates).map((c) => c.question_id)
      if (kept.join() !== draft.questions.join()) onChange({ ...draft, questions: kept })
    }
  }, [builtKey, loading, draft.how])

  const byId = useMemo(() => new Map(candidates.map((c) => [c.question_id, c])), [candidates])
  const set = draft.questions.map((id) => byId.get(id)).filter((c): c is Candidate => !!c)
  const counts = levelCounts(set)
  const since = progress ? sessionsSinceLastTest(progress, draft.section, draft.skill) : null
  const notes = describeSet(built)
  const levels = useMemo(() => byLevel(candidates), [candidates])
  const ticked = new Set(draft.questions)
  const full = ticked.size >= MAX

  function toggle(id: string) {
    const next = new Set(ticked)
    if (next.has(id)) next.delete(id)
    else next.add(id)
    const chosen = chosenSet(next, candidates)
    onChange({
      ...draft,
      questions: chosen.map((c) => c.question_id),
      // The server refuses a seen question unless repeats are allowed, and a
      // ticked one was ticked on purpose.
      allowRepeats: chosen.some((c) => c.seen),
    })
  }

  function setLevel(level: Difficulty, on: boolean) {
    const next = new Set(ticked)
    for (const c of levels[level]) {
      if (on && next.size >= MAX) break
      if (on) next.add(c.question_id)
      else next.delete(c.question_id)
    }
    const chosen = chosenSet(next, candidates)
    onChange({
      ...draft,
      questions: chosen.map((c) => c.question_id),
      allowRepeats: chosen.some((c) => c.seen),
    })
  }

  const summary = `${set.length} question${set.length === 1 ? '' : 's'} · ${counts.easy} easy, ${counts.medium} medium, ${counts.hard} hard`

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

      <div className="label targeted-how-label">The questions</div>
      <div className="mode-pick" role="group" aria-label="How the questions are chosen">
        <button
          type="button"
          className={`mode-opt ${draft.how === 'manual' ? 'on' : ''}`}
          aria-pressed={draft.how === 'manual'}
          onClick={() =>
            draft.how !== 'manual' &&
            onChange({
              ...draft,
              how: 'manual',
              // What was picked stays ticked, to adjust.
              allowRepeats: set.some((c) => c.seen),
            })
          }
        >
          <strong>Choose them myself</strong>
          <span className="mode-hint">Every question on the skill, with a box to tick.</span>
        </button>
        <button
          type="button"
          className={`mode-opt ${draft.how === 'auto' ? 'on' : ''}`}
          aria-pressed={draft.how === 'auto'}
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

      {draft.how === 'auto' && (
        <div className="grid-2">
          <Field label="How many" hint="The set may be shorter if the bank is.">
            <Input
              type="number"
              min={1}
              max={MAX}
              value={draft.size || ''}
              onChange={(e) =>
                onChange({ ...draft, size: Math.max(0, Number(e.target.value) || 0) })
              }
            />
          </Field>
          <label className="check targeted-repeats">
            <input
              type="checkbox"
              checked={draft.allowRepeats}
              onChange={(e) => onChange({ ...draft, allowRepeats: e.target.checked })}
            />{' '}
            Allow questions the student has seen before (unseen ones still come first)
          </label>
        </div>
      )}

      <div className="targeted-set-head">
        <div className="section-title">
          {draft.how === 'manual' ? `Ticked — ${summary}` : `The set — ${summary}`}
        </div>
        {draft.how === 'auto' ? (
          <button
            type="button"
            className="btn btn-ghost btn-sm"
            disabled={loading || candidates.length === 0}
            onClick={() => onChange({ ...draft, seed: newSeed() })}
          >
            Pick again
          </button>
        ) : (
          set.length > 0 && (
            <button
              type="button"
              className="btn btn-ghost btn-sm"
              onClick={() => onChange({ ...draft, questions: [], allowRepeats: false })}
            >
              Clear
            </button>
          )
        )}
      </div>

      {loading ? (
        <p className="muted">Reading the bank…</p>
      ) : candidates.length === 0 ? (
        <p className="muted">There are no questions on this {draft.skill ? 'skill' : 'section'} yet.</p>
      ) : draft.how === 'auto' ? (
        <>
          {notes.length > 0 && (
            <Notice kind="info">
              {notes.map((n) => (
                <div key={n}>{n}</div>
              ))}
            </Notice>
          )}
          <ol className="targeted-set">
            {set.map((c) => (
              <QuestionLine key={c.question_id} c={c} q={questions.get(c.question_id)} />
            ))}
          </ol>
        </>
      ) : (
        <div className="targeted-pick">
          {full && (
            <p className="field-hint">A targeted test is at most {MAX} questions.</p>
          )}
          {LEVEL_ORDER.map((level) =>
            levels[level].length === 0 ? null : (
              <section key={level} className="targeted-level">
                <div className="targeted-level-head">
                  <DifficultyBadge level={level} />
                  <span className="muted">
                    {levels[level].filter((c) => ticked.has(c.question_id)).length} of{' '}
                    {levels[level].length} ticked
                  </span>
                  <span className="spring" />
                  {levels[level].every((c) => ticked.has(c.question_id)) ? (
                    <button
                      type="button"
                      className="btn btn-ghost btn-sm"
                      onClick={() => setLevel(level, false)}
                    >
                      Untick all {LEVEL_LABEL[level].toLowerCase()}
                    </button>
                  ) : (
                    <button
                      type="button"
                      className="btn btn-ghost btn-sm"
                      disabled={full}
                      onClick={() => setLevel(level, true)}
                    >
                      Tick all {LEVEL_LABEL[level].toLowerCase()}
                    </button>
                  )}
                </div>
                <ul>
                  {levels[level].map((c) => {
                    const on = ticked.has(c.question_id)
                    return (
                      <li key={c.question_id} className={on ? 'on' : ''}>
                        <label>
                          <input
                            type="checkbox"
                            checked={on}
                            disabled={!on && full}
                            onChange={() => toggle(c.question_id)}
                          />
                          <QuestionText c={c} q={questions.get(c.question_id)} />
                        </label>
                      </li>
                    )
                  })}
                </ul>
              </section>
            ),
          )}
        </div>
      )}

      <div className="section-title" style={{ marginTop: 18 }}>
        Timing
      </div>
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
    </div>
  )
}

/** The stem, the start of the passage, and where the question comes from. */
function QuestionText({ c, q }: { c: Candidate; q: QuestionRow | undefined }) {
  const from = opening(q?.passage ?? null)
  return (
    <span className="targeted-q">
      <span className="stem">{q?.stem ?? '—'}</span>
      {from && <span className="passage">{from}</span>}
      <span className="meta">
        {c.source === 'practice' ? 'Practice pool' : `${LEVEL_LABEL[c.set_level ?? c.difficulty]} test, #${c.set_position}`}
        {c.seen && <span className="badge badge-neutral">Seen before</span>}
      </span>
    </span>
  )
}

function QuestionLine({ c, q }: { c: Candidate; q: QuestionRow | undefined }) {
  return (
    <li>
      <DifficultyBadge level={c.difficulty} />
      <QuestionText c={c} q={q} />
    </li>
  )
}
