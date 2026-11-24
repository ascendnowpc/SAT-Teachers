import { useState, type CSSProperties, type ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { dayLabel } from '../lib/bluebook'
import { LEVEL_CUTOFFS, LEVEL_MAX, outOf40, RAG_LABEL, type Rag } from '../lib/parentReport'
import { standingOf, splitTests, type StudentTest } from '../lib/studentAccount'
import { studentTestTitle } from '../lib/studentApi'
import { HORIZON_LABEL, horizonsFor, type Horizon, type StudyPlan } from '../lib/studyPlan'
import { SUBJECT_ORDER, SUBJECT_VIEW, type SubjectMeasure } from '../lib/subjectProgress'
import { domainsAt, monthYearShort, type DomainAt, type TimelinePoint } from '../lib/timeline'
import { formatUtc } from '../lib/time'
import { GAP_FLAG_DAYS, toGo, type StudentGoal } from '../lib/goal'
import type { Subject } from '../lib/types'
import { Icon } from './Icon'

/** Each subject's mark: an open book for English, a sigma for Math. */
export const SUBJECT_ICON = { english: 'book', mathematics: 'sigma' } as const

/* ------------------------------------------------------------ timeline --- */

/** What a point is called under the chart. */
function pointTag(p: TimelinePoint): string {
  if (p.kind === 'target') return 'Goal'
  if (p.before) return 'Before joining'
  if (p.official) return 'Official SAT'
  return p.name
}

/**
 * Every full test over time, and the goal at the end (the blueprint's
 * performance timeline), drawn as a line: a test from before the student
 * joined is hollow and dashed, the goal carries a flag, and the step from the latest
 * test to the goal is dashed. Choosing a point opens its breakdown in the
 * English and Math boxes below. The points are spaced evenly, in order.
 */
export function PerformanceTimeline({
  points,
  selected,
  onSelect,
  empty,
  who = 'you',
}: {
  points: TimelinePoint[]
  selected: string | null
  onSelect: (id: string) => void
  empty: ReactNode
  who?: 'you' | 'they'
}) {
  return (
    <section className="dash-panel timeline-card" aria-label="Performance timeline">
      <header className="card-head">
        <span className="card-icon">
          <Icon name="trend" />
        </span>
        <div>
          <h2>{who === 'you' ? 'Your scores' : 'Their scores'}</h2>
          {points.length > 0 && <p>Tap a point to see its breakdown</p>}
        </div>
      </header>
      {points.length === 0 ? (
        <div className="timeline-empty">{empty}</div>
      ) : (
        <TimelineChart points={points} selected={selected} onSelect={onSelect} />
      )}
    </section>
  )
}

function TimelineChart({
  points,
  selected,
  onSelect,
}: {
  points: TimelinePoint[]
  selected: string | null
  onSelect: (id: string) => void
}) {
  const n = points.length
  const scores = points.map((p) => p.total)
  const lo = Math.max(400, Math.floor((Math.min(...scores) - 60) / 100) * 100)
  const hi = Math.min(1600, Math.ceil((Math.max(...scores) + 60) / 100) * 100)
  const xAt = (i: number) => (n === 1 ? 50 : 7 + (i / (n - 1)) * 86)
  const yAt = (v: number) => 14 + (1 - (v - lo) / Math.max(1, hi - lo)) * 68
  const at = points.map((p, i) => ({ p, x: xAt(i), y: yAt(p.total) }))
  const tests = at.filter((c) => c.p.kind === 'test')
  const goal = at.find((c) => c.p.kind === 'target') ?? null
  const last = tests[tests.length - 1] ?? null
  const line = tests.map((c, i) => `${i ? 'L' : 'M'}${c.x},${c.y}`).join(' ')
  const area = tests.length > 1 ? `${line} L${last!.x},100 L${tests[0].x},100 Z` : ''
  const step = hi - lo > 400 ? 200 : 100
  const grid: number[] = []
  for (let v = lo; v <= hi; v += step) grid.push(v)

  return (
    <div className="tl-scroll">
      <div className="tl-chart" style={{ ['--n' as string]: n } as CSSProperties}>
        <div className="tl-plot">
          {grid.map((v) => (
            <span key={v} className="tl-grid" style={{ top: `${yAt(v)}%` }}>
              <i className="num">{v}</i>
            </span>
          ))}
          <svg className="tl-svg" viewBox="0 0 100 100" preserveAspectRatio="none" aria-hidden="true">
            <defs>
              <linearGradient id="tl-area" x1="0" y1="0" x2="0" y2="1">
                <stop offset="0%" stopColor="var(--navy-500)" stopOpacity=".28" />
                <stop offset="100%" stopColor="var(--navy-500)" stopOpacity="0" />
              </linearGradient>
            </defs>
            {area && <path className="tl-area" d={area} fill="url(#tl-area)" />}
            {tests.length > 1 && <path className="tl-line" d={line} vectorEffect="non-scaling-stroke" />}
            {goal && last && (
              <path className="tl-to-goal" d={`M${last.x},${last.y} L${goal.x},${goal.y}`} vectorEffect="non-scaling-stroke" />
            )}
          </svg>
          {at.map(({ p, x, y }, i) => {
            const on = selected === p.id
            const words = `${p.total}, ${p.kind === 'target' ? 'your goal' : `${p.name}${p.day ? `, ${dayLabel(p.day)}` : ''}`}${p.before ? ', before joining' : ''}`
            return (
              <div
                key={p.id}
                className={`tl-pt${on ? ' on' : ''}${p.before ? ' is-before' : ''}${p.kind === 'target' ? ' is-target' : ''}`}
                style={{ left: `${x}%`, top: `${y}%`, ['--i' as string]: i, ['--y' as string]: y } as CSSProperties}
              >
                {on && <span className="tl-guide" aria-hidden="true" />}
                <span className="tl-score num" aria-hidden="true">
                  {p.total}
                </span>
                <button
                  type="button"
                  className="tl-dot"
                  aria-pressed={on}
                  aria-label={words}
                  title={words}
                  onClick={() => onSelect(p.id)}
                >
                  {p.kind === 'target' && <Icon name="flag" size={12} />}
                </button>
              </div>
            )
          })}
        </div>
        <div className="tl-axis" aria-hidden="true">
          {at.map(({ p, x }, i) => (
            <span
              key={p.id}
              className={`tl-tick${i === 0 && n > 1 ? ' is-first' : ''}${i === n - 1 && n > 1 ? ' is-last' : ''}${selected === p.id ? ' on' : ''}`}
              style={{ left: `${x}%` }}
            >
              <b>{pointTag(p)}</b>
              {p.day && <span>{monthYearShort(p.day)}</span>}
            </span>
          ))}
        </div>
      </div>
    </div>
  )
}

/* --------------------------------------------------- the two boxes --- */

/** A section score as a ring: how much of the 800 it is. */
function ScoreRing({ score, goal }: { score: number | null; goal: boolean }) {
  const pct = score === null ? 0 : Math.max(0, Math.min(100, (score / 800) * 100))
  return (
    <span className={`score-ring${goal ? ' is-goal' : ''}`} aria-hidden="true">
      <svg viewBox="0 0 48 48">
        <circle className="score-ring-track" cx="24" cy="24" r="20" pathLength={100} />
        <circle
          className="score-ring-fill"
          cx="24"
          cy="24"
          r="20"
          pathLength={100}
          style={{ ['--pct' as string]: pct } as CSSProperties}
        />
      </svg>
      <span className="score-ring-text">
        <b className="num">{score ?? '—'}</b>
        <small>/800</small>
      </span>
    </span>
  )
}

/**
 * English and Math, side by side, each opening into its four domains out of
 * 40 and coloured (the blueprint's two boxes). The ring is the chosen test's
 * section score; the domains are as they stood on its day. A domain opens
 * into its skills.
 */
export function SectionBoxes({
  measures,
  point,
  asOf,
  action,
  goal = null,
  latest = null,
  daysToExam = null,
}: {
  measures: Partial<Record<Subject, SubjectMeasure>>
  point: TimelinePoint | null
  asOf: string | null
  /** Something to offer on a domain that needs work — the staff's "book a check-in". */
  action?: (subject: Subject, d: DomainAt) => ReactNode
  /** The section goals, for the gap (F15). */
  goal?: StudentGoal | null
  /** The latest SAT's section scores. */
  latest?: { rw: number; math: number } | null
  daysToExam?: number | null
}) {
  return (
    <div className="section-boxes">
      {SUBJECT_ORDER.map((subject) => {
        const m = measures[subject]
        const view = SUBJECT_VIEW[subject]
        const score = point ? (subject === 'english' ? point.rw : point.math) : null
        const domains = m ? domainsAt(m, asOf) : []
        const isGoal = point?.kind === 'target'
        const target = subject === 'english' ? goal?.target_rw : goal?.target_math
        const gap = toGo(latest ? (subject === 'english' ? latest.rw : latest.math) : null, target)
        // F15: flagged in the last month before the SAT.
        const near = daysToExam !== null && daysToExam >= 0 && daysToExam <= GAP_FLAG_DAYS && !!gap && gap !== 'Reached'
        return (
          <section key={subject} className={`section-box tone-${view.tone}`} aria-label={view.name}>
            <header className="section-box-head">
              <span className="card-icon">
                <Icon name={SUBJECT_ICON[subject]} />
              </span>
              <div className="section-box-title">
                <h2>{view.name}</h2>
                <span className="section-box-sub">{subject === 'english' ? 'Reading & Writing' : '4 domains'}</span>
                {target != null && (
                  <span className={`section-goal${gap === 'Reached' ? ' is-done' : near ? ' is-near' : ''}`}>
                    Goal {target}
                    {gap ? ` · ${gap.toLowerCase()}` : ''}
                  </span>
                )}
              </div>
              <ScoreRing score={score} goal={isGoal} />
              <span className="sr-only">
                {isGoal ? 'Goal: ' : ''}
                {score ?? 'no score'} out of 800
              </span>
            </header>
            {domains.length === 0 ? (
              <p className="dash-empty">Domains show here after the first check-in.</p>
            ) : (
              <ul className="domain-rows">
                {domains.map((d, i) => (
                  <DomainRow
                    key={d.section}
                    d={d}
                    i={i}
                    band={point?.domains?.[d.section] ?? null}
                    action={action?.(subject, d)}
                  />
                ))}
              </ul>
            )}
            <p className="section-box-foot">
              <Icon name="clock" size={13} />
              {asOf && point ? `As of ${dayLabel(asOf)} · ${isGoal ? 'your goal' : point.name}` : 'All check-ins so far'}
            </p>
          </section>
        )
      })}
    </div>
  )
}

function Bar({ level, rag, small, i = 0 }: { level: number | null; rag: Rag | null; small?: boolean; i?: number }) {
  const pct = level === null ? 0 : Math.max(4, Math.min(100, (outOf40(level) / LEVEL_MAX) * 100))
  return (
    <span className={`level-bar${small ? ' is-small' : ''}`} aria-hidden="true">
      <span className={`rag-fill-${rag ?? 'none'}`} style={{ width: `${pct}%`, ['--i' as string]: i } as CSSProperties} />
    </span>
  )
}

function DomainRow({ d, i, band, action }: { d: DomainAt; i: number; band: [number, number] | null; action?: ReactNode }) {
  const [open, setOpen] = useState(false)
  const tested = d.level !== null
  const words = tested
    ? `${d.label}: ${outOf40(d.level!)} out of ${LEVEL_MAX}, ${RAG_LABEL[d.rag!]}`
    : `${d.label}: not tested yet`
  return (
    <li className={`domain-row${open ? ' is-open' : ''}`}>
      <button type="button" className="domain-row-main" aria-expanded={open} aria-label={words} onClick={() => setOpen((o) => !o)}>
        <span className="domain-row-name">
          {d.label}
          {band && (
            <small className="num">
              SAT {band[0]}–{band[1]}
            </small>
          )}
        </span>
        <Bar level={d.level} rag={d.rag} i={i} />
        <span className={`rag-pill rag-${d.rag ?? 'none'} num`}>{tested ? `${outOf40(d.level!)}/${LEVEL_MAX}` : '—'}</span>
        <Icon name="chevron" size={16} className="domain-row-chev" />
      </button>
      <div className="domain-row-detail" hidden={!open}>
        <p>
          {tested
            ? `${d.right}/${d.of} right last time · ${d.tests} test${d.tests === 1 ? '' : 's'} · ${RAG_LABEL[d.rag!]}`
            : 'Not tested yet — a check-in sets its baseline.'}
        </p>
        <ul className="skill-rows">
          {d.skills.map((k) => (
            <li key={k.skill}>
              <span>{k.label}</span>
              <Bar level={k.level} rag={k.rag} small />
              <span className="num">{k.level === null ? '—' : `${outOf40(k.level)}/${LEVEL_MAX}`}</span>
            </li>
          ))}
        </ul>
        {action}
      </div>
    </li>
  )
}

/** The blueprint's key: what each colour asks for — for the student and the teacher alike. */
export function ColourKey() {
  return (
    <p className="colour-key" aria-label="Colour key">
      <span className="rag-pill rag-green">
        <i /> Mastered · {LEVEL_CUTOFFS.green}+
      </span>
      <span className="rag-pill rag-amber">
        <i /> Needs work · {LEVEL_CUTOFFS.amber}–{LEVEL_CUTOFFS.green - 1}
      </span>
      <span className="rag-pill rag-red">
        <i /> Focus now · under {LEVEL_CUTOFFS.amber}
      </span>
    </p>
  )
}

/* ------------------------------------------------------------ guidance --- */

/** A domain to look at first: the lowest that are not yet mastered. */
export interface FocusDomain {
  subject: Subject
  label: string
  level: number
  rag: Rag
}

/** Up to n domains, highest first, that are mastered — the strengths to keep light (the journey's "close to the exam"). */
export function strongFrom(measures: Partial<Record<Subject, SubjectMeasure>>, n = 2): FocusDomain[] {
  const out: FocusDomain[] = []
  for (const subject of SUBJECT_ORDER) {
    for (const d of measures[subject]?.sections ?? []) {
      if (d.latest && d.rag === 'green') out.push({ subject, label: d.label, level: d.latest.level, rag: d.rag })
    }
  }
  return out.sort((a, b) => b.level - a.level).slice(0, n)
}

/** Up to three domains, lowest first, that are not green — from every check-in so far. */
export function focusFrom(measures: Partial<Record<Subject, SubjectMeasure>>, n = 3): FocusDomain[] {
  const out: FocusDomain[] = []
  for (const subject of SUBJECT_ORDER) {
    for (const d of measures[subject]?.sections ?? []) {
      if (d.latest && d.rag && d.rag !== 'green') out.push({ subject, label: d.label, level: d.latest.level, rag: d.rag })
    }
  }
  return out.sort((a, b) => a.level - b.level).slice(0, n)
}

/**
 * "What should I do?" (the blueprint's guidance on demand): a plan written by
 * the model from the student's own scores, for now or for the last two weeks
 * or the last week before the exam.
 */
export function Guidance({
  daysToExam,
  ask,
  focus = [],
  strong = [],
  who = 'you',
}: {
  daysToExam: number | null
  ask: (h: Horizon) => Promise<StudyPlan>
  /** The domains to name before a plan is asked for. */
  focus?: FocusDomain[]
  /** The strongest, to keep light. */
  strong?: FocusDomain[]
  who?: 'you' | 'they'
}) {
  const [horizon, setHorizon] = useState<Horizon>('now')
  const [plan, setPlan] = useState<StudyPlan | null>(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function go(h: Horizon) {
    setHorizon(h)
    setBusy(true)
    setError(null)
    try {
      setPlan(await ask(h))
    } catch (e) {
      setPlan(null)
      setError(e instanceof Error ? e.message : String(e))
    }
    setBusy(false)
  }

  const late = horizonsFor(daysToExam).filter((h) => h !== 'now')
  const your = who === 'you' ? 'your' : 'their'
  return (
    <section className="dash-panel guide-card" aria-label="Guidance" aria-busy={busy}>
      <div className="guide-top">
        <span className="guide-badge">
          <Icon name="sparkles" size={15} /> AI coach
        </span>
        {daysToExam !== null && daysToExam >= 0 && (
          <span className="guide-count">
            <Icon name="clock" size={13} /> {daysToExam === 0 ? 'Exam today' : `Exam in ${daysToExam} day${daysToExam === 1 ? '' : 's'}`}
          </span>
        )}
      </div>
      <p className="guide-lead">A plan from {your} own scores, in seconds.</p>
      <div className="guide-actions">
        <button type="button" className={`ui-btn ui-btn--ai${busy && horizon === 'now' ? ' is-busy' : ''}`} disabled={busy} onClick={() => void go('now')}>
          {busy && horizon === 'now' ? <span className="spinner" aria-hidden="true" /> : <Icon name="sparkles" className="spark" />}
          {busy && horizon === 'now' ? 'Thinking…' : who === 'you' ? 'What should I do?' : 'What should they do?'}
        </button>
      </div>
      {late.length > 0 && (
        <div className="guide-late">
          <span>Short on time?</span>
          {late.map((h) => (
            <button
              key={h}
              type="button"
              className={`guide-chip${horizon === h && plan ? ' on' : ''}`}
              disabled={busy}
              onClick={() => void go(h)}
            >
              {busy && horizon === h ? <span className="spinner is-small" aria-hidden="true" /> : <Icon name="calendar" size={14} />}
              {HORIZON_LABEL[h]}
            </button>
          ))}
        </div>
      )}
      {error && (
        <p className="guide-error">
          <Icon name="alert" size={15} /> {error}
        </p>
      )}
      {busy && (
        <div className="guide-skeleton" aria-hidden="true">
          <span />
          <span />
          <span />
        </div>
      )}
      {!plan && !busy && focus.length > 0 && (
        <div className="guide-focus">
          <span className="guide-focus-head">Focus first</span>
          <ul>
            {focus.map((f) => (
              <li key={`${f.subject}/${f.label}`}>
                <span className="test-icon">
                  <Icon name={SUBJECT_ICON[f.subject]} size={14} />
                </span>
                <span className="guide-focus-name">{f.label}</span>
                <span className={`rag-pill rag-${f.rag} num`}>
                  {outOf40(f.level)}/{LEVEL_MAX}
                </span>
              </li>
            ))}
          </ul>
          {strong.length > 0 && (
            <p className="guide-strong">
              <span>Going well</span>
              {strong.map((f) => (
                <span key={`${f.subject}/${f.label}`} className="rag-pill rag-green">
                  {f.label} · {outOf40(f.level)}/{LEVEL_MAX}
                </span>
              ))}
            </p>
          )}
        </div>
      )}
      {plan && !busy && (
        <div className="guide-plan" aria-live="polite">
          <p className="guide-headline">{plan.headline}</p>
          <ol>
            {plan.steps.map((s, i) => (
              <li key={i} style={{ ['--i' as string]: i } as CSSProperties}>
                <span className="guide-step-num num">{i + 1}</span>
                <div>
                  <b>{s.focus}</b>
                  <p>{s.action}</p>
                  <small>{s.why}</small>
                </div>
              </li>
            ))}
          </ol>
          <p className="guide-note">
            {HORIZON_LABEL[horizon]} · by AI, from {your} scores
          </p>
        </div>
      )}
    </section>
  )
}

/* ---------------------------------------------------------- your tests --- */

/** What is booked and the latest scores back — compact, both subjects. */
export function YourTests({
  tests,
  reportFor,
  onOpen,
  footer,
}: {
  tests: StudentTest[]
  reportFor: Set<string>
  onOpen: (t: StudentTest) => void
  footer?: ReactNode
}) {
  const { ahead, done } = splitTests(tests)
  const rows = [...ahead.slice(0, 3), ...done.slice(0, 4)]
  return (
    <section className="dash-panel tests-card" aria-label="Your tests">
      <header className="card-head">
        <span className="card-icon">
          <Icon name="reports" />
        </span>
        <div>
          <h2>Your tests</h2>
        </div>
        {footer && <span className="card-head-end">{footer}</span>}
      </header>
      {rows.length === 0 ? (
        <p className="dash-empty">Check-ins show here once your teacher books them.</p>
      ) : (
        <ul className="test-rows">
          {rows.map((t, i) => {
            const s = standingOf(t)
            const ready = s.kind === 'open' || s.kind === 'live'
            const view = SUBJECT_VIEW[t.subject]
            return (
              <li key={t.id} className={ready ? 'is-ready' : ''} style={{ ['--i' as string]: i } as CSSProperties}>
                <span className="test-icon">
                  <Icon name={SUBJECT_ICON[t.subject]} size={17} />
                </span>
                <div className="test-main">
                  <strong>{studentTestTitle(t)}</strong>
                  <span>
                    {view.name} ·{' '}
                    {s.kind === 'upcoming' ? `opens ${formatUtc(t.scheduled_at)}` : dayLabel(t.scheduled_at.slice(0, 10))}
                  </span>
                </div>
                {s.kind === 'results' ? (
                  <span className="score-chip num">
                    {s.right}
                    <span className="of">/{s.of}</span>
                  </span>
                ) : s.kind === 'waiting' ? (
                  <span className="state-pill">Marking</span>
                ) : s.kind === 'upcoming' ? (
                  <span className="state-pill is-soon">
                    <Icon name="clock" size={12} /> Soon
                  </span>
                ) : (
                  <span />
                )}
                {reportFor.has(t.id) ? (
                  <Link className="ui-btn ui-btn--ghost ui-btn--sm" to={`/student/reports/${t.id}`}>
                    Report <Icon name="arrow" size={14} className="nudge" />
                  </Link>
                ) : ready ? (
                  <button type="button" className="ui-btn ui-btn--go ui-btn--sm" onClick={() => onOpen(t)}>
                    <Icon name="play" size={13} />
                    {s.kind === 'live' ? 'Continue' : 'Start'}
                  </button>
                ) : (
                  <button type="button" className="ui-btn ui-btn--ghost ui-btn--sm" onClick={() => onOpen(t)}>
                    {s.kind === 'results' ? (s.answers ? 'Answers' : 'Score') : 'Open'}
                  </button>
                )}
              </li>
            )
          })}
        </ul>
      )}
    </section>
  )
}

/** The upload card: the official report or a screenshot; it is read, dated, and added. */
export function UploadCard({ children, open, onOpen }: { children: ReactNode; open: boolean; onOpen: () => void }) {
  return (
    <section className={`dash-panel upload-card${open ? ' is-open' : ''}`} aria-label="Upload a score report">
      {open ? (
        <>
          <header className="card-head">
            <span className="card-icon">
              <Icon name="upload" />
            </span>
            <div>
              <h2>Add a score report</h2>
              <p>We read it — you check it and save.</p>
            </div>
          </header>
          {children}
        </>
      ) : (
        <button type="button" className="upload-drop" onClick={onOpen}>
          <span className="upload-orb">
            <Icon name="upload" size={26} />
          </span>
          <b>Add a score report</b>
          <span>PDF or screenshot — we read the scores for you</span>
          <span className="ui-btn ui-btn--primary ui-btn--sm">
            Upload <Icon name="arrow" size={14} className="nudge" />
          </span>
        </button>
      )}
    </section>
  )
}
