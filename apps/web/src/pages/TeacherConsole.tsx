import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { AfterTheTest } from '../components/AfterTheTest'
import { IconBack, IconClock, IconVideo } from '../components/icons'
import { QuestionView } from '../components/QuestionView'
import { CopyButton, DifficultyBadge, Notice, Passage } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import {
  DIAGNOSES,
  LEVELS,
  OPTION_LABELS,
  diagnosisLabel,
  levelLabel,
  sectionLabel,
  skillLabel,
  subjectLabel,
  suggestNext,
} from '../lib/constants'
import { clock, workedFor } from '../lib/countdown'
import { askNumbers, askOrder } from '../lib/report'
import { studentLink } from '../lib/sessions'
import { supabase } from '../lib/supabase'
import { formatUtc } from '../lib/time'
import type {
  Diagnosis,
  OptionLabel,
  Session,
  SessionItem,
  SessionLevel,
} from '../lib/types'
import { StatusBadge } from './Sessions'

/**
 * The student's 1-3 confidence, in the words they were actually offered.
 *
 * The board used to abbreviate these to low/med/high, which is a scale nobody
 * chose from — the student picked "Fairly sure", so that is what the teacher
 * should read next to their answer.
 */
const CONFIDENCE = ['Not sure', 'Fairly sure', 'Certain']

/**
 * The clock the student is watching.
 *
 * It runs while the question is open and they have not settled, and stops at
 * exactly the moment the server records as elapsed_seconds — so the number
 * here is the number in the report, not an approximation of it.
 */
function LiveClock({ item }: { item: SessionItem }) {
  const [now, setNow] = useState(() => Date.now())
  const running = item.status === 'published' && item.decided_at === null

  useEffect(() => {
    if (!running) return
    const t = setInterval(() => setNow(Date.now()), 1000)
    return () => clearInterval(t)
  }, [running])

  const seconds = workedFor(item, now)
  if (seconds === null) return <span className="dash">—</span>
  return (
    <span className={`q-clock ${running ? '' : 'stopped'}`}>
      <IconClock /> {clock(seconds)}
    </span>
  )
}

/**
 * The teacher's side of a session — which is now the whole session.
 *
 * It used to be a place to watch from: the student shared their screen, worked
 * the questions, and the answers landed on the board. Every part of that
 * assumes the share works, and often it does not — a phone, a school network,
 * a browser that will not go full screen, a Zoom share that never starts. The
 * teacher was then blind and the session was stuck, because starting the test,
 * answering, moving level and handing in were all things only the student
 * could do.
 *
 * So this screen can do everything the student's screen can:
 *
 *   * see the question they are on, whole — stimulus, stem, all four choices;
 *   * enter the answer they gave out loud, which is graded and timed exactly
 *     as their own would have been;
 *   * move them between the easy, medium and hard tests;
 *   * open the test for them, and hand it in.
 *
 * And it shows the whole session rather than the level it happens to be on.
 * A student who did six easy questions and then twenty medium ones sat both,
 * and the board is grouped by test with all of it there.
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

  /**
   * The question the lesson is on.
   *
   * Whatever is open; and when nothing is — between questions, or once the
   * test is handed in — the last one they answered, so the panel does not
   * vanish at the moment the teacher wants to read the result of it. This is
   * the only place a question is shown in full, and its status is on it, so
   * "what are they doing" and "how did it go" are one glance rather than two
   * halves of the page.
   */
  const focus = useMemo(() => {
    const live = items.find((i) => i.status === 'published')
    if (live) return live
    const done = items
      .filter((i) => i.status === 'answered' || i.status === 'revealed')
      .sort((a, b) => askOrder(a) - askOrder(b))
    return done[done.length - 1] ?? null
  }, [items])

  const open = useMemo(() => items.find((i) => i.status === 'published') ?? null, [items])

  // 1, 2, 3 over the questions actually worked on. A question set aside by a
  // level switch takes no number, so nothing on this screen counts it.
  const numbers = useMemo(() => askNumbers(items), [items])

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const over = session.status === 'completed' || session.status === 'cancelled'
  // Open means the student could start right now: its time has come, or the
  // teacher waived the clock.
  const isOpen =
    new Date(session.scheduled_at).getTime() <= Date.now() || session.opened_early_at !== null
  const answered = items.filter((i) => i.status === 'answered' || i.status === 'revealed').length
  const unrevealed = items.filter((i) => i.status === 'answered').length
  const started = items.length > 0

  /**
   * The whole result, in one go. The student learns how they did when their
   * teacher says so — but that is one decision about the session, not twenty
   * decisions about twenty questions, and revealing them one at a time only
   * ever meant clicking twenty times.
   */
  async function publishResults() {
    await call('reveal_answered_items', { p_session: sessionId })
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
            <span className="num">({session.student?.display_id})</span>
            {session.student?.pc && <> · {session.student.pc}</>} ·{' '}
            {formatUtc(session.scheduled_at)}
          </div>
        </div>
        <div className="spring" />
        <StatusBadge status={session.status} />
        <div className="actions">
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
          {/* One of these at a time, never both. Before its time the useful
              move is to let the student in early; once it is open, the only
              thing left is to start it for a student who cannot. Two buttons
              side by side both read as "begin", and the difference between
              them — who does the starting — is not visible in a label. */}
          {!over && !started && !isOpen && (
            <OpenEarly session={session} busy={busy} onCall={call} />
          )}
          {!over && !started && isOpen && (
            <>
              <button
                type="button"
                className="btn btn-navy btn-sm"
                disabled={busy}
                title="Start it yourself, for a student who cannot."
                onClick={() => void call('teacher_start_session', { p_session: sessionId })}
              >
                Start it for them
              </button>
              {session.opened_early_at !== null && (
                <UndoOpenEarly session={session} busy={busy} onCall={call} />
              )}
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
          {!over && (
            <button
              type="button"
              className="btn btn-navy btn-sm"
              disabled={busy}
              title="Hands the test in: anything still open is left unattempted."
              onClick={() => void call('teacher_finish_session', { p_session: sessionId })}
            >
              End session
            </button>
          )}
        </div>
      </div>

      {error && <Notice kind="error">{error}</Notice>}
      {actionError && <Notice kind="error">{actionError}</Notice>}

      {!over && <StudentLinkCard session={session} />}

      {/* Above the board, not under it. Once the test is over, writing it up is
          the thing to do — and a teacher who has to scroll past twenty answers
          to find the button is being shown the answers instead. */}
      {over && <AfterTheTest sessionId={sessionId} session={session} items={items} />}

      {!over && (
        <LevelControl
          session={session}
          hasOpenQuestion={open !== null}
          busy={busy}
          onCall={call}
        />
      )}

      {/* The panel is for a lesson in progress — it is the question they are
          on. Once the test is handed in there is no such question, and hoisting
          the last one they answered to the top of a finished session reads as
          "this is where we are" when the answer is "nowhere, it is over". The
          board and the cards below hold all of it, that one included. */}
      {!over && focus && (
        <FocusQuestion
          item={focus}
          number={numbers.get(focus.id) ?? null}
          busy={busy}
          onCall={call}
        />
      )}

      <Board
        items={items}
        numbers={numbers}
        focusId={over ? null : (focus?.id ?? null)}
        busy={busy}
        onCall={call}
      />
    </div>
  )
}

/* ---------------------------------------------------------------- link --- */

/**
 * The student's way in, where the teacher can find it.
 *
 * A session is now sent rather than logged into, so the link is not a setting
 * tucked away somewhere — it is the thing the teacher reaches for at the top of
 * the lesson when the student says they cannot find it.
 */
function StudentLinkCard({ session }: { session: Session }) {
  const link = session.access_token ? studentLink(session.access_token) : null
  if (!link) return null

  return (
    <div className="card card-pad link-card">
      <div className="section-title">Student link</div>
      <div className="link-row">
        <code className="link-box">{link}</code>
        <CopyButton value={link} label="Copy link" className="btn btn-primary btn-sm" />
      </div>
    </div>
  )
}

/* --------------------------------------------------------------- levels --- */

/**
 * Moving the student between the three tests.
 *
 * This used to be the student's button alone, on the grounds that the teacher
 * decides out loud and whoever is nearer a mouse clicks. That holds right up
 * until the student's screen is not working, at which point there is no mouse
 * near enough and the decision has nowhere to go.
 *
 * All three levels, not just the next one up: the student's screen offers the
 * single obvious move because it is asking somebody mid-question, and this is
 * the teacher, who is making the decision rather than being handed it. "Drop
 * one level — rebuild fluency before speed" is the oldest suggestion in the
 * product and this is where it gets acted on.
 *
 * The confirmation exists for one reason — a question is open and being timed,
 * and moving level abandons it — so it says that, and it does not appear when
 * there is nothing open to abandon.
 */
function LevelControl({
  session,
  hasOpenQuestion,
  busy,
  onCall,
}: {
  session: Session
  hasOpenQuestion: boolean
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  const [asking, setAsking] = useState<SessionLevel | null>(null)

  async function move(to: SessionLevel) {
    setAsking(null)
    await onCall('set_session_level', { p_session: session.id, p_level: to })
  }

  return (
    <div className="card card-pad level-control">
      <div className="section-title">Which test</div>
      <div className="level-control-row">
        <span className="level-switch-label">
          On the <strong>{levelLabel(session.level).toLowerCase()}</strong> test
        </span>
        <span className="spring" />
        <div className="level-btns" role="group" aria-label="Move to another test">
          {LEVELS.map((l) => (
            <button
              key={l}
              type="button"
              className={`level-btn ${session.level === l ? 'on' : ''}`}
              disabled={busy || session.level === l}
              // Always asked, not only when a question is open. Moving level
              // throws away the rest of the test either way, and these three
              // buttons sit under the teacher's hand for the whole lesson.
              onClick={() => setAsking(l)}
            >
              {levelLabel(l)}
            </button>
          ))}
        </div>
      </div>

      {asking && (
        <div className="leave-veil" role="dialog" aria-modal="true" aria-labelledby="move-title">
          <div className="leave-box">
            <h2 id="move-title">Switch to the {levelLabel(asking).toLowerCase()} test?</h2>
            <p>
              {hasOpenQuestion
                ? `The question on the student's screen is set aside — it is not counted as wrong — and the rest of the ${levelLabel(session.level).toLowerCase()} test goes away.`
                : `The rest of the ${levelLabel(session.level).toLowerCase()} test goes away.`}{' '}
              They pick up the {levelLabel(asking).toLowerCase()} test at its first question they
              have not already answered.
            </p>
            <div className="leave-actions">
              <button
                type="button"
                className="btn btn-primary"
                autoFocus
                disabled={busy}
                onClick={() => void move(asking)}
              >
                Switch to {levelLabel(asking).toLowerCase()}
              </button>
              <button type="button" className="btn" disabled={busy} onClick={() => setAsking(null)}>
                Cancel
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}

/* --------------------------------------------------------------- focus --- */

/**
 * The question the lesson is on, whole, with what has happened to it.
 *
 * There used to be two of these and the teacher had to hold them together: a
 * panel at the top showing the open question, and — once it was answered — a
 * row and a card much further down carrying the result. The panel then
 * disappeared at exactly the moment it had something worth saying, and the
 * answer landed somewhere the teacher was not looking.
 *
 * So there is one panel, it does not move, and it follows the lesson: the open
 * question while there is one, the last answered question when there is not.
 * Its header carries the status — on screen, answered, right, wrong — with the
 * time and the confidence beside it, and the choices below are marked with
 * what the student picked against the key. Everything the two places used to
 * say between them is said here once.
 *
 * The answer goes on the student's item, is graded against the same key, stops
 * the same clock and opens the next question. The report cannot tell a
 * teacher-entered answer from the student's own because there is nothing to
 * tell apart — it is the student's answer, typed by whoever had a keyboard
 * that worked.
 */
function FocusQuestion({
  item,
  number,
  busy,
  onCall,
}: {
  item: SessionItem
  /** Null for a question that was set aside rather than worked on. */
  number: number | null
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  const [selected, setSelected] = useState<OptionLabel | null>(null)
  const [struck, setStruck] = useState<OptionLabel[]>([])
  const [confidence, setConfidence] = useState<number | null>(null)
  const [answering, setAnswering] = useState(false)

  const question = item.questions
  // The question did not come back with the item. Saying so beats an empty
  // page: the teacher can still see where the student is and what happened.
  if (!question) return <MissingQuestion item={item} number={number} />

  const isOpen = item.status === 'published'
  const a = item.session_item_assessments ?? null
  const options = [...(question.question_options ?? [])].sort(
    (x, y) => OPTION_LABELS.indexOf(x.label) - OPTION_LABELS.indexOf(y.label),
  )
  const key = question.question_keys?.correct_option ?? item.revealed_correct_option ?? null

  function toggleStrike(label: OptionLabel) {
    setStruck((prev) => (prev.includes(label) ? prev.filter((l) => l !== label) : [...prev, label]))
    if (selected === label) setSelected(null)
  }

  async function submit() {
    if (!selected) return
    await onCall('teacher_answer_item', {
      p_item: item.id,
      p_option: selected,
      p_eliminated: struck,
      p_confidence: confidence,
      p_reasoning: null,
    })
    setSelected(null)
    setStruck([])
    setConfidence(null)
    setAnswering(false)
  }

  return (
    <div className={`card card-pad live-q ${isOpen ? 'is-open' : ''}`}>
      <div className="step-head">
        <div className="section-title" style={{ marginBottom: 0 }}>
          Question {number ?? '—'}
        </div>
        <DifficultyBadge level={question.difficulty} />
        <ItemResult item={item} />
        {item.selected_option && (
          <span className={`pill-opt ${a ? (a.is_correct ? 'ok' : 'bad') : ''}`}>
            {item.selected_option}
          </span>
        )}
        {/* While the question is open this is a draft, not an answer: the
            student has picked it and not pressed Next. Saying so is the
            difference between "they got it wrong" and "they are about to". */}
        {isOpen && item.selected_option && <span className="muted">leaning</span>}
        <span className="spring" />
        <LiveClock item={item} />
        {item.student_confidence != null && (
          <span className="muted">{CONFIDENCE[item.student_confidence - 1]}</span>
        )}
      </div>

      <div className="live-q-body">
        <div className="live-q-stim">
          {question.passage ? (
            <Passage body={question.passage} underline={question.passage_underline} className="stim" />
          ) : (
            <p className="stim-empty">This question stands on its own.</p>
          )}
          {question.image_url && (
            <img className="stim-figure" src={question.image_url} alt="Figure for this question" />
          )}
        </div>

        <div className="live-q-main">
          <p className="qsplit-stem">{question.stem}</p>
          <div className="qsplit-choices">
            {options.map((o) => {
              const isKey = o.label === key
              // While the teacher is entering an answer the highlight is their
              // pick; once it is in, it is the student's.
              const isChosen = answering ? selected === o.label : item.selected_option === o.label
              const isStruck = answering
                ? struck.includes(o.label)
                : item.eliminated_options.includes(o.label)
              return (
                <div
                  key={o.id}
                  className={`qch ${isKey ? 'is-key' : ''} ${isChosen ? 'is-chosen' : ''} ${
                    isStruck ? 'is-struck' : ''
                  }`}
                >
                  <span className="lab">{o.label}</span>
                  <span className="body">{o.body}</span>
                  {!answering && isChosen && <span className="pick">Chose this</span>}
                  {isKey && <span className="tick">Correct</span>}
                  {answering && (
                    <span className="qch-controls">
                      <button
                        type="button"
                        className={`chip-btn ${selected === o.label ? 'on' : ''}`}
                        disabled={busy}
                        onClick={() => {
                          setStruck((prev) => prev.filter((l) => l !== o.label))
                          setSelected(o.label)
                        }}
                      >
                        They chose {o.label}
                      </button>
                      <button
                        type="button"
                        className={`chip-btn ${struck.includes(o.label) ? 'on' : ''}`}
                        disabled={busy}
                        onClick={() => toggleStrike(o.label)}
                        aria-label={`${struck.includes(o.label) ? 'Restore' : 'Cross out'} option ${o.label}`}
                      >
                        <s>{o.label}</s>
                      </button>
                    </span>
                  )}
                </div>
              )
            })}
          </div>

          {isOpen ? (
            answering ? (
              <div className="answer-for">
                <div className="section-title">How sure were they?</div>
                <div className="confidence">
                  {CONFIDENCE.map((label, i) => (
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
                <div className="step-actions">
                  <button
                    type="button"
                    className="btn btn-primary btn-sm"
                    disabled={busy || !selected}
                    onClick={() => void submit()}
                  >
                    {selected ? `Submit ${selected} for them` : 'Pick what they said'}
                  </button>
                  <button
                    type="button"
                    className="btn btn-ghost btn-sm"
                    disabled={busy}
                    onClick={() => {
                      setAnswering(false)
                      setSelected(null)
                      setStruck([])
                      setConfidence(null)
                    }}
                  >
                    Cancel
                  </button>
                </div>
              </div>
            ) : (
              <div className="step-actions">
                <button
                  type="button"
                  className="btn btn-ghost btn-sm"
                  disabled={busy}
                  // Starts from whatever the student has already picked, so
                  // confirming what they said out loud is one click.
                  onClick={() => {
                    setSelected(item.selected_option)
                    setStruck(item.eliminated_options ?? [])
                    setConfidence(item.student_confidence)
                    setAnswering(true)
                  }}
                >
                  Answer for the student
                </button>
              </div>
            )
          ) : (
            <DiagnosisPicker item={item} busy={busy} onCall={onCall} />
          )}
        </div>
      </div>
    </div>
  )
}

/**
 * Why they missed it, in one tap.
 *
 * It sits wherever the question it is about is being read — under the focused
 * question while the lesson is on it, and under its card in the history after.
 * It is the teacher's judgement and it is what the report is built out of, so
 * it is never more than one click from the question that prompted it.
 */
function DiagnosisPicker({
  item,
  busy,
  onCall,
}: {
  item: SessionItem
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  const a = item.session_item_assessments
  if (!a) return null

  const suggestion = suggestNext(a.is_correct, a.diagnosis)
  const chips = DIAGNOSES.filter(
    (d) => d.when === 'both' || (a.is_correct ? d.when === 'correct' : d.when === 'incorrect'),
  )

  return (
    <div style={{ marginTop: 14 }}>
      <div className="section-title">Diagnosis</div>
      <div className="chips">
        {chips.map((d) => (
          <button
            key={d.value}
            type="button"
            className={`chip-btn ${a.diagnosis === d.value ? 'on' : ''}`}
            disabled={busy}
            onClick={() =>
              void onCall('set_diagnosis', {
                p_item: item.id,
                p_diagnosis: a.diagnosis === d.value ? '' : (d.value as Diagnosis),
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
            <b>{diagnosisLabel(a.diagnosis)}.</b> {suggestion.text}
          </span>
        </div>
      )}
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
 * was arranged, and it stays true on the row and in the report after the
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
  const first = session.student?.full_name?.split(' ')[0] ?? 'the student'

  return (
    <button
      type="button"
      className="btn btn-primary btn-sm"
      disabled={busy}
      title={`Let ${first} start now instead of waiting for the scheduled time.`}
      onClick={() => void onCall('set_session_open_early', { p_session: session.id, p_open: true })}
    >
      Let them start now
    </button>
  )
}

/** Putting the scheduled time back, while the student has not gone in. */
function UndoOpenEarly({
  session,
  busy,
  onCall,
}: {
  session: Session
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  // Nothing to put back once its time has come on its own.
  if (new Date(session.scheduled_at).getTime() <= Date.now()) return null

  return (
    <button
      type="button"
      className="btn btn-ghost btn-sm"
      disabled={busy}
      title="Put the scheduled time back."
      onClick={() =>
        void onCall('set_session_open_early', { p_session: session.id, p_open: false })
      }
    >
      Undo early access
    </button>
  )
}

/* --------------------------------------------------------------- board --- */

interface LevelRun {
  /** Null for a question whose difficulty did not come back with it. */
  level: SessionLevel | null
  items: SessionItem[]
  answered: number
  correct: number
  /** Put in front of the student, and set aside rather than answered. */
  skipped: number
  /** Never reached them at all. Behind the switch. */
  unseen: number
}

/**
 * A question the student actually saw and did not answer.
 *
 * asked_no is stamped when a question is published, so a voided item that has
 * one was on their screen and was set aside — by a level switch, or by handing
 * the test in. A voided item without one was never put in front of them.
 *
 * Set aside is not the same as failed, and the board must not read as if it
 * were: a level switch is a decision that this question was not the one to
 * spend the lesson on, not an answer the student got wrong or ducked. So the
 * row stays — the numbers in the # column have gaps otherwise, and ask 5 and
 * ask 7 did happen — but it is marked "Skipped", never "left unanswered".
 */
function wasSeen(i: SessionItem): boolean {
  return i.status !== 'staged' && (i.status !== 'voided' || i.asked_no !== null)
}

/**
 * Every question this session put in front of the student, by test.
 *
 * The board used to show one flat list of whatever had been answered, which
 * for a session that moved levels read as one test — and the report engine,
 * the diagnostic form and the teacher's memory of the lesson all disagreed with
 * it. A student who did six easy questions and then twenty medium ones sat two
 * tests, and both of them belong here under their own heading with their own
 * score.
 *
 * Unattempted questions are behind a switch rather than in the list. Fourteen
 * "not attempted" rows bury the six that carry the lesson — but they are a
 * finding of their own when a test was abandoned two questions in, so they are
 * one click away rather than gone.
 */
function run(level: SessionLevel | null, mine: SessionItem[]): LevelRun {
  const done = mine.filter((i) => i.status === 'answered' || i.status === 'revealed')
  return {
    level,
    items: [...mine].sort((a, b) => askOrder(a) - askOrder(b)),
    answered: done.length,
    correct: done.filter(
      (i) => i.session_item_assessments?.is_correct ?? i.revealed_result === 'correct',
    ).length,
    skipped: mine.filter((i) => i.status === 'voided' && i.asked_no !== null).length,
    unseen: mine.filter((i) => !wasSeen(i)).length,
  }
}

function groupByLevel(items: SessionItem[]): LevelRun[] {
  const runs: LevelRun[] = []
  for (const level of LEVELS) {
    const mine = items.filter((i) => i.questions?.difficulty === level)
    if (mine.length > 0) runs.push(run(level, mine))
  }

  // Anything whose difficulty did not come back — an embed that failed, a
  // question a policy withheld — used to match none of the three levels and
  // fall out of the board silently, which is the same disappearing act that
  // hid a whole test before the board was grouped at all. A question the
  // student was asked is on this screen even when we cannot say which test it
  // belonged to.
  const unsorted = items.filter(
    (i) => !i.questions || !LEVELS.includes(i.questions.difficulty as SessionLevel),
  )
  if (unsorted.length > 0) runs.push(run(null, unsorted))

  return runs
}

function Board({
  items,
  numbers,
  focusId,
  busy,
  onCall,
}: {
  items: SessionItem[]
  /** Display number per item id; absent for the ones set aside. */
  numbers: Map<string, number>
  /** Shown in full above; it does not get a second card down here. */
  focusId: string | null
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  const [showUnattempted, setShowUnattempted] = useState(false)
  const runs = useMemo(() => groupByLevel(items), [items])

  // The history: every question answered before the one on screen, most
  // recent first. The focused one is not in it — it is the panel above.
  const history = useMemo(
    () =>
      items
        .filter((i) => i.status === 'answered' || i.status === 'revealed')
        .filter((i) => i.id !== focusId)
        .sort((a, b) => askOrder(b) - askOrder(a)),
    [items, focusId],
  )

  if (runs.length === 0) {
    return (
      <div className="board">
        <div className="empty">
          <h3>Nothing asked yet</h3>
          <p>Answers land here as they happen.</p>
        </div>
      </div>
    )
  }

  const totalUnseen = runs.reduce((n, r) => n + r.unseen, 0)

  return (
    <div>
      <div className="board-head">
        <div className="section-title" style={{ marginBottom: 0 }}>
          {runs.length > 1 ? `${runs.length} tests sat` : 'The test'}
        </div>
        <span className="spring" />
        {totalUnseen > 0 && (
          <label className="toggle">
            <input
              type="checkbox"
              checked={showUnattempted}
              onChange={(e) => setShowUnattempted(e.target.checked)}
            />
            Show the {totalUnseen} never reached
          </label>
        )}
      </div>

      {runs.map((run) => (
        <LevelBoard
          key={run.level}
          run={run}
          numbers={numbers}
          showUnattempted={showUnattempted}
        />
      ))}

      {history.map((it) => (
        <ItemDetail
          key={it.id}
          item={it}
          number={numbers.get(it.id) ?? null}
          busy={busy}
          onCall={onCall}
        />
      ))}
    </div>
  )
}

function LevelBoard({
  run,
  numbers,
  showUnattempted,
}: {
  run: LevelRun
  numbers: Map<string, number>
  showUnattempted: boolean
}) {
  // What the student saw is always here — including the question they were on
  // when the level moved, which carries no number in the # column because it
  // was set aside rather than worked on. What never reached them is behind the
  // switch.
  const rows = showUnattempted ? run.items : run.items.filter(wasSeen)

  return (
    <section className="board" style={{ marginBottom: 16 }}>
      <div className="board-title">
        {run.level ? (
          <>
            <DifficultyBadge level={run.level} />
            <strong>{levelLabel(run.level)} test</strong>
          </>
        ) : (
          <strong>Level not recorded</strong>
        )}
        <span className="muted">
          {run.answered} answered
          {run.answered > 0 && ` · ${run.correct} right`}
          {run.skipped > 0 && ` · ${run.skipped} skipped`}
          {run.unseen > 0 && ` · ${run.unseen} never reached`}
        </span>
      </div>

      {rows.length === 0 ? (
        <p className="board-foot">
          Nothing from this test reached the student — {run.unseen} question
          {run.unseen === 1 ? '' : 's'} were loaded and the level moved first.
        </p>
      ) : (
        <div className="board-scroll">
          <table className="board-table">
            <thead>
              <tr>
                <th>#</th>
                <th>Question</th>
                <th>Skill</th>
                <th>Answer</th>
                <th>Key</th>
                <th>Eliminated</th>
                <th>Time</th>
                <th>Confidence</th>
                <th>Result</th>
              </tr>
            </thead>
            <tbody>
              {rows.map((it) => {
                const a = it.session_item_assessments
                const isLiveRow = it.status === 'published'
                const key = it.questions?.question_keys?.correct_option ?? it.revealed_correct_option
                return (
                  <tr key={it.id} className={isLiveRow ? 'live-row' : undefined}>
                    <td className="num">
                      {numbers.get(it.id) ?? <span className="dash">—</span>}
                    </td>
                    <td style={{ maxWidth: 300 }}>{it.questions?.stem}</td>
                    <td className="cell-sub">
                      {skillLabel(it.questions?.skill ?? null) ??
                        sectionLabel(it.questions?.section ?? null) ?? <span className="dash">—</span>}
                    </td>
                    <td>
                      {it.selected_option ? (
                        <span className={`pill-opt ${a ? (a.is_correct ? 'ok' : 'bad') : ''}`}>
                          {it.selected_option}
                        </span>
                      ) : (
                        <span className="dash">—</span>
                      )}
                    </td>
                    <td className="num">{key ?? <span className="dash">—</span>}</td>
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
                      {a?.elapsed_seconds != null ? (
                        `${a.elapsed_seconds}s`
                      ) : it.status === 'published' ? (
                        <LiveClock item={it} />
                      ) : (
                        <span className="dash">—</span>
                      )}
                    </td>
                    <td className="cell-sub">
                      {it.student_confidence ? (
                        CONFIDENCE[it.student_confidence - 1]
                      ) : (
                        <span className="dash">—</span>
                      )}
                    </td>
                    <td>
                      <ItemResult item={it} />
                    </td>
                  </tr>
                )
              })}
            </tbody>
          </table>
        </div>
      )}
    </section>
  )
}

/**
 * A question whose text did not arrive.
 *
 * It should not happen, and when it does the answer is not to render nothing:
 * a question that silently vanishes from this screen is the bug the board was
 * grouped by test to stop. The row is still real, so it is still shown.
 */
function MissingQuestion({ item, number }: { item: SessionItem; number: number | null }) {
  return (
    <div className="card card-pad" style={{ marginBottom: 14 }}>
      <div className="step-head">
        <span className="pill-opt">{number ?? '—'}</span>
        <ItemResult item={item} />
        <span className="spring" />
        <span className="muted">This question could not be loaded.</span>
      </div>
    </div>
  )
}

function ItemResult({ item }: { item: SessionItem }) {
  if (item.status === 'published')
    return item.selected_option ? (
      <span className="badge badge-sky">Working — {item.selected_option}</span>
    ) : (
      <span className="badge badge-sky">On screen</span>
    )
  if (item.status === 'answered') return <span className="badge badge-neutral">Answered</span>
  if (item.status === 'staged') return <span className="badge badge-neutral">Queued</span>
  if (item.status === 'voided')
    // Two different things wear one word otherwise: a question the student was
    // working on when the level moved, and one they never saw at all. Neither
    // is "unanswered" in the sense that counts against them — the first was
    // set aside by a switch, and the switch is usually the point.
    return item.asked_no !== null ? (
      <span className="badge badge-neutral">Skipped</span>
    ) : (
      <span className="badge badge-neutral">Never reached</span>
    )
  return item.revealed_result === 'correct' ? (
    <span className="badge badge-ok">Correct</span>
  ) : (
    <span className="badge badge-bad">Wrong</span>
  )
}

/**
 * One answered question, in full, with the diagnosis under it.
 *
 * It is the same QuestionView the student's own results screen mounts, so the
 * teacher is reading the question the way the student met it rather than a
 * teacher's abbreviation of it — which matters most in the case this whole
 * screen is built for, where the teacher never saw the student's screen at all.
 */
function ItemDetail({
  item,
  number,
  busy,
  onCall,
}: {
  item: SessionItem
  /** Null for a question that was set aside rather than worked on. */
  number: number | null
  busy: boolean
  onCall: (fn: string, args: Record<string, unknown>) => Promise<void>
}) {
  const a = item.session_item_assessments
  const question = item.questions
  if (!question) return <MissingQuestion item={item} number={number} />

  return (
    <div className="card card-pad" style={{ marginBottom: 14 }}>
      <QuestionView
        question={question}
        number={number === null ? '—' : String(number)}
        chosen={item.selected_option}
        correct={question.question_keys?.correct_option ?? item.revealed_correct_option}
        header={
          <>
            <DifficultyBadge level={question.difficulty} />
            <ItemResult item={item} />
            {a?.elapsed_seconds != null && <span className="muted">{a.elapsed_seconds}s</span>}
            {item.student_confidence != null && (
              <span className="muted">{CONFIDENCE[item.student_confidence - 1]}</span>
            )}
          </>
        }
        tags={
          <>
            {sectionLabel(question.section) && (
              <span className="badge badge-neutral">{sectionLabel(question.section)}</span>
            )}
            {skillLabel(question.skill) && (
              <span className="badge badge-neutral">{skillLabel(question.skill)}</span>
            )}
          </>
        }
        footer={
          <>
            {item.student_reasoning && (
              <div className="q-note">
                <div className="section-title">Why they picked it</div>
                {item.student_reasoning}
              </div>
            )}

            <DiagnosisPicker item={item} busy={busy} onCall={onCall} />
          </>
        }
      />
    </div>
  )
}
