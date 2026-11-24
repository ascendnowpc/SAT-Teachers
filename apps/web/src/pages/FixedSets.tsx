import { useCallback, useEffect, useState } from 'react'
import { Notice } from '../components/ui'
import { SECTIONS, skillLabel } from '../lib/constants'
import { SAT_DOMAINS } from '../lib/bluebook'
import { supabase } from '../lib/supabase'
import type { Subject } from '../lib/types'

interface SetQuestion {
  position: number
  question_id: string
  difficulty: 'easy' | 'medium' | 'hard'
  skill: string | null
  stem: string
}

interface FixedSet {
  id: string
  section: string
  label: 'A' | 'B' | 'C' | 'D'
  status: 'draft' | 'approved'
  note: string | null
  approved_by: string | null
  approved_at: string | null
  uses: number
  questions: SetQuestion[]
}

type PoolSizes = Record<string, { easy: number; medium: number; hard: number }>

/** The scope's "done when": at least three approved sets in every domain. */
const ENOUGH = 3

/**
 * Fixed Sets A to D (0109): for every domain, four sets of ten, the same for
 * every student, so a check-in before and one after compare like with like.
 * The platform drafts them from the bank — three easy, three medium, four
 * hard, easiest first, spread over the domain's skills, no question in two —
 * and Malya and the tutors swap what they would not ask, then approve. An
 * approved set is locked; booking a check-in from it is under Sessions.
 */
export function FixedSets() {
  const [subject, setSubject] = useState<Subject>('english')
  const [sets, setSets] = useState<FixedSet[] | null>(null)
  const [pool, setPool] = useState<PoolSizes>({})
  const [busy, setBusy] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)

  const load = useCallback(async () => {
    const [o, p] = await Promise.all([
      supabase.rpc('fixed_sets_overview', { p_subject: subject }),
      supabase.rpc('fixed_set_pool_sizes', { p_subject: subject }),
    ])
    if (o.error) setError(o.error.message)
    else setSets((o.data ?? []) as FixedSet[])
    if (!p.error) setPool((p.data ?? {}) as PoolSizes)
  }, [subject])

  useEffect(() => {
    setSets(null)
    void load()
  }, [load])

  async function act(key: string, call: () => PromiseLike<{ error: { message: string } | null }>) {
    setBusy(key)
    setError(null)
    const { error: err } = await call()
    if (err) setError(err.message)
    await load()
    setBusy(null)
  }

  const domains = SAT_DOMAINS.filter((d) => d.subject === subject)
  const approved = (section: string) => (sets ?? []).filter((s) => s.section === section && s.status === 'approved').length
  const ready = domains.filter((d) => approved(d.section) >= ENOUGH).length

  return (
    <div className="page page-wide fixed-sets">
      <div className="page-head">
        <h1>Fixed sets</h1>
      </div>
      <p className="muted">
        Four sets of ten per domain, the same for every student, so a check-in before and after compare like with like.
        Drafted from the bank — check each one, swap what you would not ask, then approve.
      </p>

      <div className="fs-tools">
        <div className="mode-toggle" role="group" aria-label="Subject">
          {(['english', 'mathematics'] as Subject[]).map((s) => (
            <button key={s} type="button" className={`mode-opt ${subject === s ? 'on' : ''}`} aria-pressed={subject === s} onClick={() => setSubject(s)}>
              {s === 'english' ? 'English' : 'Math'}
            </button>
          ))}
        </div>
        <span className="muted">
          {ready} of {domains.length} domains have {ENOUGH}+ approved sets
        </span>
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {!sets && !error && <p className="muted">Loading…</p>}

      {sets &&
        domains.map((d) => {
          const mine = sets.filter((s) => s.section === d.section)
          const sizes = pool[d.section]
          const label = SECTIONS[subject].find((x) => x.value === d.section)?.label ?? d.label
          return (
            <section key={d.section} className="card card-pad fs-domain">
              <header className="fs-domain-head">
                <div>
                  <h2>{label}</h2>
                  <p className="muted">
                    {approved(d.section)} of 4 approved
                    {sizes && (
                      <>
                        {' '}
                        · bank: {sizes.easy} easy, {sizes.medium} medium, {sizes.hard} hard
                      </>
                    )}
                  </p>
                </div>
                {mine.length < 4 && (
                  <button
                    type="button"
                    className="btn btn-primary btn-sm"
                    disabled={busy !== null}
                    onClick={() => void act(`draft/${d.section}`, () => supabase.rpc('draft_fixed_sets', { p_subject: subject, p_section: d.section }))}
                  >
                    {busy === `draft/${d.section}` ? 'Drafting…' : mine.length === 0 ? 'Draft Sets A–D' : 'Draft the missing sets'}
                  </button>
                )}
              </header>
              {mine.length === 0 ? (
                <p className="muted">No sets yet.</p>
              ) : (
                <div className="fs-sets">
                  {mine.map((s) => (
                    <SetCard key={s.id} set={s} busy={busy} act={act} />
                  ))}
                </div>
              )}
            </section>
          )
        })}
    </div>
  )
}

function SetCard({
  set,
  busy,
  act,
}: {
  set: FixedSet
  busy: string | null
  act: (key: string, call: () => PromiseLike<{ error: { message: string } | null }>) => Promise<void>
}) {
  const [open, setOpen] = useState(set.status === 'draft')
  const draft = set.status === 'draft'
  return (
    <article className={`fs-set${draft ? '' : ' is-approved'}`}>
      <header className="fs-set-head">
        <button type="button" className="fs-set-toggle" aria-expanded={open} onClick={() => setOpen((o) => !o)}>
          <b>Set {set.label}</b>
          <span className={`badge ${draft ? 'badge-neutral' : 'badge-ok'}`}>{draft ? 'Draft' : 'Approved'}</span>
          {set.uses > 0 && <span className="muted">used {set.uses}×</span>}
        </button>
        <div className="fs-set-act">
          {draft ? (
            <>
              <button type="button" className="btn btn-primary btn-sm" disabled={busy !== null} onClick={() => void act(`ok/${set.id}`, () => supabase.rpc('approve_fixed_set', { p_set: set.id, p_approve: true }))}>
                Approve
              </button>
              <button
                type="button"
                className="btn btn-ghost btn-sm"
                disabled={busy !== null}
                onClick={() => {
                  if (window.confirm(`Delete draft Set ${set.label}? Drafting again makes a new one.`))
                    void act(`del/${set.id}`, () => supabase.rpc('delete_fixed_set', { p_set: set.id }))
                }}
              >
                Delete
              </button>
            </>
          ) : (
            <button
              type="button"
              className="btn btn-ghost btn-sm"
              disabled={busy !== null}
              onClick={() => {
                if (window.confirm(`Put Set ${set.label} back to draft? Check-ins already booked from it keep their questions.`))
                  void act(`undo/${set.id}`, () => supabase.rpc('approve_fixed_set', { p_set: set.id, p_approve: false }))
              }}
            >
              Back to draft
            </button>
          )}
        </div>
      </header>
      {!draft && set.approved_by && (
        <p className="fs-set-by muted">
          Approved by {set.approved_by}
          {set.note ? ` — ${set.note}` : ''}
        </p>
      )}
      {open && (
        <ol className="fs-questions">
          {set.questions.map((q) => (
            <li key={q.position}>
              <span className={`fs-diff is-${q.difficulty}`}>{q.difficulty}</span>
              <div className="fs-q">
                <span className="fs-skill">{q.skill ? skillLabel(q.skill) : '—'}</span>
                <span className="fs-stem">{q.stem}</span>
              </div>
              {draft && (
                <button
                  type="button"
                  className="link-btn"
                  disabled={busy !== null}
                  onClick={() => void act(`swap/${set.id}/${q.position}`, () => supabase.rpc('swap_fixed_set_question', { p_set: set.id, p_position: q.position }))}
                >
                  {busy === `swap/${set.id}/${q.position}` ? 'Swapping…' : 'Swap'}
                </button>
              )}
            </li>
          ))}
        </ol>
      )}
    </article>
  )
}
