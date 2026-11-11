import { useCallback, useEffect, useMemo, useState } from 'react'
import { Navigate, useLocation } from 'react-router-dom'
import { BluebookScores } from '../components/BluebookScores'
import { StudentShell } from '../components/StudentShell'
import { CountUp } from '../components/Motion'
import { Notice } from '../components/ui'
import { DomainBands } from '../components/DomainBands'
import { byDay, dayLabel, latestDomains, ordinal, type BluebookRow } from '../lib/bluebook'
import { skillLabel, subjectLabel } from '../lib/constants'
import {
  buildParentReport,
  RAG_CUTOFFS,
  RAG_LABEL,
  type Rag,
  type SkillCell,
  type StudentReport,
} from '../lib/parentReport'
import type { ProgressLine, ProgressPoint } from '../lib/progress'
import { storeStudentKey, storedStudentKey } from '../lib/studentAccount'
import { studentBluebook } from '../lib/bluebookApi'
import { loadStudentReport } from '../lib/studentApi'
import type { Subject } from '../lib/types'

/**
 * The parent report (0070), opened from the student's account: one card,
 * made to be read at a glance and screenshotted — the headline progress, a
 * red / amber / green map of every skill, and the trend on each skill that
 * has had a targeted test. Every colour carries its word too.
 */
export function ParentReport() {
  const [key] = useState(() => storedStudentKey())
  const [report, setReport] = useState<StudentReport | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [signedOut, setSignedOut] = useState(false)
  const [subject, setSubject] = useState<Subject | null>(null)

  const load = useCallback(async () => {
    if (!key) return
    try {
      const r = await loadStudentReport(key)
      setReport(r)
      const subjects = Object.keys(r.subjects) as Subject[]
      setSubject((s) => s ?? (subjects.includes('english') ? 'english' : subjects[0] ?? null))
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Could not load the report.'
      if (/signed out/i.test(message)) {
        storeStudentKey(null)
        setSignedOut(true)
      } else setError(message)
    }
  }, [key])

  useEffect(() => {
    void load()
  }, [load])

  // The student, or their parent, adds a Bluebook score here (0099).
  const bluebook = useMemo(() => (key ? studentBluebook(key) : null), [key])

  // "Add your SAT score" on the home page lands on the form.
  const location = useLocation()
  useEffect(() => {
    if (report && location.hash === '#sat-scores') {
      document.getElementById('sat-scores')?.scrollIntoView({ block: 'start' })
    }
  }, [report, location.hash])

  const built = useMemo(
    () => (report && subject && report.subjects[subject] ? buildParentReport(subject, report.subjects[subject]!) : null),
    [report, subject],
  )
  const cells = useMemo(() => (built ? built.map.flatMap((sec) => sec.skills) : []), [built])
  const tested = cells.filter((c) => c.rag !== null)
  const focus = tested
    .filter((c) => c.rag !== 'green')
    .sort((a, b) => share(a) - share(b))
  const strong = tested.filter((c) => c.rag === 'green').sort((a, b) => share(b) - share(a))
  const untested = cells.filter((c) => c.rag === null)
  const count = (r: Rag) => tested.filter((c) => c.rag === r).length

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  const subjects = report ? (Object.keys(report.subjects) as Subject[]) : []
  const sat = report?.bluebook && report.bluebook.length > 0 ? byDay(report.bluebook) : []
  const latest = sat[sat.length - 1] ?? null

  return (
    <StudentShell
      student={report?.student}
      actions={
        <button type="button" className="btn btn-ghost btn-sm" onClick={() => window.print()}>
          Print
        </button>
      }
    >
      <main className="student-main dashboard progress-main">
        {error && <Notice kind="error">{error}</Notice>}
        {!report && !error && <p className="muted">Loading…</p>}

        {report && (
          <>
            <div className="progress-head">
              <div>
                <h1 className="dash-hello">Progress</h1>
                <p className="progress-sub">
                  {report.student.full_name} · {longDate(report.at)}
                </p>
              </div>
              {subjects.length > 1 && (
                <div className="progress-tabs no-print" role="tablist" aria-label="Subject">
                  {subjects.map((s) => (
                    <button
                      key={s}
                      type="button"
                      role="tab"
                      aria-selected={s === subject}
                      className={s === subject ? 'on' : ''}
                      onClick={() => setSubject(s)}
                    >
                      {subjectLabel(s)}
                    </button>
                  ))}
                </div>
              )}
            </div>

            <div className="dash-stats">
              <StatCard tone="peach" label="SAT score" value={latest ? String(latest.total) : '—'} foot={latest ? dayLabel(latest.taken_on) : 'Not added yet'} />
              <StatCard tone="mint" label="Strong" value={String(count('green'))} foot="skills" />
              <StatCard tone="sky" label="Getting there" value={String(count('amber'))} foot="skills" />
              <StatCard tone="violet" label="Needs work" value={String(count('red'))} foot="skills" />
            </div>

            {subjects.length === 0 ? (
              <section className="dash-panel progress-empty">
                <p className="dash-empty">Your progress shows here after your first test.</p>
              </section>
            ) : (
              <div className="dash-grid">
                <div className="dash-col">
                  {built?.headline && (
                    <section className="dash-panel progress-headline">
                      <div className="progress-headline-label">Latest change</div>
                      <div className="progress-headline-row">
                        <span className="progress-headline-skill">{built.headline.skill}</span>
                        <span className="progress-headline-score num">{built.headline.scores}</span>
                      </div>
                      <div className="progress-sub">{built.headline.over}</div>
                    </section>
                  )}

                  <Panel title="Focus on" note={focus.length > 0 ? `${focus.length}` : undefined}>
                    {focus.length === 0 ? (
                      <p className="dash-empty">{tested.length === 0 ? 'Nothing tested yet.' : 'Nothing below strong — well done.'}</p>
                    ) : (
                      <ul className="skill-bars">
                        {focus.map((c) => (
                          <SkillBar key={c.skill} cell={c} />
                        ))}
                      </ul>
                    )}
                  </Panel>

                  {strong.length > 0 && (
                    <Panel title="Strengths" note={`${strong.length}`}>
                      <ul className="skill-bars">
                        {strong.map((c) => (
                          <SkillBar key={c.skill} cell={c} />
                        ))}
                      </ul>
                    </Panel>
                  )}

                  {untested.length > 0 && (
                    <details className="dash-panel progress-untested">
                      <summary>
                        <span>Not tested yet</span>
                        <span className="progress-count">{untested.length}</span>
                      </summary>
                      <div className="untested-chips">
                        {untested.map((c) => (
                          <span key={c.skill}>{c.label}</span>
                        ))}
                      </div>
                    </details>
                  )}
                </div>

                <div className="dash-col">
                  {built && built.lines.length > 0 && (
                    <Panel title="Trend">
                      <ul className="report-trends">
                        {built.lines.map((l) => (
                          <TrendRow key={`${l.section}/${l.skill ?? ''}`} line={l} />
                        ))}
                      </ul>
                    </Panel>
                  )}
                  {sat.length > 0 && <BluebookSection rows={sat} />}
                  <p className="progress-key">
                    <span className="rag rag-green">Strong {Math.round(RAG_CUTOFFS.green * 100)}%+</span>
                    <span className="rag rag-amber">
                      Getting there {Math.round(RAG_CUTOFFS.amber * 100)}–{Math.round(RAG_CUTOFFS.green * 100) - 1}%
                    </span>
                    <span className="rag rag-red">Needs work</span>
                  </p>
                </div>
              </div>
            )}
          </>
        )}
      </main>
      {report && bluebook && (
        <div className="report-bluebook-edit no-print">
          <BluebookScores api={bluebook} studentName={report.student.full_name} onChanged={() => void load()} />
        </div>
      )}
    </StudentShell>
  )
}

function share(c: SkillCell): number {
  return c.latest && c.latest.of > 0 ? c.latest.right / c.latest.of : 0
}

function Panel({ title, note, children }: { title: string; note?: string; children: React.ReactNode }) {
  return (
    <section className="dash-panel">
      <div className="dash-panel-head">
        <h2>
          {title}
          {note && <span className="progress-count">{note}</span>}
        </h2>
      </div>
      {children}
    </section>
  )
}

function StatCard({ tone, label, value, foot }: { tone: 'violet' | 'sky' | 'mint' | 'peach'; label: string; value: string; foot: string }) {
  return (
    <div className={`dash-stat is-${tone}`}>
      <div className="dash-stat-top">
        <span className="dash-stat-label">{label}</span>
      </div>
      <div className="dash-stat-bottom">
        <CountUp className="dash-stat-value" value={value} />
        <span className="dash-stat-note">{foot}</span>
      </div>
    </div>
  )
}

/** One skill: its name, a bar of how much was right, and the count. */
function SkillBar({ cell }: { cell: SkillCell }) {
  const pct = Math.round(share(cell) * 100)
  return (
    <li className={`skill-bar rag-row-${cell.rag ?? 'none'}`}>
      <div className="skill-bar-top">
        <span className="skill-bar-name">{cell.label}</span>
        <span className="skill-bar-score num">
          {cell.latest!.right}/{cell.latest!.of}
        </span>
      </div>
      <div className="skill-bar-track" role="img" aria-label={`${pct}% right, ${cell.rag ? RAG_LABEL[cell.rag] : ''}`}>
        <span style={{ width: `${Math.max(pct, 4)}%` }} />
      </div>
    </li>
  )
}

/**
 * Their SAT scores (0088, 0090): the latest total, its percentile where the
 * report gave one, the line from the first, each test — official SATs and
 * Bluebook practice tests together — and the domains' bands from the latest
 * report that gave them.
 */
function BluebookSection({ rows }: { rows: BluebookRow[] }) {
  const sorted = byDay(rows)
  const last = sorted[sorted.length - 1]
  const bands = latestDomains(rows)
  return (
    <section className="dash-panel">
      <div className="dash-panel-head">
        <h2>SAT scores</h2>
        <a className="no-print" href="#sat-scores">Add or edit</a>
      </div>
      <div className="sat-latest">
        <div>
          <div className="sat-latest-total num">{last.total}</div>
          <div className="progress-sub">
            {last.official ? last.test_name : 'Latest'} · of 1600
            {last.total_percentile ? ` · ${ordinal(last.total_percentile)} percentile` : ''}
          </div>
        </div>
        <div className="sat-latest-parts">
          <span>
            <b className="num">{last.reading_writing}</b> Reading &amp; Writing
          </span>
          <span>
            <b className="num">{last.math}</b> Math
          </span>
        </div>
      </div>
      {sorted.length > 1 && (
        <ul className="sat-history">
          {[...sorted].reverse().map((r) => (
            <li key={`${r.taken_on}/${r.test_name}`}>
              <span>{dayLabel(r.taken_on)}</span>
              <span className="muted">{r.test_name}</span>
              <b className="num">{r.total}</b>
            </li>
          ))}
        </ul>
      )}
      {bands && bands.domains && (
        <details className="sat-bands">
          <summary>By domain</summary>
          <DomainBands domains={bands.domains} />
        </details>
      )}
    </section>
  )
}

const VERDICT: Record<string, string> = { improved: 'Improved', minimal: 'Minimal change', declined: 'Declined' }

function TrendRow({ line }: { line: ProgressLine }) {
  const first = line.points[0]
  const last = line.points[line.points.length - 1]
  const step = last.step
  return (
    <li className="report-trend">
      <div className="report-trend-name">{(line.skill ? skillLabel(line.skill) : null) ?? 'Whole section'}</div>
      <Sparkline points={line.points} />
      <div className="report-trend-figures">
        <span className="num">
          {line.points.length > 1 ? `${first.correct}/${first.reached} → ` : ''}
          {last.correct}/{last.reached}
        </span>
        {step && <span className="report-trend-verdict">{VERDICT[step.verdict] ?? ''}</span>}
      </div>
    </li>
  )
}

/** One series, out of 10: a 2px line, 8px dots ringed in the surface, the last one labelled. */
function Sparkline({ points }: { points: ProgressPoint[] }) {
  const w = 180
  const h = 44
  const pad = 6
  const x = (i: number) => (points.length === 1 ? w / 2 : pad + (i * (w - 2 * pad)) / (points.length - 1))
  const y = (raw: number) => pad + ((10 - Math.max(0, Math.min(10, raw))) * (h - 2 * pad)) / 10
  const path = points.map((p, i) => `${i === 0 ? 'M' : 'L'}${x(i).toFixed(1)},${y(p.raw).toFixed(1)}`).join(' ')
  const label = points.map((p) => `${shortDate(p.at)}: ${p.correct} of ${p.reached}`).join('; ')

  return (
    <svg className="sparkline" viewBox={`0 0 ${w} ${h}`} width={w} height={h} role="img" aria-label={label}>
      <line x1={pad} x2={w - pad} y1={h - pad} y2={h - pad} className="sparkline-base" />
      {points.length > 1 && <path d={path} className="sparkline-line" />}
      {points.map((p, i) => (
        <circle key={p.sessionId} cx={x(i)} cy={y(p.raw)} r={4} className="sparkline-dot">
          <title>
            {shortDate(p.at)} · {p.kind === 'diagnostic' ? 'diagnostic' : 'targeted test'} · {p.correct} of {p.reached}
          </title>
        </circle>
      ))}
    </svg>
  )
}

function longDate(at: string): string {
  return new Date(at).toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric', timeZone: 'UTC' })
}

function shortDate(at: string): string {
  return new Date(at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', timeZone: 'UTC' })
}
