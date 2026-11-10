import { describe, expect, it } from 'vitest'
import { allRows, PAGE_SIZE, type PageAnswer } from './allRows'

/** A table of `n` rows behind a server that hands back at most `cap` a request. */
function server(n: number, cap: number, opts: { count?: boolean; failAt?: number } = {}) {
  const table = Array.from({ length: n }, (_, i) => i)
  const asked: [number, number][] = []
  const page = async (from: number, to: number): Promise<PageAnswer> => {
    asked.push([from, to])
    if (opts.failAt !== undefined && from >= opts.failAt) {
      return { data: null, error: { message: 'statement timeout' } }
    }
    const end = Math.min(to + 1, from + cap)
    return {
      data: table.slice(from, end),
      error: null,
      count: opts.count === false ? null : n,
    }
  }
  return { page, asked }
}

describe('allRows', () => {
  it('reads a short list in one request', async () => {
    const s = server(20, 1000)
    const r = await allRows<number>(s.page)
    expect(r).toEqual({ rows: [...Array(20).keys()], error: null })
    expect(s.asked).toEqual([[0, PAGE_SIZE - 1]])
  })

  it('reads past the thousand-row cap — the pool that showed 1000 of its 1892', async () => {
    const s = server(1892, 1000)
    const r = await allRows<number>(s.page)
    expect(r.error).toBeNull()
    expect(r.rows).toHaveLength(1892)
    expect(r.rows[1891]).toBe(1891)
    expect(s.asked).toEqual([
      [0, 999],
      [1000, 1999],
    ])
  })

  it('reads a list of exactly one page without asking again', async () => {
    const s = server(1000, 1000)
    const r = await allRows<number>(s.page)
    expect(r.rows).toHaveLength(1000)
    expect(s.asked).toHaveLength(1)
  })

  it('reads an empty list', async () => {
    const s = server(0, 1000)
    expect(await allRows<number>(s.page)).toEqual({ rows: [], error: null })
  })

  it('reads the whole list when the server caps lower than a page', async () => {
    const s = server(1250, 500)
    const r = await allRows<number>(s.page)
    expect(r.rows).toEqual([...Array(1250).keys()])
    expect(s.asked.map(([from]) => from)).toEqual([0, 500, 1000])
  })

  it('without a count, reads until a page comes back empty', async () => {
    const s = server(1500, 1000, { count: false })
    const r = await allRows<number>(s.page)
    expect(r.rows).toHaveLength(1500)
    expect(s.asked.map(([from]) => from)).toEqual([0, 1000, 1500])
  })

  it('says the error, and does not pass off a part as the whole', async () => {
    const s = server(2500, 1000, { failAt: 1000 })
    const r = await allRows<number>(s.page)
    expect(r.error).toBe('statement timeout')
    expect(r.rows).toHaveLength(1000)
  })
})
