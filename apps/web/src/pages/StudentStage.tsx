import { useEffect, useMemo, useRef, useState } from 'react'
import { Link } from 'react-router-dom'
import { IconBack, IconCheck, IconCross, IconVideo } from '../components/icons'
import { Notice, Passage, Textarea } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import { OPTION_LABELS, subjectLabel } from '../lib/constants'
import { supabase } from '../lib/supabase'
import type { OptionLabel, SessionItem } from '../lib/types'
import { StatusBadge } from './Sessions'

export function StudentStage({ sessionId }: { sessionId: string }) {
  const { session, items, loading, error, reload } = useLiveSession(sessionId, {
    withAssessments: false,
  })

  if (loading) return <div className="page">Loading…</div>
  if (!session) return <div className="page">Session not found.</div>

  // The teacher publishes one at a time; the newest un-finished item is the
  // one on screen. Anything already revealed stays readable underneath.
  const current =
    items.find((i) => i.status === 'published') ??
    items.find((i) => i.status === 'answered') ??
    items.filter((i) => i.status === 'revealed').slice(-1)[0] ??
    null

  const answered = items.filter((i) => i.status === 'revealed').length
  const correct = items.filter((i) => i.revealed_result === 'correct').length

  return (
    <div className="page">
      <Link className="back-link" to="/sessions">
        <IconBack /> Sessions
      </Link>

      <div className="room-head">
        <div>
          <h1>{session.title || `${subjectLabel(session.subject)} session`}</h1>
          <div className="meta">
            with {session.teacher?.full_name}
            {answered > 0 && ` · ${correct} of ${answered} correct so far`}
          </div>
        </div>
        <div className="spring" />
        <StatusBadge status={session.status} />
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

      {error && <Notice kind="error">{error}</Notice>}

      <div className="stage">
        {session.status === 'scheduled' && (
          <Waiting
            title="Not started yet"
            body={`Your session begins at ${new Date(session.scheduled_at).toLocaleString(undefined, {
              day: 'numeric',
              month: 'short',
              hour: 'numeric',
              minute: '2-digit',
            })}. This page will update on its own when your teacher starts.`}
          />
        )}

        {session.status === 'completed' && (
          <Waiting
            title="Session finished"
            body={
              answered > 0
                ? `You answered ${answered} question${answered === 1 ? '' : 's'} and got ${correct} right.`
                : 'This session has ended.'
            }
          />
        )}

        {session.status === 'live' && !current && (
          <Waiting
            title="Waiting for your teacher"
            body="The next question will appear here as soon as it is sent to you."
          />
        )}

        {session.status !== 'completed' && current && (
          <ItemCard key={current.id} item={current} onChanged={reload} />
        )}
      </div>
    </div>
  )
}

function Waiting({ title, body }: { title: string; body: string }) {
  return (
    <div className="stage-card">
      <div className="stage-wait">
        <div className="ring" aria-hidden="true" />
        <h2>{title}</h2>
        <p>{body}</p>
      </div>
    </div>
  )
}

function ItemCard({ item, onChanged }: { item: SessionItem; onChanged: () => Promise<void> }) {
  const [selected, setSelected] = useState<OptionLabel | null>(item.selected_option)
  const [struck, setStruck] = useState<OptionLabel[]>(item.eliminated_options ?? [])
  const [confidence, setConfidence] = useState<number | null>(item.student_confidence)
  const [reasoning, setReasoning] = useState(item.student_reasoning ?? '')
  const [busy, setBusy] = useState(false)
  const [err, setErr] = useState<string | null>(null)
  const [elapsed, setElapsed] = useState(0)

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
  const marked = useRef(false)
  useEffect(() => {
    if (!open || marked.current) return
    marked.current = true
    void supabase.rpc('mark_item_viewed', { p_item: item.id })
  }, [open, item.id])

  useEffect(() => {
    if (!open) return
    const started = Date.now()
    const t = setInterval(() => setElapsed(Math.floor((Date.now() - started) / 1000)), 1000)
    return () => clearInterval(t)
  }, [open])

  function toggleStrike(label: OptionLabel) {
    setStruck((prev) =>
      prev.includes(label) ? prev.filter((l) => l !== label) : [...prev, label],
    )
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
    <div className="stage-card">
      <div className="stage-top">
        <span className="n">{item.sequence_no}</span>
        <span className="spring" />
        {open && <span className="timer">{formatTime(elapsed)}</span>}
        {item.status === 'answered' && <span className="badge badge-neutral">Answer sent</span>}
        {revealed &&
          (item.revealed_result === 'correct' ? (
            <span className="badge badge-ok">Correct</span>
          ) : (
            <span className="badge badge-bad">Not quite</span>
          ))}
      </div>

      <div className="stage-inner">
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

        {item.questions?.passage && (
          <Passage
            body={item.questions.passage}
            underline={item.questions.passage_underline}
            className="stage-passage"
          />
        )}
        <div className="stage-stem">{item.questions?.stem}</div>

        <div className="choices">
          {options.map((o) => {
            const isStruck = struck.includes(o.label)
            const isSel = selected === o.label
            const wasChosen = item.selected_option === o.label
            const isKey = revealed && item.revealed_correct_option === o.label
            let state = ''
            // After the reveal, mark the right answer green and — when they
            // differ — the student's pick red, so the gap is visible at a glance.
            if (isKey) state = 'right'
            else if (revealed && wasChosen) state = 'wrong'
            else if (isSel) state = 'selected'

            return (
              <div
                key={o.id}
                className={`choice ${state} ${isStruck && !revealed ? 'struck' : ''}`}
              >
                <button
                  type="button"
                  className="choice-main"
                  disabled={!open}
                  onClick={() => {
                    if (isStruck) setStruck((p) => p.filter((l) => l !== o.label))
                    setSelected(o.label)
                  }}
                >
                  <span className="lab">{o.label}</span>
                  <span>{o.body}</span>
                  {revealed && (isKey || wasChosen) && (
                    <span className="mark-note">
                      {isKey ? 'Correct answer' : 'You picked this'}
                    </span>
                  )}
                </button>
                {open && (
                  <button
                    type="button"
                    className={`strike ${isStruck ? 'on' : ''}`}
                    onClick={() => toggleStrike(o.label)}
                    aria-pressed={isStruck}
                    aria-label={`${isStruck ? 'Restore' : 'Cross out'} option ${o.label}`}
                    title="Cross out"
                  >
                    <s>ABC</s>
                  </button>
                )}
              </div>
            )
          })}
        </div>

        {open && (
          <>
            <div style={{ marginTop: 24 }}>
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

            <div style={{ marginTop: 18 }}>
              <div className="section-title">Why did you pick it?</div>
              <Textarea
                rows={2}
                value={reasoning}
                onChange={(e) => setReasoning(e.target.value)}
                placeholder="Optional — one line on how you got there."
                aria-label="Why did you pick it?"
              />
            </div>

            <button
              type="button"
              className="btn btn-primary btn-lg btn-block"
              style={{ marginTop: 20 }}
              disabled={!selected || busy}
              onClick={() => void submit()}
            >
              {busy ? 'Sending…' : selected ? `Submit answer ${selected}` : 'Pick an answer'}
            </button>
          </>
        )}

        {item.status === 'answered' && (
          <p
            style={{
              marginTop: 20,
              color: 'var(--muted)',
              fontSize: 14,
              fontWeight: 300,
              textAlign: 'center',
            }}
          >
            Answer sent. Your teacher will go through it with you.
          </p>
        )}
      </div>
    </div>
  )
}

function formatTime(s: number): string {
  const m = Math.floor(s / 60)
  return `${m}:${String(s % 60).padStart(2, '0')}`
}
