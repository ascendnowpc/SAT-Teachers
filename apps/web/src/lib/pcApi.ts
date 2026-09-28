import { callFunction } from './functions'
import type { PcResult } from './pcs'
import { rows, supabase } from './supabase'
import type { PcInvite, Profile, ReportEmail } from './types'

/**
 * The calls behind the PC screens. Adding a PC, their link, joining and
 * sending a report are the edge functions' (manage_pc, accept_pc_invite,
 * notify_pc_report); the rest are reads.
 */

export function addPc(input: { first: string; last: string; email: string }): Promise<PcResult> {
  return callFunction<PcResult>('manage_pc', {
    action: 'create',
    first_name: input.first.trim(),
    last_name: input.last.trim(),
    email: input.email.trim(),
  })
}

/** Another link: a first one that ran out, or a new password for a PC who has joined. */
export function sendPcInvite(profileId: string): Promise<PcResult> {
  return callFunction<PcResult>('manage_pc', { action: 'invite', profile_id: profileId })
}

/** Who a link is for, without using it. Throws "expired or used" when it is dead. */
export function openInvite(token: string): Promise<{ email: string; full_name: string; joined: boolean }> {
  return callFunction('accept_pc_invite', { action: 'open', token })
}

/** Uses the link: sets the password and confirms the address. The page then signs in. */
export function acceptInvite(token: string, password: string): Promise<{ email: string }> {
  return callFunction('accept_pc_invite', { action: 'accept', token, password })
}

/** Every PC's link, for Users. Admins only; anybody else reads none. */
export async function loadPcInvites(): Promise<Map<string, PcInvite>> {
  const { data } = await supabase.from('pc_invites').select('*')
  return new Map(rows<PcInvite>(data).map((i) => [i.profile_id, i]))
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
