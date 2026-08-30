export type Role = 'admin' | 'teacher' | 'student'
export type Difficulty = 'easy' | 'medium' | 'hard'
export type OptionLabel = 'A' | 'B' | 'C' | 'D'
export type Subject = 'english' | 'mathematics'
export type SessionStatus = 'scheduled' | 'live' | 'completed' | 'cancelled'
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
  passage: string | null
  /** Exact substring of `passage` the stem calls "the underlined sentence". */
  passage_underline: string | null
  /** Where the item came from, e.g. ENG-DIAG-INCLASS-Q03. Null for authored questions. */
  source_ref: string | null
  stem: string
  difficulty: Difficulty
  difficulty_rationale: string | null
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
  status: ItemStatus
  published_at: string | null
  first_viewed_at: string | null
  answered_at: string | null
  revealed_at: string | null
  selected_option: OptionLabel | null
  eliminated_options: OptionLabel[]
  student_confidence: number | null
  student_reasoning: string | null
  revealed_result: GradeResult | null
  revealed_correct_option: OptionLabel | null
  revealed_explanation: string | null
  questions?: Question | null
  session_item_assessments?: Assessment | null
}
