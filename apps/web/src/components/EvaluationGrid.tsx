import type { DomainEvidence } from '../lib/extraction'
import type { GridRow, Performance } from '../lib/grid'
import { ClaimLine } from './RecordingFindings'

/**
 * The teacher evaluation grid — the whole per-domain report, in one table.
 *
 * The paper form has six columns and the report used to print them twice: once
 * as this grid and again, underneath, as four prose blocks headed "what the
 * teacher wrote". Same words, same order, two places — which reads to a parent
 * as two people agreeing rather than one person writing once. So there is one
 * table now, and the recording gets the seventh column rather than a section of
 * its own.
 *
 * Student Performance is counted from the answers and marked by the teacher,
 * and both are shown: the count is what happened and the mark is what they made
 * of it, and they are allowed to differ. Strengths, Gaps and Next steps are the
 * teacher's own — reproduced as they typed them, never replaced by the form's
 * printed wording. A blank written column is left blank rather than filled with
 * a hedge: an empty cell says "not observed", which is a real thing to say.
 *
 * The last column is the one thing on the page the teacher did not write, and
 * it is kept apart from theirs for exactly that reason: every line in it
 * carries the words it came from, and a reader can always tell which of the two
 * they are reading.
 */
export function EvaluationGrid({
  rows,
  evidence,
}: {
  rows: GridRow[]
  /** What the recording shows per domain. Omitted when it has not been read. */
  evidence?: Map<string, DomainEvidence[]>
}) {
  return (
    <div className="table-wrap">
      <table className={evidence ? 'grid-table with-recording' : 'grid-table'}>
        <thead>
          <tr>
            <th>Domain</th>
            <th>Skill Focus</th>
            <th className="c">Student Performance</th>
            <th>Strengths observed</th>
            <th>Gaps observed</th>
            <th>Next steps / Targets</th>
            {evidence && <th>What the recording shows</th>}
          </tr>
        </thead>
        <tbody>
          {rows.map((r) => (
            <tr key={r.domain}>
              <th scope="row" className="dom">
                {r.label}
              </th>
              <td>
                <ul className="tight">
                  {r.skillFocus.map((s) => (
                    <li key={s}>{s}</li>
                  ))}
                </ul>
              </td>
              <td className="c">
                <PerformanceMark performance={r.performance} correct={r.correct} total={r.total} />
                {r.teacherPerformance && (
                  <div className="perf-teacher">
                    You marked {r.teacherPerformance === 'tick' ? '✓' : '✗'}
                  </div>
                )}
                {r.performanceNote && <div className="perf-note">{r.performanceNote}</div>}
                {r.skills.length > 0 && (
                  <ul className="skill-detail">
                    {r.skills.map((s) => (
                      <li key={s.key} className={s.correct === s.total ? 'ok' : s.correct === 0 ? 'bad' : ''}>
                        {s.label} {s.correct}/{s.total}
                      </li>
                    ))}
                  </ul>
                )}
              </td>
              <td>{r.strengths || <span className="unobserved">—</span>}</td>
              <td>{r.gaps || <span className="unobserved">—</span>}</td>
              <td>
                <ul className={r.targetsAreTheTeacher ? 'tight targets written' : 'tight targets'}>
                  {r.targets.map((t) => (
                    <li key={t}>{t}</li>
                  ))}
                </ul>
                {!r.targetsAreTheTeacher && (
                  <span className="unobserved">the form’s own wording — not edited</span>
                )}
              </td>
              {evidence && (
                <td className="said">
                  {(evidence.get(r.domain) ?? []).length === 0 ? (
                    <span className="unobserved">Nothing in the recording speaks to this domain.</span>
                  ) : (
                    (evidence.get(r.domain) ?? []).map((e, k) => (
                      <ClaimLine key={k} claim={e} label={RELATION[e.relation]} />
                    ))
                  )}
                </td>
              )}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

/**
 * The relation labels, shortened for a cell.
 *
 * The long forms in extraction.ts are written for a paragraph; in a column this
 * narrow they wrap to three lines and push the quote off the page. The meaning
 * is the same one and the badge is next to the quote either way.
 */
const RELATION = {
  supports: 'Backs the form',
  complicates: 'Sits awkwardly',
  adds: 'Not on the form',
} as const

function PerformanceMark({
  performance,
  correct,
  total,
}: {
  performance: Performance
  correct: number
  total: number
}) {
  if (performance === 'untested') {
    return <span className="perf none" title="Not covered in this session">—</span>
  }
  return (
    <span className={`perf ${performance}`}>
      <span className="sym" aria-hidden="true">
        {performance === 'tick' ? '✓' : performance === 'cross' ? '✗' : '✓/✗'}
      </span>
      <span className="frac">
        {correct}/{total}
      </span>
    </span>
  )
}
