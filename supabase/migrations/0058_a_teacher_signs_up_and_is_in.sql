-- ============================================================================
--  0058 — a teacher signs up and is in; the admins are told
--
--  0044 wrote every new teacher account inactive and made an admin approve it
--  before it could see anything. That gate is gone, on purpose: anybody who
--  makes a teacher account can use it at once, and the admins hear about it
--  instead of being asked about it.
--
--  Three pieces:
--
--    1. The signup trigger writes a teacher ACTIVE, as it does a student. The
--       role is still coerced to teacher|student, so a signup still cannot
--       mint an admin or a PC.
--
--    2. Anybody already waiting is let in. A teacher who is inactive and was
--       never suspended (suspended_at null, 0045) is exactly the account the
--       approval queue was holding; with the queue gone there is nothing left
--       that could ever let them in. A suspended teacher stays suspended.
--
--    3. The admins are told. 0046's trigger mailed them only about an account
--       that arrived inactive, which no account does any more. It is replaced
--       by one that fires on every new teacher profile and calls
--       `notify_new_teacher`, the same way and with the same care: pg_net
--       queues the request rather than making it, no secret is carried, and
--       any failure at all is a warning and a signup that still worked.
--
--  What does not change: an admin can still suspend any account (0045), which
--  bans the auth user and drops their sessions — that is now the only answer
--  to a teacher account nobody recognises. set_profile_active keeps its name,
--  its grants and its rules; it just has no approval left to give.
-- ============================================================================

-- --------------------------------------------------------- the signup -----
-- 0055's trigger, with the last value of the insert changed from
-- `resolved <> 'teacher'` to true.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  requested text := coalesce(new.raw_user_meta_data->>'role', 'student');
  resolved  user_role;
  full_name text := coalesce(new.raw_user_meta_data->>'full_name', '');
begin
  if exists (select 1 from public.profiles p where p.id = new.id) then
    return new;
  end if;

  resolved := case when requested = 'teacher' then 'teacher'::user_role
                   else 'student'::user_role end;

  insert into public.profiles (id, role, display_id, full_name, email, is_active)
  values (new.id, resolved,
          build_display_id(full_name, resolved, current_date),
          full_name, new.email, true);
  return new;
end;
$$;

revoke execute on function public.handle_new_user() from public, anon, authenticated;

comment on function public.handle_new_user() is
  'Promotes a new auth user into a profile, unless the profile was made first (a PC, 0055). The role is coerced to teacher|student, and the account is active from the start (0058).';

-- ------------------------------------------------- nobody left waiting -----
-- No JWT here, so the identity guard (0045) lets the migration role write
-- is_active. The notify trigger below fires on INSERT only, so this does not
-- mail the admins about accounts that already exist.
update profiles
   set is_active = true
 where role = 'teacher'
   and not is_active
   and suspended_at is null;

-- -------------------------------------------------- telling the admins -----
drop trigger if exists profiles_notify_pending_teacher on profiles;
drop function if exists public.notify_pending_teacher();

create or replace function public.notify_new_teacher()
returns trigger
language plpgsql security definer set search_path = public as $$
declare v_url text;
begin
  if new.role <> 'teacher' then
    return new;
  end if;

  select value into v_url from app_config where key = 'functions_url';
  if v_url is null then
    return new;
  end if;

  begin
    perform net.http_post(
      url     := rtrim(v_url, '/') || '/notify_new_teacher',
      body    := jsonb_build_object('profile_id', new.id),
      headers := '{"Content-Type": "application/json"}'::jsonb
    );
  exception when others then
    -- A notification is worth nothing next to an account.
    raise warning 'could not queue the new-teacher notification: %', sqlerrm;
  end;

  return new;
end $$;

revoke execute on function public.notify_new_teacher() from public, anon, authenticated;

comment on function public.notify_new_teacher() is
  'Queues an email to the admins when a teacher account is made. Best effort in every direction: it never fails a signup and it carries no secret.';

drop trigger if exists profiles_notify_new_teacher on profiles;
create trigger profiles_notify_new_teacher
  after insert on profiles
  for each row execute function public.notify_new_teacher();

-- ------------------------------------------------------ the one switch -----
comment on function public.set_profile_active(uuid, boolean) is
  'An admin suspends an account, or lets a suspended one back in. Suspending also bans the auth user and drops their sessions, so the password stops working. Admin only, and never their own row.';

-- ----------------------------------------------------------- wiring it up --
-- The app_config row 0046 asked for is the same one this reads. The function
-- is new, so it has to be deployed, and the old one can go:
--
--   supabase functions deploy notify_new_teacher --no-verify-jwt
--   supabase functions delete notify_pending_teacher
