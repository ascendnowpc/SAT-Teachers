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
  type BluebookReading,
  type BluebookScore,
} from '../lib/bluebook'
import { addedBy, type BluebookApi, type BluebookListRow } from '../lib/bluebookApi'
import { pdfLines } from '../lib/pdfText'
import { DomainBands } from './DomainBands'
import { Icon } from './Icon'
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
  readPicture,
}: {
  /** The door scores are read and written through: staff, the PC, or the student's key. */
  api: BluebookApi
  /** Reads a picture of the report — a screenshot, a photo, a scanned PDF — when the app can (read_score_report). */
  readPicture?: (file: File) => Promise<BluebookReading>
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
            {headline ?? (student ? 'Add your SAT or Bluebook practice test score.' : 'None recorded yet.')}
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
          readPicture={readPicture}
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
export function BluebookAdd({
  api,
  studentName,
  onDone,
  readPicture,
  cancelLabel = 'Cancel',
}: {
  api: BluebookApi
  studentName: string | null
  onDone: (saved: boolean) => Promise<void>
  readPicture?: (file: File) => Promise<BluebookReading>
  cancelLabel?: string
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
  const [fileName, setFileName] = useState<string | null>(null)
  const [dragging, setDragging] = useState(false)

  function takeReading(r: BluebookReading) {
    setScore(r.score)
    setNotes(r.notes)
    setReportName(r.name)
    setRead(true)
    setEdited(false)
  }

  function take(text: string) {
    takeReading(readBluebook(text))
  }

  async function fromFile(file: File) {
    setError(null)
    setReading(true)
    try {
      if (file.type === 'application/pdf' || /\.pdf$/i.test(file.name)) {
        const r = readBluebook((await pdfLines(await file.arrayBuffer())).join('\n'))
        // A scanned PDF has no text to read: its picture is read instead.
        const nothing = r.score.total === null && r.score.readingWriting === null && r.score.math === null
        takeReading(nothing && readPicture ? await readPicture(file) : r)
      } else if (file.type.startsWith('text/') || /\.txt$/i.test(file.name)) {
        take(await file.text())
      } else if (file.type.startsWith('image/') && readPicture) {
        takeReading(await readPicture(file))
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
      <label
        className={`file-drop${dragging ? ' is-drag' : ''}${reading ? ' is-busy' : ''}${fileName && !reading ? (error ? ' has-error' : ' has-file') : ''}`}
        onDragOver={(e) => {
          e.preventDefault()
          if (!reading) setDragging(true)
        }}
        onDragLeave={() => setDragging(false)}
        onDrop={(e) => {
          e.preventDefault()
          setDragging(false)
          const f = e.dataTransfer.files?.[0]
          if (f && !reading) {
            setFileName(f.name)
            void fromFile(f)
          }
        }}
      >
        <input
          className="file-drop-input"
          type="file"
          accept={readPicture ? '.pdf,.txt,application/pdf,text/plain,image/*' : '.pdf,.txt,application/pdf,text/plain'}
          disabled={reading}
          onChange={(e) => {
            const f = e.target.files?.[0]
            if (f) {
              setFileName(f.name)
              void fromFile(f)
            }
            e.target.value = ''
          }}
        />
        <span className="file-drop-orb" aria-hidden="true">
          {reading ? <span className="spinner" /> : <Icon name={!fileName ? 'upload' : error ? 'alert' : 'check'} size={26} />}
        </span>
        <b>{reading ? 'Reading your report…' : fileName ?? 'Upload the score report'}</b>
        <span className="file-drop-hint">
          {reading
            ? 'This takes a few seconds.'
            : fileName
              ? error
                ? 'Could not read it — try another file, or type the scores below.'
                : 'Read. Check the scores below, then save.'
              : readPicture
                ? 'A PDF or a screenshot — drag it here, or'
                : 'College Board’s PDF — drag it here, or'}
        </span>
        {!reading && (
          <span className="file-drop-btn">
            <Icon name="file" size={16} /> {fileName ? 'Choose another file' : 'Choose file'}
          </span>
        )}
        <span className="file-drop-types">{readPicture ? 'PDF · PNG · JPG · HEIC' : 'PDF · TXT'}</span>
      </label>
      <p className="file-drop-note">
        <Icon name="check" size={14} /> Only the scores are saved — the file is not kept.
      </p>
      <details className="file-drop-paste">
        <summary>Or paste the report’s text</summary>
        <Textarea rows={3} value={paste} onChange={(e) => setPaste(e.target.value)} aria-label="The report’s text" />
        <button type="button" className="btn btn-sm" disabled={!paste.trim()} onClick={() => take(paste)}>
          Read it
        </button>
      </details>

      <div className="file-drop-or">
        <span>Check or type the scores</span>
      </div>
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
          {cancelLabel}
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
