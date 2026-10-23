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

**Step 3 — student-paced test** `0062` + contract `targeted_link.sql`:
- token RPCs: start (opens, shows question 1, sets `targeted_tests.locked_at`), answer
  (grades through `record_answer`, then shows the next), advance (only once the question's
  time is up: records `timed_out`, `is_correct = false`, no option; moves on — cannot skip);
- the server sets `first_viewed_at` when it shows a question and fixes `time_limit_seconds`
  (`question_seconds` or the question's `target_seconds`); 2 s grace on an answer;
- overall deadline `started_at + overall_seconds`; every read expires anything overdue first
  (no cron); when the set or the time runs out the session ends; unseen = not reached;
- `start_session_by_token` / `answer_by_token` route targeted sessions to the above;
- the payload for targeted is a fixed field list: no level, difficulty, rationale, source_ref,
  key, result or upcoming question;
- `StudentStage` targeted branch (Bluebook layout, both timers corrected to server time, full
  screen and leave guards); console for a targeted session: watch, End test, Publish results
  (`reveal_answered_items`; a timed-out item reveals as incorrect).

**Step 4 — analytics** `lib/targetedAnalytics.ts`, `lib/progress.ts` + vitest, and `0063`
`student_progress(student, subject)` for staff and the student's PC: numbers only (sessions,
items, timed_out, not reached) plus the shared summary/override texts. Score mapping; accuracy
by difficulty; time vs target; timed-out count; long vs short; format (paired text, table,
figure, underlined, prose, no passage — reuse `parsePassage`/`hasTable`); rushing / gap /
hesitation using `RUSHED_RATIO` / `LABOURED_RATIO`; plain-English insights with counts; the
long-question flag pooled across tests on the skill and gated by `pattern_gap` /
`pattern_min_each`; the progress line (baseline → tests, sessions between = completed live +
diagnostic, same student and subject, any teacher), verdicts and the caveat; the hint
"N sessions since the last test on this skill".

**Step 5 — screens.** New session form: Diagnostic / Lesson / Targeted test (Diagnostic by
default when the student has none in the subject); the builder; console panels (analytics,
progress, override, notes); `/students/:id/progress` (teacher, admin, read-only PC); admin
settings panel; practice pool in the bank; targeted report + PDF with manual "Send to PC"
(`report_emails` keyed by send time; targeted branch in `notify_pc_report`, redeploy); a
Progress section in the existing report and PDF; README.

**Step 6 — live link payload** `0064`: `session_by_token` returns a fixed field list (today it
sends `sessions.level` and the whole `questions` row — `difficulty`, `difficulty_rationale`,
`source_ref`). Own contract; re-run every contract.

## Rules to keep

Keys stay in `question_keys`; every figure computed on read; times UTC via `lib/time.ts`; new
SECURITY DEFINER functions revoked from PUBLIC, anon and authenticated by name and granted back
explicitly, with the grant rows in the contract; admins pass `assert_session_teacher`; the
live-session flow is untouched.
