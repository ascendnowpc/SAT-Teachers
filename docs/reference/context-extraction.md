# Extracting the context

How the diagnostic report gets built from the teacher's form and the recording, why the reading is
done by a model rather than by patterns, and what the two Fathom exports we have actually taught us.

Companion to [`transcript-analysis.md`](transcript-analysis.md), which describes the deterministic
reader, and [`report-ai-layer.md`](report-ai-layer.md), which is the decision doc this implements.

## The workflow

```
the session ends
   │
   ├─ 1  the teacher fills the diagnostic form   (0030)
   │       four domain rows, their comments, the Fathom transcript
   │
   ├─ 2  the teacher presses Read the recording
   │       └─ the transcript is cut into one window per question — arithmetic,
   │          from first_viewed_at plus one offset. No model is asked which
   │          part of the call is about which question.
   │       └─ a model reads each window and records what it shows
   │       └─ every claim without a verbatim quote is DROPPED, server-side
   │       └─ what survives is stored                              (0031)
   │
   ├─ 3  the teacher presses Generate report
   │
   └─ 4  the report: the teacher's words, the recording's findings and the
         computed numbers, joined and never merged
```

## Why a model, given we only have two transcripts

The question was put as "an API, or our own accurate system". In this repo that is a false choice:
`analysis.ts` **is** our own system and it works. The real question is which layer a model touches.

Two transcripts is enough to write rules and nowhere near enough to trust them — and the rules we
have are worse off than that, because they were tuned on **one**. `transcript-analysis.md` says so
outright: the markers are *"the student's own idiom… 'not B for Bombay' is how **this** student
eliminates"*. Student three says "nah, that one's out, it's too strong" and the pattern sees
nothing, silently — a `not_covered` verdict that reads like a quiet student rather than a broken
regex.

So the scarcity argues **for** a model on reading language and **against** it on facts. That is the
split:

| Layer | Who | Why |
| --- | --- | --- |
| Which turns belong to Q7 | Deterministic, always | `first_viewed_at` + one offset already answers it. Asking a model is asking for a guess with a citation attached. |
| Numbers, accuracy, pace | Deterministic | Computed from the answer rows. |
| Reading a window | **Model** | Where two transcripts kills a rule system and does not touch a model. |
| Verdicts and markers | Deterministic, kept running | The floor. It works with no key, no network and no bill. |

Training our own model was never an option at two transcripts, and is not what "our own system"
meant.

## What the two recordings actually taught us

Both are real Fathom exports of real diagnostics run by the same teacher. Neither behaved the way
the code assumed.

### 1. Speaker labels are wrong at the edges of a turn — this is the big one

Fathom attributes a block of time to one person, and the other person's words routinely land at the
**end** of that block. Measured over both exports with a narrow list of phrases only one party ever
says:

| Export | Turns | Teacher's words inside a student-labelled turn | The reverse |
| --- | --- | --- | --- |
| 7 August (Sara) | 175 | 12 | 0 |
| 17 July (Joshua) | 105 | 2 | 0 |

Fourteen provable cases, all in the same direction, and that is only what a deliberately narrow
phrase list catches — the true rate is higher. A representative one, verbatim:

```
@8:52 - Sara Rohit
Rely, it can't be rely on because evidence doesn't … facts rely on evidence.
Very good absolutely right, good job with the vocab questions.
```

The last sentence is the teacher's. And in the 17 July export the drift is bad enough to swap whole
introductions — the turn labelled `josh` says *"So my name is Malya."*

**This is a live bug in the deterministic reader**, not a hypothetical. `analyseItem` filters lines
by `roles[l.speaker] === 'student'` and runs the markers over them, so the teacher's own
explanations are read as the student's reasoning. The `reasoned` pattern matches on `because`, which
is exactly what a teacher explaining an answer says — inflating `reasoned`, which inflates
`understood`, which is a tick on the report saying the student explained something the teacher
explained to her.

So the model is given the label and asked to judge from the words instead. Where it disagrees, the
claim is marked `relabelled` and the report says so on the line.

### 2. Feedback arrives after the question has moved on

The teacher's verdict lands while the student is already reading the next stem. Windows are widened
by `MARGIN_SECONDS` (90s) either side, and anything cited from the margin is marked `fromMargin` so
the reach is visible rather than silent.

### 3. There are two shapes of lesson, and only one of them is what the code assumed

- **7 August** — think-aloud, question by question, in order. Timestamp alignment works.
- **17 July** — a silent timed paper, then a review that jumps around: *"Are there any reading ones
  left?"*, *"12th one, please. Would you have 13?"*, *"this is 17, right?"*

In the second shape the teacher goes down the list stating verdicts aloud — *"19 is wrong … 23 yeah
this is good 24 yeah this is wrong 25 this is incorrect"* — which is per-question teacher feedback
of exactly the kind the report wants, sitting an hour away from when the question was on screen.
The prompt names both shapes.

### 4. The most quotable thing in the hour is the last thing said

Both recordings end with the teacher summing up. The 7 August one:

> "So I've identified the main issue. So of course, it was just the literary one, because when you
> had the harder scientific one, were able to do those… And a revision of the grammar rules, because
> right now you're going with your gut feeling."

That belongs at the top of a report, not buried in a per-question table — hence `closingVerdict`.

### 5. Teachers say scores out loud, and they are not the report's score

> "You got six wrong in the 23 questions that we did."

Counted live off a paper copy, mid-call. Worth recording because the student heard it; never the
report's own figure. `teacherStatedScore` keeps it, labelled, apart from everything computed.

## The guard

The model can be wrong. Everything that would make that dangerous is checked in
`extraction.ts::validateExtraction`, server-side, before anything is stored:

| Rule | Failure |
| --- | --- |
| The quote is verbatim in the window it was cut from, one turn, flattened for curly quotes and wrapping | `quote-not-found` |
| The item id is one of the session's own | `unknown-item` |
| No item claimed twice | `duplicate-item` |
| **No number in a claim that is not in its own quote** | `number-not-in-quote` |
| A domain is one of the four on the form | `unknown-item` |
| The claim says something | `empty-text` |

A claim that fails is **dropped, not repaired**. `at`, `fromMargin` and `relabelled` are recomputed
from the line the quote was found in, so a model that reports them wrongly cannot make the report
wrong. Drops are stored and the drop rate is shown to the teacher: a rising one is a broken prompt,
and there is nowhere else it would be visible.

## The join with the teacher's form

The form is given to the model as context — it should know what the teacher was watching for. But
the failure mode is specific and worth naming:

> The teacher writes "rushed the inference questions". The model is handed that sentence, produces a
> paragraph agreeing with it, and the parent reads **one person's judgement as two independent
> findings**.

Two things prevent it. Every claim must cite the transcript, never the form — a claim whose quote is
not in the recording is dropped by the same rule as any other. And each piece of `domainEvidence`
must say whether it `supports`, `complicates` or `adds` to what the teacher wrote. The report puts
the two in separate columns under the same heading, and surfaces every `complicates` in its own
section, because that is the row where one of the two is wrong and only the teacher can say which.

## Where it runs

A Supabase Edge Function, `extract_session_context`. It loads the transcript and the answers
itself rather than accepting them from the client: a client that could post its own transcript could
post one containing the quotes it wanted to see. The table has no client-side insert policy, so a
reading can only arrive having been through the guard.

It imports the guard from `apps/web/src/lib/` rather than reimplementing it — those modules are what
the vitest suite runs against, and a second copy would be a second copy to keep right.

Two things do come from the client, on purpose: the offset and the speaker roles. Both are already
the teacher's to set on the write-up page, because a recording that starts before the lesson and a
Fathom label that is somebody's Zoom nickname are things only a person can settle. Neither is a
security boundary — a wrong offset changes which lines are read, and the quotes are shown either
way, so it is visible rather than dangerous.

```
POST /functions/v1/extract_session_context   { session_id, offset_seconds, roles }
  →  { extraction, drops, drop_rate, model, coverage }
```

## Which model

**Undecided on purpose, and swappable by an environment variable.** Every vendor-specific line in
the repo is in `providers.ts` — `grep` finds no vendor named anywhere else. The guard, the prompt,
the schema, the report assembly and all 208 tests are untouched by a swap.

```
EXTRACTION_PROVIDER = anthropic | gemini | xai      # or just set one key
EXTRACTION_MODEL    = …                             # overrides the default
ANTHROPIC_API_KEY / GEMINI_API_KEY / XAI_API_KEY
```

Each adapter is a single `fetch` — Anthropic through a tool schema, Gemini through
`responseSchema`, xAI through OpenAI-compatible strict `json_schema`. Raw HTTP rather than three
SDKs because this module runs in two runtimes: Deno in the edge function, Node in the bench.

Gemini's schema dialect differs in ways that reject the request rather than degrade it — single
`type` instead of a union, no `additionalProperties` — so `toGeminiSchema` translates rather than
duplicating the schema. That translation is tested; a second schema would be a second thing to keep
in step.

### Deciding it with evidence instead of opinion

The guard is already a scorer. It drops any claim whose quote is not verbatim, and verbatim quoting
under a deep schema is the capability this feature lives on — a model that paraphrases when asked to
quote produces an empty report. So:

```bash
GEMINI_API_KEY=… ANTHROPIC_API_KEY=… node tools/bench-extraction.mjs transcript.txt 23
```

prints kept / dropped / drop-rate / teacher-feedback found / relabelled / covered per vendor. Only
vendors with a key set are called.

**Read `kept` beside the rate.** A model that returns two safe claims scores better than one that
returns eight good ones and fumbles a quote. And `relabelled` near zero means the model is not doing
the job it is there for — overruling Fathom on who was speaking.

With two transcripts this ranks vendors on the one thing that is machine-checkable. It is a smoke
test, not an eval.

## Cost, and why it is not a design input

One session of 23 questions packs to roughly 96 KB — about 25k input tokens, one call. That is
cents per report on any of the three, and an order of magnitude apart between the cheapest and the
dearest of them, which is still cents. The margin means most lines appear in two windows, and it is
still not worth optimising.

Latency and trust are the constraints. Cost is not.

## What to measure before trusting it

Two transcripts cannot validate this and nothing here pretends otherwise.

- **Drop rate** — stored per reading. Rising means the prompt broke.
- **`relabelled` count** — how often the model overrules Fathom. Near zero would mean it is not
  doing the job it is there for; very high would mean it is inventing attributions.
- **Coverage** — questions with nothing found. A sudden fall is usually the offset, not the lesson.
- **Teacher edit distance** — how much survives to publish.
- **Agreement with the deterministic verdicts.** Both readers run. Where they agree, confidence is
  high; where they differ, that is the row a teacher should read. On the 7 August recording the
  regexes match the teacher's own diagnosis chips on all five misses — that is the bar, and it is a
  regression test rather than a vibe.

**Collect a transcript from every diagnostic from now on.** At roughly twenty, the agreement rate
becomes measurable and the question of whether the model is actually better than the patterns
becomes answerable. Until then this ships with a guard instead of evidence, which is the honest
description of it.
