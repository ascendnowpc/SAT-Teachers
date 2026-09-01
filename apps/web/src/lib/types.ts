export type Role = 'admin' | 'teacher' | 'student'
export type Difficulty = 'easy' | 'medium' | 'hard'
export type OptionLabel = 'A' | 'B' | 'C' | 'D'
export type Subject = 'english' | 'mathematics'
export type SessionStatus = 'scheduled' | 'live' | 'completed' | 'cancelled'
/**
 * Who decides what the student sees next. 'student': the paper runs itself and
 * every answer brings up the next question. 'teacher': nothing is published
 * until the teacher picks it out of the paper.
 */
export type SessionPacing = 'student' | 'teacher'
export type ItemStatus = 'staged' | 'published' | 'answered' | 'revealed' | 'voided'
export type GradeResult = 'correct' | 'incorrect'
export type Diagnosis =
  | 'solid_reasoning'
  | 'lucky_guess'
  | 'careless_error'
  | 'concept_gap'
  | 'misread_question'
  | 'ran_out_of_time'

export interface Profile {
  id: string
  role: Role
  display_id: string
  full_name: string
  email: string | null
  is_active: boolean
  created_at: string
}

export interface QuestionOption {
  id: string
  question_id: string
  label: OptionLabel
  body: string
}

export interface QuestionKey {
  question_id: string
  correct_option: OptionLabel
  explanation: string | null
}

export interface Question {
  id: string
  /** Null for house content loaded from a source paper; set when a teacher authored it. */
  created_by: string | null
  subject: Subject
  section: string | null
  /** Skill focus within the section, from the teachers' evaluation grid. */
  skill: string | null
  passage: string | null
  /** Exact substring of `passage` the stem calls "the underlined sentence". */
  passage_underline: string | null
  /** A figure — a diagram or chart — shown with the stimulus. */
  image_url: string | null
  /** Where the item came from, e.g. ENG-DIAG-INCLASS-Q03. Null for authored questions. */
  source_ref: string | null
  stem: string
  difficulty: Difficulty
  difficulty_rationale: string | null
  /** What a confident student should need, in seconds. Pace is measured against it. */
  target_seconds: number | null
  status: 'draft' | 'published' | 'retired'
  created_at: string
  question_options: QuestionOption[]
  question_keys: QuestionKey | null
}

export interface Session {
  id: string
  teacher_id: string
  student_id: string
  subject: Subject
  title: string | null
  scheduled_at: string
  duration_mins: number
  meeting_url: string | null
  status: SessionStatus
  pacing: SessionPacing
  /** When a teacher waived the scheduled time. scheduled_at still says when it was arranged. */
  opened_early_at: string | null
  /** How many questions the paper holds. Maintained by trigger; the student reads it. */
  question_count: number
  started_at: string | null
  ended_at: string | null
  teacher_notes: string | null
  created_at: string
  teacher?: Pick<Profile, 'id' | 'full_name' | 'display_id'> | null
  student?: Pick<Profile, 'id' | 'full_name' | 'display_id'> | null
}

export interface Assessment {
  session_item_id: string
  is_correct: boolean
  elapsed_seconds: number | null
  diagnosis: Diagnosis | null
  teacher_note: string | null
}

export interface SessionItem {
  id: string
  session_id: string
  question_id: string
  student_id: string
  sequence_no: number
  /** Where this question was actually put in front of the student. Null while staged. */
  asked_no: number | null
  status: ItemStatus
  published_at: string | null
  first_viewed_at: string | null
  answered_at: string | null
  revealed_at: string | null
  selected_option: OptionLabel | null
  eliminated_options: OptionLabel[]
  marked_for_review: boolean
  student_confidence: number | null
  student_reasoning: string | null
  revealed_result: GradeResult | null
  revealed_correct_option: OptionLabel | null
  revealed_explanation: string | null
  questions?: Question | null
  session_item_assessments?: Assessment | null
}

export interface QuestionSet {
  id: string
  created_by: string | null
  title: string
  subject: Subject
  description: string | null
  /** The directions block the source paper prints above its first question. */
  instructions: string | null
  /** Which source paper this set is, e.g. ENG-DIAG-INCLASS. Null when a teacher built it. */
  source_ref: string | null
  /** 'paper': questions are written into it, filed under Questions. 'test': assembled to be sat. */
  kind: 'paper' | 'test'
  is_active: boolean
  created_at: string
  /** Present when the list query counts the set's items. */
  question_set_items?: { count: number }[]
}

export interface SessionTranscript {
  id: string
  session_id: string
  source: 'fathom' | 'zoom' | 'manual'
  filename: string | null
  body: string
  created_at: string
}

export interface DomainNote {
  session_id: string
  domain: string
  strengths: string | null
  gaps: string | null
}

export interface SessionReportRow {
  session_id: string
  status: 'draft' | 'published'
  /** The teacher's words about the pace; the numbers themselves are computed. */
  time_management: string | null
  engagement: string | null
  /** Overrides the computed weakest domain when set. */
  practice_priority: string | null
  summary: string | null
  published_at: string | null
}
