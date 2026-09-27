/**
 * The four domains of each subject, in the order the form prints them.
 *
 * There is one grid per subject, not one grid. A mathematics session assessed
 * against Craft and Structure would be four rows about a test that was never
 * sat — and the four rows it was sat against would be nowhere on the form.
 *
 * On its own, importing nothing, because the edge function that reads the
 * recording needs the same list: it shows the model the teacher's form under
 * these keys, and drops any claim filed under another. It used to carry the
 * English four as a copy of its own, so a mathematics form never reached the
 * reading at all, and every domain finding on a mathematics report was dropped.
 */
export const DOMAINS: Record<'english' | 'mathematics', string[]> = {
  english: [
    'information_and_ideas',
    'craft_and_structure',
    'expression_of_ideas',
    'standard_english_conventions',
  ],
  mathematics: [
    'algebra',
    'advanced_math',
    'problem_solving_and_data_analysis',
    'geometry_and_trigonometry',
  ],
}

/** The domains a session of this subject is assessed against. */
export function domainOrder(subject: string | null | undefined): string[] {
  return DOMAINS[(subject ?? 'english') as keyof typeof DOMAINS] ?? DOMAINS.english
}
