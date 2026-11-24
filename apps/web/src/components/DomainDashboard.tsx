import { useEffect, useState } from 'react'
import type { StudentProgress } from '../lib/progress'
import { VERDICT_LABELS } from '../lib/progress'
import { loadProgress } from '../lib/progressApi'
import { SUBJECT_ORDER, SUBJECT_VIEW, type SubjectMeasure } from '../lib/subjectProgress'
import type { Subject } from '../lib/types'
import { RagChip, signed } from './SubjectProgress'

/** Both subjects' progress for one student — staff for any, the PC for their own (0063). */
export function useBothSubjects(studentId: string | undefined): {
  progress: Partial<Record<Subject, StudentProgress>>
  loading: boolean
  error: string | null
} {
  const [progress, setProgress] = useState<Partial<Record<Subject, StudentProgress>>>({})
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  useEffect(() => {
    if (!studentId) return
    let active = true
    setLoading(true)
    void Promise.all(SUBJECT_ORDER.map((s) => loadProgress(studentId, s))).then((rs) => {
      if (!active) return
      const out: Partial<Record<Subject, StudentProgress>> = {}
      rs.forEach((r, i) => {
        if (r.progress) out[SUBJECT_ORDER[i]] = r.progress
      })
      setProgress(out)
      setError(rs.find((r) => r.error)?.error ?? null)
      setLoading(false)
    })
    return () => {
      active = false
    }
  }, [studentId])
  return { progress, loading, error }
}

/**
 * The domain dashboard (the section-tracker scope's F7): one screen, the
 * eight domains of both subjects — the baseline, the latest level, the change
 * since the baseline with its computed verdict, and the sessions spent.
 */
export function DomainDashboard({ measures }: { measures: Partial<Record<Subject, SubjectMeasure>> }) {
  return (
    <div className="domain-dash">
      {SUBJECT_ORDER.map((subject) => {
        const m = measures[subject]
        const view = SUBJECT_VIEW[subject]
        return (
          <section key={subject} className={`domain-dash-card tone-${view.tone}`} aria-label={`${view.name} domains`}>
            <header className="domain-dash-head">
              <span className="subject-mark" aria-hidden="true" />
              <h3>{view.name}</h3>
              <span className="dash-muted">
                {m ? `${m.tests} test${m.tests === 1 ? '' : 's'} · ${m.lessons} lesson${m.lessons === 1 ? '' : 's'}` : 'Nothing yet'}
              </span>
            </header>
            <div className="domain-dash-scroll">
              <table className="domain-dash-table">
                <thead>
                  <tr>
                    <th>Domain</th>
                    <th className="num">Baseline</th>
                    <th className="num">Latest</th>
                    <th>Change</th>
                    <th className="num">Sessions</th>
                    <th>Now</th>
                  </tr>
                </thead>
                <tbody>
                  {(m?.sections ?? []).map((s) => (
                    <tr key={s.section}>
                      <td className="domain-dash-name">{s.label}</td>
                      <td className="num">{s.first ? <Level a={s.first} /> : '—'}</td>
                      <td className="num">{s.latest && s.attempts.length > 1 ? <Level a={s.latest} /> : '—'}</td>
                      <td>
                        {s.levelChange === null ? (
                          <span className="dash-muted">{s.first ? 'Baseline only' : '—'}</span>
                        ) : (
                          <span className={`domain-dash-change is-${s.verdict ?? 'minimal'}`}>
                            <b className="num">{signed(s.levelChange)}</b> {s.verdict ? VERDICT_LABELS[s.verdict] : ''}
                          </span>
                        )}
                      </td>
                      <td className="num">{s.first ? s.sessions : '—'}</td>
                      <td>
                        <RagChip rag={s.rag} small />
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </section>
        )
      })}
      <p className="domain-dash-key">
        Level score out of 10 right mapped to 20 / 30 / 40 — the school’s scale, not a predicted SAT score. Sessions:
        every lesson and check-in since the baseline.
      </p>
    </div>
  )
}

function Level({ a }: { a: { level: number; right: number; of: number } }) {
  return (
    <>
      <b>{Math.round(a.level)}</b> <small>{a.right}/{a.of}</small>
    </>
  )
}
