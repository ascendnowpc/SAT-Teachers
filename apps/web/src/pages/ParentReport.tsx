import { useCallback, useEffect, useMemo, useState } from 'react'
import { Navigate, useLocation, useSearchParams } from 'react-router-dom'
import { BluebookScores } from '../components/BluebookScores'
import { DomainBands } from '../components/DomainBands'
import { SubjectSwitch, SubjectView } from '../components/SubjectProgress'
import { StudentShell } from '../components/StudentShell'
import { Notice } from '../components/ui'
import { byDay, dayLabel, latestDomains, ordinal, type BluebookRow } from '../lib/bluebook'
import { latestSat, type StudentGoal } from '../lib/goal'
import { asProgress, LEVEL_CUTOFFS, LEVEL_MAX, RAG_HINT, type StudentReport } from '../lib/parentReport'
import { storeStudentKey, storedStudentKey } from '../lib/studentAccount'
import { studentBluebook } from '../lib/bluebookApi'
import { loadStudentGoal, loadStudentReport } from '../lib/studentApi'
import { EMPTY_PROGRESS, measureSubject, SUBJECT_ORDER, type SubjectMeasure } from '../lib/subjectProgress'
import type { Subject } from '../lib/types'


/**
 * The student's progress (0070), opened from their account: the SAT by its
 * parts. English and Math apart — each its own page, switched at the top —
 * and inside each its four sections, every one measured on its own: how many
 * tests have asked it, how much was right on each from the first to the
 * latest, where it stands, and each of its skills. Their goal and their next
 * SAT across the top (0101). Printed, it is both subjects.
 */
export function ParentReport() {
  const [key] = useState(() => storedStudentKey())
  const [report, setReport] = useState<StudentReport | null>(null)
  const [goal, setGoal] = useState<StudentGoal | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [signedOut, setSignedOut] = useState(false)
  const [params, setParams] = useSearchParams()

  const load = useCallback(async () => {
    if (!key) return
    try {
      setReport(await loadStudentReport(key))
      // On the side: a failure costs the page its goal, not the progress.
      loadStudentGoal(key)
        .then((state) => setGoal(state.goal))
        .catch(() => setGoal(null))
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

  // "Add your SAT score" lands on the form.
  const location = useLocation()
  useEffect(() => {
    if (report && location.hash === '#sat-scores') {
      document.getElementById('sat-scores')?.scrollIntoView({ block: 'start' })
    }
  }, [report, location.hash])

  const sat = useMemo(() => (report?.bluebook ? byDay(report.bluebook) : []), [report])
  const latest = useMemo(() => latestSat(sat), [sat])

  // Both subjects, always: one never sat reads as four sections not tested yet.
  const measures = useMemo(() => {
    const out: Partial<Record<Subject, SubjectMeasure>> = {}
    if (!report) return out
    for (const s of SUBJECT_ORDER) {
      const payload = report.subjects[s]
      out[s] = measureSubject(s, payload ? asProgress(payload) : EMPTY_PROGRESS, sat)
    }
    return out
  }, [report, sat])

  // ?subject= from the home page; else the one with the latest test.
  const asked = params.get('subject')
  const subject: Subject =
    asked === 'english' || asked === 'mathematics'
      ? asked
      : (SUBJECT_ORDER.map((s) => ({ s, at: measures[s]?.latestAt ?? '' }))
          .filter((x) => x.at)
          .sort((a, b) => b.at.localeCompare(a.at))[0]?.s ?? 'english')

  function choose(s: Subject) {
    setParams({ subject: s }, { replace: true })
  }

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

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
            </div>

            <SubjectSwitch
              measures={measures}
              sat={latest ? { rw: latest.rw, math: latest.math } : null}
              value={subject}
              onChange={choose}
            />

            {SUBJECT_ORDER.map((s) => (
              <div key={s} className={`subject-pane${s === subject ? '' : ' is-other'}`}>
                {measures[s] && (
                  <SubjectView
                    measure={measures[s]!}
                    satScore={latest ? { score: s === 'english' ? latest.rw : latest.math, on: latest.on } : null}
                    target={s === 'english' ? (goal?.target_rw ?? null) : (goal?.target_math ?? null)}
                  />
                )}
              </div>
            ))}

            <div className="progress-foot">
              {/* On screen the scores are the form below; on paper, this. */}
              {sat.length > 0 && <BluebookSection rows={sat} />}
              <p className="progress-key">
                <span className="rag-chip rag-chip-green">
                  <span className="rag-chip-dot" aria-hidden="true" />
                  {RAG_HINT.green} · {LEVEL_CUTOFFS.green}+
                </span>
                <span className="rag-chip rag-chip-amber">
                  <span className="rag-chip-dot" aria-hidden="true" />
                  {RAG_HINT.amber} · {LEVEL_CUTOFFS.amber}–{LEVEL_CUTOFFS.green - 1}
                </span>
                <span className="rag-chip rag-chip-red">
                  <span className="rag-chip-dot" aria-hidden="true" />
                  {RAG_HINT.red} · below {LEVEL_CUTOFFS.amber}
                </span>
                <span className="progress-key-note">Out of {LEVEL_MAX}, from the latest test that asked it — not a predicted SAT score.</span>
              </p>
            </div>
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

/**
 * Their SAT scores (0088, 0090), each split into its two halves: the latest,
 * its percentile where the report gave one, every test — official SATs and
 * Bluebook practice tests together — and the domains' bands from the latest
 * report that gave them.
 */
function BluebookSection({ rows }: { rows: BluebookRow[] }) {
  const sorted = byDay(rows)
  const last = sorted[sorted.length - 1]
  const bands = latestDomains(rows)
  return (
    <section className="dash-panel print-only">
      <div className="dash-panel-head">
        <h2>SAT scores</h2>
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
        <table className="sat-table">
          <thead>
            <tr>
              <th>Day</th>
              <th>Test</th>
              <th className="num">R&amp;W</th>
              <th className="num">Math</th>
              <th className="num">Total</th>
            </tr>
          </thead>
          <tbody>
            {[...sorted].reverse().map((r) => (
              <tr key={`${r.taken_on}/${r.test_name}`}>
                <td>{dayLabel(r.taken_on)}</td>
                <td className="muted">{r.test_name}</td>
                <td className="num">{r.reading_writing}</td>
                <td className="num">{r.math}</td>
                <td className="num">
                  <b>{r.total}</b>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
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

function longDate(at: string): string {
  return new Date(at).toLocaleDateString('en-GB', { day: 'numeric', month: 'long', year: 'numeric', timeZone: 'UTC' })
}
