import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { IconBack, IconClock, IconVideo } from '../components/icons'
import { QuestionView } from '../components/QuestionView'
import { Notice, Passage } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import { clock, openState } from '../lib/countdown'
import { formatUtcLong } from '../lib/time'
import { LEVELS, OPTION_LABELS, levelLabel, nextLevel, subjectLabel } from '../lib/constants'
import { supabase } from '../lib/supabase'
import type { OptionLabel, Session, SessionItem, SessionLevel } from '../lib/types'

/**
 * The student's screen: a lobby, then a test, one question at a time.
 *
 * The test is one of three — easy, medium, hard — and the session opens on the
 * easy one. From then on exactly one question is in front of them, and it is
 * there because the server published it, not because this screen decided to
 * show it. Which is what makes the clock on each question honest: there is no
 * way to read ahead while it runs.
 *
 * The only decision on this screen besides the answer is the level. The teacher
 * is the one who makes it — they are watching the work and they can see when it
 * is too easy — and this is where it gets pressed, because the student is the
 * one at the keyboard. Moving up loads the next test and opens its first
 * question; the one on screen is left unanswered, which the confirmation says.
 */
export function StudentStage({ sessionId }: { sessionId: string }) {
  const { session, items, loading, error, reload } = useLiveSession(sessionId, {
    withAssessments: false,
  })

  const navigate = useNavigate()
  const [leaving, setLeaving] = useState(false)
  const [ending, setEnding] = useState(false)

  const open = useMemo(() => items.find((i) => i.status === 'published') ?? null, [items])
  // In the order they were asked, which after a level move is not the order the
  // questions sit in.
  const done = useMemo(
    () =>
      items
        .filter((i) => i.status === 'answered' || i.status === 'revealed')
        .sort((a, b) => (a.asked_no ?? a.sequence_no) - (b.asked_no ?? b.sequence_no)),
    [items],
  )

  const over = session?.status === 'completed' || session?.status === 'cancelled'

  // A test in progress is not a page you can wander off. The browser's own back
  // button and a refresh are both caught: back is turned into the same question
  // the screen already asks, and a refresh gets the browser's warning.
  const inProgress = open !== null && !over
  const [outOfFullscreen, setOutOfFullscreen] = useState(false)

  // Full screen is asked for when the test opens and watched while it is open.
  // It cannot be forced — every browser lets Escape out, and should — so
  // leaving it is treated as what it is: the student is somewhere else, and is
  // asked to come back or to finish.
  useEffect(() => {
    if (!inProgress) return
    const onChange = () => setOutOfFullscreen(document.fullscreenElement === null)
    onChange()
    document.addEventListener('fullscreenchange', onChange)
    return () => document.removeEventListener('fullscreenchange', onChange)
  }, [inProgress])

  useEffect(() => {
    if (!inProgress) return

    window.history.pushState(null, '', window.location.href)
    const onPop = () => {
      window.history.pushState(null, '', window.location.href)
      setLeaving(true)
    }
    const onUnload = (e: BeforeUnloadEvent) => {
      e.preventDefault()
      e.returnValue = ''
    }

    window.addEventListener('popstate', onPop)
    window.addEventListener('beforeunload', onUnload)
    return () => {
      window.removeEventListener('popstate', onPop)
      window.removeEventListener('beforeunload', onUnload)
    }
  }, [inProgress])

  async function leave() {
    setEnding(true)
    await supabase.rpc('finish_session_as_student', { p_session: sessionId })
    if (document.fullscreenElement) await document.exitFullscreen().catch(() => {})
    setEnding(false)
    setLeaving(false)
    navigate('/sessions')
  }

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const level = session.level
  // Numbering runs within the test they are on. A student moved to medium after
  // six easy questions is on question 1 of the medium test, not question 7 —
  // the medium test is twenty questions and saying so is the honest thing.
  const doneHere = done.filter((i) => i.questions?.difficulty === level).length
  const total = session.level_size > 0 ? session.level_size : null
  const number = open ? doneHere + 1 : doneHere

  const finished = !open && done.length > 0
  // Nothing open and nothing answered means the test is still waiting to be
  // started — whether or not the teacher has already flipped the session live.
  const waiting = !open && !finished && !over

  return (
    <div className="exam">
      <header className="exam-head">
        <div className="exam-title">
          {inProgress ? (
            <button
              type="button"
              className="exam-back"
              onClick={() => setLeaving(true)}
              aria-label="Leave the test"
            >
              <IconBack />
            </button>
          ) : (
            <Link className="exam-back" to="/sessions" aria-label="Back to sessions">
              <IconBack />
            </Link>
          )}
          <span>
            {session.title || `${subjectLabel(session.subject)} session`}:{' '}
            <strong>{levelLabel(level)}</strong>
          </span>
        </div>

        {open && (
          <div className="exam-progress-plain">
            Question {number}
            {total !== null && ` of ${total}`}
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

      {inProgress && outOfFullscreen && !leaving && (
        <div className="leave-veil">
          <div className="leave-box">
            <h2>Back to full screen</h2>
            <p>
              This is a test, so it runs full screen. Your clock is still running on question{' '}
              {number}.
            </p>
            <div className="leave-actions">
              <button
                type="button"
                className="btn btn-primary"
                autoFocus
                onClick={() => void document.documentElement.requestFullscreen().catch(() => {})}
              >
                Go full screen
              </button>
              <button type="button" className="btn" onClick={() => setLeaving(true)}>
                Finish the test
              </button>
            </div>
          </div>
        </div>
      )}

      {leaving && (
        <div className="leave-veil" role="dialog" aria-modal="true" aria-labelledby="leave-title">
          <div className="leave-box">
            <h2 id="leave-title">Leave the test?</h2>
            <p>
              Your test will be submitted as it stands, with the {done.length} question
              {done.length === 1 ? '' : 's'} you have answered. You cannot come back to it.
            </p>
            <div className="leave-actions">
              <button
                type="button"
                className="btn btn-primary"
                onClick={() => setLeaving(false)}
                autoFocus
              >
                Keep going
              </button>
              <button type="button" className="btn" disabled={ending} onClick={() => void leave()}>
                {ending ? 'Submitting…' : 'Submit and leave'}
              </button>
            </div>
          </div>
        </div>
      )}

      {open ? (
        <ItemPane
          key={open.id}
          item={open}
          number={number}
          total={total}
          session={session}
          onChanged={reload}
        />
      ) : waiting ? (
        <Lobby session={session} onStarted={reload} />
      ) : finished ? (
        <Finished session={session} items={done} onChanged={reload} />
      ) : (
        <div className="exam-wait">
          <div className="ring" aria-hidden="true" />
          <h2>Session finished</h2>
          <p>This session has ended. Your teacher will go through it with you.</p>
        </div>
      )}
    </div>
  )
}

/* --------------------------------------------------------------- levels --- */

/**
 * Moving to another test.
 *
 * Three buttons rather than one "next level", because the move that is not up
 * is the one nobody ever built a button for: a student who cannot do the easy
 * questions is not helped by being marched into the medium ones, and dropping
 * back is a real instruction a teacher gives.
 *
 * The confirmation exists for one reason — the question on screen is being
 * timed and moving level abandons it — so it says that, and it does not appear
 * when there is nothing open to abandon.
 */
function LevelSwitch({
  session,
  abandons,
  onChanged,
}: {
  session: Session
  /** A question is open and would be left unanswered by the move. */
  abandons: boolean
  onChanged: () => Promise<void>
}) {
  const [asking, setAsking] = useState<SessionLevel | null>(null)
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)

  async function move(to: SessionLevel) {
    setBusy(true)
    setErr(null)
    // Inside the click, which is the only moment a browser grants it — the
    // student may be coming back from the end of a test, where the screen let
    // full screen go.
    await document.documentElement.requestFullscreen?.().catch(() => {})
    const { error } = await supabase.rpc('set_session_level', {
      p_session: session.id,
      p_level: to,
    })
    if (error) setErr(error.message)
    await onChanged()
    setBusy(false)
    setAsking(null)
  }

  const others = LEVELS.filter((l) => l !== session.level)

  return (
    <div className="level-switch">
      {err && <Notice kind="error">{err}</Notice>}

      <div className="level-switch-row">
        <span className="level-switch-label">
          You are on the <strong>{levelLabel(session.level).toLowerCase()}</strong> test
        </span>
        {others.map((l) => (
          <button
            key={l}
            type="button"
            className={`btn btn-sm ${l === nextLevel(session.level) ? 'btn-navy' : 'btn-ghost'}`}
            disabled={busy}
            onClick={() => (abandons ? setAsking(l) : void move(l))}
          >
            Switch to {levelLabel(l).toLowerCase()}
          </button>
        ))}
      </div>

      {asking && (
        <div className="leave-veil" role="dialog" aria-modal="true" aria-labelledby="switch-title">
          <div className="leave-box">
            <h2 id="switch-title">Switch to the {levelLabel(asking).toLowerCase()} test?</h2>
            <p>
              The question on your screen will be left unanswered, and the rest of the{' '}
              {levelLabel(session.level).toLowerCase()} test goes away. You start at question 1 of
              the {levelLabel(asking).toLowerCase()} test.
            </p>
            <div className="leave-actions">
              <button
                type="button"
                className="btn btn-primary"
                autoFocus
                disabled={busy}
                onClick={() => void move(asking)}
              >
                {busy ? 'Switching…' : `Switch to ${levelLabel(asking).toLowerCase()}`}
              </button>
              <button type="button" className="btn" disabled={busy} onClick={() => setAsking(null)}>
                Stay on this question
              </button>
            </div>
          </div>
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
function Lobby({ session, onStarted }: { session: Session; onStarted: () => Promise<void> }) {
  const [now, setNow] = useState(() => Date.now())
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)

  useEffect(() => {
    const t = setInterval(() => setNow(Date.now()), 1000)
    return () => clearInterval(t)
  }, [])

  const state = openState(session.scheduled_at, now, session.opened_early_at)

  async function start() {
    setBusy(true)
    setErr(null)
    // Asked for inside the click, which is the only moment a browser will
    // grant it. A refusal is not fatal — the screen handles being out of it.
    await document.documentElement.requestFullscreen?.().catch(() => {})
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
        You start on the {levelLabel(session.level).toLowerCase()} test and answer one question at a
        time, each timed from the moment it appears. Once you submit an answer you move on to the
        next one and cannot go back to it. If it turns out to be the wrong level, you can switch
        tests while you work.
      </p>
      <p className="exam-when">
        {formatUtcLong(session.scheduled_at)} — {state.label}
      </p>

      {err && <Notice kind="error">{err}</Notice>}

      <button
        type="button"
        className="btn btn-primary btn-lg"
        disabled={!state.open || busy}
        onClick={() => void start()}
      >
        {busy ? 'Starting…' : 'Start the test'}
      </button>
    </div>
  )
}

/* ------------------------------------------------------------ finished --- */

/**
 * The end of a test — which is not necessarily the end of the session.
 *
 * A student who has worked through the easy test and found it easy is exactly
 * the student the medium test is for, so the move up is offered here rather
 * than only mid-question. Underneath it, every question as they met it —
 * stimulus, stem, all four choices — with what they picked and, once the
 * teacher has published the results, which one was right and why. A list of
 * stems and letters told a student nothing they could learn from.
 *
 * The key is not in the student's reach (question_keys is teacher-only), so it
 * comes from what the reveal copied onto the item itself.
 */
function Finished({
  session,
  items,
  onChanged,
}: {
  session: Session
  items: SessionItem[]
  onChanged: () => Promise<void>
}) {
  const revealed = items.filter((i) => i.status === 'revealed')
  const right = items.filter((i) => i.revealed_result === 'correct').length
  const out = revealed.length
  const over = session.status === 'completed' || session.status === 'cancelled'

  return (
    <div className="exam-done">
      <div className="exam-done-head">
        <h2>That is the {levelLabel(session.level).toLowerCase()} test</h2>
        <p>
          {items.length} answered.{' '}
          {out === 0
            ? 'Your teacher will go through it with you — your results appear here when they do.'
            : `You got ${right} of ${out} right.`}
        </p>
      </div>

      {!over && <LevelSwitch session={session} abandons={false} onChanged={onChanged} />}

      {items.map((it) =>
        it.questions ? (
          <article className="done-card" key={it.id}>
            <QuestionView
              question={it.questions}
              number={String(it.asked_no ?? it.sequence_no)}
              showKey={it.status === 'revealed'}
              correct={it.revealed_correct_option}
              chosen={it.selected_option}
              header={
                it.status === 'revealed' ? (
                  <span
                    className={`badge ${it.revealed_result === 'correct' ? 'badge-ok' : 'badge-bad'}`}
                  >
                    {it.revealed_result === 'correct' ? 'Right' : 'Wrong'}
                  </span>
                ) : (
                  <span className="badge badge-neutral">Answered</span>
                )
              }
              footer={
                it.revealed_explanation && (
                  <div className="q-note">
                    <div className="section-title">Why</div>
                    {it.revealed_explanation}
                  </div>
                )
              }
            />
          </article>
        ) : null,
      )}
    </div>
  )
}

/* ---------------------------------------------------------------- item --- */

function ItemPane({
  item,
  number,
  total,
  session,
  onChanged,
}: {
  item: SessionItem
  /** Where this question came in the test the student is on. */
  number: number
  /** How long that test is, or null before the server has said. */
  total: number | null
  session: Session
  onChanged: () => Promise<void>
}) {
  const [selected, setSelected] = useState<OptionLabel | null>(item.selected_option)
  const [struck, setStruck] = useState<OptionLabel[]>(item.eliminated_options ?? [])
  const [crossoutOn, setCrossoutOn] = useState(false)
  const [confidence, setConfidence] = useState<number | null>(item.student_confidence)
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

  // The clock measures working the question out, which ends when there is an
  // answer and a confidence down — not when the button is found. The server is
  // told the moment it happens, so the number in the report is the number the
  // student watched stop.
  const decided = selected !== null && confidence !== null
  const stamped = useRef(false)
  useEffect(() => {
    if (!decided || stamped.current) return
    stamped.current = true
    void supabase.rpc('mark_item_decided', { p_item: item.id })
  }, [decided, item.id])

  const submit = useCallback(async () => {
    if (!selected) return
    setBusy(true)
    setErr(null)
    const { error } = await supabase.rpc('submit_answer', {
      p_item: item.id,
      p_option: selected,
      p_eliminated: struck,
      p_confidence: confidence,
      // Asked for in the lesson, where the teacher can hear the answer — not
      // typed into a box while a clock runs.
      p_reasoning: null,
    })
    if (error) setErr(error.message)
    // Answering publishes the next question, so the reload brings it with it.
    await onChanged()
    setBusy(false)
  }, [selected, struck, confidence, item.id, onChanged])

  const last = total !== null && number >= total

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
          <span className="qn">{String(number).padStart(2, '0')}</span>
          {total !== null && <span className="qof">of {total}</span>}
          <span className="spring" />
          <QuestionClock itemId={item.id} running={!decided && !busy} />
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
              <div
                key={o.id}
                className={`ch ${isSel ? 'selected' : ''} ${isStruck ? 'struck' : ''}`}
              >
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

          <button
            type="button"
            className="btn btn-primary btn-lg btn-block"
            style={{ marginTop: 16 }}
            disabled={!selected || busy}
            onClick={() => void submit()}
          >
            {busy ? 'Sending…' : !selected ? 'Pick an answer' : last ? 'Finish the test' : 'Next'}
          </button>
          <p className="exam-lock">You cannot come back to a question once you have submitted it.</p>

          <LevelSwitch session={session} abandons onChanged={onChanged} />
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
