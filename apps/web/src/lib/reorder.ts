/**
 * The list operations the paper builder runs on its selection.
 *
 * Pulled out of the component because ordering is the part that has to be
 * right: a question dragged from the end to the middle, or removed while a
 * drag is in flight, is where an off-by-one silently reorders a student's
 * paper. Pure functions, so the cases can be tested rather than clicked.
 */

/** Moves one entry, closing the gap behind it. Out-of-range indices are no-ops. */
export function move<T>(list: T[], from: number, to: number): T[] {
  if (from === to) return list
  if (from < 0 || from >= list.length) return list
  if (to < 0 || to >= list.length) return list

  const next = [...list]
  const [item] = next.splice(from, 1)
  next.splice(to, 0, item)
  return next
}

/** Adds the id if it is absent, removes it if it is present. Added ids go last. */
export function toggle(list: string[], id: string): string[] {
  return list.includes(id) ? list.filter((x) => x !== id) : [...list, id]
}

/**
 * Adds every id not already selected, in the order given.
 *
 * "Add this whole passage" has to leave the questions the teacher already
 * picked where they are — re-adding them at the end would scatter the passage
 * they belong to across the paper.
 */
export function addAll(list: string[], ids: string[]): string[] {
  const have = new Set(list)
  return [...list, ...ids.filter((id) => !have.has(id))]
}

export function removeAll(list: string[], ids: string[]): string[] {
  const drop = new Set(ids)
  return list.filter((id) => !drop.has(id))
}
