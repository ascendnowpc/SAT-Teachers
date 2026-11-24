import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import { transportFrom } from '../../../apps/web/src/lib/mail.ts'
import { appBase, retentionNoticeEmail } from '../../../apps/web/src/lib/pcMail.ts'
import { ARCHIVE_BUCKET } from '../../../apps/web/src/lib/reportArchive.ts'
import { CORS, json } from '../_shared/http.ts'
import { sendMail } from '../_shared/send.ts'

/**
 * The clean-up's mail and its old PDFs (0107).
 *
 *   POST /functions/v1/retention_notice   {}
 *     from run_retention, through pg_net, with no token
 *     →  { mailed, failed, expired, errors }
 *
 * 1. Every open notice not mailed yet goes to the student's PC — or to every
 *    admin, when the student has none — with Keep and Delete now. Both buttons
 *    open My students, signed in; the mail decides nothing.
 * 2. Every saved report PDF past the policy's years is deleted: the file
 *    through the storage API, then its row, so a row left behind is a file to
 *    delete again rather than a file nobody can see (as 0087 forgets one).
 *
 * ## What this does NOT trust
 *
 * The request: it carries nothing and is read for nothing. What to mail and
 * what to delete is what the database says, read on the service role, and
 * nothing at all happens while the clean-up is off. A stranger who calls it
 * can at most send, a little early, a notice that was going anyway.
 */

interface ToMail {
  student_id: string
  full_name: string
  display_id: string | null
  last_active: string
  delete_at: string
  to: { name: string | null; email: string }[]
}

Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const db = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!, {
    auth: { persistSession: false },
  })
  const { data: policy, error: policyError } = await db
    .from('retention_policy')
    .select('enabled, notice_days')
    .maybeSingle()
  if (policyError) return json({ error: policyError.message }, 500)
  if (!policy?.enabled) return json({ mailed: 0, failed: 0, expired: 0, reason: 'off' })

  const errors: string[] = []
  const transport = transportFrom((key) => Deno.env.get(key))
  const base = appBase(Deno.env.get('APP_URL'))

  // 1. The notices.
  let mailed = 0
  let failed = 0
  const { data: due, error: dueError } = await db.rpc('retention_notices_to_email')
  if (dueError) errors.push(dueError.message)
  for (const n of (due ?? []) as ToMail[]) {
    if (n.to.length === 0) {
      failed += 1
      await db.rpc('retention_mark_emailed', { p_student: n.student_id, p_error: 'no PC or admin with an email address' })
      continue
    }
    let firstError: string | null = null
    for (const person of n.to) {
      const mail = retentionNoticeEmail({
        studentName: n.full_name,
        displayId: n.display_id,
        toName: person.name,
        lastActive: n.last_active,
        deleteOn: n.delete_at,
        days: policy.notice_days as number,
        base,
        studentId: n.student_id,
      })
      const sent = await sendMail(transport, { to: [person.email], ...mail })
      if (!sent.sent) firstError ??= sent.reason ?? 'not sent'
    }
    if (firstError) {
      failed += 1
      errors.push(`${n.full_name}: ${firstError}`)
    } else {
      mailed += 1
    }
    await db.rpc('retention_mark_emailed', { p_student: n.student_id, p_error: firstError })
  }

  // 2. The PDFs past their years.
  let expired = 0
  const { data: old, error: oldError } = await db.rpc('retention_archive_expired')
  if (oldError) errors.push(oldError.message)
  const rows = (old ?? []) as { id: string; path: string }[]
  for (let i = 0; i < rows.length; i += 100) {
    const chunk = rows.slice(i, i + 100)
    const { error: removeError } = await db.storage.from(ARCHIVE_BUCKET).remove(chunk.map((r) => r.path))
    if (removeError) {
      errors.push(`removing saved reports: ${removeError.message}`)
      break
    }
    const { data: n, error: forgetError } = await db.rpc('retention_forget_archived', { p_ids: chunk.map((r) => r.id) })
    if (forgetError) {
      errors.push(forgetError.message)
      break
    }
    expired += (n as number) ?? 0
  }

  return json({ mailed, failed, expired, errors })
})
