# 07 — Open Questions

Ordered by how much they block. Q1–Q3 gate Phase 1 and should be answered before building
starts.

---

### Q1 — Where do the answer keys come from? **(blocking)**

The supplied PDF has no correct answers and no explanations, and Bluebook screenshots never
show them. The entire session loop branches on right vs wrong, so an item without a key cannot
be used. Someone has to supply keys for all 40 items, and for every item after them.

- Do keys exist somewhere else already (a separate sheet, the original test source)?
- If not, who keys them, and at what rate? This is the long pole for the whole project.
- Do we also want per-distractor rationales ("why B is wrong")? They make reports much sharper
  — a wrong answer becomes explainable rather than just wrong — but they roughly double the
  authoring effort. **Suggestion:** correct answer + one explanation is mandatory; distractor
  rationales optional, added for high-traffic items first.

### Q2 — Where do the difficulty labels live? **(blocking)**

The brief says difficulty is written next to each question, but this file contains **28
characters of text in total** — just "Module 1" and "Module 2". The labels are not in it. Are
they in the Google Doc wrapper, a separate sheet, the Maths file, or only in the teachers'
heads?

Difficulty is not decorative here: escalate-on-correct / hold-on-wrong is the whole pedagogical
loop, and it cannot run without it. Also worth deciding now: is difficulty a property of the
**item** (fixed) or of the **student's level** (relative)? The schema assumes fixed per item,
with `observed_p_value` accumulating later to check the labels against reality.

### Q3 — Where did these questions come from? **(blocking, non-technical)**

If these are College Board / official practice items, hosting and serving them from a
commercial platform is a licensing question, not a technical one. Original or licensed items
change nothing about the build and remove the exposure entirely. Worth confirming before the
library is loaded, not after.

---

### Q4 — What counts as "target time" for an item?

Speed is explicitly assessed, so pace needs a benchmark. Options: a flat per-skill default
(SAT R&W averages ~71 s/question), per-difficulty tuning, or teacher-set per item. **Suggestion:**
seed per `skill × difficulty` from the teachers' experience, let admins override per item, and
correct against `observed_median_secs` once real data exists.

### Q5 — How do students get accounts?

Students are often minors and may not have their own email. Options: admin-provisioned
email+password; magic link to a parent's email; a short join code per session with no account
at all. **Suggestion:** admin-provisioned accounts — attempts must be attributable to a person
across sessions for progress tracking, which rules out anonymous join codes.

### Q6 — Should parents get accounts, or links?

Full accounts are more work and more support burden; signed expiring links per report are
simpler and probably enough at first. The schema models `parent` as a real role either way, so
this is a UI decision that can be deferred. **Suggestion:** signed links in v1, accounts when
parents start asking to see history.

### Q7 — One student per session, or groups?

The schema supports many students per session (`session_participants`, and `session_items`
carries `student_id`). The teacher console UI is much simpler for 1:1. Is group tutoring a real
near-term case? **Suggestion:** build the UI 1:1, keep the schema plural.

### Q8 — Are transcripts consistently available?

The report is meaningfully richer with one. Do teachers reliably record Zoom sessions and can
they export the VTT? If it is going to be inconsistent, the Tier 1 (no-transcript) report is not
a degraded fallback — it is the main path, and should be built accordingly. Also: does anyone
need to consent to session recording, and is that already handled?

### Q9 — What does the parent actually want to see?

This plan assumes: what was worked on, how fast, what improved, what is still weak, with proof.
Worth validating against one or two real parents before phase 3 — the report is the product's
commercial edge and it is cheap to check the assumption now. Is there an existing report format
(even an informal one) that clients already like?

### Q10 — Does the student see the explanation after reveal?

The schema supports it (`question_keys.explanation`, released on reveal). But if the teacher is
explaining it live on Zoom, showing text at the same time may split attention. **Suggestion:**
teacher-controlled toggle — reveal the result immediately, release the written explanation
separately, so it becomes revision material after the lesson rather than a distraction during
it.

### Q11 — Do students need to review past sessions?

Being able to revisit answered questions and explanations is obviously valuable for revision,
and the data is all there. But it changes the RLS story: a student would then read
`session_items` from ended sessions, and the explanation text would need release rules. Not
hard, but it should be a decision rather than a surprise.

### Q12 — Time zones?

Sessions are timestamptz and `profiles.timezone` defaults to `Asia/Singapore`. Confirm where
teachers, students and parents actually are — a report header showing the wrong local date is
a small bug with outsized credibility cost.

---

## Resolved

**Q2 — difficulty labels.** Difficulty is set per question by the teacher when authoring, with
an optional note on *why* it sits at that level. Not taken from the source PDF.

**"Domain" vs "section".** The four Reading & Writing groupings are College Board *content
domains*, and each question belongs to exactly one — that is what lets a report say a student
is weak in Craft and Structure. Ascend Now's teachers call them **sections**, so the product
uses that word throughout (`questions.section`). The structure is unchanged: one per question.

If teachers actually score every question against all four rather than filing it under one,
that is a different feature — a rubric, with four scores per attempt — and the schema would
need a `question_scores` table rather than a column. Worth confirming.

**Subject naming.** `mathematics`, not `math`.

**Identity codes.** `BATO26-1`: three letters of the given name, one of the surname, the
two-digit join year, then a per-prefix counter starting at 1, unbounded.
