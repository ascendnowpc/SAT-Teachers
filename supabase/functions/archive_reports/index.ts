import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import { ARCHIVE_BUCKET, archivePath } from '../../../apps/web/src/lib/reportArchive.ts'
import type { ReportPdfDoc } from '../../../apps/web/src/lib/reportPdf.ts'
import type { SessionReportRow } from '../../../apps/web/src/lib/types.ts'
import { CORS, json } from '../_shared/http.ts'
import { reportPdf } from '../_shared/pdf.ts'
import {
  lessonDoc,
  logo,
  SESSION_SELECT,
  targetedDoc,
  type SessionRow,
} from '../_shared/reportDocs.ts'

/**
 * Saving a report before the rows it was drawn from are deleted (0087).
 *
 * The clean-up (0071) deletes a student a year after their last session and a
 * recording 90 days after it was made. Nothing a report is drawn from goes
 * until the report is saved, and saving is drawing a PDF, which the database
 * cannot do. So run_retention holds those rows back and calls this, which
 * draws each waiting report — the PDF the PC is sent, from _shared/reportDocs
 * — puts it in the private report-archive bucket, indexes it in
 * report_archive, and then calls run_retention again so what is now saved can
 * go.
 *
 *   POST /functions/v1/archive_reports   {}
 *     from run_retention, through pg_net, with no token
 *     →  { saved, failed, errors, waiting, run }
 *
 * ## What this does NOT trust
 *
 * The request. It carries nothing and is read for nothing: what to save is
 * whatever retention_reports_waiting says a deletion due now would take, read
 * here on the service role, and nothing is saved while the clean-up is off.
 * A stranger who calls it can at most make it save, a little early, reports an
 * admin would have had anyway.
 *
 * ## What a failure costs
 *
 * Time, never a report. A report that cannot be drawn is not saved, so what it
 * was drawn from is not deleted: it is still waiting at the next run, and the
 * clean-up says so. This asks for itself again only when it saved something,
 * so one report that will not draw cannot keep it running.
 */

/** Reports drawn in one call, and the time it may take: the rest wait for the next. */
const BATCH = 60
const BUDGET_MS = 100_000

interface Waiting {
  session_id: string
  student_id: string
  kind: 'report' | 'targeted'
  /** The generation it is drawn from, exactly as the database has it. */
  made_from: string
}

Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const url = Deno.env.get('SUPABASE_URL')!
  const service = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
  const appUrl = Deno.env.get('APP_URL') ?? ''
  const db = createClient(url, service, { auth: { persistSession: false, autoRefreshToken: false } })

  const { data: policy } = await db.from('retention_policy').select('enabled').maybeSingle()
  if (!policy?.enabled) return json({ saved: 0, reason: 'the clean-up is off' })

  const { data: rows, error } = await db.rpc('retention_reports_waiting')
  if (error) return json({ error: error.message }, 500)
  const waiting = (rows ?? []) as Waiting[]

  const started = Date.now()
  const mark = await logo(appUrl)
  let saved = 0
  const errors: string[] = []
  for (const w of waiting.slice(0, BATCH)) {
    if (Date.now() - started > BUDGET_MS) break
    try {
      await save(db, w, mark)
      saved += 1
    } catch (e) {
      const why = e instanceof Error ? e.message : String(e)
      console.error(`report ${w.session_id} could not be saved:`, why)
      errors.push(`${w.session_id}: ${why}`)
    }
  }

  // What is saved can go now. The rest is asked for again only if this call
  // got somewhere.
  const { data: run, error: runError } = await db.rpc('run_retention', { p_queue: saved > 0 })
  if (runError) console.error('the clean-up could not run after saving:', runError.message)

  return json({
    saved,
    failed: errors.length,
    errors: errors.slice(0, 10),
    waiting: waiting.length - saved,
    run: run ?? null,
  })
})

/** One report: drawn, stored, indexed. Throws on anything short of all three. */
// deno-lint-ignore no-explicit-any
async function save(db: any, w: Waiting, mark: Uint8Array | null): Promise<void> {
  const { data: session } = await db.from('sessions').select(SESSION_SELECT).eq('id', w.session_id).maybeSingle()
  if (!session) throw new Error('no such session')
  const s = session as SessionRow

  let doc: ReportPdfDoc
  if (w.kind === 'targeted') {
    doc = await targetedDoc(db, s)
  } else {
    const { data: report } = await db.from('session_reports').select('*').eq('session_id', s.id).maybeSingle()
    if (!(report as SessionReportRow | null)?.generated_at) throw new Error('the report has not been generated')
    doc = await lessonDoc(db, s, report as SessionReportRow)
  }
  const pdf = await reportPdf(doc, mark)

  const path = archivePath(w.student_id, w.session_id, w.made_from)
  const { error: upError } = await db.storage
    .from(ARCHIVE_BUCKET)
    .upload(path, pdf, { contentType: 'application/pdf', upsert: true })
  if (upError) throw new Error(`the file: ${upError.message}`)

  const { error: rowError } = await db.from('report_archive').upsert(
    {
      student_id: w.student_id,
      student_name: s.student?.full_name || 'Student',
      display_id: s.student?.display_id ?? null,
      subject: s.subject,
      session_id: w.session_id,
      kind: w.kind,
      session_at: s.started_at ?? s.scheduled_at,
      made_from: w.made_from,
      title: doc.filename,
      path,
      bytes: pdf.byteLength,
    },
    { onConflict: 'session_id,made_from' },
  )
  if (rowError) throw new Error(`the index: ${rowError.message}`)
}
