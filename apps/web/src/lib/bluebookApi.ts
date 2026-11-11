import type { Band, BluebookScore, RecordedBy } from './bluebook'
import { supabase } from './supabase'

export { addedBy, type RecordedBy } from './bluebook'

/**
 * The three doors a Bluebook score comes through (0088, 0090, 0099): staff
 * and the PC, signed in, through save_bluebook_score; the student — and their
 * parent, with the student's ID and PIN — through their key. The card and
 * its form are one component; each door is a BluebookApi.
 */

/** One score, as the card lists it. */
export interface BluebookListRow {
  id: string
  test_name: string
  taken_on: string
  total: number
  reading_writing: number
  math: number
  read_from: 'report' | 'typed'
  official: boolean
  total_percentile: number | null
  rw_percentile: number | null
  math_percentile: number | null
  domains: Record<string, Band> | null
  recorded_by: RecordedBy | null
  /** Whoever is looking may delete it. */
  deletable: boolean
}

/** What the form sends, whichever door it goes through. */
export interface BluebookSave {
  test_name: string
  taken_on: string
  total: number
  reading_writing: number
  math: number
  read_from: 'report' | 'typed'
  official: boolean
  total_percentile: number | null
  rw_percentile: number | null
  math_percentile: number | null
  domains: BluebookScore['domains']
}

export interface BluebookApi {
  /** Who is looking: it decides how "added by" reads. */
  audience: 'staff' | 'pc' | 'student'
  canAdd: boolean
  load(): Promise<BluebookListRow[]>
  save(s: BluebookSave): Promise<void>
  remove(id: string): Promise<void>
}

const args = (s: BluebookSave) => ({
  p_test_name: s.test_name,
  p_taken_on: s.taken_on,
  p_total: s.total,
  p_reading_writing: s.reading_writing,
  p_math: s.math,
  p_read_from: s.read_from,
  p_official: s.official,
  p_total_percentile: s.total_percentile,
  p_rw_percentile: s.rw_percentile,
  p_math_percentile: s.math_percentile,
  p_domains: s.domains,
})

/** Staff and the PC, signed in: the table, through its row-level security. */
export function signedInBluebook(input: {
  studentId: string
  me: string | null
  isAdmin: boolean
  audience: 'staff' | 'pc'
}): BluebookApi {
  return {
    audience: input.audience,
    canAdd: true,
    async load() {
      const { data, error } = await supabase
        .from('bluebook_scores')
        .select(
          'id, test_name, taken_on, total, reading_writing, math, read_from, official,' +
            ' total_percentile, rw_percentile, math_percentile, domains, created_by, recorded_by',
        )
        .eq('student_id', input.studentId)
      if (error) throw new Error(error.message)
      return ((data ?? []) as unknown as (BluebookListRow & { created_by: string | null })[]).map((r) => ({
        ...r,
        recorded_by: r.recorded_by ?? null,
        // delete_bluebook_score: an admin any, anybody else what they recorded.
        deletable: input.isAdmin || (r.created_by !== null && r.created_by === input.me && r.recorded_by !== 'student'),
      }))
    },
    async save(s) {
      const { error } = await supabase.rpc('save_bluebook_score', { p_student: input.studentId, ...args(s) })
      if (error) throw new Error(error.message)
    },
    async remove(id) {
      const { error } = await supabase.rpc('delete_bluebook_score', { p_id: id })
      if (error) throw new Error(error.message)
    },
  }
}

/** The student's own account, through their key (0099). */
export function studentBluebook(key: string): BluebookApi {
  return {
    audience: 'student',
    canAdd: true,
    async load() {
      const { data, error } = await supabase.rpc('student_bluebook_scores', { p_key: key })
      if (error) throw new Error(error.message)
      return ((data ?? []) as (Omit<BluebookListRow, 'deletable'> & { mine: boolean })[]).map(({ mine, ...r }) => ({
        ...r,
        deletable: mine,
      }))
    },
    async save(s) {
      const { error } = await supabase.rpc('student_save_bluebook_score', { p_key: key, ...args(s) })
      if (error) throw new Error(error.message)
    },
    async remove(id) {
      const { error } = await supabase.rpc('student_delete_bluebook_score', { p_key: key, p_id: id })
      if (error) throw new Error(error.message)
    },
  }
}
