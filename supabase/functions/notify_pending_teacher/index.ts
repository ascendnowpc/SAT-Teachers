import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

/**
 * Telling the admins that somebody is waiting.
 *
 * A teacher account arrives inactive (0044) and can see nothing at all until an
 * admin approves it. The portal shows the queue, but a queue only works if
 * somebody looks at it, and the person waiting has no way to say "I am here" —
 * they cannot get past the sign-in screen to ask. So the database says it for
 * them: 0046 puts a trigger on the profile row that calls this.
 *
 *   POST /functions/v1/notify_pending_teacher   { "profile_id": "<uuid>" }
 *     →  { sent, to, reason? }
 *
 * ## What this does NOT trust
 *
 * The body, beyond the id. It re-reads the profile on the service role and
 * sends nothing unless that row really is a teacher, really is inactive and
 * really has not been suspended — so the worst a stranger who guesses a uuid
 * can do is make the admins receive a second copy of a notice that is true.
 * Nothing about anybody else is in the mail, and it goes only to addresses
 * that are admins in this database, never to an address from the request.
 *
 * ## Why Resend
 *
 * Supabase's own SMTP settings send the auth emails and nothing else; a
 * transactional mail to a third party needs a provider. Resend is one HTTPS
 * call with an API key, which is the whole of the integration — `RESEND_API_KEY`
 * and, optionally, `MAIL_FROM`. Without the key the function is a no-op that
 * says so rather than an error: an approval queue that nobody was emailed about
 * is a slower workflow, not a broken one, and a signup must never fail because
 * a mail provider is down.
 */

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
}

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...CORS, 'Content-Type': 'application/json' },
  })
}

function escapeHtml(text: string): string {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
}

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
    .select('id, full_name, email, display_id, role, is_active, suspended_at, created_at')
    .eq('id', profileId)
    .maybeSingle()

  if (!person) return json({ sent: false, reason: 'no such profile' }, 404)
  if (person.role !== 'teacher' || person.is_active || person.suspended_at) {
    return json({ sent: false, reason: 'that account is not waiting for approval' })
  }

  const { data: admins } = await db
    .from('profiles')
    .select('email')
    .eq('role', 'admin')
    .eq('is_active', true)
    .not('email', 'is', null)

  const to = (admins ?? []).map((a) => a.email as string).filter(Boolean)
  if (to.length === 0) return json({ sent: false, reason: 'no admin has an email address' })

  const key = Deno.env.get('RESEND_API_KEY')
  if (!key) {
    // Not an error. The queue in the portal is the source of truth; this mail
    // is a nudge towards it, and a missing nudge must not fail a signup.
    console.log(`pending teacher ${person.display_id}; no RESEND_API_KEY, so no mail sent`)
    return json({ sent: false, reason: 'RESEND_API_KEY is not set' })
  }

  const from = Deno.env.get('MAIL_FROM') ?? 'Ascend Now <onboarding@resend.dev>'
  const appUrl = Deno.env.get('APP_URL') ?? ''
  const name = escapeHtml(person.full_name || 'Somebody')
  const email = escapeHtml(person.email ?? 'no email on the account')
  const link = appUrl ? `${appUrl.replace(/\/$/, '')}/admin/users` : ''

  const response = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: { Authorization: `Bearer ${key}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({
      from,
      to,
      subject: `${person.full_name || 'A teacher'} is waiting for approval`,
      html: `
        <div style="font-family:system-ui,-apple-system,'Segoe UI',sans-serif;color:#1E2752;line-height:1.55">
          <h2 style="margin:0 0 12px;font-size:18px">A teacher account is waiting</h2>
          <p style="margin:0 0 6px"><strong>${name}</strong> — ${email}</p>
          <p style="margin:0 0 16px;color:#8796C6;font-size:13px">${escapeHtml(person.display_id)}</p>
          <p style="margin:0 0 16px">
            They can see nothing at all until an admin approves them — not a session, not a
            question, not a student — because a teacher account reads every answer key in the bank.
          </p>
          ${
            link
              ? `<p style="margin:0"><a href="${link}" style="background:#CEE177;color:#1E2752;padding:10px 18px;border-radius:999px;text-decoration:none;font-weight:600">Review it in Users</a></p>`
              : `<p style="margin:0;color:#8796C6">Open Users in the admin portal to approve or ignore it.</p>`
          }
        </div>
      `,
    }),
  })

  if (!response.ok) {
    const detail = await response.text()
    return json({ sent: false, reason: `the mail provider refused it: ${detail}` }, 502)
  }

  return json({ sent: true, to })
})
