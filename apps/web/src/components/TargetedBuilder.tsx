import { useEffect, useMemo, useState } from 'react'
import { SECTIONS, sectionLabel, skillLabel, skillList, skillsFor } from '../lib/constants'
import { sessionsSinceLastTest, type StudentProgress } from '../lib/progress'
import { loadCandidates, loadConfig } from '../lib/progressApi'
import { rows, supabase } from '../lib/supabase'
import {
  bareSkills,
  draftIsOn,
  draftOnLabel,
  newSeed,
  overallMinutesOf,
  withSet,
  type TargetedDraft,
} from '../lib/targetedDraft'
import {
  buildSet,
  buildSkillsSet,
  chosenSet,
  describeSet,
  describeSkillsSet,
  levelCounts,
  MAX_SET,
  seededRandom,
  type Candidate,
} from '../lib/targetedSet'
import type { Question, Subject } from '../lib/types'
import { MathText } from './MathText'
import { TargetedPicker, whereFrom } from './TargetedPicker'
import { DifficultyBadge, Field, Input, Notice, Select } from './ui'

// The draft's rules live in lib/targetedDraft, where they are tested; the
// booking page reads them from here, beside the form they belong to.
export {
  bookedSize,
  draftProblem,
  emptyDraft,
  overallMinutesOf,
  type TargetedDraft,
} from '../lib/targetedDraft'

/**
 * What the teacher asks for when they book a targeted test (0061): what it is
 * on first, then how the questions are chosen, then the clocks.
 *
 * It is on one skill, on several from any section (0086), or on a whole
 * section. Nothing is chosen until the teacher ticks something: a skill's
 * box, or a section's Whole section.
 *
 * Neither way of choosing the questions is chosen until the teacher picks one.
 * **Choose them myself** opens the questions on the skills in a pop-up
 * (TargetedPicker) to tick; **Pick for me** draws a balanced set at random
 * (lib/targetedSet: easy → medium → hard, unseen before seen — and on several
 * skills, an even share each), and Pick again draws another. Either way the
 * form then shows the set as a short numbered list, with Edit to open the
 * pop-up on it — a pick edited by hand becomes a set chosen by hand.
 */
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
  const onKey = `${draft.section ?? ''}|${draft.skills.join(',')}`
  useEffect(() => {
    if (!draftIsOn(draft)) {
      setCandidates([])
      setQuestions(new Map())
      setError(null)
      setLoading(false)
      return
    }
    let active = true
    setLoading(true)
    void loadCandidates(studentId, subject, draft.section, draft.skills).then(
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
  }, [studentId, subject, onKey])

  const several = draft.skills.length > 1
  const built = useMemo(() => {
    const options = { allowRepeats: draft.allowRepeats, random: seededRandom(draft.seed) }
    if (several) {
      const b = buildSkillsSet(candidates, draft.skills, draft.size, options)
      return { questions: b.questions, notes: describeSkillsSet(b, (k) => skillLabel(k) ?? k) }
    }
    const b = buildSet(candidates, draft.size, options)
    return { questions: b.questions, notes: describeSet(b) }
  }, [candidates, several, draft.skills.join(','), draft.size, draft.allowRepeats, draft.seed])

  // Picked for them: a new choice of skills, size, rule or draw is a new set.
  // Ticked: only what is on the chosen skills stays ticked.
  const builtKey = built.questions.map((c) => c.question_id).join(',')
  useEffect(() => {
    if (loading) return
    if (draft.how === 'auto') {
      onChange(withSet(draft, built.questions))
    } else if (draft.how === 'manual') {
      const kept = chosenSet(draft.questions, candidates)
      if (kept.map((c) => c.question_id).join() !== draft.questions.join())
        onChange(withSet(draft, kept))
    }
  }, [builtKey, loading, draft.how])

  const byId = useMemo(() => new Map(candidates.map((c) => [c.question_id, c])), [candidates])
  const set = draft.questions.map((id) => byId.get(id)).filter((c): c is Candidate => !!c)
  const what = several ? 'these skills' : draft.skills.length === 1 ? 'this skill' : 'this section'
  const bare = bareSkills(draft)

  function choose(on: Pick<TargetedDraft, 'section' | 'skills'>) {
    // A new choice is a new set: nothing ticked carries over until the
    // questions are read again, and a pick is drawn afresh.
    onChange({ ...draft, ...on, questions: [], asks: [] })
  }

  function applyTicked(ids: string[]) {
    const chosen = chosenSet(ids, candidates)
    onChange({
      ...withSet(draft, chosen),
      how: 'manual',
      // The server refuses a seen question unless repeats are allowed, and a
      // ticked one was ticked on purpose.
      allowRepeats: chosen.some((c) => c.seen),
    })
    setPicking(false)
  }

  return (
    <div className="targeted-builder">
      <SkillChooser
        subject={subject}
        section={draft.section}
        skills={draft.skills}
        progress={progress}
        onChange={choose}
      />

      <div className="targeted-how-label">
        The questions
        <span className="muted">
          {!draftIsOn(draft)
            ? ' · choose what the test is on first'
            : loading
              ? ' · reading the bank…'
              : ` · ${candidates.length} on ${what}`}
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
          <span className="mode-hint">
            {several
              ? 'An even share of each skill at random, easy → hard, unseen first.'
              : 'A balanced mix at random, easy → hard, unseen first.'}
          </span>
        </button>
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {draftIsOn(draft) && !loading && candidates.length === 0 && !error && (
        <p className="field-hint">
          There are no questions on {what} yet. Choose another, or add some to the practice pool.
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

      {draft.how !== null && !loading && draftIsOn(draft) && (
        <ChosenSet
          set={set}
          questions={questions}
          several={several}
          notes={draft.how === 'auto' ? built.notes : []}
          bare={draft.questions.length > 0 ? bare : []}
          onEdit={() => setPicking(true)}
          onPickAgain={
            draft.how === 'auto' ? () => onChange({ ...draft, seed: newSeed() }) : undefined
          }
        />
      )}

      <div className="section-title targeted-timing">Timing</div>
      <div className="grid-2">
        <Field
          label="The whole test (minutes)"
          hint={draft.overallAuto ? 'Follows the questions: their clocks, and a minute to spare.' : undefined}
        >
          <Input
            type="number"
            min={1}
            max={180}
            value={overallMinutesOf(draft)}
            onChange={(e) =>
              onChange({ ...draft, overallMinutes: Number(e.target.value) || 0, overallAuto: false })
            }
          />
        </Field>
        <Field label="Each question’s clock">
          <Select
            value={draft.questionSeconds === null ? 'own' : 'fixed'}
            onChange={(e) =>
              onChange({ ...draft, questionSeconds: e.target.value === 'own' ? null : 60 })
            }
          >
            <option value="fixed">The same for every question</option>
            <option value="own">Each question’s own target time</option>
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
          title={draftOnLabel(draft)}
          skills={draft.skills}
          onUse={applyTicked}
          onClose={() => setPicking(false)}
        />
      )}
    </div>
  )
}

/**
 * What the test is on: every section of the subject with its skills, a box
 * for each skill and a Whole section button for each section. Ticking skills
 * makes a test on them — from any section, in the order ticked; Whole section
 * makes a test on all of one section and clears the ticks, and ticking a skill
 * after it clears the section.
 */
function SkillChooser({
  subject,
  section,
  skills,
  progress,
  onChange,
}: {
  subject: Subject
  section: string | null
  skills: string[]
  progress: StudentProgress | null
  onChange: (on: Pick<TargetedDraft, 'section' | 'skills'>) => void
}) {
  const since = (sec: string, skill: string | null) => {
    if (!progress) return null
    const n = sessionsSinceLastTest(progress, sec, skill)
    return n === null ? null : `${n} session${n === 1 ? '' : 's'} since its last test`
  }

  function toggle(skill: string) {
    const next = skills.includes(skill) ? skills.filter((k) => k !== skill) : [...skills, skill]
    onChange({ section: null, skills: next })
  }

  return (
    <Field
      label="What it is on"
      required
      hint={
        skills.length > 0 || section
          ? `On ${skills.length > 0 ? skillList(skills) : `the whole of ${sectionLabel(section)}`}.`
          : 'Tick a skill, several from any section, or a whole section.'
      }
    >
      <div className="skill-choose">
        {SECTIONS[subject].map((sec) => {
          const whole = section === sec.value && skills.length === 0
          const wholeSince = since(sec.value, null)
          return (
            <div
              key={sec.value}
              role="group"
              aria-labelledby={`skills-${sec.value}`}
              className={`skill-group ${whole ? 'on' : ''}`}
            >
              <div className="skill-group-head">
                <span id={`skills-${sec.value}`}>{sec.label}</span>
                <button
                  type="button"
                  className={`chip-btn ${whole ? 'on' : ''}`}
                  aria-pressed={whole}
                  title={wholeSince ?? undefined}
                  onClick={() =>
                    onChange(whole ? { section: null, skills: [] } : { section: sec.value, skills: [] })
                  }
                >
                  Whole section
                </button>
              </div>
              {skillsFor(sec.value).map((sk) => {
                const hint = since(sec.value, sk.value)
                return (
                  <label key={sk.value} className="check skill-check">
                    <input
                      type="checkbox"
                      checked={skills.includes(sk.value)}
                      onChange={() => toggle(sk.value)}
                    />
                    <span>
                      {sk.label}
                      {hint && <span className="muted"> · {hint}</span>}
                    </span>
                  </label>
                )
              })}
            </div>
          )
        })}
      </div>
    </Field>
  )
}

/**
 * The set, as the form shows it once it is chosen: how many and how they
 * split by level (and by skill, on several), then one line a question in the
 * order they are sat.
 */
function ChosenSet({
  set,
  questions,
  several,
  notes,
  bare,
  onEdit,
  onPickAgain,
}: {
  set: Candidate[]
  questions: Map<string, Question>
  several: boolean
  /** What the draw could not balance. */
  notes: string[]
  /** Chosen skills the set asks nothing on. */
  bare: string[]
  onEdit: () => void
  /** Only for a set picked at random. */
  onPickAgain?: () => void
}) {
  const counts = levelCounts(set)
  const bySkill = several ? skillCountsOf(set) : []

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
            {bySkill.map(([k, n]) => (
              <span key={k} className="badge badge-neutral">
                {n} {skillLabel(k) ?? k}
              </span>
            ))}
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

      {bare.length > 0 && (
        <Notice kind="error">
          Nothing in the set is on {skillList(bare)}. Every skill the test is on needs at least
          one question — add one, or take the skill off the test.
        </Notice>
      )}
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
                <span className="chosen-from">{whereFrom(c, several)}</span>
              </span>
              <DifficultyBadge level={c.difficulty} />
            </li>
          )
        })}
      </ol>
    </div>
  )
}

/** How many of a set are on each skill, in the order the skills first appear. */
function skillCountsOf(set: Candidate[]): [string, number][] {
  const out = new Map<string, number>()
  for (const c of set) if (c.skill) out.set(c.skill, (out.get(c.skill) ?? 0) + 1)
  return [...out]
}
