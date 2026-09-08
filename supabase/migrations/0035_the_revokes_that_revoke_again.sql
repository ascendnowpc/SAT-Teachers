-- ============================================================================
--  0035 — the same revoke bug, a third time, and what actually fixes it
--
--  0018 found that `revoke execute … from anon` does nothing while PUBLIC
--  still holds the grant, and fixed three functions by revoking from PUBLIC.
--  0028 found the same thing again on load_session_level and fixed it the
--  same way.  0033 and 0034 were written with both of those in front of me
--  and still got it wrong, because revoking from PUBLIC is only half of it:
--
--      alter default privileges in schema public
--        grant execute on functions to anon, authenticated, service_role;
--
--  is set on this project (pg_default_acl, grantor postgres).  Every function
--  created in `public` is therefore born with an EXPLICIT grant to `anon`,
--  which has nothing to do with PUBLIC and survives revoking from it.  So
--  `revoke … from public` leaves anon holding execute, and the check that
--  looks right — no PUBLIC grant, an explicit grant to authenticated — reads
--  as correct while the door stands open.
--
--  For most of what 0033 and 0034 added this is untidy rather than wrong:
--  create_student and set_student_pc check is_teacher(), the teacher_* three
--  call assert_session_teacher, and all of them tell an anonymous caller to
--  go away.  Three of them are neither:
--
--      open_session_now(uuid)      no check — by design, its callers check
--      record_answer(uuid, …)      no check — by design, its callers check
--      end_session_now(uuid)       no check — by design, its callers check
--
--  which is the shape 0028 was written about, and the same consequences.
--  Holding a session id, an anonymous caller could:
--
--    * flip somebody else's session live and publish its first question;
--    * end a test in progress, voiding every question not yet answered;
--    * and, holding an item id, submit an answer on a question that is not
--      theirs — graded, timed, and opening the next question behind it.
--
--  This revokes from `anon` and `authenticated` by name as well as from
--  PUBLIC, which is what it takes.  Nothing is granted back to the three:
--  they are called from inside SECURITY DEFINER functions, which run as the
--  owner and need no grant — the reasoning 0018 and 0028 both used.
--
--  publish_one_item (0023) is the fourth instance and the oldest. It has no
--  check either — it is called from inside submit_answer and the level
--  loader — and it ends with `revoke … from anon, authenticated`, which is
--  the 0018 spelling that revokes nothing. Holding an item id, an anonymous
--  caller could publish a staged question: not merely skipping the student
--  ahead, but making a question they are not supposed to be able to read
--  readable, which is the one line the whole schema is built to hold.
--
--  The rest of the list is the tidying those two migrations deferred, for
--  the functions this change is already touching: an RPC that no client
--  calls should not be callable by a client, and one that only a signed-in
--  teacher can use should not be reachable by `anon` at all, even to be
--  refused. session_link.sql asserts every line of it, so the next function
--  written in this schema fails a test rather than repeating this note.
--
--  What is deliberately NOT here: the report and session RPCs 0018 left
--  granted to PUBLIC. Every one of them opens with assert_session_teacher or
--  a check on auth.uid(), so an anonymous caller gets an exception rather
--  than a session, and tightening them is its own pass with its own test —
--  which is exactly what 0018 said, and it is still true.
-- ============================================================================

-- --------------------------------------------------- the default first ----
-- sessions.access_token defaults to new_session_token(), and a column default
-- is evaluated as the role doing the INSERT — so revoking that function from
-- `authenticated` would stop a teacher creating a session at all, with
-- "permission denied for function new_session_token" on a screen that has
-- nothing to do with tokens.
--
-- Granting it back to authenticated would work and is the wrong shape: it
-- puts a function on the client's surface for the sake of a default nobody
-- calls by hand. The expression is two lines long, so the default carries it
-- directly and needs no privilege on anything.
alter table sessions alter column access_token set default
  (replace(gen_random_uuid()::text, '-', '') || replace(gen_random_uuid()::text, '-', ''));

-- ------------------------------------------------------------- internal ----
-- No caller outside the database. No grant, to anybody.
-- new_session_token() stays for the backfill 0033 runs and for reading;
-- nothing outside the schema calls it now.
revoke execute on function public.new_session_token()  from public, anon, authenticated;
revoke execute on function public.open_session_now(uuid) from public, anon, authenticated;
revoke execute on function public.end_session_now(uuid)  from public, anon, authenticated;
revoke execute on function public.session_for_token(text) from public, anon, authenticated;
revoke execute on function public.record_answer(
  uuid, answer_option, answer_option[], smallint, text
) from public, anon, authenticated;

-- 0023's, and the oldest of the four. Its own revoke named the roles and left
-- PUBLIC — and the default privilege — standing.
revoke execute on function public.publish_one_item(uuid) from public, anon, authenticated;

-- ------------------------------------------------------ signed in only ----
-- These all refuse an anonymous caller on their own — is_teacher() is false
-- and auth.uid() is null — but being refused is not the same as being unable
-- to ask, and the surface is smaller without them on it.
revoke execute on function public.create_student(text, text, text) from public, anon;
revoke execute on function public.set_student_pc(uuid, text)       from public, anon;
revoke execute on function public.teacher_start_session(uuid)      from public, anon;
revoke execute on function public.teacher_finish_session(uuid)     from public, anon;
revoke execute on function public.teacher_answer_item(
  uuid, answer_option, answer_option[], smallint, text
) from public, anon;

revoke execute on function public.start_session_as_student(uuid)  from public, anon;
revoke execute on function public.finish_session_as_student(uuid) from public, anon;
revoke execute on function public.submit_answer(
  uuid, answer_option, answer_option[], smallint, text
) from public, anon;

grant execute on function public.create_student(text, text, text) to authenticated;
grant execute on function public.set_student_pc(uuid, text)       to authenticated;
grant execute on function public.teacher_start_session(uuid)      to authenticated;
grant execute on function public.teacher_finish_session(uuid)     to authenticated;
grant execute on function public.teacher_answer_item(
  uuid, answer_option, answer_option[], smallint, text
) to authenticated;
grant execute on function public.start_session_as_student(uuid)  to authenticated;
grant execute on function public.finish_session_as_student(uuid) to authenticated;
grant execute on function public.submit_answer(
  uuid, answer_option, answer_option[], smallint, text
) to authenticated;

-- ----------------------------------------------------------- the link -----
-- The seven that anon is supposed to reach, granted explicitly rather than
-- left to a default privilege that could be changed out from under them.
-- Each one takes the token and checks it; that is the whole permission model
-- and it is stated here rather than assumed.
revoke execute on function public.session_by_token(text)          from public;
revoke execute on function public.start_session_by_token(text)    from public;
revoke execute on function public.set_level_by_token(text, text)  from public;
revoke execute on function public.mark_viewed_by_token(text, uuid)  from public;
revoke execute on function public.mark_decided_by_token(text, uuid) from public;
revoke execute on function public.finish_by_token(text)           from public;
revoke execute on function public.answer_by_token(
  text, uuid, answer_option, answer_option[], smallint, text
) from public;

grant execute on function public.session_by_token(text)          to anon, authenticated;
grant execute on function public.start_session_by_token(text)    to anon, authenticated;
grant execute on function public.set_level_by_token(text, text)  to anon, authenticated;
grant execute on function public.mark_viewed_by_token(text, uuid)  to anon, authenticated;
grant execute on function public.mark_decided_by_token(text, uuid) to anon, authenticated;
grant execute on function public.finish_by_token(text)           to anon, authenticated;
grant execute on function public.answer_by_token(
  text, uuid, answer_option, answer_option[], smallint, text
) to anon, authenticated;
