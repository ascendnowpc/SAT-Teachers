import { useEffect, useMemo, useState } from 'react'
import { Link, Navigate } from 'react-router-dom'
import { Logo } from '../components/Logo'
import { Notice } from '../components/ui'
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

  useEffect(() => {
    if (!key) return
    let active = true
    loadStudentReport(key)
      .then((r) => {
        if (!active) return
        setReport(r)
        const subjects = Object.keys(r.subjects) as Subject[]
        setSubject((s) => s ?? (subjects.includes('english') ? 'english' : subjects[0] ?? null))
      })
      .catch((err: unknown) => {
        if (!active) return
        const message = err instanceof Error ? err.message : 'Could not load the report.'
        if (/signed out/i.test(message)) {
          storeStudentKey(null)
          setSignedOut(true)
        } else setError(message)
      })
    return () => {
      active = false
    }
  }, [key])

  const built = useMemo(
    () => (report && subject && report.subjects[subject] ? buildParentReport(subject, report.subjects[subject]!) : null),
    [report, subject],
  )

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  const subjects = report ? (Object.keys(report.subjects) as Subject[]) : []

  return (
    <div className="student-home">
      <header className="student-bar no-print">
        <Logo />
        <div className="student-bar-who">
          <Link className="btn btn-ghost btn-sm" to="/student">
            My tests
          </Link>
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => window.print()}>
            Print
          </button>
        </div>
      </header>

      <main className="report-main">
        {error && <Notice kind="error">{error}</Notice>}
        {!report && !error && <p className="muted">Loading…</p>}

        {report && (
          <article className="report-card" aria-label="Progress report">
            <div className="report-head">
              <div>
                <div className="report-kicker">SAT progress report</div>
                <h1>{report.student.full_name}</h1>
                <div className="report-meta">
                  <span className="num">{report.student.display_id}</span> · {longDate(report.at)}
                </div>
              </div>
              {subjects.length > 1 && (
                <div className="report-subjects no-print" role="tablist" aria-label="Subject">
                  {subjects.map((s) => (
                    <button
                      key={s}
                      type="button"
                      role="tab"
                      aria-selected={s === subject}
                      className={`btn btn-sm ${s === subject ? 'btn-primary' : 'btn-ghost'}`}
                      onClick={() => setSubject(s)}
                    >
                      {subjectLabel(s)}
                    </button>
                  ))}
                </div>
              )}
            </div>

            {subjects.length === 0 && <p className="muted">No tests yet. The report fills in after the first one.</p>}

            {built && subject && (
              <>
                <section className="report-headline">
                  <div className="report-label">{subjectLabel(subject)} · headline</div>
                  {built.headline ? (
                    <>
                      <div className="report-hero">
                        <span className="report-hero-skill">{built.headline.skill}</span>
                        <span className="report-hero-score num">{built.headline.scores}</span>
                      </div>
                      <div className="report-hero-over">{built.headline.over}</div>
                    </>
                  ) : (
                    <p className="muted">No targeted tests yet — the skill map below shows the diagnostic.</p>
                  )}
                </section>

                <section className="report-section">
                  <div className="report-section-head">
                    <h2>Skills</h2>
                    <div className="rag-legend">
                      {(['green', 'amber', 'red'] as Rag[]).map((r) => (
                        <span key={r} className={`rag rag-${r}`}>
                          <RagIcon rag={r} />
                          {RAG_LABEL[r]}
                        </span>
                      ))}
                      <span className="rag rag-none">Not tested yet</span>
                    </div>
                  </div>
                  {built.map.map((sec) => (
                    <div key={sec.section} className="report-skill-group">
                      <div className="report-group-label">{sec.label}</div>
                      <ul className="report-skills">
                        {sec.skills.map((c) => (
                          <SkillRow key={c.skill} cell={c} />
                        ))}
                      </ul>
                    </div>
                  ))}
                </section>

                {built.lines.length > 0 && (
                  <section className="report-section">
                    <h2>Trend</h2>
                    <p className="report-note">Each targeted test on a skill, first to latest, scored out of 10.</p>
                    <ul className="report-trends">
                      {built.lines.map((l) => (
                        <TrendRow key={`${l.section}/${l.skill ?? ''}`} line={l} />
                      ))}
                    </ul>
                  </section>
                )}

                <p className="report-foot">
                  Scores are right answers out of the questions reached. Strong is{' '}
                  {Math.round(RAG_CUTOFFS.green * 100)}% or more, getting there{' '}
                  {Math.round(RAG_CUTOFFS.amber * 100)}–{Math.round(RAG_CUTOFFS.green * 100) - 1}%, needs work below{' '}
                  {Math.round(RAG_CUTOFFS.amber * 100)}%, from the latest session that asked the skill.
                </p>
              </>
            )}
          </article>
        )}
      </main>
    </div>
  )
}

function SkillRow({ cell }: { cell: SkillCell }) {
  return (
    <li className={`report-skill rag-row-${cell.rag ?? 'none'}`}>
      <span className="report-skill-name">{cell.label}</span>
      {cell.rag && cell.latest ? (
        <span className="report-skill-state">
          <span className={`rag rag-${cell.rag}`}>
            <RagIcon rag={cell.rag} />
            {RAG_LABEL[cell.rag]}
          </span>
          <span className="num report-skill-score">
            {cell.latest.right} of {cell.latest.of}
          </span>
        </span>
      ) : (
        <span className="report-skill-state muted">Not tested yet</span>
      )}
    </li>
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

function RagIcon({ rag }: { rag: Rag }) {
  return (
    <svg className="rag-icon" viewBox="0 0 12 12" width={12} height={12} aria-hidden="true">
      {rag === 'green' && <path d="M2.5 6.3 5 8.6l4.5-5" fill="none" strokeWidth={1.8} strokeLinecap="round" strokeLinejoin="round" />}
      {rag === 'amber' && <path d="M2.5 6h7" fill="none" strokeWidth={1.8} strokeLinecap="round" />}
      {rag === 'red' && <path d="m3 3 6 6M9 3 3 9" fill="none" strokeWidth={1.8} strokeLinecap="round" />}
    </svg>
  )
}

function longDate(at: string): string {
  return new Date(at).toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric', timeZone: 'UTC' })
}

function shortDate(at: string): string {
  return new Date(at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', timeZone: 'UTC' })
}
