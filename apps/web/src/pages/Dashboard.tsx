import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { StageBadge } from '../components/AdminUi'
import { SessionCard } from '../components/SessionCard'
import { useAuth } from '../context/AuthContext'
import { pendingTeachers, reportStage } from '../lib/admin'
import { subjectLabel } from '../lib/constants'
import { rows, supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { Difficulty, Profile, Session, SessionReportRow, Subject } from '../lib/types'


const SESSION_SELECT =
  '*, teacher:profiles!sessions_teacher_id_fkey(id,full_name,display_id),' +
  ' student:profiles!sessions_student_id_fkey(id,full_name,display_id,pc)'

export function Dashboard() {
  const { profile, isTeacher, isAdmin, isPc } = useAuth()
  // A PC reads sessions from the staff side, as a teacher does.
  const staff = isTeacher || isPc
  const [counts, setCounts] = useState<Record<Difficulty, number> | null>(null)
  const [next, setNext] = useState<Session[]>([])
  const [pending, setPending] = useState<Profile[]>([])

  useEffect(() => {
    let active = true

    // A pending teacher cannot see anything at all until somebody approves
    // them, and an admin who does not open Users does not know they are there.
    // So the one piece of the portal that is a person waiting is on the page
    // every admin lands on.
    if (isAdmin) {
      void supabase
        .from('profiles')
        .select('*')
        .eq('role', 'teacher')
        .eq('is_active', false)
        .then(({ data }) => {
          if (active && data) setPending(pendingTeachers(rows<Profile>(data)))
        })
    }

    void supabase
      .from('sessions')
      .select(SESSION_SELECT)
      .in('status', ['scheduled', 'live'])
      .order('scheduled_at')
      .limit(3)
      .then(({ data }) => {
        if (active && data) setNext(rows<Session>(data))
      })

    if (isTeacher) {
      // Only what a session can actually ask, counted where it can be asked
      // from: the level tests. This used to tally the questions table by
      // difficulty, which counts a question saved outside every test — and
      // that is how the bank came to report a twenty-first medium question
      // that no screen in the product would show. A number nothing can open
      // is worse than no number.
      void supabase
        .from('question_sets')
        .select('level, question_set_items(count)')
        .not('level', 'is', null)
        .eq('is_active', true)
        .then(({ data }) => {
          if (!active || !data) return
          const tally: Record<Difficulty, number> = { easy: 0, medium: 0, hard: 0 }
          for (const t of data as { level: Difficulty; question_set_items: { count: number }[] }[]) {
            tally[t.level] += t.question_set_items?.[0]?.count ?? 0
          }
          setCounts(tally)
        })
    }

    return () => {
      active = false
    }
  }, [isTeacher, isAdmin])

  if (!profile) return null

  const total = counts ? counts.easy + counts.medium + counts.hard : null
  const firstName = profile.full_name.trim().split(/\s+/)[0] || 'there'

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Welcome back, {firstName}.</h1>
          <p className="sub">
            <span className="badge badge-role">{profile.role === 'pc' ? 'PC' : profile.role}</span>
            <span style={{ marginLeft: 8 }}>
              Your ID is <strong className="num">{profile.display_id}</strong>
            </span>
          </p>
        </div>
      </div>

      {pending.length > 0 && (
        <div className="card card-pad approvals" style={{ marginBottom: 22 }}>
          <div className="section-title">
            {pending.length} teacher {pending.length === 1 ? 'account is' : 'accounts are'} waiting
            to be verified
          </div>
          <p className="sub" style={{ marginBottom: 12, maxWidth: '62ch' }}>
            They can see nothing at all until you approve them — not a session, not a question, not
            a student. Whoever signed up is sitting on a screen that says so.
          </p>
          <ul className="approval-list" style={{ marginBottom: 14 }}>
            {pending.slice(0, 3).map((p) => (
              <li key={p.id}>
                <div>
                  <div className="cell-strong">{p.full_name || 'Unnamed'}</div>
                  <div className="cell-sub">
                    {p.email && <>{p.email} · </>}signed up {formatUtc(p.created_at)}
                  </div>
                </div>
              </li>
            ))}
          </ul>
          <Link className="btn btn-primary" to="/admin/users">
            {pending.length > 3 ? `Review all ${pending.length}` : 'Review them'}
          </Link>
        </div>
      )}

      {isTeacher && (
        <div className="stats">
          <div className="stat">
            <div className="k">Questions</div>
            <div className="v">{total ?? '—'}</div>
          </div>
          <div className="stat">
            <div className="k">Easy</div>
            <div className="v">{counts?.easy ?? '—'}</div>
          </div>
          <div className="stat">
            <div className="k">Medium</div>
            <div className="v">{counts?.medium ?? '—'}</div>
          </div>
          <div className="stat">
            <div className="k">Hard</div>
            <div className="v">{counts?.hard ?? '—'}</div>
          </div>
        </div>
      )}

      {isPc && <PcHome />}

      <div className="section-title">Coming up</div>
      {next.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No sessions scheduled</h3>
            <p>
              {isTeacher
                ? 'Create a session with a student and send them the link — they need no account to open it.'
                : isPc
                  ? 'None of your students has a session booked.'
                  : `Nothing booked yet. Give your teacher your ID — ${profile.display_id} — so they can schedule one.`}
            </p>
            {isTeacher && (
              <Link className="btn btn-primary" to="/sessions/new">
                New session
              </Link>
            )}
          </div>
        </div>
      ) : (
        <div className="sess-list" style={{ marginBottom: 26 }}>
          {next.map((s) => (
            <SessionCard key={s.id} session={s} isTeacher={staff} />
          ))}
        </div>
      )}

      {isTeacher && (
        <div className="card card-pad">
          <div className="section-title">Question bank</div>
          <h3 style={{ fontSize: 16.5, marginBottom: 6 }}>Keep the bank ahead of your sessions</h3>
          <p
            style={{
              color: 'var(--muted)',
              fontSize: 14.5,
              fontWeight: 300,
              marginBottom: 16,
              maxWidth: '54ch',
            }}
          >
            Every question lives in one of the level tests, and its level is that test's — so the
            numbers above are the papers your students actually sit.
          </p>
          <div style={{ display: 'flex', gap: 10, flexWrap: 'wrap' }}>
            <Link className="btn btn-primary" to="/questions/new">
              Add question
            </Link>
            <Link className="btn btn-ghost" to="/questions">
              Browse bank
            </Link>
          </div>
        </div>
      )}
    </div>
  )
}

interface ReportLine extends Pick<SessionReportRow, 'session_id' | 'status' | 'published_at' | 'generated_at' | 'form_submitted_at' | 'teacher_reflection'> {
  session: {
    id: string
    title: string | null
    subject: Subject
    scheduled_at: string
    student: { full_name: string } | null
    teacher: { full_name: string } | null
  } | null
}

/**
 * A PC's home: their students, and the reports on them, newest first.
 *
 * Every report is emailed to the PC as it is generated (0055), so this is the
 * other way to it — the one that is still here when the email is not. RLS
 * decides what is in these lists: a PC reads their own students' rows and
 * nobody else's, so nothing here filters by PC.
 */
function PcHome() {
  const [students, setStudents] = useState<Profile[]>([])
  const [reports, setReports] = useState<ReportLine[]>([])
  const [generated, setGenerated] = useState(0)
  const [loaded, setLoaded] = useState(false)

  useEffect(() => {
    let active = true
    void Promise.all([
      supabase.from('profiles').select('*').eq('role', 'student').order('full_name'),
      supabase
        .from('session_reports')
        .select(
          'session_id, status, published_at, generated_at, form_submitted_at, teacher_reflection,' +
            ' session:sessions(id, title, subject, scheduled_at,' +
            ' student:profiles!sessions_student_id_fkey(full_name),' +
            ' teacher:profiles!sessions_teacher_id_fkey(full_name))',
        )
        .not('generated_at', 'is', null)
        .order('generated_at', { ascending: false })
        .limit(8),
      supabase
        .from('session_reports')
        .select('session_id', { count: 'exact', head: true })
        .not('generated_at', 'is', null),
    ]).then(([st, rp, n]) => {
      if (!active) return
      setStudents(rows<Profile>(st.data))
      setReports(rows<ReportLine>(rp.data))
      setGenerated(n.count ?? 0)
      setLoaded(true)
    })
    return () => {
      active = false
    }
  }, [])

  if (!loaded) return null

  return (
    <>
      <div className="stats">
        <div className="stat">
          <div className="k">Your students</div>
          <div className="v">{students.length}</div>
        </div>
        <div className="stat">
          <div className="k">Reports generated</div>
          <div className="v">{generated}</div>
        </div>
      </div>

      <div className="section-title">Latest reports</div>
      {reports.length === 0 ? (
        <div className="card" style={{ marginBottom: 26 }}>
          <div className="empty">
            <h3>No reports yet</h3>
            <p>
              Each report on one of your students is emailed to you as a PDF the moment it is
              generated, and it is listed here as well.
            </p>
          </div>
        </div>
      ) : (
        <div className="board" style={{ marginBottom: 26 }}>
          <div className="board-scroll">
            <table className="board-table">
              <thead>
                <tr>
                  <th>Student</th>
                  <th>Session</th>
                  <th>Generated</th>
                  <th>Report</th>
                  <th aria-label="Actions" />
                </tr>
              </thead>
              <tbody>
                {reports.map((r) => (
                  <tr key={r.session_id}>
                    <td className="cell-strong">{r.session?.student?.full_name ?? '—'}</td>
                    <td>
                      <div className="cell-strong">
                        {r.session?.title || `${subjectLabel(r.session?.subject ?? 'english')} session`}
                      </div>
                      <div className="cell-sub">
                        {r.session && formatUtc(r.session.scheduled_at)}
                        {r.session?.teacher && <> · with {r.session.teacher.full_name}</>}
                      </div>
                    </td>
                    <td className="cell-sub">{r.generated_at && formatUtc(r.generated_at)}</td>
                    <td>
                      <StageBadge stage={reportStage(r)} />
                    </td>
                    <td className="row-actions">
                      <Link className="btn btn-ghost btn-sm" to={`/sessions/${r.session_id}/report`}>
                        Open
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      <div className="section-title">Your students</div>
      {students.length === 0 ? (
        <div className="card" style={{ marginBottom: 26 }}>
          <div className="empty">
            <h3>No students yet</h3>
            <p>A student becomes yours when a teacher books their first session with you as their PC.</p>
          </div>
        </div>
      ) : (
        <div className="card card-pad" style={{ marginBottom: 26 }}>
          <ul className="pc-students">
            {students.map((s) => (
              <li key={s.id}>
                <span className="cell-strong">{s.full_name}</span>{' '}
                <span className="cell-sub num">{s.display_id}</span>
              </li>
            ))}
          </ul>
        </div>
      )}
    </>
  )
}
