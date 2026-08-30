-- ============================================================================
--  0003 — close what the database linter found
--
--  1. touch_updated_at ran with a mutable search_path.
--  2. handle_new_user and is_teacher are SECURITY DEFINER and sit in the public
--     schema, so PostgREST exposed them at /rest/v1/rpc/<name> to anonymous and
--     signed-in callers alike.  Neither is meant to be called over the API.
--
--  is_teacher keeps EXECUTE for `authenticated`: RLS policy expressions are
--  evaluated as the querying user, so revoking it there would break every
--  question policy that calls it.  Revoking from `anon` is enough — an
--  anonymous caller has no rows to reach either way.
-- ============================================================================

create or replace function public.touch_updated_at()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  new.updated_at := now();
  return new;
end;
$$;

-- The trigger fires as the auth service's own role, which is unaffected by
-- these revokes; only the REST-facing roles lose the ability to call it.
revoke execute on function public.handle_new_user() from anon, authenticated;
revoke execute on function public.is_teacher()      from anon;
