import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { CopyButton, Field, Input, Notice, Select } from '../components/ui'
import { SUBJECTS } from '../lib/constants'
import { studentLink } from '../lib/sessions'
import { row, rows, supabase } from '../lib/supabase'
import { defaultUtcSlot, formatUtc, utcInputToIso } from '../lib/time'
import type { Profile, Session, Subject } from '../lib/types'

/**
 * Booking a session, which is now also where a student comes from.
 *
 * There used to be a sign-up page standing in front of this one: a student did
 * not exist until they had chosen a password and confirmed an email, and this
 * screen's advice, when the list came back empty, was to go and ask them to.
 * That is a week of chasing for a lesson on Thursday.
 *
 * So a student is either one this teacher has already, picked by name or id, or
 * one typed in here — first name, last name, and the PC they sit under. The
 * second kind is written straight to the roster and has no account at all,
 * because they do not need one: what they get is a link.
 */
export function SessionNew() {
  const [students, setStudents] = useState<Profile[]>([])
  const [loadingStudents, setLoadingStudents] = useState(true)

  /** Which of the two kinds of student this session is for. */
  const [mode, setMode] = useState<'existing' | 'new'>('existing')
  const [studentId, setStudentId] = useState('')
  const [search, setSearch] = useState('')
  const [first, setFirst] = useState('')
  const [last, setLast] = useState('')
  const [pc, setPc] = useState('')

  const [subject, setSubject] = useState<Subject>('english')
  const [title, setTitle] = useState('')
  const [scheduledAt, setScheduledAt] = useState(defaultUtcSlot)
  const [duration, setDuration] = useState(60)
  const [meetingUrl, setMeetingUrl] = useState('')

  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  /** Set once the session exists. The link is the thing to do next, so the
      screen stops being a form and becomes the link. */
  const [created, setCreated] = useState<{ session: Session; student: string } | null>(null)

  useEffect(() => {
    let active = true
    void supabase
      .from('profiles')
      .select('*')
      .eq('role', 'student')
      .order('full_name')
      .then(({ data, error: err }) => {
        if (!active) return
        if (err) setError(err.message)
        else setStudents(rows<Profile>(data))
        setLoadingStudents(false)
      })
    return () => {
      active = false
    }
  }, [])

  // The roster grows, and a select of two hundred names is a scroll. The box
  // above it narrows the options rather than replacing them, so picking still
  // works the way a select works.
  const matching = useMemo(() => {
    const words = search.trim().toLowerCase().split(/\s+/).filter(Boolean)
    if (words.length === 0) return students
    return students.filter((s) => {
      const hay = `${s.full_name} ${s.display_id} ${s.pc ?? ''}`.toLowerCase()
      return words.every((w) => hay.includes(w))
    })
  }, [students, search])

  // A student narrowed out of the list is a student who is no longer picked.
  useEffect(() => {
    if (studentId && !matching.some((s) => s.id === studentId)) setStudentId('')
  }, [matching, studentId])

  const namedNewStudent = first.trim() !== '' || last.trim() !== ''
  const canSubmit =
    !busy &&
    scheduledAt !== '' &&
    (mode === 'existing' ? studentId !== '' : namedNewStudent)

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)
    setBusy(true)

    try {
      const { data: auth } = await supabase.auth.getUser()
      const teacherId = auth.user?.id
      if (!teacherId) throw new Error('Your session expired. Sign in again.')

      // The student first, because a session cannot be written without one —
      // and if this fails nothing has been half-created.
      let student = students.find((s) => s.id === studentId) ?? null
      if (mode === 'new') {
        const { data, error: err } = await supabase.rpc('create_student', {
          p_first: first.trim(),
          p_last: last.trim(),
          p_pc: pc.trim() || null,
        })
        if (err) throw new Error(err.message)
        student = row<Profile>(data)
        if (!student) throw new Error('The student could not be created.')
        setStudents((prev) => [...prev, student as Profile])
      }
      if (!student) throw new Error('Pick a student for this session.')

      const { data, error: err } = await supabase
        .from('sessions')
        .insert({
          teacher_id: teacherId,
          student_id: student.id,
          subject,
          title: title.trim() || null,
          // The field is labelled UTC, so it is read as UTC — see lib/time.
          scheduled_at: utcInputToIso(scheduledAt),
          duration_mins: duration,
          meeting_url: meetingUrl.trim() || null,
        })
        // The token comes back with it: it is the next thing the teacher needs.
        .select('*')
        .single()

      if (err) throw new Error(err.message)
      const made = row<Session>(data)
      if (!made) throw new Error('The session was created but could not be read back.')
      setCreated({ session: made, student: student.full_name })
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not create the session.')
    } finally {
      setBusy(false)
    }
  }

  /** Back to an empty form, keeping the time and duration the teacher just set —
      a second session is usually the same slot pattern with a different name. */
  function bookAnother() {
    setCreated(null)
    setError(null)
    setStudentId('')
    setSearch('')
    setFirst('')
    setLast('')
    setPc('')
    setTitle('')
    setScheduledAt(defaultUtcSlot())
  }

  if (created) return <Created created={created} onAnother={bookAnother} />

  return (
    <div className="page">
      <Link className="back-link" to="/sessions">
        <IconBack /> Sessions
      </Link>

      <div className="page-head">
        <div>
          <h1>New session</h1>
          <p className="sub">
            A student and a time. You get a link at the end of it — send that to the student and
            they are in, with no account and nothing to sign into.
          </p>
        </div>
      </div>

      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <div className="card card-pad">
          <div className="section-title">Who</div>

          <div className="mode-pick" role="group" aria-label="Which student">
            <button
              type="button"
              className={`mode-opt ${mode === 'existing' ? 'on' : ''}`}
              onClick={() => setMode('existing')}
            >
              <span className="t">A student you have</span>
              <span className="d">Pick them by name, id or PC.</span>
            </button>
            <button
              type="button"
              className={`mode-opt ${mode === 'new' ? 'on' : ''}`}
              onClick={() => setMode('new')}
            >
              <span className="t">Someone new</span>
              <span className="d">Type their details. They are added as you go.</span>
            </button>
          </div>

          {mode === 'existing' ? (
            <>
              <Field label="Find a student" hint="Name, id or PC. Leave it empty to see them all.">
                <Input
                  type="search"
                  value={search}
                  placeholder="Amara, AMAO26-3, Priya Rao…"
                  onChange={(e) => setSearch(e.target.value)}
                />
              </Field>

              <Field
                label="Student"
                required
                hint={
                  loadingStudents
                    ? 'Loading students…'
                    : `${matching.length} of ${students.length} students`
                }
              >
                <Select value={studentId} onChange={(e) => setStudentId(e.target.value)} required>
                  <option value="">Select a student</option>
                  {matching.map((s) => (
                    <option key={s.id} value={s.id}>
                      {s.full_name} — {s.display_id}
                      {s.pc ? ` · ${s.pc}` : ''}
                    </option>
                  ))}
                </Select>
              </Field>

              {!loadingStudents && students.length === 0 && (
                <Notice kind="info">
                  No students on the roster yet. Switch to <b>Someone new</b> and type theirs in —
                  it takes three fields and no sign-up.
                </Notice>
              )}
              {!loadingStudents && students.length > 0 && matching.length === 0 && (
                <Notice kind="info">
                  Nobody matches “{search}”. Clear the box, or switch to <b>Someone new</b>.
                </Notice>
              )}
            </>
          ) : (
            <>
              <div className="grid-2">
                <Field label="First name" required>
                  <Input
                    value={first}
                    onChange={(e) => setFirst(e.target.value)}
                    placeholder="Amara"
                    autoComplete="off"
                  />
                </Field>
                <Field label="Last name">
                  <Input
                    value={last}
                    onChange={(e) => setLast(e.target.value)}
                    placeholder="Okonkwo"
                    autoComplete="off"
                  />
                </Field>
              </div>
              <Field label="PC" hint="Whoever this student sits under. Optional, and editable later.">
                <Input
                  value={pc}
                  onChange={(e) => setPc(e.target.value)}
                  placeholder="Priya Rao"
                  autoComplete="off"
                />
              </Field>
              <Notice kind="info">
                They are added to the roster with their own id — the same shape a teacher's is — when you
                create the session. No
                email, no password — they open the session from the link you send them.
              </Notice>
            </>
          )}
        </div>

        <div className="card card-pad">
          <div className="section-title">What</div>

          <div className="grid-2">
            <Field
              label="Subject"
              required
              hint="Maths has no tests yet — a session in it would have nothing to open."
            >
              <Select value={subject} onChange={(e) => setSubject(e.target.value as Subject)}>
                {SUBJECTS.map((s) => (
                  // Only English has the three tests. Offering a subject the
                  // student could not start is a dead end the teacher would
                  // only find out about from the student.
                  <option key={s.value} value={s.value} disabled={s.value !== 'english'}>
                    {s.label}
                    {s.value === 'english' ? '' : ' — no tests yet'}
                  </option>
                ))}
              </Select>
            </Field>

            <Field label="Title" hint="Optional — shown on the sessions list.">
              <Input
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="Diagnostic follow-up"
              />
            </Field>
          </div>
        </div>

        <div className="card card-pad">
          <div className="section-title">When and where</div>

          <div className="grid-2">
            <Field
              label="Date and time (UTC)"
              required
              hint="All session times are UTC, for everyone."
            >
              <Input
                type="datetime-local"
                value={scheduledAt}
                onChange={(e) => setScheduledAt(e.target.value)}
                required
              />
            </Field>

            <Field label="Duration">
              <Select value={duration} onChange={(e) => setDuration(Number(e.target.value))}>
                {[30, 45, 60, 90, 120].map((m) => (
                  <option key={m} value={m}>
                    {m} minutes
                  </option>
                ))}
              </Select>
            </Field>
          </div>

          <Field
            label="Meeting link"
            hint="Optional. Paste the Zoom link if you are going through it together on a call."
          >
            <Input
              type="url"
              value={meetingUrl}
              onChange={(e) => setMeetingUrl(e.target.value)}
              placeholder="https://zoom.us/j/…"
            />
          </Field>
        </div>

        <div style={{ display: 'flex', gap: 10, marginTop: 18 }}>
          <button type="submit" className="btn btn-primary" disabled={!canSubmit}>
            {busy ? 'Creating…' : 'Create the session'}
          </button>
          <Link className="btn btn-ghost" to="/sessions">
            Cancel
          </Link>
        </div>
      </form>
    </div>
  )
}

/**
 * What a teacher does next, which is send the link.
 *
 * So the screen after creating a session is the link, large, with the one
 * button that matters beside it. Dropping the teacher straight into the console
 * would have hidden the only thing standing between the student and the test.
 */
function Created({
  created,
  onAnother,
}: {
  created: { session: Session; student: string }
  onAnother: () => void
}) {
  const { session, student } = created
  const link = session.access_token ? studentLink(session.access_token) : null

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Session created</h1>
          <p className="sub">
            {student} · {formatUtc(session.scheduled_at)} · {session.duration_mins} min
          </p>
        </div>
      </div>

      <div className="card card-pad next-step">
        <div className="section-title">Send this to {student.split(' ')[0]}</div>
        <p className="step-text">
          Opening it puts them straight into this session. There is nothing to sign into and no
          account to make — the link is the whole of it, and it works on a phone.
        </p>

        {link ? (
          <>
            <div className="link-row">
              <code className="link-box">{link}</code>
              <CopyButton value={link} label="Copy link" className="btn btn-primary btn-sm" />
            </div>
            <p className="step-text muted">
              Keep it to them: anyone holding this link can sit this session.
            </p>
          </>
        ) : (
          <Notice kind="error">
            The session was created but its link did not come back. Open it from the sessions list
            and copy the link there.
          </Notice>
        )}

        <div className="step-actions">
          <Link className="btn btn-navy" to={`/sessions/${session.id}`}>
            Open the session
          </Link>
          <Link className="btn btn-ghost" to="/sessions">
            All sessions
          </Link>
          <button type="button" className="btn btn-ghost" onClick={onAnother}>
            Book another
          </button>
        </div>
      </div>
    </div>
  )
}
