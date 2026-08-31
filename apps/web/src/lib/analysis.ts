import { sectionLabel } from './constants'
import { DOMAIN_ORDER } from './grid'
import { formatDuration, type Attempt, type Report } from './report'
import { linesIn, type AlignWindow, type Transcript, type TranscriptLine } from './transcript'

/**
 * Reading the recording.
 *
 * The answers say what the student chose and how long it took. The recording
 * says *how they got there* — and on this product that is the thing being sold,
 * because the teacher asks for the reasoning on every question, including the
 * ones the student got right. A right answer nobody can explain is not the same
 * finding as a right answer explained cleanly, and the answer rows cannot tell
 * those two apart.
 *
 * The rule this file keeps is the one the report engine is built on: it never
 * says anything it cannot point at. Every marker carries the line that raised
 * it, every suggestion carries the questions and the quote behind it, and
 * nothing here writes a sentence about the student that is not a quote or a
 * number. The teacher accepts a suggestion, edits it, or ignores it — the
 * writing stays theirs.
 */

// --------------------------------------------------------------- speakers --

export type Role = 'teacher' | 'student' | 'other'

/** The first name, lowercased — what two spellings of a person have in common. */
function firstName(name: string): string {
  return name.trim().toLowerCase().split(/\s+/)[0] ?? ''
}

/**
 * A first guess at who is who.
 *
 * Fathom labels turns with whatever the person called themselves in Zoom, which
 * is often neither the name on the account nor the same across two calls. So
 * this matches on the given name and gives up rather than guessing: an unmatched
 * speaker is 'other', and the write-up page asks. Attributing the teacher's
 * explanation to the student is the one mistake that would poison every finding
 * downstream, so it is not left to a heuristic.
 */
export function inferRoles(
  speakers: string[],
  teacherName: string | null | undefined,
  studentName: string | null | undefined,
): Record<string, Role> {
  const t = firstName(teacherName ?? '')
  const s = firstName(studentName ?? '')
  const out: Record<string, Role> = {}
  for (const speaker of speakers) {
    const f = firstName(speaker)
    if (f && f === s) out[speaker] = 'student'
    else if (f && f === t) out[speaker] = 'teacher'
    else out[speaker] = 'other'
  }
  return out
}

// ---------------------------------------------------------------- markers --

/** What a turn of the student's shows about how they worked the question. */
export type Marker =
  | 'elimination'
  | 'self_correction'
  | 'second_guess'
  | 'uncertainty'
  | 'rule_named'
  | 'misread'
  | 'reasoned'

export const MARKER_LABELS: Record<Marker, string> = {
  elimination: 'eliminated',
  self_correction: 'self-corrected',
  second_guess: 'second-guessed',
  uncertainty: 'unsure of the words',
  rule_named: 'named the rule',
  misread: 'misread the stem',
  reasoned: 'gave a reason',
}

/**
 * The phrases each marker is read off.
 *
 * These are deliberately the student's own idiom rather than a general model of
 * English — "not B for Bombay" is how this student eliminates, and a pattern
 * that does not survive contact with a real transcript is not worth having. New
 * phrasings get added here as they turn up, which is a diff a teacher can read.
 */
const PATTERNS: { marker: Marker; re: RegExp }[] = [
  {
    marker: 'elimination',
    re: /\b(not\s+[abcd]\b|it'?s not|isn'?t it|can'?t be|cannot be|rule[d]? (?:it )?out|eliminat|doesn'?t fit|does not fit|makes no sense|make no sense|doesn'?t make sense|irrelevant|not relevant|so it'?s either)\b/i,
  },
  {
    // A reversal, not a hesitation. "Wait" and "actually" on their own are how
    // anyone talks, and on the recording we have they fired on two questions in
    // three — which makes the finding worth nothing. What is wanted is the
    // moment a first answer is actually overturned.
    marker: 'self_correction',
    re: /\b(but then i|now that i'?m thinking|now i'?m real[is]|i completely overlooked|i take that back|change my answer|scratch that|oh,? wait|wait,? wait|hold up|first i thought|okay,? actually|actually,? (?:it|this|that|no|i))\b/i,
  },
  {
    marker: 'second_guess',
    re: /\b(could very well be|but it could be|it might be|i'?m not quite sure|not quite sure|i'?m not sure|i guess you could say|or is it|i'?ll keep my answer|come back to it|star(?:red)? it|i would change)\b/i,
  },
  {
    marker: 'uncertainty',
    re: /\b(i (?:have )?no idea|i don'?t know what|i don'?t get it|i'?m not aware|this is tough|i haven'?t read this|i can'?t explain|i'?m over[- ]?explaining)\b/i,
  },
  {
    marker: 'rule_named',
    re: /\b(parallelis|independent clause|dependent clause|modifier|transition word|run[- ]?on|comma splice|semicolon|colon|appositive|extreme language|elimination process|main idea|central (?:idea|message)|tense|subject[- ]?verb|analogy|metaphor|inference|paraphras|fanboys?)\b/i,
  },
  {
    marker: 'misread',
    re: /\b(i thought the question was|i didn'?t read|i did not read|i overlooked|i misread|read past|i skipped|i jumped to the (?:answer|option)|before i read the text)\b/i,
  },
  { marker: 'reasoned', re: /\b(because|since|which means|that'?s why|the reason)\b/i },
]

export interface MarkerHit {
  marker: Marker
  /** The line that raised it, so the finding can be shown its own evidence. */
  line: TranscriptLine
}

/**
 * Curly quotes are what a real transcript arrives with — Fathom's own export,
 * anything pasted out of a document — and `don’t` matching nothing while
 * `don't` matches would make every finding depend on which app the teacher
 * copied from.
 */
function flatten(text: string): string {
  return text.replace(/[\u2018\u2019\u02bc]/g, "'").replace(/[\u201c\u201d]/g, '"')
}

/** Every marker the student's turns raise, in the order they were said. */
export function markersIn(lines: TranscriptLine[]): MarkerHit[] {
  const hits: MarkerHit[] = []
  for (const line of lines) {
    const text = flatten(line.text)
    for (const { marker, re } of PATTERNS) {
      if (re.test(text)) hits.push({ marker, line })
    }
  }
  return hits
}

// ------------------------------------------------------ the question read --

/**
 * What the recording says happened on one question.
 *
 * The seven verdicts are the ones the transcript can actually distinguish, and
 * the reason they exist is that four of them are invisible in the answer data.
 * `understood` and `unexplained` are the same tick on the paper; `misread`,
 * `talked_out_of_it` and `reasoned_wrong` are the same cross.
 */
export type Verdict =
  | 'understood'
  | 'self_corrected'
  | 'unexplained'
  | 'misread'
  | 'talked_out_of_it'
  | 'reasoned_wrong'
  | 'guessed'
  | 'not_covered'

export const VERDICT_LABELS: Record<Verdict, string> = {
  understood: 'explained it',
  self_corrected: 'self-corrected',
  unexplained: 'right, no reason given',
  misread: 'misread the stem',
  talked_out_of_it: 'talked out of the right one',
  reasoned_wrong: 'method held, concept did not',
  guessed: 'no reasoning',
  not_covered: 'not in the recording',
}

export interface ItemAnalysis {
  itemId: string
  sequence: number
  section: string | null
  skill: string | null
  correct: boolean
  window: AlignWindow | null
  lines: TranscriptLine[]
  studentLines: TranscriptLine[]
  teacherLines: TranscriptLine[]
  /** Share of the words on this question that were the student's, 0–1. */
  talkShare: number | null
  markers: Marker[]
  hits: MarkerHit[]
  verdict: Verdict
  /** The student's longest turn — what a quote would be taken from. */
  quote: TranscriptLine | null
}

function words(lines: TranscriptLine[]): number {
  return lines.reduce((n, l) => n + l.text.split(/\s+/).filter(Boolean).length, 0)
}

/** The student's share of the words spoken on a question; 0 when nobody spoke. */
function share(studentLines: TranscriptLine[], teacherLines: TranscriptLine[]): number {
  const spoken = words(studentLines) + words(teacherLines)
  return spoken === 0 ? 0 : words(studentLines) / spoken
}

function longest(lines: TranscriptLine[]): TranscriptLine | null {
  if (lines.length === 0) return null
  return lines.reduce((a, b) => (b.text.length > a.text.length ? b : a))
}

export function analyseItem(
  attempt: Attempt,
  transcript: Transcript,
  window: AlignWindow | null,
  roles: Record<string, Role>,
): ItemAnalysis {
  const lines = window ? linesIn(transcript, window) : []
  const studentLines = lines.filter((l) => roles[l.speaker] === 'student')
  const teacherLines = lines.filter((l) => roles[l.speaker] === 'teacher')

  const hits = markersIn(studentLines)
  const markers = [...new Set(hits.map((h) => h.marker))]
  const has = (m: Marker) => markers.includes(m)

  // A reason is either the word for one or the act of one: eliminating three
  // options is reasoning out loud whether or not "because" is ever said.
  const gaveReason = has('reasoned') || has('elimination')

  let verdict: Verdict
  if (studentLines.length === 0) verdict = 'not_covered'
  else if (attempt.correct) {
    if (has('self_correction') && gaveReason) verdict = 'self_corrected'
    else if (gaveReason) verdict = 'understood'
    else verdict = 'unexplained'
  } else if (has('misread')) verdict = 'misread'
  // A wobble only counts as talking herself out of it if she was the one doing
  // the talking. Where the teacher carried the question, the second guess is a
  // symptom of not knowing it rather than the reason she missed it.
  else if (has('second_guess') && share(studentLines, teacherLines) >= 0.5)
    verdict = 'talked_out_of_it'
  else if (gaveReason) verdict = 'reasoned_wrong'
  else verdict = 'guessed'

  const spoken = words(studentLines) + words(teacherLines)

  return {
    itemId: attempt.itemId,
    sequence: attempt.sequence,
    section: attempt.section,
    skill: attempt.skill,
    correct: attempt.correct,
    window,
    lines,
    studentLines,
    teacherLines,
    talkShare: spoken === 0 ? null : words(studentLines) / spoken,
    markers,
    hits,
    verdict,
    quote: longest(studentLines),
  }
}

// ------------------------------------------------------------ suggestions --

/**
 * A sentence offered for one of the report's written boxes.
 *
 * It is never inserted on its own. The teacher reads the questions and the
 * quote it came from and puts it in, or writes their own — which is the same
 * split the rest of the report keeps: computed facts, written judgement.
 */
export interface Suggestion {
  text: string
  /** The questions it is drawn from, by their number on the paper. */
  questions: number[]
  quote: TranscriptLine | null
}

export interface DomainAnalysis {
  domain: string
  label: string
  items: ItemAnalysis[]
  strengths: Suggestion[]
  gaps: Suggestion[]
}

function qs(items: ItemAnalysis[]): number[] {
  return items.map((i) => i.sequence).sort((a, b) => a - b)
}

function list(items: ItemAnalysis[]): string {
  const n = qs(items).map((s) => `Q${s}`)
  if (n.length === 1) return n[0]
  return `${n.slice(0, -1).join(', ')} and ${n[n.length - 1]}`
}

/** The longest student turn across a group — the line most worth quoting. */
function bestQuote(items: ItemAnalysis[]): TranscriptLine | null {
  return longest(items.map((i) => i.quote).filter((q): q is TranscriptLine => q !== null))
}

function suggest(items: ItemAnalysis[], text: string): Suggestion {
  return { text, questions: qs(items), quote: bestQuote(items) }
}

function domainSuggestions(items: ItemAnalysis[]): { strengths: Suggestion[]; gaps: Suggestion[] } {
  const of = (v: Verdict) => items.filter((i) => i.verdict === v)
  const withMarker = (m: Marker) => items.filter((i) => i.markers.includes(m))

  const strengths: Suggestion[] = []
  const gaps: Suggestion[] = []

  const understood = of('understood')
  if (understood.length > 0) {
    strengths.push(
      suggest(
        understood,
        `Explained her own reasoning on ${list(understood)} rather than naming a letter.`,
      ),
    )
  }

  const corrected = of('self_corrected')
  if (corrected.length > 0) {
    strengths.push(
      suggest(corrected, `Caught a first read and overturned it herself on ${list(corrected)}.`),
    )
  }

  const eliminated = withMarker('elimination').filter((i) => i.correct)
  if (eliminated.length >= 2) {
    strengths.push(
      suggest(
        eliminated,
        `Works by elimination — narrows to two before choosing on ${list(eliminated)}.`,
      ),
    )
  }

  const named = withMarker('rule_named').filter((i) => i.correct)
  if (named.length > 0) {
    strengths.push(suggest(named, `Can name the rule she is using on ${list(named)}.`))
  }

  const unexplained = of('unexplained')
  if (unexplained.length > 0) {
    gaps.push(
      suggest(
        unexplained,
        `Right on ${list(unexplained)} without giving a reason — worth asking again cold.`,
      ),
    )
  }

  const misread = of('misread')
  if (misread.length > 0) {
    gaps.push(suggest(misread, `Read past the stem on ${list(misread)}; the method was sound.`))
  }

  const talkedOut = of('talked_out_of_it')
  if (talkedOut.length > 0) {
    gaps.push(
      suggest(
        talkedOut,
        `Had the answer and moved off it on ${list(talkedOut)} — second-guessing costs her here.`,
      ),
    )
  }

  const reasonedWrong = of('reasoned_wrong')
  if (reasonedWrong.length > 0) {
    gaps.push(
      suggest(
        reasonedWrong,
        `Applied a method and still missed ${list(reasonedWrong)} — the concept, not the approach.`,
      ),
    )
  }

  const guessed = of('guessed')
  if (guessed.length > 0) {
    gaps.push(suggest(guessed, `No reasoning offered on ${list(guessed)}.`))
  }

  const unsure = withMarker('uncertainty')
  if (unsure.length > 0) {
    gaps.push(suggest(unsure, `Said outright she did not know a word on ${list(unsure)}.`))
  }

  // A wrong answer the teacher did most of the talking on was explained to her,
  // not worked out by her — which is a different thing to record.
  const taught = items.filter(
    (i) => !i.correct && i.talkShare !== null && i.talkShare < 0.3 && i.lines.length > 0,
  )
  if (taught.length > 0) {
    gaps.push(
      suggest(taught, `${list(taught)} was explained to her rather than worked out — re-test it.`),
    )
  }

  return { strengths, gaps }
}

// -------------------------------------------------------------- alignment --

export interface Alignment {
  covered: number
  total: number
  /** Under two thirds and the offset is almost certainly wrong, not the recording. */
  ok: boolean
}

/**
 * The offset that lines the recording up with the paper.
 *
 * Fathom starts before the lesson does, and the gap is whatever the greeting
 * ran to — 150 seconds on the recording we have, but it is a different number
 * every time. Rather than make the teacher hunt for it by eye, try the
 * plausible offsets and keep the one that leaves the fewest questions with
 * nobody talking about them. Ties go to the earlier offset, because a late
 * offset can always fake coverage by sweeping the tail of the call into the
 * last question's window.
 */
export function suggestOffset(
  transcript: Transcript,
  windowsAt: (offset: number) => Map<string, AlignWindow>,
  itemIds: string[],
  roles: Record<string, Role>,
): number {
  let best = 0
  let bestScore = -1

  for (let offset = 0; offset <= Math.min(1200, transcript.duration); offset += 15) {
    const windows = windowsAt(offset)
    let score = 0
    for (const id of itemIds) {
      const w = windows.get(id)
      if (!w) continue
      if (linesIn(transcript, w).some((l) => roles[l.speaker] === 'student')) score += 1
    }
    if (score > bestScore) {
      bestScore = score
      best = offset
    }
  }
  return best
}

// ------------------------------------------------------------- the whole --

export interface SessionAnalysis {
  items: ItemAnalysis[]
  domains: DomainAnalysis[]
  alignment: Alignment
  /** Share of all spoken words that were the student's, 0–1. */
  talkShare: number | null
  /** Of the questions in the recording, how many she gave a reason for. */
  explained: number
  /** Second-guessed and wrong, over second-guessed at all. */
  secondGuess: { wrong: number; total: number }
  timeManagement: Suggestion[]
  engagement: Suggestion[]
}

export function analyseSession(
  report: Report,
  transcript: Transcript,
  windows: Map<string, AlignWindow>,
  roles: Record<string, Role>,
): SessionAnalysis {
  const items = report.attempts.map((a) =>
    analyseItem(a, transcript, windows.get(a.itemId) ?? null, roles),
  )
  const covered = items.filter((i) => i.studentLines.length > 0)

  const domains: DomainAnalysis[] = DOMAIN_ORDER.map((domain) => {
    const mine = covered.filter((i) => i.section === domain)
    const { strengths, gaps } = domainSuggestions(mine)
    return { domain, label: sectionLabel(domain) ?? domain, items: mine, strengths, gaps }
  }).filter((d) => d.items.length > 0)

  const studentWords = words(items.flatMap((i) => i.studentLines))
  const teacherWords = words(items.flatMap((i) => i.teacherLines))
  const spoken = studentWords + teacherWords

  const explained = covered.filter(
    (i) => i.verdict !== 'guessed' && i.verdict !== 'unexplained',
  ).length

  const guessers = covered.filter((i) => i.markers.includes('second_guess'))
  const secondGuess = { wrong: guessers.filter((i) => !i.correct).length, total: guessers.length }

  // --- the two summary boxes ------------------------------------------------
  const timeManagement: Suggestion[] = []
  if (report.laboured.length > 0) {
    const ids = new Set(report.laboured.map((a) => a.itemId))
    const slow = covered.filter((i) => ids.has(i.itemId))
    if (slow.length > 0) {
      timeManagement.push(
        suggest(
          slow,
          `Spent well over target on ${list(slow)}; on ${list(slow.filter((i) => i.correct))} the time bought the right answer.`,
        ),
      )
    }
  }
  if (report.rushed.length > 0) {
    const ids = new Set(report.rushed.map((a) => a.itemId))
    const fast = covered.filter((i) => ids.has(i.itemId))
    if (fast.length > 0) {
      timeManagement.push(suggest(fast, `${list(fast)} went under half the target and missed.`))
    }
  }
  if (report.total > 0 && report.target > 0) {
    timeManagement.push({
      text: `${formatDuration(report.seconds)} across ${report.total} questions against a ${formatDuration(report.target)} target.`,
      questions: [],
      quote: null,
    })
  }

  const engagement: Suggestion[] = []
  if (spoken > 0) {
    engagement.push({
      text: `Did ${Math.round((studentWords / spoken) * 100)}% of the talking across the hour.`,
      questions: [],
      quote: null,
    })
  }
  if (secondGuess.total > 0) {
    engagement.push(
      suggest(
        guessers,
        `Second-guessed on ${secondGuess.total} question${secondGuess.total === 1 ? '' : 's'} and was wrong on ${secondGuess.wrong} of them.`,
      ),
    )
  }
  if (covered.length > 0) {
    engagement.push({
      text: `Talked through ${explained} of the ${covered.length} questions in the recording, right ones included.`,
      questions: [],
      quote: null,
    })
  }

  return {
    items,
    domains,
    alignment: {
      covered: covered.length,
      total: items.length,
      ok: items.length === 0 || covered.length / items.length >= 2 / 3,
    },
    talkShare: spoken === 0 ? null : studentWords / spoken,
    explained,
    secondGuess,
    timeManagement,
    engagement,
  }
}
