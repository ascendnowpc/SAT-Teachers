export type Role = 'admin' | 'teacher' | 'student'
export type Difficulty = 'easy' | 'medium' | 'hard'
export type OptionLabel = 'A' | 'B' | 'C' | 'D'
export type Subject = 'english' | 'mathematics'
export type SessionStatus = 'scheduled' | 'live' | 'completed' | 'cancelled'
/**
 * Which of the three tests a session is on. Every session starts on 'easy'; the
 * teacher moves it while the session runs. The student is never shown it.
 */
export type SessionLevel = Difficulty
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
  /** The student's PC, as the teachers write it. Null for teachers and for students added before it was asked for. */
  pc: string | null
  is_active: boolean
  /**
   * When an admin took the account away (0045). An inactive account with this
   * still null is merely *pending* — nobody has approved it yet, and it can
   * still sign in, because that is how it reaches the screen that says so.
   */
  suspended_at: string | null
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
  /**
   * The student's way in: /s/<token>, no account. Present on a teacher's own
   * read of the session and never on the student's — the token RPCs strip it.
   */
  access_token?: string | null
  status: SessionStatus
  /**
   * The test the queue is running. Starts easy; the teacher moves it, with the
   * level buttons or by choosing a question from another test. Teacher-facing only.
   */
  level: SessionLevel
  /** How many questions of that test this session holds. No screen shows it since 0047. */
  level_size: number
  /** When a teacher waived the scheduled time. scheduled_at still says when it was arranged. */
  opened_early_at: string | null
  /** Everything this session has put in front of the student, across levels. Maintained by trigger. */
  question_count: number
  /** What the student actually answered. Staged and set-aside questions are not in it. */
  answered_count: number
  /**
   * The tests the student answered questions on, each once, in the order they
   * first reached it — ['medium', 'easy'] for a lesson that moved down.
   * Maintained by trigger with answered_count (0053); read it through
   * levelsOf, which also counts the test a live session is on. Teacher-facing
   * only, as `level` is.
   */
  levels_sat?: SessionLevel[]
  started_at: string | null
  ended_at: string | null
  teacher_notes: string | null
  created_at: string
  teacher?: Pick<Profile, 'id' | 'full_name' | 'display_id'> | null
  student?: (Pick<Profile, 'id' | 'full_name' | 'display_id'> & { pc?: string | null }) | null
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
  /** When the student first picked an answer — not the confidence as well (0050). Stamped once; the clock stops here. */
  decided_at: string | null
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
  /** Which of the three English tests this is, or null for anything that is not one. */
  level: SessionLevel | null
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
  /** Who put this text in: the session's teacher or an admin. Null before 0048. */
  uploaded_by: string | null
  /** When this text went in — the first upload, or the latest change to it (0048). */
  created_at: string
}

export interface DomainNote {
  session_id: string
  domain: string
  /** The Student Performance column as the teacher marked it on the form. */
  performance: 'tick' | 'cross' | null
  /** Anything written beside the mark. Optional — the mark is the required part. */
  performance_note: string | null
  strengths: string | null
  gaps: string | null
  /** The Next steps/Targets column. Null means the form's printed default stands. */
  targets: string | null
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
  /** The teacher's comments, written on the diagnostic form before any report exists. */
  teacher_reflection: string | null
  /** When the diagnostic form was handed in complete. Null while it is a draft. */
  form_submitted_at: string | null
  /** Who handed it in: the session's teacher or an admin (0049). Null before then. */
  form_submitted_by: string | null
  /** When the report was generated from the form. Null until somebody presses it. */
  generated_at: string | null
  /** Who pressed it: the session's teacher or an admin (0048). Null before then. */
  generated_by: string | null
  published_at: string | null
}
