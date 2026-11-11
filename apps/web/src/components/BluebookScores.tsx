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
  type BluebookScore,
} from '../lib/bluebook'
import { addedBy, type BluebookApi, type BluebookListRow } from '../lib/bluebookApi'
import { pdfLines } from '../lib/pdfText'
import { DomainBands } from './DomainBands'
import { Field, Input, Notice, Textarea } from './ui'

type Row = BluebookListRow

/**
 * A student's SAT scores from Bluebook (0088, 0090): official SATs and
 * practice tests, oldest first — the total and the two sections with their
 * percentiles, the change in the total from the one before, and the eight
 * domains' performance bands where the report gave them.
 *
 * Anyone with the student adds one (0099) — staff, the student's PC, and the
 * student or their parent from the student's account — by reading College
 * Board's score report (a PDF, or its text pasted) or by typing it; either way
 * the form shows what will be saved and the database checks it again. The
 * report itself is read here, in the browser, and is not kept; the name on it
 * is read only to check it is this student's. Each score says who added it,
 * and whoever added it — or an admin — can delete it.
 */
export function BluebookScores({
  api,
  studentName,
  onChanged,
}: {
  /** The door scores are read and written through: staff, the PC, or the student's key. */
  api: BluebookApi
  /** Whom the page is for — a report for somebody else is said to be. */
  studentName: string | null
  /** After a score is added or deleted: for a page that shows them elsewhere too. */
  onChanged?: () => void
}) {
  const [rows, setRows] = useState<Row[]>([])
  const [error, setError] = useState<string | null>(null)
  const [adding, setAdding] = useState(false)
  const [busy, setBusy] = useState(false)
  const [open, setOpen] = useState<string | null>(null)

  const load = useCallback(async () => {
    try {
      setRows(byDay(await api.load()))
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
    }
  }, [api])

  useEffect(() => {
    void load()
  }, [load])

  async function remove(r: Row) {
    if (!window.confirm(`Delete ${r.test_name} (${dayLabel(r.taken_on)}, ${r.total})?`)) return
    setBusy(true)
    setError(null)
    try {
      await api.remove(r.id)
      onChanged?.()
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
    }
    await load()
    setBusy(false)
  }

  const headline = bluebookHeadline(rows)
  const columns = 8
  const student = api.audience === 'student'

  return (
    <section className="card card-pad bluebook" id="sat-scores">
      <div className="bluebook-head">
        <div>
          <div className="section-title">SAT scores</div>
          <p className="muted">
            {headline
              ? `${headline}. Official SATs and Bluebook practice tests: total on 400–1600, each section on 200–800.`
              : student
                ? 'Your official SAT and Bluebook practice test scores. Add one from College Board’s score report — the PDF, or its text — or type it in.'
                : 'Official SATs and College Board’s practice tests, sat in Bluebook. None recorded yet.'}
          </p>
        </div>
        <span className="spring" />
        {api.canAdd && !adding && (
          <button type="button" className="btn btn-primary btn-sm" onClick={() => setAdding(true)}>
            Add a score
          </button>
        )}
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      {adding && (
        <BluebookAdd
          api={api}
          studentName={studentName}
          onDone={async (saved) => {
            setAdding(false)
            if (saved) {
              await load()
              onChanged?.()
            }
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
                  <th>Added by</th>
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
                    who={addedBy(r.recorded_by, api.audience)}
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
  who,
  busy,
  onDelete,
}: {
  r: Row
  before: Row | null
  open: boolean
  onToggle: () => void
  columns: number
  who: string
  busy: boolean
  onDelete: () => void
}) {
  const hasDomains = !!r.domains && Object.keys(r.domains).length > 0
  return (
    <>
      <tr>
        <td className="nowrap">{dayLabel(r.taken_on)}</td>
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
        <td className="bluebook-who">
          <span className="muted-cell">{who}</span>
          {r.deletable && (
            <button type="button" className="btn btn-ghost btn-sm" disabled={busy} onClick={onDelete}>
              Delete
            </button>
          )}
        </td>
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
  api,
  studentName,
  onDone,
}: {
  api: BluebookApi
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
    if (problem || !score.takenOn || score.total === null || score.readingWriting === null || score.math === null) return
    setBusy(true)
    setError(null)
    try {
      await api.save({
        test_name: score.test?.trim() || (score.official ? 'SAT' : BLUEBOOK_DEFAULT_NAME),
        taken_on: score.takenOn,
        total: score.total,
        reading_writing: score.readingWriting,
        math: score.math,
        read_from: read && !edited ? 'report' : 'typed',
        official: score.official === true,
        total_percentile: score.totalPercentile,
        rw_percentile: score.readingWritingPercentile,
        math_percentile: score.mathPercentile,
        domains: score.domains,
      })
    } catch (e) {
      setBusy(false)
      setError(e instanceof Error ? e.message : String(e))
      return
    }
    setBusy(false)
    await onDone(true)
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
