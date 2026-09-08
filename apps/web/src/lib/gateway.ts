import { row, rows, supabase } from './supabase'
import type { OptionLabel, Session, SessionItem, SessionLevel } from './types'

/**
 * How the student's screen talks to the server.
 *
 * There are two students now and they are the same student. One signed in and
 * opened their session from the list; the other clicked a link their teacher
 * sent them and has no account at all. Everything between those two points is
 * identical — the same lobby, the same questions, the same clock — and the
 * only difference is which door the request goes through: the signed-in one
 * carries a JWT and is checked against auth.uid(), the link carries a token
 * and is checked against sessions.access_token.
 *
 * So the screen takes one of these instead of a session id, and the two
 * implementations are the two doors. Nothing above this line knows which one
 * it has.
 */
export interface SessionGateway {
  /** Distinguishes the two for the few places that must care. */
  kind: 'account' | 'link'
  /** For React keys and effect dependencies — stable for the life of a screen. */
  key: string
  /**
   * The session's id when the caller is allowed to know it up front, which is
   * what Realtime's row filter needs. A link holds a token instead: nothing
   * anonymous can subscribe to session_items, so that screen polls.
   */
  sessionId: string | null
  load(): Promise<{ session: Session | null; items: SessionItem[] }>
  start(): Promise<void>
  setLevel(level: SessionLevel): Promise<void>
  markViewed(itemId: string): Promise<void>
  markDecided(itemId: string): Promise<void>
  /**
   * What they have picked so far, without answering. The teacher is watching
   * on a call and "you've gone for B — talk me through it" is the lesson.
   */
  saveDraft(args: {
    itemId: string
    option: OptionLabel | null
    eliminated: OptionLabel[]
    confidence: number | null
  }): Promise<void>
  submit(args: {
    itemId: string
    option: OptionLabel
    eliminated: OptionLabel[]
    confidence: number | null
  }): Promise<void>
  finish(): Promise<void>
}

/** Turns a PostgREST error into something worth putting on a screen. */
function fail(error: { message: string } | null): void {
  if (error) throw new Error(error.message)
}

const SESSION_SELECT =
  '*, teacher:profiles!sessions_teacher_id_fkey(id,full_name,display_id),' +
  ' student:profiles!sessions_student_id_fkey(id,full_name,display_id,pc)'

const ITEM_SELECT = '*, questions(*, question_options(*))'

/** The signed-in student, reading through RLS and calling their own RPCs. */
export function accountGateway(sessionId: string): SessionGateway {
  return {
    kind: 'account',
    key: `session:${sessionId}`,
    sessionId,

    async load() {
      const [s, i] = await Promise.all([
        supabase.from('sessions').select(SESSION_SELECT).eq('id', sessionId).maybeSingle(),
        supabase
          .from('session_items')
          .select(ITEM_SELECT)
          .eq('session_id', sessionId)
          .order('sequence_no'),
      ])
      fail(s.error)
      fail(i.error)
      return { session: row<Session>(s.data), items: rows<SessionItem>(i.data) }
    },

    async start() {
      fail((await supabase.rpc('start_session_as_student', { p_session: sessionId })).error)
    },

    async setLevel(level) {
      fail(
        (await supabase.rpc('set_session_level', { p_session: sessionId, p_level: level })).error,
      )
    },

    async markViewed(itemId) {
      await supabase.rpc('mark_item_viewed', { p_item: itemId })
    },

    async markDecided(itemId) {
      await supabase.rpc('mark_item_decided', { p_item: itemId })
    },

    async saveDraft({ itemId, option, eliminated, confidence }) {
      // Best effort: a dropped draft costs the teacher a second of staleness,
      // and interrupting the student to say so would cost more than that.
      await supabase.rpc('save_draft', {
        p_item: itemId,
        p_option: option,
        p_eliminated: eliminated,
        p_confidence: confidence,
      })
    },

    async submit({ itemId, option, eliminated, confidence }) {
      fail(
        (
          await supabase.rpc('submit_answer', {
            p_item: itemId,
            p_option: option,
            p_eliminated: eliminated,
            p_confidence: confidence,
            // Asked for in the lesson, where the teacher can hear the answer —
            // not typed into a box while a clock runs.
            p_reasoning: null,
          })
        ).error,
      )
    },

    async finish() {
      fail((await supabase.rpc('finish_session_as_student', { p_session: sessionId })).error)
    },
  }
}

/**
 * The student holding a link.
 *
 * Reading is one call rather than two, because there is no RLS to read
 * through: the server takes the token, finds the one session it names, and
 * builds the whole screen — which is also what keeps the answer key out of it,
 * since the key is simply never joined.
 */
export function linkGateway(token: string): SessionGateway {
  return {
    kind: 'link',
    key: `link:${token}`,
    sessionId: null,

    async load() {
      const { data, error } = await supabase.rpc('session_by_token', { p_token: token })
      fail(error)
      const payload = (data ?? null) as { session: Session; items: SessionItem[] } | null
      if (!payload) return { session: null, items: [] }
      return { session: payload.session ?? null, items: payload.items ?? [] }
    },

    async start() {
      fail((await supabase.rpc('start_session_by_token', { p_token: token })).error)
    },

    async setLevel(level) {
      fail((await supabase.rpc('set_level_by_token', { p_token: token, p_level: level })).error)
    },

    async markViewed(itemId) {
      await supabase.rpc('mark_viewed_by_token', { p_token: token, p_item: itemId })
    },

    async markDecided(itemId) {
      await supabase.rpc('mark_decided_by_token', { p_token: token, p_item: itemId })
    },

    async saveDraft({ itemId, option, eliminated, confidence }) {
      await supabase.rpc('draft_by_token', {
        p_token: token,
        p_item: itemId,
        p_option: option,
        p_eliminated: eliminated,
        p_confidence: confidence,
      })
    },

    async submit({ itemId, option, eliminated, confidence }) {
      fail(
        (
          await supabase.rpc('answer_by_token', {
            p_token: token,
            p_item: itemId,
            p_option: option,
            p_eliminated: eliminated,
            p_confidence: confidence,
            p_reasoning: null,
          })
        ).error,
      )
    },

    async finish() {
      fail((await supabase.rpc('finish_by_token', { p_token: token })).error)
    },
  }
}
