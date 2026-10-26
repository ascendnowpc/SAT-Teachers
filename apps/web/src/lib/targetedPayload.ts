import type { OptionLabel, Question, Session, SessionItem, TargetedInfo } from './types'

/**
 * What a targeted test's link sends (0062): a fixed list of fields, shaped
 * differently from a lesson's whole rows on purpose — there is nothing in it to
 * leak. fromTargeted puts it into the shapes the screen already reads.
 */
export interface TargetedPayload {
  server_now: string
  session: Pick<
    Session,
    | 'id'
    | 'mode'
    | 'status'
    | 'subject'
    | 'title'
    | 'scheduled_at'
    | 'opened_early_at'
    | 'started_at'
    | 'ended_at'
  > & {
    student: { full_name: string; display_id: string } | null
    teacher: { full_name: string } | null
  }
  targeted: Omit<TargetedInfo, 'server_now'>
  items: Array<
    Pick<
      SessionItem,
      | 'id'
      | 'sequence_no'
      | 'status'
      | 'first_viewed_at'
      | 'time_limit_seconds'
      | 'answered_at'
      | 'decided_at'
      | 'selected_option'
      | 'eliminated_options'
      | 'student_confidence'
      | 'revealed_result'
      | 'revealed_correct_option'
      | 'revealed_explanation'
    > & {
      question: Pick<
        Question,
        'id' | 'subject' | 'passage' | 'passage_underline' | 'stem' | 'image_url'
      > & {
        options: { label: OptionLabel; body: string }[]
      }
    }
  >
}

/** The targeted payload in the shapes the student's screen reads. */
export function fromTargeted(p: TargetedPayload): {
  session: Session
  items: SessionItem[]
  targeted: TargetedInfo
} {
  const s = p.session
  const session: Session = {
    id: s.id,
    teacher_id: '',
    student_id: '',
    subject: s.subject,
    title: s.title,
    scheduled_at: s.scheduled_at,
    duration_mins: Math.ceil(p.targeted.overall_seconds / 60),
    meeting_url: null,
    status: s.status,
    mode: 'targeted',
    level: 'easy',
    level_size: 0,
    opened_early_at: s.opened_early_at,
    question_count: p.targeted.question_count,
    answered_count: 0,
    started_at: s.started_at,
    ended_at: s.ended_at,
    teacher_notes: null,
    created_at: s.scheduled_at,
    teacher: s.teacher ? { id: '', full_name: s.teacher.full_name, display_id: '' } : null,
    student: s.student
      ? { id: '', full_name: s.student.full_name, display_id: s.student.display_id, pc: null }
      : null,
  }
  const items: SessionItem[] = p.items.map((i) => ({
    id: i.id,
    session_id: s.id,
    question_id: i.question.id,
    student_id: '',
    sequence_no: i.sequence_no,
    asked_no: i.sequence_no,
    status: i.status,
    published_at: i.first_viewed_at,
    first_viewed_at: i.first_viewed_at,
    decided_at: i.decided_at,
    answered_at: i.answered_at,
    revealed_at: null,
    selected_option: i.selected_option,
    eliminated_options: i.eliminated_options ?? [],
    marked_for_review: false,
    student_confidence: i.student_confidence,
    student_reasoning: null,
    revealed_result: i.revealed_result,
    revealed_correct_option: i.revealed_correct_option,
    revealed_explanation: i.revealed_explanation,
    time_limit_seconds: i.time_limit_seconds,
    questions: {
      id: i.question.id,
      created_by: null,
      subject: i.question.subject,
      section: null,
      skill: null,
      passage: i.question.passage,
      passage_underline: i.question.passage_underline,
      image_url: i.question.image_url,
      source_ref: null,
      stem: i.question.stem,
      // Not sent, and not shown: the student is never told a question's level.
      difficulty: 'medium',
      difficulty_rationale: null,
      target_seconds: null,
      status: 'published',
      created_at: s.scheduled_at,
      question_options: i.question.options.map((o) => ({
        id: `${i.question.id}:${o.label}`,
        question_id: i.question.id,
        label: o.label,
        body: o.body,
      })),
      question_keys: null,
    },
  }))
  return { session, items, targeted: { ...p.targeted, server_now: p.server_now } }
}
