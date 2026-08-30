# SAT Teachers — System Plan

A platform for Ascend Now's 1:1 SAT tutoring: a tagged question bank, a live teacher-driven
question loop during Zoom sessions, and an evidence-backed report for the paying parent.

## Read in order

| Doc | What it covers |
| --- | --- |
| [01 — Product Brief](01-product-brief.md) | The problem, the two design principles, who uses it, explicit non-goals |
| [02 — Domain Model](02-domain-model.md) | Entities, the `render_mode` content decision, the session spine, process + speed capture |
| [03 — Architecture](03-architecture.md) | Stack boundary (what earns the Render backend), the security model, realtime |
| [04 — Session Flow](04-session-flow.md) | The live publish → answer → reveal → diagnose loop, and its failure modes |
| [05 — Report Engine](05-report-engine.md) | The evidence chain, timestamp alignment, AI guardrails, degraded modes |
| [06 — Roadmap](06-roadmap.md) | Six phases, each ending in something usable; sequencing risks |
| [07 — Open Questions](07-open-questions.md) | 12 decisions needed, 3 of them blocking |

Supporting material:

- [Source Material Audit](reference/source-material-audit.md) — what is actually in the supplied
  screenshot diagnostic PDFs, and the two gaps they expose
- [English Diagnostic Key Review](reference/english-diagnostic-key-review.md) — where every
  loaded key came from: the seven printed answers that were wrong, and the 40 written from
  scratch
- [`schema/schema.sql`](schema/schema.sql) — proposed DDL
- [`schema/rls.sql`](schema/rls.sql) — proposed row-level security, plus the nine tests that
  form the security contract
- [`../tools/pdf_extract.py`](../tools/pdf_extract.py) — working extractor used for the audit;
  the seed of the phase-1 import pipeline

## The three ideas that hold it together

**1. Rendering is decoupled from behaviour.** `render_mode` lets the existing screenshot
library go in as images on day one while difficulty, skill and correct answer stay structured —
so grading, analytics and reports all work immediately, and items can be upgraded to full text
later without touching another table.

**2. Anything a student must not see lives in a table they cannot read.** Postgres RLS is
row-level, and Supabase Realtime pushes whole rows. Splitting out `question_keys` and
`session_item_grades` makes answer leakage structurally impossible rather than dependent on
every future query being careful.

**3. The report cites or it does not ship.** Every claim links to an attempt, a diagnosis or a
timestamped transcript quote, enforced by a database trigger. The AI supplies phrasing; the
database supplies facts; the teacher signs off.

## Status

Signup, the question bank, and the live session loop are built (migrations `0001`–`0010`), and
applied to the live Supabase project. Both English diagnostics are loaded — 65 items with
passages, options, keys, sections, skills and difficulty — so the bank is no longer empty and the
screenshot deck is no longer stuck behind its missing key. Q1 and Q2 are answered for English;
[Q3](07-open-questions.md) (provenance and licensing) is still open and still blocking for
anything sourced from official practice tests.
