import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Explanation } from '../components/Explanation'
import { IconBack, IconClock, IconVideo } from '../components/icons'
import { MathToolButtons, MathToolsPanel, type MathTool } from '../components/MathTools'
import { MathText } from '../components/MathText'
import { QuestionView } from '../components/QuestionView'
import { Notice, Passage } from '../components/ui'
import { useStudentSession } from '../hooks/useStudentSession'
import type { SessionGateway } from '../lib/gateway'
import { clock, openState } from '../lib/countdown'
import { bindingClock, deadlineAt, outcomeOf, questionEndsAt, secondsLeft } from '../lib/targetedClock'
import { askNumbers } from '../lib/report'
import { formatUtcLong } from '../lib/time'
import { OPTION_LABELS, subjectLabel } from '../lib/constants'
import type { OptionLabel, Session, SessionItem, TargetedInfo } from '../lib/types'

/**
 * The student's screen: a lobby, then a test, one question at a time.
 *
 * Exactly one question is in front of them, and it is there because the server
 * published it, not because this screen decided to show it. Which is what makes
 * the clock on each question honest: there is no way to read ahead while it
 * runs.
 *
 * Which question that is, is the teacher's decision, and nothing else puts one
 * up (0057). Starting the test and answering a question both leave the student
 * waiting for the teacher to show the next one; there is no Next button and no
 * way to move on alone. If the teacher shows a question while another is still
 * here, the one that was here is set aside: it is not counted or numbered
 * anywhere against the student, because changing it was the teacher's call,
 * not something the student got wrong.
 *
 * Nothing on this screen says which of the three tests a question came from.
 * A student who could see "easy" turn into "hard" started treating a
 * diagnostic as a final exam, and the level is the teacher's judgement about
 * them rather than anything they can act on. So there is no level in the
 * header, no level switch, and no "of 20" — the questions are counted as they
 * come, across the whole session.
 *
 * The screen takes a gateway rather than a session id, which is what lets the
 * same code serve a signed-in student and one who arrived on a link with no
 * account at all. See lib/gateway.
 *
 * A targeted test (0062) is the one session that runs itself: the server puts
 * each question of the set up as the last is answered or runs out of time, so
 * the screen says "Question 2 of 5", counts both clocks down in server time,
 * and tells the server when the time is up. Still forward only: no skipping,
 * no going back, and nothing about a question's level.
 */
export function StudentStage({ gateway }: { gateway: SessionGateway }) {
  const { session, items, targeted, offset, loading, error, reload } = useStudentSession(gateway)

  const navigate = useNavigate()
  // A student on a link has no sessions list to be sent back to: the link is
  // the whole of their app, so handing the test in leaves them on it.
  const hasApp = gateway.kind === 'account'
  const [leaving, setLeaving] = useState(false)
  const [ending, setEnding] = useState(false)
  // The calculators and the reference sheet, open or not. Held here rather
  // than on the question so that moving on to the next one keeps the panel —
  // and what was typed into the calculator — where the student left it.
  const [tool, setTool] = useState<MathTool | null>(null)

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
  // the screen already asks, and a refresh gets the browser's warning. In
  // progress means the whole of the live test, not only while a question is
  // up: between questions the student is waiting for the teacher (0057), and
  // that wait is part of the test.
  const inProgress = session?.status === 'live' && !over
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

  if (loading) return <div className="page page-loading">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const isTargeted = session.mode === 'targeted'
  // The signed-in door refuses a targeted test (0062): its clocks run on the link.
  if (isTargeted && gateway.kind === 'account') {
    return (
      <div className="exam-wait">
        <h2>Open this test from your link</h2>
        <p>This test runs on the link your teacher sent you. Ask them for it if you cannot find it.</p>
      </div>
    )
  }
  const deadline = isTargeted ? deadlineAt(targeted?.deadline) : null

  // Bluebook gives a mathematics module a calculator and a reference sheet for
  // its whole length, and so does this: from the start of the test to the end,
  // between questions as well as on them.
  const math = session.subject === 'mathematics' && inProgress

  // One count across the whole session, the same numbers the teacher's board
  // and the report use. It used to start again with every test — question 1 of
  // 20, again, after six easy ones — which told the student the one thing the
  // screen no longer says: that they had been moved.
  const number = done.length + (open ? 1 : 0)

  // The clock on the question on screen: its own or the test's, whichever ends first.
  const binding = isTargeted && open ? bindingClock(questionEndsAt(open), deadline) : null

  const finished = !open && done.length > 0
  // Live with nothing on the screen: started, and waiting for the teacher to
  // show a question — the first one, or the next.
  const between = !open && session.status === 'live'
  // Nothing open, nothing answered, not yet live: the lobby.
  const waiting = !open && !finished && !between && !over

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
          <span>{session.title || `${subjectLabel(session.subject)} session`}</span>
        </div>

        {open && (
          <div className="exam-progress-plain">
            {isTargeted && targeted
              ? `Question ${number} of ${targeted.question_count}`
              : `Question ${number}`}
          </div>
        )}

        <div className="exam-actions">
          {isTargeted && inProgress && deadline !== null && (
            <span className="exam-overall" title="Time left for the whole test">
              Test{' '}
              <TimeLeft
                endsAt={deadline}
                offset={offset}
                // On a question, that question's own countdown handles the
                // end — it shows whichever clock runs out first.
                onZero={open ? undefined : () => void later(reload)}
              />
            </span>
          )}
          {math && <MathToolButtons tool={tool} onTool={setTool} />}
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
              {open
                ? `This is a test, so it runs full screen. Your clock is still running on question ${number}.`
                : isTargeted
                  ? 'This is a test, so it runs full screen. Your clock is still running.'
                  : 'This is a test, so it runs full screen. Your next question will appear here when your teacher shows it.'}
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
            {isTargeted ? (
              <p>
                Your test will be submitted as it stands. The question on your screen and the ones
                after it will not be counted, and you cannot come back to them.
              </p>
            ) : (
              <p>
                Your test will be submitted as it stands, with the {done.length} question
                {done.length === 1 ? '' : 's'} you have answered. The rest are left unattempted and
                you cannot come back to them.
              </p>
            )}
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

      <div className="exam-main">
        <div className="exam-content">
          {open ? (
            <ItemPane
              key={open.id}
              item={open}
              number={number}
              gateway={gateway}
              onChanged={reload}
              countdown={binding ? { ...binding, offset } : null}
            />
          ) : between ? (
            isTargeted ? <NextComing /> : <WaitingForTeacher first={done.length === 0} />
          ) : finished ? (
            <Finished items={done} targeted={isTargeted ? targeted : null} />
          ) : waiting ? (
            <Lobby session={session} gateway={gateway} onStarted={reload} targeted={isTargeted ? targeted : null} />
          ) : (
            <div className="exam-wait">
              <div className="ring" aria-hidden="true" />
              <h2>Session finished</h2>
              <p>This session has ended. Your teacher will go through it with you.</p>
            </div>
          )}
        </div>
        {math && (
          <MathToolsPanel
            tool={tool}
            onTool={setTool}
            className="exam-tools"
            note={open ? <QuestionNote item={open} /> : null}
            noteTitle={`Question ${number}`}
          />
        )}
      </div>
    </div>
  )
}

/**
 * The question as it rides on the full-screen graphing calculator: enough to
 * work from — the figure, the passage, the stem and the four choices — and
 * nothing to press. The answer is still given on the question itself.
 */
function QuestionNote({ item }: { item: SessionItem }) {
  const q = item.questions
  if (!q) return null
  const options = [...q.question_options].sort(
    (a, b) => OPTION_LABELS.indexOf(a.label) - OPTION_LABELS.indexOf(b.label),
  )
  return (
    <>
      {q.image_url && <img className="stim-figure" src={q.image_url} alt="Figure for this question" />}
      {q.passage && (
        <Passage body={q.passage} underline={q.passage_underline} className="stim" math />
      )}
      <p className="math-note-stem">
        <MathText text={q.stem} />
      </p>
      <ol className="math-note-choices">
        {options.map((o) => (
          <li key={o.id}>
            <span className="lab">{o.label}</span>
            <MathText text={o.body} />
          </li>
        ))}
      </ol>
    </>
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
  targeted,
}: {
  session: Session
  gateway: SessionGateway
  onStarted: () => Promise<void>
  /** Set for a targeted test: it runs itself, and the student is told how. */
  targeted: TargetedInfo | null
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
      {targeted ? (
        <p>
          {targeted.question_count} question{targeted.question_count === 1 ? '' : 's'}, one at a
          time, and {Math.round(targeted.overall_seconds / 60)} minutes for the whole test. Each
          question has its own clock: answer it before the time runs out, or the next one comes up
          on its own. You cannot skip a question or go back to one.
        </p>
      ) : (
        <p>
          You answer one question at a time, each timed from the moment it appears. Your teacher puts
          each question on your screen: submit your answer, then wait for the next one. You cannot go
          back to a question once you have submitted it, and there is no set number of questions.
        </p>
      )}
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

/* ------------------------------------------------------------- waiting --- */

/**
 * Between questions, while the test is live: the usual state since the teacher
 * shows every question (0057). It is also where the student lands after
 * pressing Start, before the first one.
 *
 * Only that, on purpose. The questions they have already answered are not
 * listed here: mid-test that is a page of things they cannot change, and
 * reading back over them is not the lesson. They get the whole test back once
 * it is over (Finished). The next question replaces this the moment the
 * teacher shows it, since the screen keeps looking for it.
 */
function WaitingForTeacher({ first }: { first: boolean }) {
  return (
    <div className="exam-wait">
      <div className="ring" aria-hidden="true" />
      <h2>Waiting for your teacher</h2>
      <p>
        {first
          ? 'Your teacher is choosing your first question. It will appear here in a moment.'
          : 'Your answer has been sent. Your teacher is choosing the next question — it will appear here in a moment.'}
      </p>
    </div>
  )
}

/**
 * A targeted test between two questions: only ever for the moment it takes
 * the next one to arrive, since the server puts it up as the last one ends.
 */
function NextComing() {
  return (
    <div className="exam-wait">
      <div className="ring" aria-hidden="true" />
      <h2>Next question</h2>
      <p>It will appear here in a moment.</p>
    </div>
  )
}

/* ------------------------------------------------------------ finished --- */

/**
 * The end: the test is over, and something was answered.
 *
 * Every question as they met it — stimulus, stem, all four choices — with what
 * they picked and, once the teacher has published the results, which one was
 * right and why. A list of stems and letters told a student nothing they could
 * learn from.
 *
 * The key is not in the student's reach (question_keys is teacher-only), so it
 * comes from what the reveal copied onto the item itself.
 */
function Finished({ items, targeted }: { items: SessionItem[]; targeted: TargetedInfo | null }) {
  // 1, 2, 3 over the questions they actually worked on — a question the
  // teacher set aside is not one of them and takes no number.
  const numbers = useMemo(() => askNumbers(items), [items])
  const revealed = items.filter((i) => i.status === 'revealed')
  const right = items.filter((i) => i.revealed_result === 'correct').length
  const out = revealed.length
  // A targeted test: what ran out of time, and what was never reached.
  const ranOut = targeted ? items.filter((i) => outcomeOf(i) === 'timed_out').length : 0
  const notReached = targeted ? Math.max(0, targeted.question_count - items.length) : 0

  return (
    <div className="exam-done">
      <div className="exam-done-head">
        {/* Not "that is the hard test". Which of the three tests a student was
            put on is the teacher's decision about them, and reading it back at
            the end tells them nothing they can do anything with. */}
        <h2>Test submitted</h2>
        <p>
          {items.length - ranOut} answered.{' '}
          {ranOut > 0 && `${ranOut} ran out of time. `}
          {notReached > 0 && `${notReached} not reached. `}
          {out === 0
            ? 'Your teacher will go through it with you — your results appear here when they do.'
            : `You got ${right} of ${out} right.`}
        </p>
      </div>

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
                ) : outcomeOf(it) === 'timed_out' ? (
                  <span className="badge badge-neutral">Time ran out</span>
                ) : (
                  <span className="badge badge-neutral">Answered</span>
                )
              }
              footer={
                <Explanation
                  text={it.revealed_explanation}
                  math={it.questions?.subject === 'mathematics'}
                  title="Why"
                />
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
  gateway,
  onChanged,
  countdown = null,
}: {
  item: SessionItem
  /** Where this question came in the session, counting only what was worked. */
  number: number
  gateway: SessionGateway
  onChanged: () => Promise<void>
  /**
   * A targeted test's clock on this question — whichever of its own and the
   * test's runs out first — counted down in server time. Null in a lesson,
   * where the clock counts up.
   */
  countdown?: { endsAt: number; which: 'question' | 'overall'; offset: number } | null
}) {
  const [selected, setSelected] = useState<OptionLabel | null>(item.selected_option)
  const [struck, setStruck] = useState<OptionLabel[]>(item.eliminated_options ?? [])
  const [crossoutOn, setCrossoutOn] = useState(false)
  const [confidence, setConfidence] = useState<number | null>(item.student_confidence)
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)

  const math = item.questions?.subject === 'mathematics'
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
   * showed nothing at all until the answer was sent — so "you've gone for B, talk
   * me through it" needed a screen share, which is the thing that keeps
   * failing. It is a draft, not an answer: the item stays published and
   * nothing is graded. The first answer in it does stop the clock (0050), the
   * same as the call below.
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

  // The clock measures answering the question, which ends when an answer is
  // picked. Not when the confidence is in as well: how sure they are is asked
  // about the answer once there is one, and the seconds spent on it are not
  // seconds spent answering (0050). Nor when the button is found. The server is
  // told the moment it happens, so the number in the report is the number the
  // student watched stop.
  //
  // And it stays stopped. Picking something else, or crossing the pick out, is
  // a change of mind about an answer that has already been timed; a clock that
  // started again would be one the student could run by clicking around.
  const [stopped, setStopped] = useState(item.decided_at !== null)
  useEffect(() => {
    if (stopped || selected === null) return
    setStopped(true)
    void gateway.markDecided(item.id)
  }, [stopped, selected, gateway, item.id])

  // The time is up: say so, and the server moves on if it agrees. If it does
  // not yet — the browser's clock a moment ahead — the reload after a short
  // wait finds it moved, since every read expires what is overdue.
  const [timeUp, setTimeUp] = useState(false)
  const onTimeUp = useCallback(async () => {
    setTimeUp(true)
    const moved = await gateway.advance(item.id).catch(() => false)
    await onChanged()
    if (!moved) later(onChanged)
  }, [gateway, item.id, onChanged])

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
    // Answering puts nothing else up (0057): the reload brings the wait for the
    // teacher's next question, or that question if it is already up.
    await onChanged()
    setBusy(false)
  }, [selected, struck, confidence, gateway, item.id, onChanged])

  return (
    <div className="exam-body">
      {/* The figure as well as the passage. Nine of the mathematics questions
          are a picture rather than a paragraph (0041), and this pane used to
          show only the text — so a student was told a question "stands on its
          own" while the graph it asked about was on every screen but theirs. */}
      <section className="exam-stimulus">
        {item.questions?.passage ? (
          <Passage
            body={item.questions.passage}
            underline={item.questions.passage_underline}
            className="stim"
            math={math}
          />
        ) : item.questions?.image_url ? null : (
          <p className="stim-empty">This question stands on its own — read it on the right.</p>
        )}
        {item.questions?.image_url && (
          <img className="stim-figure" src={item.questions.image_url} alt="Figure for this question" />
        )}
      </section>

      <section className="exam-question">
        <div className="exam-qhead">
          <span className="qn">{String(number).padStart(2, '0')}</span>
          <span className="spring" />
          {countdown ? (
            <TimeLeft endsAt={countdown.endsAt} offset={countdown.offset} onZero={() => void onTimeUp()} />
          ) : (
            <QuestionClock itemId={item.id} running={!stopped} />
          )}
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

        <h2 className="exam-stem">
          <MathText text={item.questions?.stem} math={math} />
        </h2>

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
                  disabled={busy || timeUp}
                  onClick={() => {
                    if (isStruck) setStruck((p) => p.filter((l) => l !== o.label))
                    setSelected(o.label)
                  }}
                >
                  <span className="lab">{o.label}</span>
                  <span className="body">
                    <MathText text={o.body} math={math} />
                  </span>
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
            disabled={!selected || busy || timeUp}
            onClick={() => void submit()}
          >
            {/* Submit, not Next: sending an answer does not move the student
                on. The teacher shows the next question (0057), and ends the
                test when it is done — how many there are is up to them. */}
            {timeUp ? 'Time is up' : busy ? 'Sending…' : !selected ? 'Pick an answer' : 'Submit answer'}
          </button>
          <p className="exam-lock">You cannot come back to a question once you have submitted it.</p>
        </div>
      </section>
    </div>
  )
}

/**
 * The clock on this question. It starts when the question appears and stops
 * when an answer is picked — which is exactly the interval the server records
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

/** Runs `fn` after the server's grace on a clock has passed (0062: 2 s). */
function later(fn: () => Promise<void> | void) {
  setTimeout(() => void fn(), 2500)
}

/**
 * A targeted test's clock, counting down to `endsAt` in server time. Calls
 * `onZero` once when it reaches zero. The last ten seconds are marked.
 */
function TimeLeft({
  endsAt,
  offset,
  onZero,
}: {
  endsAt: number
  offset: number
  onZero?: () => void
}) {
  const [now, setNow] = useState(() => Date.now())
  useEffect(() => {
    const t = setInterval(() => setNow(Date.now()), 250)
    return () => clearInterval(t)
  }, [])

  const left = secondsLeft(endsAt, now, offset) ?? 0
  const fired = useRef(false)
  useEffect(() => {
    fired.current = false
  }, [endsAt])
  useEffect(() => {
    if (left > 0 || fired.current || !onZero) return
    fired.current = true
    onZero()
  }, [left, onZero])

  return (
    <span className={`q-clock ${left <= 10 ? 'low' : ''}`} aria-live="off">
      <IconClock /> {clock(Math.ceil(left))}
    </span>
  )
}
