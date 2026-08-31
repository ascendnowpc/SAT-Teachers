/**
 * The bank's rows, arranged back into the shape of the paper they came from.
 *
 * A source paper prints a passage once and hangs four or five questions off
 * it; the bank stores the passage on every item so that a question is
 * self-contained the moment it lands on a student's screen. Both are right —
 * this is the translation between them, and it is pure so the paper view, the
 * student's stage and the tests all agree on what the paper looks like.
 *
 * Nothing here reads the database. Give it the items in the paper's order and
 * it gives back the passages, their numbering, and the questions under each.
 */
import { splitPassage, type PassageSegment } from './passage'
import type { Question } from './types'

/* --------------------------------------------------------------- blocks --- */

export type PassageBlock =
  | { kind: 'text'; segments: PassageSegment[] }
  | { kind: 'heading'; text: string }
  | { kind: 'table'; head: string[]; rows: string[][] }

/** "Text 1" / "Text 2" — a paired-passage item's own sub-headings. */
const HEADING = /^(?:Text|Passage|Note)\s+\d+$/i

/**
 * Splits a stored passage into the blocks a paper prints.
 *
 * Two things in the source papers are not prose: the paired texts of a
 * cross-text question, which the paper heads "Text 1" and "Text 2", and the
 * chart and table items, which 0008 and 0009 transcribe as pipe-delimited rows
 * because the bank is text-only. Rendering either as a paragraph is what made
 * the questions look scattered — the table came out as a run of numbers.
 *
 * Anything that is not one of those two is prose, and prose keeps its own line
 * breaks.
 */
export function parsePassage(
  body: string | null | undefined,
  underline?: string | null,
): PassageBlock[] {
  if (!body) return []

  const blocks: PassageBlock[] = []
  const lines = body.split('\n')
  let prose: string[] = []
  let table: string[] = []

  const flushProse = () => {
    // Blank lines around a block are separators, not content.
    while (prose.length && !prose[0].trim()) prose.shift()
    while (prose.length && !prose[prose.length - 1].trim()) prose.pop()
    if (!prose.length) return
    blocks.push({ kind: 'text', segments: splitPassage(prose.join('\n'), underline) })
    prose = []
  }

  const flushTable = () => {
    if (!table.length) return
    const cells = table.map((r) =>
      r
        .split('|')
        .map((c) => c.trim())
        .filter((c, i, all) => !(c === '' && (i === 0 || i === all.length - 1))),
    )
    // One row on its own is a sentence that happens to contain a pipe, not a
    // table; a table needs a header and at least one row under it.
    if (cells.length < 2) prose.push(...table)
    else blocks.push({ kind: 'table', head: cells[0], rows: cells.slice(1) })
    table = []
  }

  for (const line of lines) {
    if (line.includes('|')) {
      flushProse()
      table.push(line)
      continue
    }
    flushTable()
    if (HEADING.test(line.trim())) {
      flushProse()
      blocks.push({ kind: 'heading', text: line.trim() })
      continue
    }
    prose.push(line)
  }
  flushTable()
  flushProse()

  return blocks
}

/** Whether a passage carries a transcribed table — the paper says so in the heading. */
export function hasTable(body: string | null | undefined): boolean {
  return parsePassage(body).some((b) => b.kind === 'table')
}

/* ---------------------------------------------------------------- paper --- */

export interface PaperQuestion {
  question: Question
  /** The paper's printed number. Test 4's numbering is not contiguous. */
  number: string
}

export interface PaperGroup {
  key: string
  /** "Passage 2 (+ Table)" for a shared stimulus; null when it belongs to one question. */
  label: string | null
  passage: string | null
  underline: string | null
  questions: PaperQuestion[]
}

/**
 * The printed number of an item, taken from its source_ref: the papers number
 * their own questions and Test 4 skips numbers, so position is not the number.
 * A teacher-authored item has no source paper, and falls back to its position.
 */
export function paperNumber(q: Question, index: number): string {
  const m = q.source_ref?.match(/Q(\d+)\s*$/)
  return m ? String(Number(m[1])) : String(index + 1)
}

/**
 * Groups items into the passages the paper prints.
 *
 * Consecutive items sharing a stimulus become one group, printed once above
 * its questions and headed "Passage N" the way the paper heads it. An item
 * whose stimulus is its own — every standalone completion item, and the
 * paired-text question — gets no heading and carries its text inline under its
 * number, which is also how the paper sets it.
 */
export function buildPaper(questions: Question[]): PaperGroup[] {
  const groups: PaperGroup[] = []

  for (const [i, q] of questions.entries()) {
    const entry: PaperQuestion = { question: q, number: paperNumber(q, i) }
    const last = groups[groups.length - 1]

    if (last && q.passage && last.passage === q.passage) {
      last.questions.push(entry)
      continue
    }
    groups.push({
      key: q.id,
      label: null,
      passage: q.passage,
      underline: q.passage_underline,
      questions: [entry],
    })
  }

  // Numbered only once the groups are known: a stimulus is "Passage 1" because
  // it carries several questions, and that is not decidable until it has them.
  let n = 0
  for (const g of groups) {
    if (g.questions.length < 2 || !g.passage) continue
    n += 1
    g.label = hasTable(g.passage) ? `Passage ${n} (+ Table)` : `Passage ${n}`
  }

  return groups
}
