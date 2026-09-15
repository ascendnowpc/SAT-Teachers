-- ============================================================================
--  0045 — a suspended account cannot sign in at all
--
--  0044 gave an admin one write: switch an account off.  Off meant is_active =
--  false, which every policy in the schema reads, so a suspended teacher lost
--  every row in the database at once.  What it did NOT do is stop them signing
--  in: the password still worked, the session still started, and they landed on
--  a product with nothing in it.  That is the right amount of data (none) and
--  the wrong door.  Somebody you have removed should be told the account is
--  closed, not left clicking around an empty copy of it.
--
--  So suspending now also bans the auth user.  GoTrue refuses a sign-in while
--  `banned_until` is in the future, and their open sessions are deleted on the
--  way out, so the tab they already had stops refreshing too.
--
--  The one distinction this migration has to draw: OFF IS NOW TWO THINGS.
--
--    pending    is_active = false, suspended_at null
--               A new teacher nobody has approved.  They must be able to sign
--               in — that is how they reach the screen that says so.
--
--    suspended  is_active = false, suspended_at set
--               An admin took the account away.  No sign-in at all.
--
--  Before this they were the same column and the same answer, which put a
--  removed teacher at the top of the admin's approval queue as if they were
--  new.  suspended_at is what tells them apart, on the screen and here.
-- ============================================================================

alter table profiles add column if not exists suspended_at timestamptz;

comment on column profiles.suspended_at is
  'When an admin took this account away. Null for an account that is merely not approved yet — that one can still sign in, to be told so.';

-- ------------------------------------------------------ approve / suspend ---
-- Same signature, same grants, same two rules as 0044 (admin only, never your
-- own row). What is new is the second half: the profile and the auth user are
-- changed together, because "suspended" that only holds in one of them is a
-- door that is locked on one side.
create or replace function public.set_profile_active(p_profile uuid, p_active boolean)
returns profiles
language plpgsql security definer set search_path = public as $$
declare
  v_row    profiles;
  v_active boolean := coalesce(p_active, false);
begin
  if not is_admin() then
    raise exception 'only an admin can approve or suspend an account';
  end if;

  -- An admin may not switch themselves off: the last admin doing that locks
  -- the role out of the product with no way back but the SQL editor.
  if p_profile = auth.uid() then
    raise exception 'you cannot change your own account here';
  end if;

  update profiles
     set is_active    = v_active,
         suspended_at = case when v_active then null else now() end
   where id = p_profile
   returning * into v_row;

  if v_row.id is null then raise exception 'no such account'; end if;

  -- A roster student has no auth user to ban; there is simply nothing to do.
  if exists (select 1 from auth.users u where u.id = p_profile) then
    -- A hundred years rather than 'infinity': banned_until is read back into a
    -- Go timestamp by the auth server, and not every driver on that path parses
    -- an infinite one. A century is indistinguishable from forever to anybody
    -- trying to sign in, and it parses everywhere.
    update auth.users
       set banned_until = case when v_active then null else now() + interval '100 years' end
     where id = p_profile;

    -- Banning stops the next sign-in; it does not reach into a tab that is
    -- already open. Dropping their sessions does: the refresh fails, and the
    -- access token they are holding is worth nothing anyway, because is_active
    -- is false and every policy in the schema asks it.
    if not v_active then
      if to_regclass('auth.sessions') is not null then
        execute 'delete from auth.sessions where user_id = $1' using p_profile;
      end if;
      if to_regclass('auth.refresh_tokens') is not null then
        execute 'delete from auth.refresh_tokens where user_id = $1::text' using p_profile;
      end if;
    end if;
  end if;

  return v_row;
end $$;

revoke execute on function public.set_profile_active(uuid, boolean) from public, anon;
grant  execute on function public.set_profile_active(uuid, boolean) to authenticated;

comment on function public.set_profile_active(uuid, boolean) is
  'An admin approves a pending teacher, or suspends an account. Suspending also bans the auth user and drops their sessions, so the password stops working. Admin only, and never their own row.';

-- ------------------------------------------------- nobody suspends themself --
-- 0044's guard, with the new column in it. Same reasoning: this is a column
-- that decides what other people may do, so it is not the account holder's.
create or replace function public.profiles_guard_identity()
returns trigger
language plpgsql security definer set search_path = public as $$
begin
  if auth.uid() is null or is_admin() then
    return new;
  end if;

  if new.role is distinct from old.role then
    raise exception 'a role is not something an account sets for itself';
  end if;
  if new.display_id is distinct from old.display_id then
    raise exception 'a display id is issued, not chosen';
  end if;
  if new.is_active is distinct from old.is_active then
    raise exception 'an account is activated by an admin';
  end if;
  if new.suspended_at is distinct from old.suspended_at then
    raise exception 'a suspension is lifted by an admin';
  end if;

  return new;
end $$;

-- A trigger function has no business on the REST surface. Calling it there only
-- ever raises "trigger functions can only be called as triggers", so this is
-- tidying rather than a fix — but it is the sort of tidying that keeps the
-- project's own security linter quiet enough to be worth reading. The trigger
-- itself is unaffected: EXECUTE is checked when a trigger is created, not each
-- time it fires.
revoke execute on function public.profiles_guard_identity() from public, anon, authenticated;
