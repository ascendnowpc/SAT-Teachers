/**
 * Every row a query has, a page at a time.
 *
 * PostgREST answers one request with at most the project's max-rows — 1000,
 * Supabase's default — and says nothing when it stops there: no error, no
 * flag, just a shorter list that looks like the whole one. That was harmless
 * while the bank held a few hundred questions; with the College Board pools
 * (1,892 English, 1,844 Mathematics) it is not. The question bank counted 940
 * questions "in no test" that were all in a pool, because it had been handed
 * the first thousand questions and the first thousand filings and compared
 * the two; and a pool opened as a paper showed a thousand of its questions.
 *
 * So a read that can pass a thousand rows asks for them in pages, and keeps
 * asking until it has as many as the first answer said there were. Asking with
 * `{ count: 'exact' }` is what lets it stop after one page when one page is
 * all there is; without a count it stops at the first empty page instead. It
 * steps by the rows it got, not the rows it asked for, so a project whose
 * max-rows is lower than PAGE_SIZE is read whole too.
 *
 * The query must be in a total order — a key, or an order that ends in one —
 * or a row can move between pages and be read twice or not at all.
 */
export const PAGE_SIZE = 1000

export type PageAnswer = {
  data: unknown
  error: { message: string } | null
  count?: number | null
}

export async function allRows<T>(
  page: (from: number, to: number) => PromiseLike<PageAnswer>,
): Promise<{ rows: T[]; error: string | null }> {
  const out: T[] = []
  for (;;) {
    const { data, error, count } = await page(out.length, out.length + PAGE_SIZE - 1)
    if (error) return { rows: out, error: error.message }
    const got = (data ?? []) as T[]
    out.push(...got)
    if (got.length === 0 || (count != null && out.length >= count)) {
      return { rows: out, error: null }
    }
  }
}
