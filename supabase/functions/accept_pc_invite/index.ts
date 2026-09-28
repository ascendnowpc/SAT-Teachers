import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import { isToken, passwordProblem, tokenHash } from '../../../apps/web/src/lib/invite.ts'
import { CORS, json } from '../_shared/http.ts'

/**
 * The other end of a PC's link: the join page, which a signed-out browser
 * opens, calls this.
 *
 *   POST /functions/v1/accept_pc_invite  { action: 'open',   token }
 *     →  { email, full_name, joined }
 *   POST /functions/v1/accept_pc_invite  { action: 'accept', token, password }
 *     →  { email }                         and the page signs in with them
 *
 * Deployed with verify_jwt off, because whoever calls it has no account yet —
 * that is what it is for. The token is the whole of the permission: 32 random
 * bytes, looked up by its SHA-256, live for a week and good once (0055's
 * pc_invites). Nothing else in the body is believed: the address is the PC's
 * own sign-in, read on the service role, never one the page sent.
 *
 * 'open' uses nothing. Mail scanners fetch every link in a message before a
 * person reads it; the page they fetch shows an address and a password box,
 * and a link one of them had spent would reach the PC dead. 'accept' uses the
 * link in the statement that finds it, sets the password, and marks the email
 * confirmed — following a link that went to the address is the proof of it,
 * so nothing asks the PC to confirm it again. If the auth server refuses the
 * password (the project's own rule, say), the link is handed back so the page
 * can be tried with another.
 *
 * Every refusal is the same "expired or used": which of the two it was, or
 * that it was never a link at all, is nothing a stranger needs to learn.
 */

const DEAD = 'This link has expired or has already been used. Ask an admin to send you a new one.'

interface Body {
  action?: 'open' | 'accept'
  token?: unknown
  password?: unknown
}

Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  let body: Body
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }
  if (!isToken(body.token)) return json({ error: DEAD }, 404)
  const hash = await tokenHash(body.token)

  const db = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!, {
    auth: { persistSession: false, autoRefreshToken: false },
  })

  // ------------------------------------------------------------------- open --
  if (body.action === 'open') {
    const { data, error } = await db.rpc('open_pc_invite', { p_token_hash: hash }).maybeSingle()
    if (error) return json({ error: error.message }, 500)
    if (!data) return json({ error: DEAD }, 404)
    const row = data as { profile_id: string; email: string | null; full_name: string; joined: boolean }
    // The address they will sign in with: the auth server's, not the profile's
    // copy, which its owner can edit. The profile's only if there is no sign-in
    // yet, which 'accept' then makes with it.
    const { data: auth } = await db.auth.admin.getUserById(row.profile_id)
    return json({ email: auth?.user?.email ?? row.email, full_name: row.full_name, joined: row.joined })
  }

  // ----------------------------------------------------------------- accept --
  if (body.action === 'accept') {
    const password = typeof body.password === 'string' ? body.password : ''
    const problem = passwordProblem(password)
    if (problem) return json({ error: problem }, 400)

    const { data: profileId, error } = await db.rpc('take_pc_invite', { p_token_hash: hash })
    if (error) return json({ error: error.message }, 500)
    if (!profileId) return json({ error: DEAD }, 404)

    const giveBack = () => db.rpc('settle_pc_invite', { p_token_hash: hash, p_joined: false })

    const { data: profile } = await db
      .from('profiles')
      .select('id, full_name, email')
      .eq('id', profileId)
      .maybeSingle()
    if (!profile) {
      await giveBack()
      return json({ error: DEAD }, 404)
    }

    let { data: updated, error: authError } = await db.auth.admin.updateUserById(profile.id, {
      password,
      email_confirm: true,
    })
    // No sign-in behind the profile — manage_pc's second step failed and so
    // did taking the profile back. The link is for this person; make it.
    if (authError && /not.?found/i.test(authError.message) && profile.email) {
      ;({ data: updated, error: authError } = await db.auth.admin.createUser({
        id: profile.id,
        email: profile.email,
        password,
        email_confirm: true,
        user_metadata: { full_name: profile.full_name },
        app_metadata: { role: 'pc' },
      } as Parameters<typeof db.auth.admin.createUser>[0]))
    }
    if (authError || !updated?.user) {
      await giveBack()
      return json({ error: authError?.message ?? 'the password could not be set' }, 400)
    }

    await db.rpc('settle_pc_invite', { p_token_hash: hash, p_joined: true })
    return json({ email: updated.user.email ?? profile.email })
  }

  return json({ error: "action is 'open' or 'accept'" }, 400)
})
