import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { IconBack, IconClock, IconVideo } from '../components/icons'
import { QuestionView } from '../components/QuestionView'
import { Notice, Passage } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import { clock, openState } from '../lib/countdown'
import { formatUtcLong } from '../lib/time'
import { OPTION_LABELS, subjectLabel } from '../lib/constants'
import { supabase } from '../lib/supabase'
import type { OptionLabel, Session, SessionItem } from '../lib/types'

/**
 * The student's screen: a lobby, then the paper, one question at a time.
 *
 * At the scheduled time the student opens the session themselves, and from
 * then on exactly one question is in front of them — and it is there because
 * the server published it, not because this screen decided to show it. Which
 * is what makes the clock on each question honest: there is no way to read
 * ahead while it runs.
 *
 * What arrives next depends on how the session is paced. Left to the paper,
 * the next question comes the moment this one is answered. Paced by the
 * teacher, it comes when the teacher sends it — so between questions there is
 * a hold, and the hold is part of the test rather than a break from it: the
 * screen stays full and leaving it still ends the paper.
 */
export function StudentStage({ sessionId }: { sessionId: string }) {
  const { session, items, loading, error, reload } = useLiveSession(sessionId, {
    withAssessments: false,
  })

  const navigate = useNavigate()
  const [leaving, setLeaving] = useState(false)
  const [ending, setEnding] = useState(false)

  const open = useMemo(() => items.find((i) => i.status === 'published') ?? null, [items])
  // In the order they were asked, which under teacher pacing is not the order
  // the paper holds them in.
  const done = useMemo(
    () =>
      items
        .filter((i) => i.status === 'answered' || i.status === 'revealed')
        .sort((a, b) => (a.asked_no ?? a.sequence_no) - (b.asked_no ?? b.sequence_no)),
    [items],
  )

  const over = session?.status === 'completed' || session?.status === 'cancelled'
  // Under teacher pacing the paper is a pool the teacher draws from, not a
  // queue the student walks.
  const teacherLed = session?.pacing === 'teacher'
  // Live, teacher-paced, and nothing on screen: the teacher is choosing what to
  // ask next. That is a state of the test, not the end of it — which is why it
  // counts as being in the paper below.
  const holding = teacherLed && !over && open === null && session?.status === 'live'

  // A paper in progress is not a page you can wander off. The browser's own
  // back button and a refresh are both caught: back is turned into the same
  // question the screen already asks, and a refresh gets the browser's warning.
  // The wait between questions is in progress too: a hold the student could
  // walk out of and walk back into is not a held test.
  const inProgress = open !== null || holding
  const [outOfFullscreen, setOutOfFullscreen] = useState(false)

  // Full screen is asked for when the paper opens and watched while it is
  // open. It cannot be forced — every browser lets Escape out, and should —
  // so leaving it is treated as what it is: the student is somewhere else, and
  // is asked to come back or to finish.
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

  // They are not told the paper's length under teacher pacing, because how much
  // of it they will be asked is not decided yet.
  const total = teacherLed ? null : Math.max(session.question_count, items.length)
  // The order questions actually arrived in. Under teacher pacing that is not
  // their place in the paper — question 11 may come before question 4, and
  // question 4 may never come at all.
  const number = open ? (open.asked_no ?? open.sequence_no) : done.length

  const finished = !open && !holding && done.length > 0
  // Nothing open and nothing answered means the paper is still waiting to be
  // started — whether or not the teacher has already flipped the session live.
  // Keying this off the status alone stranded a student on a live session with
  // a full queue and no way to open it.
  const waiting = !open && !holding && !finished && !over

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
            <strong>{subjectLabel(session.subject)}</strong>
          </span>
        </div>

        {open && (total === null ? number > 0 : total > 0) && (
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
              {open
                ? `This is a test, so it runs full screen. Your clock is still running on question ${number}.`
                : 'This is a test, so it runs full screen. Your teacher is choosing your next question — go back in and it will appear.'}
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
              {total === null ? (
                <>
                  Your test will be submitted as it stands, with the {done.length} question
                  {done.length === 1 ? '' : 's'} you have answered. Your teacher cannot send you any
                  more once you leave, and you cannot come back.
                </>
              ) : (
                <>
                  Your test will be submitted as it stands. The {total - done.length} question
                  {total - done.length === 1 ? '' : 's'} you have not answered will be marked as not
                  attempted, and you cannot come back to them.
                </>
              )}
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
              <button
                type="button"
                className="btn"
                disabled={ending}
                onClick={() => void leave()}
              >
                {ending ? 'Submitting…' : 'Submit and leave'}
              </button>
            </div>
          </div>
        </div>
      )}

      {open ? (
        <ItemPane key={open.id} item={open} number={number} total={total} onChanged={reload} />
      ) : holding ? (
        <Holding session={session} answered={done.length} />
      ) : waiting ? (
        <Lobby session={session} onStarted={reload} />
      ) : finished ? (
        <Finished items={done} />
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

/* ------------------------------------------------------------- holding --- */

/**
 * Between questions, when the teacher is choosing the next one.
 *
 * It says nothing about what is coming, because the student is not supposed to
 * know and the screen genuinely does not: nothing is published, so under RLS
 * there is nothing here to leak. What it does say is that the wait is normal
 * and that the next question arrives on its own — a student who thinks the
 * page has hung starts reloading it, and a reload during a paper is the one
 * thing this screen spends its effort preventing.
 */
function Holding({ session, answered }: { session: Session; answered: number }) {
  const teacher = session.teacher?.full_name?.split(' ')[0] ?? 'Your teacher'

  return (
    <div className="exam-wait">
      <div className="ring" aria-hidden="true" />
      <h2>{answered === 0 ? 'Your teacher is starting you off' : 'Hold on a moment'}</h2>
      <p>
        {answered === 0
          ? `${teacher} chooses each question in this session. The first one appears here as soon as they send it.`
          : `That one is in. ${teacher} is choosing what to ask next — it appears here on its own, so stay on this screen.`}
      </p>
      {answered > 0 && (
        <p className="exam-when">
          {answered} question{answered === 1 ? '' : 's'} answered
        </p>
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

  const empty = session.question_count === 0
  const teacherLed = session.pacing === 'teacher'

  return (
    <div className="exam-wait">
      <div className="ring" aria-hidden="true" />
      <h2>{empty ? 'Nothing to answer yet' : state.open ? 'Ready when you are' : 'Not open yet'}</h2>
      <p>
        {empty ? (
          'Your teacher has not put any questions in this session yet. This page will update on its own once they do.'
        ) : teacherLed ? (
          <>
            Your teacher chooses each question and sends it to you one at a time. Each one is timed
            from the moment it appears, and between them you wait on this screen. Once you submit an
            answer you cannot go back to it.
          </>
        ) : (
          <>
            {session.question_count} question{session.question_count === 1 ? '' : 's'}. You answer
            them one at a time, and each one is timed from the moment it appears. Once you submit an
            answer you move on to the next.
          </>
        )}
      </p>
      <p className="exam-when">
        {formatUtcLong(session.scheduled_at)} — {state.label}
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

/**
 * The paper, afterwards.
 *
 * Every question as they met it — stimulus, stem, all four choices — with what
 * they picked and, once the teacher has published the results, which one was
 * right and why. A list of stems and letters told a student nothing they could
 * learn from; going back over the question is the point of going back at all.
 *
 * The key is not in the student's reach (question_keys is teacher-only), so it
 * comes from what the reveal copied onto the item itself.
 */
function Finished({ items }: { items: SessionItem[] }) {
  const revealed = items.filter((i) => i.status === 'revealed')
  const right = items.filter((i) => i.revealed_result === 'correct').length
  const out = revealed.length

  return (
    <div className="exam-done">
      <div className="exam-done-head">
        <h2>That is the whole paper</h2>
        <p>
          {items.length} answered.{' '}
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
              number={String(it.asked_no ?? it.sequence_no)}
              showKey={it.status === 'revealed'}
              correct={it.revealed_correct_option}
              chosen={it.selected_option}
              header={
                it.status === 'revealed' ? (
                  <span className={`badge ${it.revealed_result === 'correct' ? 'badge-ok' : 'badge-bad'}`}>
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
  onChanged,
}: {
  item: SessionItem
  /** Where this question came in the session, which is not always its place in the paper. */
  number: number
  /** How long the paper is, or null when the teacher is choosing and it is not the student's to know. */
  total: number | null
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
