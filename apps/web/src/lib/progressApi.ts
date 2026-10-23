import { defaultConfig, type ProgressConfig, type StudentProgress } from './progress'
import { supabase } from './supabase'
import type { AnalysedItem, AnalysedQuestion } from './targetedAnalytics'
import type { Candidate } from './targetedSet'
import type { Subject } from './types'

/**
 * The reads behind targeted tests and progress, in one place: the numbers
 * (student_progress, 0063), the config (progress_config, 0061) and the set
 * builder's candidates (targeted_candidates, 0061). Each resolves rather than
 * throws, with the error beside the data, so a screen can show what it has.
 */

export async function loadProgress(
  studentId: string,
  subject: Subject,
): Promise<{ progress: StudentProgress | null; error: string | null }> {
  const { data, error } = await supabase.rpc('student_progress', {
    p_student: studentId,
    p_subject: subject,
  })
  if (error) return { progress: null, error: error.message }
  return { progress: (data ?? null) as StudentProgress | null, error: null }
}

export async function loadConfig(subject: Subject): Promise<ProgressConfig> {
  const { data } = await supabase
    .from('progress_config')
    .select('*')
    .eq('subject', subject)
    .maybeSingle()
  return (data as ProgressConfig | null) ?? defaultConfig(subject)
}

export async function loadCandidates(
  studentId: string,
  subject: Subject,
  section: string,
  skill: string | null,
): Promise<{ candidates: Candidate[]; error: string | null }> {
  const { data, error } = await supabase.rpc('targeted_candidates', {
    p_student: studentId,
    p_subject: subject,
    p_section: section,
    p_skill: skill,
  })
  if (error) return { candidates: [], error: error.message }
  return { candidates: (data ?? []) as Candidate[], error: null }
}

/**
 * The questions behind a set of items, as the analysis reads them — words and
 * format, never the key. Staff read the bank; a PC reads the questions put to
 * their students (0055). Anything the caller cannot read is simply missing.
 */
export async function loadAnalysedQuestions(ids: string[]): Promise<Map<string, AnalysedQuestion>> {
  const unique = [...new Set(ids)]
  if (unique.length === 0) return new Map()
  const { data } = await supabase
    .from('questions')
    .select('id, difficulty, passage, passage_underline, stem, image_url, target_seconds')
    .in('id', unique)
  return new Map(
    ((data ?? []) as (AnalysedQuestion & { id: string })[]).map((q) => [q.id, q]),
  )
}

/** student_progress's items, with their questions, as the analysis reads them. */
export function asAnalysed(
  items: StudentProgress['items'],
  questions: Map<string, AnalysedQuestion>,
): AnalysedItem[] {
  return items.map((i) => ({
    status: i.status,
    is_correct: i.is_correct,
    timed_out: i.timed_out,
    elapsed_seconds: i.elapsed_seconds,
    time_limit_seconds: i.time_limit_seconds,
    question: questions.get(i.question_id) ?? null,
  }))
}
