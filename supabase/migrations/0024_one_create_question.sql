-- ============================================================================
--  0024 — one create_question, not two
--
--  0020 added the image with `create or replace function`, which replaces a
--  function of the same *signature* and otherwise makes a new one.  The image
--  argument changed the signature, so the eleven-argument version from 0002
--  was not replaced.  It was left standing beside the twelve-argument one.
--
--  Nothing called it and nothing was wrong on the surface: the app passes all
--  twelve arguments by name, so PostgREST picks the right one every time.  But
--  any caller passing the first nine positionally — which is every one of the
--  SQL contracts in supabase/tests — now matches both, and Postgres refuses to
--  choose:
--
--    ERROR: function create_question(...) is not unique
--
--  So the tests could not run.  The fix is to drop the version 0020 meant to
--  replace; the twelve-argument one defaults p_image_url, which is what made
--  0020 believe every existing caller would keep working.
-- ============================================================================

drop function if exists public.create_question(
  p_subject text, p_section text, p_passage text, p_stem text,
  p_difficulty difficulty_level, p_difficulty_rationale text,
  p_options jsonb, p_correct answer_option, p_explanation text,
  p_passage_underline text, p_skill text
);
