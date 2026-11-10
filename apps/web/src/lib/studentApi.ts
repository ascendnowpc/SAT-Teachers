import { sectionLabel, skillList, skillsOn, subjectLabel } from './constants'
import type { StudentReport } from './parentReport'
import type { SignInResult, StudentHome, StudentTest } from './studentAccount'
import type { StudentReportBundle, StudentReportList } from './studentReports'
import { normaliseStudentId } from './studentEntry'
import { supabase } from './supabase'

/**
 * The student's own doors (0067). Signed out, every one of them: the key the
 * sign-in hands back is the student's credential, checked by the server on
 * every call, and there is no Supabase account behind it.
 */

export async function studentSignIn(studentId: string, pin: string): Promise<SignInResult> {
  const { data, error } = await supabase.rpc('student_sign_in', {
    p_student: normaliseStudentId(studentId),
    p_pin: pin,
  })
  if (error) throw new Error(error.message)
  return data as SignInResult
}

/** Their name, ID and every test; throws "signed out" for a key that no longer works. */
export async function loadStudentHome(key: string): Promise<StudentHome> {
  const { data, error } = await supabase.rpc('student_home', { p_key: key })
  if (error) throw new Error(error.message)
  return data as StudentHome
}

/** The parent report's numbers (0070); throws "signed out" for a key that no longer works. */
export async function loadStudentReport(key: string): Promise<StudentReport> {
  const { data, error } = await supabase.rpc('student_report', { p_key: key })
  if (error) throw new Error(error.message)
  return data as StudentReport
}

/** Every report that is ready, newest first (0098); throws "signed out" for a key that no longer works. */
export async function loadStudentReports(key: string): Promise<StudentReportList> {
  const { data, error } = await supabase.rpc('student_report_list', { p_key: key })
  if (error) throw new Error(error.message)
  return data as StudentReportList
}

/** One report's rows (0098); throws "no such report" for one that is not theirs or not ready. */
export async function loadStudentSessionReport(key: string, sessionId: string): Promise<StudentReportBundle> {
  const { data, error } = await supabase.rpc('student_session_report', { p_key: key, p_session: sessionId })
  if (error) throw new Error(error.message)
  return data as StudentReportBundle
}

export async function studentSignOut(key: string): Promise<void> {
  // Best effort: the browser forgets the key either way, and the server's
  // copy runs out on its own.
  await supabase.rpc('student_sign_out', { p_key: key })
}

/**
 * "Words in Context", "Transitions and Boundaries", "English diagnostic" —
 * what the student calls a test.
 */
export function studentTestTitle(t: StudentTest): string {
  if (t.title) return t.title
  if (t.mode === 'targeted') {
    const skills = skillsOn(t)
    return (skills ? skillList(skills, 3) : sectionLabel(t.section)) ?? `${subjectLabel(t.subject)} practice test`
  }
  return `${subjectLabel(t.subject)} diagnostic`
}
