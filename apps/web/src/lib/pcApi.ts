import { callFunction } from './functions'
import type { PcResult } from './pcs'
import { rows, supabase } from './supabase'
import type { Profile, ReportEmail } from './types'

/**
 * The calls behind the PC screens. Adding a PC and sending a report are the
 * edge functions' (manage_pc, notify_pc_report); the rest are reads.
 */

export function addPc(input: { first: string; last: string; email: string }): Promise<PcResult> {
  return callFunction<PcResult>('manage_pc', {
    action: 'create',
    first_name: input.first.trim(),
    last_name: input.last.trim(),
    email: input.email.trim(),
  })
}

export function resetPcPassword(profileId: string): Promise<PcResult> {
  return callFunction<PcResult>('manage_pc', { action: 'reset', profile_id: profileId })
}

/** "Send to the PC again": the session's teacher's, or an admin's. */
export function sendReportAgain(
  sessionId: string,
): Promise<{ sent: boolean; to?: string; attached?: boolean; reason?: string }> {
  return callFunction('notify_pc_report', { session_id: sessionId, again: true })
}

/** Every PC, active or not, by name. The screens decide which can be chosen. */
export async function loadPcs(): Promise<{ pcs: Profile[]; error: string | null }> {
  const { data, error } = await supabase.from('profiles').select('*').eq('role', 'pc').order('full_name')
  return { pcs: rows<Profile>(data), error: error?.message ?? null }
}

/** The newest email of this session's report, or null when none was ever tried. */
export async function loadReportEmail(sessionId: string): Promise<ReportEmail | null> {
  const { data } = await supabase
    .from('report_emails')
    .select('*')
    .eq('session_id', sessionId)
    .order('generated_at', { ascending: false })
    .limit(1)
    .maybeSingle()
  return (data as ReportEmail | null) ?? null
}
