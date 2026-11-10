import { useCallback, useEffect, useState } from 'react'
import {
  BLUEBOOK_DEFAULT_NAME,
  bluebookHeadline,
  bluebookProblem,
  byDay,
  change,
  dayLabel,
  EMPTY_SCORE,
  ordinal,
  readBluebook,
  sameName,
  type Band,
  type BluebookScore,
} from '../lib/bluebook'
import { pdfLines } from '../lib/pdfText'
import { supabase } from '../lib/supabase'
import { DomainBands } from './DomainBands'
import { Field, Input, Notice, Textarea } from './ui'

/** One row of bluebook_scores (0088, 0090). */
interface Row {
  id: string
  test_name: string
  taken_on: string
  total: number
  reading_writing: number
  math: number
  read_from: 'report' | 'typed'
  official: boolean
  total_percentile: number | null
  rw_percentile: number | null
  math_percentile: number | null
  domains: Record<string, Band> | null
  created_by: string | null
}

/**
 * A student's SAT scores from Bluebook (0088, 0090): official SATs and
 * practice tests, oldest first — the total and the two sections with their
 * percentiles, the change in the total from the one before, and the eight
 * domains' performance bands where the report gave them.
 *
 * Staff add one by reading College Board's score report — a PDF, or its text
 * pasted — or by typing it; either way the form shows what will be saved and
 * the database checks it again. The report itself is read here, in the
 * browser, and is not kept; the name on it is read only to check it is this
 * student's. The PC reads the list and changes nothing.
 */
export function BluebookScores({
  studentId,
  studentName,
  staff,
  me,
  isAdmin,
}: {
  studentId: string
  /** Whom the page is for — a report for somebody else is said to be. */
  studentName: string | null
  /** A teacher or an admin: may add one. */
  staff: boolean
  /** Who is looking: a teacher deletes what they recorded. */
  me: string | null
  isAdmin: boolean
}) {
  const [rows, setRows] = useState<Row[]>([])
  const [error, setError] = useState<string | null>(null)
  const [adding, setAdding] = useState(false)
  const [busy, setBusy] = useState(false)
  const [open, setOpen] = useState<string | null>(null)

  const load = useCallback(async () => {
    const { data, error: err } = await supabase
      .from('bluebook_scores')
      .select(
        'id, test_name, taken_on, total, reading_writing, math, read_from, official,' +
          ' total_percentile, rw_percentile, math_percentile, domains, created_by',
      )
      .eq('student_id', studentId)
    if (err) setError(err.message)
    setRows(byDay((data ?? []) as unknown as Row[]))
  }, [studentId])

  useEffect(() => {
    void load()
  }, [load])

  async function remove(r: Row) {
    if (!window.confirm(`Delete ${r.test_name} (${dayLabel(r.taken_on)}, ${r.total})?`)) return
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.rpc('delete_bluebook_score', { p_id: r.id })
    if (err) setError(err.message)
    await load()
    setBusy(false)
  }

  const headline = bluebookHeadline(rows)
  const columns = 7 + (staff ? 1 : 0)

  return (
    <section className="card card-pad bluebook">
      <div className="bluebook-head">
        <div>
          <div className="section-title">SAT scores</div>
          <p className="muted">
            {headline
              ? `${headline}. Official SATs and Bluebook practice tests: total on 400–1600, each section on 200–800.`
              : 'Official SATs and College Board’s practice tests, sat in Bluebook. None recorded yet.'}
          </p>
        </div>
        <span className="spring" />
        {staff && !adding && (
          <button type="button" className="btn btn-primary btn-sm" onClick={() => setAdding(true)}>
            Add a score
          </button>
        )}
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      {adding && (
        <BluebookAdd
          studentId={studentId}
          studentName={studentName}
          onDone={async (saved) => {
            setAdding(false)
            if (saved) await load()
          }}
        />
      )}

      {rows.length > 0 && (
        <div className="board">
          <div className="board-scroll">
            <table className="board-table">
              <thead>
                <tr>
                  <th>Sat</th>
                  <th>Test</th>
                  <th className="num">Total</th>
                  <th className="num">Reading and Writing</th>
                  <th className="num">Math</th>
                  <th className="num">Change</th>
                  <th>Domains</th>
                  {staff && <th />}
                </tr>
              </thead>
              <tbody>
                {rows.map((r, i) => (
                  <ScoreRow
                    key={r.id}
                    r={r}
                    before={i > 0 ? rows[i - 1] : null}
                    open={open === r.id}
                    onToggle={() => setOpen(open === r.id ? null : r.id)}
                    columns={columns}
                    canDelete={staff && (isAdmin || r.created_by === me)}
                    staff={staff}
                    busy={busy}
                    onDelete={() => void remove(r)}
                  />
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </section>
  )
}

/** "1350" with "90th" under it, or the score alone. */
function Scored({ value, percentile }: { value: number; percentile: number | null }) {
  return (
    <>
      {value}
      {percentile !== null && <div className="muted">{ordinal(percentile)} percentile</div>}
    </>
  )
}

function ScoreRow({
  r,
  before,
  open,
  onToggle,
  columns,
  canDelete,
  staff,
  busy,
  onDelete,
}: {
  r: Row
  before: Row | null
  open: boolean
  onToggle: () => void
  columns: number
  canDelete: boolean
  staff: boolean
  busy: boolean
  onDelete: () => void
}) {
  const hasDomains = !!r.domains && Object.keys(r.domains).length > 0
  return (
    <>
      <tr>
        <td>{dayLabel(r.taken_on)}</td>
        <td>
          {r.test_name}{' '}
          <span className={`badge ${r.official ? 'badge-sky' : 'badge-neutral'}`}>
            {r.official ? 'Official SAT' : 'Practice'}
          </span>
          {r.read_from === 'report' && <div className="muted">read off the report</div>}
        </td>
        <td className="num cell-strong">
          <Scored value={r.total} percentile={r.total_percentile} />
        </td>
        <td className="num">
          <Scored value={r.reading_writing} percentile={r.rw_percentile} />
        </td>
        <td className="num">
          <Scored value={r.math} percentile={r.math_percentile} />
        </td>
        <td className="num">{before ? change(before.total, r.total) : '—'}</td>
        <td>
          {hasDomains ? (
            <button type="button" className="link-btn" aria-expanded={open} onClick={onToggle}>
              {open ? 'Hide' : 'Show'} bands
            </button>
          ) : (
            <span className="dash">—</span>
          )}
        </td>
        {staff && (
          <td className="num">
            {canDelete && (
              <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={onDelete}>
                Delete
              </button>
            )}
          </td>
        )}
      </tr>
      {open && hasDomains && (
        <tr className="bluebook-bands-row">
          <td colSpan={columns}>
            <DomainBands domains={r.domains!} />
          </td>
        </tr>
      )}
    </>
  )
}

const today = () => new Date().toISOString().slice(0, 10)

/** "1250" → 1250; "" → null. */
const asNumber = (v: string): number | null => (v.trim() === '' ? null : Number(v))

/**
 * Adding a score: read the report, or type it. What the report gave is shown
 * in the form, with what was and was not found, and nothing is saved until
 * Save — a teacher changing a score it read makes it a typed one.
 */
function BluebookAdd({
  studentId,
  studentName,
  onDone,
}: {
  studentId: string
  studentName: string | null
  onDone: (saved: boolean) => Promise<void>
}) {
  const [score, setScore] = useState<BluebookScore>(EMPTY_SCORE)
  const [notes, setNotes] = useState<string[]>([])
  const [reportName, setReportName] = useState<string | null>(null)
  const [paste, setPaste] = useState('')
  const [read, setRead] = useState(false)
  const [edited, setEdited] = useState(false)
  const [reading, setReading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  function take(text: string) {
    const r = readBluebook(text)
    setScore(r.score)
    setNotes(r.notes)
    setReportName(r.name)
    setRead(true)
    setEdited(false)
  }

  async function fromFile(file: File) {
    setError(null)
    setReading(true)
    try {
      if (file.type === 'application/pdf' || /\.pdf$/i.test(file.name)) {
        take((await pdfLines(await file.arrayBuffer())).join('\n'))
      } else if (file.type.startsWith('text/') || /\.txt$/i.test(file.name)) {
        take(await file.text())
      } else {
        setNotes([])
        setError('A picture cannot be read here. Type the scores from it below.')
      }
    } catch (e) {
      setError(`The file could not be read (${e instanceof Error ? e.message : String(e)}). Paste its text, or type the scores.`)
    }
    setReading(false)
  }

  function set<K extends keyof BluebookScore>(field: K, value: BluebookScore[K]) {
    setScore({ ...score, [field]: value })
    // A score or the day changed by hand is no longer what the report said.
    if (field === 'total' || field === 'readingWriting' || field === 'math' || field === 'takenOn')
      setEdited(true)
  }

  const problem = bluebookProblem(score, today())
  const someoneElse = reportName && studentName && !sameName(reportName, studentName) ? reportName : null

  async function save() {
    if (problem) return
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.rpc('save_bluebook_score', {
      p_student: studentId,
      p_test_name: score.test?.trim() || (score.official ? 'SAT' : BLUEBOOK_DEFAULT_NAME),
      p_taken_on: score.takenOn,
      p_total: score.total,
      p_reading_writing: score.readingWriting,
      p_math: score.math,
      p_read_from: read && !edited ? 'report' : 'typed',
      p_official: score.official === true,
      p_total_percentile: score.totalPercentile,
      p_rw_percentile: score.readingWritingPercentile,
      p_math_percentile: score.mathPercentile,
      p_domains: score.domains,
    })
    setBusy(false)
    if (err) setError(err.message)
    else await onDone(true)
  }

  return (
    <div className="bluebook-add">
      <div className="grid-2">
        <Field
          label="Read it off the score report"
          hint="College Board’s PDF: the SAT score report, or a practice test’s from My Practice. It is read here and not kept: only the scores are saved."
        >
          <input
            type="file"
            accept=".pdf,.txt,application/pdf,text/plain"
            disabled={reading}
            onChange={(e) => {
              const f = e.target.files?.[0]
              if (f) void fromFile(f)
              e.target.value = ''
            }}
          />
        </Field>
        <div>
          <Field label="Or paste the report’s text">
            <Textarea rows={3} value={paste} onChange={(e) => setPaste(e.target.value)} />
          </Field>
          <button
            type="button"
            className="btn btn-sm"
            disabled={!paste.trim()}
            onClick={() => take(paste)}
          >
            Read it
          </button>
        </div>
      </div>

      {reading && <p className="muted">Reading the report…</p>}
      {someoneElse && (
        <Notice kind="error">
          This report is for {someoneElse}, and you are adding it to {studentName}. Check it is
          theirs before saving.
        </Notice>
      )}
      {notes.length > 0 && (
        <Notice kind="info">
          {notes.map((n) => (
            <div key={n}>{n}</div>
          ))}
        </Notice>
      )}
      {error && <Notice kind="error">{error}</Notice>}

      <label className="check bluebook-official">
        <input
          type="checkbox"
          checked={score.official === true}
          onChange={(e) => set('official', e.target.checked)}
        />{' '}
        An official SAT, sat at a test centre — not a practice test
      </label>

      <div className="bluebook-form">
        <Field label="Test">
          <Input
            value={score.test ?? ''}
            placeholder={score.official ? 'SAT' : BLUEBOOK_DEFAULT_NAME}
            onChange={(e) => set('test', e.target.value || null)}
          />
        </Field>
        <Field label="Sat on" required>
          <Input
            type="date"
            max={today()}
            value={score.takenOn ?? ''}
            onChange={(e) => set('takenOn', e.target.value || null)}
          />
        </Field>
        <Field label="Total" required>
          <Input
            type="number"
            min={400}
            max={1600}
            step={10}
            value={score.total ?? ''}
            onChange={(e) => set('total', asNumber(e.target.value))}
          />
        </Field>
        <Field label="Reading and Writing" required>
          <Input
            type="number"
            min={200}
            max={800}
            step={10}
            value={score.readingWriting ?? ''}
            onChange={(e) => set('readingWriting', asNumber(e.target.value))}
          />
        </Field>
        <Field label="Math" required>
          <Input
            type="number"
            min={200}
            max={800}
            step={10}
            value={score.math ?? ''}
            onChange={(e) => set('math', asNumber(e.target.value))}
          />
        </Field>
      </div>

      <div className="bluebook-form">
        <Field label="Total percentile" hint="Optional: the report’s 90th* and so on.">
          <Input
            type="number"
            min={1}
            max={99}
            value={score.totalPercentile ?? ''}
            onChange={(e) => set('totalPercentile', asNumber(e.target.value))}
          />
        </Field>
        <Field label="Reading and Writing percentile">
          <Input
            type="number"
            min={1}
            max={99}
            value={score.readingWritingPercentile ?? ''}
            onChange={(e) => set('readingWritingPercentile', asNumber(e.target.value))}
          />
        </Field>
        <Field label="Math percentile">
          <Input
            type="number"
            min={1}
            max={99}
            value={score.mathPercentile ?? ''}
            onChange={(e) => set('mathPercentile', asNumber(e.target.value))}
          />
        </Field>
      </div>

      {score.domains && (
        <div className="bluebook-read-bands">
          <div className="bluebook-read-bands-head">
            <strong>The domains’ performance bands, as read</strong>
            <button type="button" className="btn btn-ghost btn-sm" onClick={() => set('domains', null)}>
              Leave them out
            </button>
          </div>
          <DomainBands domains={score.domains} />
        </div>
      )}

      {problem && <p className="field-hint">{problem}</p>}
      <div className="panel-actions">
        <button type="button" className="btn btn-sm" disabled={busy} onClick={() => void onDone(false)}>
          Cancel
        </button>
        <button
          type="button"
          className="btn btn-primary btn-sm"
          disabled={busy || problem !== null}
          onClick={() => void save()}
        >
          {busy ? 'Saving…' : 'Save the score'}
        </button>
      </div>
    </div>
  )
}
