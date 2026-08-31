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
