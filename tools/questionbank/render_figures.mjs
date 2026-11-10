// Draw each question's figure the way College Board draws it, and nothing else.
//
//     node tools/questionbank/render_figures.mjs cb.json apps/web/public/question-figures/cb
//
// collegeboard.py keeps a table, a graph or a drawing as the HTML College Board
// publishes it. This puts that HTML in a page of its own, in Chromium, and
// photographs it at twice its size: CB-xxxxxxxx.png for the question's figure,
// CB-xxxxxxxx-A.png and so on for an option that is a figure (0095).
//
// Two things College Board's page does that Chromium alone does not: a screen
// reader's long description sits beside each figure, hidden by their style
// sheet (hidden here too), and table headings use <mfenced>, which MathML Core
// dropped (rewritten here as brackets, so "g(x)" keeps its brackets).
import { createRequire } from 'node:module'
import { readFileSync, mkdirSync } from 'node:fs'
import { join } from 'node:path'

// Through require, so the Playwright installed with the machine's browser is found.
const { chromium } = createRequire(import.meta.url)('playwright')

const [, , input, outDir] = process.argv
const questions = JSON.parse(readFileSync(input, 'utf8'))
mkdirSync(outDir, { recursive: true })

const CSS = `
  body { margin: 0; background: #fff; font: 17px/1.4 Arial, Helvetica, sans-serif; color: #000; }
  #fig { display: inline-block; padding: 10px; }
  #fig > * + * { margin-top: 14px; }
  .sr-only, [class*="sr-only"] { display: none !important; }
  figure { margin: 0; }
  table { border-collapse: collapse; }
  td, th { border: 1px solid #000; padding: 5px 14px; text-align: center; vertical-align: middle; }
  th { font-weight: bold; }
  img { display: block; }
  svg { display: block; max-width: 720px; height: auto; }
  math { font-size: 1.05em; }
`

const UNFENCE = `
  for (const f of [...document.querySelectorAll('mfenced')].reverse()) {
    const ns = 'http://www.w3.org/1998/Math/MathML'
    const row = document.createElementNS(ns, 'mrow')
    const mo = (t) => { const o = document.createElementNS(ns, 'mo'); o.textContent = t; return o }
    const sep = (f.getAttribute('separators') ?? ',').trim() || ','
    row.append(mo(f.getAttribute('open') ?? '('))
    ;[...f.children].forEach((c, i) => { if (i) row.append(mo(sep[0])); row.append(c) })
    row.append(mo(f.getAttribute('close') ?? ')'))
    f.replaceWith(row)
  }
`

const browser = await chromium.launch()
const page = await browser.newPage({ deviceScaleFactor: 2, viewport: { width: 900, height: 600 } })

async function shoot(fragments, file) {
  await page.setContent(`<!doctype html><meta charset="utf-8"><style>${CSS}</style><div id="fig">${fragments.join('')}</div>`)
  await page.evaluate(UNFENCE)
  await page.evaluate(() => document.fonts.ready)
  await page.locator('#fig').screenshot({ path: file })
}

let n = 0
for (const q of questions) {
  if (q.figures.length) { await shoot(q.figures, join(outDir, `${q.ref}.png`)); n++ }
  for (const o of q.options) {
    if (o.figures.length) { await shoot(o.figures, join(outDir, `${q.ref}-${o.label}.png`)); n++ }
  }
}
await browser.close()
console.log(`${n} figures -> ${outDir}`)
