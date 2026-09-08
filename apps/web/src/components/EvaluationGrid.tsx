import type { GridRow, Performance } from '../lib/grid'

/**
 * The teacher evaluation grid, in the six columns the paper form uses.
 *
 * Student Performance is counted from the answers and marked by the teacher,
 * and both are shown: the count is what happened and the mark is what they made
 * of it, and they are allowed to differ. Strengths, Gaps and Next steps are the
 * teacher's own — reproduced as they typed them, never replaced by the form's
 * printed wording. A blank written column is left blank rather than filled with
 * a hedge: an empty cell says "not observed", which is a real thing to say.
 */
export function EvaluationGrid({ rows }: { rows: GridRow[] }) {
  return (
    <div className="table-wrap">
      <table className="grid-table">
        <thead>
          <tr>
            <th>Domain</th>
            <th>Skill Focus</th>
            <th className="c">Student Performance</th>
            <th>Strengths observed</th>
            <th>Gaps observed</th>
            <th>Next steps / Targets</th>
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
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}

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
