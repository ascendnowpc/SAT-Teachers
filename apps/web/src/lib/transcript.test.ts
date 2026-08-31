import { describe, expect, it } from 'vitest'
import { linesIn, parseTranscript, windowsFor } from './transcript'

const FATHOM = `Impromptu Zoom Meeting - August 07

VIEW RECORDING - 61 mins (No highlights)


@1:33 - Malya Rastogi (rastogimalya26@gmail.com)
I hope you're doing well.

@1:39 - Miriam Hanna
Hello. Hi, Malya.
SCREEN SHARING: Malya started screen sharing - WATCH

@2:24 - Malya Rastogi (rastogimalya26@gmail.com)
So we'll do it one by one, right?
I just want to understand your thought process.

@1:02:10 - Sara Rohit
That is the last thing I said.
`

describe('parseTranscript', () => {
  const t = parseTranscript(FATHOM)

  it('reads every spoken turn and drops the header', () => {
    expect(t.lines).toHaveLength(4)
    expect(t.lines[0].text).toBe("I hope you're doing well.")
  })

  it('strips the email Fathom appends to a name', () => {
    expect(t.lines[0].speaker).toBe('Malya Rastogi')
  })

  it('joins a turn that runs over several lines', () => {
    expect(t.lines[2].text).toBe(
      "So we'll do it one by one, right? I just want to understand your thought process.",
    )
  })

  it('drops Fathom’s own banners, which are not speech', () => {
    expect(t.lines.some((l) => l.text.includes('SCREEN SHARING'))).toBe(false)
  })

  it('reads m:ss and h:mm:ss stamps as seconds from the start', () => {
    expect(t.lines[0].at).toBe(93)
    expect(t.lines[3].at).toBe(3730)
  })

  it('lists who spoke, once each', () => {
    expect(t.speakers).toEqual(['Malya Rastogi', 'Miriam Hanna', 'Sara Rohit'])
  })

  it('takes the duration from the last stamp', () => {
    expect(t.duration).toBe(3730)
  })

  it('has nothing to say about an empty or headers-only file', () => {
    expect(parseTranscript('').lines).toEqual([])
    expect(parseTranscript('VIEW RECORDING - 61 mins\n\n').lines).toEqual([])
  })

  it('ignores a stamp with no speech under it', () => {
    expect(parseTranscript('@1:00 - Someone\n\n@2:00 - Someone\nreal words').lines).toHaveLength(1)
  })
})

describe('windowsFor', () => {
  const at = (m: number) => new Date(Date.UTC(2026, 0, 1, 12, m, 0)).toISOString()

  it('runs each window from one question to the next', () => {
    const w = windowsFor(
      [
        { id: 'a', startedAt: at(0) },
        { id: 'b', startedAt: at(2) },
        { id: 'c', startedAt: at(5) },
      ],
      600,
      150,
    )
    expect(w.get('a')).toEqual({ from: 150, to: 270 })
    expect(w.get('b')).toEqual({ from: 270, to: 450 })
  })

  it('runs the last question to the end of the recording', () => {
    const w = windowsFor([{ id: 'a', startedAt: at(0) }], 600, 150)
    expect(w.get('a')).toEqual({ from: 150, to: 601 })
  })

  it('measures from the first question, not from either clock', () => {
    // The recording starts before the lesson; only the gaps between questions
    // should survive, shifted by the offset.
    const w = windowsFor(
      [
        { id: 'a', startedAt: at(30) },
        { id: 'b', startedAt: at(31) },
      ],
      600,
      0,
    )
    expect(w.get('a')?.from).toBe(0)
    expect(w.get('b')?.from).toBe(60)
  })

  it('orders by time rather than by the order it was handed', () => {
    const w = windowsFor(
      [
        { id: 'late', startedAt: at(5) },
        { id: 'early', startedAt: at(1) },
      ],
      600,
      0,
    )
    expect(w.get('early')?.from).toBe(0)
    expect(w.get('late')?.from).toBe(240)
  })

  it('skips questions that were never put on screen', () => {
    const w = windowsFor([{ id: 'a', startedAt: null }], 600, 0)
    expect(w.size).toBe(0)
  })
})

describe('linesIn', () => {
  const t = parseTranscript(FATHOM)

  it('takes the turns inside the window', () => {
    expect(linesIn(t, { from: 90, to: 120 }).map((l) => l.at)).toEqual([93, 99])
  })

  it('excludes the closing bound so two questions never claim one turn', () => {
    expect(linesIn(t, { from: 93, to: 99 }).map((l) => l.at)).toEqual([93])
    expect(linesIn(t, { from: 99, to: 200 }).map((l) => l.at)).toEqual([99, 144])
  })

  it('returns nothing for a window with no speech in it', () => {
    expect(linesIn(t, { from: 200, to: 300 })).toEqual([])
  })
})
