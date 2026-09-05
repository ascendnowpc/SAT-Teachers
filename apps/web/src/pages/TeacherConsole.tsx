import { useState } from 'react'
import { Link } from 'react-router-dom'
import { IconBack, IconVideo } from '../components/icons'
import { DifficultyBadge, Notice } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import {
  DIAGNOSES,
  LEVELS,
  OPTION_LABELS,
  diagnosisLabel,
  levelLabel,
  subjectLabel,
  suggestNext,
} from '../lib/constants'
import { askOrder } from '../lib/report'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { Diagnosis, Session, SessionItem, SessionLevel } from '../lib/types'
import { StatusBadge } from './Sessions'

/**
 * The teacher's side of a session — a place to watch, with one control on it.
 *
 * The session needs nothing from this screen to run: the student opens it
 * themselves, the easy test loads, and every answer brings up the next
 * question. What the teacher decides is the level, and they usually decide it
 * out loud on the call — so the button here does the same thing the student's
 * own does, for the times it is quicker to press it than to say it.
 *
 * The rest is the part that makes the report: seeing each answer land with its
 * time and confidence, revealing, and saying why the student missed it.
 */
export function TeacherConsole({ sessionId }: { sessionId: string }) {
  const { session, items, loading, error, reload } = useLiveSession(sessionId, {
    withAssessments: true,
  })
  const [actionError, setActionError] = useState<string | null>(null)
  const [busy, setBusy] = useState(false)

  async function call(fn: string, args: Record<string, unknown>) {
    setActionError(null)
    setBusy(true)
    const { error: err } = await supabase.rpc(fn, args)
    if (err) setActionError(err.message)
    await reload()
    setBusy(false)
  }

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const live = items.filter((i) => i.status !== 'staged')
  const answered = items.filter((i) => i.status === 'answered' || i.status === 'revealed').length
  const unrevealed = items.filter((i) => i.status === 'answered').length
  // How far through the test they are on — not how many questions this session
  // has put in front of them, which after a level move is a bigger number and
  // a different question.
  const doneHere = items.filter(
    (i) => i.questions?.difficulty === session.level && i.status !== 'staged' && i.status !== 'voided',
  ).length

  /**
   * The whole result, in one go. The student learns how they did when their
   * teacher says so — but that is one decision about the session, not twenty
   * decisions about twenty questions, and revealing them one at a time only
   * ever meant clicking twenty times.
   */
  async function publishResults() {
    setActionError(null)
    setBusy(true)
    const reveal = await supabase.rpc('reveal_answered_items', { p_session: sessionId })
    const report = await supabase.rpc('publish_report', { p_session: sessionId })
    const err = reveal.error ?? report.error
    if (err) setActionError(err.message)
    await reload()
    setBusy(false)
  }

  return (
    <div className="page page-wide">
      <Link className="back-link" to="/sessions">
        <IconBack /> Sessions
      </Link>

      <div className="room-head">
        <div>
          <h1>{session.title || `${subjectLabel(session.subject)} session`}</h1>
          <div className="meta">
            {session.student?.full_name}{' '}
            <span className="num">({session.student?.display_id})</span> ·{' '}
            {formatUtc(session.scheduled_at)}
          </div>
        </div>
        <div className="spring" />
        <StatusBadge status={session.status} />
        <div className="actions">
          <Link className="btn btn-ghost btn-sm" to={`/sessions/${sessionId}/report`}>
            Report
          </Link>
          {session.meeting_url && (
            <a
              className="btn btn-ghost btn-sm"
              href={session.meeting_url}
              target="_blank"
              rel="noreferrer noopener"
            >
              <IconVideo /> Join call
            </a>
          )}
          {session.status === 'scheduled' && (
            <OpenEarly session={session} busy={busy} onCall={call} />
          )}
          {answered > 0 && (
            <button
              type="button"
              className="btn btn-primary btn-sm"
              disabled={busy || unrevealed === 0}
              onClick={() => void publishResults()}
            >
              {unrevealed > 0 ? `Publish results (${answered})` : 'Results published'}
            </button>
          )}
          {session.status === 'live' && (
            <button
              type="button"
              className="btn btn-navy btn-sm"
              disabled={busy}
              onClick={() =>
                void call('set_session_status', { p_session: sessionId, p_status: 'completed' })
              }
            >
              End session
            </button>
          )}
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {actionError && <Notice kind="error">{actionError}</Notice>}

      <div className="room">
        <div className="room-side">
          <Level session={session} done={doneHere} busy={busy} onCall={call} />
        </div>
        <div>
          <Board items={live} busy={busy} onCall={call} />
        </div>
      </div>
    </div>
  )
}

/* --------------------------------------------------------- open early --- */

/**
 * Letting the student in before the scheduled time.
 *
 * There was a button like this once and it was taken out the same day, because
 * it flipped the session to 'live' — which published nothing and hid the
 * student's own Start button at the same time, leaving them on a session that
 * was neither open nor openable. So this one does not touch the status. It
 * waives the clock, which is the thing that was actually in the way, and the
 * student still starts their own session exactly as they would have at ten
 * past.
 *
 * It does not rewrite the scheduled time either. Half past four is when this
 * was arranged, and it stays true on the card and in the report after the
 * teacher has let them in at ten past four.
 */
function OpenEarly({
  session,
  busy,
  onCall,
}: {
  session: Session
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  const opened = session.opened_early_at !== null
  // Past its time already: there is nothing to waive, and a button offering to
  // do it would only be asking whether the teacher can read a clock.
  const alreadyDue = new Date(session.scheduled_at).getTime() <= Date.now()
  if (alreadyDue && !opened) return null

  const first = session.student?.full_name?.split(' ')[0] ?? 'the student'

  if (opened) {
    return (
      <button
        type="button"
        className="btn btn-ghost btn-sm"
        disabled={busy}
        title={`${first} can start now. Click to put the scheduled time back.`}
        onClick={() =>
          void onCall('set_session_open_early', { p_session: session.id, p_open: false })
        }
      >
        Open now — undo
      </button>
    )
  }

  return (
    <button
      type="button"
      className="btn btn-primary btn-sm"
      disabled={busy}
      title={`Let ${first} start now instead of waiting for the scheduled time.`}
      onClick={() => void onCall('set_session_open_early', { p_session: session.id, p_open: true })}
    >
      Open early
    </button>
  )
}

/* -------------------------------------------------------------- level --- */

/**
 * The level, and the button that changes it.
 *
 * English is three tests and the session is on one of them. That is the only
 * decision left on this screen, and it is the one the teacher was making all
 * along — the console used to dress it up as picking questions out of a paper,
 * which meant reading twenty stems to make a judgement the teacher had already
 * made by watching the student work.
 *
 * The same call is on the student's own screen. Whoever is nearer the keyboard
 * presses it, which is how it goes on a call: the teacher says "try the medium
 * one" and one of them clicks.
 */
function Level({
  session,
  done,
  busy,
  onCall,
}: {
  session: Session
  /** How many of this level's questions the student has reached. */
  done: number
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  const first = session.student?.full_name?.split(' ')[0] ?? 'The student'
  const over = session.status === 'completed' || session.status === 'cancelled'
  const size = session.level_size
  const live = session.status === 'live'

  const move = (level: SessionLevel) =>
    void onCall('set_session_level', { p_session: session.id, p_level: level })

  return (
    <div className="paper-box">
      <div className="paper-box-head">
        <div>
          <div className="section-title" style={{ marginBottom: 2 }}>
            The test
          </div>
          <div className="count">{levelLabel(session.level)}</div>
        </div>
        {session.status === 'scheduled' ? (
          session.opened_early_at ? (
            <span className="badge badge-sky">Open now</span>
          ) : (
            <span className="badge badge-ok">Ready</span>
          )
        ) : (
          <span className="badge badge-sky">
            {size > 0 ? `${done} of ${size}` : `${done} asked`}
          </span>
        )}
      </div>

      {live && size > 0 && (
        <div className="paper-bar" aria-hidden="true">
          <span style={{ width: `${Math.min(100, Math.round((done / size) * 100))}%` }} />
        </div>
      )}

      <p className="paper-box-note">
        {session.status === 'scheduled'
          ? session.opened_early_at
            ? `Open now. ${first} can start whenever they are ready and begins on the ${levelLabel(session.level).toLowerCase()} test.`
            : `${first} opens this themselves at the scheduled time and begins on the ${levelLabel(session.level).toLowerCase()} test.`
          : over
            ? `Finished on the ${levelLabel(session.level).toLowerCase()} test.`
            : `${first} is working through the ${levelLabel(session.level).toLowerCase()} test one question at a time. Move them if it is the wrong level — the question they are on is left unanswered and the new test starts at its first question.`}
      </p>

      {!over && (
        <div className="level-pick" role="group" aria-label="Which test">
          {LEVELS.map((l) => (
            <button
              key={l}
              type="button"
              className={`level-opt ${l === session.level ? 'on' : ''}`}
              aria-pressed={l === session.level}
              disabled={busy || l === session.level}
              onClick={() => move(l)}
            >
              {levelLabel(l)}
            </button>
          ))}
        </div>
      )}
    </div>
  )
}

/* --------------------------------------------------------------- board --- */

function Board({
  items: unsorted,
  busy,
  onCall,
}: {
  items: SessionItem[]
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  // In the order they were put in front of the student, which after a level
  // move is not the order the questions sit in.
  const items = [...unsorted].sort((a, b) => askOrder(a) - askOrder(b))

  if (items.length === 0) {
    return (
      <div className="board">
        <div className="empty">
          <h3>Nothing answered yet</h3>
          <p>
            The student opens this session themselves at its scheduled time. Every answer lands
            here as it happens, with the time it took and how sure they were.
          </p>
        </div>
      </div>
    )
  }

  return (
    <div>
      <div className="board" style={{ marginBottom: 16 }}>
        <div className="board-scroll">
          <table className="board-table">
            <thead>
              <tr>
                <th>#</th>
                <th>Question</th>
                <th>Level</th>
                <th>Answer</th>
                <th>Eliminated</th>
                <th>Time</th>
                <th>Conf.</th>
                <th>Result</th>
              </tr>
            </thead>
            <tbody>
              {items.map((it) => {
                const a = it.session_item_assessments
                const isLiveRow = it.status === 'published' || it.status === 'answered'
                return (
                  <tr key={it.id} className={isLiveRow ? 'live-row' : undefined}>
                    <td className="num">{askOrder(it)}</td>
                    <td style={{ maxWidth: 300 }}>{it.questions?.stem}</td>
                    <td>
                      {it.questions && <DifficultyBadge level={it.questions.difficulty} />}
                    </td>
                    <td>
                      {it.selected_option ? (
                        <span
                          className={`pill-opt ${a ? (a.is_correct ? 'ok' : 'bad') : ''}`}
                        >
                          {it.selected_option}
                        </span>
                      ) : (
                        <span className="dash">—</span>
                      )}
                    </td>
                    <td>
                      {it.eliminated_options.length > 0 ? (
                        <span className="elim">
                          {it.eliminated_options.map((l) => (
                            <span key={l}>{l}</span>
                          ))}
                        </span>
                      ) : (
                        <span className="dash">—</span>
                      )}
                    </td>
                    <td className="num">
                      {a?.elapsed_seconds != null ? `${a.elapsed_seconds}s` : <span className="dash">—</span>}
                    </td>
                    <td className="num">
                      {it.student_confidence ? ['low', 'med', 'high'][it.student_confidence - 1] : <span className="dash">—</span>}
                    </td>
                    <td>
                      {it.status === 'published' && <span className="badge badge-sky">Working</span>}
                      {it.status === 'answered' && <span className="badge badge-neutral">Answered</span>}
                      {it.status === 'voided' && <span className="badge badge-neutral">Not attempted</span>}
                      {it.status === 'revealed' &&
                        (it.revealed_result === 'correct' ? (
                          <span className="badge badge-ok">Correct</span>
                        ) : (
                          <span className="badge badge-bad">Wrong</span>
                        ))}
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
      </div>

      {items
        .filter((i) => i.status === 'answered' || i.status === 'revealed')
        .slice()
        .reverse()
        .map((it) => (
          <ItemDetail key={it.id} item={it} busy={busy} onCall={onCall} />
        ))}
    </div>
  )
}

function ItemDetail({
  item,
  busy,
  onCall,
}: {
  item: SessionItem
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  const a = item.session_item_assessments
  const key = item.questions?.question_keys
  const options = [...(item.questions?.question_options ?? [])].sort(
    (x, y) => OPTION_LABELS.indexOf(x.label) - OPTION_LABELS.indexOf(y.label),
  )
  const suggestion = a ? suggestNext(a.is_correct, a.diagnosis) : null
  const chips = DIAGNOSES.filter(
    (d) => d.when === 'both' || (a?.is_correct ? d.when === 'correct' : d.when === 'incorrect'),
  )

  return (
    <div className="card card-pad" style={{ marginBottom: 14 }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 12 }}>
        <span className="pill-opt">{askOrder(item)}</span>
        <strong style={{ fontSize: 14.5, flex: 1 }}>{item.questions?.stem}</strong>
      </div>

      <div className="q-options" style={{ marginBottom: 14 }}>
        {options.map((o) => {
          const chosen = o.label === item.selected_option
          const struck = item.eliminated_options.includes(o.label)
          const isKey = key ? o.label === key.correct_option : false
          return (
            <div key={o.id} className={`q-option ${isKey ? 'correct' : ''}`}>
              <span className="lab">{o.label}</span>
              <span style={struck ? { textDecoration: 'line-through', opacity: 0.5 } : undefined}>
                {o.body}
              </span>
              <span style={{ marginLeft: 'auto', display: 'flex', gap: 8 }}>
                {chosen && <span className="badge badge-sky">Chose</span>}
                {isKey && <span className="tick">Correct</span>}
              </span>
            </div>
          )
        })}
      </div>

      {item.student_reasoning && (
        <div className="q-note">
          <div className="section-title">Why they picked it</div>
          {item.student_reasoning}
        </div>
      )}

      {a && (
        <div style={{ marginTop: 14 }}>
          <div className="section-title">Diagnosis — one tap</div>
          <div className="chips">
            {chips.map((d) => (
              <button
                key={d.value}
                type="button"
                className={`chip-btn ${a?.diagnosis === d.value ? 'on' : ''}`}
                disabled={busy}
                onClick={() =>
                  void onCall('set_diagnosis', {
                    p_item: item.id,
                    p_diagnosis: a?.diagnosis === d.value ? '' : (d.value as Diagnosis),
                    p_note: null,
                  })
                }
              >
                {d.label}
              </button>
            ))}
          </div>

          {suggestion && (
            <div className="suggestion">
              <span>→</span>
              <span>
                <b>{diagnosisLabel(a?.diagnosis ?? null)}.</b> {suggestion.text}
              </span>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
