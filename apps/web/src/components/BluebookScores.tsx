import { useCallback, useEffect, useState } from 'react'
import {
  BLUEBOOK_DEFAULT_NAME,
  bluebookHeadline,
  bluebookProblem,
  byDay,
  change,
  dayLabel,
  readBluebook,
  type BluebookScore,
} from '../lib/bluebook'
import { pdfLines } from '../lib/pdfText'
import { supabase } from '../lib/supabase'
import { Field, Input, Notice, Textarea } from './ui'

/** One row of bluebook_scores (0088). */
interface Row {
  id: string
  test_name: string
  taken_on: string
  total: number
  reading_writing: number
  math: number
  read_from: 'report' | 'typed'
  created_by: string | null
}

/**
 * A student's Bluebook practice tests (0088): the total and the two sections
 * of each, oldest first, and the change in the total from the one before.
 *
 * Staff add one by reading College Board's score report — a PDF, or its text
 * pasted — or by typing it; either way the form shows what will be saved and
 * the database checks it again. The report itself is read here, in the
 * browser, and is not kept. The PC reads the list and changes nothing.
 */
export function BluebookScores({
  studentId,
  staff,
  me,
  isAdmin,
}: {
  studentId: string
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

  const load = useCallback(async () => {
    const { data, error: err } = await supabase
      .from('bluebook_scores')
      .select('id, test_name, taken_on, total, reading_writing, math, read_from, created_by')
      .eq('student_id', studentId)
    if (err) setError(err.message)
    setRows(byDay((data ?? []) as Row[]))
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

  return (
    <section className="card card-pad bluebook">
      <div className="bluebook-head">
        <div>
          <div className="section-title">Bluebook practice tests</div>
          <p className="muted">
            {headline
              ? `${headline}. Total on 400–1600; each section on 200–800.`
              : 'College Board’s full practice tests, sat in Bluebook. None recorded yet.'}
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
                  {staff && <th />}
                </tr>
              </thead>
              <tbody>
                {rows.map((r, i) => (
                  <tr key={r.id}>
                    <td>{dayLabel(r.taken_on)}</td>
                    <td>
                      {r.test_name}
                      {r.read_from === 'report' && <div className="muted">read off the report</div>}
                    </td>
                    <td className="num cell-strong">{r.total}</td>
                    <td className="num">{r.reading_writing}</td>
                    <td className="num">{r.math}</td>
                    <td className="num">{i === 0 ? '—' : change(rows[i - 1].total, r.total)}</td>
                    {staff && (
                      <td className="num">
                        {(isAdmin || r.created_by === me) && (
                          <button
                            type="button"
                            className="btn btn-ghost btn-sm"
                            disabled={busy}
                            onClick={() => void remove(r)}
                          >
                            Delete
                          </button>
                        )}
                      </td>
                    )}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </section>
  )
}

const EMPTY: BluebookScore = { test: null, takenOn: null, total: null, readingWriting: null, math: null }

const today = () => new Date().toISOString().slice(0, 10)

/** "1250" → 1250; "" → null. */
const asScore = (v: string): number | null => (v.trim() === '' ? null : Number(v))

/**
 * Adding a score: read the report, or type it. What the report gave is shown
 * in the form, with what was and was not found, and nothing is saved until
 * Save — a teacher changing a score it read makes it a typed one.
 */
function BluebookAdd({
  studentId,
  onDone,
}: {
  studentId: string
  onDone: (saved: boolean) => Promise<void>
}) {
  const [score, setScore] = useState<BluebookScore>(EMPTY)
  const [notes, setNotes] = useState<string[]>([])
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

  function set(field: keyof BluebookScore, value: string) {
    const v = field === 'test' || field === 'takenOn' ? value || null : asScore(value)
    setScore({ ...score, [field]: v })
    if (field !== 'test') setEdited(true)
  }

  const problem = bluebookProblem(score, today())

  async function save() {
    if (problem) return
    setBusy(true)
    setError(null)
    const { error: err } = await supabase.rpc('save_bluebook_score', {
      p_student: studentId,
      p_test_name: score.test?.trim() || BLUEBOOK_DEFAULT_NAME,
      p_taken_on: score.takenOn,
      p_total: score.total,
      p_reading_writing: score.readingWriting,
      p_math: score.math,
      p_read_from: read && !edited ? 'report' : 'typed',
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
          hint="College Board’s PDF, from My Practice. It is read here and not kept: only the scores are saved."
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
      {notes.length > 0 && (
        <Notice kind="info">
          {notes.map((n) => (
            <div key={n}>{n}</div>
          ))}
        </Notice>
      )}
      {error && <Notice kind="error">{error}</Notice>}

      <div className="bluebook-form">
        <Field label="Test">
          <Input
            value={score.test ?? ''}
            placeholder={BLUEBOOK_DEFAULT_NAME}
            onChange={(e) => set('test', e.target.value)}
          />
        </Field>
        <Field label="Sat on" required>
          <Input
            type="date"
            max={today()}
            value={score.takenOn ?? ''}
            onChange={(e) => set('takenOn', e.target.value)}
          />
        </Field>
        <Field label="Total" required>
          <Input
            type="number"
            min={400}
            max={1600}
            step={10}
            value={score.total ?? ''}
            onChange={(e) => set('total', e.target.value)}
          />
        </Field>
        <Field label="Reading and Writing" required>
          <Input
            type="number"
            min={200}
            max={800}
            step={10}
            value={score.readingWriting ?? ''}
            onChange={(e) => set('readingWriting', e.target.value)}
          />
        </Field>
        <Field label="Math" required>
          <Input
            type="number"
            min={200}
            max={800}
            step={10}
            value={score.math ?? ''}
            onChange={(e) => set('math', e.target.value)}
          />
        </Field>
      </div>

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
