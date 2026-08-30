# 06 — Build Roadmap

Sequenced so that each phase ends in something usable in a real lesson, and so the riskiest
assumption is tested as early as it can be. Durations assume one full-time developer; they are
sizing, not commitments.

---

## Phase 0 — Foundations · ~1 week

Monorepo (`apps/web`, `apps/api`, `packages/shared`, `packages/db`, `tools`). Supabase project
with schema + RLS from `docs/schema/`. Auth and the four roles. Seeded taxonomy (subjects,
domains, skills, diagnosis tags). CI running migrations, typecheck, lint and the **RLS test
suite**. Skeleton deploys to Vercel and Render.

**Done when:** a teacher and a student account can log in to their respective empty shells on
production URLs, and the nine RLS tests pass in CI.

> Write the RLS tests in phase 0, not later. They are the security contract, and they are much
> harder to add once there is UI depending on the current behaviour.

---

## Phase 1 — Question Bank · ~2 weeks

The import pipeline (PDF → page raster → item screenshots → `questions` rows with
`render_mode = 'image'`, `status = 'needs_key'`) — `tools/pdf_extract.py` is the working
prototype. An admin authoring UI: crop/confirm each item, tag domain + skill + difficulty, write
`difficulty_rationale`, enter the correct option and explanation, set `target_seconds`. Bank
browse with filters. A `needs_key` work queue.

**Done when:** all 40 English items are `published` with keys, difficulty and rationales, and a
teacher can find "Craft and Structure · Words in Context · medium" in under five seconds.

> **This phase is gated on content decisions, not code** — the source PDF has no answer key and
> no difficulty labels (see `docs/reference/source-material-audit.md`). Resolve
> `docs/07-open-questions.md` Q1–Q2 before this phase starts, or the tooling will be finished
> and the bank still empty. Realistically the keying work is the long pole for the whole
> project; it should start in parallel with phase 0.

---

## Phase 2 — The Live Session Loop · ~2–3 weeks · **the core**

Sessions CRUD with Zoom link and time. Teacher console: stage a queue, publish one item,
watch the live board. Student view: one question, the **answer eliminator**, confidence,
optional reasoning and summary, submit. Realtime both ways with the 10s poll fallback.
Grading service on Render. Reveal. One-tap diagnosis. The suggestion engine. Void/unpublish.

**Done when:** a teacher runs a real lesson with a real student on the platform instead of
Drive screenshots, end to end, and afterwards the board shows every answer, elimination, time
and diagnosis without anyone having typed a summary.

> Ship phase 2 to **one teacher** first and watch a live session over their shoulder. Every
> friction assumption in this plan — that staging is worth it, that one-tap diagnosis actually
> gets tapped mid-lesson, that the eliminator gets used — is a guess until then. Cheap to
> confirm now, expensive to discover in phase 3.

---

## Phase 3 — Transcript and Report · ~3 weeks

Transcript upload (Zoom VTT + plain paste), parsing, speaker mapping, timestamp alignment.
**Tier 1 computed metrics first and standalone** — accuracy, pace, elimination quality,
difficulty progression — then the AI drafting layer with the evidence allowlist and
post-validation. Teacher review and edit. Publish. Parent view + PDF export.

**Done when:** a parent reads a report from a real session and every claim in it can be expanded
to the question, the answer and the quote behind it.

> Build and ship **Tier 1 without any AI** before touching the model. It is most of the value,
> it is the degraded mode when a transcript is missing, and having it working makes the AI layer
> a clearly-scoped addition rather than the thing the report depends on.

---

## Phase 4 — Maths · ~2–3 weeks

Maths taxonomy. KaTeX rendering. Figures and diagrams. **Grid-in (`spr`) answers** — the
schema already carries `response_type`, but the answer UI, grading (numeric equivalence,
accepted forms) and reporting need real work. Import the Maths library.

> Do not treat Maths as "the same thing with different questions". Grid-ins are a different
> answer surface, numeric equivalence is a real grading problem (is `0.75` the same as `3/4`?
> yes), and diagrams raise the accessibility bar. Budget for it honestly.

---

## Phase 5 — Compounding value · ongoing

- **Structured-text migration** — upgrade items from `image` to `structured`, AI-assisted OCR
  with human confirmation. Unlocks search, mobile, accessibility, and per-distractor analytics.
  Incremental by design; no other table changes.
- **Programme reports** — same engine, wider window. Likely the strongest upsell.
- **Observed difficulty** — nightly rollups of `observed_p_value` and `observed_median_secs`,
  so the hand-assigned difficulty labels can be validated against what students actually do.
  Teachers finding out that an item they called "medium" is answered correctly 34% of the time
  is genuinely useful, and it is nearly free once attempts accumulate.
- **Async homework** — publish items outside a live session. The schema supports it today
  (a `session` with no `meeting_url`); it is a UI and notification problem.
- **Parent portal**, teacher analytics, mobile student view.

---

## Sequencing risks

| Risk | Why it bites | Mitigation |
| --- | --- | --- |
| **Content entry is the real bottleneck** | 40 items here; hundreds needed. Keying and difficulty-rating is human work that no amount of tooling removes | Start keying during phase 0. Track "items published per week" as a first-class metric alongside velocity |
| Teachers keep using Drive | The platform must be *faster* than pasting a screenshot, not just better | Phase 2 ships to one teacher and is measured on whether they choose it unprompted for lesson two |
| Report quality disappoints | An AI report that reads as generic destroys the credibility the product is sold on | Tier 1 first; evidence enforcement in the schema; teacher sign-off mandatory |
| Copyright | If these items are College Board originals, hosting and redistributing them in a commercial platform carries real exposure — a product risk, not a technical one | Confirm provenance early (Q3). Original or licensed items change nothing technically and remove the question |
| Scope creep into Zoom | Meeting provisioning, recording pull, attendance sync all look small and are not | `meeting_url` stays a text field until something concrete demands otherwise |
