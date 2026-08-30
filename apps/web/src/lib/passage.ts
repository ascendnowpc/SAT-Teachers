/**
 * Splits a passage around the span a question calls "the underlined sentence".
 *
 * The paper underlines one sentence and then asks what it does; without the
 * span the question cannot be answered, so the bank stores the exact substring
 * and the renderer marks it up. This is the pure half of that — it returns the
 * passage as a flat run of segments so any view can render them.
 *
 * A span that isn't found (a typo, or a passage edited after the fact) yields
 * the passage unmarked rather than throwing: a question that renders plainly is
 * recoverable in a live session, a blank one is not.
 */
export interface PassageSegment {
  text: string
  underlined: boolean
}

export function splitPassage(
  passage: string | null | undefined,
  underline: string | null | undefined,
): PassageSegment[] {
  if (!passage) return []
  if (!underline) return [{ text: passage, underlined: false }]

  const at = passage.indexOf(underline)
  if (at === -1) return [{ text: passage, underlined: false }]

  // Only the first occurrence is marked. A sentence repeated verbatim in one
  // passage is not something the source papers do, and underlining every copy
  // would point at the wrong one as often as the right one.
  const segments: PassageSegment[] = []
  if (at > 0) segments.push({ text: passage.slice(0, at), underlined: false })
  segments.push({ text: underline, underlined: true })
  const rest = passage.slice(at + underline.length)
  if (rest) segments.push({ text: rest, underlined: false })
  return segments
}
