import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import { transportFrom } from '../../../apps/web/src/lib/mail.ts'
import { credentialsEmail, temporaryPassword } from '../../../apps/web/src/lib/pcMail.ts'
import { CORS, json } from '../_shared/http.ts'
import { sendMail } from '../_shared/send.ts'

/**
 * Adding a PC, and giving one a new password. An admin's, from Users.
 *
 *   POST /functions/v1/manage_pc  { action: 'create', first_name, last_name, email }
 *   POST /functions/v1/manage_pc  { action: 'reset', profile_id }
 *     →  { profile, emailed, reason?, password? }
 *
 * A PC is somebody who signs in, so making one makes a sign-in, which only the
 * service role can do — and that is why this is a function and not an RPC.
 * It checks its caller is an admin, as the caller, the way every admin door in
 * the schema does (is_admin), and only then acts on the service role.
 *
 * Two steps, in this order (0055 says why): the profile first, through
 * create_pc_profile, then the sign-in under the profile's id with a temporary
 * password. If the sign-in cannot be made, the profile goes again — a PC who
 * cannot sign in is a name on a list that will never read anything.
 *
 * Then the mail with the email address and the password. If there is no way
 * to send it (no SMTP secrets yet, or the server said no), the account is still
 * made and the password comes back in the response instead, once, for the
 * admin to hand over themselves. It is never stored anywhere: not in the
 * database, not in a log, and not in the response when the mail did go.
 */

interface CreateBody {
  action: 'create'
  first_name?: string
  last_name?: string
  email?: string
}

interface ResetBody {
  action: 'reset'
  profile_id?: string
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
  if (admin !== true) return json({ error: 'only an admin can add a PC or change their password' }, 403)

  let body: CreateBody | ResetBody
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }

  const db = createClient(url, service, { auth: { persistSession: false, autoRefreshToken: false } })
  const transport = transportFrom((key) => Deno.env.get(key))
  const appUrl = Deno.env.get('APP_URL') ?? ''

  /** Sends the sign-in, and says what the admin needs to know about it. */
  async function deliver(
    profile: { full_name: string },
    email: string,
    password: string,
    reset: boolean,
  ): Promise<{ emailed: boolean; reason?: string; password?: string }> {
    const mail = credentialsEmail({ name: profile.full_name, email, password, appUrl, reset })
    const sent = await sendMail(transport, { to: [email], ...mail })
    if (sent.sent) return { emailed: true }
    console.log(`PC sign-in for ${email} not emailed: ${sent.reason}`)
    return { emailed: false, reason: sent.reason, password }
  }

  // ----------------------------------------------------------------- create --
  if (body.action === 'create') {
    const { data: profile, error } = await db.rpc('create_pc_profile', {
      p_first: body.first_name ?? '',
      p_last: body.last_name ?? '',
      p_email: body.email ?? '',
    })
    if (error || !profile) return json({ error: error?.message ?? 'the PC could not be added' }, 400)

    const password = temporaryPassword()
    const { error: signInError } = await db.auth.admin.createUser({
      id: profile.id,
      email: profile.email,
      password,
      email_confirm: true,
      user_metadata: { full_name: profile.full_name },
      app_metadata: { role: 'pc' },
    } as Parameters<typeof db.auth.admin.createUser>[0])

    if (signInError) {
      await db.from('profiles').delete().eq('id', profile.id)
      return json({ error: `the sign-in could not be made: ${signInError.message}` }, 400)
    }

    return json({ profile, ...(await deliver(profile, profile.email, password, false)) })
  }

  // ------------------------------------------------------------------ reset --
  if (body.action === 'reset') {
    if (!body.profile_id) return json({ error: 'profile_id is required' }, 400)

    const { data: profile } = await db
      .from('profiles')
      .select('id, role, full_name, email, display_id, is_active, suspended_at')
      .eq('id', body.profile_id)
      .maybeSingle()

    if (!profile || profile.role !== 'pc') return json({ error: 'no such PC' }, 404)
    // A suspended account is banned at the auth server (0045); a new password
    // would be a password for a door that does not open.
    if (!profile.is_active) return json({ error: `${profile.full_name} is suspended — reactivate them first` }, 409)

    const password = temporaryPassword()
    const { data: updated, error } = await db.auth.admin.updateUserById(profile.id, { password })

    let email = updated?.user?.email ?? profile.email
    if (error) {
      // The one way a PC can be left without a sign-in: the second step of
      // making them failed and so did taking the profile back. Make it now.
      if (!/not.?found/i.test(error.message) || !profile.email) {
        return json({ error: `the password could not be changed: ${error.message}` }, 400)
      }
      const { error: createError } = await db.auth.admin.createUser({
        id: profile.id,
        email: profile.email,
        password,
        email_confirm: true,
        user_metadata: { full_name: profile.full_name },
        app_metadata: { role: 'pc' },
      } as Parameters<typeof db.auth.admin.createUser>[0])
      if (createError) return json({ error: `the sign-in could not be made: ${createError.message}` }, 400)
      email = profile.email
    }

    if (!email) return json({ error: `${profile.full_name} has no email address` }, 409)
    return json({ profile, ...(await deliver(profile, email, password, true)) })
  }

  return json({ error: "action is 'create' or 'reset'" }, 400)
})
