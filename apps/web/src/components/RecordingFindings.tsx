import { FEEDBACK_LABELS, RELATION_LABELS, type Claim, type DomainEvidence } from '../lib/extraction'
import type { QuestionSection } from '../lib/reportDoc'

/**
 * What the recording says, on the report.
 *
 * One rule runs through every component here: a sentence about the student is
 * never shown without the words it came from. The quote is not a tooltip and
 * not a detail view — it sits under the claim, always, because a parent reading
 * "she talked herself out of the right answer" is owed the moment where that
 * happened, and a teacher checking the report before it goes out cannot check
 * anything they have to click to see.
 *
 * The other rule is that the teacher's own writing and the recording's findings
 * never share a paragraph. They are two columns on the page for the same reason
 * they are two fields in the database: one is a judgement a person signed and
 * the other is an observation with a citation, and blurring them would let a
 * single opinion read as corroborated.
 */

function clock(seconds: number): string {
  return `${Math.floor(seconds / 60)}:${String(seconds % 60).padStart(2, '0')}`
}

/**
 * A claim and its evidence.
 *
 * `relabelled` earns a marker because it is the one thing here a reader could
 * not otherwise check: it means the words are attributed to someone other than
 * the name Fathom put on that turn. Usually that is the reading being right and
 * the export being wrong — but it is the place a wrong reading would hide, so
 * it is said out loud.
 */
export function ClaimLine({ claim, label }: { claim: Claim; label?: string }) {
  return (
    <div className="claim">
      <div className="claim-text">
        {label && <span className="badge badge-neutral">{label}</span>} {claim.text}
      </div>
      <blockquote className="claim-quote">
        “{claim.evidence.quote}”
        <cite>
          {' '}
          — {claim.evidence.speaker} at {clock(claim.evidence.at)}
          {claim.evidence.fromMargin && ' · said either side of this question'}
          {claim.evidence.fromReview && ' · from the end-of-lesson review'}
          {claim.evidence.relabelled && ' · attributed by what was said, not by the transcript label'}
        </cite>
      </blockquote>
    </div>
  )
}

/**
 * Whether there is anything to show for this question.
 *
 * The recording's findings, and also the note the teacher typed against the
 * question during the lesson — that is something said about it too, and
 * filtering on the recording alone dropped it off the page entirely on a
 * question the recording happened to miss.
 */
export function hasFindings(question: QuestionSection): boolean {
  const r = question.reading
  return Boolean(
    question.teacherNote ||
      r?.studentReasoning ||
      r?.misunderstanding ||
      r?.vocabularyGap ||
      (r?.teacherFeedback.length ?? 0) > 0,
  )
}

/**
 * One question: the answer row, then what was said about it.
 *
 * A question with nothing quotable behind it is not printed as a heading and an
 * apology. The section says how many questions the recording reached and lists
 * those; the rest are named in one line at the end, which is the same
 * information in a form a parent can read.
 */
export function QuestionFindings({ question }: { question: QuestionSection }) {
  const r = question.reading

  return (
    <div className="question-findings">
      <div className="question-head">
        <b>Q{question.sequence}</b>
        <span className={question.correct ? 'badge badge-ok' : 'badge badge-bad'}>
          {question.correct ? 'Correct' : 'Missed'}
        </span>
        {question.chose && (
          <span className="muted">
            chose {question.chose}
            {!question.correct && question.answer && ` · key ${question.answer}`}
          </span>
        )}
        {question.rushed && <span className="badge">Rushed</span>}
        {question.laboured && <span className="badge">Laboured</span>}
      </div>

      {question.teacherNote && (
        <p className="step-text">
          <span className="badge badge-neutral">Your note in the lesson</span> {question.teacherNote}
        </p>
      )}

      {r?.studentReasoning && <ClaimLine claim={r.studentReasoning} label="How they got there" />}
      {r?.misunderstanding && <ClaimLine claim={r.misunderstanding} label="What went wrong" />}
      {r?.vocabularyGap && <ClaimLine claim={r.vocabularyGap} label="Word they did not know" />}

      {(r?.teacherFeedback ?? []).map((f, k) => (
        <ClaimLine key={k} claim={f} label={FEEDBACK_LABELS[f.kind]} />
      ))}
    </div>
  )
}

/**
 * The recording's evidence for one domain, against the teacher's own row.
 *
 * `complicates` is the row worth reading and it is deliberately not softened:
 * where the recording sits awkwardly against what the teacher wrote, one of the
 * two is wrong, and only the teacher can say which. Hiding that would make the
 * report smoother and less true.
 */
export function DomainFindings({ evidence }: { evidence: DomainEvidence[] }) {
  if (evidence.length === 0) {
    return <p className="muted step-text">Nothing in the recording speaks to this domain.</p>
  }

  return (
    <>
      {evidence.map((e, k) => (
        <ClaimLine key={k} claim={e} label={RELATION_LABELS[e.relation]} />
      ))}
    </>
  )
}
