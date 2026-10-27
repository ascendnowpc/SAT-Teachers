import { useEffect, useMemo, useState } from 'react'
import { useSearchParams } from 'react-router-dom'
import { Input, Notice } from '../components/ui'
import { SUBJECTS } from '../lib/constants'
import {
  defaultConfig,
  mapScore,
  onePointWorth,
  pointsProblem,
  settingsProblem,
  type ProgressConfig,
  type ScorePoints,
} from '../lib/progress'
import { loadConfig } from '../lib/progressApi'
import { supabase } from '../lib/supabase'
import type { Subject } from '../lib/types'

/**
 * How targeted tests are read, per subject (0061): the score mapping, where
 * Improved and Declined start, what counts as a long question, the default
 * set size, and how sure the long-question flag has to be. The admin's alone —
 * set_progress_config refuses anybody else and checks the mapping rises.
 *
 * Nothing is stored that depends on it: every score and verdict is computed
 * on read, so a change here re-reads every test already sat.
 *
 * It used to be every column of progress_config as a field, the mapping typed
 * as "0 20, 5 30, 8 40" and the long-question gap as a fraction. Now it reads
 * as the four questions an admin is actually answering — how a score becomes a
 * level score, when a change counts, how long a new test is, and what makes a
 * question long — each in a sentence with the number in it, and the mapping is
 * a table with what every score out of 10 comes to underneath.
 */
export function AdminSettings() {
  const [params, setParams] = useSearchParams()
  const subject: Subject = params.get('subject') === 'mathematics' ? 'mathematics' : 'english'
  const label = SUBJECTS.find((s) => s.value === subject)?.label ?? subject

  return (
    <div className="page">
      <div className="page-head">
        <div>
          <h1>Settings</h1>
          <p className="sub">
            How targeted tests are scored and judged, for each subject. A change applies straight
            away to every test, including ones already sat.
          </p>
        </div>
      </div>

      <div className="tabs">
        {SUBJECTS.map((s) => (
          <button
            key={s.value}
            type="button"
            className={`tab ${subject === s.value ? 'on' : ''}`}
            onClick={() =>
              setParams(s.value === 'english' ? {} : { subject: s.value }, { replace: true })
            }
          >
            {s.label}
          </button>
        ))}
      </div>

      <SubjectSettings key={subject} subject={subject} label={label} />
    </div>
  )
}

/** A point of the mapping as typed: text, so a field can be empty mid-edit. */
interface PointRow {
  raw: string
  level: string
}

const toRows = (points: ScorePoints): PointRow[] =>
  points.map(([r, l]) => ({ raw: String(r), level: String(l) }))

/** Empty is NaN rather than 0, so settingsProblem asks for the number. */
const num = (text: string) => (text.trim() === '' ? NaN : Number(text))

function SubjectSettings({ subject, label }: { subject: Subject; label: string }) {
  /** What is saved, to tell whether anything has changed. */
  const [saved, setSaved] = useState<ProgressConfig | null>(null)
  const [cfg, setCfg] = useState<ProgressConfig | null>(null)
  const [points, setPoints] = useState<PointRow[]>([])
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)
  const [ok, setOk] = useState(false)

  function show(c: ProgressConfig) {
    setCfg(c)
    setPoints(toRows(c.score_points))
  }

  useEffect(() => {
    void loadConfig(subject).then((c) => {
      setSaved(c)
      show(c)
    })
  }, [subject])

  // The form as it would be saved: the points sorted, since a row added at the
  // bottom may belong in the middle.
  const draft = useMemo<ProgressConfig | null>(() => {
    if (!cfg) return null
    const pts = points.map((p) => [num(p.raw), num(p.level)] as [number, number])
    return { ...cfg, score_points: pts.sort((a, b) => a[0] - b[0]) }
  }, [cfg, points])

  if (!cfg || !draft || !saved) return <p className="field-hint">Loading…</p>

  const problem = settingsProblem(draft)
  const changed = JSON.stringify(fields(draft)) !== JSON.stringify(fields(saved))
  const isDefault = JSON.stringify(fields(draft)) === JSON.stringify(fields(defaultConfig(subject)))

  function set<K extends keyof ProgressConfig>(key: K, value: ProgressConfig[K]) {
    setOk(false)
    setCfg((c) => (c ? { ...c, [key]: value } : c))
  }

  function setPoint(i: number, side: keyof PointRow, value: string) {
    setOk(false)
    setPoints((rows) => rows.map((r, j) => (j === i ? { ...r, [side]: value } : r)))
  }

  async function save() {
    if (!draft || problem) return
    setBusy(true)
    setErr(null)
    setOk(false)
    const { error } = await supabase.rpc('set_progress_config', {
      p_subject: subject,
      p_config: fields(draft),
    })
    if (error) setErr(error.message)
    else {
      setOk(true)
      setSaved(draft)
      show(draft)
    }
    setBusy(false)
  }

  // A worked example for the verdicts: one more right answer on a test of the
  // default size, from the middle of the range — does it count as Improved?
  const size = draft.default_set_size
  const mappingOk = pointsProblem(draft.score_points) === null
  const worth =
    mappingOk && Number.isInteger(size) && size > 0
      ? Math.round(onePointWorth(size, 5, draft.score_points))
      : null
  const shortExample = Math.min(100, Math.max(Math.round(draft.pattern_gap * 100), 80))
  const longExample = shortExample - Math.round(draft.pattern_gap * 100)

  return (
    <div className="settings">
      {err && <Notice kind="error">{err}</Notice>}

      <section className="card card-pad">
        <div className="section-title">1 · Turning a score into a level score</div>
        <p className="settings-lead">
          A targeted test can be 5 questions or 10, so its score is first put out of 10 — 3 right of
          5 is 6 out of 10 — and then turned into a level score using the points below, so tests of
          any size can be compared. Between two points the level score rises in a straight line;
          above the last point it keeps rising at the same rate.
        </p>

        <table className="settings-points">
          <thead>
            <tr>
              <th>Score out of 10</th>
              <th>Level score</th>
              <th aria-label="Remove" />
            </tr>
          </thead>
          <tbody>
            {points.map((p, i) => (
              <tr key={i}>
                <td>
                  <Input
                    type="number"
                    min={0}
                    max={10}
                    step="any"
                    aria-label={`Point ${i + 1}: score out of 10`}
                    value={p.raw}
                    onChange={(e) => setPoint(i, 'raw', e.target.value)}
                  />
                </td>
                <td>
                  <Input
                    type="number"
                    step="any"
                    aria-label={`Point ${i + 1}: level score`}
                    value={p.level}
                    onChange={(e) => setPoint(i, 'level', e.target.value)}
                  />
                </td>
                <td>
                  <button
                    type="button"
                    className="btn btn-ghost btn-sm"
                    disabled={points.length <= 2}
                    title={points.length <= 2 ? 'A line needs at least two points' : undefined}
                    onClick={() => {
                      setOk(false)
                      setPoints((rows) => rows.filter((_, j) => j !== i))
                    }}
                  >
                    Remove
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        <button
          type="button"
          className="btn btn-ghost btn-sm"
          onClick={() => {
            setOk(false)
            setPoints((rows) => [...rows, { raw: '', level: '' }])
          }}
        >
          Add a point
        </button>

        {mappingOk && (
          <>
            <div className="settings-preview-title">What each score comes to</div>
            <ul className="settings-preview">
              {Array.from({ length: 11 }, (_, r) => (
                <li key={r}>
                  <span className="k">{r}/10</span>
                  <span className="v">{Math.round(mapScore(r, draft.score_points))}</span>
                </li>
              ))}
            </ul>
          </>
        )}
      </section>

      <section className="card card-pad">
        <div className="section-title">2 · When a change counts</div>
        <p className="settings-lead">
          Each targeted test is compared with the one before it on the same skill — or with the
          diagnostic, for the first test. The change in level score is called:
        </p>

        <ul className="settings-rules">
          <li>
            <span className="badge verdict-improved">Improved</span>
            <span>
              when it goes up by at least{' '}
              <Input
                className="input-inline"
                type="number"
                min={1}
                aria-label="Improved: points up"
                value={Number.isFinite(draft.improved_at) ? draft.improved_at : ''}
                onChange={(e) => set('improved_at', num(e.target.value))}
              />{' '}
              level points
            </span>
          </li>
          <li>
            <span className="badge verdict-declined">Declined</span>
            <span>
              when it goes down by at least{' '}
              <Input
                className="input-inline"
                type="number"
                min={1}
                aria-label="Declined: points down"
                value={Number.isFinite(draft.declined_at) ? -draft.declined_at : ''}
                onChange={(e) => set('declined_at', -num(e.target.value))}
              />{' '}
              level points
            </span>
          </li>
          <li>
            <span className="badge verdict-minimal">Minimal change</span>
            <span>anything in between</span>
          </li>
        </ul>

        {worth !== null && Number.isFinite(draft.improved_at) && (
          <p className="field-hint">
            With these settings, one question on a {size}-question test is worth about {worth} level
            points, so one more right answer{' '}
            {worth >= draft.improved_at
              ? 'is enough to count as Improved.'
              : `is not enough to count as Improved — it takes ${Math.ceil(
                  draft.improved_at / Math.max(worth, 1),
                )}.`}{' '}
            Every verdict says this too, so nobody reads one question as a trend.
          </p>
        )}
      </section>

      <section className="card card-pad">
        <div className="section-title">3 · A new targeted test</div>
        <p className="settings-sentence">
          A new targeted test starts at{' '}
          <Input
            className="input-inline"
            type="number"
            min={1}
            max={20}
            aria-label="Questions in a new targeted test"
            value={Number.isFinite(draft.default_set_size) ? draft.default_set_size : ''}
            onChange={(e) => set('default_set_size', num(e.target.value))}
          />{' '}
          questions.
        </p>
        <p className="field-hint">
          The teacher can change it for each test. Most skills hold 2 to 6 questions in the bank, so
          a bigger set may come up short — the booking form says by how many.
        </p>
      </section>

      <section className="card card-pad">
        <div className="section-title">4 · Long questions</div>
        <p className="settings-sentence">
          A question is long when its passage and question together run to at least{' '}
          <Input
            className="input-inline"
            type="number"
            min={1}
            max={1000}
            aria-label="Words in a long question"
            value={Number.isFinite(draft.long_words) ? draft.long_words : ''}
            onChange={(e) => set('long_words', num(e.target.value))}
          />{' '}
          words.
        </p>
        <p className="settings-sentence">
          A student is said to struggle on long questions only once they have answered at least{' '}
          <Input
            className="input-inline"
            type="number"
            min={1}
            max={100}
            aria-label="Long and short questions needed"
            value={Number.isFinite(draft.pattern_min_each) ? draft.pattern_min_each : ''}
            onChange={(e) => set('pattern_min_each', num(e.target.value))}
          />{' '}
          long and as many short questions on the skill, across all their tests, and they get short
          ones right at least{' '}
          <Input
            className="input-inline"
            type="number"
            min={1}
            max={100}
            aria-label="Percentage points between short and long"
            value={Number.isFinite(draft.pattern_gap) ? Math.round(draft.pattern_gap * 100) : ''}
            onChange={(e) => set('pattern_gap', num(e.target.value) / 100)}
          />{' '}
          percentage points more often than long ones.
        </p>
        {Number.isFinite(draft.pattern_gap) && draft.pattern_gap > 0 && draft.pattern_gap <= 1 && (
          <p className="field-hint">
            For example, {shortExample}% of short questions right against {longExample}% of long
            ones.
          </p>
        )}
      </section>

      <div className="settings-save">
        {problem && <Notice kind="error">{problem}</Notice>}
        {ok && !changed && <Notice kind="ok">{label} settings saved.</Notice>}
        <div className="settings-save-row">
          <button
            type="button"
            className="btn btn-primary"
            disabled={busy || !changed || problem !== null}
            onClick={() => void save()}
          >
            {busy ? 'Saving…' : `Save ${label} settings`}
          </button>
          {changed && (
            <button type="button" className="btn btn-ghost" onClick={() => show(saved)}>
              Undo changes
            </button>
          )}
          {!isDefault && (
            <button
              type="button"
              className="btn btn-ghost"
              onClick={() => {
                setOk(false)
                show(defaultConfig(subject))
              }}
            >
              Use the defaults
            </button>
          )}
        </div>
      </div>
    </div>
  )
}

/** What set_progress_config takes: every setting, and nothing else. */
function fields(c: ProgressConfig) {
  return {
    score_points: c.score_points,
    improved_at: c.improved_at,
    declined_at: c.declined_at,
    long_words: c.long_words,
    default_set_size: c.default_set_size,
    pattern_min_each: c.pattern_min_each,
    pattern_gap: c.pattern_gap,
  }
}
