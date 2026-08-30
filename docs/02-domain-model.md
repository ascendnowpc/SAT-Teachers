# 02 — Domain Model

## The three subsystems

```
  CONTENT                    SESSION                      REPORTING
  ─────────                  ─────────                    ──────────
  organizations              sessions                     transcripts
  subjects                   session_participants         transcript_segments
  domains                    session_items  ◄── spine     reports
  skills                     session_item_grades          report_sections
  questions                                               report_claims
  question_options                                        report_claim_evidence
  question_keys  (locked)
  question_assets
```

`session_items` is the spine. Everything the report can say is derived from it. If a fact is
not on that table (or on a transcript segment aligned to it), the report cannot claim it.

---

## Content

### `questions`

The central content decision is **`render_mode`**, which decouples *how a question is
displayed* from *how it behaves*:

| `render_mode` | Stimulus + stem + options come from | When |
| --- | --- | --- |
| `image` | A screenshot (`question_assets`) | Day one — the existing Drive library, imported as-is |
| `structured` | Typed JSON + `question_options` rows | Authored natively, or migrated up from `image` later |

Both modes capture the answer identically — the student clicks A/B/C/D — so **analytics,
grading, the diagnostic loop and the report all work from day one regardless of mode**, and
content can be upgraded item by item without touching another table. This is the single most
important structural choice in the system; without it, either launch waits on months of
retyping, or the platform is permanently stuck with un-searchable images.

Core columns:

| Column | Notes |
| --- | --- |
| `id` | uuid, stable and permanent |
| `organization_id` | multi-tenant from day one (see below) |
| `subject_id` | `english` \| `math` |
| `domain_id`, `skill_id` | the taxonomy; drives every report grouping |
| `render_mode` | `image` \| `structured` |
| `response_type` | `mcq` \| `spr` — **see the Maths note below** |
| `stimulus` | typed JSONB, `structured` mode only |
| `stem` | question text, `structured` mode only |
| `difficulty` | `easy` \| `medium` \| `hard` |
| `difficulty_rationale` | *why* it is that level — teacher-authored, surfaced in reports |
| `source_ref` | e.g. `English Diagnostic Test 3 · Module 1 · Q23` |
| `status` | `draft` \| `needs_key` \| `published` \| `retired` |

`status = needs_key` matters: it is the state every imported screenshot lands in, and it is
what stops an item with no correct answer from being publishable into a live session.

### `stimulus` JSONB shape

Seven stimulus shapes were observed in the source file (see the audit). One typed block covers
all of them:

```jsonc
{
  "blocks": [
    { "type": "attribution", "text": "The following text is from Emily Brontë's 1847 novel Wuthering Heights." },
    { "type": "prose",  "text": "The narrator is bringing a boy named Linton...",
      "spans": [ { "kind": "underline", "start": 118, "end": 123 } ] },
    { "type": "poetry", "lines": ["Eternities before the first-born day,", "..."] },
    { "type": "notes",  "items": ["The \"colossal heads\" are the most famous...", "..."] },
    { "type": "table",  "caption": null,
      "headers": ["Country", "Foreign-born Population (%)", "Males in Population (%)"],
      "rows": [["United Arab Emirates", "88", "68.76"]] },
    { "type": "blank",  "placeholder": "______" },
    { "type": "figure", "asset_id": "..." }
  ]
}
```

Blanks and underlines are structural, not typographic — the renderer decides how to show them,
and the report can quote the exact underlined span when explaining an error.

### `question_keys` — a separate table, deliberately

`question_keys` holds `correct_option` and the per-option rationales (why each distractor is
wrong). It is a **separate table with teacher-only RLS**, not columns on `questions`.

Postgres RLS is row-level, not column-level. If the correct answer were a column on
`questions`, any student query that returns the question row would return the answer with it.
Splitting the table makes the leak structurally impossible rather than dependent on every
future query being written carefully.

> **Rule that follows from this:** *any field a student must not see lives in a table a
> student cannot read.* It applies twice — here, and to `session_item_grades` below.

### Taxonomy: `subjects → domains → skills`

Tables, not enums, because Maths is coming and the report groups by skill. Seeded from the
official College Board structure:

**Reading & Writing** — Information and Ideas (Central Ideas & Details, Command of Evidence:
Textual, Command of Evidence: Quantitative, Inferences) · Craft and Structure (Words in
Context, Text Structure & Purpose, Cross-Text Connections) · Expression of Ideas (Rhetorical
Synthesis, Transitions) · Standard English Conventions (Boundaries, Form Structure & Sense)

**Math** — Algebra · Advanced Math · Problem-Solving and Data Analysis · Geometry and
Trigonometry

### The Maths note — `response_type`

The brief says "it's all MCQ structure". That is true of Reading & Writing, but roughly a
quarter of real SAT Maths items are **student-produced response** (grid-in) — the student types
a number, there are no options. Adding `response_type` (`mcq` | `spr`) now costs one enum
column; discovering it after the answer-capture UI, the grading service and the report are all
built around four buttons costs a refactor of the spine table. It stays unused until Maths
lands.

---

## Session

### `sessions`

`id`, `organization_id`, `teacher_id`, `scheduled_start`, `duration_minutes`, `meeting_url`
(the pasted Zoom link — no Zoom API in v1), `subject_id`, `status`
(`scheduled` | `live` | `completed` | `cancelled`), `started_at`, `ended_at`, `teacher_notes`.

`started_at` is load-bearing: it is the wall-clock anchor that lets relative transcript
timestamps be aligned to question attempts. See `docs/05-report-engine.md`.

### `session_items` — the spine

One row per question put in front of a student in a session. This table *is* the record of
what happened.

| Column | Purpose |
| --- | --- |
| `session_id`, `question_id`, `student_id`, `sequence_no` | identity |
| `status` | `staged` → `published` → `answered` → `revealed` → `discussed` |
| `published_at`, `first_viewed_at`, `answered_at`, `revealed_at`, `discussed_at` | the timeline; also the transcript-alignment windows |
| `selected_option` | what the student picked (or `spr_response` for grid-ins) |
| `eliminated_options` | options the student struck out, **in the order they struck them** |
| `student_summary` | optional one-line summary of the passage, when the teacher asks for it |
| `student_confidence` | 1–3, captured at submit |
| `student_reasoning` | optional free text: *"why did you choose this?"* |
| `teacher_diagnosis` | **one tap**, see below |
| `teacher_note` | optional |
| `revealed_result` | `correct` \| `incorrect`, `NULL` until the teacher reveals |

`staged` exists so the teacher can queue questions **before** the session and publish each with
one click during it, instead of searching the bank while the student waits. That is the
concrete workflow win over sharing screenshots from Drive.

### Capturing *process*, not just the answer

From the teacher (Malya): *"I make them break down and summarise the passage and then eliminate
the options to know how they comprehend the passage."*

The thing being assessed is the **method**, not the final letter. Two fields make that method
visible without adding any teacher effort:

**`eliminated_options`.** The Bluebook UI in the source screenshots already has an
answer-eliminator (the `ABC` strikethrough control, top-right of every item). Rebuilding it
means students work the way they will on test day *and* the elimination sequence is recorded
for free. It is the single richest process signal available:

> On Q13 the student eliminated A and D immediately — both correct eliminations — then chose
> between B and C and picked wrong. The gap is narrow discrimination between close distractors,
> not comprehension of the passage.

No transcript is needed for that claim. It falls out of two arrays and a timestamp. Correctness
alone could never produce it.

**`student_summary`.** For passage-based items the teacher can flip on "ask for a one-line
summary" when publishing. The student summarises before answering — which is the drill the
teacher already runs verbally — and the summary is stored next to the attempt. Comprehension
becomes directly quotable in the report instead of inferred.

Both are optional per item. The teacher decides when to demand the process and when to just
run speed.

### Timing is a first-class measure, not telemetry

The same teacher: *"I test the student on their speed."*

So elapsed time is not a diagnostic afterthought — it is one of the things being assessed, and
it needs a benchmark to be meaningful. `questions.target_seconds` holds the expected working
time for an item (seeded per skill × difficulty, then corrected against real data as
`observed_median_seconds` accumulates). Every attempt therefore yields a **pace ratio**, and
pace crossed with correctness is far more diagnostic than either alone:

| Pace | Correct | Reading |
| --- | --- | --- |
| Fast | ✅ | Fluent — escalate |
| Fast | ❌ | Rushing; check `eliminated_options` — likely no elimination at all |
| Slow | ✅ | Accurate but not yet automatic — the classic score ceiling |
| Slow | ❌ | Genuine concept gap, not a speed problem |

"Slow but correct" is invisible to a score report and is exactly what parents are paying to
have found. It is one subtraction away once `first_viewed_at` and `answered_at` are recorded.

### `session_item_grades` — teacher-only

Holds `is_correct` and `graded_at`. Separate table, teacher-only RLS, for the same reason as
`question_keys`: the student's own `session_items` row is pushed to their browser over
Realtime, so a correctness column on it would leak the answer the instant they submitted.
On reveal, the backend copies the result into `session_items.revealed_result`, which the
student *is* allowed to see. **Realtime becomes safe by construction rather than by care.**

### `teacher_diagnosis` — the highest-value field in the system

After discussing an item, the teacher taps one chip:

`solid_reasoning` · `lucky_guess` · `careless_error` · `concept_gap` · `misread_question` · `ran_out_of_time`

These live in a seeded `diagnosis_tags` lookup table scoped to the organization — **not a
hardcoded enum** — so Ascend Now can tune the vocabulary to how its teachers actually think
without a migration. The UI shows six chips; tapping one is enough, tapping two is allowed.

This is the knowledge that currently only exists in the teacher's head, captured at the moment
it is formed, for one tap. It is what turns a report from *"6 out of 10"* into *"errors are
concentrated in inference items where the student misread the scope of the claim — see Q4,
Q11, Q17."*

It also drives the loop the brief describes:

| Result | Diagnosis | Suggested next |
| --- | --- | --- |
| Correct | `solid_reasoning` | **escalate** difficulty, same skill |
| Correct | `lucky_guess` | **hold** level, same skill — confirm it |
| Incorrect | `concept_gap` | re-teach, then **hold** level, same skill |
| Incorrect | `careless_error` / `misread_question` | **hold** level, different item |

The system *suggests*; the teacher decides. Suggestion only — the teacher's judgement is the
product, and an auto-advancing engine would take it away.

---

## Reporting

```
report
 └── report_sections        (overview | strengths | gaps | skill_breakdown | recommendations)
      └── report_claims     (text, claim_type, authored_by: ai|teacher, edited_at)
           └── report_claim_evidence  →  session_item_id  |  transcript_segment_id
```

`report_claim_evidence` is the evidence chain made physical. The publish path refuses any
report containing a claim with zero evidence rows — so "proof for the client" is a database
constraint, not a promise.

`reports.status`: `draft` → `in_review` → `published`. AI drafts, **teacher signs off**, then
the parent can see it. Never AI-direct-to-parent.

---

## Cross-cutting

**Multi-tenancy.** `organization_id` on every core table from day one. Ascend Now is one
tenant today; adding the column now is free, retrofitting it across a live schema with RLS
policies is not.

**Auth and roles.** Supabase Auth. `profiles` extends `auth.users` with `role`
(`admin` | `teacher` | `student` | `parent`) and `organization_id`. `enrolments` links students
to teachers; `guardian_links` links parents to students and gates report access. Students are
often minors without their own email — provisioning is an open question (see
`docs/07-open-questions.md` Q5).

**Immutability.** Once `answered_at` is set, `selected_option` is frozen. The student may
change their selection freely *before* submitting; submission is the lock. Time-on-question is
`answered_at − first_viewed_at`, which is itself a reportable signal.
