/**
 * Reading a score report from a picture (the dashboard blueprint's "upload the
 * score report"): a screenshot or photo of College Board's report, or a PDF
 * with no text in it, read by the model the app already uses (lib/gemini).
 *
 * The model is asked only to copy what is printed — never to add up, convert
 * or guess — and what it returns is checked here against College Board's
 * scale before anybody sees it: a score off the scale is dropped and said so,
 * three scores that do not add up are shown as read and flagged, and a PSAT
 * is refused. The reading lands in the same form as a PDF's (lib/bluebook
 * readBluebook), where the student or the teacher looks it over and saves it:
 * the app adds nothing to the timeline that nobody has seen.
 */
import { EMPTY_SCORE, SAT_DOMAINS, type Band, type BluebookReading, type BluebookScore } from './bluebook.ts'

export const SCORE_READER_SYSTEM = [
  'You read SAT score reports: College Board score reports, Bluebook practice-test results,',
  'and screenshots or photos of them. Copy what is printed and nothing else.',
  'Never add, subtract, convert or estimate a number; if a value is not printed, return null.',
  'Ignore score ranges ("Score Range: 1310-1390"), averages and the scale printed beside a score',
  '("400-1600", "200-800"): they are not the student\'s scores.',
].join(' ')

export const SCORE_READER_PROMPT = [
  'Read this score report. Return:',
  'is_score_report — whether it is an SAT (or PSAT) score report or practice-test result at all;',
  'is_psat — whether it is a PSAT/NMSQT, PSAT 10 or PSAT 8/9 report, which is on another scale;',
  'student_name; test_name as the report names it ("SAT March 2026", "Practice Test 4");',
  'official — true for a real SAT sat at a test centre, false for a practice test;',
  'taken_on — the day it was sat, YYYY-MM-DD;',
  'total, reading_writing and math — the scores; their percentiles if printed;',
  'domains — for each of the eight content domains whose "Performance" band is printed (for example',
  '"Performance: 550-600"), the domain and the band\'s low and high.',
].join(' ')

const nint = { type: ['integer', 'null'] }

export const SCORE_READER_SCHEMA = {
  type: 'object',
  properties: {
    is_score_report: { type: 'boolean' },
    is_psat: { type: 'boolean' },
    student_name: { type: ['string', 'null'] },
    test_name: { type: ['string', 'null'] },
    official: { type: ['boolean', 'null'] },
    taken_on: { type: ['string', 'null'], description: 'YYYY-MM-DD' },
    total: nint,
    reading_writing: nint,
    math: nint,
    total_percentile: nint,
    rw_percentile: nint,
    math_percentile: nint,
    domains: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          domain: { type: 'string', enum: SAT_DOMAINS.map((d) => d.label) },
          low: { type: 'integer' },
          high: { type: 'integer' },
        },
        required: ['domain', 'low', 'high'],
      },
    },
  },
  required: ['is_score_report', 'is_psat', 'total', 'reading_writing', 'math', 'domains'],
}

/** What the model returns, before it is checked. */
export interface RawReading {
  is_score_report?: unknown
  is_psat?: unknown
  student_name?: unknown
  test_name?: unknown
  official?: unknown
  taken_on?: unknown
  total?: unknown
  reading_writing?: unknown
  math?: unknown
  total_percentile?: unknown
  rw_percentile?: unknown
  math_percentile?: unknown
  domains?: unknown
}

const int = (v: unknown): number | null => (typeof v === 'number' && Number.isInteger(v) ? v : null)
const onScale = (n: number | null, lo: number, hi: number) => n !== null && n >= lo && n <= hi && n % 10 === 0

/** The model's reading, checked against College Board's scale, as the form reads a PDF's. */
export function readingFromModel(raw: RawReading, today: string): BluebookReading {
  const notes: string[] = []
  const score: BluebookScore = { ...EMPTY_SCORE }
  const name = typeof raw.student_name === 'string' && raw.student_name.trim() ? raw.student_name.trim() : null

  if (raw.is_psat === true) {
    notes.push('This reads like a PSAT report, which is on another scale: type the SAT scores, if any.')
    return { score, name, notes }
  }
  if (raw.is_score_report === false) {
    notes.push('This does not look like an SAT score report. Try a clearer picture, or type the scores.')
    return { score, name, notes }
  }

  score.test = typeof raw.test_name === 'string' && raw.test_name.trim() ? raw.test_name.trim().slice(0, 80) : null
  score.official = typeof raw.official === 'boolean' ? raw.official : null
  const day = typeof raw.taken_on === 'string' && /^\d{4}-\d{2}-\d{2}$/.test(raw.taken_on) ? raw.taken_on : null
  score.takenOn = day && day <= today ? day : null
  if (day && !score.takenOn) notes.push(`The date read, ${day}, is still to come: check it.`)

  const total = int(raw.total)
  const rw = int(raw.reading_writing)
  const math = int(raw.math)
  score.total = onScale(total, 400, 1600) ? total : null
  score.readingWriting = onScale(rw, 200, 800) ? rw : null
  score.math = onScale(math, 200, 800) ? math : null
  const dropped = [
    total !== null && score.total === null ? `a total of ${total}` : null,
    rw !== null && score.readingWriting === null ? `Reading and Writing ${rw}` : null,
    math !== null && score.math === null ? `Math ${math}` : null,
  ].filter(Boolean)
  if (dropped.length > 0) notes.push(`Left out, as off the SAT's scale: ${dropped.join(', ')}.`)

  const pct = (v: unknown) => {
    const n = int(v)
    return n !== null && n >= 1 && n <= 99 ? n : null
  }
  score.totalPercentile = pct(raw.total_percentile)
  score.readingWritingPercentile = pct(raw.rw_percentile)
  score.mathPercentile = pct(raw.math_percentile)

  const domains: Record<string, Band> = {}
  if (Array.isArray(raw.domains)) {
    for (const d of raw.domains as { domain?: unknown; low?: unknown; high?: unknown }[]) {
      const known = SAT_DOMAINS.find((x) => x.label === d.domain)
      const lo = int(d.low)
      const hi = int(d.high)
      if (known && onScale(lo, 200, 800) && onScale(hi, 200, 800) && lo! <= hi!) domains[known.section] = [lo!, hi!]
    }
  }
  // All eight or none: a report gives them all, and half a set reads as a gap.
  score.domains = Object.keys(domains).length === SAT_DOMAINS.length ? domains : null

  const all = score.total !== null && score.readingWriting !== null && score.math !== null
  if (all && score.total !== score.readingWriting! + score.math!) {
    notes.push(
      `Read ${score.total}, Reading and Writing ${score.readingWriting} and Math ${score.math}, which do not add up: check them against the report.`,
    )
  } else if (all) {
    notes.push(`Read ${score.total}: Reading and Writing ${score.readingWriting} and Math ${score.math}. Check them, then save.`)
  } else if (score.total === null && score.readingWriting === null && score.math === null) {
    notes.push('No scores could be read from this picture. Type them from the report.')
  } else {
    notes.push('Some scores could not be read. Type the missing ones from the report.')
  }
  if (!score.takenOn) notes.push('Add the day it was sat.')
  return { score, name, notes }
}

/** The kinds of file the reader takes, and how big. */
export const READABLE_TYPES = ['image/png', 'image/jpeg', 'image/webp', 'image/heic', 'image/heif', 'application/pdf']
export const MAX_READ_BYTES = 6 * 1024 * 1024
