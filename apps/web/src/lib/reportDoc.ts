import type { DiagnosticRow } from './diagnostic.ts'
import type {
  Claim,
  DomainEvidence,
  Extraction,
  QuestionReading,
  TeacherFeedback,
} from './extraction.ts'
import { DOMAIN_ORDER } from './grid.ts'
import type { Attempt, Report } from './report.ts'

/**
 * The report document: the teacher's form and the recording, assembled.
 *
 * Three kinds of thing end up on a page here, and the whole design is that a
 * reader can always tell which is which:
 *
 *   the teacher's        reproduced word for word, never edited, never
 *                        summarised, never fed back to them as a finding
 *   the recording's      every sentence carrying the quote it came from
 *   the answers'         every figure computed from the rows
 *
 * The failure this is built against is subtle and worth naming. If the teacher
 * writes "rushed the inference questions" and a model is handed that sentence
 * and asked to write about the session, it will hand the sentence back in
 * different words — and the parent then reads one person's judgement as two
 * independent findings. So {@link DomainSection} keeps the teacher's column and
 * the transcript's column apart, and every transcript claim says whether it
 * supports, complicates or adds to what the teacher wrote.
 */

// -------------------------------------------------------------- per domain --

export interface DomainSection {
  domain: string
  label: string
  /** The teacher's row of the form, exactly as they filled it in. */
  teacher: {
    performance: 'tick' | 'cross' | null
    performanceNote: string
    strengths: string
    gaps: string
    targets: string
  }
  /** What the recording shows, and how it sits against the row above. */
  evidence: DomainEvidence[]
  /** Computed from the answer rows: right, total, seconds against target. */
  measured: { total: number; correct: number; seconds: number; target: number } | null
}

// ------------------------------------------------------------ per question --

/**
 * One question, with everything anyone said about it.
 *
 * `teacherFeedback` is the field this whole workflow was asked for: for any
 * question where the teacher said something in the lesson, the report says what
 * they said and shows the words. On a question where they said nothing it is
 * empty, and the report says that rather than filling the space.
 */
export interface QuestionSection {
  itemId: string
  sequence: number
  stem: string
  section: string | null
  skill: string | null
  /** From the answer rows, never from the recording. */
  correct: boolean
  chose: string | null
  answer: string | null
  seconds: number | null
  target: number | null
  rushed: boolean
  laboured: boolean
  /** Null when the transcript has nothing for this question. */
  reading: QuestionReading | null
  /** The teacher's own note against the question, typed during the lesson. */
  teacherNote: string | null
}

export interface ReportDoc {
  /** The teacher's comments on the session, verbatim. */
  reflection: string
  /** The teacher's closing words in the lesson itself, with the quote. */
  closingVerdict: Claim | null
  /** A score the teacher said aloud — recorded as that, never as the score. */
  teacherStatedScore: Claim | null
  studentSelfReport: Claim | null
  domains: DomainSection[]
  questions: QuestionSection[]
  /** Everything the numbers say, computed from the rows. */
  measured: Report
  /** How much of the recording the reading actually reached. */
  coverage: { covered: number; total: number }
}

function bandFor(report: Report, domain: string) {
  const band = report.sections.find((s) => s.key === domain)
  if (!band) return null
  return { total: band.total, correct: band.correct, seconds: band.seconds, target: band.target }
}

/**
 * Builds the document.
 *
 * Deliberately total and deliberately dull: it joins three things that were
 * each produced somewhere else and it decides nothing. Anything that looks like
 * a judgement in the output came from the teacher or from a quote.
 */
export function buildReportDoc(input: {
  rows: DiagnosticRow[]
  reflection: string
  report: Report
  extraction: Extraction | null
}): ReportDoc {
  const { rows, reflection, report, extraction } = input

  const byItem = new Map((extraction?.questions ?? []).map((q) => [q.itemId, q]))
  const byDomain = new Map<string, DomainEvidence[]>()
  for (const e of extraction?.session.domainEvidence ?? []) {
    byDomain.set(e.domain, [...(byDomain.get(e.domain) ?? []), e])
  }

  const rowFor = new Map(rows.map((r) => [r.domain, r]))

  const domains: DomainSection[] = DOMAIN_ORDER.map((domain) => {
    const row = rowFor.get(domain)
    return {
      domain,
      label: row?.label ?? domain,
      teacher: {
        performance: row?.performance ?? null,
        performanceNote: row?.performanceNote ?? '',
        strengths: row?.strengths ?? '',
        gaps: row?.gaps ?? '',
        targets: row?.targets ?? '',
      },
      evidence: byDomain.get(domain) ?? [],
      measured: bandFor(report, domain),
    }
  })

  const questions: QuestionSection[] = report.attempts.map((a: Attempt) => ({
    itemId: a.itemId,
    sequence: a.sequence,
    stem: a.stem,
    section: a.section,
    skill: a.skill,
    correct: a.correct,
    chose: a.chose,
    answer: a.answer,
    seconds: a.seconds,
    target: a.target,
    rushed: a.rushed,
    laboured: a.laboured,
    reading: byItem.get(a.itemId) ?? null,
    teacherNote: a.teacherNote,
  }))

  const covered = questions.filter((q) => q.reading?.covered).length

  return {
    reflection,
    closingVerdict: extraction?.session.closingVerdict ?? null,
    teacherStatedScore: extraction?.session.teacherStatedScore ?? null,
    studentSelfReport: extraction?.session.studentSelfReport ?? null,
    domains,
    questions,
    measured: report,
    coverage: { covered, total: questions.length },
  }
}

// ------------------------------------------------------------- read-backs --

/** Every question where the teacher actually said something, in paper order. */
export function questionsWithFeedback(doc: ReportDoc): QuestionSection[] {
  return doc.questions.filter((q) => (q.reading?.teacherFeedback.length ?? 0) > 0)
}

/**
 * The strategies and words the teacher taught, gathered across the session.
 *
 * A teacher who names the same rule on four questions has taught one thing four
 * times, and that is a far more useful line in a parent's report than four
 * separate notes. Gathered rather than deduplicated: the questions are kept so
 * the claim can still be pointed at all of them.
 */
export function taughtInSession(doc: ReportDoc): { feedback: TeacherFeedback; questions: number[] }[] {
  const out: { feedback: TeacherFeedback; questions: number[] }[] = []
  for (const q of doc.questions) {
    for (const f of q.reading?.teacherFeedback ?? []) {
      if (f.kind !== 'strategy' && f.kind !== 'vocabulary') continue
      const seen = out.find((o) => o.feedback.evidence.quote === f.evidence.quote)
      if (seen) seen.questions.push(q.sequence)
      else out.push({ feedback: f, questions: [q.sequence] })
    }
  }
  return out
}

/**
 * Where the recording and the teacher's form disagree.
 *
 * The most valuable rows in the document and the ones a teacher should read
 * before publishing, because one of the two is wrong and only they can say
 * which.
 */
export function disagreements(doc: ReportDoc): DomainEvidence[] {
  return doc.domains.flatMap((d) => d.evidence.filter((e) => e.relation === 'complicates'))
}

/**
 * Claims resting on a line Fathom attributed to someone else.
 *
 * Not errors — the relabelling is usually the model correcting Fathom, which is
 * why it is allowed to. But it is the one place a wrong reading would be
 * invisible, so the teacher gets the list.
 */
export function relabelledClaims(doc: ReportDoc): { sequence: number; claim: Claim }[] {
  const out: { sequence: number; claim: Claim }[] = []
  for (const q of doc.questions) {
    const claims: (Claim | null)[] = [
      q.reading?.studentReasoning ?? null,
      q.reading?.misunderstanding ?? null,
      q.reading?.vocabularyGap ?? null,
      ...(q.reading?.teacherFeedback ?? []),
    ]
    for (const c of claims) {
      if (c?.evidence.relabelled) out.push({ sequence: q.sequence, claim: c })
    }
  }
  return out
}
