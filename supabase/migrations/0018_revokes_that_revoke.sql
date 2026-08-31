-- ============================================================================
--  0018 — the revokes that never revoked anything
--
--  Every migration since 0005 ends its RPCs with
--
--      revoke execute on function … from anon;
--
--  and every one of them is decorative.  Postgres grants EXECUTE on a new
--  function to PUBLIC, and `anon` is a member of PUBLIC — so revoking from the
--  role while PUBLIC still holds the grant leaves the function callable by
--  anybody with the publishable key.  `has_function_privilege('anon', …)`
--  returns true for all 27 functions in this schema.
--
--  Nothing leaks through it today.  The client-facing RPCs are all
--  SECURITY DEFINER *and* check auth.uid() or is_teacher(), so an anonymous
--  caller gets "not your session" rather than a session; and the loaders are
--  not SECURITY DEFINER, so RLS refuses their writes.  Two locks, one of which
--  was never shut.
--
--  This shuts it for the three functions where the comment in the migration
--  claims it already is: the bank loaders, which write house content, and the
--  teacher assertion they lean on.  Revoking from PUBLIC is the fix; nothing is
--  granted back, because nobody calls these from a client:
--
--    seed_bank_item / seed_paper   called by migrations, as the migration role
--    assert_session_teacher        called from inside SECURITY DEFINER bodies,
--                                  which run as the owner and need no grant
--
--  The rest of the RPCs are deliberately left callable by `authenticated`,
--  which is what the app signs in as.  Their PUBLIC grant is worth tidying too,
--  but not in the same change as a bug fix: is_teacher() is called from inside
--  RLS policies, which evaluate as the *querying* role, so tightening that one
--  changes what a signed-out request gets back and needs its own test pass.
-- ============================================================================

revoke execute on function public.seed_bank_item(
  text, text, text, text, text, difficulty_level, text, jsonb, answer_option, text,
  question_status, text
) from public;

revoke execute on function public.seed_paper(text, text, text, text, text) from public;

revoke execute on function public.assert_session_teacher(uuid) from public;
