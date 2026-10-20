import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import { transportFrom } from '../../../apps/web/src/lib/mail.ts'
import { appBase, escapeHtml } from '../../../apps/web/src/lib/pcMail.ts'
import { CORS, json } from '../_shared/http.ts'
import { sendMail } from '../_shared/send.ts'

/**
 * Telling the admins that somebody new has a teacher account.
 *
 * Signup is open and a new teacher is in from the moment the account exists
 * (0058) — nobody approves it. So the admins are told instead of asked: 0058
 * puts a trigger on the profile row that calls this for every new teacher, and
 * the mail says who they are and links to their page, where an account nobody
 * recognises can be suspended.
 *
 *   POST /functions/v1/notify_new_teacher   { "profile_id": "<uuid>" }
 *     →  { sent, to, reason? }
 *
 * ## What this does NOT trust
 *
 * The body, beyond the id. It re-reads the profile on the service role and
 * sends nothing unless that row really is a teacher, has not been suspended
 * and was made within the last day — so the worst a stranger who guesses a
 * uuid can do is make the admins receive a second copy of a notice that is
 * true, and only while it is still news. Nothing about anybody else is in the
 * mail, and it goes only to addresses that are admins in this database, never
 * to an address from the request.
 *
 * ## How it is sent
 *
 * The way every mail from these functions goes (_shared/send.ts): SMTP with an
 * app password when SMTP_HOST, SMTP_USER and SMTP_PASS are set, and Resend when
 * RESEND_API_KEY is. Without either the function is a no-op that says so rather
 * than an error: the new teacher still shows on the admin's dashboard, and a
 * signup must never fail because a mail provider is down.
 */

/** How long after signup a notice is still news. The trigger calls within seconds. */
const NEWS_FOR_MS = 24 * 60 * 60 * 1000

Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const url = Deno.env.get('SUPABASE_URL')!
  const service = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!

  let body: { profile_id?: string; record?: { id?: string } }
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }

  // `record` is the shape a Supabase database webhook posts, so the same
  // function serves either way of wiring it up.
  const profileId = body.profile_id ?? body.record?.id
  if (!profileId) return json({ error: 'profile_id is required' }, 400)

  const db = createClient(url, service)

  // The facts, read here rather than taken from the caller.
  const { data: person } = await db
    .from('profiles')
    .select('id, full_name, email, display_id, role, suspended_at, created_at')
    .eq('id', profileId)
    .maybeSingle()

  if (!person) return json({ sent: false, reason: 'no such profile' }, 404)
  if (person.role !== 'teacher' || person.suspended_at) {
    return json({ sent: false, reason: 'that account is not a new teacher' })
  }
  if (Date.now() - new Date(person.created_at).getTime() > NEWS_FOR_MS) {
    return json({ sent: false, reason: 'that account is not new any more' })
  }

  const { data: admins } = await db
    .from('profiles')
    .select('email')
    .eq('role', 'admin')
    .eq('is_active', true)
    .not('email', 'is', null)

  const to = (admins ?? []).map((a) => a.email as string).filter(Boolean)
  if (to.length === 0) return json({ sent: false, reason: 'no admin has an email address' })

  const transport = transportFrom((key) => Deno.env.get(key))
  if (transport.kind === 'none') {
    // Not an error. The dashboard lists new teachers; this mail is a nudge,
    // and a missing nudge must not fail a signup.
    console.log(`new teacher ${person.display_id}; ${transport.reason}`)
    return json({ sent: false, reason: transport.reason })
  }

  const name = escapeHtml(person.full_name || 'Somebody')
  const email = escapeHtml(person.email ?? 'no email on the account')
  const link = `${appBase(Deno.env.get('APP_URL'))}/admin/teachers/${person.id}`

  const sent = await sendMail(transport, {
    to,
    subject: `${person.full_name || 'Somebody'} created a teacher account`,
    text: [
      `${person.full_name || 'Somebody'} (${person.email ?? 'no email on the account'}) has created a teacher account.`,
      '',
      'They can use the platform now. If you do not know them, open their page and suspend the account.',
      '',
      `Their page: ${link}`,
    ].join('\n'),
    html: `
        <div style="font-family:system-ui,-apple-system,'Segoe UI',sans-serif;color:#1E2752;line-height:1.55">
          <h2 style="margin:0 0 12px;font-size:18px">A new teacher account</h2>
          <p style="margin:0 0 6px"><strong>${name}</strong> — ${email}</p>
          <p style="margin:0 0 16px;color:#8796C6;font-size:13px">${escapeHtml(person.display_id)}</p>
          <p style="margin:0 0 16px">
            They can use the platform now. If you do not know them, open their page and suspend the
            account — that signs them out and stops their password working.
          </p>
          <p style="margin:0"><a href="${link}" style="background:#CEE177;color:#1E2752;padding:10px 18px;border-radius:999px;text-decoration:none;font-weight:600">Open their page</a></p>
        </div>
      `,
  })

  if (!sent.sent) return json({ sent: false, reason: sent.reason }, 502)
  return json({ sent: true, to })
})
