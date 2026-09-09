import { parseTranscript } from './transcript'

/**
 * A Word document, written by hand.
 *
 * The teacher pastes an hour of Fathom transcript into the write-up page, and
 * the console said "Pasted in · 16964 characters" back at them — which is not
 * the transcript, and cannot be checked against anything. They want the thing
 * they pasted, in the format lesson records are kept in.
 *
 * A .docx is a zip of three small XML parts, and the only awkward piece is the
 * zip — so it is written here, stored rather than deflated, in about eighty
 * lines. That is cheaper than a megabyte of document library for one button,
 * and it leaves the output as plain bytes a test can assert on.
 */

// ------------------------------------------------------------------ zip --

const CRC_TABLE = (() => {
  const table = new Uint32Array(256)
  for (let n = 0; n < 256; n += 1) {
    let c = n
    for (let k = 0; k < 8; k += 1) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1
    table[n] = c >>> 0
  }
  return table
})()

function crc32(bytes: Uint8Array): number {
  let c = 0xffffffff
  for (const byte of bytes) c = CRC_TABLE[(c ^ byte) & 0xff] ^ (c >>> 8)
  return (c ^ 0xffffffff) >>> 0
}

export interface ZipEntry {
  name: string
  bytes: Uint8Array
}

/**
 * A store-only zip.
 *
 * No compression: a transcript is tens of kilobytes and the saving is not worth
 * carrying a deflate implementation. The timestamp is fixed rather than `now`,
 * so the same transcript always produces the same bytes and a test can say so.
 */
export function zip(entries: ZipEntry[]): Uint8Array {
  const encoder = new TextEncoder()
  const chunks: Uint8Array[] = []
  const central: Uint8Array[] = []
  let offset = 0

  for (const entry of entries) {
    const name = encoder.encode(entry.name)
    const crc = crc32(entry.bytes)

    const local = new Uint8Array(30 + name.length)
    const lv = new DataView(local.buffer)
    lv.setUint32(0, 0x04034b50, true)
    lv.setUint16(4, 20, true) // version needed
    lv.setUint16(6, 0, true) // flags
    lv.setUint16(8, 0, true) // stored, not deflated
    lv.setUint16(10, 0, true) // modified time
    lv.setUint16(12, 0x0021, true) // modified date: 1 Jan 1980, this format's zero
    lv.setUint32(14, crc, true)
    lv.setUint32(18, entry.bytes.length, true)
    lv.setUint32(22, entry.bytes.length, true)
    lv.setUint16(26, name.length, true)
    lv.setUint16(28, 0, true) // extra
    local.set(name, 30)

    const record = new Uint8Array(46 + name.length)
    const cv = new DataView(record.buffer)
    cv.setUint32(0, 0x02014b50, true)
    cv.setUint16(4, 20, true) // version made by
    cv.setUint16(6, 20, true) // version needed
    cv.setUint16(8, 0, true)
    cv.setUint16(10, 0, true)
    cv.setUint16(12, 0, true)
    cv.setUint16(14, 0x0021, true)
    cv.setUint32(16, crc, true)
    cv.setUint32(20, entry.bytes.length, true)
    cv.setUint32(24, entry.bytes.length, true)
    cv.setUint16(28, name.length, true)
    cv.setUint16(30, 0, true) // extra
    cv.setUint16(32, 0, true) // comment
    cv.setUint16(34, 0, true) // disk
    cv.setUint16(36, 0, true) // internal attributes
    cv.setUint32(38, 0, true) // external attributes
    cv.setUint32(42, offset, true)
    record.set(name, 46)

    chunks.push(local, entry.bytes)
    central.push(record)
    offset += local.length + entry.bytes.length
  }

  const centralSize = central.reduce((n, c) => n + c.length, 0)
  const end = new Uint8Array(22)
  const ev = new DataView(end.buffer)
  ev.setUint32(0, 0x06054b50, true)
  ev.setUint16(4, 0, true)
  ev.setUint16(6, 0, true)
  ev.setUint16(8, entries.length, true)
  ev.setUint16(10, entries.length, true)
  ev.setUint32(12, centralSize, true)
  ev.setUint32(16, offset, true)
  ev.setUint16(20, 0, true) // comment

  const all = [...chunks, ...central, end]
  const out = new Uint8Array(all.reduce((n, c) => n + c.length, 0))
  let at = 0
  for (const chunk of all) {
    out.set(chunk, at)
    at += chunk.length
  }
  return out
}

// ----------------------------------------------------------------- docx --

/** One paragraph of the document. */
export interface Paragraph {
  text: string
  /** Speaker headings are bold; what they said is not. */
  bold?: boolean
}

/**
 * XML escaping, and the control bytes Word will not open a file over.
 *
 * A Fathom export is machine-written text and arrives with the odd stray
 * control character in it. One of those inside document.xml makes the whole
 * document unreadable rather than that one line, so they go here.
 */
export function escapeXml(text: string): string {
  return text
    .replace(CONTROL, '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
}

/** Everything below space except tab, newline and carriage return. */
const CONTROL = new RegExp('[\\u0000-\\u0008\\u000B\\u000C\\u000E-\\u001F]', 'g')

const CONTENT_TYPES =
  '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' +
  '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">' +
  '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>' +
  '<Default Extension="xml" ContentType="application/xml"/>' +
  '<Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>' +
  '</Types>'

const RELS =
  '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' +
  '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">' +
  '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>' +
  '</Relationships>'

function paragraphXml(p: Paragraph): string {
  const properties = p.bold ? '<w:rPr><w:b/></w:rPr>' : ''
  // A blank paragraph carries the space between two turns, so it is written as
  // an empty run rather than skipped.
  return (
    '<w:p><w:r>' +
    properties +
    '<w:t xml:space="preserve">' +
    escapeXml(p.text) +
    '</w:t></w:r></w:p>'
  )
}

export function documentXml(paragraphs: Paragraph[]): string {
  return (
    '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' +
    '<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:body>' +
    paragraphs.map(paragraphXml).join('') +
    '<w:sectPr/></w:body></w:document>'
  )
}

/** The whole file, as bytes. */
export function buildDocx(paragraphs: Paragraph[]): Uint8Array {
  const encoder = new TextEncoder()
  return zip([
    { name: '[Content_Types].xml', bytes: encoder.encode(CONTENT_TYPES) },
    { name: '_rels/.rels', bytes: encoder.encode(RELS) },
    { name: 'word/document.xml', bytes: encoder.encode(documentXml(paragraphs)) },
  ])
}

// ----------------------------------------------------------- transcript --

function clock(seconds: number): string {
  const h = Math.floor(seconds / 3600)
  const m = Math.floor((seconds % 3600) / 60)
  const s = seconds % 60
  const mm = h > 0 ? String(m).padStart(2, '0') : String(m)
  return (h > 0 ? h + ':' : '') + mm + ':' + String(s).padStart(2, '0')
}

/**
 * The transcript as a document: a heading, then a turn at a time.
 *
 * Parsed rather than dumped, so the stamps and the speakers are headings and
 * the speech is body text — which is what makes it readable on a page, and the
 * only reason to hand it over as a document rather than a text file. A body
 * with no stamps in it is not a Fathom export; it is still the teacher's
 * transcript, so it goes in as its own lines.
 */
export function transcriptParagraphs(title: string, body: string): Paragraph[] {
  const transcript = parseTranscript(body)
  const out: Paragraph[] = [{ text: title, bold: true }, { text: '' }]

  if (transcript.lines.length === 0) {
    for (const line of body.split(/\r?\n/)) out.push({ text: line })
    return out
  }

  for (const line of transcript.lines) {
    out.push({ text: clock(line.at) + ' — ' + line.speaker, bold: true })
    out.push({ text: line.text })
    out.push({ text: '' })
  }
  return out
}

/** The transcript, as a .docx the browser will save. */
export function transcriptDocx(title: string, body: string): Blob {
  const bytes = buildDocx(transcriptParagraphs(title, body))
  // Copied into an ArrayBuffer of its own: a Uint8Array may be a view onto a
  // SharedArrayBuffer, which Blob does not take.
  const buffer = new ArrayBuffer(bytes.length)
  new Uint8Array(buffer).set(bytes)
  return new Blob([buffer], {
    type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  })
}
