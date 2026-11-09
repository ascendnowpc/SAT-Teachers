/**
 * A Bluebook practice test's score, read off College Board's score report
 * (0088): the total, the two section scores, the test and the day.
 *
 * The report is read as text — a PDF's text layer (lib/pdfText) or text pasted
 * from it — and nothing is read that the report does not say. Each score is
 * taken from beside its label ("Total Score", "Reading and Writing", "Math"),
 * on the label's line or the few after it, skipping the printed scales
 * ("400–1600", "200–800") and score ranges. College Board's scale settles
 * the rest: a section is 200 to 800 in tens, and the total is the two sections
 * added — so when a label has more than one number near it, the three that
 * add up are the three that are read, and three that do not add up are shown
 * as read and flagged rather than corrected.
 *
 * What is not found is left empty for the teacher to type, never worked out
 * from the others: a misread total would make a worked-out section look
 * right. Whatever is read, the teacher sees it and confirms it before it is
 * saved, and the database checks the scale again (save_bluebook_score).
 */

export interface BluebookScore {
  /** "Practice Test 4", as the report names it; null when it does not. */
  test: string | null
  /** The day it was sat, YYYY-MM-DD. */
  takenOn: string | null
  total: number | null
  readingWriting: number | null
  math: number | null
}

export interface BluebookReading {
  score: BluebookScore
  /** What was read and from where, or what was not — in the form's words. */
  notes: string[]
}

export const BLUEBOOK_DEFAULT_NAME = 'Bluebook practice test'

const isTotal = (n: number) => n >= 400 && n <= 1600 && n % 10 === 0
const isSection = (n: number) => n >= 200 && n <= 800 && n % 10 === 0

type Kind = 'total' | 'rw' | 'math'

const LABELS: [Kind, RegExp][] = [
  ['rw', /\b(?:evidence[- ]based\s+)?reading\s*(?:and|&)\s*writing\b/gi],
  ['total', /\btotal(?:\s+sat)?(?:\s+score)?\b/gi],
  // "Math", "Math Section Score" — not a domain such as "Advanced Math".
  ['math', /(?<!advanced\s)\bmath(?:ematics)?\b/gi],
]

/** Every label a line carries, in the order they come: a table's header can carry all three. */
function labelsOn(line: string): { kind: Kind; start: number; end: number }[] {
  const out: { kind: Kind; start: number; end: number }[] = []
  for (const [kind, re] of LABELS)
    for (const m of line.matchAll(re)) out.push({ kind, start: m.index!, end: m.index! + m[0].length })
  return out.sort((a, b) => a.start - b.start)
}

/** The scores a stretch of text could be: three- and four-digit numbers that are not one end of a range. */
function numbersIn(text: string): number[] {
  const bare = text.replace(/\b\d{2,4}\s*[-–—]\s*\d{2,4}\b/g, ' ')
  return [...bare.matchAll(/(?<![\d.,])\d{3,4}(?![\d.,%])/g)].map((m) => Number(m[0]))
}

/**
 * Every number a label could mean: on its line, between it and the next
 * label; then on the next lines, until a line that carries a label.
 */
function candidates(lines: string[], kind: Kind): number[] {
  const out: number[] = []
  const fits = kind === 'total' ? isTotal : isSection
  lines.forEach((line, i) => {
    const labels = labelsOn(line)
    labels.forEach((at, j) => {
      if (at.kind !== kind) return
      out.push(...numbersIn(line.slice(at.end, labels[j + 1]?.start ?? line.length)).filter(fits))
      for (let k = i + 1; k < Math.min(lines.length, i + 4); k++) {
        if (labelsOn(lines[k]).length > 0) break
        out.push(...numbersIn(lines[k]).filter(fits))
      }
    })
  })
  return [...new Set(out)]
}

const MONTHS: Record<string, number> = {
  jan: 1, feb: 2, mar: 3, apr: 4, may: 5, jun: 6, jul: 7, aug: 8, sep: 9, oct: 10, nov: 11, dec: 12,
}
const MONTH = '(jan(?:uary)?|feb(?:ruary)?|mar(?:ch)?|apr(?:il)?|may|june?|july?|aug(?:ust)?|sep(?:t(?:ember)?)?|oct(?:ober)?|nov(?:ember)?|dec(?:ember)?)'

function iso(y: number, m: number, d: number): string | null {
  const date = new Date(Date.UTC(y, m - 1, d))
  if (date.getUTCFullYear() !== y || date.getUTCMonth() !== m - 1 || date.getUTCDate() !== d) return null
  return date.toISOString().slice(0, 10)
}

/** The first date in a line, as YYYY-MM-DD: "October 12, 2025", "12 Oct 2025", "2025-10-12", "10/12/2025". */
export function dateIn(line: string): string | null {
  let m = new RegExp(`\\b${MONTH}\\.?\\s+(\\d{1,2}),?\\s+(\\d{4})\\b`, 'i').exec(line)
  if (m) return iso(Number(m[3]), MONTHS[m[1].slice(0, 3).toLowerCase()], Number(m[2]))
  m = new RegExp(`\\b(\\d{1,2})\\s+${MONTH}\\.?,?\\s+(\\d{4})\\b`, 'i').exec(line)
  if (m) return iso(Number(m[3]), MONTHS[m[2].slice(0, 3).toLowerCase()], Number(m[1]))
  m = /\b(\d{4})-(\d{2})-(\d{2})\b/.exec(line)
  if (m) return iso(Number(m[1]), Number(m[2]), Number(m[3]))
  // College Board is American: a slashed date is month first.
  m = /\b(\d{1,2})\/(\d{1,2})\/(\d{4})\b/.exec(line)
  if (m) return iso(Number(m[3]), Number(m[1]), Number(m[2]))
  return null
}

/** The day it was sat: a date by "Test date", "Date", "Taken" or "Completed", else the first in the report. */
function takenOnIn(lines: string[]): string | null {
  for (let i = 0; i < lines.length; i++) {
    if (!/\b(?:test\s+date|date|taken|completed|tested)\b/i.test(lines[i])) continue
    const here = dateIn(lines[i]) ?? (i + 1 < lines.length ? dateIn(lines[i + 1]) : null)
    if (here) return here
  }
  for (const line of lines) {
    const d = dateIn(line)
    if (d) return d
  }
  return null
}

/** "Practice Test 4" from "SAT Practice Test #4", "Bluebook Practice Test 4", "PRACTICE TEST 4". */
function testIn(text: string): string | null {
  const m = /\bpractice\s+test\s*#?\s*(\d{1,2})\b/i.exec(text)
  return m ? `Practice Test ${Number(m[1])}` : null
}

/** A score report's text, read for a Bluebook score. */
export function readBluebook(text: string): BluebookReading {
  const lines = text
    .replace(/\r/g, '')
    .split('\n')
    .map((l) => l.replace(/\s+/g, ' ').trim())
    .filter(Boolean)
  const notes: string[] = []
  const score: BluebookScore = {
    test: testIn(text),
    takenOn: takenOnIn(lines),
    total: null,
    readingWriting: null,
    math: null,
  }

  if (/\bpsat\b/i.test(text)) {
    notes.push('This reads like a PSAT report, which is on another scale: type the SAT scores, if any.')
    return { score, notes }
  }

  const totals = candidates(lines, 'total')
  const rws = candidates(lines, 'rw')
  const maths = candidates(lines, 'math')

  // The three that add up, if any three do.
  let found = false
  for (const t of totals) {
    for (const r of rws) {
      const m = maths.find((x) => r + x === t)
      if (m !== undefined) {
        Object.assign(score, { total: t, readingWriting: r, math: m })
        found = true
        break
      }
    }
    if (found) break
  }

  if (found) {
    notes.push(
      `Read ${score.total}: Reading and Writing ${score.readingWriting} and Math ${score.math}, which add up to it.`,
    )
  } else {
    score.total = totals[0] ?? null
    score.readingWriting = rws[0] ?? null
    score.math = maths[0] ?? null
    const missing = [
      score.total === null ? 'the total' : null,
      score.readingWriting === null ? 'Reading and Writing' : null,
      score.math === null ? 'Math' : null,
    ].filter((x): x is string => x !== null)
    if (missing.length === 3) {
      notes.push('No scores could be read from this. Type them from the report.')
    } else if (missing.length > 0) {
      notes.push(`Not found: ${missing.join(', ')}. Type ${missing.length === 1 ? 'it' : 'them'} from the report.`)
    } else {
      notes.push(
        `Read ${score.total}, ${score.readingWriting} and ${score.math}, but those do not add up — check each against the report.`,
      )
    }
  }

  if (!score.takenOn) notes.push('No date found: say which day it was sat.')
  return { score, notes }
}

/** What save_bluebook_score would refuse, in the form's words; null when it is ready. */
export function bluebookProblem(s: BluebookScore, today: string): string | null {
  if (s.total === null || s.readingWriting === null || s.math === null)
    return 'Fill in the total and both section scores.'
  if (!isSection(s.readingWriting)) return 'A Reading and Writing score is 200 to 800, in tens.'
  if (!isSection(s.math)) return 'A Math score is 200 to 800, in tens.'
  if (s.total !== s.readingWriting + s.math)
    return `The total is the two sections added: ${s.readingWriting} + ${s.math} = ${s.readingWriting + s.math}, not ${s.total}.`
  if (!s.takenOn || !/^\d{4}-\d{2}-\d{2}$/.test(s.takenOn)) return 'Say which day it was sat.'
  if (s.takenOn > today) return 'A test cannot be sat on a day still to come.'
  return null
}

/* ----------------------------------------------------------- the trend --- */

/** One recorded score, as bluebook_scores and the parent card send it. */
export interface BluebookRow {
  test_name: string
  taken_on: string
  total: number
  reading_writing: number
  math: number
}

/** Oldest first: the order the line is read in. */
export function byDay<T extends Pick<BluebookRow, 'taken_on'>>(rows: T[]): T[] {
  return [...rows].sort((a, b) => a.taken_on.localeCompare(b.taken_on))
}

/** "+40", "−20", "±0": a total against the one before it. */
export function change(before: number, after: number): string {
  const d = after - before
  return d > 0 ? `+${d}` : d < 0 ? `−${-d}` : '±0'
}

/**
 * The headline: "1180 → 1290 over 3 practice tests", or "1250 on the first
 * practice test" with one.
 */
export function bluebookHeadline(rows: BluebookRow[]): string | null {
  const sorted = byDay(rows)
  if (sorted.length === 0) return null
  const last = sorted[sorted.length - 1]
  if (sorted.length === 1) return `${last.total} on the first practice test`
  return `${sorted[0].total} → ${last.total} over ${sorted.length} practice tests`
}

/** "12 Oct 2025": the day it was sat — a calendar day, with no time or zone to it. */
export function dayLabel(day: string): string {
  const d = new Date(`${day}T00:00:00Z`)
  if (Number.isNaN(d.getTime())) return day
  return d.toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric', timeZone: 'UTC' })
}
