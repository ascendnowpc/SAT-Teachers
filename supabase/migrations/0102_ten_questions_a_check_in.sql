-- ============================================================================
--  0102 — ten questions a check-in
--
--  The section-tracker scope settles 0089's "10 or 12?" at ten: at ten
--  questions one question is worth about ten points of a hundred, which is
--  the arithmetic a parent can follow. A new targeted test — a check-in —
--  starts at 10: 3 easy, 3 medium and 4 hard, easiest first, as every set is
--  balanced already (lib/targetedSet).
--
--  The clock on each question starts at a minute in English and a minute and
--  a half in Math, close to the real SAT's pace. That default lives in the
--  booking form (lib/targetedDraft), not here: each test keeps its own clock
--  on targeted_tests.question_seconds, and a teacher still changes it.
--
--  As in 0069 and 0089, only a subject still on the old default moves: one an
--  admin has set elsewhere stays where they set it.
-- ============================================================================

alter table progress_config alter column default_set_size set default 10;
update progress_config set default_set_size = 10 where default_set_size = 12;
