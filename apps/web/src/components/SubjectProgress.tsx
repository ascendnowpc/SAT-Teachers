import type { CSSProperties } from 'react'
import { dayLabel } from '../lib/bluebook'
import { toGo } from '../lib/goal'
import { RAG_LABEL, type Rag } from '../lib/parentReport'
import { VERDICT_LABELS } from '../lib/progress'
import {
  attemptKind,
  percent,
  signedPoints,
  SUBJECT_VIEW,
  type Attempt,
  type SectionMeasure,
  type SkillMeasure,
  type SubjectMeasure,
} from '../lib/subjectProgress'
import type { Subject } from '../lib/types'

/**
 * One subject of the SAT, read by its parts (the progress page): a row of
 * figures for the subject, then one card for each of its four sections —
 * every test that asked it, first to latest, as columns; where it stands; and
 * each of its skills on its own line.
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
        <Figure label="Tests taken" value={String(measure.attempts.length)} />
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
        <h3>By section</h3>
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

/** One section: its standing, its tests as columns, and its skills. */
export function SectionCard({ section }: { section: SectionMeasure }) {
  const s = section
  const asked = s.attempts.length > 0
  return (
    <article className={`section-card${asked ? '' : ' is-untested'}`}>
      <header className="section-card-head">
        <div className="section-card-title">
          <h4>{s.label}</h4>
          <div className="section-card-meta">
            {asked ? (
              <>
                <b>{plural(s.attempts.length, 'test')}</b> · {plural(s.answered, 'question')}
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
              <dt>Latest</dt>
              <dd>
                <span className="num">{percent(s.latest)}%</span>
                <small className="num">
                  {s.latest!.right}/{s.latest!.of}
                </small>
              </dd>
            </div>
            <div>
              <dt>First</dt>
              <dd>
                <span className="num">{percent(s.first)}%</span>
                <small className="num">
                  {s.first!.right}/{s.first!.of}
                </small>
              </dd>
            </div>
            <div>
              <dt>Change</dt>
              <dd>
                <span className="num">{s.change === null ? '—' : signedPoints(s.change)}</span>
                <small>{s.change === null ? 'one test so far' : s.verdict ? VERDICT_LABELS[s.verdict] : 'points'}</small>
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

      <footer className={`section-card-next is-${nextStep(s.rag)}`}>{NEXT_WORDS[nextStep(s.rag)]}</footer>
    </article>
  )
}

const NEXT_WORDS = {
  on_track: 'On track — keep it up with mixed practice.',
  practise: 'Practise more — ask your teacher for a practice test on this section.',
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
          {asked ? plural(k.attempts.length, 'test') : 'Not tested'}
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

/**
 * A section's tests, first to latest, as columns of how much was right — one
 * series, so no legend: the column's cap carries its score, the axis its turn
 * and day, and hover or focus the whole of it.
 */
export function AttemptsChart({ attempts, label }: { attempts: Attempt[]; label: string }) {
  const shown = attempts.slice(-MAX_COLUMNS)
  const offset = attempts.length - shown.length
  return (
    <figure className="attempts-chart">
      <figcaption>
        Each test, first to latest
        {offset > 0 && <span className="dash-muted"> · the last {MAX_COLUMNS} of {attempts.length}</span>}
      </figcaption>
      <div className="attempts-plot" role="list" aria-label={`${label}: score on each test`}>
        {shown.map((a, i) => {
          const pct = percent(a) ?? 0
          const n = offset + i + 1
          const words = `${ordinalWord(n)} test, ${attemptKind(a.mode).toLowerCase()} on ${dayLabel(a.at.slice(0, 10))}: ${a.right} of ${a.of} right, ${pct}%`
          return (
            <div key={a.sessionId} className="attempt-col" role="listitem" tabIndex={0} aria-label={words}>
              <span className="attempt-tip" role="tooltip">
                <b>
                  {ordinalWord(n)} · {attemptKind(a.mode)}
                </b>
                <span>{dayLabel(a.at.slice(0, 10))}</span>
                <span className="num">
                  {a.right} of {a.of} right · {pct}%
                </span>
              </span>
              <span className="attempt-track" style={{ ['--h' as string]: `${Math.max(pct, 2)}%` } as CSSProperties}>
                <span className="attempt-bar" />
                <span className="attempt-cap num">
                  {a.right}/{a.of}
                </span>
              </span>
              <span className="attempt-x">
                <b>{ordinal(n)}</b>
                <span>{shortDay(a.at)}</span>
              </span>
            </div>
          )
        })}
      </div>
    </figure>
  )
}

/** A skill's tests as tiny columns, in a 60px strip. */
function MiniColumns({ attempts, label }: { attempts: Attempt[]; label: string }) {
  const shown = attempts.slice(-6)
  const words = shown.map((a, i) => `${ordinal(attempts.length - shown.length + i + 1)}: ${a.right}/${a.of}`).join(', ')
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
                <b className="num">{m ? m.attempts.length : 0}</b> tests
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

const plural = (n: number, word: string) => `${n} ${word}${n === 1 ? '' : 's'}`

function ordinal(n: number): string {
  const s = n % 100 >= 11 && n % 100 <= 13 ? 'th' : (['th', 'st', 'nd', 'rd'][n % 10] ?? 'th')
  return `${n}${s}`
}

function ordinalWord(n: number): string {
  return ['First', 'Second', 'Third', 'Fourth', 'Fifth', 'Sixth', 'Seventh', 'Eighth', 'Ninth', 'Tenth'][n - 1] ?? `${ordinal(n)}`
}

function shortDay(at: string): string {
  return new Date(at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', timeZone: 'UTC' })
}

function monthYear(day: string): string {
  return new Date(`${day}T00:00:00Z`).toLocaleDateString('en-GB', { month: 'short', year: 'numeric', timeZone: 'UTC' })
}
