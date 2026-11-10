/**
 * A PDF's text layer, as lines — what lib/bluebook reads a score report from.
 *
 * pdf.js hands back positioned fragments, not lines: a word, a few letters,
 * sometimes one number in two pieces. linesFromItems puts them back in reading
 * order — a line is the fragments that share a baseline, left to right — and
 * joins two fragments with a space only when there is a gap between them, so
 * a number set as "12" and "50" side by side is read as 1250.
 *
 * The library itself is loaded only when a PDF is read: it is large, and only
 * the teacher recording a Bluebook score needs it.
 */

/** The part of a pdf.js TextItem this reads. */
export interface TextFragment {
  str: string
  /** [a, b, c, d, x, y]: the fragment's matrix; a is about its font size. */
  transform: number[]
  width: number
}

/** Fragments into lines, top of the page first. */
export function linesFromItems(items: TextFragment[]): string[] {
  const usable = items.filter((i) => i.str.trim() !== '' && i.transform.length >= 6)
  // A line is a baseline, within a third of the text's height.
  const rows: { y: number; size: number; items: TextFragment[] }[] = []
  for (const item of usable) {
    const y = item.transform[5]
    const size = Math.abs(item.transform[0]) || Math.abs(item.transform[3]) || 10
    const row = rows.find((r) => Math.abs(r.y - y) <= Math.max(r.size, size) / 3)
    if (row) row.items.push(item)
    else rows.push({ y, size, items: [item] })
  }
  // PDF space runs upwards: the highest baseline is the first line.
  rows.sort((a, b) => b.y - a.y)
  return rows.map((r) => {
    const sorted = [...r.items].sort((a, b) => a.transform[4] - b.transform[4])
    let line = ''
    let end: number | null = null
    for (const it of sorted) {
      const x = it.transform[4]
      const size = Math.abs(it.transform[0]) || 10
      const gap = end === null ? 0 : x - end
      line += end !== null && gap > size * 0.15 ? ` ${it.str}` : it.str
      end = x + it.width
    }
    return line.replace(/\s+/g, ' ').trim()
  })
}

/** Every page's lines, in order, from a PDF the browser holds. */
export async function pdfLines(data: ArrayBuffer): Promise<string[]> {
  const pdfjs = await import('pdfjs-dist')
  const worker = await import('pdfjs-dist/build/pdf.worker.min.mjs?url')
  pdfjs.GlobalWorkerOptions.workerSrc = worker.default
  const doc = await pdfjs.getDocument({ data: new Uint8Array(data) }).promise
  try {
    const lines: string[] = []
    for (let n = 1; n <= doc.numPages; n++) {
      const page = await doc.getPage(n)
      const content = await page.getTextContent()
      const fragments: TextFragment[] = []
      for (const i of content.items) if ('str' in i) fragments.push(i)
      lines.push(...linesFromItems(fragments))
    }
    return lines
  } finally {
    void doc.destroy()
  }
}
