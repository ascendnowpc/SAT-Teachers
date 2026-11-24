import { useState, type CSSProperties, type ReactNode } from 'react'
import { Link } from 'react-router-dom'
import { dayLabel } from '../lib/bluebook'
import { LEVEL_MAX, outOf40, RAG_HINT, type Rag } from '../lib/parentReport'
import { standingOf, splitTests, type StudentTest } from '../lib/studentAccount'
import { studentTestTitle } from '../lib/studentApi'
import { HORIZON_LABEL, horizonsFor, type Horizon, type StudyPlan } from '../lib/studyPlan'
import { SUBJECT_ORDER, SUBJECT_VIEW, type SubjectMeasure } from '../lib/subjectProgress'
import { domainsAt, monthYearShort, type DomainAt, type TimelinePoint } from '../lib/timeline'
import { formatUtc } from '../lib/time'
import type { Subject } from '../lib/types'

/* ------------------------------------------------------------ timeline --- */

/**
 * Every full test over time, and the target at the end (the blueprint's
 * performance timeline). A test from before the student joined is drawn
 * dashed; the target is the lime one. Choosing a point opens its breakdown in
 * the English and Math boxes below.
 */
export function PerformanceTimeline({
  points,
  selected,
  onSelect,
  empty,
}: {
  points: TimelinePoint[]
  selected: string | null
  onSelect: (id: string) => void
  empty: ReactNode
}) {
  return (
    <section className="dash-panel timeline-card" aria-label="Performance timeline">
      <div className="timeline-head">
        <span className="timeline-title">Performance timeline — every test over time</span>
        {points.length > 0 && <span className="timeline-hint">· Click any point → full section breakdown ↓</span>}
      </div>
      {points.length === 0 ? (
        <div className="timeline-empty">{empty}</div>
      ) : (
        <div className="timeline-scroll">
          <ol className="timeline" style={{ ['--n' as string]: points.length } as CSSProperties}>
            {points.map((p, i) => {
              const label = (
                <span className="tl-label">
                  <b className="num">{p.total}</b>
                  <span>
                    {p.tag}
                    {p.day && p.kind === 'test' ? ` · ${monthYearShort(p.day)}` : ''}
                    {p.kind === 'target' && p.day ? ` · ${monthYearShort(p.day)}` : ''}
                  </span>
                </span>
              )
              const words = `${p.total}, ${p.kind === 'target' ? 'target' : `${p.name}${p.day ? `, ${dayLabel(p.day)}` : ''}`}${p.before ? ', before Ascend Now' : ''}`
              return (
                <li key={p.id} className={`tl-point ${i % 2 === 0 ? 'is-up' : 'is-down'}`}>
                  <button
                    type="button"
                    className={`tl-dot${p.before ? ' is-before' : ''}${p.kind === 'target' ? ' is-target' : ''}${selected === p.id ? ' on' : ''}`}
                    aria-pressed={selected === p.id}
                    aria-label={words}
                    title={words}
                    onClick={() => onSelect(p.id)}
                  />
                  {label}
                </li>
              )
            })}
          </ol>
        </div>
      )}
    </section>
  )
}

/* --------------------------------------------------- the two boxes --- */

/**
 * English and Math, side by side, each opening into its four domains out of
 * 40 and coloured (the blueprint's two boxes). The badge is the chosen test's
 * section score; the domains are as they stood on its day. A domain opens
 * into its skills.
 */
export function SectionBoxes({
  measures,
  point,
  asOf,
  action,
}: {
  measures: Partial<Record<Subject, SubjectMeasure>>
  point: TimelinePoint | null
  asOf: string | null
  /** Something to offer on a domain that needs work — the staff's "book a check-in". */
  action?: (subject: Subject, d: DomainAt) => ReactNode
}) {
  return (
    <div className="section-boxes">
      {SUBJECT_ORDER.map((subject) => {
        const m = measures[subject]
        const view = SUBJECT_VIEW[subject]
        const score = point ? (subject === 'english' ? point.rw : point.math) : null
        const domains = m ? domainsAt(m, asOf) : []
        return (
          <section key={subject} className={`section-box tone-${view.tone}`} aria-label={view.name}>
            <header className="section-box-head">
              <div>
                <h2>{view.name}</h2>
                <span className="section-box-sub">{subject === 'english' ? 'Reading & Writing' : 'By domain'}</span>
              </div>
              <span className={`section-box-badge${point?.kind === 'target' ? ' is-target' : ''}`}>
                {point?.kind === 'target' ? 'goal ' : ''}
                {score ?? '—'} / 800
              </span>
            </header>
            {domains.length === 0 ? (
              <p className="dash-empty">Each domain shows here after its first test.</p>
            ) : (
              <ul className="domain-rows">
                {domains.map((d) => (
                  <DomainRow
                    key={d.section}
                    d={d}
                    band={point?.domains?.[d.section] ?? null}
                    action={action?.(subject, d)}
                  />
                ))}
              </ul>
            )}
            <p className="section-box-foot">
              {asOf && point
                ? `As they stood on ${dayLabel(asOf)}, the day of ${point.name}`
                : 'From every check-in so far'}
            </p>
          </section>
        )
      })}
    </div>
  )
}

function Bar({ level, rag, small }: { level: number | null; rag: Rag | null; small?: boolean }) {
  const pct = level === null ? 0 : Math.max(4, Math.min(100, (outOf40(level) / LEVEL_MAX) * 100))
  return (
    <span className={`level-bar${small ? ' is-small' : ''}`} aria-hidden="true">
      <span className={`rag-fill-${rag ?? 'none'}`} style={{ width: `${pct}%` }} />
    </span>
  )
}

function DomainRow({ d, band, action }: { d: DomainAt; band: [number, number] | null; action?: ReactNode }) {
  const [open, setOpen] = useState(false)
  const tested = d.level !== null
  const words = tested
    ? `${d.label}: ${outOf40(d.level!)} out of ${LEVEL_MAX}, ${RAG_HINT[d.rag!]}`
    : `${d.label}: not tested yet`
  return (
    <li className={`domain-row${open ? ' is-open' : ''}`}>
      <button type="button" className="domain-row-main" aria-expanded={open} aria-label={words} onClick={() => setOpen((o) => !o)}>
        <span className="domain-row-name">
          {d.label}
          {band && (
            <small className="num">
              SAT band {band[0]}–{band[1]}
            </small>
          )}
        </span>
        <Bar level={d.level} rag={d.rag} />
        <span className="domain-row-score num">{tested ? `${outOf40(d.level!)}/${LEVEL_MAX}` : '—'}</span>
      </button>
      {open && (
        <div className="domain-row-detail">
          <p className="muted">
            {tested
              ? `${d.right} of ${d.of} right on its latest test · ${d.tests} test${d.tests === 1 ? '' : 's'} so far · ${RAG_HINT[d.rag!]}`
              : 'Not tested yet — a check-in on it sets its baseline.'}
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
      )}
    </li>
  )
}

/** The blueprint's key: what each colour asks for — for the student and the teacher alike. */
export function ColourKey() {
  return (
    <p className="colour-key">
      <span>
        <i className="rag-fill-green" /> mastered — keep light
      </span>
      <span>
        <i className="rag-fill-amber" /> needs work
      </span>
      <span>
        <i className="rag-fill-red" /> focus now
      </span>
      <b>colour shows it at a glance — for the student and the teacher</b>
    </p>
  )
}

/* ------------------------------------------------------------ guidance --- */

/**
 * "What should I do?" (the blueprint's guidance on demand): a plan written by
 * the model from the student's own scores, for now or for the last two weeks
 * or the last week before the exam.
 */
export function Guidance({
  daysToExam,
  ask,
  who = 'you',
}: {
  daysToExam: number | null
  ask: (h: Horizon) => Promise<StudyPlan>
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
  return (
    <section className="dash-panel guide-card" aria-label="Guidance">
      <div className="aim-label">Guidance, on demand</div>
      <button type="button" className="guide-btn" disabled={busy} onClick={() => void go('now')}>
        {busy && horizon === 'now' ? 'Thinking…' : who === 'you' ? 'What should I do? →' : 'What should they do? →'}
      </button>
      <div className="guide-chips">
        {late.map((h) => (
          <button
            key={h}
            type="button"
            className={`guide-chip${horizon === h && plan ? ' on' : ''}`}
            disabled={busy}
            onClick={() => void go(h)}
          >
            {busy && horizon === h ? 'Thinking…' : HORIZON_LABEL[h]}
          </button>
        ))}
        {daysToExam !== null && daysToExam >= 0 && <span className="guide-count">Exam in {daysToExam} days</span>}
      </div>
      {error && <p className="guide-error">{error}</p>}
      {plan ? (
        <div className="guide-plan" aria-live="polite">
          <p className="guide-headline">{plan.headline}</p>
          <ol>
            {plan.steps.map((s, i) => (
              <li key={i}>
                <b>{s.focus}.</b> {s.action} <span className="muted">({s.why})</span>
              </li>
            ))}
          </ol>
          <p className="guide-note">
            {HORIZON_LABEL[horizon]} · written by AI from {who === 'you' ? 'your' : 'their'} scores — nothing built by hand. Ask again
            any time.
          </p>
        </div>
      ) : (
        !error && (
          <p className="guide-note">
            AI compiles the plan straight from {who === 'you' ? 'your' : 'their'} own scores — nothing built by hand. e.g. “Algebra
            strong, keep testing. Problem-Solving weak: revise Percentages.”
          </p>
        )
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
      <div className="dash-panel-head">
        <h2>Your tests</h2>
        {footer}
      </div>
      {rows.length === 0 ? (
        <p className="dash-empty">Your check-ins show here once your teacher books them.</p>
      ) : (
        <ul className="dash-list">
          {rows.map((t) => {
            const s = standingOf(t)
            const ready = s.kind === 'open' || s.kind === 'live'
            return (
              <li key={t.id}>
                <span className={`dash-dot tone-${SUBJECT_VIEW[t.subject].tone}`} />
                <div className="dash-list-main">
                  <strong>{studentTestTitle(t)}</strong>
                  <span>
                    {SUBJECT_VIEW[t.subject].name} ·{' '}
                    {s.kind === 'upcoming' ? `opens ${formatUtc(t.scheduled_at)}` : dayLabel(t.scheduled_at.slice(0, 10))}
                  </span>
                </div>
                {s.kind === 'results' ? (
                  <span className="score-chip num">
                    {s.right}
                    <span className="of">/{s.of}</span>
                  </span>
                ) : s.kind === 'waiting' ? (
                  <span className="dash-muted">Soon</span>
                ) : (
                  <span />
                )}
                {reportFor.has(t.id) ? (
                  <Link className="dash-chip" to={`/student/reports/${t.id}`}>
                    Report
                  </Link>
                ) : (
                  <button
                    type="button"
                    className={ready ? 'btn-lime dash-start' : 'dash-chip'}
                    onClick={() => onOpen(t)}
                  >
                    {s.kind === 'live' ? 'Continue' : ready ? 'Start' : s.kind === 'results' ? (s.answers ? 'Answers' : 'Score') : 'Open'}
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

/** The upload card: drop the official report or a screenshot; it is read, dated, and added. */
export function UploadCard({ children, open, onOpen }: { children: ReactNode; open: boolean; onOpen: () => void }) {
  return (
    <section className="dash-panel upload-card" aria-label="Upload the score report">
      <div className="upload-head">
        <span className="upload-icon" aria-hidden="true">
          ↑
        </span>
        <div>
          <h2>Upload the score report</h2>
          <p>
            Drop the official report or a screenshot — it is read, dated and added to the timeline. No typing; you just check it
            and save.
          </p>
        </div>
      </div>
      {open ? (
        children
      ) : (
        <button type="button" className="btn btn-primary btn-sm" onClick={onOpen}>
          Upload a report
        </button>
      )}
    </section>
  )
}
