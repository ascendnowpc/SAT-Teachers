/**
 * The number each question wears, and the order the lesson ran in.
 *
 * Kept in its own module with no imports because three different places need
 * the same answer and none of them may disagree: the screens the student and
 * the teacher watch, the report, and the server that reads the recording. When
 * the reading was numbered one way and the report another, the model was told
 * "question 5 on the paper" about the question the report prints as Q4 — and
 * every quote it found landed under the wrong heading.
 */

/** As much of a session item as the numbering needs. */
export interface Asked {
  id: string
  status: string
  asked_no: number | null
  sequence_no: number
}

/**
 * The order the lesson actually ran in.
 *
 * A session that moves levels does not ask its questions in the order they sit
 * in — the easy test's first six, then the medium test's twenty — so the order
 * follows asked_no where there is one. Within a single level the two numbers
 * are equal, so this is the plain ordering there.
 */
export function askOrder(i: Pick<Asked, 'asked_no' | 'sequence_no'>): number {
  return i.asked_no ?? i.sequence_no
}

/**
 * The number each question wears on screen, counting only the ones worked on.
 *
 * asked_no is stamped on every publish, including the question that was on
 * screen when the level moved. Numbering by it meant a question set aside by a
 * switch still spent a number, and the board read 02, 04, 05 — a gap that
 * looks like a lost question and counts a question nobody meant to sit against
 * the student's total. A switch is a decision that this question was not the
 * one for the lesson, so it takes no number at all: the questions the student
 * actually worked on run 1, 2, 3 in the order they were asked, and a set-aside
 * one gets no number (the callers show a dash).
 */
export function askNumbers(items: Asked[]): Map<string, number> {
  const numbers = new Map<string, number>()
  items
    .filter((i) => i.status !== 'staged' && i.status !== 'voided')
    .sort((a, b) => askOrder(a) - askOrder(b))
    .forEach((i, idx) => numbers.set(i.id, idx + 1))
  return numbers
}
