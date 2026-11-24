import { useCallback, useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link, useParams } from 'react-router-dom'
import { useBothSubjects } from '../components/DomainDashboard'
import { IconBack } from '../components/icons'
import { Field, Input, Notice, Textarea } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import type { BluebookRow } from '../lib/bluebook'
import { callFunction } from '../lib/functions'
import type { StudentGoal } from '../lib/goal'
import { loadAnalysedQuestions } from '../lib/progressApi'
import { sectionReportDoc, type ReportSubject, type SectionReportDoc } from '../lib/sectionReport'
import { row, rows, supabase } from '../lib/supabase'
import { wordsIn } from '../lib/targetedAnalytics'
import { formatUtc } from '../lib/time'
import type { Profile } from '../lib/types'

interface Parent {
  parent_name: string | null
  parent_email: string | null
}

interface SentRow {
  id: string
  sent_to: string
  status: 'sent' | 'failed'
  detail: string | null
  created_at: string
}

/**
 * The Section Progress Report (0103), for the student's PC: what the parent
 * will read, one page per subject, with Download PDF — the browser's Save as
 * PDF, which prints just the pages — and Email to parent, which sends the same
 * report as a PDF with the PC's note, to the parent's address kept here.
 * Staff read it too; the PC and an admin send it.
 */
export function SectionReport() {
  const { id } = useParams<{ id: string }>()
  const { isAdmin, isPc, profile } = useAuth()
  const [student, setStudent] = useState<Profile | null>(null)
  const [goal, setGoal] = useState<StudentGoal | null>(null)
  const [bluebook, setBluebook] = useState<BluebookRow[]>([])
  const [words, setWords] = useState<Map<string, number> | null>(null)
  const [note, setNote] = useState('')
  const both = useBothSubjects(id)

  useEffect(() => {
    if (!id) return
    void supabase.from('profiles').select('*').eq('id', id).maybeSingle().then(({ data }) => setStudent(row<Profile>(data)))
    void supabase
      .from('student_goals')
      .select('target_rw, target_math, next_test_on')
      .eq('student_id', id)
      .maybeSingle()
      .then(({ data }) => setGoal(row<StudentGoal>(data)))
    void supabase
      .from('bluebook_scores')
      .select('test_name, taken_on, total, reading_writing, math, domains')
      .eq('student_id', id)
      .then(({ data }) => setBluebook(rows<BluebookRow>(data)))
  }, [id])

  // How long each question is, for long against short.
  useEffect(() => {
    const ids = Object.values(both.progress).flatMap((p) => p?.items.map((i) => i.question_id) ?? [])
    if (both.loading) return
    let active = true
    void loadAnalysedQuestions(ids).then((qs) => {
      if (active) setWords(new Map([...qs].map(([qid, q]) => [qid, wordsIn(q)])))
    })
    return () => {
      active = false
    }
  }, [both.progress, both.loading])

  const doc = useMemo<SectionReportDoc | null>(
    () =>
      student && !both.loading
        ? sectionReportDoc({
            student: { full_name: student.full_name, display_id: student.display_id ?? '' },
            at: new Date().toISOString(),
            subjects: both.progress,
            goal,
            bluebook,
            words: words ?? undefined,
            note,
            pc: student.pc ?? null,
          })
        : null,
    [student, both.loading, both.progress, goal, bluebook, words, note],
  )

  if (!id) return <div className="page">No such student.</div>
  const maySend = isAdmin || (isPc && student?.pc_id === profile?.id)

  return (
    <div className="page page-wide section-report-page">
      <Link className="back-link no-print" to={`/students/${id}/progress`}>
        <IconBack /> {student?.full_name ?? 'Student'}
      </Link>
      <div className="page-head no-print">
        <h1>Section Progress Report</h1>
        <button type="button" className="btn btn-primary btn-sm" onClick={() => window.print()} disabled={!doc}>
          Download PDF
        </button>
      </div>
      <p className="muted no-print">
        What the parent reads: one page per subject. Download PDF opens your browser’s print window — choose “Save as PDF”.
      </p>

      {both.error && <Notice kind="error">{both.error}</Notice>}

      <div className="section-report-cols">
        <div className="section-report-pages">
          {!doc ? (
            <div className="page-loading">Loading…</div>
          ) : doc.subjects.length === 0 ? (
            <div className="card card-pad">No check-ins yet: the report fills in after the first test.</div>
          ) : (
            doc.subjects.map((s, i) => <ReportPage key={s.subject} doc={doc} s={s} first={i === 0} />)
          )}
        </div>

        <aside className="section-report-side no-print">
          {maySend ? (
            <SendPanel studentId={id} note={note} onNote={setNote} ready={!!doc && doc.subjects.length > 0} />
          ) : (
            <div className="card card-pad">
              <p className="muted">The student’s PC emails this report to the parent.</p>
            </div>
          )}
        </aside>
      </div>
    </div>
  )
}

/** One subject's page, as the parent reads it. */
function ReportPage({ doc, s, first }: { doc: SectionReportDoc; s: ReportSubject; first: boolean }) {
  return (
    <article className="sr-page">
      <header className="sr-band">
        <img src="/brand/ascend-now-logo-on-navy.png" alt="Ascend Now" />
        <div>
          <b>{doc.title.toUpperCase()}</b>
          <span>{doc.date}</span>
        </div>
      </header>
      <h2 className="sr-title">
        {doc.student} · {s.name}
      </h2>
      <p className="sr-sub">
        {[`Student ID ${doc.studentId}`, doc.testDay, doc.pc ? `PC: ${doc.pc}` : null].filter(Boolean).join('  ·  ')}
      </p>

      {first && doc.note && (
        <div className="sr-note">
          <small>From {doc.pc ?? 'your PC'}</small>
          {doc.note.split('\n').map((l, i) => (
            <p key={i}>{l}</p>
          ))}
        </div>
      )}

      <p className="sr-headline">{s.headline}</p>
      {(s.goal.target !== null || s.goal.latest !== null) && (
        <p className="sr-goal">
          {[s.goal.target !== null ? `Goal ${s.goal.target}` : null, s.goal.latest !== null ? `Latest SAT ${s.goal.latest}` : null, s.goal.gap]
            .filter(Boolean)
            .join('  ·  ')}
        </p>
      )}

      <h3 className="sr-h">The four domains</h3>
      <table className="sr-table">
        <thead>
          <tr>
            <th>Domain</th>
            <th>Baseline</th>
            <th>Latest</th>
            <th>Change</th>
            <th className="num">Sessions</th>
            <th>Now</th>
          </tr>
        </thead>
        <tbody>
          {s.domains.map((d) => (
            <tr key={d.section}>
              <td className="sr-domain">{d.label}</td>
              <td className="num">{d.baseline ? `${Math.round(d.baseline.level)} (${d.baseline.right}/${d.baseline.of})` : '—'}</td>
              <td className="num">
                {d.latest ? `${Math.round(d.latest.level)} (${d.latest.right}/${d.latest.of})` : d.baseline ? <span className="muted">baseline only</span> : '—'}
              </td>
              <td>{d.change === null ? '—' : `${d.change > 0 ? '+' : d.change < 0 ? '−' : '±'}${Math.abs(d.change)} ${d.verdict ?? ''}`}</td>
              <td className="num">{d.baseline ? d.sessions : '—'}</td>
              <td>
                <span className={`rag-chip rag-chip-${d.rag ?? 'none'} is-small`}>
                  <span className="rag-chip-dot" aria-hidden="true" />
                  {d.status}
                </span>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
      <p className="sr-small">Sessions: every lesson and check-in since the baseline.</p>

      {s.patterns.length > 0 && (
        <>
          <h3 className="sr-h">What the answers show</h3>
          <ul className="sr-list">
            {s.patterns.map((p) => (
              <li key={p}>{p}</li>
            ))}
          </ul>
        </>
      )}

      <h3 className="sr-h">What happens next</h3>
      <p>{s.next}</p>

      <p className="sr-small sr-scale">{doc.scaleNote}</p>
    </article>
  )
}

/** The parent's address, the PC's note, and Send — with every send so far. */
function SendPanel({
  studentId,
  note,
  onNote,
  ready,
}: {
  studentId: string
  note: string
  onNote: (n: string) => void
  ready: boolean
}) {
  const [parent, setParent] = useState<Parent>({ parent_name: null, parent_email: null })
  const [name, setName] = useState('')
  const [email, setEmail] = useState('')
  const [saved, setSaved] = useState(false)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [result, setResult] = useState<string | null>(null)
  const [log, setLog] = useState<SentRow[]>([])

  const load = useCallback(async () => {
    const [{ data: p }, { data: l }] = await Promise.all([
      supabase.from('student_parents').select('parent_name, parent_email').eq('student_id', studentId).maybeSingle(),
      supabase
        .from('parent_report_emails')
        .select('id, sent_to, status, detail, created_at')
        .eq('student_id', studentId)
        .order('created_at', { ascending: false })
        .limit(10),
    ])
    const row = (p ?? { parent_name: null, parent_email: null }) as Parent
    setParent(row)
    setName(row.parent_name ?? '')
    setEmail(row.parent_email ?? '')
    setLog(rows<SentRow>(l))
  }, [studentId])

  useEffect(() => {
    void load()
  }, [load])

  const changed = name.trim() !== (parent.parent_name ?? '') || email.trim().toLowerCase() !== (parent.parent_email ?? '')

  async function save(e: FormEvent) {
    e.preventDefault()
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.rpc('set_parent_contact', { p_student: studentId, p_name: name, p_email: email })
    setBusy(false)
    if (err) setError(err.message)
    else {
      setSaved(true)
      await load()
    }
  }

  async function send() {
    setBusy(true)
    setError(null)
    setResult(null)
    try {
      const r = await callFunction<{ sent: boolean; to?: string; attached?: boolean; reason?: string }>('email_parent_report', {
        student_id: studentId,
        note: note.trim() || null,
      })
      if (r.sent) setResult(`Sent to ${r.to}${r.attached ? '' : ' (without the PDF, which could not be made)'}.`)
      else setError(r.reason ?? 'It was not sent.')
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    }
    setBusy(false)
    await load()
  }

  return (
    <div className="card card-pad sr-send">
      <h2 className="section-title">Email to parent</h2>
      {error && <Notice kind="error">{error}</Notice>}
      {result && <Notice kind="ok">{result}</Notice>}

      <form onSubmit={save}>
        <Field label="Parent’s name">
          <Input value={name} onChange={(e) => { setName(e.target.value); setSaved(false) }} placeholder="Optional" />
        </Field>
        <Field label="Parent’s email">
          <Input type="email" value={email} onChange={(e) => { setEmail(e.target.value); setSaved(false) }} placeholder="parent@example.com" />
        </Field>
        {changed && (
          <button type="submit" className="btn btn-ghost btn-sm" disabled={busy}>
            Save parent’s details
          </button>
        )}
        {saved && !changed && <p className="muted sr-saved">Saved.</p>}
      </form>

      <Field label="Your note to the parent" hint="Printed at the top of the report and the email. Context they should read first.">
        <Textarea rows={4} value={note} onChange={(e) => onNote(e.target.value)} maxLength={2000} />
      </Field>
      <button
        type="button"
        className="btn btn-primary"
        disabled={busy || !ready || !parent.parent_email || changed}
        onClick={() => void send()}
      >
        {busy ? 'Sending…' : 'Email to parent'}
      </button>
      {!parent.parent_email && <p className="muted sr-saved">Add the parent’s email first.</p>}

      {log.length > 0 && (
        <>
          <h3 className="sr-log-h">Sent before</h3>
          <ul className="sr-log">
            {log.map((r) => (
              <li key={r.id}>
                <span className={r.status === 'sent' ? 'sr-ok' : 'sr-bad'}>{r.status === 'sent' ? 'Sent' : 'Failed'}</span>{' '}
                {formatUtc(r.created_at)} · {r.sent_to}
                {r.detail && <div className="muted">{r.detail}</div>}
              </li>
            ))}
          </ul>
        </>
      )}
    </div>
  )
}
