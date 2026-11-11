import { useCallback, useEffect, useMemo, useState, type FormEvent } from 'react'
import { useSearchParams } from 'react-router-dom'
import { PcTable, PeopleTable, Stat } from '../components/AdminUi'
import { InviteResult, StudentPcSelect, usePcActions } from '../components/PcActions'
import { Field, Input, Notice } from '../components/ui'
import { useSchool } from '../hooks/useSchool'
import { filterPeople, isSuspended, NEW_TEACHER_DAYS, newTeachers, pcRows, studentRows, teacherRows } from '../lib/admin'
import { isEmailAddress } from '../lib/mail'
import { addPc, loadPcInvites } from '../lib/pcApi'
import type { PcResult } from '../lib/pcs'
import { loadPins } from '../lib/studentPins'
import type { PcInvite } from '../lib/types'

type Tab = 'teachers' | 'students' | 'pcs'
const TABS: Tab[] = ['teachers', 'students', 'pcs']

/**
 * Users — everybody on the platform.
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

  const arrived = useMemo(() => newTeachers(profiles), [profiles])
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

  // Each student's sign-in PIN (0067), beside their ID. Only the students tab asks.
  const [pins, setPins] = useState<Map<string, string>>(new Map())
  useEffect(() => {
    if (tab !== 'students') return
    let live = true
    void loadPins().then((p) => {
      if (live) setPins(p)
    })
    return () => {
      live = false
    }
  }, [tab])

  const all = tab === 'teachers' ? teachers : tab === 'students' ? students : pcs
  const shown = useMemo(() => filterPeople(all, query), [all, query])
  const active = teachers.filter((t) => t.profile.is_active).length
  const unassigned = students.filter((s) => !s.profile.pc_id).length

  return (
    <div className="page page-wide">
      <div className="page-head">
        <div>
          <h1>Users</h1>
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      <div className="stats">
        <Stat k="Teachers" v={teachers.length} sub={`${active} active`} />
        <Stat k="Students" v={students.length} sub="on the roster" />
        <Stat k="PCs" v={pcs.length} sub={`${pcs.filter((p) => !isSuspended(p.profile)).length} active`} />
        <Stat
          k="New teachers"
          v={arrived.length}
          sub={`signed up in the last ${NEW_TEACHER_DAYS} days`}
        />
      </div>

      {/* Which half of the school, and what it has been narrowed to, on one
          line: they are one decision, and the search box used to sit below in
          a card of its own the width of the page. */}
      <div className="tabs-bar">
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
        <div className="tab-search">
          <Input
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
          <span className="filter-count">
            {loading ? 'Loading…' : `${shown.length} of ${all.length}`}
          </span>
          {query && (
            <button type="button" className="btn btn-ghost btn-sm" onClick={() => setQuery('')}>
              Clear
            </button>
          )}
        </div>
      </div>

      {tab === 'pcs' && <AddPc onAdded={reloadPcs} />}
      {tab === 'students' && unassigned > 0 && (
        <p className="prose list-note">
          {unassigned} without a PC — choose one below.
        </p>
      )}

      {loading ? (
        <div className="empty">Loading…</div>
      ) : tab === 'pcs' && pcs.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>No PCs yet</h3>
            <p>Add one above. Sessions need a PC to be booked.</p>
          </div>
        </div>
      ) : shown.length === 0 ? (
        <div className="card">
          <div className="empty">
            <h3>Nobody matches</h3>
            <p>Try another search.</p>
          </div>
        </div>
      ) : tab === 'pcs' ? (
        <PcList rows={shown} invites={invites} onChanged={reloadPcs} />
      ) : (
        <PeopleTable
          rows={shown}
          kind={tab === 'teachers' ? 'teacher' : 'student'}
          href={(p) => (tab === 'teachers' ? `/admin/teachers/${p.id}` : `/admin/students/${p.id}`)}
          pcCell={
            tab === 'students'
              ? (p) => <StudentPcSelect student={p} pcs={pcProfiles} onChanged={reload} />
              : undefined
          }
          pin={tab === 'students' ? (p) => pins.get(p.id) : undefined}
        />
      )}
    </div>
  )
}

/**
 * Adding a PC: their name and the address their link goes to.
 *
 * Folded away, because it is done once a term and the list under it is what an
 * admin opened the tab for. Open, it stood five hundred pixels of empty form
 * between the tabs and the PCs, every time. It stays open after a submission,
 * because what comes back can be a link that the email did not carry — shown
 * this once, and gone the moment the form closes.
 */
function AddPc({ onAdded }: { onAdded: () => Promise<void> }) {
  const [first, setFirst] = useState('')
  const [last, setLast] = useState('')
  const [email, setEmail] = useState('')
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [result, setResult] = useState<PcResult | null>(null)
  const [open, setOpen] = useState(false)

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
    <details className="card folded" open={open} onToggle={(e) => setOpen(e.currentTarget.open)}>
      <summary>
        <span className="mark" aria-hidden="true">
          +
        </span>
        Add a PC
      </summary>
      <form className="fold-body form-measure" onSubmit={onSubmit} noValidate>
        <p className="prose">They get an email with a link to set their password.</p>

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
    </details>
  )
}

/** The PCs, with the two things an admin does to one; each row opens the PC's page. */
function PcList({
  rows,
  invites,
  onChanged,
}: {
  rows: ReturnType<typeof pcRows>
  invites: Map<string, PcInvite>
  onChanged: () => Promise<void>
}) {
  const actions = usePcActions(invites, onChanged)
  return (
    <>
      {actions.error && <Notice kind="error">{actions.error}</Notice>}
      {actions.result && <InviteResult result={actions.result} again />}
      <PcTable
        rows={rows}
        invites={invites}
        busy={actions.busy}
        href={(p) => `/admin/pcs/${p.id}`}
        onInvite={(p) => void actions.invite(p)}
        onToggle={(p) => void actions.toggle(p)}
      />
    </>
  )
}
