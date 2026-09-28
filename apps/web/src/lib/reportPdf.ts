import { diagnosisLabel, difficultyLabel, sectionLabel, skillLabel, subjectLabel } from './constants.ts'
import { rowsFrom } from './diagnostic.ts'
import { FEEDBACK_LABELS, RELATION_LABELS, type Claim, type Extraction } from './extraction.ts'
import { buildGrid, confidenceAverage, recommendedPriority, timeManagement } from './grid.ts'
import { buildReport, formatDuration, paceLabel, type Attempt } from './report.ts'
import { buildReportDoc, disagreements, hasFindings } from './reportDoc.ts'
import { formatUtc } from './time.ts'
import type { DomainNote, SessionItem, SessionReportRow, Subject } from './types.ts'

/**
 * The report, as the PDF emailed to a PC prints it.
 *
 * The report page is computed from the session's rows every time it is read,
 * and so is this, from the same rows by the same functions: buildReport,
 * buildGrid, buildReportDoc. What comes out is text in the page's order and
 * nothing else — no layout, no fonts — so the suite can read the PDF's words
 * without a PDF, and the edge function that draws it (_shared/pdf.ts) only has
 * to decide where they go. A PDF that said something the page does not would
 * be a second report; this is the one report, printed.
 */

export interface PdfClaim {
  label: string
  text: string
  quote: string
  /** "teacher at 4:12 · from the end-of-lesson review" */
  cite: string
}

export interface PdfDomain {
  label: string
  skillFocus: string
  /** What the answers count: "3/4 correct", or that it was not tested. */
  measured: string
  /** The teacher's own mark and anything they wrote beside it. */
  marked: string | null
  strengths: string
  gaps: string
  targets: string[]
  /** Says so when the targets are the form's own wording rather than the teacher's. */
  targetsNote: string | null
  evidence: PdfClaim[] | null
}

export interface PdfMiss {
  head: string
  why: string
  teacher: string | null
  student: string | null
}

export interface PdfQuestion {
  sequence: string
  skill: string
  level: string
  answer: string
  correct: boolean
  time: string
  pace: string
  diagnosis: string
}

export interface PdfFindings {
  head: string
  teacherNote: string | null
  claims: PdfClaim[]
}

export interface PdfBand {
  label: string
  score: string
  /** 0..1, for the bar. */
  share: number
}

export interface ReportPdfDoc {
  title: string
  subtitle: string
  status: 'Draft' | 'Published'
  people: { label: string; value: string }[]
  /** No answered questions: the report says so and stops, as the page does. */
  empty: boolean
  stats: { value: string; label: string; note: string | null }[]
  /** Why the recording's findings are or are not here. Null when they are. */
  recordingNote: string | null
  domains: PdfDomain[]
  reflection: string | null
  conflicts: PdfClaim[]
  summary: { label: string; value: string; notes: string[] }[]
  summaryNote: string | null
  teacherRead: string | null
  skills: PdfBand[]
  sections: PdfBand[]
  diagnoses: string | null
  pace: string[]
  misses: PdfMiss[]
  findings: { intro: string; questions: PdfFindings[]; unsaid: string | null } | null
  levelNote: string
  showLevel: boolean
  questions: PdfQuestion[]
  /** For the foot of every page. */
  footer: string
  /** A name for the file, without the extension. */
  filename: string
  /** One line of the numbers, for the email the PDF goes out with. */
  headline: string | null
}

export interface ReportPdfInput {
  session: {
    subject: Subject
    title: string | null
    scheduled_at: string
    duration_mins: number
    teacher_notes: string | null
    teacher?: { full_name: string | null } | null
    student?: { full_name: string | null; display_id: string | null; pc?: string | null } | null
  }
  items: SessionItem[]
  notes: DomainNote[]
  meta: SessionReportRow | null
  /** The stored reading of the recording — only when it is still of this transcript and form. */
  extraction: Extraction | null
  /** Why a stored reading was left out: it is of another transcript, or another form. */
  staleness: 'transcript' | 'form' | null
}

function clock(seconds: number): string {
  return `${Math.floor(seconds / 60)}:${String(seconds % 60).padStart(2, '0')}`
}

function claim(c: Claim, label: string): PdfClaim {
  const e = c.evidence
  const flags = [
    e.fromMargin ? 'said either side of this question' : null,
    e.fromReview ? 'from the end-of-lesson review' : null,
    e.relabelled ? 'attributed by what was said, not by the transcript label' : null,
  ].filter(Boolean)
  return {
    label,
    text: c.text,
    quote: e.quote,
    cite: [`${e.speaker} at ${clock(e.at)}`, ...flags].join(' · '),
  }
}

/** The relation labels, shortened as the grid's own column shortens them. */
const RELATION_SHORT = {
  supports: 'Backs the form',
  complicates: 'Sits awkwardly',
  adds: 'Not on the form',
} as const

function answerCell(a: Attempt): string {
  if (a.correct) return `${a.chose ?? '—'}, right`
  return a.answer ? `${a.chose ?? '—'}, key ${a.answer}` : `${a.chose ?? '—'}, wrong`
}

export function reportPdfDoc(input: ReportPdfInput): ReportPdfDoc {
  const { session, items, notes, meta } = input
  const subject = session.subject
  const report = buildReport(items)
  const grid = buildGrid(report, notes, subject)
  const extraction = input.staleness ? null : input.extraction
  const doc = buildReportDoc({
    rows: rowsFrom(notes, subject),
    reflection: meta?.teacher_reflection ?? '',
    report,
    extraction,
  })

  const student = session.student?.full_name || 'Student'
  const teacher = session.teacher?.full_name || 'their teacher'
  const when = formatUtc(session.scheduled_at)
  const day = session.scheduled_at.slice(0, 10)

  // --------------------------------------------------------- the numbers --
  const accuracy = report.accuracy === null ? null : Math.round(report.accuracy * 100)
  const stats =
    report.total === 0
      ? []
      : [
          { value: `${report.correct}/${report.total}`, label: 'Correct', note: accuracy === null ? null : `${accuracy}%` },
          { value: formatDuration(report.seconds), label: 'Time on questions', note: paceLabel(report.seconds, report.target) },
          {
            value: formatDuration(Math.round(report.seconds / report.total)),
            label: 'Average per question',
            note: `target ${formatDuration(Math.round(report.target / report.total))}`,
          },
          {
            value: String(report.misses.length),
            label: 'To work on',
            note: report.rushed.length > 0 ? `${report.rushed.length} rushed` : null,
          },
        ]

  // ---------------------------------------------------------- the domains --
  const evidenceBy = new Map(doc.domains.map((d) => [d.domain, d.evidence]))
  const domains: PdfDomain[] = grid.map((r) => ({
    label: r.label,
    skillFocus: r.skillFocus.join(' · '),
    measured: r.performance === 'untested' ? 'Not tested in this session' : `${r.correct}/${r.total} correct`,
    marked: r.teacherPerformance
      ? `Teacher marked ${r.teacherPerformance === 'tick' ? 'a tick' : 'a cross'}${r.performanceNote ? ` — ${r.performanceNote}` : ''}`
      : r.performanceNote,
    strengths: r.strengths ?? '',
    gaps: r.gaps ?? '',
    targets: r.targets,
    targetsNote: r.targetsAreTheTeacher ? null : 'the form’s own wording — not edited',
    evidence: extraction
      ? (evidenceBy.get(r.domain) ?? []).map((e) => claim(e, RELATION_SHORT[e.relation]))
      : null,
  }))

  // ---------------------------------------------------------- the summary --
  const pace = timeManagement(report)
  const confidence = confidenceAverage(
    items.filter((i) => i.status === 'answered' || i.status === 'revealed'),
  )
  const priority = meta?.practice_priority ?? recommendedPriority(report)
  const summary = [
    {
      label: 'Time management',
      value:
        pace.verdict === 'unknown'
          ? '—'
          : pace.verdict === 'on'
            ? 'On pace'
            : pace.verdict === 'fast'
              ? `${formatDuration(Math.abs(pace.deltaSeconds ?? 0))} under target`
              : `${formatDuration(pace.deltaSeconds ?? 0)} over target`,
      notes: meta?.time_management ? [meta.time_management] : [],
    },
    {
      label: 'Accuracy rate',
      value: accuracy === null ? '—' : `${accuracy}%`,
      notes: [`${report.correct} of ${report.total} correct`],
    },
    {
      label: 'Engagement / confidence',
      value: confidence.average === null ? 'Not rated' : `${confidence.average.toFixed(1)} of 3`,
      notes: [
        confidence.average === null
          ? 'the student was not asked how sure they felt on any question'
          : `across ${confidence.rated} of ${confidence.total} questions`,
        ...(meta?.engagement ? [meta.engagement] : []),
      ],
    },
    {
      label: 'Recommended practice priority',
      value: priority ? sectionLabel(priority) ?? priority : 'None',
      notes: [
        meta?.practice_priority
          ? 'chosen by the teacher'
          : priority
            ? 'the weakest domain in this session’s answers'
            : 'nothing the session tested was missed',
      ],
    },
  ]

  // --------------------------------------------------------------- bands --
  const bands = (list: typeof report.skills): PdfBand[] =>
    list.map((b) => ({ label: b.label, score: `${b.correct}/${b.total}`, share: b.total ? b.correct / b.total : 0 }))

  const paceLines = [
    ...report.rushed.map(
      (a) =>
        `Rushed — question ${a.sequence}: ${formatDuration(a.seconds)} against a ${formatDuration(a.target)} target, and wrong.${
          diagnosisLabel(a.diagnosis) ? ` ${diagnosisLabel(a.diagnosis)}` : ''
        }`,
    ),
    ...report.laboured.map(
      (a) =>
        `Slow — question ${a.sequence}: ${formatDuration(a.seconds)} against a ${formatDuration(a.target)} target${
          a.correct ? ', and right' : ', and wrong'
        }.`,
    ),
  ]

  const misses: PdfMiss[] = report.misses.map((a) => ({
    head: [
      `Q${a.sequence}`,
      a.difficulty ? difficultyLabel(a.difficulty) : null,
      a.skill ? skillLabel(a.skill) : null,
      a.answer ? `chose ${a.chose ?? '—'}, key ${a.answer}` : `chose ${a.chose ?? '—'}`,
      `${formatDuration(a.seconds)}${a.rushed ? ', rushed' : ''}${a.laboured ? ', laboured' : ''}`,
    ]
      .filter(Boolean)
      .join(' · '),
    why: diagnosisLabel(a.diagnosis) ?? 'No diagnosis was recorded for this one.',
    teacher: a.teacherNote,
    student: a.studentReasoning,
  }))

  // ---------------------------------------------------- what was said ------
  let findings: ReportPdfDoc['findings'] = null
  if (extraction) {
    const said = doc.questions.filter(hasFindings)
    const unsaid = doc.questions.filter((q) => !hasFindings(q))
    findings = {
      intro: `The recording reached ${doc.coverage.covered} of ${doc.coverage.total} questions, and there is something to show on ${said.length} of them.`,
      questions: said.map((q) => {
        const r = q.reading
        const claims: PdfClaim[] = [
          ...(r?.studentReasoning ? [claim(r.studentReasoning, 'How they got there')] : []),
          ...(r?.misunderstanding ? [claim(r.misunderstanding, 'What went wrong')] : []),
          ...(r?.vocabularyGap ? [claim(r.vocabularyGap, 'Word they did not know')] : []),
          ...(r?.teacherFeedback ?? []).map((f) => claim(f, FEEDBACK_LABELS[f.kind])),
        ]
        return {
          head: `Q${q.sequence} · ${q.correct ? 'Correct' : 'Missed'}${
            q.chose ? ` · chose ${q.chose}${!q.correct && q.answer ? `, key ${q.answer}` : ''}` : ''
          }${q.rushed ? ' · rushed' : ''}${q.laboured ? ' · laboured' : ''}`,
          teacherNote: q.teacherNote,
          claims,
        }
      }),
      unsaid:
        unsaid.length > 0 && said.length > 0
          ? `Nothing was said, and nothing was written, about ${unsaid.map((q) => `Q${q.sequence}`).join(', ')}.`
          : null,
    }
  }

  // ------------------------------------------------ question by question --
  const levels = [...new Set(report.attempts.map((a) => a.difficulty))]
  const oneLevel = levels.length === 1 && levels[0] !== null ? levels[0] : null

  const headline =
    report.total === 0
      ? null
      : `${report.correct} of ${report.total} correct (${accuracy}%) · ${formatDuration(report.seconds)} on the questions`

  return {
    title: `${student} — session report`,
    subtitle: `${subjectLabel(subject)} · ${when} · with ${teacher}`,
    status: meta?.status === 'published' ? 'Published' : 'Draft',
    people: [
      { label: 'Student', value: [student, session.student?.display_id].filter(Boolean).join(' · ') },
      { label: 'Teacher', value: session.teacher?.full_name || '—' },
      { label: 'PC', value: session.student?.pc || '—' },
      {
        label: 'Session',
        value: `${session.title || `${subjectLabel(subject)} session`} · ${session.duration_mins} min`,
      },
      ...(meta?.generated_at ? [{ label: 'Generated', value: formatUtc(meta.generated_at) }] : []),
    ],
    empty: report.total === 0,
    stats,
    recordingNote: input.staleness
      ? `${
          input.staleness === 'form'
            ? 'The diagnostic form was handed in again after the recording was read'
            : 'The transcript was changed after the recording was read'
        }, so what the recording showed is left out until it is read again. Everything here is the teacher’s own writing and the numbers from the answers.`
      : extraction
        ? null
        : 'The recording has not been read for this session, so everything here is the teacher’s own writing and the numbers from the answers.',
    domains,
    reflection: doc.reflection.trim() || null,
    conflicts: disagreements(doc).map((e) => claim(e, RELATION_LABELS[e.relation])),
    summary,
    summaryNote: meta?.summary?.trim() || null,
    teacherRead: session.teacher_notes?.trim() || null,
    skills: bands(report.skills),
    sections: bands(report.sections),
    diagnoses:
      report.diagnoses.length > 0 ? report.diagnoses.map((d) => `${d.count} ${d.label}`).join(' · ') : null,
    pace: paceLines,
    misses,
    findings,
    levelNote: oneLevel
      ? `Every question was from the ${difficultyLabel(oneLevel).toLowerCase()} paper.`
      : levels.length > 1
        ? 'The session moved level part way through, so each question carries its own.'
        : 'The level did not come back with these questions.',
    showLevel: !oneLevel,
    questions: report.attempts.map((a) => ({
      sequence: String(a.sequence),
      skill: skillLabel(a.skill) ?? sectionLabel(a.section) ?? '—',
      level: difficultyLabel(a.difficulty),
      answer: answerCell(a),
      correct: a.correct,
      time: formatDuration(a.seconds),
      pace: paceLabel(a.seconds, a.target) ?? '—',
      diagnosis: diagnosisLabel(a.diagnosis) ?? '—',
    })),
    footer: `Ascend Now · ${student} · ${subjectLabel(subject)} · ${when}`,
    filename: `Report - ${student} - ${subjectLabel(subject)} - ${day}`,
    headline,
  }
}

// ------------------------------------------------------------ the letters --

/**
 * The characters the PDF's built-in fonts can draw, and nothing else.
 *
 * A PDF's standard fonts speak WinAnsi — Latin-1 and a couple of dozen extras
 * — and pdf-lib throws on anything outside it rather than drawing a box. The
 * fonts are standard because the function cannot ship a font file (a hosted
 * deploy takes no static files), so the text is brought inside the set
 * instead: the typography the teachers use kept as it is, the maths written
 * out, accents taken off letters the set does not have, and a question mark
 * for whatever is left.
 */
const WIN_ANSI_EXTRAS = new Set([
  0x20ac, 0x201a, 0x0192, 0x201e, 0x2026, 0x2020, 0x2021, 0x02c6, 0x2030, 0x0160, 0x2039,
  0x0152, 0x017d, 0x2018, 0x2019, 0x201c, 0x201d, 0x2022, 0x2013, 0x2014, 0x02dc, 0x2122,
  0x0161, 0x203a, 0x0153, 0x017e, 0x0178,
])

const SPELLED: Record<string, string> = {
  '→': '->', '←': '<-', '⇒': '=>', '↔': '<->',
  '✓': '(tick)', '✔': '(tick)', '✗': '(cross)', '✘': '(cross)',
  '≤': '<=', '≥': '>=', '≠': '!=', '≈': '~', '−': '-', '∞': 'infinity',
  '√': 'sqrt', 'π': 'pi', 'θ': 'theta', 'α': 'alpha', 'β': 'beta', 'Δ': 'delta', 'μ': 'µ',
  '′': "'", '″': '"', '‐': '-', '‑': '-', '⁄': '/',
}

function drawable(cp: number): boolean {
  return (cp >= 0x20 && cp <= 0x7e) || (cp >= 0xa0 && cp <= 0xff) || WIN_ANSI_EXTRAS.has(cp)
}

export function winAnsi(text: string): string {
  let out = ''
  for (const ch of text.replace(/\t/g, '    ')) {
    const cp = ch.codePointAt(0) ?? 0
    if (drawable(cp)) out += ch
    else if (SPELLED[ch] !== undefined) out += SPELLED[ch]
    else if (/[\u2000-\u200a\u202f\u205f\u3000]/.test(ch)) out += ' '
    else if (/[\u200b-\u200d\u2060\ufeff\u00ad]/.test(ch)) out += ''
    else if (ch === '\n' || ch === '\r') out += ch
    else {
      const stripped = ch.normalize('NFKD').replace(/[\u0300-\u036f]/g, '')
      out += [...stripped].every((c) => drawable(c.codePointAt(0) ?? 0)) && stripped ? stripped : '?'
    }
  }
  return out
}

/**
 * Lines that fit a width, by the font's own measure. Paragraphs are kept, a
 * word is never split unless it alone is wider than the line, and nothing is
 * dropped: every character that goes in comes out on some line.
 */
export function wrapText(text: string, width: number, measure: (s: string) => number): string[] {
  const lines: string[] = []
  for (const paragraph of text.replace(/\r\n?/g, '\n').split('\n')) {
    const words = paragraph.split(/ +/).filter((w) => w !== '')
    if (words.length === 0) {
      lines.push('')
      continue
    }
    let line = ''
    for (const word of words) {
      const next = line ? `${line} ${word}` : word
      if (measure(next) <= width) {
        line = next
        continue
      }
      if (line) lines.push(line)
      // A single word wider than the line — a URL, usually — is cut where it
      // has to be rather than run off the page.
      let rest = word
      while (measure(rest) > width && rest.length > 1) {
        let cut = rest.length - 1
        while (cut > 1 && measure(rest.slice(0, cut)) > width) cut--
        lines.push(rest.slice(0, cut))
        rest = rest.slice(cut)
      }
      line = rest
    }
    lines.push(line)
  }
  return lines
}
