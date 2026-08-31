import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { IconBack, IconCheck, IconClock, IconCross, IconVideo } from '../components/icons'
import { Notice, Passage, Textarea } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import { clock, openState } from '../lib/countdown'
import { OPTION_LABELS, subjectLabel } from '../lib/constants'
import { supabase } from '../lib/supabase'
import type { OptionLabel, Session, SessionItem } from '../lib/types'

/**
 * The student's screen: a lobby, then the paper, one question at a time.
 *
 * The teacher built this paper days ago and is not driving anything now. At
 * the scheduled time the student opens the session themselves, and from then
 * on exactly one question is in front of them — the next arrives when the
 * current one is answered, and it arrives because the server publishes it,
 * not because this screen decides to show it.
 *
 * Which is also what makes the clock on each question honest: there is no way
 * to read ahead while it runs.
 */
export function StudentStage({ sessionId }: { sessionId: string }) {
  const { session, items, loading, error, reload } = useLiveSession(sessionId, {
    withAssessments: false,
  })

  const open = useMemo(() => items.find((i) => i.status === 'published') ?? null, [items])
  const done = useMemo(
    () => items.filter((i) => i.status === 'answered' || i.status === 'revealed'),
    [items],
  )

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const total = Math.max(session.question_count, items.length)
  const number = open ? open.sequence_no : done.length
  const finished = !open && done.length > 0

  return (
    <div className="exam">
      <header className="exam-head">
        <div className="exam-title">
          <Link className="exam-back" to="/sessions" aria-label="Back to sessions">
            <IconBack />
          </Link>
          <span>
            {session.title || `${subjectLabel(session.subject)} session`}:{' '}
            <strong>{subjectLabel(session.subject)}</strong>
          </span>
        </div>

        {open && total > 0 && (
          <div className="exam-progress-plain">
            Question {number} of {total}
          </div>
        )}

        <div className="exam-actions">
          {session.meeting_url && session.status !== 'completed' && (
            <a
              className="btn btn-ghost btn-sm"
              href={session.meeting_url}
              target="_blank"
              rel="noreferrer noopener"
            >
              <IconVideo /> Join call
            </a>
          )}
        </div>
      </header>

      {error && (
        <div className="exam-notice">
          <Notice kind="error">{error}</Notice>
        </div>
      )}

      {session.status === 'scheduled' ? (
        <Lobby session={session} onStarted={reload} />
      ) : open ? (
        <ItemPane key={open.id} item={open} total={total} onChanged={reload} />
      ) : finished ? (
        <Finished items={done} />
      ) : (
        <div className="exam-wait">
          <div className="ring" aria-hidden="true" />
          <h2>{session.status === 'completed' ? 'Session finished' : 'Nothing to answer yet'}</h2>
          <p>
            {session.status === 'completed'
              ? 'This session has ended. Your teacher will go through it with you.'
              : 'Your teacher has not put any questions in this session yet. It will start on its own once they do.'}
          </p>
        </div>
      )}
    </div>
  )
}

/* --------------------------------------------------------------- lobby --- */

/**
 * Before the scheduled time this is a countdown; after it, a Start button.
 *
 * The button is only the polite half of the gate — start_session_as_student
 * refuses anything early on the server, so a student who finds the call by
 * hand gets the same answer this screen would have given them.
 */
function Lobby({
  session,
  onStarted,
}: {
  session: Session
  onStarted: () => Promise<void>
}) {
  const [now, setNow] = useState(() => Date.now())
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)

  useEffect(() => {
    const t = setInterval(() => setNow(Date.now()), 1000)
    return () => clearInterval(t)
  }, [])

  const state = openState(session.scheduled_at, now)
  const when = new Date(session.scheduled_at)

  async function start() {
    setBusy(true)
    setErr(null)
    const { error } = await supabase.rpc('start_session_as_student', { p_session: session.id })
    if (error) setErr(error.message)
    await onStarted()
    setBusy(false)
  }

  return (
    <div className="exam-wait">
      <div className="ring" aria-hidden="true" />
      <h2>{state.open ? 'Ready when you are' : 'Not open yet'}</h2>
      <p>
        {session.question_count > 0
          ? `${session.question_count} question${session.question_count === 1 ? '' : 's'}. `
          : ''}
        You answer them one at a time, and each one is timed from the moment it appears. Once you
        submit an answer you move on to the next.
      </p>
      <p className="exam-when">
        {when.toLocaleString(undefined, {
          weekday: 'long',
          day: 'numeric',
          month: 'long',
          hour: 'numeric',
          minute: '2-digit',
        })}{' '}
        — {state.label}
      </p>

      {err && <Notice kind="error">{err}</Notice>}

      <button
        type="button"
        className="btn btn-primary btn-lg"
        disabled={!state.open || busy || session.question_count === 0}
        onClick={() => void start()}
      >
        {busy ? 'Starting…' : 'Start the test'}
      </button>
    </div>
  )
}

/* ------------------------------------------------------------ finished --- */

function Finished({ items }: { items: SessionItem[] }) {
  const revealed = items.filter((i) => i.status === 'revealed')

  return (
    <div className="exam-done">
      <div className="exam-done-head">
        <h2>That is the whole paper</h2>
        <p>
          {items.length} answered.{' '}
          {revealed.length === items.length
            ? 'Your results are below.'
            : 'Your teacher will go through it with you — the results appear here as they do.'}
        </p>
      </div>

      <ol className="done-list">
        {items.map((it) => (
          <li key={it.id} className={it.revealed_result ?? undefined}>
            <span className="no">{it.sequence_no}</span>
            <span className="stem">{it.questions?.stem}</span>
            <span className="pick">You chose {it.selected_option}</span>
            {it.status === 'revealed' && (
              <span className={`mark ${it.revealed_result}`}>
                {it.revealed_result === 'correct' ? <IconCheck /> : <IconCross />}
                {it.revealed_result === 'correct'
                  ? 'Right'
                  : `Answer ${it.revealed_correct_option ?? '—'}`}
              </span>
            )}
          </li>
        ))}
      </ol>
    </div>
  )
}

/* ---------------------------------------------------------------- item --- */

function ItemPane({
  item,
  total,
  onChanged,
}: {
  item: SessionItem
  total: number
  onChanged: () => Promise<void>
}) {
  const [selected, setSelected] = useState<OptionLabel | null>(item.selected_option)
  const [struck, setStruck] = useState<OptionLabel[]>(item.eliminated_options ?? [])
  const [crossoutOn, setCrossoutOn] = useState(false)
  const [confidence, setConfidence] = useState<number | null>(item.student_confidence)
  const [reasoning, setReasoning] = useState(item.student_reasoning ?? '')
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)

  const options = useMemo(
    () =>
      [...(item.questions?.question_options ?? [])].sort(
        (a, b) => OPTION_LABELS.indexOf(a.label) - OPTION_LABELS.indexOf(b.label),
      ),
    [item.questions],
  )

  // Tell the server the question is actually on screen, so time-on-question
  // measures reading rather than however long the row took to arrive.
  const viewed = useRef(false)
  useEffect(() => {
    if (viewed.current) return
    viewed.current = true
    void supabase.rpc('mark_item_viewed', { p_item: item.id })
  }, [item.id])

  function toggleStrike(label: OptionLabel) {
    setStruck((prev) => (prev.includes(label) ? prev.filter((l) => l !== label) : [...prev, label]))
    if (selected === label) setSelected(null)
  }

  const submit = useCallback(async () => {
    if (!selected) return
    setBusy(true)
    setErr(null)
    const { error } = await supabase.rpc('submit_answer', {
      p_item: item.id,
      p_option: selected,
      p_eliminated: struck,
      p_confidence: confidence,
      p_reasoning: reasoning,
    })
    if (error) setErr(error.message)
    // Answering publishes the next question, so the reload brings it with it.
    await onChanged()
    setBusy(false)
  }, [selected, struck, confidence, reasoning, item.id, onChanged])

  return (
    <div className="exam-body">
      <section className="exam-stimulus">
        {item.questions?.passage ? (
          <Passage
            body={item.questions.passage}
            underline={item.questions.passage_underline}
            className="stim"
          />
        ) : (
          <p className="stim-empty">This question stands on its own — read it on the right.</p>
        )}
      </section>

      <section className="exam-question">
        <div className="exam-qhead">
          <span className="qn">{String(item.sequence_no).padStart(2, '0')}</span>
          <span className="qof">of {total}</span>
          <span className="spring" />
          <QuestionClock itemId={item.id} running={!busy} />
          <button
            type="button"
            className={`abc ${crossoutOn ? 'on' : ''}`}
            onClick={() => setCrossoutOn((v) => !v)}
            aria-pressed={crossoutOn}
            title="Cross out answers"
          >
            <s>ABC</s>
          </button>
        </div>

        {err && <Notice kind="error">{err}</Notice>}

        <h2 className="exam-stem">{item.questions?.stem}</h2>

        <div className="exam-choices">
          {options.map((o) => {
            const isStruck = struck.includes(o.label)
            const isSel = selected === o.label

            return (
              <div key={o.id} className={`ch ${isSel ? 'selected' : ''} ${isStruck ? 'struck' : ''}`}>
                <button
                  type="button"
                  className="ch-main"
                  disabled={busy}
                  onClick={() => {
                    if (isStruck) setStruck((p) => p.filter((l) => l !== o.label))
                    setSelected(o.label)
                  }}
                >
                  <span className="lab">{o.label}</span>
                  <span className="body">{o.body}</span>
                </button>
                {crossoutOn && (
                  <button
                    type="button"
                    className={`ch-strike ${isStruck ? 'on' : ''}`}
                    onClick={() => toggleStrike(o.label)}
                    aria-pressed={isStruck}
                    aria-label={`${isStruck ? 'Restore' : 'Cross out'} option ${o.label}`}
                  >
                    <s>{o.label}</s>
                  </button>
                )}
              </div>
            )
          })}
        </div>

        <div className="exam-after">
          <div className="section-title">How sure are you?</div>
          <div className="confidence">
            {['Not sure', 'Fairly sure', 'Certain'].map((label, i) => (
              <button
                key={label}
                type="button"
                className={`conf-btn ${confidence === i + 1 ? 'on' : ''}`}
                onClick={() => setConfidence(i + 1)}
              >
                {label}
              </button>
            ))}
          </div>

          <div className="section-title" style={{ marginTop: 16 }}>
            Why did you pick it?
          </div>
          <Textarea
            rows={2}
            value={reasoning}
            onChange={(e) => setReasoning(e.target.value)}
            placeholder="Optional — one line on how you got there."
            aria-label="Why did you pick it?"
          />

          <button
            type="button"
            className="btn btn-primary btn-lg btn-block"
            style={{ marginTop: 16 }}
            disabled={!selected || busy}
            onClick={() => void submit()}
          >
            {busy
              ? 'Sending…'
              : selected
                ? `Submit ${selected} and go on`
                : 'Pick an answer'}
          </button>
          <p className="exam-lock">
            You cannot come back to a question once you have submitted it.
          </p>
        </div>
      </section>
    </div>
  )
}

/**
 * The clock on this question. It starts when the question appears and stops
 * when the answer goes in — which is exactly the interval the server records
 * as elapsed_seconds, so the number the student watches is the number their
 * teacher reads in the report.
 */
function QuestionClock({ itemId, running }: { itemId: string; running: boolean }) {
  const started = useRef(Date.now())
  const [seconds, setSeconds] = useState(0)

  useEffect(() => {
    started.current = Date.now()
    setSeconds(0)
  }, [itemId])

  useEffect(() => {
    if (!running) return
    const t = setInterval(() => setSeconds((Date.now() - started.current) / 1000), 1000)
    return () => clearInterval(t)
  }, [running, itemId])

  return (
    <span className={`q-clock ${running ? '' : 'stopped'}`} aria-live="off">
      <IconClock /> {clock(seconds)}
    </span>
  )
}
