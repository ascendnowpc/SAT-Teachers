import { PDFDocument, StandardFonts, type RGB } from 'npm:pdf-lib@1.17.1'

import { winAnsi, wrapText } from '../../../apps/web/src/lib/reportPdf.ts'
import type { ReportSubject, SectionReportDoc } from '../../../apps/web/src/lib/sectionReport.ts'
import {
  BAND,
  BORDER,
  FAINT,
  hex,
  INK,
  INK_2,
  Layout,
  LEFT,
  LIME,
  MUTED,
  PAGE_H,
  PAGE_W,
  RIGHT,
  WASH,
  WHITE,
  WIDTH,
  type Fonts,
} from './pdf.ts'

/**
 * The Section Progress Report, drawn (0103): one A4 page per subject. What it
 * says was decided by lib/sectionReport.ts, from the same rows and by the same
 * functions as the report page the PC reads; this only places it.
 */

const RAG_DOT: Record<string, RGB> = { green: hex('#23764E'), amber: hex('#BF8A00'), red: hex('#C0433A') }

function band(l: Layout, doc: SectionReportDoc, logo: Awaited<ReturnType<PDFDocument['embedPng']>> | null) {
  const h = 70
  l.page.drawRectangle({ x: 0, y: PAGE_H - h, width: PAGE_W, height: h, color: BAND })
  if (logo) {
    const lh = 28
    l.page.drawImage(logo, { x: LEFT, y: PAGE_H - h / 2 - lh / 2, width: (logo.width / logo.height) * lh, height: lh })
  } else {
    l.at('Ascend Now', LEFT, PAGE_H - h / 2 - 5, { size: 15, font: l.f.bold, color: WHITE })
  }
  const kicker = doc.title.toUpperCase()
  l.at(kicker, PAGE_W - RIGHT - l.width(kicker, 8.5, l.f.bold), PAGE_H - h / 2 + 4, { size: 8.5, font: l.f.bold, color: LIME })
  l.at(doc.date, PAGE_W - RIGHT - l.width(doc.date, 9), PAGE_H - h / 2 - 10, { size: 9, color: WHITE })
  l.y = PAGE_H - h - 24
}

function subjectPage(l: Layout, doc: SectionReportDoc, s: ReportSubject, first: boolean) {
  l.text(`${doc.student} · ${s.name}`, { size: 17, font: l.f.bold, leading: 1.25 })
  l.text(
    [`Student ID ${doc.studentId}`, doc.testDay, doc.pc ? `PC: ${doc.pc}` : null].filter(Boolean).join('   ·   '),
    { size: 9.5, color: INK_2 },
  )

  if (first && doc.note) {
    const lines = l.lines(doc.note, { size: 9.5, width: WIDTH - 20 })
    const h = lines.length * 9.5 * 1.4 + 26
    l.gap(10)
    l.room(h)
    l.page.drawRectangle({ x: LEFT, y: l.y - h, width: WIDTH, height: h, color: WASH, borderColor: BORDER, borderWidth: 0.6 })
    l.gap(6)
    l.text(`FROM ${doc.pc?.toUpperCase() ?? 'YOUR PC'}`, { size: 7, font: l.f.bold, color: MUTED, x: LEFT + 10 })
    l.text(doc.note, { size: 9.5, x: LEFT + 10, width: WIDTH - 20 })
    l.gap(6)
  }

  // 1. The headline.
  l.gap(12)
  const top = l.y
  l.text(s.headline, { size: 12, font: l.f.bold, x: LEFT + 10, width: WIDTH - 10, leading: 1.35 })
  l.page.drawLine({ start: { x: LEFT + 2, y: top - 2 }, end: { x: LEFT + 2, y: l.y + 2 }, thickness: 2.5, color: LIME })

  // The goal beside the latest score.
  if (s.goal.target !== null || s.goal.latest !== null) {
    l.gap(6)
    const parts = [
      s.goal.target !== null ? `Goal ${s.goal.target}` : null,
      s.goal.latest !== null ? `Latest SAT ${s.goal.latest}` : null,
      s.goal.gap,
    ].filter(Boolean)
    l.text(parts.join('   ·   '), { size: 10, color: INK_2 })
  }

  // 2 and 3. The domains: baseline, latest, change, colour in words, sessions.
  l.heading('The four domains')
  const cols = [
    { label: 'Domain', x: LEFT, w: 156 },
    { label: 'Baseline', x: LEFT + 160, w: 60 },
    { label: 'Latest', x: LEFT + 222, w: 60 },
    { label: 'Change', x: LEFT + 284, w: 92 },
    { label: 'Sessions', x: LEFT + 380, w: 40 },
    { label: 'Now', x: LEFT + 422, w: WIDTH - 422 },
  ]
  l.room(16)
  const hb = l.y - 10
  for (const c of cols) l.at(c.label.toUpperCase(), c.x, hb, { size: 7, font: l.f.bold, color: MUTED })
  l.gap(16)
  const point = (p: { level: number; right: number; of: number } | null) => (p ? `${Math.round(p.level)} (${p.right}/${p.of})` : '—')
  for (const d of s.domains) {
    const name = l.lines(d.label, { size: 9.5, width: cols[0].w })
    const h = Math.max(1, name.length) * 13 + 8
    l.room(h)
    const b = l.y - 13
    name.forEach((line, i) => l.at(line, cols[0].x, b - i * 13, { size: 9.5, font: l.f.bold }))
    l.at(point(d.baseline), cols[1].x, b, { size: 9.5 })
    l.at(d.latest ? point(d.latest) : d.baseline ? 'baseline only' : '—', cols[2].x, b, { size: 9.5, color: d.latest ? INK : MUTED })
    const change = d.change === null ? '—' : `${d.change > 0 ? '+' : d.change < 0 ? '-' : '±'}${Math.abs(d.change)} ${d.verdict ?? ''}`
    l.at(change.trim(), cols[3].x, b, { size: 9, color: d.change === null ? MUTED : INK })
    l.at(d.baseline ? String(d.sessions) : '—', cols[4].x, b, { size: 9.5 })
    if (d.rag) l.page.drawCircle({ x: cols[5].x + 3.5, y: b + 3, size: 3.5, color: RAG_DOT[d.rag] })
    l.at(d.status, cols[5].x + (d.rag ? 11 : 0), b, { size: 9, color: d.rag ? INK : MUTED })
    l.gap(h)
    l.page.drawLine({ start: { x: LEFT, y: l.y + 3 }, end: { x: PAGE_W - RIGHT, y: l.y + 3 }, thickness: 0.4, color: BORDER })
  }
  l.gap(4)
  l.text('Sessions: every lesson and check-in since the baseline.', { size: 7.5, color: MUTED })

  // 4. Patterns.
  if (s.patterns.length > 0) {
    l.heading('What the answers show')
    for (const p of s.patterns) {
      l.room(14)
      const b = l.y - 12
      l.page.drawCircle({ x: LEFT + 3, y: b + 3, size: 1.8, color: INK_2 })
      l.text(p, { size: 10, x: LEFT + 12, width: WIDTH - 12 })
    }
  }

  // 5. What happens next.
  l.heading('What happens next')
  l.text(s.next, { size: 10 })

  l.gap(14)
  l.text(doc.scaleNote, { size: 7.5, color: MUTED })
}

/** The report as PDF bytes; `logo` is the mark drawn on the navy band. */
export async function sectionReportPdf(doc: SectionReportDoc, logo: Uint8Array | null = null): Promise<Uint8Array> {
  const pdf = await PDFDocument.create()
  pdf.setTitle(`${doc.title} — ${doc.student}`)
  pdf.setAuthor('Ascend Now')
  pdf.setCreator('SAT Teachers')
  pdf.setCreationDate(new Date())
  const fonts: Fonts = {
    regular: await pdf.embedFont(StandardFonts.Helvetica),
    bold: await pdf.embedFont(StandardFonts.HelveticaBold),
    italic: await pdf.embedFont(StandardFonts.HelveticaOblique),
  }
  let image: Awaited<ReturnType<PDFDocument['embedPng']>> | null = null
  if (logo) {
    try {
      image = await pdf.embedPng(logo)
    } catch {
      image = null
    }
  }

  const l = new Layout(pdf, fonts)
  if (doc.subjects.length === 0) {
    band(l, doc, image)
    l.text(`${doc.student} has no check-ins yet. The report fills in after the first test.`, { size: 11, color: INK_2 })
  }
  doc.subjects.forEach((s, i) => {
    if (i > 0) l.addPage()
    band(l, doc, image)
    subjectPage(l, doc, s, i === 0)
  })

  l.pages.forEach((page, i) => {
    const right = `Page ${i + 1} of ${l.pages.length}`
    const room = WIDTH - fonts.regular.widthOfTextAtSize(right, 7.5) - 16
    const foot = wrapText(winAnsi(doc.footer), room, (t) => fonts.regular.widthOfTextAtSize(t, 7.5))[0] ?? ''
    page.drawLine({ start: { x: LEFT, y: 40 }, end: { x: PAGE_W - RIGHT, y: 40 }, thickness: 0.6, color: BORDER })
    page.drawText(foot, { x: LEFT, y: 28, size: 7.5, font: fonts.regular, color: FAINT })
    page.drawText(right, { x: PAGE_W - RIGHT - fonts.regular.widthOfTextAtSize(right, 7.5), y: 28, size: 7.5, font: fonts.regular, color: FAINT })
  })

  return await pdf.save()
}
