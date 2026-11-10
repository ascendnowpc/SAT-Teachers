/**
 * An SAT score from Bluebook — an official SAT or a practice test — read off
 * College Board's score report (0088, 0090): the total, the two section scores
 * and their percentiles, the eight domains' performance bands, the test and
 * the day it was sat.
 *
 * The report is read as text — a PDF's text layer (lib/pdfText) or text pasted
 * from it — and nothing is read that the report does not say. Each score is
 * taken from beside its label ("Total Score", "Reading and Writing", "Math"),
 * on the label's line or the few after it. Never from the printed scales:
 * College Board sets "400–1600" and "200–800" in small type beside each score,
 * often broken over two lines ("400–" above "1600"), and both ends are taken
 * out before anything is read — read as scores they were 200 + 200 = 400,
 * which adds up. Never from a score range ("Score Range: 1310-1390") or a
 * "3 Year Average Score". The scale settles the rest: a section is 200 to 800
 * in tens and the total is the two sections added, so the three that add up
 * are the three read, and three that do not are shown as read and flagged
 * rather than corrected.
 *
 * What is not found is left empty for the teacher to type, never worked out
 * from the others. Whatever is read, the teacher sees it and confirms it
 * before it is saved, and the database checks the scale again
 * (save_bluebook_score). The student's name on the report is read only to be
 * compared with the student it is being added to; it is not kept.
 */

/** The eight content domains, as College Board names and orders them, and the app's section each is (lib/constants). */
export const SAT_DOMAINS: { section: string; label: string; subject: 'english' | 'mathematics' }[] = [
  { section: 'information_and_ideas', label: 'Information and Ideas', subject: 'english' },
  { section: 'craft_and_structure', label: 'Craft and Structure', subject: 'english' },
  { section: 'expression_of_ideas', label: 'Expression of Ideas', subject: 'english' },
  { section: 'standard_english_conventions', label: 'Standard English Conventions', subject: 'english' },
  { section: 'algebra', label: 'Algebra', subject: 'mathematics' },
  { section: 'advanced_math', label: 'Advanced Math', subject: 'mathematics' },
  { section: 'problem_solving_and_data_analysis', label: 'Problem-Solving and Data Analysis', subject: 'mathematics' },
  { section: 'geometry_and_trigonometry', label: 'Geometry and Trigonometry', subject: 'mathematics' },
]

/** A domain's performance band, low to high, on the section's 200–800 scale. */
export type Band = [number, number]

export interface BluebookScore {
  /** "SAT May 2026" or "Practice Test 4", as the report names it; null when it does not. */
  test: string | null
  /** An official SAT, from its score report; false for a practice test; null when the report does not say. */
  official: boolean | null
  /** The day it was sat, YYYY-MM-DD. */
  takenOn: string | null
  total: number | null
  readingWriting: number | null
  math: number | null
  /** Percentiles, 1–99, where the report gives them (an official SAT's does). */
  totalPercentile: number | null
  readingWritingPercentile: number | null
  mathPercentile: number | null
  /** Each domain's performance band, by section, where the report gives all of them. */
  domains: Record<string, Band> | null
}

export interface BluebookReading {
  score: BluebookScore
  /** The name the report is for — compared with the student's, never kept. */
  name: string | null
  /** What was read and from where, or what was not — in the form's words. */
  notes: string[]
}

export const BLUEBOOK_DEFAULT_NAME = 'Bluebook practice test'

export const EMPTY_SCORE: BluebookScore = {
  test: null,
  official: null,
  takenOn: null,
  total: null,
  readingWriting: null,
  math: null,
  totalPercentile: null,
  readingWritingPercentile: null,
  mathPercentile: null,
  domains: null,
}

const isTotal = (n: number) => n >= 400 && n <= 1600 && n % 10 === 0
const isSection = (n: number) => n >= 200 && n <= 800 && n % 10 === 0
const isBand = (b: Band) => isSection(b[0]) && isSection(b[1]) && b[0] <= b[1]
const isPercentile = (n: number) => Number.isInteger(n) && n >= 1 && n <= 99

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

const blank = (s: string) => ' '.repeat(s.length)
const DASH = '[-–—]'

/** College Board's two scales: a dangling start's end. */
const SCALE_END: Record<string, string> = { '400': '1600', '200': '800' }

/**
 * The lines with every printed scale and range blanked out, the same length
 * as before so a position still means the same place. A scale broken over two
 * lines — "400–" at the end of one, its "1600" on the next or the one after —
 * goes as a pair; any other number left hanging on a dash is the start of a
 * range, and goes too.
 */
export function withoutScales(lines: string[]): string[] {
  const out = [...lines]
  for (let i = 0; i < out.length; i++) {
    // Whole ranges first: "400–1600", "Score Range: 1310-1390", "Performance: 550-600".
    out[i] = out[i].replace(new RegExp(`(?<![\\d.,])\\d{2,4}\\s*${DASH}\\s*\\d{2,4}(?![\\d.,])`, 'g'), blank)
    const hanging = new RegExp(`(?<![\\d.,])(\\d{3,4})\\s*${DASH}\\s*$`).exec(out[i])
    if (!hanging) continue
    out[i] = out[i].slice(0, hanging.index) + blank(hanging[0])
    const end = SCALE_END[hanging[1]]
    if (!end) continue
    for (const k of [i + 1, i + 2]) {
      if (k >= out.length) break
      const m = new RegExp(`(?<![\\d.,])${end}(?![\\d.,%])`).exec(out[k])
      if (m) {
        out[k] = out[k].slice(0, m.index) + blank(m[0]) + out[k].slice(m.index + m[0].length)
        break
      }
    }
  }
  // A population's average is never the student's score.
  return out.map((l) => (/\baverage\b/i.test(l) ? blank(l) : l))
}

interface Found {
  value: number
  line: number
  /** Where the number ends on its line: a percentile, if any, follows it. */
  end: number
}

/** The scores a stretch of a line could be: three- and four-digit numbers. */
function numbersIn(line: string, from: number, to: number, li: number): Found[] {
  const out: Found[] = []
  const re = /(?<![\d.,])\d{3,4}(?![\d.,%])/g
  re.lastIndex = from
  for (let m = re.exec(line); m && m.index < to; m = re.exec(line))
    out.push({ value: Number(m[0]), line: li, end: m.index + m[0].length })
  return out
}

/**
 * Every number a label could mean: on its line, between it and the next
 * label; then on the next lines, until a line that carries a label.
 */
function candidates(lines: string[], kind: Kind): Found[] {
  const out: Found[] = []
  const fits = kind === 'total' ? isTotal : isSection
  lines.forEach((line, i) => {
    const labels = labelsOn(line)
    labels.forEach((at, j) => {
      if (at.kind !== kind) return
      out.push(...numbersIn(line, at.end, labels[j + 1]?.start ?? line.length, i).filter((f) => fits(f.value)))
      for (let k = i + 1; k < Math.min(lines.length, i + 4); k++) {
        if (labelsOn(lines[k]).length > 0) break
        out.push(...numbersIn(lines[k], 0, lines[k].length, k).filter((f) => fits(f.value)))
      }
    })
  })
  const seen = new Set<number>()
  return out.filter((f) => !seen.has(f.value) && seen.add(f.value))
}

/** "90th*", "92nd percentile": a percentile after a score, on its line or the next. */
function percentileAfter(lines: string[], f: Found): number | null {
  const re = /\b(\d{1,2})(?:st|nd|rd|th)(?:\*|\s+percentile\b)/i
  const here = re.exec(lines[f.line].slice(f.end)) ?? (f.line + 1 < lines.length ? re.exec(lines[f.line + 1]) : null)
  const n = here ? Number(here[1]) : NaN
  return isPercentile(n) ? n : null
}

/**
 * Each domain's performance band. The report sets a domain's name above its
 * "Performance: 550-600", in two columns, so the names and the bands are each
 * taken in reading order and paired one to one — and only when every name has
 * a band: a band paired with the wrong domain would be worse than none.
 */
function domainsIn(lines: string[]): { domains: Record<string, Band> | null; partial: boolean } {
  const names: { section: string; at: number }[] = []
  const bands: { band: Band; at: number }[] = []
  lines.forEach((line, i) => {
    for (const d of SAT_DOMAINS) {
      const m = new RegExp(`\\b${d.label.replace(/-/g, '[- ]?')}\\b`, 'i').exec(line)
      if (m) names.push({ section: d.section, at: i * 10_000 + m.index })
    }
    for (const m of line.matchAll(new RegExp(`\\bperformance:?\\s*(\\d{3})\\s*${DASH}\\s*(\\d{3})\\b`, 'gi')))
      bands.push({ band: [Number(m[1]), Number(m[2])], at: i * 10_000 + m.index! })
  })
  // No bands at all is a report that gives none, not one that was misread.
  if (bands.length === 0) return { domains: null, partial: false }
  names.sort((a, b) => a.at - b.at)
  bands.sort((a, b) => a.at - b.at)
  const distinct = new Set(names.map((n) => n.section)).size === names.length
  if (!distinct || names.length !== bands.length || !bands.every((b) => isBand(b.band)))
    return { domains: null, partial: true }
  return { domains: Object.fromEntries(names.map((n, k) => [n.section, bands[k].band])), partial: false }
}

const MONTHS: Record<string, number> = {
  jan: 1, feb: 2, mar: 3, apr: 4, may: 5, jun: 6, jul: 7, aug: 8, sep: 9, oct: 10, nov: 11, dec: 12,
}
const MONTH_NAMES = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
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

/**
 * The day it was sat: a date by "Tested on", "Test date", "Taken" or
 * "Completed", else the first in the report. An official report's "Tested
 * on" is the day itself, which a make-up test makes differ from the
 * administration's.
 */
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

/**
 * Which test: an official SAT, named by its administration ("Test
 * administration: SAT May 02, 2026" → "SAT May 2026"), or a practice test
 * ("SAT Practice Test #4" → "Practice Test 4").
 */
function testIn(text: string, takenOn: string | null): { test: string | null; official: boolean | null } {
  const admin = new RegExp(`\\btest\\s+administration:?\\s*SAT\\s+${MONTH}\\.?\\s+\\d{1,2},?\\s+(\\d{4})`, 'i').exec(text)
  if (admin) return { test: `SAT ${MONTH_NAMES[MONTHS[admin[1].slice(0, 3).toLowerCase()] - 1]} ${admin[2]}`, official: true }
  const practice = /\bpractice\s+test\s*#?\s*(\d{1,2})\b/i.exec(text)
  if (practice) return { test: `Practice Test ${Number(practice[1])}`, official: false }
  if (/\b(?:your\s+)?SAT\s+score\s+report\b/i.test(text)) {
    const month = takenOn ? `${MONTH_NAMES[Number(takenOn.slice(5, 7)) - 1]} ${takenOn.slice(0, 4)}` : null
    return { test: month ? `SAT ${month}` : 'SAT', official: true }
  }
  return { test: null, official: null }
}

/** "Name: Jordan Sample" — whom the report is for. */
function nameIn(lines: string[]): string | null {
  for (const line of lines) {
    const m = /\bname:\s*([^\d:]{2,80}?)\s*(?:\bgrade:|$)/i.exec(line)
    if (m) return m[1].trim()
  }
  return null
}

/** A score report's text, read for an SAT score. */
export function readBluebook(text: string): BluebookReading {
  const lines = text
    .replace(/\r/g, '')
    .split('\n')
    .map((l) => l.replace(/\s+/g, ' ').trim())
    .filter(Boolean)
  const notes: string[] = []
  const takenOn = takenOnIn(lines)
  const score: BluebookScore = { ...EMPTY_SCORE, ...testIn(text, takenOn), takenOn }
  const name = nameIn(lines)

  if (/\bpsat\b/i.test(text)) {
    notes.push('This reads like a PSAT report, which is on another scale: type the SAT scores, if any.')
    return { score: { ...score, test: null, official: null }, name, notes }
  }

  const clean = withoutScales(lines)
  const totals = candidates(clean, 'total')
  const rws = candidates(clean, 'rw')
  const maths = candidates(clean, 'math')

  // The three that add up, if any three do.
  let chosen: [Found, Found, Found] | null = null
  search: for (const t of totals) {
    for (const r of rws) {
      const m = maths.find((x) => r.value + x.value === t.value)
      if (m) {
        chosen = [t, r, m]
        break search
      }
    }
  }

  if (chosen) {
    const [t, r, m] = chosen
    Object.assign(score, {
      total: t.value,
      readingWriting: r.value,
      math: m.value,
      totalPercentile: percentileAfter(clean, t),
      readingWritingPercentile: percentileAfter(clean, r),
      mathPercentile: percentileAfter(clean, m),
    })
    notes.push(
      `Read ${t.value}: Reading and Writing ${r.value} and Math ${m.value}, which add up to it.`,
    )
    const pcts = [score.totalPercentile, score.readingWritingPercentile, score.mathPercentile]
    if (pcts.every((p) => p !== null))
      notes.push(`Percentiles: ${pcts.map((p) => ordinal(p!)).join(', ')} — total, Reading and Writing, Math.`)
  } else {
    score.total = totals[0]?.value ?? null
    score.readingWriting = rws[0]?.value ?? null
    score.math = maths[0]?.value ?? null
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

  const d = domainsIn(lines)
  score.domains = d.domains
  if (d.domains)
    notes.push(
      Object.keys(d.domains).length === SAT_DOMAINS.length
        ? 'All eight domains’ performance bands read.'
        : `${Object.keys(d.domains).length} domains’ performance bands read.`,
    )
  else if (d.partial) notes.push('The domains’ performance bands could not be matched to their names, so they are left out.')

  if (score.official) notes.push(`An official SAT${score.test && score.test !== 'SAT' ? `: ${score.test}` : ''}.`)
  if (!score.takenOn) notes.push('No date found: say which day it was sat.')
  return { score, name, notes }
}

/** "1st", "92nd", "90th". */
export function ordinal(n: number): string {
  const teen = n % 100 >= 11 && n % 100 <= 13
  const suffix = teen ? 'th' : ({ 1: 'st', 2: 'nd', 3: 'rd' } as Record<number, string>)[n % 10] ?? 'th'
  return `${n}${suffix}`
}

/**
 * Whether the name on a report is the student's: the same words, or the
 * report's first and last names among the student's — "Jordan Sample" is
 * "Jordan A. Sample". Case and accents do not count.
 */
export function sameName(onReport: string, student: string): boolean {
  const words = (s: string) =>
    s
      .normalize('NFD')
      .replace(/[̀-ͯ]/g, '')
      .toLowerCase()
      .split(/[^a-z']+/)
      .filter(Boolean)
  const a = words(onReport)
  const b = words(student)
  if (a.length === 0 || b.length === 0) return false
  if (a.join(' ') === b.join(' ')) return true
  const [short, long] = a.length <= b.length ? [a, b] : [b, a]
  return long.includes(short[0]) && long.includes(short[short.length - 1])
}

/** What save_bluebook_score would refuse, in the form's words; null when it is ready. */
export function bluebookProblem(s: BluebookScore, today: string): string | null {
  if (s.total === null || s.readingWriting === null || s.math === null)
    return 'Fill in the total and both section scores.'
  if (!isSection(s.readingWriting)) return 'A Reading and Writing score is 200 to 800, in tens.'
  if (!isSection(s.math)) return 'A Math score is 200 to 800, in tens.'
  if (s.total !== s.readingWriting + s.math)
    return `The total is the two sections added: ${s.readingWriting} + ${s.math} = ${s.readingWriting + s.math}, not ${s.total}.`
  for (const p of [s.totalPercentile, s.readingWritingPercentile, s.mathPercentile])
    if (p !== null && !isPercentile(p)) return 'A percentile is 1 to 99.'
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
  /** From 0090: an official SAT; its percentiles and domain bands, where the report gave them. */
  official?: boolean
  total_percentile?: number | null
  rw_percentile?: number | null
  math_percentile?: number | null
  domains?: Record<string, Band> | null
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
 * The headline: "1180 → 1350 over 3 tests", or "1350 on the first test" with
 * one — official SATs and practice tests together, on the one scale.
 */
export function bluebookHeadline(rows: BluebookRow[]): string | null {
  const sorted = byDay(rows)
  if (sorted.length === 0) return null
  const last = sorted[sorted.length - 1]
  if (sorted.length === 1) return `${last.total} on the first test`
  return `${sorted[0].total} → ${last.total} over ${sorted.length} tests`
}

/** The latest test whose report gave the domains' bands, if any did. */
export function latestDomains(rows: BluebookRow[]): BluebookRow | null {
  const withBands = byDay(rows).filter((r) => r.domains && Object.keys(r.domains).length > 0)
  return withBands[withBands.length - 1] ?? null
}

/** "12 Oct 2025": the day it was sat — a calendar day, with no time or zone to it. */
export function dayLabel(day: string): string {
  const d = new Date(`${day}T00:00:00Z`)
  if (Number.isNaN(d.getTime())) return day
  return d.toLocaleDateString('en-GB', { day: 'numeric', month: 'short', year: 'numeric', timeZone: 'UTC' })
}
