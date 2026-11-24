/**
 * "What should I do?" (the dashboard blueprint's guidance on demand): a short
 * plan the model writes from the student's own numbers — nothing written by
 * hand. "Algebra strong, keep testing. Problem-Solving weak: revise
 * Percentages."
 *
 * The model is shown the numbers below and nothing else: each domain and skill
 * out of 40 with its colour, how many tests asked it and its last verdict, the
 * goal, the latest SAT and the days to the exam. Each step it writes must name
 * a domain or skill it was shown, and says the numbers it comes from, so a
 * plan can always be traced back to the dashboard it sits on. The horizon —
 * from today, two weeks to the exam, one week to go — changes what it is asked
 * for, not what it is shown.
 */
import { outOf40, RAG_LABEL } from './parentReport.ts'
import { VERDICT_LABELS } from './progress.ts'
import { SUBJECT_VIEW, type SubjectMeasure } from './subjectProgress.ts'

export type Horizon = 'now' | 'two_weeks' | 'one_week'

export const HORIZON_LABEL: Record<Horizon, string> = {
  now: 'From today',
  two_weeks: '2 weeks to exam',
  one_week: '1 week to go',
}

export interface PlanFacts {
  student: string
  today: string
  daysToExam: number | null
  horizon: Horizon
  goal: { total: number | null; rw: number | null; math: number | null; college: string | null }
  latestSat: { total: number; rw: number; math: number; on: string } | null
  subjects: {
    name: string
    domains: {
      label: string
      /** Out of 40; null when nothing has asked it yet. */
      score: number | null
      status: string
      tests: number
      verdict: string | null
      skills: { label: string; score: number | null; status: string }[]
    }[]
  }[]
}

export function planFacts(input: {
  student: string
  today: string
  daysToExam: number | null
  horizon: Horizon
  goal: PlanFacts['goal']
  latestSat: PlanFacts['latestSat']
  measures: SubjectMeasure[]
}): PlanFacts {
  return {
    student: input.student,
    today: input.today,
    daysToExam: input.daysToExam,
    horizon: input.horizon,
    goal: input.goal,
    latestSat: input.latestSat,
    subjects: input.measures.map((m) => ({
      name: SUBJECT_VIEW[m.subject].name,
      domains: m.sections.map((d) => ({
        label: d.label,
        score: d.latest ? outOf40(d.latest.level) : null,
        status: d.rag ? RAG_LABEL[d.rag] : 'Not tested yet',
        tests: d.attempts.length,
        verdict: d.verdict ? VERDICT_LABELS[d.verdict] : null,
        skills: d.skills
          .filter((k) => k.latest)
          .map((k) => ({ label: k.label, score: outOf40(k.latest!.level), status: RAG_LABEL[k.rag!] })),
      })),
    })),
  }
}

/** Whether there is anything to plan from: a domain tested, or an SAT score. */
export function hasPlanData(f: PlanFacts): boolean {
  return f.latestSat !== null || f.subjects.some((s) => s.domains.some((d) => d.score !== null))
}

export const PLAN_SYSTEM = [
  'You are an SAT coach at Ascend Now, a tutoring company that coaches by component:',
  'English (Reading and Writing) and Math, each split into four domains and their skills.',
  'Write a short plan for the student from the numbers you are given and nothing else.',
  'Scores are out of 40 on the school\'s scale: 36 and above is mastered (keep it light, keep testing),',
  '25 to 35 needs work, below 25 is the focus now. Weak domains get named skills to revise;',
  'strong ones get a light touch. Never predict an SAT score, never invent a number, a skill or a',
  'resource, and do not dwell on the total: the work is in the sections. Write to the student,',
  'warmly and plainly, in short sentences.',
].join(' ')

const HORIZON_ASK: Record<Horizon, string> = {
  now: 'Plan the next two or three weeks of practice from today.',
  two_weeks: 'Plan the last two weeks before the exam: consolidate, test under time, no new topics late.',
  one_week: 'Plan the last week before the exam: light review of the strongest, timed practice, rest the day before.',
}

export function planPrompt(f: PlanFacts): string {
  return [
    HORIZON_ASK[f.horizon],
    f.daysToExam !== null ? `The exam is in ${f.daysToExam} days.` : 'The exam date is not set yet.',
    'Give a one-sentence headline, then three to five steps, the most important first. Each step names',
    'one domain or skill exactly as written below, says what to do, and says the numbers it comes from.',
    '',
    JSON.stringify(f),
  ].join('\n')
}

export const PLAN_SCHEMA = {
  type: 'object',
  properties: {
    headline: { type: 'string' },
    steps: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          focus: { type: 'string', description: 'One domain or skill, exactly as named in the numbers.' },
          action: { type: 'string', description: 'What to do, in a sentence.' },
          why: { type: 'string', description: 'The numbers it comes from, e.g. "Algebra 39/40 over 3 tests".' },
        },
        required: ['focus', 'action', 'why'],
      },
    },
  },
  required: ['headline', 'steps'],
}

export interface PlanStep {
  focus: string
  action: string
  why: string
}

export interface StudyPlan {
  headline: string
  steps: PlanStep[]
}

const clean = (v: unknown, max: number) => (typeof v === 'string' ? v.replace(/\s+/g, ' ').trim().slice(0, max) : '')

/**
 * The model's plan, checked: a headline, and at most five steps that each name
 * a domain or skill it was shown. A step about anything else is dropped.
 * Throws when nothing usable is left.
 */
export function parsePlan(raw: unknown, f: PlanFacts): StudyPlan {
  const r = (raw ?? {}) as { headline?: unknown; steps?: unknown }
  const names = f.subjects.flatMap((s) => s.domains.flatMap((d) => [d.label, ...d.skills.map((k) => k.label)]))
  const known = (focus: string) => names.some((n) => focus.toLowerCase().includes(n.toLowerCase()))
  const steps = (Array.isArray(r.steps) ? r.steps : [])
    .map((s: { focus?: unknown; action?: unknown; why?: unknown }) => ({
      focus: clean(s.focus, 80),
      action: clean(s.action, 280),
      why: clean(s.why, 160),
    }))
    .filter((s) => s.focus && s.action && known(s.focus))
    .slice(0, 5)
  const headline = clean(r.headline, 240)
  if (!headline || steps.length === 0) throw new Error('the plan came back without steps on your domains — try again')
  return { headline, steps }
}

/** The horizons worth offering: the two late ones only once the exam date is set. */
export function horizonsFor(daysToExam: number | null): Horizon[] {
  return daysToExam === null || daysToExam < 0 ? ['now'] : ['now', 'two_weeks', 'one_week']
}
