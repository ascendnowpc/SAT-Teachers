import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { IconBack } from '../components/icons'
import { Field, Input, Notice, Select } from '../components/ui'
import { SUBJECTS } from '../lib/constants'
import { supabase } from '../lib/supabase'
import type { Profile, Subject } from '../lib/types'

/** Rounds to the next half hour, so the default time is a plausible one. */
function defaultSlot(): string {
  const d = new Date()
  d.setMinutes(d.getMinutes() + 30 - (d.getMinutes() % 30), 0, 0)
  const pad = (n: number) => String(n).padStart(2, '0')
  return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}T${pad(d.getHours())}:${pad(d.getMinutes())}`
}

export function SessionNew() {
  const navigate = useNavigate()

  const [students, setStudents] = useState<Profile[]>([])
  const [loadingStudents, setLoadingStudents] = useState(true)

  const [studentId, setStudentId] = useState('')
  const [subject, setSubject] = useState<Subject>('english')
  const [title, setTitle] = useState('')
  const [scheduledAt, setScheduledAt] = useState(defaultSlot)
  const [duration, setDuration] = useState(60)
  const [meetingUrl, setMeetingUrl] = useState('')

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
          // datetime-local has no zone; the browser's own offset is the right one.
          scheduled_at: new Date(scheduledAt).toISOString(),
          duration_mins: duration,
          meeting_url: meetingUrl.trim() || null,
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
            <Field label="Date and time" required>
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
