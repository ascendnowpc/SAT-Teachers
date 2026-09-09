/**
 * Fathom transcript parsing and alignment.
 *
 * A Fathom export is a header, then blocks of the shape
 *
 *   @12:34 - Malya Rastogi (rastogimalya26@gmail.com)
 *   what the person said, over one or more lines
 *
 * The timestamps are what make it useful: they are minutes into the recording,
 * and the session's own rows know when each question was on screen. Line those
 * two up and every question gets the part of the conversation that was about
 * it, without anyone tagging anything.
 */

export interface TranscriptLine {
  /** Seconds from the start of the recording. */
  at: number
  speaker: string
  text: string
}

export interface Transcript {
  lines: TranscriptLine[]
  speakers: string[]
  /** Seconds covered, from the first stamp to the last. */
  duration: number
}

const STAMP = /^@(\d{1,2}):(\d{2})(?::(\d{2}))?\s*-\s*(.+?)\s*$/

/** Drops the email Fathom appends, which is an address and not a name. */
function cleanSpeaker(raw: string): string {
  return raw.replace(/\s*\([^)]*@[^)]*\)\s*$/, '').trim()
}

export function parseTranscript(body: string): Transcript {
  const lines: TranscriptLine[] = []
  let current: TranscriptLine | null = null

  for (const raw of body.split(/\r?\n/)) {
    const line = raw.trim()
    const m = STAMP.exec(line)

    if (m) {
      if (current && current.text) lines.push(current)
      // Fathom writes h:mm:ss once a call passes an hour, m:ss before that.
      const [, a, b, c, speaker] = m
      const at = c
        ? Number(a) * 3600 + Number(b) * 60 + Number(c)
        : Number(a) * 60 + Number(b)
      current = { at, speaker: cleanSpeaker(speaker), text: '' }
      continue
    }

    if (!current) continue // header and banner lines before the first stamp
    if (!line) continue
    // Fathom drops its own markers into the body; they are not speech.
    if (/^(SCREEN SHARING|VIEW RECORDING)/i.test(line)) continue
    current.text = current.text ? `${current.text} ${line}` : line
  }

  if (current && current.text) lines.push(current)

  const speakers = [...new Set(lines.map((l) => l.speaker))]
  const duration = lines.length === 0 ? 0 : lines[lines.length - 1].at

  return { lines, speakers, duration }
}

export interface AlignWindow {
  /** Seconds from the start of the recording. */
  from: number
  to: number
}

/**
 * The lines spoken inside a window. `to` is exclusive so consecutive questions
 * never both claim the same line.
 */
export function linesIn(transcript: Transcript, window: AlignWindow): TranscriptLine[] {
  return transcript.lines.filter((l) => l.at >= window.from && l.at < window.to)
}

/**
 * Turns question timings into recording windows.
 *
 * The recording and the session start at different moments — the teacher hits
 * record, then some minutes of hello happen before the first question — so
 * everything is measured relative to the first question rather than to either
 * clock. A question's window runs from when it went on screen to when the next
 * one did, which is what carries the discussion of it.
 */
export function windowsFor(
  items: { id: string; startedAt: string | null }[],
  duration: number,
  offset: number,
): Map<string, AlignWindow> {
  const timed = items
    .filter((i): i is { id: string; startedAt: string } => Boolean(i.startedAt))
    .map((i) => ({ id: i.id, t: new Date(i.startedAt).getTime() }))
    .sort((a, b) => a.t - b.t)

  const out = new Map<string, AlignWindow>()
  if (timed.length === 0) return out

  const first = timed[0].t
  for (let i = 0; i < timed.length; i += 1) {
    const from = offset + Math.round((timed[i].t - first) / 1000)
    const to = i + 1 < timed.length ? offset + Math.round((timed[i + 1].t - first) / 1000) : duration + 1
    out.set(timed[i].id, { from, to })
  }
  return out
}

/**
 * Where the first question sits in the recording, in seconds.
 *
 * Fathom starts recording before the lesson does. Without this the whole
 * alignment is shifted by however long the greeting ran, and every quote comes
 * from the question before. The heuristic: the first substantial turn after the
 * screen-share banner is where the test starts.
 */
export const DEFAULT_OFFSET_SECONDS = 150

// -------------------------------------------------------- the review pass --

/**
 * The other shape of lesson.
 *
 * Half these lessons are not worked question by question. The student takes the
 * paper in silence and the teacher then walks it — "First one. Very good.
 * Second one. What did you mark? Third one, please." — for twenty minutes at
 * the end. Windows cut from `first_viewed_at` cover the silence and nothing
 * else, and because the last question's window runs to the end of the recording
 * the entire review lands on it. That is exactly how a report came back saying
 * one question of fifteen was discussed when every one of them had been.
 *
 * So the review is cut from the teacher's own numbering instead of the clock.
 * It stays arithmetic — a regular expression over the turns, not a model asked
 * where question four is — and everything it finds is marked `fromReview` in
 * ./extraction.ts, so the reach is on the page rather than hidden.
 */

/** Ordinal words a teacher counts a paper with, in order from one. */
const ORDINALS = [
  'first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth',
  'ninth', 'tenth', 'eleventh', 'twelfth', 'thirteenth', 'fourteenth', 'fifteenth',
  'sixteenth', 'seventeenth', 'eighteenth', 'nineteenth', 'twentieth',
]

/**
 * Words that turn a number into something other than a question.
 *
 * "Let's start 21 minutes", "35 sites", "by 2.10" — a recording is full of
 * numbers, and a review that opened on one of them would file the whole lesson
 * under the wrong question.
 */
const A_UNIT =
  /^\s*(minutes?|seconds?|hours?|mins?|secs?|sites?|points?|percent|%|of|out|o'?clock|am|pm|years?|times?)\b/i

/**
 * "How many more questions are pending?" is not question five.
 *
 * Only applied to a bare number: "the seventh question" and "question 4" are
 * exactly what a cue looks like, and the word is what makes them one.
 */
const COUNTED_QUESTIONS = /^\s*questions?\b/i

/** Nothing on a paper is question 61, so a bigger number is something else. */
const MAX_MENTION = 60

/**
 * How long a review may pause before it has stopped being one review.
 *
 * Between "First one" and "Second one" on the recordings we have there are
 * seconds; between the greeting's "the first session" and the review's "Second
 * one" there are forty-five minutes. That gap is the whole difference, and it
 * is why the same word in the introduction does not open a review.
 */
export const REVIEW_GAP_SECONDS = 300

/**
 * Two numbers in a row is a coincidence; eight is a teacher going down a list.
 */
export const MIN_REVIEW_CUES = 3

/** A moment where someone names a question by its number. */
export interface ReviewCue {
  /** The number said — the number on the paper, which is the report's own. */
  sequence: number
  /** Seconds into the recording: the stamp of the turn it was said in. */
  at: number
}

const ORDINAL = ORDINALS.join('|')

const MENTION = new RegExp(
  String.raw`\b(?:(?:question|number|q)\s*\#?\s*(\d{1,2})\b` + // question 4, Q4, number 7
    String.raw`|(\d{1,2})\s*(?:st|nd|rd|th)\b` + // 12th, 21st
    String.raw`|(?:question|number|the)\s+(${ORDINAL})\b` + // the seventh
    String.raw`|(${ORDINAL})\s+(?:one|question)\b` + // Third one
    String.raw`|(${ORDINAL})\b` + // eighth
    String.raw`|(\d{1,2})\b)`, // a bare 18
  'gi',
)

/**
 * Every question number named in one turn, in the order they are said.
 *
 * `anchored` is the difference between a number that announces a question and a
 * number that is merely a number. "Third one", "question 4" and "12th" announce
 * one; a bare "18" only does so once a review is already running, which is what
 * stops a number in the greeting from starting one.
 */
export function mentionsIn(text: string): { sequence: number; anchored: boolean }[] {
  const out: { sequence: number; anchored: boolean }[] = []

  for (const m of text.matchAll(MENTION)) {
    const [whole, qn, ordinalDigit, afterWord, beforeOne, bareWord, bare] = m
    const at = m.index ?? 0
    const rest = text.slice(at + whole.length)

    const word = afterWord ?? beforeOne ?? bareWord
    const sequence = word
      ? ORDINALS.indexOf(word.toLowerCase()) + 1
      : Number(qn ?? ordinalDigit ?? bare)
    if (!Number.isFinite(sequence) || sequence < 1 || sequence > MAX_MENTION) continue

    // "30 seconds", "21 minutes": the word that follows settles it.
    if (A_UNIT.test(rest)) continue
    // "I missed 5 questions" is a count, not a cue — but only a bare number can
    // be one, because "the seventh question" is precisely a cue.
    if (bare && COUNTED_QUESTIONS.test(rest)) continue
    // "One second, I gotta send it" is the one ordinal that is also an ordinary
    // noun, and on a call it is nearly always the noun. So it only counts when
    // something anchors it — "Second one", "the second", "question 2".
    if (bareWord?.toLowerCase() === 'second') continue
    // A decimal or a clock time — "1.38", "2:15" — is not a question number,
    // and neither half of one is: "2.10" is not question 2 and not question 10.
    if (/^[.:]\d/.test(rest)) continue
    if (/[.:]$/.test(text.slice(0, at)) && /^\d/.test(whole)) continue

    out.push({ sequence, anchored: Boolean(qn || ordinalDigit || afterWord || beforeOne) })
  }
  return out
}

/**
 * The longest run of question numbers a recording counts up through.
 *
 * A review walks the paper forwards, so the run is strictly increasing, and it
 * has to stay in one stretch of the recording — a cue more than
 * {@link REVIEW_GAP_SECONDS} after the one before it starts a new run rather
 * than extending the old one. The run has to open on an anchored cue and be at
 * least {@link MIN_REVIEW_CUES} long.
 */
export function reviewCues(transcript: Transcript): ReviewCue[] {
  const candidates: (ReviewCue & { anchored: boolean })[] = []
  for (const line of transcript.lines) {
    for (const m of mentionsIn(line.text)) {
      candidates.push({ sequence: m.sequence, at: line.at, anchored: m.anchored })
    }
  }

  let best: ReviewCue[] = []
  for (let start = 0; start < candidates.length; start += 1) {
    if (!candidates[start].anchored) continue
    const run: ReviewCue[] = [{ sequence: candidates[start].sequence, at: candidates[start].at }]
    for (let i = start + 1; i < candidates.length; i += 1) {
      const c = candidates[i]
      const last = run[run.length - 1]
      if (c.at - last.at > REVIEW_GAP_SECONDS) break
      // Strictly forward: a teacher re-reading "17, 17, 18" says the same
      // number twice and the second one is not a new question.
      if (c.sequence <= last.sequence) continue
      run.push({ sequence: c.sequence, at: c.at })
    }
    // Ties go to the later run: an introduction that happens to count to three
    // should lose to the review that counts to twelve, and where they are the
    // same length the one nearer the discussion is the review.
    if (run.length >= best.length) best = run
  }

  return best.length >= MIN_REVIEW_CUES ? best : []
}

/**
 * Where in the recording each question was gone over, by its number.
 *
 * A cue opens a window that runs to the next cue said in a *later* turn: a
 * teacher who says "Third one, please. Third is correct. Fourth one." in a
 * single breath leaves Fathom one turn and one timestamp, and the honest answer
 * is that both questions share it. Overlap is the truth here, and every claim
 * still carries the words it came from.
 *
 * `count` is how many questions the session has. A recording of a 27-question
 * paper attached to a 15-question session names numbers this session does not
 * have, and those are dropped rather than folded onto the last question.
 */
export function reviewWindows(transcript: Transcript, count: number): Map<number, AlignWindow> {
  const cues = reviewCues(transcript)
  const out = new Map<number, AlignWindow>()

  for (let i = 0; i < cues.length; i += 1) {
    const cue = cues[i]
    const next = cues.slice(i + 1).find((c) => c.at > cue.at)
    const to = next ? next.at : Math.min(transcript.duration + 1, cue.at + REVIEW_GAP_SECONDS)
    if (cue.sequence < 1 || cue.sequence > count) continue
    // The first cue of a pair said in one turn keeps the wider window; a later
    // cue never narrows what an earlier one already claimed.
    const had = out.get(cue.sequence)
    out.set(cue.sequence, { from: cue.at, to: Math.max(to, had?.to ?? 0) })
  }

  return out
}
