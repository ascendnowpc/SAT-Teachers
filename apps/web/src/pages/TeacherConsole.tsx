import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { IconBack, IconVideo } from '../components/icons'
import { DifficultyBadge, Notice, Select } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import {
  DIAGNOSES,
  DIFFICULTIES,
  OPTION_LABELS,
  diagnosisLabel,
  sectionLabel,
  skillLabel,
  subjectLabel,
  suggestNext,
} from '../lib/constants'
import { askOrder } from '../lib/report'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type { Diagnosis, Difficulty, Session, SessionItem } from '../lib/types'
import { StatusBadge } from './Sessions'

/**
 * The teacher's side of a session — a place to watch, and when the teacher
 * wants it, a place to drive.
 *
 * A session paced by the paper needs nothing from this screen while it runs:
 * the student opens it themselves and each answer brings up the next question.
 * A session the teacher paces needs one thing from it, and needs it every
 * couple of minutes — the next question. That is the Ask panel: the paper this
 * student was given, cut by difficulty, one click to put a question in front
 * of them.
 *
 * The rest is unchanged and is the part that makes the report: seeing each
 * answer land with its time and confidence, revealing, and saying why the
 * student missed it.
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
  const open = items.find((i) => i.status === 'published') ?? null
  const answered = items.filter((i) => i.status === 'answered' || i.status === 'revealed').length
  const unrevealed = items.filter((i) => i.status === 'answered').length
  const teacherLed = session.pacing === 'teacher'

  /**
   * The whole result, in one go. The student learns how they did when their
   * teacher says so — but that is one decision about the paper, not
   * twenty-six decisions about twenty-six questions, and revealing them one at
   * a time only ever meant clicking twenty-six times.
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
            <>
              <Link className="btn btn-ghost btn-sm" to={`/sessions/${sessionId}/paper`}>
                {staged.length === 0 ? 'Pick the questions' : 'Edit the paper'}
              </Link>
              <OpenEarly session={session} paperLength={staged.length} busy={busy} onCall={call} />
            </>
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
          <Paper sessionId={sessionId} session={session} staged={staged} done={live.length} />
          <Pacing session={session} busy={busy} onCall={call} />
        </div>
        <div>
          {teacherLed && session.status === 'live' && (
            <Ask session={session} staged={staged} open={open} busy={busy} onCall={call} />
          )}
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
  paperLength,
  busy,
  onCall,
}: {
  session: Session
  paperLength: number
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
      disabled={busy || paperLength === 0}
      title={
        paperLength === 0
          ? 'There are no questions in this session yet.'
          : `Let ${first} start now instead of waiting for the scheduled time.`
      }
      onClick={() => void onCall('set_session_open_early', { p_session: session.id, p_open: true })}
    >
      Open early
    </button>
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
  const teacherLed = session.pacing === 'teacher'

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
          session.opened_early_at ? (
            <span className="badge badge-sky">Open now</span>
          ) : (
            <span className="badge badge-ok">Saved</span>
          )
        ) : (
          <span className="badge badge-sky">
            {done} of {total} {teacherLed ? 'asked' : 'done'}
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
          ? session.opened_early_at
            ? teacherLed
              ? `Open now. ${first} can start whenever they are ready, and then waits — nothing is in front of them until you choose it.`
              : `Open now. ${first} can start whenever they are ready and works through it one question at a time.`
            : teacherLed
              ? `Ready. ${first} opens this themselves at the scheduled time and then waits — nothing is in front of them until you choose it.`
              : `Ready. ${first} opens this themselves at the scheduled time and works through it one question at a time.`
          : staged.length === 0
            ? teacherLed
              ? 'Every question in the paper has been asked.'
              : 'Every question has been answered.'
            : teacherLed
              ? `${first} sees only what you hand over. The rest of the paper is a pool to choose from, not a queue.`
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

/* ------------------------------------------------------------- pacing --- */

/**
 * Who decides what comes next.
 *
 * Two ways of running the same paper, and the difference between them is the
 * difference between a test and a lesson. Left alone the paper runs itself,
 * which is what a diagnostic wants. Switched over, nothing reaches the student
 * until the teacher hands it to them — so a student who cannot do the easy one
 * is not marched into the medium one for the sake of the running order.
 *
 * It can be switched mid-session, which is the case it earns its keep in: the
 * teacher three questions into a paper who can see it is not going to work
 * should be able to take hold of it without abandoning the session.
 */
function Pacing({
  session,
  busy,
  onCall,
}: {
  session: Session
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  if (session.status === 'completed' || session.status === 'cancelled') return null

  const first = session.student?.full_name?.split(' ')[0] ?? 'The student'
  const teacherLed = session.pacing === 'teacher'

  const set = (pacing: 'student' | 'teacher') =>
    void onCall('set_session_pacing', { p_session: session.id, p_pacing: pacing })

  return (
    <div className="paper-box">
      <div className="section-title" style={{ marginBottom: 10 }}>
        Who chooses the next question
      </div>

      <div className="pacing-switch" role="group" aria-label="Who chooses the next question">
        <button
          type="button"
          className={`pacing-opt ${teacherLed ? '' : 'on'}`}
          aria-pressed={!teacherLed}
          disabled={busy || !teacherLed}
          onClick={() => set('student')}
        >
          <b>The paper does</b>
          <span>Every answer brings up the next one, in order.</span>
        </button>
        <button
          type="button"
          className={`pacing-opt ${teacherLed ? 'on' : ''}`}
          aria-pressed={teacherLed}
          disabled={busy || teacherLed}
          onClick={() => set('teacher')}
        >
          <b>You do</b>
          <span>Pick each question by difficulty as the lesson goes.</span>
        </button>
      </div>

      <p className="paper-box-note" style={{ marginTop: 12 }}>
        {teacherLed
          ? `${first} sees one question at a time and only when you send it. Between questions they wait on a held screen.`
          : `${first} works straight through the paper on their own.`}
      </p>
    </div>
  )
}

/* ---------------------------------------------------------------- ask --- */

/**
 * The paper, as something to choose from.
 *
 * The teacher is deciding one thing here — how hard the next question should
 * be — so difficulty is the filter, and the counts are on the dropdown so the
 * decision can be made before the list is read: there is no point reaching for
 * "one level down" when there are no easy ones left.
 *
 * Only one question can be out at a time, and the server holds that line
 * too — the buttons go quiet while the student is on one, because the answer
 * is the thing being waited for, not the click.
 */
function Ask({
  session,
  staged,
  open,
  busy,
  onCall,
}: {
  session: Session
  staged: SessionItem[]
  open: SessionItem | null
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  const [level, setLevel] = useState<Difficulty | 'all'>('all')

  const counts = useMemo(() => {
    const c: Record<Difficulty, number> = { easy: 0, medium: 0, hard: 0 }
    for (const i of staged) if (i.questions) c[i.questions.difficulty] += 1
    return c
  }, [staged])

  const shown = useMemo(
    () => staged.filter((i) => level === 'all' || i.questions?.difficulty === level),
    [staged, level],
  )

  const first = session.student?.full_name?.split(' ')[0] ?? 'the student'

  if (staged.length === 0) {
    return (
      <div className="ask card-pad" style={{ marginBottom: 16 }}>
        <div className="ask-head">
          <div className="section-title">Ask a question</div>
        </div>
        <p className="paper-box-note">
          Every question in this paper has been asked. End the session when you are done, or edit
          the paper for the next one.
        </p>
      </div>
    )
  }

  return (
    <div className="ask" style={{ marginBottom: 16 }}>
      <div className="ask-head">
        <div>
          <div className="section-title" style={{ marginBottom: 2 }}>
            Ask a question
          </div>
          <div className="ask-sub">
            {open
              ? `${first} is on question ${askOrder(open)}. The next one opens when they answer.`
              : `${staged.length} left in the paper. Choose one and it appears on their screen.`}
          </div>
        </div>
        <div className="spring" />
        <Select
          value={level}
          onChange={(e) => setLevel(e.target.value as Difficulty | 'all')}
          aria-label="Difficulty"
        >
          <option value="all">All levels ({staged.length})</option>
          {DIFFICULTIES.map((d) => (
            <option key={d.value} value={d.value} disabled={counts[d.value] === 0}>
              {d.label} ({counts[d.value]})
            </option>
          ))}
        </Select>
      </div>

      {shown.length === 0 ? (
        <p className="paper-box-note" style={{ padding: '0 16px 16px' }}>
          No {level} questions are left in this paper. Try another level.
        </p>
      ) : (
        <ul className="ask-list">
          {shown.map((it) => (
            <li key={it.id}>
              <div className="ask-q">
                <div className="ask-tags">
                  <span className="num">Q{it.sequence_no}</span>
                  {it.questions && <DifficultyBadge level={it.questions.difficulty} />}
                  {it.questions?.skill && (
                    <span className="ask-skill">{skillLabel(it.questions.skill)}</span>
                  )}
                  {!it.questions?.skill && it.questions?.section && (
                    <span className="ask-skill">{sectionLabel(it.questions.section)}</span>
                  )}
                  {it.questions?.target_seconds && (
                    <span className="ask-skill">{it.questions.target_seconds}s target</span>
                  )}
                </div>
                <div className="ask-stem">{it.questions?.stem}</div>
              </div>
              <button
                type="button"
                className="btn btn-primary btn-sm"
                disabled={busy || open !== null}
                title={open ? 'The student is still on a question' : undefined}
                onClick={() => void onCall('publish_item', { p_item: it.id })}
              >
                Ask this
              </button>
            </li>
          ))}
        </ul>
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
  // In the order they were put in front of the student, which under teacher
  // pacing is not the order the paper holds them in.
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
