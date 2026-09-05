-- ============================================================================
--  0028 — the level loader is internal, and now actually is
--
--  0027 ends load_session_level with
--
--      revoke execute on function … from anon, authenticated;
--
--  which is the mistake 0018 was written about, made again.  Postgres grants
--  EXECUTE on a new function to PUBLIC; `anon` and `authenticated` are members
--  of PUBLIC; revoking from the roles leaves the PUBLIC grant standing.  So the
--  function was callable by anybody with the publishable key, at
--  /rest/v1/rpc/load_session_level.
--
--  For the other RPCs that would be untidy rather than wrong — they are all
--  SECURITY DEFINER *and* check auth.uid(), so a caller with no business in a
--  session gets "not your session".  load_session_level is the exception, and
--  it is the exception on purpose: its comment says the callers do the
--  permission checks, so it does none itself.  It takes a session id and a
--  level and does the work.
--
--  Which means, until this migration, any signed-in user could pass somebody
--  else's session id and:
--
--    * void the question that student had open, mid-test, losing the answer
--      they were about to give and the clock it was being timed on;
--    * throw away the rest of the level they were working through;
--    * reload them onto any level, at question 1.
--
--  Nothing else in the schema is reachable that way — set_session_level is the
--  door this was hiding behind, and it checks that the caller is the session's
--  student or its teacher.  This shuts the back one.
--
--  seed_level_test goes with it, for the reason 0018 revoked seed_bank_item and
--  seed_paper: it writes house content and only a migration should call it.
--  It is not SECURITY DEFINER, so RLS was already refusing its writes for a
--  signed-in caller — two locks, and this is the one that was never shut.
--
--  Nothing is granted back.  load_session_level is called from inside
--  start_session_as_student and set_session_level, which are SECURITY DEFINER
--  and therefore run as the owner, which needs no grant — the same reasoning
--  that let 0018 revoke assert_session_teacher from PUBLIC without breaking
--  every RPC that calls it.
-- ============================================================================

revoke execute on function public.load_session_level(uuid, text) from public;

revoke execute on function public.seed_level_test(text, text, text, text[]) from public;

-- A loader that only the migration role can call does not need a pinned
-- search_path to be safe, but pinning it costs nothing and takes the function
-- off the linter's list, where it was sitting next to two loaders that have
-- the same shape and the same warning.
alter function public.seed_level_test(text, text, text, text[]) set search_path = public;
