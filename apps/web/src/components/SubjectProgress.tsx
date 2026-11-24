import type { CSSProperties } from 'react'
import { dayLabel } from '../lib/bluebook'
import { toGo } from '../lib/goal'
import { RAG_LABEL, type Rag } from '../lib/parentReport'
import { VERDICT_LABELS } from '../lib/progress'
import {
  percent,
  SUBJECT_VIEW,
  type Attempt,
  type SectionMeasure,
  type SkillMeasure,
  type SubjectMeasure,
} from '../lib/subjectProgress'
import type { Subject } from '../lib/types'

/**
 * One subject of the SAT, read by its parts (the progress page): a row of
 * figures for the subject, then one card for each of its four domains — the
 * diagnostic baseline and every check-in that asked it, as columns with the
 * lessons between; where it stands; and each of its skills on its own line.
 */
export function SubjectView({
  measure,
  satScore,
  target,
}: {
  measure: SubjectMeasure
  /** The latest SAT score for this half, and the student's goal for it. */
  satScore: { score: number; on: string } | null
  target: number | null
}) {
  const view = SUBJECT_VIEW[measure.subject]
  const tested = measure.sections.filter((s) => s.attempts.length > 0).length
  const overall = percent({ right: measure.right, of: measure.answered })
  const gap = toGo(satScore?.score, target)
  const c = measure.skillCounts
  return (
    <section className={`subject-view tone-${view.tone}`} aria-label={view.name}>
      <header className="subject-view-head">
        <span className="subject-mark" aria-hidden="true" />
        <h2>{view.name}</h2>
        {view.sat !== view.name && <span className="subject-view-sat">{view.sat}</span>}
      </header>

      <div className="subject-figures">
        <Figure label="Tests taken" value={String(measure.tests)} note={measure.lessons > 0 ? `and ${plural(measure.lessons, 'lesson')}` : undefined} />
        <Figure label="Questions answered" value={String(measure.answered)} />
        <Figure label="Right overall" value={overall === null ? '—' : `${overall}%`} />
        <Figure
          label={`SAT ${view.sat}`}
          value={satScore ? String(satScore.score) : '—'}
          note={
            target !== null
              ? `Goal ${target}${gap ? ` · ${gap.toLowerCase()}` : ''}`
              : satScore
                ? dayLabel(satScore.on)
                : 'No score yet'
          }
        />
      </div>

      <div className="skill-tally" aria-label={`${view.name} skills`}>
        <span className="skill-tally-label">Skills</span>
        <RagCount rag="green" n={c.green} />
        <RagCount rag="amber" n={c.amber} />
        <RagCount rag="red" n={c.red} />
        <RagCount rag={null} n={c.none} />
      </div>

      <div className="subject-sections-head">
        <h3>By domain</h3>
        <span className="dash-muted">
          {tested} of {measure.sections.length} tested
        </span>
      </div>
      <div className="section-cards">
        {measure.sections.map((s) => (
          <SectionCard key={s.section} section={s} />
        ))}
      </div>
    </section>
  )
}

function Figure({ label, value, note }: { label: string; value: string; note?: string }) {
  return (
    <div className="subject-figure">
      <div className="subject-figure-label">{label}</div>
      <div className="subject-figure-value">{value}</div>
      {note && <div className="subject-figure-note">{note}</div>}
    </div>
  )
}

/** "Baseline only", "Baseline + 2 check-ins", "2 check-ins". */
export function pointsSummary(attempts: Attempt[]): string {
  if (attempts.length === 0) return 'Not tested yet'
  const base = attempts[0].mode === 'diagnostic'
  const checkIns = attempts.length - (base ? 1 : 0)
  if (base && checkIns === 0) return 'Baseline only'
  const ci = plural(checkIns, 'check-in')
  return base ? `Baseline + ${ci}` : ci
}

/** One domain: its standing, its line as columns, and its skills. */
export function SectionCard({ section }: { section: SectionMeasure }) {
  const s = section
  const asked = s.attempts.length > 0
  const step = nextStep(s.rag)
  return (
    <article className={`section-card${asked ? '' : ' is-untested'}`}>
      <header className="section-card-head">
        <div className="section-card-title">
          <h4>{s.label}</h4>
          <div className="section-card-meta">
            {asked ? (
              <>
                <b>{pointsSummary(s.attempts)}</b> · {plural(s.answered, 'question')}
              </>
            ) : (
              'Not tested yet'
            )}
          </div>
        </div>
        <RagChip rag={s.rag} />
      </header>

      {asked && (
        <>
          <dl className="section-card-figures">
            <div>
              <dt>Baseline</dt>
              <dd>
                <span className="num">{Math.round(s.first!.level)}</span>
                <small className="num">
                  {s.first!.right}/{s.first!.of} right
                </small>
              </dd>
            </div>
            <div>
              <dt>Latest</dt>
              <dd>
                <span className="num">{Math.round(s.latest!.level)}</span>
                <small className="num">
                  {s.latest!.right}/{s.latest!.of} right
                </small>
              </dd>
            </div>
            <div>
              <dt>Change</dt>
              <dd>
                <span className="num">{s.levelChange === null ? '—' : signed(s.levelChange)}</span>
                <small>{s.verdict ? VERDICT_LABELS[s.verdict] : 'one test so far'}</small>
              </dd>
            </div>
            <div>
              <dt>Sessions</dt>
              <dd>
                <span className="num">{s.sessions}</span>
                <small>since the baseline</small>
              </dd>
            </div>
            {s.band && (
              <div>
                <dt>SAT band</dt>
                <dd>
                  <span className="num">
                    {s.band.range[0]}–{s.band.range[1]}
                  </span>
                  <small>{monthYear(s.band.on)}</small>
                </dd>
              </div>
            )}
          </dl>
          <AttemptsChart attempts={s.attempts} label={s.label} />
        </>
      )}

      <ul className="section-skills" aria-label={`${s.label} skills`}>
        {s.skills.map((k) => (
          <SkillRow key={k.skill} skill={k} />
        ))}
      </ul>

      <footer className={`section-card-next is-${step}`}>
        {NEXT_WORDS[step]}
        {asked && s.sinceLast > 0 && (
          <span className="section-card-since">
            {' '}
            {plural(s.sinceLast, 'session')} since the last test on it.
          </span>
        )}
      </footer>
    </article>
  )
}

const NEXT_WORDS = {
  on_track: 'On track — keep it up with mixed practice.',
  practise: 'Practise more — ask your teacher for a check-in on this domain.',
  untested: 'Not tested yet — it will show here after a test that asks it.',
} as const

function nextStep(rag: Rag | null): keyof typeof NEXT_WORDS {
  if (rag === null) return 'untested'
  return rag === 'green' ? 'on_track' : 'practise'
}

/** One skill: its tests as tiny columns, its latest score, and where it stands. */
function SkillRow({ skill }: { skill: SkillMeasure }) {
  const k = skill
  const asked = k.attempts.length > 0
  return (
    <li className={`section-skill${asked ? '' : ' is-untested'}`}>
      <div className="section-skill-name">
        <span>{k.label}</span>
        <small>
          {asked ? pointsSummary(k.attempts) : 'Not tested'}
          {k.verdict && <> · {VERDICT_LABELS[k.verdict]}</>}
        </small>
      </div>
      {asked ? <MiniColumns attempts={k.attempts} label={k.label} /> : <span />}
      <span className="section-skill-score num">{asked ? `${k.latest!.right}/${k.latest!.of}` : '—'}</span>
      <RagChip rag={k.rag} small />
    </li>
  )
}

function RagCount({ rag, n }: { rag: Rag | null; n: number }) {
  return (
    <span className={`rag-chip rag-chip-${rag ?? 'none'}`}>
      <span className="rag-chip-dot" aria-hidden="true" />
      <b className="num">{n}</b> {rag ? RAG_LABEL[rag] : 'Not tested'}
    </span>
  )
}

export function RagChip({ rag, small }: { rag: Rag | null; small?: boolean }) {
  return (
    <span className={`rag-chip rag-chip-${rag ?? 'none'}${small ? ' is-small' : ''}`}>
      <span className="rag-chip-dot" aria-hidden="true" />
      {rag ? RAG_LABEL[rag] : 'Not tested'}
    </span>
  )
}

/** At most this many columns: the latest ones. */
const MAX_COLUMNS = 8

/** "Baseline", "Check-in 1", … — what the column is. */
function pointName(attempts: Attempt[], n: number): string {
  const base = attempts[0]?.mode === 'diagnostic'
  if (base && n === 0) return 'Baseline'
  return `Check-in ${base ? n : n + 1}`
}

/**
 * A domain's line as columns — the baseline, then each check-in — with the
 * lessons between marked in the gap. One series, so no legend: the cap
 * carries the score, the axis its name and day, and hover or focus the whole
 * of it, level score included.
 */
export function AttemptsChart({ attempts, label }: { attempts: Attempt[]; label: string }) {
  const shown = attempts.slice(-MAX_COLUMNS)
  const offset = attempts.length - shown.length
  return (
    <figure className="attempts-chart">
      <figcaption>
        From the baseline, each check-in
        {offset > 0 && <span className="dash-muted"> · the last {MAX_COLUMNS} of {attempts.length}</span>}
      </figcaption>
      <div className="attempts-plot" role="list" aria-label={`${label}: score on each test`}>
        {shown.map((a, i) => {
          const pct = percent(a) ?? 0
          const n = offset + i
          const name = pointName(attempts, n)
          const day = dayLabel(a.at.slice(0, 10))
          const between = n > 0 && a.sessionsBefore > 0 ? `${plural(a.sessionsBefore, 'session')} before it` : null
          const words = `${name}, ${day}: ${a.right} of ${a.of} right, ${pct}%, level ${Math.round(a.level)}${between ? `; ${between}` : ''}`
          return (
            <div key={a.sessionId} className="attempt-col" role="listitem" tabIndex={0} aria-label={words}>
              {between && (
                <span className="attempt-between" aria-hidden="true" title={between}>
                  +{a.sessionsBefore}
                </span>
              )}
              <span className="attempt-tip" role="tooltip">
                <b>{name}</b>
                <span>{day}</span>
                <span className="num">
                  {a.right} of {a.of} right · {pct}% · level {Math.round(a.level)}
                </span>
                {between && <span>{between}</span>}
              </span>
              <span className="attempt-track" style={{ ['--h' as string]: `${Math.max(pct, 2)}%` } as CSSProperties}>
                <span className="attempt-bar" />
                <span className="attempt-cap num">
                  {a.right}/{a.of}
                </span>
              </span>
              <span className="attempt-x">
                <b>{name}</b>
                <span>{shortDay(a.at)}</span>
              </span>
            </div>
          )
        })}
      </div>
      {shown.some((a, i) => offset + i > 0 && a.sessionsBefore > 0) && (
        <p className="attempts-note">
          <span className="attempt-between is-key">+n</span> lessons between two tests
        </p>
      )}
    </figure>
  )
}

/** A skill's tests as tiny columns, in a 60px strip. */
function MiniColumns({ attempts, label }: { attempts: Attempt[]; label: string }) {
  const shown = attempts.slice(-6)
  const offset = attempts.length - shown.length
  const words = shown.map((a, i) => `${pointName(attempts, offset + i)}: ${a.right}/${a.of}`).join(', ')
  return (
    <span className="mini-cols" role="img" aria-label={`${label}, each test: ${words}`} title={words}>
      {shown.map((a) => (
        <span key={a.sessionId} style={{ height: `${Math.max(percent(a) ?? 0, 6)}%` }} />
      ))}
    </span>
  )
}

/** The two subject cards that switch between them: each subject at a glance. */
export function SubjectSwitch({
  measures,
  sat,
  value,
  onChange,
}: {
  measures: Partial<Record<Subject, SubjectMeasure>>
  sat: { rw: number; math: number } | null
  value: Subject
  onChange: (s: Subject) => void
}) {
  return (
    <div className="subject-switch no-print" role="tablist" aria-label="Subject">
      {(['english', 'mathematics'] as const).map((subject) => {
        const view = SUBJECT_VIEW[subject]
        const m = measures[subject]
        const score = sat ? (subject === 'english' ? sat.rw : sat.math) : null
        const weak = m ? m.sections.filter((s) => s.rag === 'red' || s.rag === 'amber').length : 0
        return (
          <button
            key={subject}
            type="button"
            role="tab"
            aria-selected={value === subject}
            className={`subject-tab tone-${view.tone}${value === subject ? ' on' : ''}`}
            onClick={() => onChange(subject)}
          >
            <span className="subject-tab-name">
              <span className="subject-mark" aria-hidden="true" />
              {view.name}
              {view.sat !== view.name && <small>{view.sat}</small>}
            </span>
            <span className="subject-tab-facts">
              <span>
                <b className="num">{m ? m.tests : 0}</b> tests
              </span>
              <span>
                <b className="num">{score ?? '—'}</b> SAT
              </span>
              <span>
                <b className="num">{weak}</b> to practise
              </span>
            </span>
          </button>
        )
      })}
    </div>
  )
}

export const plural = (n: number, word: string) => `${n} ${word}${n === 1 ? '' : 's'}`

export function signed(n: number): string {
  return n > 0 ? `+${n}` : n < 0 ? `−${-n}` : '±0'
}

function shortDay(at: string): string {
  return new Date(at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', timeZone: 'UTC' })
}

function monthYear(day: string): string {
  return new Date(`${day}T00:00:00Z`).toLocaleDateString('en-GB', { month: 'short', year: 'numeric', timeZone: 'UTC' })
}
