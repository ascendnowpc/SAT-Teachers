import { useCallback, useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { IconBack } from '../components/icons'
import {
  ProgressLineView,
  TargetedAnalysisView,
  useLongPattern,
} from '../components/ProgressPanels'
import { DifficultyBadge, Notice } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { subjectLabel } from '../lib/constants'
import { loadReportEmail, sendReportAgain } from '../lib/pcApi'
import { deliveryLine } from '../lib/pcs'
import { progressLine, type ProgressConfig, type StudentProgress } from '../lib/progress'
import { loadConfig, loadProgress } from '../lib/progressApi'
import { supabase } from '../lib/supabase'
import { analyseTargetedItems, skillName, targetedRows } from '../lib/targetedReport'
import { formatUtc } from '../lib/time'
import type { ReportEmail, Session, SessionItem, TargetedTest } from '../lib/types'

/**
 * A targeted test's report (0062): what the answers say and where it puts the
 * student on the skill. No diagnostic form, no teacher feedback, nothing
 * generated — every figure is computed from the rows as the page is read, by
 * the same functions that make the PDF (lib/targetedReport).
 *
 * Nothing emails it on its own. "Send to PC" is the teacher's or an admin's,
 * pressed as themselves; each press is a row in report_emails keyed by when it
 * went, and the line under the button reads the newest.
 */
export function TargetedReport({ session, items }: { session: Session; items: SessionItem[] }) {
  const { profile, isTeacher, isAdmin } = useAuth()
  const [test, setTest] = useState<TargetedTest | null>(null)
  const [progress, setProgress] = useState<StudentProgress | null>(null)
  const [cfg, setCfg] = useState<ProgressConfig | null>(null)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    let active = true
    void Promise.all([
      supabase.from('targeted_tests').select('*').eq('session_id', session.id).maybeSingle(),
      loadProgress(session.student_id, session.subject),
      loadConfig(session.subject),
    ]).then(([t, p, c]) => {
      if (!active) return
      setTest((t.data as TargetedTest | null) ?? null)
      setProgress(p.progress)
      setCfg(c)
      setError(t.error?.message ?? p.error)
    })
    return () => {
      active = false
    }
  }, [session.id, session.student_id, session.subject])

  // The set's size is in student_progress for everyone who may read this
  // page; the set itself is the teacher's alone (0061).
  const setCount =
    progress?.targeted.find((t) => t.session_id === session.id)?.set_count ?? items.length
  const analysis = useMemo(
    () => (cfg ? analyseTargetedItems(items, setCount, cfg) : null),
    [items, setCount, cfg],
  )
  const line = useMemo(
    () => (progress && test ? progressLine(progress, test.section, test.skill) : null),
    [progress, test],
  )
  const pattern = useLongPattern(progress, line, cfg)
  const rows = targetedRows(items)

  const mine = session.teacher_id === profile?.id || isAdmin
  const over = session.status === 'completed'

  return (
    <div className="page report">
      <Link className="back-link" to={`/sessions/${session.id}`}>
        <IconBack /> Session
      </Link>

      <div className="page-head">
        <div>
          <h1>
            {session.student?.full_name || 'Student'} —{' '}
            {test ? skillName(test.section, test.skill) : 'targeted test'}
          </h1>
          <p className="sub">
            {subjectLabel(session.subject)} · targeted test ·{' '}
            {formatUtc(session.started_at ?? session.scheduled_at)} · set by{' '}
            {session.teacher?.full_name}
          </p>
        </div>
        <div className="spring" />
        <span className="badge badge-sky">Computed from the answers</span>
        <button type="button" className="btn btn-sm" onClick={() => window.print()}>
          Save as PDF
        </button>
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {!over && (
        <Notice kind="info">The test is not over yet. This report fills in as it is sat.</Notice>
      )}

      {isTeacher && mine && over && (
        <SendToPc sessionId={session.id} pcName={session.student?.pc ?? null} />
      )}

      {analysis && (
        <div className="card card-pad">
          <div className="section-title">What the answers say</div>
          <TargetedAnalysisView analysis={analysis} />
        </div>
      )}

      {line && test && (
        <div className="card card-pad">
          <div className="section-title">Progress on {skillName(test.section, test.skill)}</div>
          <ProgressLineView line={line} highlight={session.id} />
          {pattern && <p className="muted">{pattern.text}</p>}
        </div>
      )}

      <div className="board">
        <div className="board-scroll">
          <table className="board-table">
            <thead>
              <tr>
                <th className="num">#</th>
                <th>Level</th>
                <th>Outcome</th>
                <th>Answer</th>
                <th className="num">Time</th>
                <th>Pace</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((r) => (
                <tr key={r.number}>
                  <td className="num">{r.number}</td>
                  <td>{r.level && <DifficultyBadge level={r.level} />}</td>
                  <td>{r.outcome}</td>
                  <td>{r.answer}</td>
                  <td className="num">
                    {r.seconds === null ? '—' : `${r.seconds}s${r.limit ? ` / ${r.limit}s` : ''}`}
                  </td>
                  <td>{r.pace ?? '—'}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
      {analysis && analysis.notReached > 0 && (
        <p className="muted">
          {analysis.notReached} question{analysis.notReached === 1 ? '' : 's'} of the set not
          reached, left out of the score.
        </p>
      )}
    </div>
  )
}

/** The manual send, and what became of the last one. */
function SendToPc({ sessionId, pcName }: { sessionId: string; pcName: string | null }) {
  const [email, setEmail] = useState<ReportEmail | null>(null)
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)

  const load = useCallback(async () => setEmail(await loadReportEmail(sessionId)), [sessionId])
  useEffect(() => {
    void load()
  }, [load])

  async function send() {
    setBusy(true)
    setErr(null)
    try {
      const result = await sendReportAgain(sessionId)
      if (!result.sent) setErr(result.reason ?? 'The email did not go.')
    } catch (e) {
      setErr(e instanceof Error ? e.message : String(e))
    }
    await load()
    setBusy(false)
  }

  const line = email ? deliveryLine(email, email.generated_at, pcName) : null
  return (
    <div className="card card-pad no-print">
      <div className="section-title">The PC</div>
      {err && <Notice kind="error">{err}</Notice>}
      <p className="muted">
        {line ? line.text : `Not sent to ${pcName || 'the PC'} yet. Nothing is emailed on its own.`}
      </p>
      <button
        type="button"
        className="btn btn-primary btn-sm"
        disabled={busy}
        onClick={() => void send()}
      >
        {busy ? 'Sending…' : email ? 'Send to PC again' : 'Send to PC'}
      </button>
    </div>
  )
}
