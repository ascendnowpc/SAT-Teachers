import { sectionLabel, skillList, skillsOn, subjectLabel } from './constants'
import type { BluebookReading } from './bluebook'
import { callFunction } from './functions'
import type { GoalState, StudentGoal } from './goal'
import { MAX_READ_BYTES } from './scoreReader'
import type { Horizon, StudyPlan } from './studyPlan'
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

export type PinChange =
  | { ok: true }
  | { ok: false; reason: 'wrong' | 'invalid' | 'same' }
  | { ok: false; reason: 'locked'; until: string }

/** A new PIN, given the current one (0100); this device stays signed in, the rest are signed out. */
export async function changeStudentPin(key: string, current: string, next: string): Promise<PinChange> {
  const { data, error } = await supabase.rpc('student_change_pin', { p_key: key, p_current: current, p_new: next })
  if (error) throw new Error(error.message)
  return data as PinChange
}

/** Their goal, when they joined, and whether they have been through the first login (0101, 0105). */
export async function loadStudentGoal(key: string): Promise<GoalState> {
  const { data, error } = await supabase.rpc('student_goal', { p_key: key })
  if (error) throw new Error(error.message)
  return data as GoalState
}

/** Sets the goal, whenever they like; it clears the PC's confirmation (0105). */
export async function saveStudentGoal(key: string, goal: StudentGoal): Promise<GoalState> {
  const { data, error } = await supabase.rpc('student_set_goal', {
    p_key: key,
    p_target_total: goal.target_total ?? null,
    p_target_rw: goal.target_rw,
    p_target_math: goal.target_math,
    p_next_test_on: goal.next_test_on,
    p_reg_on: goal.registration_deadline_on ?? null,
    p_college_note: goal.college_note ?? null,
  })
  if (error) throw new Error(error.message)
  return data as GoalState
}

/** The first-login steps are done, or skipped: they are not asked again (0105). */
export async function finishOnboarding(key: string): Promise<GoalState> {
  const { data, error } = await supabase.rpc('student_finish_onboarding', { p_key: key })
  if (error) throw new Error(error.message)
  return data as GoalState
}

/** A file's bytes as base64, in chunks a long picture does not overflow. */
export async function fileBase64(file: File): Promise<string> {
  const bytes = new Uint8Array(await file.arrayBuffer())
  let binary = ''
  for (let i = 0; i < bytes.length; i += 0x8000) binary += String.fromCharCode(...bytes.subarray(i, i + 0x8000))
  return btoa(binary)
}

/**
 * A picture of a score report — a screenshot, a photo, a scanned PDF — read by
 * read_score_report. With a key, as the student; without, as whoever is signed in.
 */
export async function readScorePicture(file: File, key?: string): Promise<BluebookReading> {
  if (file.size > MAX_READ_BYTES) throw new Error('That file is over 6 MB. Try a smaller screenshot.')
  const mime = file.type || (/\.pdf$/i.test(file.name) ? 'application/pdf' : '')
  return await callFunction<BluebookReading>('read_score_report', { key, file: await fileBase64(file), mime })
}

/** "What should I do?" — the plan student_plan writes from their numbers. */
export async function askForPlan(input: { key?: string; studentId?: string; horizon: Horizon }): Promise<StudyPlan> {
  const r = await callFunction<{ plan: StudyPlan }>('student_plan', {
    key: input.key,
    student_id: input.studentId,
    horizon: input.horizon,
  })
  return r.plan
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
