import { createClient, type SupabaseClient } from 'npm:@supabase/supabase-js@2.45.4'

import { INVITE_DAYS, inviteLink, newToken, tokenHash } from '../../../apps/web/src/lib/invite.ts'
import { transportFrom } from '../../../apps/web/src/lib/mail.ts'
import { inviteEmail } from '../../../apps/web/src/lib/pcMail.ts'
import { CORS, json } from '../_shared/http.ts'
import { sendMail } from '../_shared/send.ts'

/**
 * Adding a PC, and sending one a link to choose a password. An admin's, from
 * Users.
 *
 *   POST /functions/v1/manage_pc  { action: 'create', first_name, last_name, email }
 *   POST /functions/v1/manage_pc  { action: 'invite', profile_id }
 *     →  { profile, emailed, reason?, link?, joined, expires_at }
 *
 * A PC is somebody who signs in, so making one makes a sign-in, which only the
 * service role can do — and that is why this is a function and not an RPC.
 * It checks its caller is an admin, as the caller, the way every admin door in
 * the schema does (is_admin), and only then acts on the service role.
 *
 * Creating is two steps, in this order (0055 says why): the profile first,
 * through create_pc_profile, then the sign-in under the profile's id —
 * confirmed, and with a password nobody is ever told. If the sign-in cannot be
 * made, the profile goes again: a PC who cannot sign in is a name on a list
 * that will never read anything.
 *
 * Then the link. It opens the join page with the PC's address on it, they
 * choose their password there (accept_pc_invite), and they are in; following
 * a link that came to the address is the proof of it, so nothing asks them to
 * confirm it again. 'invite' sends another: to a PC whose first one ran out,
 * or to one who has joined and needs a new password.
 *
 * If the mail cannot go (no SMTP secrets yet, or the server said no), the PC
 * is still made and the link comes back in the response instead, once, for the
 * admin to hand over. The link is never stored — pc_invites keeps its SHA-256
 * — and it is not in the response when the mail did go.
 */

interface CreateBody {
  action: 'create'
  first_name?: string
  last_name?: string
  email?: string
}

interface InviteBody {
  action: 'invite'
  profile_id?: string
}

/**
 * A password nobody is told: 32 random bytes, until the link replaces it. The
 * tail is for a project that requires a lower-case letter, a capital, a digit
 * and a symbol of every password — the auth server asks it of this one too,
 * and a PC it refused to make would be a strange way to find that out.
 */
function unguessable(): string {
  return `${newToken()}-aA1`
}

/**
 * The address a PC signs in with — the auth server's, not the copy on the
 * profile, which its owner can edit (notify_pc_report reads the same one) —
 * making the sign-in if it is missing. Missing is the one way a PC can be left
 * without one: the second step of making them failed and so did taking the
 * profile back.
 */
async function signInAddress(
  db: SupabaseClient,
  profile: { id: string; email: string | null; full_name: string },
): Promise<{ email: string } | { error: string }> {
  const { data, error } = await db.auth.admin.getUserById(profile.id)
  if (data?.user?.email) return { email: data.user.email }
  if (error && !/not.?found/i.test(error.message)) return { error: error.message }
  if (!profile.email) return { error: `${profile.full_name} has no email address` }
  const { error: createError } = await db.auth.admin.createUser({
    id: profile.id,
    email: profile.email,
    password: unguessable(),
    email_confirm: true,
    user_metadata: { full_name: profile.full_name },
    app_metadata: { role: 'pc' },
  } as Parameters<typeof db.auth.admin.createUser>[0])
  return createError ? { error: createError.message } : { email: profile.email }
}

Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const url = Deno.env.get('SUPABASE_URL')!
  const anon = Deno.env.get('SUPABASE_ANON_KEY')!
  const service = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!

  // ------------------------------------------------------------ the caller --
  const authorization = req.headers.get('Authorization') ?? ''
  if (!authorization) return json({ error: 'not signed in' }, 401)

  const asCaller = createClient(url, anon, {
    global: { headers: { Authorization: authorization } },
    auth: { persistSession: false },
  })
  const { data: user } = await asCaller.auth.getUser()
  if (!user?.user) return json({ error: 'not signed in' }, 401)

  const { data: admin } = await asCaller.rpc('is_admin')
  if (admin !== true) return json({ error: 'only an admin can add a PC or send them a link' }, 403)

  let body: CreateBody | InviteBody
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }

  const db = createClient(url, service, { auth: { persistSession: false, autoRefreshToken: false } })
  const transport = transportFrom((key) => Deno.env.get(key))
  const appUrl = Deno.env.get('APP_URL') ?? ''

  /** Makes a new link, sends it to the address given, and says what the admin needs to know about it. */
  async function invite(profile: { id: string; full_name: string }, email: string) {
    const token = newToken()
    const { data: row, error } = await db.rpc('issue_pc_invite', {
      p_profile: profile.id,
      p_token_hash: await tokenHash(token),
    })
    if (error || !row) return { error: error?.message ?? 'the link could not be made' }

    const joined = row.joined_at !== null
    const link = inviteLink(appUrl, token)
    const base = { joined, expires_at: row.expires_at as string }

    const mail = inviteEmail({ name: profile.full_name, link, joined, days: INVITE_DAYS })
    const sent = await sendMail(transport, { to: [email], ...mail })
    if (sent.sent) return { ...base, emailed: true }
    console.log(`PC link for ${email} not emailed: ${sent.reason}`)
    return { ...base, emailed: false, reason: sent.reason, link }
  }

  // ----------------------------------------------------------------- create --
  if (body.action === 'create') {
    const { data: profile, error } = await db.rpc('create_pc_profile', {
      p_first: body.first_name ?? '',
      p_last: body.last_name ?? '',
      p_email: body.email ?? '',
    })
    if (error || !profile) return json({ error: error?.message ?? 'the PC could not be added' }, 400)

    const { error: signInError } = await db.auth.admin.createUser({
      id: profile.id,
      email: profile.email,
      password: unguessable(),
      email_confirm: true,
      user_metadata: { full_name: profile.full_name },
      app_metadata: { role: 'pc' },
    } as Parameters<typeof db.auth.admin.createUser>[0])

    if (signInError) {
      await db.from('profiles').delete().eq('id', profile.id)
      return json({ error: `the sign-in could not be made: ${signInError.message}` }, 400)
    }

    const sent = await invite(profile, profile.email)
    // The PC is made either way; without a link they are one "Send the
    // invitation" away from joining, and the list says so.
    if ('error' in sent) return json({ profile, emailed: false, reason: sent.error, joined: false })
    return json({ profile, ...sent })
  }

  // ----------------------------------------------------------------- invite --
  if (body.action === 'invite') {
    if (!body.profile_id) return json({ error: 'profile_id is required' }, 400)

    const { data: profile } = await db
      .from('profiles')
      .select('id, role, full_name, email, display_id, is_active, suspended_at')
      .eq('id', body.profile_id)
      .maybeSingle()

    if (!profile || profile.role !== 'pc') return json({ error: 'no such PC' }, 404)
    // A suspended account is banned at the auth server (0045); a password for
    // a door that does not open helps nobody.
    if (!profile.is_active) return json({ error: `${profile.full_name} is suspended — reactivate them first` }, 409)

    const address = await signInAddress(db, profile)
    if ('error' in address) return json({ error: `the sign-in could not be made: ${address.error}` }, 400)

    const sent = await invite(profile, address.email)
    if ('error' in sent) return json({ error: sent.error }, 400)
    return json({ profile, ...sent })
  }

  return json({ error: "action is 'create' or 'invite'" }, 400)
})
