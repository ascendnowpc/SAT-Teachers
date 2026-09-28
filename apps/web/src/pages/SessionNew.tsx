import { useEffect, useMemo, useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { Combobox, type ComboboxOption } from '../components/Combobox'
import { IconBack } from '../components/icons'
import { CopyButton, Field, Input, Notice, Select } from '../components/ui'
import { useAuth } from '../context/AuthContext'
import { LEVELS, SUBJECTS } from '../lib/constants'
import { loadPcs } from '../lib/pcApi'
import { choosable } from '../lib/pcs'
import { studentLink } from '../lib/sessions'
import { row, rows, supabase } from '../lib/supabase'
import { defaultUtcSlot, utcInputToIso } from '../lib/time'
import type { Profile, QuestionSet, Session, Subject } from '../lib/types'

/**
 * Booking a session, which is now also where a student comes from.
 *
 * There used to be a sign-up page standing in front of this one: a student did
 * not exist until they had chosen a password and confirmed an email. So a
 * student is either one this teacher has already, picked from the list, or one
 * typed in here — first name, last name, and the PC they sit under. The second
 * kind is written straight to the roster and has no account at all, because
 * they do not need one: what they get is a link.
 *
 * The PC is chosen from the list, and a session is not booked without one
 * (0055). A student's first booking is where their PC is chosen — for a new
 * student and for one already on the roster who has none — and from then on
 * the student has that PC: it is shown here, fixed, and only an admin can
 * change it, because changing it moves every report the student has to
 * somebody else. The PC reads the student's sessions and is emailed each
 * report as it is generated.
 */
export function SessionNew() {
  const { isAdmin } = useAuth()
  const [students, setStudents] = useState<Profile[]>([])
  const [loadingStudents, setLoadingStudents] = useState(true)

  /** Which of the two kinds of student this session is for. */
  const [mode, setMode] = useState<'existing' | 'new'>('existing')
  const [studentId, setStudentId] = useState('')
  const [first, setFirst] = useState('')
  const [last, setLast] = useState('')

  /** Every PC; the ones that can be chosen are the active ones. */
  const [pcs, setPcs] = useState<Profile[]>([])
  const [pcsRead, setPcsRead] = useState(false)
  /** The PC this booking is under: chosen here, or the student's own. */
  const [pcId, setPcId] = useState('')

  const [subject, setSubject] = useState<Subject>('english')
  const [title, setTitle] = useState('')
  const [scheduledAt, setScheduledAt] = useState(defaultUtcSlot)
  const [duration, setDuration] = useState(60)
  const [meetingUrl, setMeetingUrl] = useState('')

  /**
   * The subjects a session can actually be booked in: the ones whose three
   * level tests all hold questions.
   *
   * This used to be the literal string 'english', which was true while English
   * was the only subject with tests. Mathematics has the three tests now and
   * they are empty, so the honest version of the same guard reads the bank —
   * a subject is offered the day its tests are filled, and no deploy is needed
   * to notice.
   */
  const [runnable, setRunnable] = useState<Subject[]>([])
  const [bankRead, setBankRead] = useState(false)

  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)
  /** Set once the session exists. The link is the only thing left to do, so
      the screen stops being a form and becomes the link. */
  const [created, setCreated] = useState<Session | null>(null)

  useEffect(() => {
    let active = true
    void supabase
      .from('question_sets')
      .select('subject, level, question_set_items(count)')
      .not('level', 'is', null)
      .eq('is_active', true)
      .then(({ data }) => {
        if (!active) return
        const tests = rows<QuestionSet>(data)
        setRunnable(
          SUBJECTS.map((s) => s.value).filter((subj) =>
            // Every level, and none of them empty: a session starts on easy
            // and is moved up, so a subject missing one of the three is a
            // dead end the teacher would hear about from the student.
            LEVELS.every((level) =>
              tests.some(
                (t) =>
                  t.subject === subj &&
                  t.level === level &&
                  (t.question_set_items?.[0]?.count ?? 0) > 0,
              ),
            ),
          ),
        )
        setBankRead(true)
      })
    return () => {
      active = false
    }
  }, [])

  useEffect(() => {
    let active = true
    void loadPcs().then(({ pcs: list, error: err }) => {
      if (!active) return
      if (err) setError(err)
      setPcs(list)
      setPcsRead(true)
    })
    return () => {
      active = false
    }
  }, [])

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

  const pcOptions = useMemo<ComboboxOption[]>(
    () =>
      pcs.filter(choosable).map((p) => ({
        value: p.id,
        label: p.full_name,
        hint: [p.display_id, p.email].filter(Boolean).join(' · '),
      })),
    [pcs],
  )

  const chosen = mode === 'existing' ? (students.find((s) => s.id === studentId) ?? null) : null
  /** The chosen student already has a PC: their first booking chose it. */
  const assigned = chosen?.pc_id ? (pcs.find((p) => p.id === chosen.pc_id) ?? null) : null
  const locked = Boolean(chosen?.pc_id) && !isAdmin

  // The student's own PC comes up with them. Picking another student, or
  // switching to a new one, starts the choice again.
  useEffect(() => {
    setPcId(mode === 'existing' ? (chosen?.pc_id ?? '') : '')
  }, [mode, chosen?.id, chosen?.pc_id])

  const noPcs = pcsRead && pcOptions.length === 0
  // Fixed and already on the row, or chosen here from the ones that can be.
  const pcReady = locked || pcOptions.some((o) => o.value === pcId)

  // Both names, because the display id is built from them: three letters of
  // the given name and the first of the surname. Without a surname
  // build_display_id falls back to the fourth letter of the given name, so
  // Amara Okonkwo would come out AMAR26 instead of AMAO26 — a code that no
  // longer says who it belongs to. create_student refuses it too.
  const namedNewStudent = first.trim() !== '' && last.trim() !== ''
  const canSubmit =
    !busy &&
    scheduledAt !== '' &&
    pcReady &&
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
      // and if this fails nothing has been half-created. Their PC with them:
      // the database will not book a student who has none (0055).
      let student = students.find((s) => s.id === studentId) ?? null
      if (mode === 'new') {
        const { data, error: err } = await supabase.rpc('create_student', {
          p_first: first.trim(),
          p_last: last.trim(),
          p_pc_id: pcId,
        })
        if (err) throw new Error(err.message)
        student = row<Profile>(data)
        if (!student) throw new Error('The student could not be created.')
        setStudents((prev) => [...prev, student as Profile])
      } else if (student && pcId && student.pc_id !== pcId) {
        // Their first booking, which is where a PC is chosen — or an admin
        // changing the one they have.
        const { data, error: err } = await supabase.rpc('assign_student_pc', {
          p_student: student.id,
          p_pc_id: pcId,
        })
        if (err) throw new Error(err.message)
        const updated = row<Profile>(data)
        if (updated) {
          student = updated
          setStudents((prev) => prev.map((s) => (s.id === updated.id ? updated : s)))
        }
      }
      if (!student) throw new Error('Pick a student for this session.')
      if (bankRead && !runnable.includes(subject)) {
        throw new Error(
          `There are no ${subject} questions yet. Fill that subject's three tests in the question bank first.`,
        )
      }

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
            </>
          )}

          <PcField
            options={pcOptions}
            value={pcId}
            onChange={setPcId}
            loading={!pcsRead}
            locked={locked}
            assigned={assigned}
            student={chosen}
            isAdmin={isAdmin}
            noPcs={noPcs}
          />
        </div>

        <div className="card card-pad">
          <div className="section-title">What</div>

          <div className="grid-2">
            <Field label="Subject" required>
              <Select value={subject} onChange={(e) => setSubject(e.target.value as Subject)}>
                {SUBJECTS.map((s) => (
                  // A subject whose tests are not filled cannot be started, so
                  // it is shown and refused rather than hidden: the teacher can
                  // see that maths is coming and why it is not yet here.
                  <option
                    key={s.value}
                    value={s.value}
                    disabled={bankRead && !runnable.includes(s.value)}
                  >
                    {s.label}
                    {bankRead && !runnable.includes(s.value) ? ' — no questions yet' : ''}
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

/**
 * The student's PC: chosen from the list, required, and fixed once chosen.
 *
 * What it says depends on where the student is up to. A new student, or one
 * with no PC yet, is having theirs chosen now — that is the rule, and the
 * field says so. One who has a PC shows it, and a teacher cannot change it
 * here; an admin can. A student from before PCs had accounts may have a name
 * typed against them, which is offered as a reminder rather than a choice,
 * since it is nobody who can sign in.
 */
function PcField({
  options,
  value,
  onChange,
  loading,
  locked,
  assigned,
  student,
  isAdmin,
  noPcs,
}: {
  options: ComboboxOption[]
  value: string
  onChange: (id: string) => void
  loading: boolean
  locked: boolean
  assigned: Profile | null
  student: Profile | null
  isAdmin: boolean
  noPcs: boolean
}) {
  if (noPcs && !locked) {
    return (
      <Notice kind="error">
        There are no PCs to choose from yet, and a session cannot be booked without the student’s PC.{' '}
        {isAdmin ? (
          <>
            Add one under <Link to="/admin/users?tab=pcs">Users → PCs</Link>.
          </>
        ) : (
          'Ask an admin to add one under Users.'
        )}
      </Notice>
    )
  }

  if (locked) {
    return (
      <Field
        label="PC"
        hint={
          assigned && !assigned.is_active
            ? `${assigned.full_name} is suspended, so reports are not emailed to anyone. An admin can choose another PC for this student.`
            : 'Chosen at their first session. Only an admin can change it.'
        }
      >
        <Input value={assigned?.full_name ?? student?.pc ?? 'Their PC'} disabled readOnly />
      </Field>
    )
  }

  const typedBefore = student && !student.pc_id && student.pc ? student.pc : null
  const hint = student?.pc_id
    ? 'Changing it moves this student’s sessions and reports to the PC you choose.'
    : typedBefore
      ? `Their first session with a PC chosen from the list — it was written down before as “${typedBefore}”.`
      : 'Chosen now, at the student’s first session, and theirs from then on. The PC reads their sessions and is emailed each report.'

  return (
    <Field label="PC" required hint={hint}>
      <Combobox
        options={options}
        value={value}
        onChange={onChange}
        disabled={loading}
        placeholder={loading ? 'Loading…' : 'Choose their PC'}
        emptyText="No PC matches"
      />
    </Field>
  )
}
