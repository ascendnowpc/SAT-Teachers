import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { IconBack, IconCheck, IconCross, IconVideo } from '../components/icons'
import { Notice, Passage, Textarea } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import { OPTION_LABELS, subjectLabel } from '../lib/constants'
import { supabase } from '../lib/supabase'
import type { OptionLabel, SessionItem } from '../lib/types'

/**
 * The student's screen, in the shape of the test they are actually sitting:
 * stimulus on the left, question and choices on the right, the question number
 * and a Next control along the bottom.
 *
 * The teacher can hand over one question at a time or publish a whole pre-test.
 * Both land here — with one open question this is a single card, and with
 * twenty it becomes a paper the student walks through. That is the only
 * difference, so there is one screen rather than two.
 */
export function StudentStage({ sessionId }: { sessionId: string }) {
  const { session, items, loading, error, reload } = useLiveSession(sessionId, {
    withAssessments: false,
  })
  const [cursor, setCursor] = useState<number | null>(null)

  // Everything the student may look at: open questions, plus anything already
  // answered or gone through, so they can page back over the paper.
  const visible = useMemo(
    () => items.filter((i) => i.status !== 'staged' && i.status !== 'voided'),
    [items],
  )

  const firstUnanswered = visible.findIndex((i) => i.status === 'published')
  // Follow the paper until the student takes over, then leave them where they are.
  const index = cursor ?? (firstUnanswered === -1 ? Math.max(0, visible.length - 1) : firstUnanswered)
  const current = visible[index] ?? null

  const answered = visible.filter((i) => i.status === 'revealed').length
  const correct = visible.filter((i) => i.revealed_result === 'correct').length

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  const waiting =
    session.status === 'scheduled'
      ? {
          title: 'Not started yet',
          body: `Your session begins at ${new Date(session.scheduled_at).toLocaleString(undefined, {
            day: 'numeric',
            month: 'short',
            hour: 'numeric',
            minute: '2-digit',
          })}. This page will update on its own when your teacher starts.`,
        }
      : session.status === 'completed' && visible.length === 0
        ? { title: 'Session finished', body: 'This session has ended.' }
        : visible.length === 0
          ? {
              title: 'Waiting for your teacher',
              body: 'Your questions will appear here as soon as they are sent to you.',
            }
          : null

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

        <ExamClock startedAt={session.started_at} live={session.status === 'live'} />

        <div className="exam-actions">
          {answered > 0 && (
            <span className="exam-score">
              {correct} of {answered} right
            </span>
          )}
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

      {waiting ? (
        <div className="exam-wait">
          <div className="ring" aria-hidden="true" />
          <h2>{waiting.title}</h2>
          <p>{waiting.body}</p>
        </div>
      ) : (
        current && <ItemPane key={current.id} item={current} onChanged={reload} />
      )}

      {visible.length > 0 && !waiting && (
        <footer className="exam-foot">
          <button
            type="button"
            className="btn btn-ghost"
            disabled={index === 0}
            onClick={() => setCursor(index - 1)}
          >
            Back
          </button>

          <ProgressPicker
            items={visible}
            index={index}
            onPick={(i) => setCursor(i)}
          />

          <button
            type="button"
            className="btn btn-primary"
            disabled={index >= visible.length - 1}
            onClick={() => setCursor(index + 1)}
          >
            Next
          </button>
        </footer>
      )}
    </div>
  )
}

/** Time on the whole session, which is the clock the real test shows. */
function ExamClock({ startedAt, live }: { startedAt: string | null; live: boolean }) {
  const [shown, setShown] = useState(true)
  const [now, setNow] = useState(() => Date.now())

  useEffect(() => {
    if (!live) return
    const t = setInterval(() => setNow(Date.now()), 1000)
    return () => clearInterval(t)
  }, [live])

  if (!startedAt) return <div className="exam-clock" />

  const seconds = Math.max(0, Math.floor((now - new Date(startedAt).getTime()) / 1000))
  const m = Math.floor(seconds / 60)

  return (
    <div className="exam-clock">
      <div className="t" aria-live="off">
        {shown ? `${m}:${String(seconds % 60).padStart(2, '0')}` : '—:—'}
      </div>
      <button type="button" className="pill" onClick={() => setShown((v) => !v)}>
        {shown ? 'Hide' : 'Show'}
      </button>
    </div>
  )
}

function ProgressPicker({
  items,
  index,
  onPick,
}: {
  items: SessionItem[]
  index: number
  onPick: (i: number) => void
}) {
  const [open, setOpen] = useState(false)

  return (
    <div className="exam-progress">
      <button type="button" className="exam-progress-btn" onClick={() => setOpen((v) => !v)}>
        Question {String(index + 1).padStart(2, '0')} out of {items.length}
        <span className={`caret ${open ? 'up' : ''}`} aria-hidden="true" />
      </button>

      {open && (
        <div className="exam-grid" role="listbox">
          {items.map((it, i) => {
            const done = it.status === 'answered' || it.status === 'revealed'
            return (
              <button
                key={it.id}
                type="button"
                role="option"
                aria-selected={i === index}
                className={`sq ${i === index ? 'here' : ''} ${done ? 'done' : ''} ${it.marked_for_review ? 'marked' : ''}`}
                onClick={() => {
                  onPick(i)
                  setOpen(false)
                }}
              >
                {i + 1}
              </button>
            )
          })}
        </div>
      )}
    </div>
  )
}

function ItemPane({ item, onChanged }: { item: SessionItem; onChanged: () => Promise<void> }) {
  const [selected, setSelected] = useState<OptionLabel | null>(item.selected_option)
  const [struck, setStruck] = useState<OptionLabel[]>(item.eliminated_options ?? [])
  const [crossoutOn, setCrossoutOn] = useState(false)
  const [marked, setMarked] = useState(item.marked_for_review)
  const [confidence, setConfidence] = useState<number | null>(item.student_confidence)
  const [reasoning, setReasoning] = useState(item.student_reasoning ?? '')
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)

  const open = item.status === 'published'
  const revealed = item.status === 'revealed'

  const options = useMemo(
    () =>
      [...(item.questions?.question_options ?? [])].sort(
        (a, b) => OPTION_LABELS.indexOf(a.label) - OPTION_LABELS.indexOf(b.label),
      ),
    [item.questions],
  )

  // Tell the server the question is actually on screen, so time-on-question
  // measures reading rather than however long the teacher took to publish.
  const viewed = useRef(false)
  useEffect(() => {
    if (!open || viewed.current) return
    viewed.current = true
    void supabase.rpc('mark_item_viewed', { p_item: item.id })
  }, [open, item.id])

  const toggleMark = useCallback(async () => {
    const next = !marked
    setMarked(next)
    await supabase.rpc('set_marked_for_review', { p_item: item.id, p_marked: next })
  }, [marked, item.id])

  function toggleStrike(label: OptionLabel) {
    setStruck((prev) => (prev.includes(label) ? prev.filter((l) => l !== label) : [...prev, label]))
    if (selected === label) setSelected(null)
  }

  async function submit() {
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
    await onChanged()
    setBusy(false)
  }

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
          <button
            type="button"
            className={`mark ${marked ? 'on' : ''}`}
            onClick={() => void toggleMark()}
            disabled={!open}
            aria-pressed={marked}
          >
            <BookmarkIcon filled={marked} /> Mark for Review
          </button>
          <span className="spring" />
          <button
            type="button"
            className={`abc ${crossoutOn ? 'on' : ''}`}
            onClick={() => setCrossoutOn((v) => !v)}
            disabled={!open}
            aria-pressed={crossoutOn}
            title="Cross out answers"
          >
            <s>ABC</s>
          </button>
        </div>

        {err && <Notice kind="error">{err}</Notice>}

        {revealed && (
          <div className={`verdict ${item.revealed_result === 'correct' ? 'ok' : 'bad'}`}>
            <span className="icon">
              {item.revealed_result === 'correct' ? <IconCheck /> : <IconCross />}
            </span>
            <span>
              <span className="t">
                {item.revealed_result === 'correct' ? 'That was right' : 'That one was wrong'}
              </span>
              {item.revealed_explanation && <span className="s">{item.revealed_explanation}</span>}
            </span>
          </div>
        )}

        <h2 className="exam-stem">{item.questions?.stem}</h2>

        <div className="exam-choices">
          {options.map((o) => {
            const isStruck = struck.includes(o.label)
            const isSel = selected === o.label
            const wasChosen = item.selected_option === o.label
            const isKey = revealed && item.revealed_correct_option === o.label
            let state = ''
            if (isKey) state = 'right'
            else if (revealed && wasChosen) state = 'wrong'
            else if (isSel) state = 'selected'

            return (
              <div key={o.id} className={`ch ${state} ${isStruck && !revealed ? 'struck' : ''}`}>
                <button
                  type="button"
                  className="ch-main"
                  disabled={!open}
                  onClick={() => {
                    if (isStruck) setStruck((p) => p.filter((l) => l !== o.label))
                    setSelected(o.label)
                  }}
                >
                  <span className="lab">{o.label}</span>
                  <span className="body">{o.body}</span>
                  {revealed && (isKey || wasChosen) && (
                    <span className="mark-note">{isKey ? 'Correct answer' : 'You picked this'}</span>
                  )}
                </button>
                {open && crossoutOn && (
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

        {open && (
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
              {busy ? 'Sending…' : selected ? `Submit answer ${selected}` : 'Pick an answer'}
            </button>
          </div>
        )}

        {item.status === 'answered' && <p className="exam-sent">Answer sent.</p>}
      </section>
    </div>
  )
}

function BookmarkIcon({ filled }: { filled: boolean }) {
  return (
    <svg width="15" height="15" viewBox="0 0 24 24" fill={filled ? 'currentColor' : 'none'}
      stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"
      aria-hidden="true">
      <path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z" />
    </svg>
  )
}
