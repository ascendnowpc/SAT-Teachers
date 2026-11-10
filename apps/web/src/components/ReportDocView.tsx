import { Fragment, type ReactNode } from 'react'
import type { PdfBand, PdfClaim, PdfDomain, ReportPdfDoc } from '../lib/reportPdf'
import { IconCheck, IconCross } from './icons'

/**
 * A report, as the PC's PDF prints it, drawn on a page (0098): the same
 * document, section for section and in the PDF's order, so what the family
 * reads in the student's account is what the PC was sent. Nothing here works
 * anything out; it lays out what lessonDocFrom and targetedDocFrom wrote.
 */
export function ReportDocView({ doc }: { doc: ReportPdfDoc }) {
  const status =
    doc.status === 'Computed'
      ? { cls: 'badge-sky', text: 'Computed from the answers' }
      : doc.status === 'Published'
        ? { cls: 'badge-ok', text: 'Published' }
        : { cls: 'badge-neutral', text: 'Generated' }

  return (
    <article className="rdoc" aria-label={doc.title}>
      <header className="rdoc-band">
        <div className="rdoc-band-top">
          <span className="rdoc-kicker">{doc.kicker ?? 'Session report'}</span>
          <span className={`badge ${status.cls}`}>{status.text}</span>
        </div>
        <h1>{doc.title}</h1>
        <p className="rdoc-sub">{doc.subtitle}</p>
        {doc.headline && <p className="rdoc-headline">{doc.headline}</p>}
      </header>

      <dl className="rdoc-people">
        {doc.people.map((p) => (
          <div key={p.label}>
            <dt>{p.label}</dt>
            <dd>{p.value}</dd>
          </div>
        ))}
      </dl>

      {doc.empty ? (
        <p className="rdoc-empty">Nothing to report yet. The report fills in as the student answers.</p>
      ) : (
        <>
          {doc.stats.length > 0 && (
            <dl className={`rdoc-stats${doc.stats.length > 4 ? ' is-six' : ''}`}>
              {doc.stats.map((s) => (
                <div key={s.label} className="stat-tile">
                  <dt className="stat-label">{s.label}</dt>
                  <dd className="stat-num">{s.value}</dd>
                  {s.note && <dd className="rdoc-stat-note">{s.note}</dd>}
                </div>
              ))}
            </dl>
          )}

          {doc.recordingNote && <p className="rdoc-notice">{doc.recordingNote}</p>}

          {doc.domains.length > 0 && (
            <Section
              title={doc.domains.some((d) => d.evidence) ? 'Each domain: the form, and what the recording shows' : 'Each domain'}
            >
              <div className="rdoc-domains">
                {doc.domains.map((d) => (
                  <DomainCard key={d.label} domain={d} />
                ))}
              </div>
            </Section>
          )}

          {doc.reflection && (
            <Section title="The teacher’s comments on the session">
              <p className="rdoc-prose">{doc.reflection}</p>
            </Section>
          )}

          {doc.conflicts.length > 0 && (
            <Section title="Worth a second look">
              <p className="rdoc-note">
                The recording sits awkwardly against what was written on the form here. One of the two needs
                correcting, and only the teacher can say which.
              </p>
              {doc.conflicts.map((c, i) => (
                <ClaimBlock key={i} claim={c} />
              ))}
            </Section>
          )}

          {doc.summary.length > 0 && (
            <Section title={doc.summaryTitle ?? 'Overall diagnostic summary'}>
              <dl className="summary">
                {doc.summary.map((row) => (
                  <Fragment key={row.label}>
                    <dt>{row.label}</dt>
                    <dd>
                      <b>{row.value}</b>
                      {row.notes.map((n, i) => (
                        <span key={i} className="said">
                          {n}
                        </span>
                      ))}
                    </dd>
                  </Fragment>
                ))}
              </dl>
              {doc.summaryNote && <p className="summary-note">{doc.summaryNote}</p>}
            </Section>
          )}

          {(doc.extra ?? [])
            .filter((x) => x.lines.length > 0)
            .map((x) => (
              <Section key={x.heading} title={x.heading}>
                <ul className="rdoc-lines">
                  {x.lines.map((line, i) => (
                    <li key={i}>{line}</li>
                  ))}
                </ul>
              </Section>
            ))}

          {doc.teacherRead && (
            <Section title="Teacher’s read">
              <p className="rdoc-prose">{doc.teacherRead}</p>
            </Section>
          )}

          {(doc.skills.length > 0 || doc.sections.length > 0) && (
            <div className="rdoc-cols">
              {doc.skills.length > 0 && <Bands title="By skill" bands={doc.skills} />}
              {doc.sections.length > 0 && <Bands title="By section" bands={doc.sections} />}
            </div>
          )}

          {doc.diagnoses && (
            <Section title="Diagnoses">
              <div className="diag-row">
                {doc.diagnoses.split(' · ').map((d) => {
                  const [count, ...label] = d.split(' ')
                  return (
                    <span key={d} className="diag-chip">
                      <b>{count}</b> {label.join(' ')}
                    </span>
                  )
                })}
              </div>
            </Section>
          )}

          {doc.pace.length > 0 && (
            <Section title="Pace">
              <ul className="rdoc-lines">
                {doc.pace.map((p, i) => (
                  <li key={i}>{p}</li>
                ))}
              </ul>
            </Section>
          )}

          {doc.misses.length > 0 && (
            <Section title="Every miss, and why">
              <div className="miss-list">
                {doc.misses.map((m) => (
                  <div key={m.head} className="miss">
                    <div className="miss-head">
                      <span className="rdoc-miss-head">{m.head}</span>
                    </div>
                    <p className={`miss-why${m.why.startsWith('No diagnosis') ? ' unset' : ''}`}>{m.why}</p>
                    {m.teacher && (
                      <p className="miss-quote teacher">
                        <span className="who">Teacher</span> {m.teacher}
                      </p>
                    )}
                    {m.student && (
                      <p className="miss-quote">
                        <span className="who">Student</span> {m.student}
                      </p>
                    )}
                  </div>
                ))}
              </div>
            </Section>
          )}

          {doc.findings && (
            <Section title="What was said about each question">
              <p className="rdoc-note">{doc.findings.intro}</p>
              {doc.findings.questions.map((q) => (
                <div key={q.head} className="rdoc-finding">
                  <div className="rdoc-finding-head">{q.head}</div>
                  {q.teacherNote && (
                    <p className="miss-quote teacher">
                      <span className="who">Teacher</span> {q.teacherNote}
                    </p>
                  )}
                  {q.claims.map((c, i) => (
                    <ClaimBlock key={i} claim={c} />
                  ))}
                </div>
              ))}
              {doc.findings.unsaid && <p className="rdoc-note">{doc.findings.unsaid}</p>}
            </Section>
          )}

          {doc.questions.length > 0 && (
            <Section title="Question by question">
              <p className="rdoc-note">{doc.levelNote}</p>
              <div className="table-wrap">
                <table className="board-table rdoc-table">
                  <thead>
                    <tr>
                      <th className="num">#</th>
                      <th>Skill</th>
                      {doc.showLevel && <th>Level</th>}
                      <th>Answer</th>
                      <th className="num">Time</th>
                      <th>Pace</th>
                      <th>{doc.kicker === 'TARGETED TEST' ? 'Outcome' : 'Diagnosis'}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {doc.questions.map((q) => (
                      <tr key={q.sequence}>
                        <td className="num">{q.sequence}</td>
                        <td>{q.skill}</td>
                        {doc.showLevel && <td>{q.level}</td>}
                        <td>
                          <span className={`ans ${q.correct ? 'ok' : 'bad'}`}>
                            {q.correct ? <IconCheck size={13} /> : <IconCross size={13} />} {q.answer}
                          </span>
                        </td>
                        <td className="num">{q.time}</td>
                        <td className="muted-cell">{q.pace}</td>
                        <td className="muted-cell">{q.diagnosis}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </Section>
          )}
        </>
      )}

      <footer className="rdoc-foot">{doc.footer}</footer>
    </article>
  )
}

function Section({ title, children }: { title: string; children: ReactNode }) {
  return (
    <section className="rdoc-section">
      <h2>{title}</h2>
      {children}
    </section>
  )
}

function DomainCard({ domain: d }: { domain: PdfDomain }) {
  return (
    <div className="rdoc-domain">
      <div className="rdoc-domain-head">
        <h3>{d.label}</h3>
        <span className="rdoc-domain-measured">{d.measured}</span>
      </div>
      {d.skillFocus && <div className="rdoc-domain-focus">{d.skillFocus}</div>}
      {d.marked && <p className="rdoc-domain-marked">{d.marked}</p>}
      <div className="rdoc-domain-cols">
        <div>
          <div className="rdoc-label">Strengths</div>
          <p>{d.strengths || '—'}</p>
        </div>
        <div>
          <div className="rdoc-label">Gaps</div>
          <p>{d.gaps || '—'}</p>
        </div>
      </div>
      {d.targets.length > 0 && (
        <div className="rdoc-domain-targets">
          <div className="rdoc-label">
            Targets{d.targetsNote && <span className="rdoc-label-note"> · {d.targetsNote}</span>}
          </div>
          <ul>
            {d.targets.map((t) => (
              <li key={t}>{t}</li>
            ))}
          </ul>
        </div>
      )}
      {d.evidence && d.evidence.length > 0 && (
        <div className="rdoc-domain-evidence">
          <div className="rdoc-label">What the recording shows</div>
          {d.evidence.map((c, i) => (
            <ClaimBlock key={i} claim={c} />
          ))}
        </div>
      )}
    </div>
  )
}

function ClaimBlock({ claim: c }: { claim: PdfClaim }) {
  return (
    <div className="rdoc-claim">
      <div className="rdoc-claim-text">
        <span className="badge badge-neutral">{c.label}</span> {c.text}
      </div>
      {c.quote && <blockquote>“{c.quote}”</blockquote>}
      {c.cite && <div className="rdoc-claim-cite">{c.cite}</div>}
    </div>
  )
}

function Bands({ title, bands }: { title: string; bands: PdfBand[] }) {
  return (
    <section className="rdoc-section">
      <h2>{title}</h2>
      <div className="bands">
        {bands.map((b) => {
          const pct = Math.round(b.share * 100)
          return (
            <div key={b.label} className="band">
              <div className="band-top">
                <span className="name">{b.label}</span>
                <span className="score">{b.score}</span>
              </div>
              <div className="bar" role="img" aria-label={`${pct}% correct`}>
                <span
                  className={pct >= 80 ? 'fill ok' : pct >= 50 ? 'fill mid' : 'fill low'}
                  style={{ width: `${Math.max(pct, 3)}%` }}
                />
              </div>
            </div>
          )
        })}
      </div>
    </section>
  )
}
