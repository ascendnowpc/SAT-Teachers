import { useCallback, useEffect, useState } from 'react'
import { sectionLabel, skillLabel } from '../lib/constants'
import {
  onePointWorth,
  VERDICT_LABELS,
  type ProgressConfig,
  type ProgressLine,
  type StudentProgress,
} from '../lib/progress'
import { asAnalysed, loadAnalysedQuestions } from '../lib/progressApi'
import { supabase } from '../lib/supabase'
import { longPattern, type LongPattern, type TargetedAnalysis } from '../lib/targetedAnalytics'
import { formatUtc } from '../lib/time'
import type { Subject } from '../lib/types'
import { Field, Notice, Textarea } from './ui'

/**
 * The pieces of a student's progress every screen that shows it shares: the
 * line on one skill, one test's analysis, and — for staff — the wording for a
 * step, the private note and the summary the PC is given. The PC reads the
 * first two and the shared copies; nothing here writes for them.
 */

/** "Transitions" or "Expression of Ideas — the whole section". */
export function skillTitle(section: string, skill: string | null): string {
  return skill
    ? (skillLabel(skill) ?? skill)
    : `${sectionLabel(section) ?? section} — the whole section`
}

const round = (n: number) => Math.round(n)

/** The line: baseline, then every test, the step between each pair, and its caveat. */
export function ProgressLineView({
  line,
  highlight,
  showOverrides = true,
}: {
  line: ProgressLine
  /** The test this screen is about, marked in the table. */
  highlight?: string
  showOverrides?: boolean
}) {
  return (
    <div className="progress-line">
      <div className="board">
        <div className="board-scroll">
          <table className="board-table">
            <thead>
              <tr>
                <th>When</th>
                <th>What</th>
                <th className="num">Score /10</th>
                <th className="num">Level score</th>
                <th className="num">Sessions since the last</th>
                <th>Change</th>
              </tr>
            </thead>
            <tbody>
              {line.points.map((p) => (
                <tr key={p.sessionId} className={p.sessionId === highlight ? 'row-on' : undefined}>
                  <td>{formatUtc(p.at)}</td>
                  <td>
                    {p.isBaseline ? 'Baseline — ' : ''}
                    {p.kind === 'diagnostic' ? 'diagnostic' : 'targeted test'}
                    <div className="muted">
                      {p.correct} of {p.reached} right
                      {p.timedOut > 0 && ` · ${p.timedOut} timed out`}
                      {p.notReached > 0 && ` · ${p.notReached} not reached`}
                    </div>
                  </td>
                  {/* Always beside each other: the raw score is the fact, the mapped one a reading of it. */}
                  <td className="num">{p.raw.toFixed(1)}/10</td>
                  <td className="num">{round(p.level)}</td>
                  <td className="num">{p.isBaseline ? '—' : p.sessionsBefore}</td>
                  <td>
                    {p.step ? (
                      <>
                        <span className={`badge verdict-${p.step.verdict}`}>
                          {VERDICT_LABELS[p.step.verdict]} ({p.step.delta >= 0 ? '+' : ''}
                          {round(p.step.delta)})
                        </span>
                        <div className="muted">{p.step.text}</div>
                        <div className="muted">{p.step.caveat}</div>
                        {showOverrides && p.override?.shared_wording && (
                          <div className="override-shared">
                            <strong>Teacher:</strong> {p.override.shared_wording}
                            {p.override.shared_context && <> — {p.override.shared_context}</>}
                            {p.override.stale && (
                              <div className="muted">
                                Written against a different earlier point — check it still holds.
                              </div>
                            )}
                          </div>
                        )}
                      </>
                    ) : (
                      <span className="muted">—</span>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
      {line.hint && <p className="muted">{line.hint}.</p>}
    </div>
  )
}

/**
 * One test's analysis, read top to bottom: the result in figures with how
 * each is scored under them, accuracy at each level as bars, the time, and
 * then only what the figures do not already say.
 */
export function TargetedAnalysisView({
  analysis,
  config,
}: {
  analysis: TargetedAnalysis
  /** The admin's settings, for "How is this scored?". Left out until read. */
  config?: ProgressConfig | null
}) {
  const a = analysis
  const levels = LEVELS.filter((l) => a.byDifficulty[l].total > 0)
  const avg = (n: number) => Math.round(n / a.time.timed)
  return (
    <div className="targeted-analysis">
      <div className="stat-row">
        <div className="stat">
          <div className="v">
            {a.correct}
            <span className="of"> of {a.reached}</span>
          </div>
          <div className="l">right</div>
          <div className="n">of the questions reached</div>
        </div>
        <div className="stat">
          <div className="v">
            {a.raw === null ? '—' : a.raw.toFixed(1)}
            <span className="of">/10</span>
          </div>
          <div className="l">score</div>
          <div className="n">right ÷ reached × 10</div>
        </div>
        <div className="stat">
          <div className="v">{a.level === null ? '—' : round(a.level)}</div>
          <div className="l">level score</div>
          <div className="n">the score on the school’s scale</div>
        </div>
        <div className="stat">
          <div className="v">{a.timedOut}</div>
          <div className="l">ran out of time</div>
          <div className="n">counted as wrong</div>
        </div>
        <div className="stat">
          <div className="v">{a.notReached}</div>
          <div className="l">not reached</div>
          <div className="n">left out of the score</div>
        </div>
      </div>

      {config && <ScoringNote config={config} />}

      {levels.length > 0 && (
        <div className="by-level">
          <div className="by-level-title">By level</div>
          {levels.map((l) => {
            const t = a.byDifficulty[l]
            return (
              <div className="by-level-row" key={l}>
                <span className={`badge badge-${l}`}>{l[0].toUpperCase() + l.slice(1)}</span>
                <span className="by-level-bar" aria-hidden="true">
                  <span
                    className={`fill fill-${l}`}
                    style={{ width: `${(t.correct / t.total) * 100}%` }}
                  />
                </span>
                <span className="by-level-n">
                  {t.correct} of {t.total} right
                </span>
              </div>
            )
          })}
        </div>
      )}

      {a.time.timed > 0 && (
        <p className="muted">
          Averaged {avg(a.time.seconds)}s a question, against a target of {avg(a.time.target)}s.
        </p>
      )}

      {a.findings.length > 0 && (
        <>
          <div className="by-level-title">What stands out</div>
          <ul className="insights">
            {a.findings.map((t) => (
              <li key={t}>{t}</li>
            ))}
          </ul>
        </>
      )}
    </div>
  )
}

const LEVELS = ['easy', 'medium', 'hard'] as const

/**
 * How a targeted test is scored, in a line that opens: the score out of 10,
 * the level score and its mapping, and when a change counts — the admin's own
 * numbers (progress_config), so it says what the screen above it did.
 */
export function ScoringNote({ config }: { config: ProgressConfig }) {
  const pts = [...config.score_points].sort((a, b) => a[0] - b[0])
  const size = config.default_set_size
  const worth = round(onePointWorth(size, 5, config.score_points))
  return (
    <details className="how-scored">
      <summary>How is this scored?</summary>
      <ul>
        <li>
          <strong>Score out of 10</strong> — right answers ÷ questions reached × 10, so 3 right of 5
          is 6.0. A question that ran out of its own time counts as wrong; questions the student
          never reached (the whole test’s time ran out, or it was ended) are left out.
        </li>
        <li>
          <strong>Level score</strong> — the score out of 10 put on the school’s scale, so tests of
          any length compare: {pts.map(([r, l]) => `${r}/10 → ${l}`).join(', ')}, a straight line
          between, rising at the same rate above the last.
        </li>
        <li>
          <strong>The change</strong> — against the test before on the same skill, or the diagnostic
          for the first. Up {config.improved_at} or more is <em>Improved</em>, down{' '}
          {-config.declined_at} or more is <em>Declined</em>, anything between is{' '}
          <em>Minimal change</em>. On a {size}-question test one question is worth about {worth}{' '}
          level points, so a single question can decide it.
        </li>
      </ul>
    </details>
  )
}

/**
 * Whether long questions are the trouble, pooled across every test on the
 * skill: it reads the questions of those tests to count their words.
 */
export function useLongPattern(
  progress: StudentProgress | null,
  line: ProgressLine | null,
  cfg: ProgressConfig | null,
): LongPattern | null {
  const [pattern, setPattern] = useState<LongPattern | null>(null)
  useEffect(() => {
    if (!progress || !line || !cfg) return
    const testIds = new Set(line.points.filter((p) => p.kind === 'test').map((p) => p.sessionId))
    const items = progress.items.filter((i) => testIds.has(i.session_id))
    let active = true
    void loadAnalysedQuestions(items.map((i) => i.question_id)).then((qs) => {
      if (active) setPattern(longPattern(asAnalysed(items, qs), cfg))
    })
    return () => {
      active = false
    }
  }, [progress, line, cfg])
  return pattern
}

/* ------------------------------------------------------------ staff only --- */

interface DraftShared {
  draft: string
  shared: string | null
  shared_at: string | null
}

/**
 * The teacher's wording for the step up to a targeted test, against the point
 * before it. Draft and shared copies: Share copies the draft across, and an
 * edit after sharing changes the draft only (0061). The computed verdict is
 * always shown with it, never replaced by it.
 */
export function OverridePanel({
  sessionId,
  previousSessionId,
}: {
  sessionId: string
  previousSessionId: string | null
}) {
  const [wording, setWording] = useState('')
  const [context, setContext] = useState('')
  const [row, setRow] = useState<{
    previous_session_id: string | null
    shared_wording: string | null
    shared_context: string | null
    shared_at: string | null
  } | null>(null)
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)

  const load = useCallback(async () => {
    const { data } = await supabase
      .from('verdict_overrides')
      .select('*')
      .eq('session_id', sessionId)
      .maybeSingle()
    setRow(data)
    setWording(data?.draft_wording ?? '')
    setContext(data?.draft_context ?? '')
  }, [sessionId])
  useEffect(() => {
    void load()
  }, [load])

  async function run(fn: string, args: Record<string, unknown>) {
    setBusy(true)
    setErr(null)
    const { error } = await supabase.rpc(fn, args)
    if (error) setErr(error.message)
    await load()
    setBusy(false)
  }

  const save = () =>
    run('save_verdict_override', {
      p_session: sessionId,
      p_previous: previousSessionId,
      p_wording: wording,
      p_context: context,
    })

  return (
    <div className="card card-pad">
      <div className="section-title">Your wording for this step</div>
      <p className="muted">
        The computed verdict stays on the page under it. The PC sees this once you share it.
      </p>
      {err && <Notice kind="error">{err}</Notice>}
      <Field label="Wording">
        <Textarea rows={2} value={wording} onChange={(e) => setWording(e.target.value)} />
      </Field>
      <Field
        label="Context"
        hint="What happened between the two points: absence, a new method, exam season."
      >
        <Textarea rows={2} value={context} onChange={(e) => setContext(e.target.value)} />
      </Field>
      <div className="panel-actions">
        <button type="button" className="btn btn-sm" disabled={busy} onClick={() => void save()}>
          Save draft
        </button>
        <button
          type="button"
          className="btn btn-primary btn-sm"
          disabled={busy || (!wording.trim() && !context.trim())}
          onClick={async () => {
            await save()
            await run('share_verdict_override', { p_session: sessionId, p_share: true })
          }}
        >
          Share with the PC
        </button>
        {row?.shared_at && (
          <button
            type="button"
            className="btn btn-ghost btn-sm"
            disabled={busy}
            onClick={() =>
              void run('share_verdict_override', { p_session: sessionId, p_share: false })
            }
          >
            Take it back
          </button>
        )}
      </div>
      {row?.shared_at && (
        <p className="muted">
          Shared {formatUtc(row.shared_at)}: “{row.shared_wording ?? ''}
          {row.shared_context ? ` — ${row.shared_context}` : ''}”
          {row.previous_session_id !== previousSessionId &&
            ' · written against a different earlier point'}
        </p>
      )}
    </div>
  )
}

/**
 * The private note on a student and a skill (staff only, never the PC), and
 * the summary the PC is given, as a draft and a shared copy.
 */
export function SkillNotesPanel({
  studentId,
  subject,
  section,
  skill,
}: {
  studentId: string
  subject: Subject
  section: string
  skill: string | null
}) {
  const key = skill ?? ''
  const [note, setNote] = useState('')
  const [summary, setSummary] = useState<DraftShared>({ draft: '', shared: null, shared_at: null })
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)
  const [saved, setSaved] = useState<string | null>(null)

  const load = useCallback(async () => {
    const [n, s] = await Promise.all([
      supabase
        .from('skill_notes')
        .select('body')
        .match({ student_id: studentId, subject, section, skill: key })
        .maybeSingle(),
      supabase
        .from('skill_summaries')
        .select('draft, shared, shared_at')
        .match({ student_id: studentId, subject, section, skill: key })
        .maybeSingle(),
    ])
    setNote(n.data?.body ?? '')
    setSummary((s.data as DraftShared | null) ?? { draft: '', shared: null, shared_at: null })
  }, [studentId, subject, section, key])
  useEffect(() => {
    void load()
  }, [load])

  async function run(fn: string, args: Record<string, unknown>, done: string) {
    setBusy(true)
    setErr(null)
    setSaved(null)
    const { error } = await supabase.rpc(fn, args)
    if (error) setErr(error.message)
    else setSaved(done)
    await load()
    setBusy(false)
  }
  const base = { p_student: studentId, p_subject: subject, p_section: section, p_skill: key }

  return (
    <div className="card card-pad">
      <div className="section-title">Notes on {skillTitle(section, skill)}</div>
      {err && <Notice kind="error">{err}</Notice>}
      {saved && <Notice kind="ok">{saved}</Notice>}
      <Field
        label="Private note"
        hint="Mindset, effort, strategy. Staff only — the PC never sees it."
      >
        <Textarea rows={3} value={note} onChange={(e) => setNote(e.target.value)} />
      </Field>
      <div className="panel-actions">
        <button
          type="button"
          className="btn btn-sm"
          disabled={busy}
          onClick={() => void run('save_skill_note', { ...base, p_body: note }, 'Note saved.')}
        >
          Save note
        </button>
      </div>
      <Field
        label="Summary for the PC"
        hint="A draft until you share it. Editing after sharing changes the draft only."
      >
        <Textarea
          rows={3}
          value={summary.draft}
          onChange={(e) => setSummary({ ...summary, draft: e.target.value })}
        />
      </Field>
      <div className="panel-actions">
        <button
          type="button"
          className="btn btn-sm"
          disabled={busy}
          onClick={() =>
            void run('save_skill_summary', { ...base, p_draft: summary.draft }, 'Draft saved.')
          }
        >
          Save draft
        </button>
        <button
          type="button"
          className="btn btn-primary btn-sm"
          disabled={busy || !summary.draft.trim()}
          onClick={async () => {
            await run('save_skill_summary', { ...base, p_draft: summary.draft }, 'Draft saved.')
            await run('share_skill_summary', { ...base, p_share: true }, 'Shared with the PC.')
          }}
        >
          Share with the PC
        </button>
        {summary.shared_at && (
          <button
            type="button"
            className="btn btn-ghost btn-sm"
            disabled={busy}
            onClick={() =>
              void run('share_skill_summary', { ...base, p_share: false }, 'Taken back.')
            }
          >
            Take it back
          </button>
        )}
      </div>
      {summary.shared_at && (
        <p className="muted">
          The PC reads (shared {formatUtc(summary.shared_at)}): “{summary.shared}”
        </p>
      )}
    </div>
  )
}
