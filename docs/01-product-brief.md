# 01 — Product Brief

## What exists today

Tutoring happens over Zoom. Question content lives in Google Drive as documents full of
**screenshots** of Bluebook-style SAT items, with the difficulty level written next to each
one by hand. During a session the teacher shares a question, the student answers verbally or
in chat, and the teacher runs a diagnostic loop entirely from memory:

| Student answer | What the teacher does |
| --- | --- |
| Correct | Asks *"why did you pick that?"* — probes whether the reasoning was sound or lucky. If sound, escalates difficulty. |
| Correct but shaky reasoning | Stays at the same difficulty, same skill, to confirm. |
| Wrong | Explains the item, re-teaches the concept, then gives another question at the **same** level. |

This works because the teachers are good. The problem is that **none of it is recorded**. The
diagnosis lives in the teacher's head. The paying client — the parent — has no way to see what
their money bought beyond a verbal summary.

## The actual product

Two things, and the second is the one that matters commercially:

1. **A live question-delivery loop** that replaces screenshot-sharing — the teacher publishes
   one question at a time from a tagged bank, the student answers in-app, the answer is captured.
2. **An evidence-backed session report** that turns those captured answers plus the session
   transcript into a document the parent can read, where *every claim is traceable to a
   recorded artifact*.

The first exists to make the second possible. A quiz tool on its own is a commodity; the
report is the thing nobody else has, because nobody else is capturing the structured signal
during the session.

## Design principle: the evidence chain

> No statement in a parent-facing report may exist unless it is backed by a recorded artifact.

An artifact is one of exactly three things:

- **An attempt** — student saw question Q at time T, selected option C, which was right/wrong.
- **A teacher diagnosis** — a one-tap classification the teacher applied during the session.
- **A transcript segment** — a quoted, timestamped line of what was actually said.

This is enforced in the database (a claim row with no evidence rows cannot be published), not
by convention. It is what converts "trust us, we're professionals" into proof.

## Design principle: near-zero teacher friction

The teacher is mid-session, talking to a student. Anything that takes more than one tap will
not get done, and the data will be missing exactly when it matters. Concretely:

- Questions are **staged before the session** and published with one click during it.
- The teacher's diagnosis of *why* an answer went the way it did is **one tap from six chips**,
  not a text box.
- Reasoning capture is pushed to the **student** ("why did you pick that?" as an optional
  field on submit), which is also pedagogically better — it forces articulation.
- The report is **AI-drafted from the captured evidence** and the teacher edits it, rather
  than writing it. Target: 5 minutes of teacher time per report, not 45.

## Who uses it

| Role | Needs |
| --- | --- |
| **Teacher** | Browse bank by subject/domain/skill/difficulty; stage and publish questions live; see answers land in real time; one-tap diagnosis; upload transcript; review and sign off the report. |
| **Student** | Join a session; see one question at a time; answer; optionally say why; see the explanation after the teacher reveals it. |
| **Parent / client** | Read a clear report per session (or per period) showing what was worked on, what improved, what is still weak, with the proof attached. |
| **Admin (Ascend Now)** | Import and author questions; assign difficulty and rationale; manage teachers, students, and enrolments; see programme-level analytics. |

## Explicit non-goals for v1

- No Zoom API integration. The Zoom link is a URL field the teacher pastes. Do not build
  meeting provisioning, recording pull, or attendance sync until the core loop is proven.
- No adaptive engine that auto-selects the next question. The teacher chooses. The system
  *suggests* based on the loop rules, but the teacher stays in control — that is the product.
- No live video/chat inside the platform. Zoom already does it.
- No student-facing self-study mode in v1. It is a natural phase-4 extension (the schema
  supports it), but the paid value is in the tutored session.
