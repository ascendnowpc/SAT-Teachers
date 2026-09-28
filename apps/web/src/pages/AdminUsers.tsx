import { useCallback, useEffect, useMemo, useState, type FormEvent } from 'react'
import { useSearchParams } from 'react-router-dom'
import { PcTable, PeopleTable, Stat } from '../components/AdminUi'
import { CopyButton, Field, Input, Notice } from '../components/ui'
import { useSchool } from '../hooks/useSchool'
import { filterPeople, isSuspended, pcRows, pendingTeachers, studentRows, teacherRows } from '../lib/admin'
import { isEmailAddress } from '../lib/mail'
import { addPc, loadPcInvites, sendPcInvite } from '../lib/pcApi'
import { choosable, type PcResult } from '../lib/pcs'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { PcInvite, Profile } from '../lib/types'

type Tab = 'teachers' | 'students' | 'pcs'
const TABS: Tab[] = ['teachers', 'students', 'pcs']

/**
 * Users — everybody on the platform, and the queue of people waiting to be one.
 *
 * This was two pages: an overview that counted sessions and a list of people.
 * The counting was the problem — it answered questions about sessions on a
 * screen that is not the sessions list, so the same rows were displayed twice
 * in two shapes and could disagree. Sessions live under Sessions. This page is
 * about people, and the only numbers on it are counts of people.
 *
 * Teachers and students are two tables rather than one, because they are
 * counted against opposite sides of the same session and a single list with a
 * Role column would make every other column mean two things. The search box is
 * over whichever half is showing, and it searches the counterparts too — typing
 * a teacher's name into the student half is a fair way to ask "who does she
 * teach".
 *
 * The PCs are the third table (0055): the accounts an admin makes, one per PC,
 * which read their students' sessions and are emailed each report. They are
 * added here — which emails them a link to choose a password — sent another
 * link here, and suspended here; and a student's PC is changed from the
 * students' table.
 */
export function AdminUsers() {
  const { profiles, sessions, stages, loading, error, reload } = useSchool()
  const [params, setParams] = useSearchParams()
  // In the address, so a link can open the PCs straight away — the booking
  // form's "add one under Users → PCs" does.
  const tab: Tab = TABS.find((t) => t === params.get('tab')) ?? 'teachers'
  const setTab = (next: Tab) => setParams(next === 'teachers' ? {} : { tab: next }, { replace: true })
  const [query, setQuery] = useState('')

  const pending = useMemo(() => pendingTeachers(profiles), [profiles])
  const teachers = useMemo(() => teacherRows(profiles, sessions, stages), [profiles, sessions, stages])
  const students = useMemo(() => studentRows(profiles, sessions, stages), [profiles, sessions, stages])
  const pcs = useMemo(() => pcRows(profiles, sessions, stages), [profiles, sessions, stages])
  const pcProfiles = useMemo(() => profiles.filter((p) => p.role === 'pc'), [profiles])

  // Who has joined, from the links (0055's pc_invites). Only the PCs tab asks.
  const [invites, setInvites] = useState<Map<string, PcInvite>>(new Map())
  const loadInvites = useCallback(async () => setInvites(await loadPcInvites()), [])
  useEffect(() => {
    if (tab === 'pcs') void loadInvites()
  }, [tab, loadInvites])
  const reloadPcs = useCallback(async () => {
    await Promise.all([reload(), loadInvites()])
  }, [reload, loadInvites])

  const all = tab === 'teachers' ? teachers : tab === 'students' ? students : pcs
  const shown = useMemo(() => filterPeople(all, query), [all, query])
  const active = teachers.filter((t) => t.profile.is_active).length
  const unassigned = students.filter((s) => !s.profile.pc_id).length

  return (
    <div className="page page-wide">
      <div className="page-head">
        <div>
          <h1>Users</h1>
          <p className="sub">
            Everyone on the platform, with what they have done beside them. A student is a roster row
            their teacher typed in, so this is the whole roster rather than a list of accounts.
          </p>
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <ApprovalQueue pending={pending} onDone={reload} />

      <div className="stats">
        <Stat k="Teachers" v={teachers.length} sub={`${active} approved and active`} />
        <Stat k="Students" v={students.length} sub="on the roster" />
        <Stat k="PCs" v={pcs.length} sub={`${pcs.filter((p) => !isSuspended(p.profile)).length} active`} />
        <Stat
          k="Waiting"
          v={pending.length}
          sub={pending.length === 0 ? 'nobody to approve' : 'teacher accounts to verify'}
        />
      </div>

      <div className="tabs">
        <button
          type="button"
          className={`tab ${tab === 'teachers' ? 'on' : ''}`}
          onClick={() => setTab('teachers')}
        >
          Teachers ({teachers.length})
        </button>
        <button
          type="button"
          className={`tab ${tab === 'students' ? 'on' : ''}`}
          onClick={() => setTab('students')}
        >
          Students ({students.length})
        </button>
        <button type="button" className={`tab ${tab === 'pcs' ? 'on' : ''}`} onClick={() => setTab('pcs')}>
          PCs ({pcs.length})
        </button>
      </div>

      {tab === 'pcs' && <AddPc onAdded={reloadPcs} />}
      {tab === 'students' && unassigned > 0 && (
        <p className="sub" style={{ marginBottom: 12 }}>
          {unassigned} {unassigned === 1 ? 'student has' : 'students have'} no PC yet. Each gets one at
          their next booking, or choose one here.
        </p>
      )}

      <div className="filters">
        <Input
          className="input filter-search"
          type="search"
          value={query}
          placeholder={
            tab === 'teachers'
              ? 'Search a teacher, id, email or student…'
              : tab === 'students'
                ? 'Search a student, PC, id or teacher…'
                : 'Search a PC, email or student…'
          }
          aria-label="Search people"
          onChange={(e) => setQuery(e.target.value)}
        />
        <span className="spring" />
        <span className="filter-count">
          {loading ? 'Loading…' : `${shown.length} of ${all.length}`}
        </span>
        {query && (
          <button type="button" className="btn btn-ghost btn-sm" onClick={() => setQuery('')}>
            Clear
          </button>
        )}
      </div>

      {loading ? (
        <div className="empty">Loading…</div>
      ) : tab === 'pcs' && pcs.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No PCs yet</h3>
            <p>
              Add the first one above. Until there is one, no session can be booked: every student is
              booked with their PC.
            </p>
          </div>
        </div>
      ) : shown.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nobody matches</h3>
            <p>Nothing here fits what you have typed. Widen it, or clear the search.</p>
          </div>
        </div>
      ) : tab === 'pcs' ? (
        <PcList rows={shown} invites={invites} onChanged={reloadPcs} />
      ) : (
        <PeopleTable
          rows={shown}
          kind={tab === 'teachers' ? 'teacher' : 'student'}
          href={tab === 'teachers' ? (p) => `/admin/teachers/${p.id}` : undefined}
          pcCell={
            tab === 'students'
              ? (p) => <StudentPc student={p} pcs={pcProfiles} onChanged={reload} />
              : undefined
          }
        />
      )}
    </div>
  )
}

/**
 * The teachers waiting to be verified.
 *
 * It sits above the tables and disappears when it is empty, because it is the
 * one thing on this page that is somebody waiting on the admin rather than the
 * admin looking at something. A pending account can see nothing at all — 0044
 * writes it inactive and every policy asks is_active — so the person behind it
 * is sitting on a "waiting for approval" screen until this is done.
 */
function ApprovalQueue({ pending, onDone }: { pending: Profile[]; onDone: () => Promise<void> }) {
  const [busy, setBusy] = useState<string | null>(null)
  const [failed, setFailed] = useState<string | null>(null)

  if (pending.length === 0) return null

  async function decide(id: string, active: boolean) {
    setBusy(id)
    setFailed(null)
    const { error } = await supabase.rpc('set_profile_active', {
      p_profile: id,
      p_active: active,
    })
    if (error) setFailed(error.message)
    else await onDone()
    setBusy(null)
  }

  return (
    <div className="card card-pad approvals">
      <div className="section-title">
        Pending verification ({pending.length})
      </div>
      <p className="sub" style={{ marginBottom: 14, maxWidth: '62ch' }}>
        Anyone can create a teacher account, and a teacher reads every answer key in the bank, every
        student on the roster and the house content everyone's sessions are built from. These
        accounts can see none of it until you say so.
      </p>

      {failed && <Notice kind="error">{failed}</Notice>}

      <ul className="approval-list">
        {pending.map((p) => (
          <li key={p.id}>
            <div>
              <div className="cell-strong">{p.full_name || 'Unnamed'}</div>
              <div className="cell-sub">
                <span className="num">{p.display_id}</span>
                {p.email && <> · {p.email}</>} · signed up {formatUtc(p.created_at)}
              </div>
            </div>
            <div className="spring" />
            <button
              type="button"
              className="btn btn-primary btn-sm"
              disabled={busy === p.id}
              onClick={() => void decide(p.id, true)}
            >
              {busy === p.id ? 'Working…' : 'Approve'}
            </button>
          </li>
        ))}
      </ul>
    </div>
  )
}

/**
 * What an admin is told once a PC has been made or sent a link.
 *
 * When the email went, where it went. When it did not — no mail provider set
 * up yet, or the server said no — the PC is still made, and the link is on
 * this screen once, for the admin to send themselves. It is not stored
 * anywhere to show again: another is a click away, and it replaces this one.
 */
function InviteResult({ result, again }: { result: PcResult; again: boolean }) {
  const name = result.profile.full_name
  const email = result.profile.email ?? ''
  const what = result.joined ? 'a link to choose a new password' : 'a link to set up their account'
  const done = again ? `${name} has a new link` : `${name} is a PC now`
  const until = result.expires_at ? ` It works once, until ${formatUtc(result.expires_at)}.` : ''

  if (result.emailed) {
    return (
      <Notice kind="ok">
        {done}. {result.joined ? 'A link to choose a new password' : 'The link to set up their account'} went
        to <strong>{email}</strong>.{until}
      </Notice>
    )
  }

  if (!result.link) {
    return (
      <Notice kind="info">
        <strong>{done}, but no link could be made</strong>
        {result.reason ? ` — ${result.reason}` : ''}. Use <em>Send the invitation</em> on their row to try
        again.
      </Notice>
    )
  }

  return (
    <Notice kind="info">
      <p style={{ marginBottom: 8 }}>
        <strong>{done}, but the email did not go</strong>
        {result.reason ? ` — ${result.reason}` : ''}. Send {email || 'them'} {what} yourself. It is shown this
        once.{until}
      </p>
      <div className="credentials">
        <code className="invite-link">{result.link}</code>
        <CopyButton value={result.link} label="Copy the link" />
      </div>
    </Notice>
  )
}

/** Adding a PC: their name and the address their link goes to. */
function AddPc({ onAdded }: { onAdded: () => Promise<void> }) {
  const [first, setFirst] = useState('')
  const [last, setLast] = useState('')
  const [email, setEmail] = useState('')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [result, setResult] = useState<PcResult | null>(null)

  const badEmail = email.trim() !== '' && !isEmailAddress(email)
  const ready = !busy && first.trim() !== '' && last.trim() !== '' && isEmailAddress(email)

  async function onSubmit(e: FormEvent) {
    e.preventDefault()
    setBusy(true)
    setError(null)
    setResult(null)
    try {
      setResult(await addPc({ first, last, email }))
      setFirst('')
      setLast('')
      setEmail('')
      await onAdded()
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    } finally {
      setBusy(false)
    }
  }

  return (
    <form className="card card-pad approvals" onSubmit={onSubmit} noValidate>
      <div className="section-title">Add a PC</div>
      <p className="sub" style={{ marginBottom: 14, maxWidth: '64ch' }}>
        They are emailed a link that opens a page with this address filled in: they choose a password
        and they are in, with nothing more to confirm. From then on they see the sessions and reports
        of the students they are PC to. Teachers choose a student’s PC from this list when they book
        the student’s first session.
      </p>

      {error && <Notice kind="error">{error}</Notice>}
      {result && <InviteResult result={result} again={false} />}

      <div className="grid-2">
        <Field label="First name" required>
          <Input value={first} onChange={(e) => setFirst(e.target.value)} autoComplete="off" />
        </Field>
        <Field label="Last name" required>
          <Input value={last} onChange={(e) => setLast(e.target.value)} autoComplete="off" />
        </Field>
      </div>
      <Field label="Email" required hint={badEmail ? 'That is not an email address.' : undefined}>
        <Input
          type="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="priya.rao@ascendnow.info"
          autoComplete="off"
        />
      </Field>
      <button type="submit" className="btn btn-primary" disabled={!ready}>
        {busy ? 'Adding…' : 'Add the PC and email their invitation'}
      </button>
    </form>
  )
}

/** The PCs, with the two things an admin does to one. */
function PcList({
  rows,
  invites,
  onChanged,
}: {
  rows: ReturnType<typeof pcRows>
  invites: Map<string, PcInvite>
  onChanged: () => Promise<void>
}) {
  const [busy, setBusy] = useState<string | null>(null)
  const [error, setError] = useState<string | null>(null)
  const [result, setResult] = useState<PcResult | null>(null)

  async function invite(pc: Profile) {
    const joined = invites.get(pc.id)?.joined_at != null
    const ask = joined
      ? `Email ${pc.full_name} a link to choose a new password? Their current one keeps working until they use it.`
      : `Email ${pc.full_name} a new link to set up their account? Any link sent before stops working.`
    if (!window.confirm(ask)) return
    setBusy(pc.id)
    setError(null)
    setResult(null)
    try {
      setResult(await sendPcInvite(pc.id))
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err))
    }
    await onChanged()
    setBusy(null)
  }

  async function toggle(pc: Profile) {
    const suspending = !isSuspended(pc)
    if (
      suspending &&
      !window.confirm(
        `Suspend ${pc.full_name}? They will not be able to sign in, and reports on their students will not be emailed to anybody until you let them back in or give the students another PC.`,
      )
    ) {
      return
    }
    setBusy(pc.id)
    setError(null)
    setResult(null)
    const { error: err } = await supabase.rpc('set_profile_active', { p_profile: pc.id, p_active: !suspending })
    if (err) setError(err.message)
    else await onChanged()
    setBusy(null)
  }

  return (
    <>
      {error && <Notice kind="error">{error}</Notice>}
      {result && <InviteResult result={result} again />}
      <PcTable
        rows={rows}
        invites={invites}
        busy={busy}
        onInvite={(p) => void invite(p)}
        onToggle={(p) => void toggle(p)}
      />
    </>
  )
}

/**
 * A student's PC, which an admin can change. A teacher chooses it once, at the
 * student's first booking; moving a student to another PC — and every report
 * they have with them — is this.
 */
function StudentPc({
  student,
  pcs,
  onChanged,
}: {
  student: Profile
  pcs: Profile[]
  onChanged: () => Promise<void>
}) {
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const options = pcs.filter(choosable)
  const current = pcs.find((p) => p.id === student.pc_id) ?? null

  async function change(id: string) {
    if (!id || id === student.pc_id) return
    const to = pcs.find((p) => p.id === id)?.full_name ?? 'that PC'
    if (
      student.pc_id &&
      !window.confirm(`Move ${student.full_name} from ${current?.full_name ?? 'their PC'} to ${to}? Their sessions and reports go with them.`)
    ) {
      return
    }
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.rpc('assign_student_pc', { p_student: student.id, p_pc_id: id })
    if (err) setError(err.message)
    else await onChanged()
    setBusy(false)
  }

  return (
    <>
      <select
        className="select pc-select"
        value={student.pc_id ?? ''}
        disabled={busy || options.length === 0}
        aria-label={`PC for ${student.full_name}`}
        onChange={(e) => void change(e.target.value)}
      >
        {!student.pc_id && (
          <option value="">{student.pc ? `“${student.pc}” — choose` : 'None — choose'}</option>
        )}
        {current && !choosable(current) && (
          <option value={current.id}>{current.full_name} (suspended)</option>
        )}
        {options.map((p) => (
          <option key={p.id} value={p.id}>
            {p.full_name}
          </option>
        ))}
      </select>
      {error && <div className="cell-sub overdue">{error}</div>}
    </>
  )
}
