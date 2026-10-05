/**
 * Finds the fractions in a line of mathematics written with a slash.
 *
 * The bank stores mathematics as plain text — "1/14", "√15/4",
 * "w = −x/(150v)" — because that is what the source papers were typed as and
 * what a teacher can type into the authoring form. The test the students sit
 * sets every one of those as a stacked fraction, and a slash in the middle of
 * an equation is the one thing on our screen that does not look like theirs.
 * This is the pure half of fixing that: it splits a string into plain runs and
 * fractions, and MathText draws them.
 *
 * What counts as the top and the bottom is what a reader would take it to be:
 * the run of number, letters and roots touching the slash on each side, and a
 * bracketed group taken whole — so "(2 ± √40)/2" puts all of the bracket on
 * top, "f(x)/(x + 3)" keeps the function call together, and a sign in front of
 * the fraction stays outside it, which is how the paper prints "−1/9". The
 * brackets that only held a numerator or denominator together are dropped,
 * because the bar does that job once the fraction is stacked.
 *
 * Anything it cannot read as a fraction — a slash with nothing on one side, or
 * "and/or" in a sentence — is left as text. A slash that renders plainly is the
 * old screen; a question chopped up wrongly is a worse one.
 */
export type MathSegment =
  | { kind: 'text'; text: string }
  | { kind: 'frac'; num: MathSegment[]; den: MathSegment[]; source: string }

const DIGIT = /[0-9]/
// Letters in any script (π and the Greek angles), digits, roots, primes,
// degrees and the superscript exponents the bank uses — the characters that
// bind into one term. The caret joins an exponent written longhand.
const BINDING = /[\p{L}\p{N}√°′^]/u

function bindsAt(s: string, k: number): boolean {
  const c = s[k]
  if (c === undefined) return false
  if (BINDING.test(c)) return true
  // A decimal point only inside a number — "0.83" — never the full stop that
  // ends the sentence after "1/14."
  if (c === '.') return DIGIT.test(s[k + 1] ?? '')
  // A thousands comma only between digits, three of them after it — "24,000",
  // and not the comma in "(−26/3, 0)".
  if (c === ',') {
    return (
      DIGIT.test(s[k - 1] ?? '') && /^[0-9]{3}(?![0-9])/.test(s.slice(k + 1, k + 5))
    )
  }
  return false
}

/** Index of the bracket that closes the one opening at `open`, or -1. */
function closing(s: string, open: number): number {
  let depth = 0
  for (let k = open; k < s.length; k++) {
    if (s[k] === '(') depth++
    else if (s[k] === ')' && --depth === 0) return k
  }
  return -1
}

/** Index of the bracket that opens the one closing at `close`, or -1. */
function opening(s: string, close: number, limit: number): number {
  let depth = 0
  for (let k = close; k >= limit; k--) {
    if (s[k] === ')') depth++
    else if (s[k] === '(' && --depth === 0) return k
  }
  return -1
}

/** Where the numerator ending just before `slash` starts, or -1 for none. */
function numeratorStart(s: string, slash: number, limit: number): number {
  let k = slash - 1
  while (k >= limit) {
    if (s[k] === ')') {
      const open = opening(s, k, limit)
      if (open === -1) break
      k = open - 1
    } else if (bindsAt(s, k)) {
      k--
    } else {
      break
    }
  }
  return k + 1 === slash ? -1 : k + 1
}

/** Where the denominator starting just after `slash` ends (exclusive), or -1. */
function denominatorEnd(s: string, slash: number): number {
  let k = slash + 1
  while (k < s.length) {
    if (s[k] === '(') {
      const close = closing(s, k)
      if (close === -1) break
      k = close + 1
    } else if (bindsAt(s, k)) {
      k++
    } else {
      break
    }
  }
  return k === slash + 1 ? -1 : k
}

/** "(x + 3)" → "x + 3" when the brackets wrap the whole of it. */
function unwrap(operand: string): string {
  if (operand.startsWith('(') && closing(operand, 0) === operand.length - 1) {
    return operand.slice(1, -1)
  }
  return operand
}

/** "and/or", "either/or": a slash between words, not a division. */
function isProse(num: string, den: string): boolean {
  const letters = /^\p{L}+$/u
  return letters.test(num) && letters.test(den) && Math.max(num.length, den.length) >= 3
}

/**
 * The slashes outside every bracket. Only these are read on this pass: one
 * inside a bracket belongs either to an operand of an outer fraction, which
 * reads it when it splits that operand, or to a bracket left as text, which
 * reads it when that bracket is set (pushPlain) — and taking it first would
 * cut "(1/2)/(3/4)" into two halves of nothing.
 */
function topLevelSlashes(s: string): number[] {
  const found: number[] = []
  let depth = 0
  for (let k = 0; k < s.length; k++) {
    if (s[k] === '(') depth++
    else if (s[k] === ')') depth = Math.max(0, depth - 1)
    else if (s[k] === '/' && depth === 0) found.push(k)
  }
  return found
}

export function splitFractions(text: string | null | undefined): MathSegment[] {
  if (!text) return []

  const out: MathSegment[] = []
  const pushText = (chunk: string) => {
    if (!chunk) return
    const prev = out[out.length - 1]
    if (prev?.kind === 'text') prev.text += chunk
    else out.push({ kind: 'text', text: chunk })
  }
  // Text between fractions, with each bracket in it read on its own for the
  // fractions inside it — the "1/2" in "(1/2)y".
  const pushPlain = (chunk: string) => {
    let k = 0
    while (k < chunk.length) {
      const open = chunk.indexOf('(', k)
      const close = open === -1 ? -1 : closing(chunk, open)
      if (close === -1) {
        pushText(chunk.slice(k))
        return
      }
      pushText(chunk.slice(k, open + 1))
      for (const seg of splitFractions(chunk.slice(open + 1, close))) {
        if (seg.kind === 'text') pushText(seg.text)
        else out.push(seg)
      }
      pushText(')')
      k = close + 1
    }
  }

  let plainFrom = 0
  for (const slash of topLevelSlashes(text)) {
    // Already inside the denominator of the fraction before it.
    if (slash < plainFrom) continue

    const start = numeratorStart(text, slash, plainFrom)
    const end = denominatorEnd(text, slash)
    if (start === -1 || end === -1) continue

    const num = text.slice(start, slash)
    const den = text.slice(slash + 1, end)
    if (isProse(num, den)) continue

    pushPlain(text.slice(plainFrom, start))
    out.push({
      kind: 'frac',
      num: splitFractions(unwrap(num)),
      den: splitFractions(unwrap(den)),
      source: text.slice(start, end),
    })
    plainFrom = end
  }

  pushPlain(text.slice(plainFrom))
  return out
}
