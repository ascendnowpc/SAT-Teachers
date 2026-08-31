# Reading the transcript

What happens between "the session finished" and "the report is written", and what the analysis is
allowed to use.

## The flow

```
session ends
   │
   ├─ 1  the teacher drops the Fathom transcript on /sessions/:id/report/edit
   │
   ├─ 2  it is parsed          →  turns: @m:ss, speaker, text
   │
   ├─ 3  speakers get roles    →  teacher | student | someone else
   │
   ├─ 4  it is aligned         →  each question gets the span of the call it was on screen for
   │
   ├─ 5  it is read            →  markers per turn → a verdict per question → findings per domain
   │
   ├─ 6  the teacher accepts, edits or ignores each finding
   │
   └─ 7  publish
```

Steps 2–5 are deterministic and run in the browser. Nothing is stored: the transcript is the only
row written, and the findings are recomputed from it every time the page opens, so they cannot
drift from the recording the way a cached summary would.

## What the analysis is allowed to use

Three inputs, and no others:

| Input | Where from | What it settles |
| --- | --- | --- |
| The answers | `session_items`, `session_item_assessments` | right/wrong, seconds, target, skill, domain |
| The recording | `session_transcripts.body` | who said what, when |
| The alignment | the two above, plus one offset | which turns belong to which question |

It never reads the question text, the key or the explanation. It is not deciding whether the
student was *right* — the answer rows already know — it is deciding **how they got there**, and the
only evidence for that is what they said.

## Why this step exists at all

The teacher asks for the reasoning on every question, including the ones the student gets right:

> "So while we're discussing any questions, what I want you to do is think out loud. What's your
> approach? What do you read first?"

That is the product. And it is invisible in the answer data — a tick is a tick whether the student
explained it or shrugged. Four of the seven verdicts below exist only because the recording can
tell apart things the grid cannot.

## 3 — speaker roles

Fathom labels a turn with whatever the person typed into Zoom, which is often neither the name on
the account nor the same across two calls, and a recording can carry a third person (the 7 August
one has an observer who says six words). Roles are inferred from the given names and then **shown
as a control the teacher can correct**, because attributing the teacher's explanation to the
student would make every finding below it wrong, silently.

## 4 — alignment

Every `session_item` carries `first_viewed_at`, so the paper already knows the order and the
spacing of the questions. Transcript stamps are minutes into the recording. The only unknown is
where question 1 sits in the recording, because Fathom starts before the lesson does — 150 seconds
of hello on the recording we have, a different number every time.

So there is one dial, the offset, and `suggestOffset` sets it: try every offset up to 20 minutes
and keep the one that leaves the fewest questions with nobody talking about them. Ties go to the
earlier offset, since a late one can always fake coverage by sweeping the tail of the call into the
last question's window. If under two thirds of questions end up with the student speaking in them,
the page says so — that is the offset being wrong, not the lesson being quiet.

This is the load-bearing step. Asking a model "which part of this conversation is about question 7"
is where invented attributions come from, and it is not a question anyone has to ask.

## 5a — markers

Per student turn, matched on phrases. The patterns are the student's own idiom, not a general model
of English — "not B for Bombay" is how *this* student eliminates — and each hit keeps the line that
raised it.

| Marker | Reads | Example from the recording |
| --- | --- | --- |
| `elimination` | narrowing before choosing | "It's not A, not C, it's D, skeptics" |
| `reasoned` | a reason was given at all | "because there's no religious connection" |
| `self_correction` | a first read overturned | "wait, wait, hold up. If it's wrong, I'm gonna figure out the right one" |
| `second_guess` | the answer wobbled | "I think it's B, but it could very well be C" |
| `uncertainty` | a word or idea missing | "I have no idea what B means though" |
| `rule_named` | the method could be named | "in elimination process, whenever extreme language is used, it is wrong" |
| `misread` | the stem was read past | "I thought the question was asking… I didn't read the distinct" |

Alongside them, one number: **talk share** — the student's words over all words on that question. A
wrong answer where the teacher did 80% of the talking was *explained to her*, which is a different
finding from one she worked out and still missed.

## 5b — the verdict

One per question. Right/wrong comes from the answer row; which of the two branches comes from the
markers.

| Verdict | Right? | Reached when | What the grid alone would say |
| --- | --- | --- | --- |
| `understood` | ✓ | a reason was given | tick |
| `self_corrected` | ✓ | a first read was overturned | tick |
| `unexplained` | ✓ | a letter, no reason | tick |
| `misread` | ✗ | read past the stem | cross |
| `talked_out_of_it` | ✗ | had it and wobbled | cross |
| `reasoned_wrong` | ✗ | method held, concept did not | cross |
| `guessed` | ✗ | no reasoning offered | cross |
| `not_covered` | — | the student never speaks in the window | — |

`unexplained` is the one worth arguing about, and it is the reason the teacher asks on the right
answers too. Three ticks nobody could account for is not an 18/18 story.

## 5c — findings

Rolled up per domain, into the two written columns of the evaluation grid, and per session into
Time management and Engagement. A finding is a sentence, the question numbers behind it, and the
student's longest turn from those questions as the quote.

Strengths are drawn from `understood`, `self_corrected`, elimination on correct answers, and naming
the rule. Gaps from `unexplained`, `misread`, `talked_out_of_it`, `reasoned_wrong`, `guessed`,
stated uncertainty, and low talk share on a miss.

Two session-level counts survive into the summary because the teacher asks about them out loud:
the share of the hour the student did the talking, and how often a second guess ended up wrong.

## 6 — the teacher

Findings are buttons. Clicking one appends its sentence to the box it belongs to; the quote sits
under it so the sentence can be checked before it goes in. Nothing is written into the report by
the analysis, and nothing is published without the teacher pressing publish.

That is the same rule the rest of the engine keeps, stated for this step: **the numbers are
computed, the words are the teacher's, and no sentence appears that cannot be pointed at.**

## Checked against the recording it was built for

Run over the 7 August transcript with the eighteen seeded questions, every question aligns — the
student speaks in all 18 windows — and the verdicts land on the teacher's own diagnosis chips for
all five misses:

| Q | Verdict | The teacher's chip | The teacher's note |
| --- | --- | --- | --- |
| 5 | `reasoned_wrong` | `concept_gap` | main idea is the central message, not what the poem does |
| 6 | `reasoned_wrong` | `concept_gap` | anchored on one line, missed the paraphrase |
| 8 | `talked_out_of_it` | `careless_error` | "she had C in hand and stayed on B" |
| 9 | `misread` | `misread_question` | "read past *distinct*" |
| 14 | `reasoned_wrong` | `concept_gap` | going on what sounds right rather than a rule |

Two patterns had to be tightened to get there, and both are worth recording because they are the
failure mode of this whole approach:

- **`self_correction` first matched "wait" and "actually"**, which is how anyone talks. It fired on
  two questions in three and the finding meant nothing. It now matches a reversal — "but then I
  saw", "first I thought", "now I'm realising" — and fires on two.
- **`talked_out_of_it` first fired on any wobble.** It swallowed the concept gaps: on the two
  literary misses the student wobbles, but the teacher does 55% of the talking. A wobble now only
  counts as talking herself out of it if she was the one doing the talking, which is what separates
  "she had it and lost it" from "she did not have it".

A pattern that fires on everything is worse than no pattern, because it reads as a finding.

## The PDF

**Save as PDF** on `/sessions/:id/report` drops the app furniture and prints the report as it
appears on screen, heading and all, with cards kept off page breaks. There is no separate document
to keep in step with the data, which is the point: the PDF a parent receives is the report,
rendered.

## Where an LLM would go, and where it would not

Nothing above needs a model, which is why nothing above has one — it runs offline, it is unit
tested, and the same transcript gives the same findings twice.

The place a model earns its keep is step 6: turning four accepted findings into one paragraph a
parent reads, given the findings and their quotes as the only permitted input. That is phrasing,
not fact. The rules it would run under are already written up in
[`docs/05-report-engine.md`](../05-report-engine.md) — structured output, an evidence allowlist,
quotes string-matched against the actual turn, and every number substituted rather than generated.

What a model must never be given is step 4. Alignment is a lookup; asking for it is asking for a
guess with a citation attached.

## Rehearsing it

`supabase/migrations/0022_transcript_rehearsal.sql` seeds the 7 August paper as a **test** — the
same eighteen questions, in the order the recording works through them — plus a session already
open for the student to sit. Sit it, then paste the transcript on the write-up page.

The transcript is deliberately not seeded. Pasting it is the step being rehearsed.
