import { createClient } from 'npm:@supabase/supabase-js@2.45.4'

import type { BluebookRow } from '../../../apps/web/src/lib/bluebook.ts'
import { DEFAULT_MODEL, FALLBACK_MODEL, KEY_VAR, geminiReader } from '../../../apps/web/src/lib/gemini.ts'
import { daysUntil, goalTotal, latestSat, type StudentGoal } from '../../../apps/web/src/lib/goal.ts'
import { asProgress, type StudentReport } from '../../../apps/web/src/lib/parentReport.ts'
import type { StudentProgress } from '../../../apps/web/src/lib/progress.ts'
import {
  hasPlanData,
  parsePlan,
  PLAN_SCHEMA,
  PLAN_SYSTEM,
  planFacts,
  planPrompt,
  type Horizon,
} from '../../../apps/web/src/lib/studyPlan.ts'
import { measureSubject, SUBJECT_ORDER, type SubjectMeasure } from '../../../apps/web/src/lib/subjectProgress.ts'
import { CORS, json } from '../_shared/http.ts'

/**
 * "What should I do?" (the dashboard blueprint's guidance on demand).
 *
 *   POST /functions/v1/student_plan
 *     { key, horizon }              the student, signed in with their ID and PIN
 *     { student_id, horizon }       staff, or the student's PC, with their token
 *     →  { plan: { headline, steps }, model, generated_at }
 *
 * `horizon` is 'now', 'two_weeks' or 'one_week'. The numbers are read through
 * the doors the pages use — student_report and student_goal_state by the key, or
 * student_progress and the tables under row-level security for staff and the
 * PC — so this sees no more than the asker could; lib/studyPlan turns them into
 * what the model is shown, and checks the plan that comes back. Nothing is
 * stored. GEMINI_API_KEY, PLAN_MODEL if set.
 */
Deno.serve(async (req: Request): Promise<Response> => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: CORS })
  if (req.method !== 'POST') return json({ error: 'POST only' }, 405)

  const apiKey = Deno.env.get(KEY_VAR)
  if (!apiKey) return json({ error: `${KEY_VAR} is not set.` }, 500)

  let body: { key?: string; student_id?: string; horizon?: string }
  try {
    body = await req.json()
  } catch {
    return json({ error: 'expected a JSON body' }, 400)
  }
  const horizon: Horizon = body.horizon === 'two_weeks' || body.horizon === 'one_week' ? body.horizon : 'now'

  const db = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_ANON_KEY')!, {
    global: { headers: { Authorization: req.headers.get('Authorization') ?? '' } },
    auth: { persistSession: false },
  })

  let student = 'The student'
  let goal: StudentGoal | null = null
  let scores: BluebookRow[] = []
  const measures: SubjectMeasure[] = []

  if (body.key) {
    // ------------------------------------------------------ the student ---
    const [rep, g, b] = await Promise.all([
      db.rpc('student_report', { p_key: body.key }),
      db.rpc('student_goal_state', { p_key: body.key }),
      db.rpc('student_bluebook_scores', { p_key: body.key }),
    ])
    const err = rep.error ?? g.error ?? b.error
    if (err) return json({ error: /signed out/i.test(err.message) ? 'signed out' : err.message }, 401)
    const report = rep.data as StudentReport
    student = report.student.full_name
    goal = (g.data as { goal: StudentGoal | null } | null)?.goal ?? null
    scores = (b.data ?? []) as BluebookRow[]
    for (const s of SUBJECT_ORDER) {
      const payload = report.subjects[s]
      if (payload) measures.push(measureSubject(s, asProgress(payload), scores))
    }
  } else {
    // ------------------------------------------------- staff, or the PC ---
    if (!body.student_id) return json({ error: 'key or student_id is required' }, 400)
    const { data: user } = await db.auth.getUser()
    if (!user?.user) return json({ error: 'not signed in' }, 401)
    const [p, g, b, ...progress] = await Promise.all([
      db.from('profiles').select('full_name').eq('id', body.student_id).maybeSingle(),
      db.from('student_goals').select('target_total, target_rw, target_math, next_test_on, college_note').eq('student_id', body.student_id).maybeSingle(),
      db.from('bluebook_scores').select('test_name, taken_on, total, reading_writing, math, domains').eq('student_id', body.student_id),
      ...SUBJECT_ORDER.map((s) => db.rpc('student_progress', { p_student: body.student_id, p_subject: s })),
    ])
    const refused = progress.find((r) => r.error)
    if (refused?.error) return json({ error: refused.error.message }, 403)
    student = (p.data as { full_name?: string } | null)?.full_name ?? student
    goal = (g.data ?? null) as StudentGoal | null
    scores = (b.data ?? []) as BluebookRow[]
    progress.forEach((r, i) => {
      if (r.data) measures.push(measureSubject(SUBJECT_ORDER[i], r.data as StudentProgress, scores))
    })
  }

  // ------------------------------------------------------------ the plan ---
  const today = new Date().toISOString().slice(0, 10)
  const days = goal?.next_test_on ? daysUntil(goal.next_test_on, today) : null
  const facts = planFacts({
    student: student.split(' ')[0],
    today,
    daysToExam: days !== null && days >= 0 ? days : null,
    horizon,
    goal: {
      total: goalTotal(goal),
      rw: goal?.target_rw ?? null,
      math: goal?.target_math ?? null,
      college: goal?.college_note ?? null,
    },
    latestSat: latestSat(scores),
    measures,
  })
  if (!hasPlanData(facts)) {
    return json({ error: 'there is nothing to plan from yet: take a check-in, or add an SAT score' }, 409)
  }

  const reader = geminiReader(apiKey, Deno.env.get('PLAN_MODEL') || DEFAULT_MODEL, { fallback: Deno.env.get('FALLBACK_MODEL') || FALLBACK_MODEL })
  try {
    const answer = await reader.read({ system: PLAN_SYSTEM, prompt: planPrompt(facts), schema: PLAN_SCHEMA })
    return json({ plan: parsePlan(answer, facts), model: reader.model, horizon, generated_at: new Date().toISOString() })
  } catch (e) {
    return json({ error: e instanceof Error ? e.message : String(e) }, 502)
  }
})
