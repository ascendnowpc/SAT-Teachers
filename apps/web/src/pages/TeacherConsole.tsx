import { useState } from 'react'
import { Link } from 'react-router-dom'
import { IconBack, IconVideo } from '../components/icons'
import { DifficultyBadge, Notice } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import {
  DIAGNOSES,
  OPTION_LABELS,
  diagnosisLabel,
  subjectLabel,
  suggestNext,
} from '../lib/constants'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { Diagnosis, Session, SessionItem } from '../lib/types'
import { StatusBadge } from './Sessions'

/**
 * The teacher's side of a session — which is now mostly a place to watch.
 *
 * The paper is chosen beforehand in the builder, and the student opens the
 * session themselves at the scheduled time. What is left here is the part
 * that needs a teacher: seeing each answer land with its time and confidence,
 * revealing, and saying why the student missed it. That last one is what the
 * report is built out of.
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

  const staged = items.filter((i) => i.status === 'staged')
  const live = items.filter((i) => i.status !== 'staged')

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
            <Link className="btn btn-primary btn-sm" to={`/sessions/${sessionId}/paper`}>
              {staged.length === 0 ? 'Pick the questions' : 'Edit the paper'}
            </Link>
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
        <Paper sessionId={sessionId} session={session} staged={staged} done={live.length} />
        <Board items={live} busy={busy} onCall={call} />
      </div>
    </div>
  )
}

/* -------------------------------------------------------------- paper --- */

/**
 * The paper this session carries, as one box.
 *
 * Not a card per question: twenty-six of those is a wall to scroll past, and
 * there is nothing to do to any of them from here. What a teacher wants to
 * know before the day is that the paper is saved and how long it is, and
 * during the session, how far through the student has got.
 */
function Paper({
  sessionId,
  session,
  staged,
  done,
}: {
  sessionId: string
  session: Session
  staged: SessionItem[]
  done: number
}) {
  const total = staged.length + done
  const first = session.student?.full_name?.split(' ')[0] ?? 'The student'

  if (total === 0) {
    return (
      <div className="paper-box empty-paper">
        <div className="section-title">No paper yet</div>
        <p>
          This session has no questions in it, so {first} cannot start it. Pick them and put them
          in order — it takes one pass through a diagnostic.
        </p>
        <Link className="btn btn-primary" to={`/sessions/${sessionId}/paper`}>
          Pick the questions
        </Link>
      </div>
    )
  }

  return (
    <div className="paper-box">
      <div className="paper-box-head">
        <div>
          <div className="section-title" style={{ marginBottom: 2 }}>
            The paper
          </div>
          <div className="count">
            {total} question{total === 1 ? '' : 's'}
          </div>
        </div>
        {session.status === 'scheduled' ? (
          <span className="badge badge-ok">Saved</span>
        ) : (
          <span className="badge badge-sky">
            {done} of {total} done
          </span>
        )}
      </div>

      {session.status !== 'scheduled' && (
        <div className="paper-bar" aria-hidden="true">
          <span style={{ width: `${Math.round((done / total) * 100)}%` }} />
        </div>
      )}

      <p className="paper-box-note">
        {session.status === 'scheduled'
          ? `Ready. ${first} opens this themselves at the scheduled time and works through it one question at a time.`
          : staged.length === 0
            ? 'Every question has been answered.'
            : `${first} is working through it. The next question is published the moment the current one is answered.`}
      </p>

      <div className="paper-box-actions">
        {session.status === 'scheduled' && (
          <Link className="btn btn-ghost btn-sm" to={`/sessions/${sessionId}/paper`}>
            Edit the paper
          </Link>
        )}
      </div>
    </div>
  )
}

/* --------------------------------------------------------------- board --- */

function Board({
  items,
  busy,
  onCall,
}: {
  items: SessionItem[]
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
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
                    <td className="num">{it.sequence_no}</td>
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
        <span className="pill-opt">{item.sequence_no}</span>
        <strong style={{ fontSize: 14.5, flex: 1 }}>{item.questions?.stem}</strong>
        {item.status === 'answered' && (
          <button
            type="button"
            className="btn btn-primary btn-sm"
            disabled={busy}
            onClick={() => void onCall('reveal_item', { p_item: item.id })}
          >
            Reveal to student
          </button>
        )}
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

      {item.status === 'revealed' && (
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
