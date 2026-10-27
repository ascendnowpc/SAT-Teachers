import { useState } from 'react'
import { callFunction } from '../lib/functions'
import type { TargetedSummary } from '../lib/targetedSummary'
import { formatUtc } from '../lib/time'
import type { Subject } from '../lib/types'
import { Notice } from './ui'

interface Answer {
  summary: TargetedSummary
  model: string
  tests: number
  generated_at: string
}

/**
 * A short reading of every targeted test the student has sat in the subject,
 * by Gemini, on a button (summarise_targeted_tests). Staff only, as the
 * function is: a model's reading is for the teacher to check before it goes
 * anywhere. Nothing is stored — pressing it again reads the tests again.
 */
export function TestsSummary({
  studentId,
  subject,
  studentName,
}: {
  studentId: string
  subject: Subject
  studentName: string
}) {
  const [answer, setAnswer] = useState<Answer | null>(null)
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)

  async function generate() {
    setBusy(true)
    setError(null)
    try {
      setAnswer(
        await callFunction<Answer>('summarise_targeted_tests', {
          student_id: studentId,
          subject,
        }),
      )
    } catch (e) {
      setError(e instanceof Error ? e.message : String(e))
    }
    setBusy(false)
  }

  const s = answer?.summary
  return (
    <div className="card card-pad ai-summary no-print">
      <div className="ai-summary-head">
        <div className="section-title">Summary of all targeted tests</div>
        <span className="badge badge-sky">Gemini</span>
        <span className="spring" />
        <button
          type="button"
          className={`btn btn-sm ${s ? 'btn-ghost' : 'btn-primary'}`}
          disabled={busy}
          onClick={() => void generate()}
        >
          {busy ? 'Reading the tests…' : s ? 'Generate again' : 'Generate summary'}
        </button>
      </div>

      {error && <Notice kind="error">{error}</Notice>}

      {!s && !error && (
        <p className="muted">
          A few lines on every targeted test {studentName.split(' ')[0] || 'the student'} has sat,
          written from the scores on these pages — what moved, what did not, and what to work on
          next. Read it before you share it.
        </p>
      )}

      {s && (
        <>
          {s.headline && <p className="ai-headline">{s.headline}</p>}
          {s.points.length > 0 && (
            <ul className="ai-points">
              {s.points.map((p) => (
                <li key={p.text}>
                  {p.skill && <strong>{p.skill}: </strong>}
                  {p.text}
                </li>
              ))}
            </ul>
          )}
          {s.next_step && (
            <p className="ai-next">
              <strong>Next:</strong> {s.next_step}
            </p>
          )}
          <p className="muted">
            From {answer.tests} targeted test{answer.tests === 1 ? '' : 's'}, by {answer.model},{' '}
            {formatUtc(answer.generated_at)}. Generated from the numbers, not checked by anyone —
            not saved.
          </p>
        </>
      )}
    </div>
  )
}
