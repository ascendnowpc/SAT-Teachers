# 05 — The Report Engine

The commercial differentiator. Everything upstream exists so that this can be produced without
the teacher writing it and without the AI inventing it.

## The problem being solved

> "Teachers are professionals and they have it all in their head, so the client can't know
> without a proper report."

Two constraints pull against each other:

- The teacher will not write 45 minutes of prose per session. If the report costs real time it
  will be skipped, or it will become a template with the names swapped.
- The parent will not accept — and should not accept — AI-generated narrative about their
  child. A fluent paragraph that is subtly wrong is worse than no report at all.

The resolution is that **the AI never supplies facts; it only supplies phrasing.** Facts come
from the database. Every sentence in the report is anchored to a row.

## The evidence chain

```
report
 └── report_sections     overview · pace · strengths · gaps · skill_breakdown · recommendations
      └── report_claims  one assertion each
           └── report_claim_evidence  →  session_item_id   (what the student did)
                                     →  transcript_segment_id  (what was said, timestamped)
```

**A claim with zero evidence rows cannot be published.** This is enforced on the publish path,
not left to reviewer diligence. "Proof for the client" is a database constraint.

In the parent-facing view every claim carries a marker; expanding it shows the actual question,
the actual selection, and the actual quote. A parent who wants to verify a sentence can.

## Two tiers of claim

**Tier 1 — derived, no AI involved.** Computed directly by SQL. These are not opinions and
cannot be wrong:

- accuracy overall, by domain, by skill, by difficulty
- pace: median time vs `target_seconds`, by domain and difficulty
- the pace × correctness quadrant (see `docs/02-domain-model.md`)
- elimination quality: how often the student eliminated the correct answer; how often they
  reduced to two and then chose wrong
- difficulty progression across the session — where the escalation held and where it broke
- movement against previous sessions for the same student

Tier 1 alone is already a stronger report than most tutoring companies produce. **It works with
no transcript at all**, which matters because transcripts will sometimes be missing.

**Tier 2 — narrative, AI-drafted, teacher-approved.** Explains *why* the Tier 1 numbers look the
way they do, using the transcript and the teacher's diagnosis chips. Always cited. Always
reviewed.

## Transcript pipeline

```
upload (Zoom VTT | plain paste | Otter)
   │
   ├─► parse → transcript_segments (speaker_label, start_ms, end_ms, text)
   │
   ├─► speaker mapping — VTT carries display names; a paste needs one confirmation screen.
   │                     Map each label to teacher | student | other, once, remembered per pair.
   │
   ├─► TIMESTAMP ALIGNMENT  ◄── the load-bearing step
   │
   └─► per-item transcript windows, ready for drafting
```

### Timestamp alignment

The question that makes or breaks the report is *"which part of the conversation is about
question 7?"* Asking an LLM to figure that out from content alone is unreliable and is where
hallucinated attributions come from.

We do not have to ask. Every `session_item` already carries `published_at`, `answered_at`,
`revealed_at` and `discussed_at`. Transcript timestamps are relative to
`transcripts.recording_started_at`. Converting to wall clock and intersecting the two gives, for
each item, the exact span of conversation that occurred while it was on screen — with the
**post-reveal window** (`revealed_at → next publish`) being where the teaching actually happens
and where the best quotes live.

This is close to free, and it makes attribution a lookup instead of a guess. The LLM is then
asked a much smaller and much safer question: *"here are 40 seconds of transcript about this
specific item — summarise what the student understood."*

Clock drift between the recording and the app is handled with a single adjustable offset the
teacher can nudge if quotes look shifted; alignment confidence is stored per segment and
low-confidence segments are excluded from quoting.

### What is built

Steps up to and including alignment are built and running on the write-up page, and so is the
layer above them: the recording is read into per-question verdicts and per-domain findings, each
carrying its questions and the student's own words. It is deterministic — no model, no network —
which is why it can be unit tested and why the same transcript gives the same findings twice.
[`reference/transcript-analysis.md`](reference/transcript-analysis.md) is the whole structure:
roles, markers, verdicts, findings, and the line between what is computed and what the teacher
writes.

What follows below is the tier-2 drafting layer, which is not built. It is the step where a model
turns accepted findings into a parent-facing paragraph — phrasing, never facts.

## Drafting

Input to the model, per section:

1. The Tier 1 computed facts (JSON — the skeleton)
2. Aligned transcript segments for the relevant items, each with its id
3. The teacher's diagnosis chips and notes
4. The skill taxonomy and the student's history

Constraints:

- **Structured output.** JSON matching the claim schema, not prose.
- **Evidence allowlist.** The prompt supplies the only valid `session_item_id`s and
  `transcript_segment_id`s. Every claim must cite ≥1.
- **Post-validation.** Claims citing an id outside the allowlist are dropped, not repaired.
  Quotes are string-matched against the actual segment text; a quote that does not match
  verbatim is dropped. Both are logged, and a rising drop rate is a prompt-quality signal.
- **Numbers are never generated.** Any figure in narrative text is a token substituted from
  Tier 1 (`{{accuracy.craft_and_structure}}`), never written by the model.

That last rule removes the most common and most damaging failure mode — a confidently wrong
statistic in a document a parent is reading.

## Report structure

Organised by the **four Reading & Writing domains the teacher actually tests against** —
Information and Ideas · Expression of Ideas · Standard English Conventions · Craft and Structure
— because that is how the teacher thinks and how progress is tracked between sessions.

1. **Session at a glance** — date, duration, subject, items attempted, accuracy, pace summary
2. **Speed** — pace by domain against target; the pace × correctness quadrant. A separate
   section because speed is explicitly one of the things being assessed
3. **Comprehension and method** — how the student approached passages: summaries given,
   elimination behaviour, whether options were narrowed before choosing. Quotes the student's
   own words and eliminations
4. **Domain breakdown** — the four domains, each with accuracy, pace, and the specific items
5. **What went well** — cited claims
6. **What to work on** — cited claims, each tied to a skill and a next action
7. **Progress** — movement since the last session, per domain
8. **Next steps** — teacher-confirmed

Section 3 is the one that answers *"what did we actually buy?"*, and it exists only because
elimination and summary data are captured during the session. It cannot be reconstructed after
the fact.

## Review and publish

`draft` → `in_review` → `published`

The teacher sees the draft with every claim, its evidence, and its origin (`ai` / `teacher`).
They can edit any claim (marking it `authored_by: teacher`), delete claims, or add their own
with evidence attached. Publishing requires every claim to hold evidence.

**Nothing reaches a parent without a teacher pressing publish.** The AI drafts; the professional
signs. That is both the quality control and the honest description of what the product is.

## Degraded modes

| Missing | Result |
| --- | --- |
| No transcript | Tier 1 only — still a real report, marked as such. **This must work well**, because it is what happens on a busy week |
| Transcript, no timestamps (plain paste) | Content-based alignment with lower confidence; quoting restricted to high-confidence matches |
| No diagnosis chips | Narrative leans on eliminations, pace and reasoning text; noted as reduced detail |
| Session with 2 items | Report is proportionate — no manufactured trend claims from a sample of two |

## Reuse beyond the session report

The same pipeline produces a **monthly/programme report** by widening the window from one
session to many. No new engine — same claims, same evidence, larger `session_id` set. Worth
noting now because it affects nothing structurally today and is the obvious upsell later.
