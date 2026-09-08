import { linesIn, type AlignWindow, type Transcript, type TranscriptLine } from './transcript.ts'

/**
 * Reading the recording with a model, and the guard that makes it safe to.
 *
 * The deterministic reader in ./analysis.ts matches phrases against the
 * student's turns. It works, and on the recording it was written against it
 * works well — but the phrases are *that student's* idiom, and a pattern tuned
 * to one recording is a pattern that fails silently on the next one. Two
 * recordings is enough to write rules and nowhere near enough to trust them.
 *
 * So the reading is done by a model, and everything that could go wrong with
 * that is handled here rather than hoped away:
 *
 *   1  the model is never asked which part of the call is about which question.
 *      That is arithmetic — `first_viewed_at` plus one offset — and asking for
 *      it is where invented attributions come from. It gets a window, cut.
 *   2  every claim carries a quote, and {@link validateExtraction} checks that
 *      quote is verbatim in the window it was cut from. A claim whose quote
 *      cannot be found is dropped, not repaired.
 *   3  no claim may contain a number that is not in its own quote. Figures come
 *      from the computed report or from the teacher; the model never supplies
 *      one.
 *
 * A drop is a quality signal rather than an error: the transcript is still
 * there, the teacher still writes the report, and a rising drop rate means the
 * prompt broke. {@link ExtractionResult} carries the drops so that is visible.
 */

// ------------------------------------------------------------- the window --

/**
 * How far either side of a question's own window the model may look.
 *
 * On the recordings we have, the teacher's verdict on a question routinely
 * lands after the next one is already on screen — "Very good. Absolutely
 * right." arrives while the student is reading the next stem, and on the 17
 * July recording the whole review happens minutes after the test is over. A
 * window cut exactly to the question loses that feedback, which is the thing
 * the report is being asked for.
 *
 * So the model sees a margin, and anything it cites from inside the margin is
 * marked {@link Evidence.fromMargin} so a teacher can see the reach rather than
 * discover it.
 */
export const MARGIN_SECONDS = 90

/** A question's own window, and the wider one the model is shown. */
export interface QuestionWindow {
  itemId: string
  sequence: number
  /** When the question was on screen — the window alignment computed. */
  own: AlignWindow
  /** `own`, widened by {@link MARGIN_SECONDS} either side. */
  shown: AlignWindow
}

export function widen(window: AlignWindow, margin = MARGIN_SECONDS): AlignWindow {
  return { from: Math.max(0, window.from - margin), to: window.to + margin }
}

export function questionWindows(
  items: { itemId: string; sequence: number; window: AlignWindow | null }[],
): QuestionWindow[] {
  return items
    .filter((i): i is { itemId: string; sequence: number; window: AlignWindow } => i.window !== null)
    .map((i) => ({ itemId: i.itemId, sequence: i.sequence, own: i.window, shown: widen(i.window) }))
}

// -------------------------------------------------------------- evidence --

/**
 * The line a claim is made from.
 *
 * `quote` is the load-bearing field: it is checked character for character
 * against the transcript, and a claim whose quote does not survive that check
 * is dropped. `at` is the stamp of the block the quote sits in, which is what
 * lets the report link a sentence back to the moment in the recording.
 */
export interface Evidence {
  /** Verbatim from the transcript. Checked, not trusted. */
  quote: string
  /** Seconds into the recording — the stamp of the block the quote came from. */
  at: number
  /**
   * Who actually said it.
   *
   * Not the same thing as Fathom's label. Fathom attributes a whole block to
   * one speaker and the other person's words routinely land at the end of it —
   * on the two recordings we have, the teacher's "Very good, absolutely right"
   * repeatedly sits at the tail of a block labelled with the student's name.
   * The deterministic reader believes the label and therefore reads the
   * teacher's own explanations as the student's reasoning. The model is asked
   * who is speaking instead, and this is that answer.
   */
  speaker: 'teacher' | 'student' | 'other'
  /** True when Fathom's label for the block disagrees with `speaker`. */
  relabelled: boolean
  /** True when the quote came from the margin rather than the question's own window. */
  fromMargin: boolean
}

/** A single thing the model claims about the recording, with its evidence. */
export interface Claim {
  /** The model's own words. Never contains a figure that is not in the quote. */
  text: string
  evidence: Evidence
}

/**
 * A claim as the model returns it, before the guard has been over it.
 *
 * Deliberately smaller than {@link Claim}: the model supplies only what it is
 * the authority on — the observation, the words it is drawn from, and who was
 * speaking. `at`, `relabelled` and `fromMargin` are facts about the transcript
 * and are computed from the line the quote is found in, so a model that reports
 * them wrongly cannot make the report wrong.
 */
export interface RawClaim {
  text: string
  quote: string
  speaker: Evidence['speaker']
}

// ------------------------------------------------- what the teacher said --

/**
 * The kinds of feedback the teacher actually gives, taken from the recordings
 * rather than invented.
 *
 * These are not decoration: a report that says "the teacher gave feedback on
 * Q7" is worth nothing, and a report that says "the teacher taught the rule
 * that extreme language is usually wrong, and the student used it three
 * questions later" is the product. The kind is what makes the difference
 * legible, and each one is something the teacher on these recordings does
 * repeatedly.
 */
export type FeedbackKind =
  /** "Very good. Absolutely right." — the answer and the reasoning both stand. */
  | 'confirmation'
  /** "What is wrong is, it's partly true… it's too broad." — the reading is corrected. */
  | 'correction'
  /** "In elimination process, whenever extreme language is used, it is wrong." */
  | 'strategy'
  /** "Zealot actually means someone fanatically devoted to something." */
  | 'vocabulary'
  /** "I would recommend you write down the meanings also." — work outside the lesson. */
  | 'recommendation'
  /** "What do you read first?" — the teacher asking for the reasoning. */
  | 'probe'

export const FEEDBACK_LABELS: Record<FeedbackKind, string> = {
  confirmation: 'Confirmed',
  correction: 'Corrected',
  strategy: 'Taught a strategy',
  vocabulary: 'Taught a word',
  recommendation: 'Recommended',
  probe: 'Asked for the reasoning',
}

export interface TeacherFeedback extends Claim {
  kind: FeedbackKind
}

export interface RawTeacherFeedback extends RawClaim {
  kind: FeedbackKind
}

// ------------------------------------------------------- the question read --

/**
 * What the recording says about one question.
 *
 * Every field is nullable and every field carries its own evidence, because
 * "the student did not explain this one" and "the model found nothing" are
 * different findings and the report has to be able to tell them apart. That is
 * what `covered` is for.
 */
export interface QuestionReading {
  itemId: string
  /** False when nobody discusses this question in its window. */
  covered: boolean
  /** How the student got to their answer, in the model's words. */
  studentReasoning: Claim | null
  /** What the student got wrong about the text or the stem. */
  misunderstanding: Claim | null
  /** A word or phrase the student said outright they did not know. */
  vocabularyGap: Claim | null
  /** Everything the teacher said about this question. Often more than one. */
  teacherFeedback: TeacherFeedback[]
}

// -------------------------------------------------------- the session read --

/**
 * How a transcript claim sits against what the teacher wrote on the form.
 *
 * This is the join the report is built on. The teacher writes "rushed the
 * inference questions" on the form; the recording either shows that or does
 * not, and a report that prints both without saying which is which lets one
 * judgement read as two. `supports` is what stops that.
 */
export type FormRelation = 'supports' | 'complicates' | 'adds'

export const RELATION_LABELS: Record<FormRelation, string> = {
  supports: 'Backs what the teacher wrote',
  complicates: 'Sits awkwardly against what the teacher wrote',
  adds: 'Not on the form',
}

export interface DomainEvidence extends Claim {
  domain: string
  relation: FormRelation
}

export interface RawDomainEvidence extends RawClaim {
  domain: string
  relation: FormRelation
}

/**
 * The things a teacher says once, at the end, about the whole session.
 *
 * Both recordings end with the teacher summing up — "so I've identified the
 * main issue… it was just the literary one", "you have to think fast with the
 * rules, with the strategies". That is the single most quotable thing in an
 * hour of recording and it belongs at the top of the report, not lost in a
 * per-question table.
 */
export interface SessionReading {
  /** The teacher's own closing verdict on the session. */
  closingVerdict: Claim | null
  /**
   * A score the teacher said out loud.
   *
   * Kept apart from everything else and never used as the report's score. On
   * the 7 August recording the teacher counts "six wrong in the 23 questions"
   * live, off a paper copy — that is worth recording as something the student
   * heard, and it is not the same as the number the answer rows compute.
   */
  teacherStatedScore: Claim | null
  /** Anything the student said about their own performance. */
  studentSelfReport: Claim | null
  /** Transcript evidence for each domain, tied to the teacher's form. */
  domainEvidence: DomainEvidence[]
}

// --------------------------------------------------------------- the whole --

export interface Extraction {
  questions: QuestionReading[]
  session: SessionReading
}

/** One question as the model returns it. */
export interface RawQuestionReading {
  itemId: string
  covered: boolean
  studentReasoning: RawClaim | null
  misunderstanding: RawClaim | null
  vocabularyGap: RawClaim | null
  teacherFeedback: RawTeacherFeedback[]
}

/** The whole reading as the model returns it. */
export interface RawExtraction {
  questions: RawQuestionReading[]
  session: {
    closingVerdict: RawClaim | null
    teacherStatedScore: RawClaim | null
    studentSelfReport: RawClaim | null
    domainEvidence: RawDomainEvidence[]
  }
}

/** Why a claim did not survive validation. */
export type DropReason =
  | 'quote-not-found'
  | 'unknown-item'
  | 'number-not-in-quote'
  | 'empty-text'
  | 'duplicate-item'

export interface Drop {
  reason: DropReason
  /** Where it was dropped from, for the log. */
  where: string
  /** What was dropped, so a rising drop rate can be read rather than guessed. */
  text: string
}

export interface ExtractionResult {
  extraction: Extraction
  drops: Drop[]
}

// ------------------------------------------------------------ the guard --

/**
 * Curly quotes, non-breaking spaces and line wrapping are what a real
 * transcript arrives with, and a quote that differs from the recording only by
 * the apostrophe the model chose is not an invented quote. Everything is
 * flattened the same way on both sides before comparing, so the check stays a
 * check on *content*.
 */
function flatten(text: string): string {
  return text
    .replace(/[‘’ʼ]/g, "'")
    .replace(/[“”]/g, '"')
    .replace(/[–—]/g, '-')
    .replace(/\s+/g, ' ')
    .trim()
    .toLowerCase()
}

/** Every digit run in a string: what a claim is not allowed to invent. */
function numbersIn(text: string): string[] {
  return text.match(/\d+/g) ?? []
}

/**
 * The shortest run of words an elided fragment may be.
 *
 * Elision is only safe because each fragment still has to be found. Two
 * characters would be found in anything, so a fragment below this is treated as
 * no evidence at all rather than as weak evidence.
 */
const MIN_FRAGMENT = 10

/**
 * The line a quote is verbatim inside, or null.
 *
 * Substring rather than equality: the model is asked for the part of a turn that
 * carries the claim, not the whole turn, and a turn on these recordings runs to
 * a paragraph. The match is against a single line — a "quote" spanning two
 * speakers' turns is not a quote, and that is the whole point of checking.
 *
 * ## Elision
 *
 * A quote may cut its own middle out with an ellipsis, because that is how
 * quotation has always worked and because these turns are long:
 *
 *     "So it can't be B because that's a fact. It's not an inference... A, no,
 *      again, that's a fact."
 *
 * That is one turn, in order, with a dull stretch removed. On the first real run
 * against the 7 August recording this was the single largest cause of dropped
 * claims — the words were genuinely said, and a strict substring match called
 * them invented.
 *
 * So an ellipsis is allowed, and every fragment either side of it must still be
 * found in the SAME line, IN ORDER, each at least {@link MIN_FRAGMENT}
 * characters. That keeps the promise the guard exists to make — nothing is
 * attributed to anyone that they did not say, in the order they said it — while
 * not throwing away a third of the honest claims. What elision cannot do is
 * reverse a meaning across the gap, and that is what the teacher reading the
 * quote before publishing is for.
 */
export function findQuote(lines: TranscriptLine[], quote: string): TranscriptLine | null {
  const fragments = flatten(quote)
    .split(/\s*\.\.\.\s*|\s*…\s*/)
    .map((f) => f.trim())
    .filter((f) => f.length > 0)

  if (fragments.length === 0) return null
  // One fragment is a plain quote; several means elision, and then each has to
  // carry enough text to be evidence on its own.
  if (fragments.length > 1 && fragments.some((f) => f.length < MIN_FRAGMENT)) return null

  return (
    lines.find((l) => {
      const hay = flatten(l.text)
      let from = 0
      for (const fragment of fragments) {
        const at = hay.indexOf(fragment, from)
        if (at === -1) return false
        from = at + fragment.length
      }
      return true
    }) ?? null
  )
}

/**
 * Checks one claim and returns it with its evidence corrected, or null.
 *
 * Corrected rather than merely checked: `at` and `fromMargin` are recomputed
 * from the line the quote was actually found in, so they cannot be wrong even
 * if the model reports them wrong. Only `speaker` is taken from the model,
 * because that is the judgement it is there to make — and `relabelled` records
 * where it disagreed with Fathom, which is the thing worth auditing.
 */
function checkClaim<R extends RawClaim, T extends Claim>(
  claim: R,
  lines: TranscriptLine[],
  own: AlignWindow,
  fathomRole: (speaker: string) => Evidence['speaker'],
  where: string,
  drops: Drop[],
): T | null {
  const text = claim?.text?.trim() ?? ''
  if (text.length === 0) {
    drops.push({ reason: 'empty-text', where, text: claim?.quote ?? '' })
    return null
  }

  const line = findQuote(lines, claim.quote ?? '')
  if (!line) {
    drops.push({ reason: 'quote-not-found', where, text })
    return null
  }

  // A figure the model supplies is a figure nobody checked. Numbers in a report
  // come from the answer rows or from the teacher's own mouth, so a claim may
  // only carry a number it can point at inside its own quote.
  const quoted = numbersIn(claim.quote)
  if (numbersIn(text).some((n) => !quoted.includes(n))) {
    drops.push({ reason: 'number-not-in-quote', where, text })
    return null
  }

  const labelled = fathomRole(line.speaker)
  const speaker = claim.speaker ?? labelled

  // Everything the model said about the claim is kept except the three fields
  // it is not the authority on; those are replaced by what the transcript says.
  const { quote, speaker: _s, text: _t, ...rest } = claim
  return {
    ...rest,
    text,
    evidence: {
      quote,
      at: line.at,
      speaker,
      relabelled: speaker !== labelled,
      fromMargin: line.at < own.from || line.at >= own.to,
    },
  } as unknown as T
}

export interface ValidationInput {
  transcript: Transcript
  windows: QuestionWindow[]
  /** Fathom's own speaker labels, mapped to roles — what the model is checked against. */
  roles: Record<string, Evidence['speaker']>
  /** The domains a claim may be filed under. Anything else is dropped. */
  domains: string[]
}

/**
 * The whole guard, run over whatever the model returned.
 *
 * Nothing here trusts the model's structure either: an unknown item id, a
 * repeated one, a claim about a domain that is not on the form — all dropped.
 * What comes out the other side is a reading in which every sentence can be
 * pointed at a line of the recording.
 */
export function validateExtraction(
  raw: RawExtraction,
  input: ValidationInput,
): ExtractionResult {
  const drops: Drop[] = []
  const byId = new Map(input.windows.map((w) => [w.itemId, w]))
  const role = (speaker: string): Evidence['speaker'] => input.roles[speaker] ?? 'other'

  // The whole recording is the allowlist for session-level claims: a closing
  // verdict is not tied to a question and is routinely said after the last one.
  const all = input.transcript.lines
  const sessionWindow: AlignWindow = { from: 0, to: input.transcript.duration + 1 }

  const seen = new Set<string>()
  const questions: QuestionReading[] = []

  for (const q of raw.questions ?? []) {
    const window = byId.get(q.itemId)
    if (!window) {
      drops.push({ reason: 'unknown-item', where: 'questions', text: q.itemId })
      continue
    }
    if (seen.has(q.itemId)) {
      drops.push({ reason: 'duplicate-item', where: 'questions', text: q.itemId })
      continue
    }
    seen.add(q.itemId)

    const lines = linesIn(input.transcript, window.shown)
    const at = (c: RawClaim | null, field: string) =>
      c
        ? checkClaim<RawClaim, Claim>(c, lines, window.own, role, `Q${window.sequence}.${field}`, drops)
        : null

    const feedback = (q.teacherFeedback ?? [])
      .map((f) =>
        checkClaim<RawTeacherFeedback, TeacherFeedback>(
          f,
          lines,
          window.own,
          role,
          `Q${window.sequence}.teacherFeedback`,
          drops,
        ),
      )
      .filter((f): f is TeacherFeedback => f !== null)

    questions.push({
      itemId: q.itemId,
      // Coverage is a fact about the transcript, not a judgement: if no line
      // falls in the window there was nothing to read, whatever the model says.
      covered: lines.length > 0 && q.covered !== false,
      studentReasoning: at(q.studentReasoning, 'studentReasoning'),
      misunderstanding: at(q.misunderstanding, 'misunderstanding'),
      vocabularyGap: at(q.vocabularyGap, 'vocabularyGap'),
      teacherFeedback: feedback,
    })
  }

  const s = raw.session ?? ({} as RawExtraction['session'])
  const sessionClaim = (c: RawClaim | null | undefined, field: string) =>
    c ? checkClaim<RawClaim, Claim>(c, all, sessionWindow, role, `session.${field}`, drops) : null

  const domainEvidence = (s.domainEvidence ?? [])
    .filter((d) => {
      if (input.domains.includes(d.domain)) return true
      drops.push({ reason: 'unknown-item', where: 'session.domainEvidence', text: d.domain })
      return false
    })
    .map((d) =>
      checkClaim<RawDomainEvidence, DomainEvidence>(
        d,
        all,
        sessionWindow,
        role,
        `session.${d.domain}`,
        drops,
      ),
    )
    .filter((d): d is DomainEvidence => d !== null)

  return {
    extraction: {
      questions,
      session: {
        closingVerdict: sessionClaim(s.closingVerdict, 'closingVerdict'),
        teacherStatedScore: sessionClaim(s.teacherStatedScore, 'teacherStatedScore'),
        studentSelfReport: sessionClaim(s.studentSelfReport, 'studentSelfReport'),
        domainEvidence,
      },
    },
    drops,
  }
}

/**
 * The share of claims that failed the guard.
 *
 * Worth watching rather than worth alerting on: a few drops is a model being
 * asked a hard question, and a drop rate that climbs is a prompt that broke.
 */
export function dropRate(result: ExtractionResult): number {
  const kept = result.extraction.questions.reduce(
    (n, q) =>
      n +
      q.teacherFeedback.length +
      (q.studentReasoning ? 1 : 0) +
      (q.misunderstanding ? 1 : 0) +
      (q.vocabularyGap ? 1 : 0),
    0,
  )
  const session = result.extraction.session
  const sessionKept =
    session.domainEvidence.length +
    (session.closingVerdict ? 1 : 0) +
    (session.teacherStatedScore ? 1 : 0) +
    (session.studentSelfReport ? 1 : 0)

  const total = kept + sessionKept + result.drops.length
  return total === 0 ? 0 : result.drops.length / total
}
