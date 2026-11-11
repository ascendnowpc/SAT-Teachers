import { useEffect, useMemo, useState } from 'react'
import { Link, Navigate } from 'react-router-dom'
import { CountUp } from '../components/Motion'
import { StudentShell } from '../components/StudentShell'
import { Notice } from '../components/ui'
import { subjectLabel } from '../lib/constants'
import { storeStudentKey, storedStudentKey } from '../lib/studentAccount'
import { loadStudentReports } from '../lib/studentApi'
import {
  filterReports,
  reportKindLabel,
  reportTitle,
  scoreTone,
  type ReportFilter,
  type StudentReportEntry,
  type StudentReportList,
} from '../lib/studentReports'
import type { Subject } from '../lib/types'

/**
 * Every report the teachers, an admin or the PC's side has produced for the
 * student (0098), in the student's own account so a parent signed in with the
 * student's ID and PIN reads them too: each diagnostic and lesson report once
 * generated, and each targeted test once it is over, newest first.
 */
export function StudentReports() {
  const [key] = useState(() => storedStudentKey())
  const [list, setList] = useState<StudentReportList | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [signedOut, setSignedOut] = useState(false)
  const [kind, setKind] = useState<ReportFilter>('all')
  const [subject, setSubject] = useState<Subject | 'all'>('all')

  useEffect(() => {
    if (!key) return
    let active = true
    loadStudentReports(key)
      .then((l) => active && setList(l))
      .catch((err: unknown) => {
        if (!active) return
        const message = err instanceof Error ? err.message : 'Could not load the reports.'
        if (/signed out/i.test(message)) {
          storeStudentKey(null)
          setSignedOut(true)
        } else setError(message)
      })
    return () => {
      active = false
    }
  }, [key])

  const reports = useMemo(() => list?.reports ?? [], [list])
  const subjects = useMemo(() => [...new Set(reports.map((r) => r.subject))].sort() as Subject[], [reports])
  const shown = useMemo(() => filterReports(reports, kind, subject), [reports, kind, subject])
  const counts = useMemo(
    () => ({
      lesson: reports.filter((r) => r.kind === 'lesson').length,
      targeted: reports.filter((r) => r.kind === 'targeted').length,
    }),
    [reports],
  )

  if (!key || signedOut) return <Navigate to="/login?as=student" replace />

  return (
    <StudentShell student={list?.student}>
      <main className="student-main dashboard">
        <h1 className="dash-hello">Reports</h1>

        {error && <Notice kind="error">{error}</Notice>}
        {!list && !error && <p className="muted">Loading…</p>}

        {list && (
          <>
            <div className="dash-stats dash-stats-3">
              <div className="dash-stat is-violet">
                <span className="dash-stat-label">All reports</span>
                <div className="dash-stat-bottom">
                  <CountUp className="dash-stat-value" value={String(reports.length)} />
                </div>
              </div>
              <div className="dash-stat is-sky">
                <span className="dash-stat-label">Diagnostics</span>
                <div className="dash-stat-bottom">
                  <CountUp className="dash-stat-value" value={String(counts.lesson)} />
                </div>
              </div>
              <div className="dash-stat is-mint">
                <span className="dash-stat-label">Targeted tests</span>
                <div className="dash-stat-bottom">
                  <CountUp className="dash-stat-value" value={String(counts.targeted)} />
                </div>
              </div>
            </div>

            {reports.length === 0 ? (
              <section className="next-up is-quiet student-section">
                <div className="next-up-tag">
                  <span className="next-up-dot" />
                  No reports yet
                </div>
                <h2>Nothing here yet</h2>
                <p className="next-up-meta">
                  They appear after each test.
                </p>
              </section>
            ) : (
              <section className="student-section">
                <div className="student-reports-filters" role="group" aria-label="Filter the reports">
                  <div className="chips">
                    {(
                      [
                        ['all', 'All'],
                        ['lesson', 'Diagnostics'],
                        ['targeted', 'Targeted tests'],
                      ] as [ReportFilter, string][]
                    ).map(([value, label]) => (
                      <button
                        key={value}
                        type="button"
                        className={`chip-btn${kind === value ? ' on' : ''}`}
                        aria-pressed={kind === value}
                        onClick={() => setKind(value)}
                      >
                        {label}
                      </button>
                    ))}
                  </div>
                  {subjects.length > 1 && (
                    <div className="chips">
                      {(['all', ...subjects] as (Subject | 'all')[]).map((s) => (
                        <button
                          key={s}
                          type="button"
                          className={`chip-btn${subject === s ? ' on' : ''}`}
                          aria-pressed={subject === s}
                          onClick={() => setSubject(s)}
                        >
                          {s === 'all' ? 'Both subjects' : subjectLabel(s)}
                        </button>
                      ))}
                    </div>
                  )}
                </div>

                {shown.length === 0 ? (
                  <p className="muted">No reports match these filters.</p>
                ) : (
                  <ul className="student-tests">
                    {shown.map((r) => (
                      <ReportRow key={r.session_id} report={r} />
                    ))}
                  </ul>
                )}
              </section>
            )}

          </>
        )}
      </main>
    </StudentShell>
  )
}

/** One report in a list — here, and the latest few on the student's home page. */
export function ReportRow({ report: r }: { report: StudentReportEntry }) {
  const tone = scoreTone(r.right, r.of)
  const sub = [
    reportKindLabel(r),
    subjectLabel(r.subject),
    shortDay(r.at),
    r.teacher ? `with ${r.teacher}` : null,
  ].filter(Boolean) as string[]

  return (
    <li className="student-test">
      <span className={`test-icon${r.kind === 'targeted' ? ' is-math' : ''}`} aria-hidden="true">
        <ReportMark kind={r.kind} />
      </span>
      <div className="student-test-main">
        <div className="student-test-title">{reportTitle(r)}</div>
        <div className="student-test-sub">{sub.join(' · ')}</div>
      </div>
      <div className="student-test-side">
        {tone && (
          <span className={`score-chip${tone === 'good' ? '' : tone === 'mid' ? ' is-mid' : ' is-low'}`}>
            {r.right}
            <span className="of">/{r.of}</span>
          </span>
        )}
        <Link className="btn btn-primary btn-sm" to={`/student/reports/${r.session_id}`}>
          Open report
        </Link>
      </div>
    </li>
  )
}

function ReportMark({ kind }: { kind: StudentReportEntry['kind'] }) {
  if (kind === 'targeted') {
    return (
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
        <circle cx="12" cy="12" r="8" />
        <circle cx="12" cy="12" r="3.5" />
      </svg>
    )
  }
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M7 3h7l5 5v13H7z" />
      <path d="M14 3v5h5M10 13h6M10 17h6" />
    </svg>
  )
}

function shortDay(at: string): string {
  return new Date(at).toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric', timeZone: 'UTC' })
}
