import { PDFDocument, StandardFonts, rgb, type PDFFont, type PDFPage, type RGB } from 'npm:pdf-lib@1.17.1'

import { winAnsi, wrapText, type PdfClaim, type ReportPdfDoc } from '../../../apps/web/src/lib/reportPdf.ts'

/**
 * The report, drawn.
 *
 * Everything this prints was decided by lib/reportPdf.ts, from the same rows
 * and by the same functions as the report page; this only decides where it
 * goes on an A4 page. It uses the PDF's standard fonts because a hosted
 * function cannot be deployed with a font file, which is also why every string
 * passes through winAnsi() on its way to the page.
 *
 * pdf-lib, because it is plain JavaScript: no headless browser, no native
 * code, nothing the edge runtime cannot run inside its two seconds of CPU.
 */

const PAGE_W = 595.28
const PAGE_H = 841.89
const LEFT = 48
const RIGHT = 48
const TOP = 48
const BOTTOM = 60
const WIDTH = PAGE_W - LEFT - RIGHT

function hex(h: string): RGB {
  return rgb(parseInt(h.slice(1, 3), 16) / 255, parseInt(h.slice(3, 5), 16) / 255, parseInt(h.slice(5, 7), 16) / 255)
}

// The app's own tokens (styles.css), so the PDF reads as the same product.
const INK = hex('#1E2752')
const INK_2 = hex('#3D4D8F')
const MUTED = hex('#8796C6')
const FAINT = hex('#AFB9D9')
const BORDER = hex('#D7DCEC')
const WASH = hex('#EEF0F7')
const LIME = hex('#CEE177')
const SKY = hex('#40B0E5')
const OK = hex('#2F7D55')
const BAD = hex('#C0433A')
const WHITE = rgb(1, 1, 1)
// The navy the logo is drawn on, so the band and the picture are one surface.
const BAND = hex('#293366')

interface Fonts {
  regular: PDFFont
  bold: PDFFont
  italic: PDFFont
}

interface TextStyle {
  size?: number
  font?: PDFFont
  color?: RGB
  x?: number
  width?: number
  /** Line height as a multiple of the size. */
  leading?: number
}

/** A cursor down the page that starts a new one when it runs out of room. */
class Layout {
  readonly pages: PDFPage[] = []
  page!: PDFPage
  y = 0

  constructor(
    private readonly doc: PDFDocument,
    readonly f: Fonts,
  ) {
    this.addPage()
  }

  addPage() {
    this.page = this.doc.addPage([PAGE_W, PAGE_H])
    this.pages.push(this.page)
    this.y = PAGE_H - TOP
  }

  /** Makes sure there are `h` points left on this page, starting another if not. */
  room(h: number): boolean {
    if (this.y - h >= BOTTOM) return false
    this.addPage()
    return true
  }

  gap(h: number) {
    this.y -= h
  }

  width(text: string, size: number, font: PDFFont = this.f.regular): number {
    return font.widthOfTextAtSize(winAnsi(text), size)
  }

  lines(text: string, style: TextStyle = {}): string[] {
    const size = style.size ?? 10
    const font = style.font ?? this.f.regular
    return wrapText(winAnsi(text), style.width ?? WIDTH, (s) => font.widthOfTextAtSize(s, size))
  }

  /** Text, wrapped to the width, a page break wherever one falls between lines. */
  text(text: string, style: TextStyle = {}) {
    const size = style.size ?? 10
    const font = style.font ?? this.f.regular
    const lead = size * (style.leading ?? 1.4)
    for (const line of this.lines(text, style)) {
      this.room(lead)
      this.y -= lead
      if (line) {
        this.page.drawText(line, {
          x: style.x ?? LEFT,
          y: this.y + (lead - size) / 2 + size * 0.22,
          size,
          font,
          color: style.color ?? INK,
        })
      }
    }
  }

  /** One line at a fixed place, not moving the cursor. */
  at(text: string, x: number, baseline: number, style: TextStyle = {}) {
    this.page.drawText(winAnsi(text), {
      x,
      y: baseline,
      size: style.size ?? 10,
      font: style.font ?? this.f.regular,
      color: style.color ?? INK,
    })
  }

  rule(color: RGB = BORDER, thickness = 0.8) {
    this.page.drawLine({
      start: { x: LEFT, y: this.y },
      end: { x: PAGE_W - RIGHT, y: this.y },
      thickness,
      color,
    })
  }

  /** A section's title: small, bold, with a rule under it, and never alone at a page's foot. */
  heading(title: string) {
    this.room(60)
    this.gap(20)
    this.text(title.toUpperCase(), { size: 8.5, font: this.f.bold, color: INK_2 })
    this.gap(4)
    this.rule()
    this.gap(6)
  }

  /** Where text() puts a line's baseline, for drawing something level with it. */
  baseline(top: number, size: number, leading = 1.4): number {
    const lead = size * leading
    return top - lead + (lead - size) / 2 + size * 0.22
  }

  /** A small label over what it labels. */
  label(text: string, x = LEFT) {
    this.room(28)
    this.text(text.toUpperCase(), { size: 7.5, font: this.f.bold, color: MUTED, x })
  }
}

function claimBlock(l: Layout, claim: PdfClaim, x = LEFT + 10) {
  const width = PAGE_W - RIGHT - x
  l.room(44)
  l.text(claim.label, { size: 7.5, font: l.f.bold, color: INK_2, x, width })
  l.text(claim.text, { size: 9.5, x, width })
  const top = l.y
  const page = l.page
  l.text(`“${claim.quote}”`, { size: 9, font: l.f.italic, color: INK, x: x + 8, width: width - 8 })
  l.text(`— ${claim.cite}`, { size: 7.5, color: MUTED, x: x + 8, width: width - 8 })
  // The quote's rule, drawn once its height is known — and only when the quote
  // stayed on one page, since a y on one page means nothing on the next.
  if (l.page === page) {
    l.page.drawLine({ start: { x: x + 2, y: top - 2 }, end: { x: x + 2, y: l.y + 2 }, thickness: 1.2, color: LIME })
  }
  l.gap(4)
}

function header(l: Layout, doc: ReportPdfDoc, logo: Awaited<ReturnType<PDFDocument['embedPng']>> | null) {
  const band = 70
  l.page.drawRectangle({ x: 0, y: PAGE_H - band, width: PAGE_W, height: band, color: BAND })
  if (logo) {
    const h = 28
    const w = (logo.width / logo.height) * h
    l.page.drawImage(logo, { x: LEFT, y: PAGE_H - band / 2 - h / 2, width: w, height: h })
  } else {
    l.at('Ascend Now', LEFT, PAGE_H - band / 2 - 5, { size: 15, font: l.f.bold, color: WHITE })
  }
  const kicker = 'SESSION REPORT'
  l.at(kicker, PAGE_W - RIGHT - l.width(kicker, 8.5, l.f.bold), PAGE_H - band / 2 + 4, {
    size: 8.5,
    font: l.f.bold,
    color: LIME,
  })
  l.at(doc.status, PAGE_W - RIGHT - l.width(doc.status, 9), PAGE_H - band / 2 - 10, { size: 9, color: WHITE })
  l.y = PAGE_H - band - 26

  l.text(doc.title, { size: 18, font: l.f.bold, leading: 1.25 })
  l.gap(2)
  l.text(doc.subtitle, { size: 10, color: INK_2 })
  l.gap(10)

  // Who, in two columns of label and value.
  const col = WIDTH / 2
  for (let i = 0; i < doc.people.length; i += 2) {
    const pair = doc.people.slice(i, i + 2)
    l.room(16)
    const baseline = l.y - 12
    pair.forEach((p, k) => {
      const x = LEFT + k * col
      l.at(p.label.toUpperCase(), x, baseline, { size: 7, font: l.f.bold, color: MUTED })
      const room = col - 62
      const value = l.lines(p.value, { size: 9.5, width: room })[0] ?? ''
      l.at(value, x + 58, baseline, { size: 9.5 })
    })
    l.gap(15)
  }
}

function stats(l: Layout, doc: ReportPdfDoc) {
  const gap = 10
  const w = (WIDTH - gap * (doc.stats.length - 1)) / doc.stats.length
  const h = 56
  l.gap(12)
  l.room(h)
  const top = l.y
  doc.stats.forEach((s, i) => {
    const x = LEFT + i * (w + gap)
    l.page.drawRectangle({ x, y: top - h, width: w, height: h, color: WASH, borderColor: BORDER, borderWidth: 0.6 })
    l.at(s.value, x + 10, top - 22, { size: 15, font: l.f.bold })
    l.at(s.label, x + 10, top - 36, { size: 8.5, color: INK_2 })
    if (s.note) l.at(s.note, x + 10, top - 48, { size: 7.5, color: MUTED })
  })
  l.y = top - h
}

function notice(l: Layout, text: string) {
  const lines = l.lines(text, { size: 9, width: WIDTH - 20 })
  const h = lines.length * 9 * 1.4 + 12
  l.gap(12)
  l.room(h)
  l.page.drawRectangle({ x: LEFT, y: l.y - h, width: WIDTH, height: h, color: hex('#EBF6FD'), borderColor: SKY, borderWidth: 0.6 })
  l.gap(6)
  l.text(text, { size: 9, x: LEFT + 10, width: WIDTH - 20, color: INK })
  l.gap(6)
}

function domains(l: Layout, doc: ReportPdfDoc) {
  l.heading(doc.domains.some((d) => d.evidence) ? 'Each domain: the form, and what the recording shows' : 'Each domain: the form')
  doc.domains.forEach((d, i) => {
    if (i > 0) {
      l.gap(8)
      l.rule(WASH, 0.6)
      l.gap(4)
    }
    l.room(70)
    const titleTop = l.y
    l.text(d.label, { size: 11.5, font: l.f.bold, width: WIDTH - 130 })
    l.at(d.measured, PAGE_W - RIGHT - l.width(d.measured, 9, l.f.bold), l.baseline(titleTop, 11.5), {
      size: 9,
      font: l.f.bold,
      color: d.measured.startsWith('Not tested') ? MUTED : INK_2,
    })
    l.text(d.skillFocus, { size: 8, color: MUTED })
    if (d.marked) l.text(d.marked, { size: 9, font: l.f.italic, color: INK_2 })
    l.gap(3)

    l.label('Strengths observed')
    l.text(d.strengths || '—', { size: 9.5, color: d.strengths ? INK : MUTED })
    l.gap(2)
    l.label('Gaps observed')
    l.text(d.gaps || '—', { size: 9.5, color: d.gaps ? INK : MUTED })
    l.gap(2)
    l.label('Next steps / Targets')
    for (const t of d.targets) l.text(`•  ${t}`, { size: 9.5, x: LEFT + 4, width: WIDTH - 4 })
    if (d.targetsNote) l.text(d.targetsNote, { size: 7.5, color: MUTED })

    if (d.evidence) {
      l.gap(2)
      l.label('What the recording shows')
      if (d.evidence.length === 0) {
        l.text('Nothing in the recording speaks to this domain.', { size: 9, color: MUTED })
      } else {
        for (const e of d.evidence) claimBlock(l, e)
      }
    }
  })
}

function summary(l: Layout, doc: ReportPdfDoc) {
  l.heading('Overall diagnostic summary')
  const labelW = 150
  const valueW = WIDTH - labelW
  for (const row of doc.summary) {
    // Two columns side by side, so the row is measured first and kept on one
    // page: a cursor that went back up for the second column after the first
    // had crossed a page would land on the wrong page's coordinates.
    const label = l.lines(row.label, { size: 9, font: l.f.bold, width: labelW - 10 })
    const value = l.lines(row.value, { size: 10, font: l.f.bold, width: valueW })
    const notes = row.notes.flatMap((n) => l.lines(n, { size: 8.5, width: valueW }))
    const h = Math.max(label.length * 9 * 1.4, value.length * 10 * 1.4 + notes.length * 8.5 * 1.4)
    l.room(h)
    const top = l.y
    label.forEach((line, i) =>
      l.at(line, LEFT, l.baseline(top - i * 9 * 1.4, 9), { size: 9, font: l.f.bold, color: INK_2 }),
    )
    let y = top
    for (const line of value) {
      l.at(line, LEFT + labelW, l.baseline(y, 10), { size: 10, font: l.f.bold })
      y -= 10 * 1.4
    }
    for (const line of notes) {
      l.at(line, LEFT + labelW, l.baseline(y, 8.5), { size: 8.5, color: MUTED })
      y -= 8.5 * 1.4
    }
    l.y = top - h
    l.gap(6)
  }
  if (doc.summaryNote) {
    l.gap(2)
    l.text(doc.summaryNote, { size: 9.5 })
  }
}

function bands(l: Layout, title: string, rows: ReportPdfDoc['skills']) {
  if (rows.length === 0) return
  l.heading(title)
  for (const b of rows) {
    l.room(22)
    const top = l.y
    l.text(b.label, { size: 9, width: WIDTH - 50 })
    l.at(b.score, PAGE_W - RIGHT - l.width(b.score, 9, l.f.bold), l.baseline(top, 9), { size: 9, font: l.f.bold })
    const y = l.y - 4
    l.page.drawRectangle({ x: LEFT, y, width: WIDTH, height: 3.5, color: WASH })
    const fill = b.share >= 0.8 ? OK : b.share >= 0.5 ? SKY : BAD
    l.page.drawRectangle({ x: LEFT, y, width: Math.max(WIDTH * b.share, 4), height: 3.5, color: fill })
    l.gap(10)
  }
}

function misses(l: Layout, doc: ReportPdfDoc) {
  if (doc.misses.length === 0) return
  l.heading('Every miss, and why')
  for (const m of doc.misses) {
    l.room(40)
    l.text(m.head, { size: 9.5, font: l.f.bold })
    l.text(m.why, { size: 9.5, color: m.why.startsWith('No diagnosis') ? MUTED : INK })
    if (m.teacher) l.text(`Teacher: ${m.teacher}`, { size: 9, color: INK_2, x: LEFT + 10, width: WIDTH - 10 })
    if (m.student) l.text(`Student: ${m.student}`, { size: 9, color: INK_2, x: LEFT + 10, width: WIDTH - 10 })
    l.gap(6)
  }
}

function findings(l: Layout, doc: ReportPdfDoc) {
  if (!doc.findings) return
  l.heading('What was said about each question')
  l.text(doc.findings.intro, { size: 9, color: INK_2 })
  for (const q of doc.findings.questions) {
    l.gap(6)
    l.room(40)
    l.text(q.head, { size: 9.5, font: l.f.bold })
    if (q.teacherNote) l.text(`The teacher's note in the lesson: ${q.teacherNote}`, { size: 9, color: INK_2 })
    for (const c of q.claims) claimBlock(l, c)
  }
  if (doc.findings.questions.length === 0) {
    l.text(
      'Nothing in the recording could be quoted against a particular question. Either the lesson did not go through the paper question by question, or the recording is not lined up with it.',
      { size: 9, color: MUTED },
    )
  }
  if (doc.findings.unsaid) {
    l.gap(4)
    l.text(doc.findings.unsaid, { size: 8.5, color: MUTED })
  }
}

function questionTable(l: Layout, doc: ReportPdfDoc) {
  if (doc.questions.length === 0) return
  l.heading('Question by question')
  l.text(doc.levelNote, { size: 9, color: INK_2 })
  l.gap(6)

  const columns = [
    { key: 'sequence', title: '#', w: 22 },
    { key: 'skill', title: 'Skill', w: 0 },
    ...(doc.showLevel ? [{ key: 'level', title: 'Level', w: 50 }] : []),
    { key: 'answer', title: 'Answer', w: 64 },
    { key: 'time', title: 'Time', w: 44 },
    { key: 'pace', title: 'Pace', w: 66 },
    { key: 'diagnosis', title: 'Diagnosis', w: 88 },
  ] as const
  const fixed = columns.reduce((n, c) => n + c.w, 0)
  const widths = columns.map((c) => (c.w === 0 ? WIDTH - fixed : c.w))
  const pad = 4
  const size = 8.5
  const lead = size * 1.3

  const head = () => {
    l.room(18)
    const top = l.y
    l.page.drawRectangle({ x: LEFT, y: top - 16, width: WIDTH, height: 16, color: WASH })
    let x = LEFT
    columns.forEach((c, i) => {
      l.at(c.title.toUpperCase(), x + pad, top - 11, { size: 7, font: l.f.bold, color: INK_2 })
      x += widths[i]
    })
    l.y = top - 16
  }

  head()
  for (const q of doc.questions) {
    const cells = columns.map((c, i) =>
      l.lines(String(q[c.key as keyof typeof q]), { size, width: widths[i] - pad * 2 }),
    )
    const h = Math.max(...cells.map((c) => c.length)) * lead + pad * 2
    if (l.room(h)) head()
    const top = l.y
    let x = LEFT
    cells.forEach((cell, i) => {
      const key = columns[i].key
      const color = key === 'answer' ? (q.correct ? OK : BAD) : key === 'pace' || key === 'diagnosis' ? INK_2 : INK
      cell.forEach((line, k) => {
        l.at(line, x + pad, top - pad - (k + 1) * lead + lead * 0.25, {
          size,
          color,
          font: key === 'answer' ? l.f.bold : l.f.regular,
        })
      })
      x += widths[i]
    })
    l.y = top - h
    l.rule(WASH, 0.6)
  }
}

/**
 * The report as PDF bytes. `logo` is the brand mark for the navy band — the
 * version drawn for a dark background — and the band carries the name in
 * type when there is none.
 */
export async function reportPdf(doc: ReportPdfDoc, logo: Uint8Array | null = null): Promise<Uint8Array> {
  const pdf = await PDFDocument.create()
  pdf.setTitle(doc.title)
  pdf.setSubject(doc.subtitle)
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
      // A logo that will not decode costs the band its picture, not the report.
      image = null
    }
  }

  const l = new Layout(pdf, fonts)
  header(l, doc, image)

  if (doc.empty) {
    l.gap(16)
    l.text('Nothing to report yet. The report fills in as the student answers.', { size: 11, color: INK_2 })
  } else {
    stats(l, doc)
    if (doc.recordingNote) notice(l, doc.recordingNote)
    domains(l, doc)

    if (doc.reflection) {
      l.heading('The teacher’s comments on the session')
      l.text(doc.reflection, { size: 10 })
    }

    if (doc.conflicts.length > 0) {
      l.heading('Worth a second look')
      l.text(
        'The recording sits awkwardly against what was written on the form here. One of the two needs correcting, and only the teacher can say which.',
        { size: 9, color: INK_2 },
      )
      for (const c of doc.conflicts) claimBlock(l, c)
    }

    summary(l, doc)

    if (doc.teacherRead) {
      l.heading('Teacher’s read')
      l.text(doc.teacherRead, { size: 10 })
    }

    bands(l, 'By skill', doc.skills)
    bands(l, 'By section', doc.sections)

    if (doc.diagnoses) {
      l.heading('Diagnoses')
      l.text(doc.diagnoses, { size: 9.5 })
    }
    if (doc.pace.length > 0) {
      l.heading('Pace')
      for (const p of doc.pace) l.text(p, { size: 9.5 })
    }

    misses(l, doc)
    findings(l, doc)
    questionTable(l, doc)
  }

  // The foot of every page, once the number of pages is known.
  l.pages.forEach((page, i) => {
    const right = `Page ${i + 1} of ${l.pages.length}`
    const room = WIDTH - fonts.regular.widthOfTextAtSize(right, 7.5) - 16
    const foot = wrapText(winAnsi(doc.footer), room, (s) => fonts.regular.widthOfTextAtSize(s, 7.5))[0] ?? ''
    page.drawLine({ start: { x: LEFT, y: 40 }, end: { x: PAGE_W - RIGHT, y: 40 }, thickness: 0.6, color: BORDER })
    page.drawText(foot, { x: LEFT, y: 28, size: 7.5, font: fonts.regular, color: FAINT })
    page.drawText(right, {
      x: PAGE_W - RIGHT - fonts.regular.widthOfTextAtSize(right, 7.5),
      y: 28,
      size: 7.5,
      font: fonts.regular,
      color: FAINT,
    })
  })

  return await pdf.save()
}
