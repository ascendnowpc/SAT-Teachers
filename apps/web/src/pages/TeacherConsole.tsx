import { useEffect, useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { IconBack, IconPlus, IconTrash, IconVideo } from '../components/icons'
import { DifficultyBadge, Input, Notice, Select } from '../components/ui'
import { useLiveSession } from '../hooks/useLiveSession'
import {
  DIAGNOSES,
  DIFFICULTIES,
  OPTION_LABELS,
  SECTIONS,
  diagnosisLabel,
  sectionLabel,
  subjectLabel,
  suggestNext,
} from '../lib/constants'
import { supabase } from '../lib/supabase'
import type { Diagnosis, Difficulty, Question, Session, SessionItem } from '../lib/types'
import { StatusBadge } from './Sessions'

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
            {new Date(session.scheduled_at).toLocaleString(undefined, {
              day: 'numeric',
              month: 'short',
              hour: 'numeric',
              minute: '2-digit',
            })}
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
          {session.status === 'scheduled' && (
            <button
              type="button"
              className="btn btn-primary btn-sm"
              disabled={busy}
              onClick={() => void call('set_session_status', { p_session: sessionId, p_status: 'live' })}
            >
              Start session
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
        <Queue
          sessionId={sessionId}
          session={session}
          staged={staged}
          busy={busy}
          onPublish={(id) => void call('publish_item', { p_item: id })}
          onRemove={(id) => void call('unstage_item', { p_item: id })}
          onStaged={reload}
        />
        <Board items={live} busy={busy} onCall={call} />
      </div>
    </div>
  )
}

/* -------------------------------------------------------------- queue --- */

function Queue({
  sessionId,
  session,
  staged,
  busy,
  onPublish,
  onRemove,
  onStaged,
}: {
  sessionId: string
  session: Session
  staged: SessionItem[]
  busy: boolean
  onPublish: (id: string) => void
  onRemove: (id: string) => void
  onStaged: () => Promise<void>
}) {
  const [picking, setPicking] = useState(false)

  return (
    <div className="queue">
      <div className="queue-head">
        <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
          <div className="section-title" style={{ marginBottom: 0, flex: 1 }}>
            Queue · {staged.length}
          </div>
          <button
            type="button"
            className="btn btn-ghost btn-sm"
            onClick={() => setPicking((p) => !p)}
          >
            <IconPlus /> {picking ? 'Done' : 'Add'}
          </button>
        </div>
      </div>

      {picking && (
        <QuestionPicker
          sessionId={sessionId}
          subject={session.subject}
          alreadyStaged={new Set(staged.map((s) => s.question_id))}
          onStaged={onStaged}
        />
      )}

      <div className="queue-body">
        {staged.length === 0 && !picking && (
          <p style={{ color: 'var(--muted)', fontSize: 13.5, fontWeight: 300, padding: '6px 4px' }}>
            Nothing queued. Add questions before you start — the student cannot see them until you
            publish each one.
          </p>
        )}

        {staged.map((item) => (
          <div className="qi" key={item.id}>
            <div className="top">
              <span className="no">{item.sequence_no}</span>
              {item.questions && <DifficultyBadge level={item.questions.difficulty} />}
            </div>
            <div className="stem">{item.questions?.stem}</div>
            <div className="row">
              {item.questions?.section && (
                <span className="badge badge-neutral">{sectionLabel(item.questions.section)}</span>
              )}
              <span className="spring" />
              <button
                type="button"
                className="btn btn-ghost btn-sm"
                disabled={busy}
                onClick={() => onRemove(item.id)}
                aria-label="Remove from queue"
              >
                <IconTrash />
              </button>
              <button
                type="button"
                className="btn btn-primary btn-sm"
                disabled={busy || session.status !== 'live'}
                title={session.status !== 'live' ? 'Start the session first' : undefined}
                onClick={() => onPublish(item.id)}
              >
                Publish
              </button>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

function QuestionPicker({
  sessionId,
  subject,
  alreadyStaged,
  onStaged,
}: {
  sessionId: string
  subject: Session['subject']
  alreadyStaged: Set<string>
  onStaged: () => Promise<void>
}) {
  const [questions, setQuestions] = useState<Question[]>([])
  const [search, setSearch] = useState('')
  const [section, setSection] = useState('')
  const [difficulty, setDifficulty] = useState<Difficulty | ''>('')
  const [adding, setAdding] = useState<string | null>(null)

  useEffect(() => {
    let active = true
    void supabase
      .from('questions')
      .select('*, question_options(*)')
      .eq('subject', subject)
      .order('created_at', { ascending: false })
      .then(({ data }) => {
        if (active && data) setQuestions(data as Question[])
      })
    return () => {
      active = false
    }
  }, [subject])

  const visible = useMemo(() => {
    const needle = search.trim().toLowerCase()
    return questions
      .filter((q) => !alreadyStaged.has(q.id))
      .filter((q) => (section ? q.section === section : true))
      .filter((q) => (difficulty ? q.difficulty === difficulty : true))
      .filter((q) => (needle ? q.stem.toLowerCase().includes(needle) : true))
      .slice(0, 40)
  }, [questions, alreadyStaged, section, difficulty, search])

  async function stage(questionId: string) {
    setAdding(questionId)
    await supabase.rpc('stage_question', { p_session: sessionId, p_question: questionId })
    await onStaged()
    setAdding(null)
  }

  return (
    <div style={{ padding: '10px 14px 0', borderBottom: '1px solid var(--border)' }}>
      <div style={{ display: 'flex', flexDirection: 'column', gap: 8, marginBottom: 12 }}>
        <Input
          type="search"
          placeholder="Search the bank…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          aria-label="Search questions"
        />
        <div style={{ display: 'flex', gap: 8 }}>
          <Select
            value={section}
            aria-label="Filter by section"
            onChange={(e) => setSection(e.target.value)}
          >
            <option value="">All sections</option>
            {SECTIONS[subject].map((s) => (
              <option key={s.value} value={s.value}>
                {s.label}
              </option>
            ))}
          </Select>
          <Select
            value={difficulty}
            aria-label="Filter by level"
            onChange={(e) => setDifficulty(e.target.value as Difficulty | '')}
          >
            <option value="">All levels</option>
            {DIFFICULTIES.map((d) => (
              <option key={d.value} value={d.value}>
                {d.label}
              </option>
            ))}
          </Select>
        </div>
      </div>

      <div style={{ maxHeight: '38vh', overflowY: 'auto', display: 'flex', flexDirection: 'column', gap: 8, paddingBottom: 12 }}>
        {visible.length === 0 && (
          <p style={{ color: 'var(--muted)', fontSize: 13, fontWeight: 300 }}>
            No questions match. Add some to the bank first.
          </p>
        )}
        {visible.map((q) => (
          <button
            key={q.id}
            type="button"
            className="qi"
            style={{ textAlign: 'left', cursor: 'pointer', width: '100%' }}
            disabled={adding === q.id}
            onClick={() => void stage(q.id)}
          >
            <div className="top">
              <DifficultyBadge level={q.difficulty} />
              {q.section && <span className="badge badge-neutral">{sectionLabel(q.section)}</span>}
            </div>
            <div className="stem" style={{ marginBottom: 0 }}>
              {q.stem}
            </div>
          </button>
        ))}
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
          <h3>Nothing published yet</h3>
          <p>
            Publish a question from the queue and the student sees it straight away. Their answer,
            eliminations and time land here.
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
                      {it.status === 'published' && <span className="badge badge-cyan">Working</span>}
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
        <span className="qi-no pill-opt">{item.sequence_no}</span>
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
                {chosen && <span className="badge badge-cyan">Chose</span>}
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
