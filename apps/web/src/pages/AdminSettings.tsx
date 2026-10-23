import { useEffect, useState, type ChangeEvent } from 'react'
import { Field, Input, Notice } from '../components/ui'
import { SUBJECTS } from '../lib/constants'
import { formatPoints, mapScore, parsePoints, type ProgressConfig } from '../lib/progress'
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
 */
export function AdminSettings() {
  return (
    <div className="page">
      <div className="page-head">
        <h1>Settings</h1>
      </div>
      <p className="muted">
        How targeted tests are scored and read. A change applies to every test, past ones included —
        nothing is stored that depends on it.
      </p>
      {SUBJECTS.map((s) => (
        <SubjectSettings key={s.value} subject={s.value} label={s.label} />
      ))}
    </div>
  )
}

function SubjectSettings({ subject, label }: { subject: Subject; label: string }) {
  const [cfg, setCfg] = useState<ProgressConfig | null>(null)
  const [points, setPoints] = useState('')
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)
  const [ok, setOk] = useState(false)

  useEffect(() => {
    void loadConfig(subject).then((c) => {
      setCfg(c)
      setPoints(formatPoints(c.score_points))
    })
  }, [subject])

  if (!cfg) return null

  const parsed = parsePoints(points)

  async function save() {
    if (!cfg || !parsed) return
    setBusy(true)
    setErr(null)
    setOk(false)
    const { error } = await supabase.rpc('set_progress_config', {
      p_subject: subject,
      p_config: {
        score_points: parsed,
        improved_at: cfg.improved_at,
        declined_at: cfg.declined_at,
        long_words: cfg.long_words,
        default_set_size: cfg.default_set_size,
        pattern_min_each: cfg.pattern_min_each,
        pattern_gap: cfg.pattern_gap,
      },
    })
    if (error) setErr(error.message)
    else setOk(true)
    setBusy(false)
  }

  const num = (k: keyof ProgressConfig) => (e: ChangeEvent<HTMLInputElement>) =>
    setCfg({ ...cfg, [k]: Number(e.target.value) })

  return (
    <div className="card card-pad">
      <div className="section-title">{label}</div>
      {err && <Notice kind="error">{err}</Notice>}
      {ok && <Notice kind="ok">Saved.</Notice>}

      <Field
        label="Score mapping"
        hint="Raw score out of 10 → level score, one point per pair, raw rising from 0: “0 20, 5 30, 8 40”. Between points it is a straight line; above the last, the last slope carries on."
      >
        <Input value={points} onChange={(e) => setPoints(e.target.value)} />
      </Field>
      {parsed ? (
        <p className="muted">
          {[0, 2, 4, 5, 6, 8, 9, 10]
            .map((r) => `${r} → ${Math.round(mapScore(r, parsed))}`)
            .join(' · ')}
        </p>
      ) : (
        <p className="field-hint">
          Write it as pairs of numbers, the raw scores rising from 0 to 10.
        </p>
      )}

      <div className="grid-2">
        <Field label="Improved from (level points)">
          <Input type="number" min={1} value={cfg.improved_at} onChange={num('improved_at')} />
        </Field>
        <Field label="Declined from (level points)">
          <Input type="number" max={-1} value={cfg.declined_at} onChange={num('declined_at')} />
        </Field>
      </div>
      <div className="grid-2">
        <Field label="Long question (words in passage + stem)">
          <Input type="number" min={1} value={cfg.long_words} onChange={num('long_words')} />
        </Field>
        <Field label="Default set size">
          <Input
            type="number"
            min={1}
            max={20}
            value={cfg.default_set_size}
            onChange={num('default_set_size')}
          />
        </Field>
      </div>
      <div className="grid-2">
        <Field label="Long-question flag: at least this many of each">
          <Input
            type="number"
            min={1}
            value={cfg.pattern_min_each}
            onChange={num('pattern_min_each')}
          />
        </Field>
        <Field label="…and short accuracy this far above long (0–1)">
          <Input
            type="number"
            min={0.05}
            max={1}
            step={0.05}
            value={cfg.pattern_gap}
            onChange={num('pattern_gap')}
          />
        </Field>
      </div>

      <button
        type="button"
        className="btn btn-primary btn-sm"
        disabled={busy || !parsed}
        onClick={() => void save()}
      >
        {busy ? 'Saving…' : `Save ${label}`}
      </button>
    </div>
  )
}
