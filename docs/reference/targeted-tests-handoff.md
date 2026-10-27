# Targeted skill tests + improvement tracking — handoff

The working plan for the feature, what is built, and what is next. Branch:
`claude/determined-hawking-2mxpmf`. Read this, the README and the migrations
named below before continuing.

## Goal

Show the PC (and through them the parent), with data, whether a student improved on a weak
skill after focused teaching, or has plateaued. The teacher controls the whole process; the
platform computes and never decides. No more mocks are pushed.

## Decisions (agreed with the product owner)

| | |
| --- | --- |
| **Bank depth** | No skill has 10 questions across the three tests (max 9, most 2–6). Build to spec, **default set size 5** (config, so it can go back to 10), and the builder says how many are missing. Plus a **practice pool** per subject: questions by skill, outside the three tests, never shown in a lesson. |
| **Diagnostic** | `sessions.mode = 'diagnostic'`. Baseline per skill = the earliest completed diagnostic with answers on the skill; if none, the first targeted test is the baseline. Existing data backfilled: each student's earliest completed session per subject. Later diagnostics count as sessions between, not plotted. |
| **Score mapping** | Per subject, in `progress_config`. Default points (0,20) (5,30) (8,40); above the last point the last slope carries on (9 ≈ 43, 10 ≈ 47); an admin can add points. Raw score is scaled to 10 (`correct / reached × 10`). **Always show the raw score beside the mapped one.** |
| **Targeted write-up** | No diagnostic form, no teacher feedback. Its own simpler report, computed analysis only. **No auto-email**; the manual "Send to PC" stays. |
| **PC visibility** | A targeted test shows in the PC's progress view as soon as it is completed. The computed verdict shows once it exists; the override and the shared summary only once shared. |
| **Multiple teachers** | Progress and baseline include every teacher's sessions, via a staff/PC RPC that returns numbers only. |
| **Overall timer** | Unreached questions are left out of the score and listed as "not reached". |
| **Long vs short** | Words in passage + stem: English 75, Maths 40 (config). |
| **Live link payload** | Becomes a fixed list of fields — as the **last** step, with its own tests. |
| **Mock scores** | Later, after the five steps. |
| **Config** | Admin only, from a small settings panel. |
| **Verdicts** | Improved ≥ +5, Minimal change −4..+4, Declined ≤ −5 (config). Minimal: "No significant improvement after [X] sessions. This may be a ceiling for this skill, or the student may need to work deeper on method and unlearn habits." Declined: flag for review; a dip is common when learning a new technique. Every verdict carries a caveat computed from the mapping ("on 5 questions, one question is worth about N points"). |
| **Draft / share** | Summaries and overrides keep a draft and a shared copy; Share copies the draft; an edit after sharing changes the draft only. The PC has **no table policy** on notes, summaries or overrides and reads the shared copies through `student_progress` only. |
| **Student** | Forward only, answer or time out, no skipping, no back. "Question 2 of 5" and both timers shown; no level, difficulty, key or result. After Publish results they see their questions, answers and explanations as in a lesson; level scores and verdicts are for staff and PC only. |

## Built

**Step 1 — schema.** Migrations, each with a contract that reads all PASS:

| Migration | What | Contract |
| --- | --- | --- |
| `0059_a_session_says_what_it_is_for` | `sessions.mode` (live / diagnostic / targeted), the backfill, `set_session_mode`, a guard trigger (targeted only via `create_targeted_session`, never changes mode or subject), the lesson's controls refuse targeted (`show_one_question`, `teacher_answer_item`, `teacher_start_session`), and `session_reports` refuses the form/generated stamps for targeted | `modes.sql` (26) |
| `0060_a_practice_pool` | `question_sets.kind = 'practice'`, one active pool per subject (no level), `create_question_in_set` gains `p_difficulty` (required for the pool along with a skill; refused if it disagrees with a test's level); old signature dropped | `practice_pool.sql` (13) |
| `0061_a_test_on_one_skill` | `targeted_tests`, `targeted_set_items` (teacher/admin only), `session_items.time_limit_seconds`, `session_item_assessments.timed_out`, `progress_config`, `skill_notes`, `skill_summaries`, `verdict_overrides`; RPCs `targeted_candidates`, `create_targeted_session`, `save_targeted_set`, `set_progress_config`, `save_skill_note`, `save_skill_summary`, `share_skill_summary`, `save_verdict_override`, `share_verdict_override` | `targeted.sql` (66) |

All earlier contracts still pass. `tools/local-db/rebuild.sh` builds a scratch database from
every migration on a plain local Postgres and runs every contract.

**Step 2 — set builder.** `apps/web/src/lib/targetedSet.ts` + `targetedSet.test.ts`. Input is
`targeted_candidates` rows. The mix is 30/30/40 easy/medium/hard by largest remainder, ties to the
easier level (5 → 2/1/2, 10 → 3/3/4, 3 → 1/1/1). Within a level: unseen before seen, then printed
order — the three tests before the pool, the easier test first, then the place in the test. A short
level borrows from its nearest level with spare (medium first for easy and for hard; easy first for
medium), only after every level has taken its own share; `describeSet` names it ("a balanced set
needs 1 medium; 0 unseen — 1 short; borrowed 1 from easy", "4 of 5 available"). `swapOptions`:
same level, then nearer levels, unseen before seen, a seen question only with repeats allowed;
`swapAt` puts a cross-level swap back in its level's place.

**Step 3 — student-paced test.** `0062_a_targeted_test_runs_on_the_clock` + `targeted_link.sql`
(47). Internal: `targeted_lock` (row lock per test), `targeted_time_out`, `targeted_expire(session,
slack)`, `targeted_show_next`, `targeted_step`, `targeted_start`, `targeted_answer`,
`targeted_payload`. Doors: `start_session_by_token`, `answer_by_token`, `session_by_token`,
`finish_by_token` and `teacher_finish_session` branch on mode (the lesson branch unchanged); new
`advance_by_token` (anon) and `targeted_tick` (staff, expires only, never shows a question);
`start_session_as_student` and `submit_answer` refuse a targeted test. Decisions taken in it:
- a question's clock is `question_seconds`, else the question's `target_seconds`, else none (the
  overall clock alone) — no invented default;
- after an expiry the next question's clock starts when it is actually shown (on the student's
  next read), so a closed tab does not come back to a chain of expired questions;
- the overall clock running out times out the question on screen; **End test and leaving set it
  aside (voided) = not reached**, like the questions never shown (which have no row at all);
- an answer up to 2 s late is graded; later, it is recorded as timed out and the call succeeds;
  an advance is accepted from 1 s before the clock and otherwise moves nothing (returns false);
- a timed-out item is `answered`, no option, `is_correct = false`, `timed_out = true`, elapsed =
  its full limit, so `reveal_answered_items` reveals it as incorrect.

Front end: `lib/targetedClock.ts` (server-time countdowns, tested), `lib/targetedPayload.ts`
(the fixed payload into the screen's shapes, tested), `gateway.advance`, the hook's clock offset,
`StudentStage`'s targeted branch ("Question 2 of 5", both clocks, auto-advance at zero, its own
lobby, leave and end-screen copy: answered / ran out of time / not reached), and
`pages/TargetedConsole.tsx` (the watch, End test, Publish results; ticks every 5 s while live).

**Step 4 — analytics and progress.** `lib/progress.ts`, `lib/targetedAnalytics.ts` (+ vitest),
`0063_a_students_progress_in_numbers` + `student_progress.sql` (20).
- `student_progress(student, subject)`: staff (any teacher, admin) and the student's own active
  PC. Returns sessions (id, mode, status, at, teacher), targeted settings with `set_count`, the
  items put in front of the student (answered/revealed/voided — never one still on screen) with
  ids, section, skill, level, target, `is_correct`, `timed_out`, elapsed — **no option, no key, no
  words** — the config, and the **shared** copies of summaries and overrides only. The browser
  reads the question rows by id under RLS (staff: the bank; PC: `pc_has_question`) when it needs
  words or format.
- `progress.ts`: `mapScore` (linear, end slopes carried on), `rawOutOf10`, `verdictFor` /
  `verdictText` (the agreed wording), `onePointWorth` + `caveatText` — the step through the
  mapping, up and down from the score, averaged; a step's caveat uses the smaller of its two
  points. `progressLine`: baseline = earliest completed diagnostic with answers on the skill
  **dated before the first test on it**, else the first test; sessions between = completed live +
  diagnostic, any teacher, excluding plotted points; a shared override is marked stale when its
  `previous_session_id` is not the point before; `hint` = "N sessions since the last test on this
  skill". A test with nothing reached is not plotted.
- `targetedAnalytics.ts`: score over reached, not reached, timed out; by difficulty; time vs
  target (question's `target_seconds`, else the clock it was shown with; timed-out left out);
  rushed (wrong, < `RUSHED_RATIO`), gap (wrong, took its time), hesitation (right, >
  `LABOURED_RATIO`); long vs short (`wordsIn` passage + stem ≥ `long_words`); formats via
  `parsePassage`/`hasTable` (paired > table > figure > underlined > prose > none); plain-English
  insights with counts; `longPattern` pooled across tests, gated by `pattern_min_each` and
  `pattern_gap`.
- `paper.ts` now imports `./passage.ts` / `./types.ts` so the edge bundle can follow it.

**Step 5 — screens.**
- New session form: "What it is for" — Diagnostic / Lesson / Targeted test. Diagnostic is the
  default until the student has a non-cancelled diagnostic in the subject, read through
  `student_progress` (every teacher). Targeted is for a roster student only (the builder needs
  their history); `components/TargetedBuilder.tsx` builds and swaps the set and books through
  `create_targeted_session`. Lessons and diagnostics insert with `mode`.
- **Since: two kinds, kept apart.** The product owner wants diagnostics and targeted tests only,
  and separate. Lesson is gone from booking (a later diagnostic counts between tests exactly as a
  lesson did); Sessions has a Diagnostics tab and a Targeted tests tab (`?tab=targeted`), each
  with its own columns and New button; `/sessions/new` books a diagnostic and
  `/sessions/new/targeted` a targeted test, each its own form (`SessionNew kind=…`). Old `live`
  rows are filed with the diagnostics (`lib/sessions.ts` `kindOf`). The list embeds
  `targeted_tests(section, skill, set_size)` for the skill column. No migration.
- Targeted console, once over: analysis, the line on the skill (with the long pattern), the
  override panel (against the point before), and the private note + PC summary
  (`components/ProgressPanels.tsx`).
- `/students/:id/progress` (`pages/StudentProgress.tsx`): every skill with a completed test;
  staff get the notes panels, the PC reads only. Linked from the targeted console and the
  admin/PC session page.
- `/admin/settings` (`pages/AdminSettings.tsx`, sidebar "Settings"): `progress_config` per
  subject through `set_progress_config`; `parsePoints`/`formatPoints` in `lib/progress.ts`.
- Practice pool: listed per subject on Questions (and not counted as strays); `/tests/:id` and
  the question form write into it with a chosen difficulty and a required skill.
- Targeted report (`pages/TargetedReport.tsx`, from `/sessions/:id/report`) and PDF
  (`lib/targetedReport.ts`, drawn by `_shared/pdf.ts`, which gained an optional `kicker`,
  `summaryTitle` and `extra` sections and skips an empty summary). **Send to PC** only, by hand:
  `notify_pc_report` refuses a targeted test without `again`, keys `report_emails` by the send
  time, reads the line through `student_progress` on the service role (0063 grants it), and the
  email says "targeted test" (`pcMail.ts`, `targeted: true`). No migration was needed for this.
- Progress section on the lesson report page and in its PDF (`reportPdfDoc`'s `progress`).
- README: "Targeted tests and progress", the contracts, and the order for 0059–0063.
- **Not yet done: redeploy `notify_pc_report`** (`supabase functions deploy notify_pc_report
  --no-verify-jwt`, or `node tools/bundle-edge-function.mjs notify_pc_report` for the Management
  API). Safe before the migrations: a lesson's path only adds `student_progress`, best effort.

**Step 6 — live link payload.** `0064_the_link_sends_a_fixed_list` + `link_payload.sql` (32).
`session_by_token` builds a lesson's payload from named fields — exactly what `StudentStage`,
`QuestionView` and `asked.ts` read — instead of `to_jsonb` of whole rows. Gone from the link:
`level`, `level_size`, `levels_sat`, `teacher_notes`, `teacher_id`/`student_id` and the profiles'
ids, `created_at`, `student_reasoning`, `marked_for_review`, and on the question `difficulty`,
`difficulty_rationale`, `source_ref`, `section`, `skill`, `target_seconds`, `created_by`,
`status`. The targeted branch is 0062's.

## Supabase

The live project (`SAT`, `nsvaeqcsrlrvsmynwfft`) had migrations **up to 0057**. **0058** (a teacher
signs up and is in) is merged in the repo but not applied there; nothing here depends on it, and
applying it is the product owner's decision (it removes teacher approval).

**Why `apply_migration` times out.** The Supabase MCP tool asks for a confirmation before any SQL
holding a destructive statement (`drop …`, `delete …`, even inside a function body), and that
confirmation never reaches the session, so the call waits out its 60 s and nothing is applied. SQL
without one goes through in a second. So:

- the parts of `0059` with no destructive statement were applied through the tool as
  `a_session_says_what_it_is_for`, `_2` and `_3` (the column, the backfill, the guard — written
  `create or replace trigger` rather than `drop trigger` + `create trigger`, same effect —
  `set_session_mode`, `assert_not_targeted`, the gates on `teacher_answer_item` and
  `teacher_start_session`, and the `session_reports` trigger);
- the rest — `show_one_question`'s gate (it keeps 0057's `delete` of staged rows), `0060`
  (`drop constraint`, `drop function`) and `0061` (`delete` inside `write_targeted_set`) — goes in
  through the SQL editor, one transaction that also writes their `schema_migrations` rows
  (`a_session_says_what_it_is_for_4`, `a_practice_pool`, `a_test_on_one_skill`);
- later migrations: whatever has no destructive statement goes through the tool; the rest through
  the SQL editor the same way.

All of `0059`–`0061` are safe for the app that is deployed now: the new column has a default, the
new `create_question_in_set` argument is optional, and every existing screen filters the bank on
`level is not null`, so the pool stays out of them.

## Next

All six steps are built. Left: apply 0059 (rest)–0064 to Supabase (see above), redeploy
`notify_pc_report`, then mock scores (agreed for after the five steps).

## Rules to keep

Keys stay in `question_keys`; every figure computed on read; times UTC via `lib/time.ts`; new
SECURITY DEFINER functions revoked from PUBLIC, anon and authenticated by name and granted back
explicitly, with the grant rows in the contract; admins pass `assert_session_teacher`; the
live-session flow is untouched.
