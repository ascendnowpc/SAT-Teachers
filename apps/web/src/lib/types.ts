export type Role = 'admin' | 'teacher' | 'student'
export type Difficulty = 'easy' | 'medium' | 'hard'
export type OptionLabel = 'A' | 'B' | 'C' | 'D'
export type Subject = 'english' | 'math'

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
  created_by: string
  subject: Subject
  domain: string | null
  passage: string | null
  stem: string
  difficulty: Difficulty
  difficulty_rationale: string | null
  status: 'draft' | 'published' | 'retired'
  created_at: string
  question_options: QuestionOption[]
  question_keys: QuestionKey | null
}
