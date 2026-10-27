import type { OptionLabel } from './types'

/**
 * An explanation, read back into the parts it was written in.
 *
 * The OnePrep items (0065) were transcribed in OnePrep's own shape — why the
 * key is right, then why each other choice is wrong, every part with a named
 * step and often the key phrase it turns on:
 *
 *   Why B is correct: Step 1, read the question direction: "…" The question…
 *
 *   Why the others are wrong
 *   A: Text 2 actually agrees… Step 1, check for agreement: Text 2 begins…
 *   C: … Step 1, analyze the obstacle (key phrase: "…"): Text 1 argues…
 *
 * and one in the College Board's: "Choice D is the best answer because …
 * Choice A is incorrect because …". Stored as text, both were drawn as one
 * paragraph. This finds the parts so the screen can lay them out as OnePrep
 * does; anything in neither shape is null, and is shown as it was written.
 */

export interface ExplanationStep {
  n: number
  /** "Read the question direction" — the step's name, capitalised. */
  label: string
  /** The words the step turns on, without their quotation marks. */
  keyPhrase: string | null
  text: string
}

export interface ExplanationPart {
  /** What comes before the first step: for a wrong choice, why in one line. */
  lead: string
  steps: ExplanationStep[]
}

export interface StructuredExplanation {
  correct: OptionLabel
  why: ExplanationPart
  /** The other choices, in the order they were written. */
  others: { option: OptionLabel; part: ExplanationPart }[]
}

const capitalise = (s: string) => s.charAt(0).toUpperCase() + s.slice(1)

const unquote = (s: string) => s.trim().replace(/^["“'‘]+|["”'’]+$/g, '')

/** "Step 1, check the focus (key phrase: "…"): " — the label stops at the first colon or bracket. */
const STEP = /Step (\d+),\s*([^:(\n]+?)\s*(?:\(key phrase:\s*(.+?)\)\s*)?:\s*/g

export function parsePart(text: string): ExplanationPart {
  const steps: ExplanationStep[] = []
  const marks = [...text.matchAll(STEP)]
  const lead = (marks.length ? text.slice(0, marks[0].index) : text).trim()
  marks.forEach((m, i) => {
    const start = (m.index ?? 0) + m[0].length
    const end = i + 1 < marks.length ? marks[i + 1].index : text.length
    steps.push({
      n: Number(m[1]),
      label: capitalise(m[2].trim()),
      keyPhrase: m[3] ? unquote(m[3]) : null,
      text: text.slice(start, end).trim(),
    })
  })
  return { lead, steps }
}

function parseOnePrep(text: string): StructuredExplanation | null {
  const head = /^\s*Why ([A-D]) is correct:\s*/.exec(text)
  if (!head) return null
  const rest = text.slice(head[0].length)
  const [whyText, othersText = ''] = rest.split(/\n\s*Why the others are wrong:?\s*(?:\n|$)/i)

  const others: StructuredExplanation['others'] = []
  for (const line of othersText.split('\n')) {
    const t = line.trim()
    if (!t) continue
    const m = /^([A-D])[:.)]\s*(.*)$/.exec(t)
    if (m) others.push({ option: m[1] as OptionLabel, part: { lead: m[2], steps: [] } })
    // A line that is not a choice belongs to the one before it.
    else if (others.length) others[others.length - 1].part.lead += ` ${t}`
  }
  return {
    correct: head[1] as OptionLabel,
    why: parsePart(whyText),
    others: others.map((o) => ({ option: o.option, part: parsePart(o.part.lead) })),
  }
}

/** "because the author…" → "The author…"; ", though…" → "Though…". */
const reason = (s: string) => capitalise(s.replace(/^[\s,.:;—-]*(because\b)?[\s,]*/i, '').trim())

function parseCollegeBoard(text: string): StructuredExplanation | null {
  const head = /^\s*Choice ([A-D]) is the best answer\b/.exec(text)
  if (!head) return null
  const wrong = /Choice ([A-D]) is incorrect\b/g
  const marks = [...text.matchAll(wrong)]
  const whyText = text.slice(head[0].length, marks.length ? marks[0].index : text.length)
  const others = marks.map((m, i) => {
    const start = (m.index ?? 0) + m[0].length
    const end = i + 1 < marks.length ? marks[i + 1].index : text.length
    return {
      option: m[1] as OptionLabel,
      part: { lead: reason(text.slice(start, end)), steps: [] },
    }
  })
  return { correct: head[1] as OptionLabel, why: { lead: reason(whyText), steps: [] }, others }
}

export function parseExplanation(text: string | null | undefined): StructuredExplanation | null {
  if (!text) return null
  return parseOnePrep(text) ?? parseCollegeBoard(text)
}

/**
 * OnePrep's numbers for an item, which 0065 wrote as its difficulty rationale:
 * "OnePrep rates this easy: 72% of its users answer it correctly, in 1:17 on
 * average; the middle half of correct answers take 48s to 1:55." Null for a
 * rationale in the teachers' own words.
 */
export interface SourceStats {
  source: string
  /** Per cent who answer it correctly. */
  accuracy: number
  average: string
  /** The middle half of correct answers, fastest to slowest. */
  middle: [string, string]
}

export function parseSourceStats(text: string | null | undefined): SourceStats | null {
  if (!text) return null
  const m =
    /^\s*(\w+) rates this \w+: (\d+)% of its users answer it correctly, in ([\d:]+s?) on average; the middle half of correct answers take ([\d:]+s?) to ([\d:]+s?)\.?\s*$/.exec(
      text,
    )
  if (!m) return null
  return { source: m[1], accuracy: Number(m[2]), average: m[3], middle: [m[4], m[5]] }
}
