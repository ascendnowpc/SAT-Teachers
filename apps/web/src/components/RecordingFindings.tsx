import { FEEDBACK_LABELS, RELATION_LABELS, type Claim, type DomainEvidence } from '../lib/extraction'
import type { QuestionSection, ReportDoc } from '../lib/reportDoc'

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
          {claim.evidence.relabelled && ' · attributed by what was said, not by the transcript label'}
        </cite>
      </blockquote>
    </div>
  )
}

/** One question: the answer row, then what was said about it. */
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

      {!r?.covered ? (
        <p className="muted step-text">Not discussed in the recording.</p>
      ) : (
        <>
          {r.studentReasoning && <ClaimLine claim={r.studentReasoning} label="How they got there" />}
          {r.misunderstanding && <ClaimLine claim={r.misunderstanding} label="What went wrong" />}
          {r.vocabularyGap && <ClaimLine claim={r.vocabularyGap} label="Word they did not know" />}

          {r.teacherFeedback.map((f, k) => (
            <ClaimLine key={k} claim={f} label={FEEDBACK_LABELS[f.kind]} />
          ))}

          {r.teacherFeedback.length === 0 &&
            !r.studentReasoning &&
            !r.misunderstanding &&
            !r.vocabularyGap && (
              <p className="muted step-text">
                Talked about, but nothing in it could be quoted as a finding.
              </p>
            )}
        </>
      )}
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

/** The teacher's own closing words in the lesson, quoted. */
export function SessionFindings({ doc }: { doc: ReportDoc }) {
  const { closingVerdict, teacherStatedScore, studentSelfReport } = doc

  if (!closingVerdict && !teacherStatedScore && !studentSelfReport) return null

  return (
    <div className="card card-pad">
      <div className="section-title">What was said at the end of the lesson</div>
      {closingVerdict && <ClaimLine claim={closingVerdict} label="Your summing-up" />}
      {studentSelfReport && <ClaimLine claim={studentSelfReport} label="What the student said" />}
      {teacherStatedScore && (
        <>
          <ClaimLine claim={teacherStatedScore} label="Score said out loud" />
          <p className="muted step-text">
            Recorded because the student heard it. The report’s own figures are counted from the
            answer rows above, not from this.
          </p>
        </>
      )}
    </div>
  )
}
