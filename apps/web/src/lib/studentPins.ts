import { allRows } from './allRows'
import { supabase } from './supabase'

/**
 * The four-digit PIN each student signs in with (0067), by student id — every
 * one the reader may see: all of them for staff, their own students' for a PC.
 * The table's policies decide which, so this asks for all of them.
 *
 * Read so a student's PIN is beside their ID wherever staff or their PC find
 * the student, not only under a session's link. It is supplementary: a read
 * that fails leaves the PINs out and the page as it was.
 */
export async function loadPins(): Promise<Map<string, string>> {
  const { rows } = await allRows<{ student_id: string; pin: string }>((from, to) =>
    supabase
      .from('student_pins')
      .select('student_id, pin', { count: 'exact' })
      .order('student_id')
      .range(from, to),
  )
  return new Map(rows.map((r) => [r.student_id, r.pin]))
}
