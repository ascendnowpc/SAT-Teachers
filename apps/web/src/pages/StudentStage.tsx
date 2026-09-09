import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { IconBack, IconClock, IconVideo } from '../components/icons'
import { QuestionView } from '../components/QuestionView'
import { Notice, Passage } from '../components/ui'
import { useStudentSession } from '../hooks/useStudentSession'
import type { SessionGateway } from '../lib/gateway'
import { clock, openState } from '../lib/countdown'
import { askNumbers } from '../lib/report'
import { formatUtcLong } from '../lib/time'
import {
  OPTION_LABELS,
  levelLabel,
  levelSwitchLabel,
  levelSwitchTarget,
  subjectLabel,
} from '../lib/constants'
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
 * The level is a decision on this screen too. The teacher is the one who makes
 * it — they are watching the work and they can see when it is too easy — and
 * it can be pressed from either side now: here, because the student is the one
 * at the keyboard, and on the console, because sometimes the student's screen
 * is not reaching anybody. Moving up loads the next test and opens its first
 * question; the one on screen is set aside, which the confirmation says. Set
 * aside is not unanswered — switching tests is a decision that this question
 * was not the one to spend the lesson on — so it is not counted or numbered
 * anywhere against the student.
 *
 * The screen takes a gateway rather than a session id, which is what lets the
 * same code serve a signed-in student and one who arrived on a link with no
 * account at all. See lib/gateway.
 */
export function StudentStage({ gateway }: { gateway: SessionGateway }) {
  const { session, items, loading, error, reload } = useStudentSession(gateway)

  const navigate = useNavigate()
  // A student on a link has no sessions list to be sent back to: the link is
  // the whole of their app, so handing the test in leaves them on it.
  const hasApp = gateway.kind === 'account'
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
    try {
      await gateway.finish()
    } catch {
      // The screen is being left either way; the reload below tells the truth
      // about what actually happened to the session.
    }
    if (document.fullscreenElement) await document.exitFullscreen().catch(() => {})
    await reload()
    setEnding(false)
    setLeaving(false)
    if (hasApp) navigate('/sessions')
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
              aria-label="Submit the test and leave"
            >
              <IconBack />
            </button>
          ) : hasApp ? (
            <Link className="exam-back" to="/sessions" aria-label="Back to sessions">
              <IconBack />
            </Link>
          ) : null}
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
          {/* Finishing early was only ever reachable through the back arrow,
              which is a way out of a page rather than a way to hand a test in.
              A student who has run out of road on question 6 of 20 needs to be
              able to say so, and to see that they can. */}
          {inProgress && (
            <button type="button" className="btn btn-navy btn-sm" onClick={() => setLeaving(true)}>
              Submit test
            </button>
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
            <h2 id="leave-title">Submit the test?</h2>
            <p>
              Your test will be submitted as it stands, with the {done.length} question
              {done.length === 1 ? '' : 's'} you have answered. The rest are left unattempted and
              you cannot come back to them.
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
                {ending ? 'Submitting…' : 'Submit and finish'}
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
          gateway={gateway}
          onChanged={reload}
        />
      ) : waiting ? (
        <Lobby session={session} gateway={gateway} onStarted={reload} />
      ) : finished ? (
        <Finished session={session} gateway={gateway} items={done} onChanged={reload} />
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
 * One button, not a row of them. Every level the student was not on used to get
 * its own button, which on the hard test put "Switch to easy" and "Switch to
 * medium" side by side and made the student pick between two levels they had
 * not asked about. There is only one move worth offering here: the next test up
 * while there is one, and on the hard test the way back down to medium.
 *
 * A drop straight from hard to easy is still a real instruction. It is the
 * teacher's to give and it is given out loud on the call — the console has no
 * level buttons of its own — which is not the same as putting the whole ladder
 * to a student mid-question.
 *
 * The confirmation is always asked, whether or not there is a question open to
 * abandon: switching test throws away the rest of the one they are on, and
 * that is not something to discover by having done it. What it says changes —
 * mid-question the thing being lost is the answer they were being timed on.
 */
function LevelSwitch({
  session,
  gateway,
  abandons,
  onChanged,
}: {
  session: Session
  gateway: SessionGateway
  /** A question is open and would be set aside by the move. */
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
    try {
      await gateway.setLevel(to)
    } catch (e) {
      setErr(e instanceof Error ? e.message : 'Could not switch tests.')
    }
    await onChanged()
    setBusy(false)
    setAsking(null)
  }

  const target = levelSwitchTarget(session.level)

  return (
    <div className="level-switch">
      {err && <Notice kind="error">{err}</Notice>}

      <div className="level-switch-row">
        <span className="level-switch-label">
          You are on the <strong>{levelLabel(session.level).toLowerCase()}</strong> test
        </span>
        {target && (
          <button
            type="button"
            className={`btn btn-sm ${target.back ? 'btn-ghost' : 'btn-navy'}`}
            disabled={busy}
            onClick={() => setAsking(target.level)}
          >
            {levelSwitchLabel(target)}
          </button>
        )}
      </div>

      {asking && (
        <div className="leave-veil" role="dialog" aria-modal="true" aria-labelledby="switch-title">
          <div className="leave-box">
            <h2 id="switch-title">Switch to the {levelLabel(asking).toLowerCase()} test?</h2>
            <p>
              {abandons
                ? 'The question on your screen is set aside — it is not counted against you — and the rest of the '
                : 'The rest of the '}
              {levelLabel(session.level).toLowerCase()} test goes away. You pick up the{' '}
              {levelLabel(asking).toLowerCase()} test at its first question you have not already
              answered.
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
function Lobby({
  session,
  gateway,
  onStarted,
}: {
  session: Session
  gateway: SessionGateway
  onStarted: () => Promise<void>
}) {
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
    try {
      await gateway.start()
    } catch (e) {
      setErr(e instanceof Error ? e.message : 'Could not start the test.')
    }
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
  gateway,
  items,
  onChanged,
}: {
  session: Session
  gateway: SessionGateway
  items: SessionItem[]
  onChanged: () => Promise<void>
}) {
  // 1, 2, 3 over the questions they actually worked on — a question set aside
  // by a test switch is not one of them and takes no number.
  const numbers = useMemo(() => askNumbers(items), [items])
  const revealed = items.filter((i) => i.status === 'revealed')
  const right = items.filter((i) => i.revealed_result === 'correct').length
  const out = revealed.length
  const over = session.status === 'completed' || session.status === 'cancelled'

  return (
    <div className="exam-done">
      <div className="exam-done-head">
        {/* Not "that is the hard test". Which of the three tests a student was
            put on is the teacher's decision about them, and reading it back at
            the end tells them nothing they can do anything with. */}
        <h2>Test submitted</h2>
        <p>
          {items.length} answered.{' '}
          {out === 0
            ? 'Your teacher will go through it with you — your results appear here when they do.'
            : `You got ${right} of ${out} right.`}
        </p>
      </div>

      {!over && (
        <LevelSwitch session={session} gateway={gateway} abandons={false} onChanged={onChanged} />
      )}

      {items.map((it) =>
        it.questions ? (
          <article className="done-card" key={it.id}>
            <QuestionView
              question={it.questions}
              number={numbers.get(it.id) === undefined ? '—' : String(numbers.get(it.id))}
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
  gateway,
  onChanged,
}: {
  item: SessionItem
  /** Where this question came in the test the student is on. */
  number: number
  /** How long that test is, or null before the server has said. */
  total: number | null
  session: Session
  gateway: SessionGateway
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
    void gateway.markViewed(item.id)
  }, [gateway, item.id])

  function toggleStrike(label: OptionLabel) {
    setStruck((prev) => (prev.includes(label) ? prev.filter((l) => l !== label) : [...prev, label]))
    if (selected === label) setSelected(null)
  }

  /**
   * The working, sent up as it happens.
   *
   * The teacher is on a call watching this student, and until now the console
   * showed nothing at all until Next was pressed — so "you've gone for B, talk
   * me through it" needed a screen share, which is the thing that keeps
   * failing. It is a draft, not an answer: the item stays published, nothing
   * is graded, and the clock keeps running.
   *
   * Debounced, because crossing out three options is three renders and the
   * teacher does not need to watch each one land.
   */
  useEffect(() => {
    const t = setTimeout(() => {
      void gateway.saveDraft({
        itemId: item.id,
        option: selected,
        eliminated: struck,
        confidence,
      })
    }, 400)
    return () => clearTimeout(t)
  }, [gateway, item.id, selected, struck, confidence])

  // The clock measures working the question out, which ends when there is an
  // answer and a confidence down — not when the button is found. The server is
  // told the moment it happens, so the number in the report is the number the
  // student watched stop.
  const decided = selected !== null && confidence !== null
  const stamped = useRef(false)
  useEffect(() => {
    if (!decided || stamped.current) return
    stamped.current = true
    void gateway.markDecided(item.id)
  }, [decided, gateway, item.id])

  const submit = useCallback(async () => {
    if (!selected) return
    setBusy(true)
    setErr(null)
    try {
      await gateway.submit({
        itemId: item.id,
        option: selected,
        eliminated: struck,
        confidence,
      })
    } catch (e) {
      setErr(e instanceof Error ? e.message : 'Could not send that answer.')
    }
    // Answering publishes the next question, so the reload brings it with it.
    await onChanged()
    setBusy(false)
  }, [selected, struck, confidence, gateway, item.id, onChanged])

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
          {/* The confidence is asked about an answer, so it is not on screen
              until there is one. Sitting under four unpicked choices it caught
              clicks the student had not meant to make — "Certain" marked while
              they were still reading — and a number given before the answer is
              a number about nothing, which is the one thing this column of the
              report cannot afford. */}
          {selected ? (
            <div className="conf-ask">
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
            </div>
          ) : (
            <p className="conf-wait">Pick an answer, then say how sure you are.</p>
          )}

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

          <LevelSwitch session={session} gateway={gateway} abandons onChanged={onChanged} />
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
