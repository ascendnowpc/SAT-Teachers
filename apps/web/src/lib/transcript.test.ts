import { describe, expect, it } from 'vitest'
import {
  linesIn,
  mentionsIn,
  parseTranscript,
  reviewCues,
  reviewWindows,
  windowsFor,
} from './transcript'

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

/**
 * The 17 July lesson, cut down to its shape.
 *
 * A silent paper from 8:12 to 41:29, then the teacher walking the answers by
 * number to the end of the call. Every line below is from that recording; what
 * has been removed is the middle of each turn, not the numbers in it — the
 * numbers are the thing under test.
 */
const REVIEW_LESSON = `Impromptu Zoom Meeting - July 17
VIEW RECORDING - 61 mins (No highlights)

@4:26 - Malya Rastogi
Okay. So the first session is going to be a diagnostic session actually.

@6:22 - Malya Rastogi
One minute, okay? The Zoom one is almost done.

@8:12 - Malya Rastogi
Okay, so 48, 48, 68. Basically by 2.10, we need to make sure you're done, right? Starting in 3, 2, and 1.

@18:40 - Malya Rastogi
Let's start 21 minutes. Sixteen minutes are there.

@35:51 - Malya Rastogi
Four and a half minutes. 30 seconds are left.

@44:17 - josh
Blandine Coral and her colleagues analyzed poetry fragments from 35 sites across the Volga.

@49:00 - Malya Rastogi
Let start with the first question. First one. Very good. It's absolutely right.

@49:36 - Malya Rastogi
Makes sense. Second one. What did you mark? Second is wrong. Can we retry it, please?

@51:01 - Malya Rastogi
Correct. Third one, please. Third is correct. Very good. Fourth one. Fourth is incorrect.

@54:00 - josh
perfect thanks fifth one what did you mark okay sixth one uh i skipped these ones the seventh which is okay

@57:00 - Malya Rastogi
eighth did you do oh eight uh which is correct very good next one good job

@58:29 - Malya Rastogi
12th one, please. Would you have 13?

@58:42 - Malya Rastogi
Okay, this is 17, right? 18 is also right, 19 is wrong, okay 20th please.

@1:00:19 - Malya Rastogi
All right, we'll take it forward from here.`

describe('mentionsIn', () => {
  it('reads a question named by an ordinal, by a digit, or by both', () => {
    expect(mentionsIn('Third one, please. Fourth one.')).toEqual([
      { sequence: 3, anchored: true },
      { sequence: 4, anchored: true },
    ])
    expect(mentionsIn('question 4 and number 7')).toEqual([
      { sequence: 4, anchored: true },
      { sequence: 7, anchored: true },
    ])
    expect(mentionsIn('12th one, please.')).toEqual([{ sequence: 12, anchored: true }])
  })

  it('reads a bare number, but never as the thing that opens a review', () => {
    expect(mentionsIn('18 is also right')).toEqual([{ sequence: 18, anchored: false }])
  })

  /**
   * "One second" is the trap: `second` is both the second ordinal and a unit of
   * time, and a lesson is full of the second sense. What follows the word is
   * what settles it.
   */
  it('does not read a unit of time as a question number', () => {
    expect(mentionsIn('One second, I gotta send it')).toEqual([])
    expect(mentionsIn("Let's start 21 minutes.")).toEqual([])
    expect(mentionsIn('30 seconds are left')).toEqual([])
    expect(mentionsIn('35 sites across the Volga')).toEqual([])
  })

  it('reads a count of questions as a count, and a named one as a question', () => {
    expect(mentionsIn('I think five, six questions, right?')).toEqual([])
    expect(mentionsIn('the seventh question, please')).toEqual([{ sequence: 7, anchored: true }])
  })

  it('does not read either half of a clock time or a decimal', () => {
    expect(mentionsIn('by 2.10, we need to make sure')).toEqual([])
    expect(mentionsIn("It's 1.38.")).toEqual([])
  })
})

describe('reviewCues', () => {
  const t = parseTranscript(REVIEW_LESSON)

  it('finds the pass where the teacher walks the paper by number', () => {
    expect(reviewCues(t).map((c) => c.sequence)).toEqual([1, 2, 3, 4, 5, 6, 7, 8, 12, 13, 17, 18, 19, 20])
  })

  /**
   * "the first session is going to be a diagnostic session" at 4:26 is the same
   * word as the review's "First one" at 49:00, and forty-five minutes of silence
   * is the only thing that tells them apart.
   */
  it('does not open the review on a number said three quarters of an hour earlier', () => {
    expect(reviewCues(t)[0].at).toBe(49 * 60)
  })

  /** Nothing walks a paper from question 2 to question 22. */
  it('will not join two numbers that are half a paper apart', () => {
    const jumpy = parseTranscript(
      `@53:55 - Malya Rastogi\nAnd then the second task happened, so there is a chronology.\n` +
        `@54:48 - Malya Rastogi\n22, please.\n` +
        `@58:49 - Sara Rohit\nOkay, 23.`,
    )
    expect(reviewCues(jumpy)).toEqual([])
  })

  it('has nothing to say about a lesson worked question by question', () => {
    const worked = parseTranscript(
      `@1:00 - Malya Rastogi\nSo what do you think is happening here?\n` +
        `@2:00 - Sara Rohit\nI think it can't be B because that's a fact.\n` +
        `@3:00 - Malya Rastogi\nVery good. Absolutely right.`,
    )
    expect(reviewCues(worked)).toEqual([])
  })
})

describe('reviewWindows', () => {
  const t = parseTranscript(REVIEW_LESSON)

  it('runs each question from where it was named to where the next one was', () => {
    const windows = reviewWindows(t, 20)
    expect(windows.get(1)).toEqual({ from: 49 * 60, to: 49 * 60 + 36 })
    expect(windows.get(2)).toEqual({ from: 49 * 60 + 36, to: 51 * 60 + 1 })
  })

  /**
   * "Third one, please. Third is correct. Very good. Fourth one." is one turn
   * and one timestamp. Both questions get it: that is the truth about the
   * recording, and every claim still has to quote the part it rests on.
   */
  it('gives two questions named in one turn the same stretch of it', () => {
    const windows = reviewWindows(t, 20)
    expect(windows.get(3)).toEqual(windows.get(4))
  })

  /**
   * A 27-question paper against a 15-question session names numbers the session
   * does not have. They are dropped — not folded onto the last question, which
   * is what made one report say fifteen questions were discussed as one.
   */
  /**
   * The 7 August lesson has no review pass — it is worked question by question.
   * What it does have is a teacher numbering questions as she reaches them
   * ("19th one please", "22, please") and a student asking how many she got
   * wrong out of 23. Read as a review, those three handed the closing summary
   * to question 23, fifty minutes from where question 23 actually was.
   */
  it('does not read a lesson that merely counts its questions as a review', () => {
    const worked = parseTranscript(
      `@50:00 - Malya Rastogi\n19th one please, take your time.\n` +
        `@54:48 - Malya Rastogi\n22, please.\n` +
        `@58:42 - Sara Rohit\nSo how many did I get wrong out of 23?`,
    )
    expect(reviewWindows(worked, 23).size).toBe(0)
  })

  it('drops a number the session does not have a question for', () => {
    const windows = reviewWindows(t, 15)
    expect(windows.has(13)).toBe(true)
    expect(windows.has(17)).toBe(false)
    // …and question 13 still stops where question 17 was named, rather than
    // running to the end of the call.
    expect(windows.get(13)?.to).toBe(58 * 60 + 42)
  })
})
