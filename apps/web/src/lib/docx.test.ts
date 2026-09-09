import { execFileSync } from 'node:child_process'
import { mkdtempSync, writeFileSync } from 'node:fs'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { describe, expect, it } from 'vitest'
import { buildDocx, documentXml, escapeXml, transcriptParagraphs, zip } from './docx'

const FATHOM = `Impromptu Zoom Meeting - August 07

VIEW RECORDING - 61 mins (No highlights)

@2:24 - Malya Rastogi (rastogimalya26@gmail.com)
So we'll do it one by one, right?
I just want to understand your thought process.

@1:02:10 - Sara Rohit
That is the last thing I said.
`

describe('zip', () => {
  /**
   * The whole point of writing the zip by hand is that other software opens the
   * result, so the check is the system's own unzip rather than a re-read by the
   * code that wrote it — which would agree with itself whatever it did.
   */
  it('writes an archive the system can open', () => {
    const dir = mkdtempSync(join(tmpdir(), 'docx-'))
    const file = join(dir, 'out.zip')
    writeFileSync(file, zip([{ name: 'hello.txt', bytes: new TextEncoder().encode('hi there') }]))

    expect(execFileSync('unzip', ['-p', file, 'hello.txt']).toString()).toBe('hi there')
  })
})

describe('buildDocx', () => {
  it('is a Word file with the three parts Word requires', () => {
    const dir = mkdtempSync(join(tmpdir(), 'docx-'))
    const file = join(dir, 'out.docx')
    writeFileSync(file, buildDocx([{ text: 'A heading', bold: true }, { text: 'Some words.' }]))

    const listed = execFileSync('unzip', ['-Z1', file]).toString()
    expect(listed).toContain('[Content_Types].xml')
    expect(listed).toContain('_rels/.rels')
    expect(listed).toContain('word/document.xml')

    const document = execFileSync('unzip', ['-p', file, 'word/document.xml']).toString()
    expect(document).toContain('<w:t xml:space="preserve">Some words.</w:t>')
    expect(document).toContain('<w:rPr><w:b/></w:rPr>')
  })

  it('carries the same bytes every time, so nothing downstream sees a diff', () => {
    expect(Buffer.from(buildDocx([{ text: 'x' }]))).toEqual(Buffer.from(buildDocx([{ text: 'x' }])))
  })
})

describe('escapeXml', () => {
  it('escapes what would close a tag', () => {
    expect(escapeXml('a < b & c > d')).toBe('a &lt; b &amp; c &gt; d')
  })

  /**
   * A stray control byte in a Fathom export makes Word refuse the whole
   * document rather than that one line, so it never reaches the file.
   */
  it('drops the control bytes Word will not open a file over', () => {
    expect(escapeXml('before' + String.fromCharCode(7) + 'after')).toBe('beforeafter')
    expect(escapeXml('kept\tand\nkept')).toBe('kept\tand\nkept')
  })
})

describe('transcriptParagraphs', () => {
  const paragraphs = transcriptParagraphs('Lesson transcript', FATHOM)

  it('leads with the title', () => {
    expect(paragraphs[0]).toEqual({ text: 'Lesson transcript', bold: true })
  })

  it('gives each turn a stamped heading and its own words', () => {
    expect(paragraphs[2]).toEqual({ text: '2:24 — Malya Rastogi', bold: true })
    expect(paragraphs[3].text).toBe(
      "So we'll do it one by one, right? I just want to understand your thought process.",
    )
  })

  it('writes an hour-long stamp as hours', () => {
    expect(paragraphs.some((p) => p.text === '1:02:10 — Sara Rohit')).toBe(true)
  })

  /** A paste that is not a Fathom export is still the teacher's transcript. */
  it('keeps a body with no stamps in it, line by line', () => {
    const plain = transcriptParagraphs('T', 'first line\nsecond line')
    expect(plain.map((p) => p.text)).toEqual(['T', '', 'first line', 'second line'])
  })
})

describe('documentXml', () => {
  it('keeps a blank paragraph, which is the space between two turns', () => {
    expect(documentXml([{ text: '' }])).toContain('<w:t xml:space="preserve"></w:t>')
  })
})
