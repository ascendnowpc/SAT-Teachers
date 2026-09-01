import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { Field, Input, Notice, Select } from '../components/ui'
import { SUBJECTS } from '../lib/constants'
import { supabase } from '../lib/supabase'
import { defaultUtcSlot, utcInputToIso } from '../lib/time'
import type { Profile, SessionPacing, Subject } from '../lib/types'

export function SessionNew() {
  const navigate = useNavigate()

  const [students, setStudents] = useState<Profile[]>([])
  const [loadingStudents, setLoadingStudents] = useState(true)

  const [studentId, setStudentId] = useState('')
  const [subject, setSubject] = useState<Subject>('english')
  const [title, setTitle] = useState('')
  const [scheduledAt, setScheduledAt] = useState(defaultUtcSlot)
  const [duration, setDuration] = useState(60)
  const [meetingUrl, setMeetingUrl] = useState('')
  const [pacing, setPacing] = useState<SessionPacing>('student')

  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

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
        else setStudents((data ?? []) as Profile[])
        setLoadingStudents(false)
      })
    return () => {
      active = false
    }
  }, [])

  const canSubmit = useMemo(
    () => studentId !== '' && scheduledAt !== '' && !busy,
    [studentId, scheduledAt, busy],
  )

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setError(null)

    if (!studentId) {
      setError('Pick a student for this session.')
      return
    }

    setBusy(true)
    try {
      const { data: auth } = await supabase.auth.getUser()
      const teacherId = auth.user?.id
      if (!teacherId) throw new Error('Your session expired. Sign in again.')

      const { data, error: err } = await supabase
        .from('sessions')
        .insert({
          teacher_id: teacherId,
          student_id: studentId,
          subject,
          title: title.trim() || null,
          // The field is labelled UTC, so it is read as UTC — see lib/time.
          scheduled_at: utcInputToIso(scheduledAt),
          duration_mins: duration,
          meeting_url: meetingUrl.trim() || null,
          pacing,
        })
        .select('id')
        .single()

      if (err) throw new Error(err.message)
      // Straight into the builder: a session with no paper is not yet a session.
      navigate(`/sessions/${(data as { id: string }).id}/paper`)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Could not create the session.')
    } finally {
      setBusy(false)
    }
  }

  return (
    <div className="page">
      <Link className="back-link" to="/sessions">
        <IconBack /> Sessions
      </Link>

      <div className="page-head">
        <div>
          <h1>New session</h1>
          <p className="sub">
            Pick a student and a time. Next you choose the questions — the student opens the
            session themselves once that time has passed.
          </p>
        </div>
      </div>

      <form onSubmit={onSubmit} noValidate>
        {error && <Notice kind="error">{error}</Notice>}

        <div className="card card-pad">
          <div className="section-title">Who and what</div>

          <Field label="Student" required hint={loadingStudents ? 'Loading students…' : undefined}>
            <Select value={studentId} onChange={(e) => setStudentId(e.target.value)} required>
              <option value="">Select a student</option>
              {students.map((s) => (
                <option key={s.id} value={s.id}>
                  {s.full_name} — {s.display_id}
                </option>
              ))}
            </Select>
          </Field>

          {!loadingStudents && students.length === 0 && (
            <Notice kind="info">
              No students have signed up yet. Ask them to create a student account, then their name
              will appear here.
            </Notice>
          )}

          <div className="grid-2">
            <Field label="Subject" required>
              <Select value={subject} onChange={(e) => setSubject(e.target.value as Subject)}>
                {SUBJECTS.map((s) => (
                  <option key={s.value} value={s.value}>
                    {s.label}
                  </option>
                ))}
              </Select>
            </Field>

            <Field label="Title" hint="Optional — shown on the session card.">
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

          <Field
            label="Who chooses the next question"
            hint="Changeable later, including mid-session."
          >
            <Select value={pacing} onChange={(e) => setPacing(e.target.value as SessionPacing)}>
              <option value="student">
                The paper — they work straight through it on their own
              </option>
              <option value="teacher">
                You — pick each question by difficulty as the lesson goes
              </option>
            </Select>
          </Field>
        </div>

        <div style={{ display: 'flex', gap: 10, marginTop: 18 }}>
          <button type="submit" className="btn btn-primary" disabled={!canSubmit}>
            {busy ? 'Creating…' : 'Create and pick questions'}
          </button>
          <Link className="btn btn-ghost" to="/sessions">
            Cancel
          </Link>
        </div>
      </form>
    </div>
  )
}
