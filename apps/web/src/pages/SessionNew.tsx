import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { Combobox, type ComboboxOption } from '../components/Combobox'
import { IconBack } from '../components/icons'
import { CopyButton, Field, Input, Notice, Select } from '../components/ui'
import { SUBJECTS } from '../lib/constants'
import { studentLink } from '../lib/sessions'
import { row, rows, supabase } from '../lib/supabase'
import { defaultUtcSlot, utcInputToIso } from '../lib/time'
import type { Profile, Session, Subject } from '../lib/types'

/**
 * Booking a session, which is now also where a student comes from.
 *
 * There used to be a sign-up page standing in front of this one: a student did
 * not exist until they had chosen a password and confirmed an email. So a
 * student is either one this teacher has already, picked from the list, or one
 * typed in here — first name, last name, and the PC they sit under. The second
 * kind is written straight to the roster and has no account at all, because
 * they do not need one: what they get is a link.
 */
export function SessionNew() {
  const [students, setStudents] = useState<Profile[]>([])
  const [loadingStudents, setLoadingStudents] = useState(true)

  /** Which of the two kinds of student this session is for. */
  const [mode, setMode] = useState<'existing' | 'new'>('existing')
  const [studentId, setStudentId] = useState('')
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
  /** Set once the session exists. The link is the only thing left to do, so
      the screen stops being a form and becomes the link. */
  const [created, setCreated] = useState<Session | null>(null)

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

  // The id and the PC go in the hint rather than the label, so the list reads
  // as names and the two people called Sam are still told apart.
  const options = useMemo<ComboboxOption[]>(
    () =>
      students.map((s) => ({
        value: s.id,
        label: s.full_name,
        hint: [s.display_id, s.pc].filter(Boolean).join(' · '),
      })),
    [students],
  )

  // Both names, because the display id is built from them: three letters of
  // the given name and the first of the surname. Without a surname
  // build_display_id falls back to the fourth letter of the given name, so
  // Amara Okonkwo would come out AMAR26 instead of AMAO26 — a code that no
  // longer says who it belongs to. create_student refuses it too.
  const namedNewStudent = first.trim() !== '' && last.trim() !== ''
  const canSubmit =
    !busy && scheduledAt !== '' && (mode === 'existing' ? studentId !== '' : namedNewStudent)

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
      setCreated(made)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not create the session.')
    } finally {
      setBusy(false)
    }
  }

  if (created) return <Created session={created} />

  return (
    <div className="page">
      <Link className="back-link" to="/sessions">
        <IconBack /> Sessions
      </Link>

      <div className="page-head">
        <h1>New session</h1>
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
              A student you have
            </button>
            <button
              type="button"
              className={`mode-opt ${mode === 'new' ? 'on' : ''}`}
              onClick={() => setMode('new')}
            >
              Someone new
            </button>
          </div>

          {mode === 'existing' ? (
            <Field label="Student" required>
              <Combobox
                options={options}
                value={studentId}
                onChange={setStudentId}
                disabled={loadingStudents}
                placeholder={loadingStudents ? 'Loading…' : 'Type a name, id or PC'}
                emptyText="No student matches"
              />
            </Field>
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
                {/* Required: the display id takes its fourth letter from the
                    surname, and without one it takes a letter of the given
                    name instead and stops identifying anybody. */}
                <Field label="Last name" required>
                  <Input
                    value={last}
                    onChange={(e) => setLast(e.target.value)}
                    placeholder="Okonkwo"
                    autoComplete="off"
                  />
                </Field>
              </div>
              <Field label="PC">
                <Input
                  value={pc}
                  onChange={(e) => setPc(e.target.value)}
                  placeholder="Priya Rao"
                  autoComplete="off"
                />
              </Field>
            </>
          )}
        </div>

        <div className="card card-pad">
          <div className="section-title">What</div>

          <div className="grid-2">
            <Field label="Subject" required>
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

            <Field label="Title">
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
            <Field label="Date and time (UTC)" required>
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

          <Field label="Meeting link">
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
 * The link, and nothing else.
 *
 * There is one thing to do once the session exists — send it — so this screen
 * is that one thing. Buttons off to the console and back to the list were
 * competing with the only action that matters, and the sidebar already goes
 * everywhere they went.
 */
function Created({ session }: { session: Session }) {
  const link = session.access_token ? studentLink(session.access_token) : null

  return (
    <div className="page">
      <div className="page-head">
        <h1>Session created</h1>
      </div>

      <div className="card card-pad next-step">
        <div className="section-title">Student link</div>
        {link ? (
          <div className="link-row">
            <code className="link-box">{link}</code>
            <CopyButton value={link} label="Copy link" className="btn btn-primary btn-sm" />
          </div>
        ) : (
          <Notice kind="error">
            The session was created but its link did not come back. Open it from the sessions list
            and copy the link there.
          </Notice>
        )}
      </div>
    </div>
  )
}
