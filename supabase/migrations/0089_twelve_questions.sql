-- ============================================================================
--  0089 — twelve questions
--
--  The brief's mini-test is 10 to 15 questions, and 0069 started a new
--  targeted test at 10 while Ascend Now chose (the brief review's "10, 12 or
--  15?"). They chose 12. A new test starts at 12 now — 4 easy, 3 medium and 5
--  hard, or 4 of each skill on a test of three — and at a minute a question
--  with one to spare, the whole test is 13 minutes. An admin still sets the
--  default per subject in Settings, and a teacher still sets each test.
--
--  As in 0069, only a subject still on the old default moves: one an admin
--  has set elsewhere stays where they set it. (One set to 10 by hand cannot
--  be told from the default, and moves with it.)
-- ============================================================================

alter table progress_config alter column default_set_size set default 12;
update progress_config set default_set_size = 12 where default_set_size = 10;
