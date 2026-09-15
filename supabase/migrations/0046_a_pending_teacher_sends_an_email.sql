-- ============================================================================
--  0046 — a pending teacher sends an email
--
--  0044 put new teacher accounts behind an approval, which is the right gate
--  and a silent one.  The person waiting cannot tell anybody they are waiting:
--  they are stopped at the sign-in screen, and the only place their name
--  appears is a queue inside a portal an admin may not open for a week.  A gate
--  nobody is told about is indistinguishable from a broken product.
--
--  So the row says it.  A teacher profile written inactive fires this trigger,
--  which calls the `notify_pending_teacher` edge function, which re-reads the
--  profile on the service role and mails whichever admins have an address.
--
--  Three things this is careful about, in order of how much they would hurt:
--
--    1. A SIGNUP MUST NEVER FAIL BECAUSE OF A MAIL.  pg_net queues the request
--       and returns immediately — nothing here waits on an HTTP call inside the
--       transaction that is creating an account — and the whole call is wrapped
--       so that any error at all (extension missing, no URL configured, a
--       schema this database does not have) is swallowed.  The worst case is
--       the product it was before: a queue somebody has to look at.
--
--    2. NO SECRET LIVES IN THE DATABASE.  The call carries no service key and
--       no bearer token, because the function does not need one: it takes an
--       id, and it will only ever mail admins about a profile that really is a
--       pending teacher.  Somebody who guesses a uuid can make an admin receive
--       a second copy of a true notice, and that is the whole of the exposure.
--
--    3. THE URL IS CONFIGURATION, NOT SCHEMA.  It differs per project, so it
--       lives in a row rather than in this file, and a database without that
--       row simply does not send mail.  The table is readable by nobody: RLS is
--       on and there are no policies, so only the service role and the owner
--       can see it.
-- ============================================================================

-- pg_net puts itself in `net` whatever you ask for, so that is where the call
-- below looks for it. Naming the wrong schema is not a loud failure here: the
-- handler around the call swallows it and the signup goes through without a
-- notification, which is exactly the shape of bug worth writing a line about.
create extension if not exists pg_net;

-- ------------------------------------------------------------- the config --
create table if not exists app_config (
  key        text primary key,
  value      text not null,
  updated_at timestamptz not null default now()
);

comment on table app_config is
  'Per-deployment settings the database itself needs. Not readable by any client: RLS is on and no policy exists, so only the service role and the owner can see it.';

alter table app_config enable row level security;

-- ------------------------------------------------------------ the trigger --
create or replace function public.notify_pending_teacher()
returns trigger
language plpgsql security definer set search_path = public as $$
declare v_url text;
begin
  -- Only the case this is for: a teacher who has just arrived and cannot get in.
  if new.role <> 'teacher' or new.is_active then
    return new;
  end if;

  select value into v_url from app_config where key = 'functions_url';
  if v_url is null then
    return new;
  end if;

  begin
    perform net.http_post(
      url     := rtrim(v_url, '/') || '/notify_pending_teacher',
      body    := jsonb_build_object('profile_id', new.id),
      headers := '{"Content-Type": "application/json"}'::jsonb
    );
  exception when others then
    -- A notification is worth nothing next to an account. If the queue, the
    -- extension or the function is not there, the signup still succeeds and
    -- the admin still has the list in the portal.
    raise warning 'could not queue the pending-teacher notification: %', sqlerrm;
  end;

  return new;
end $$;

revoke execute on function public.notify_pending_teacher() from public, anon, authenticated;

comment on function public.notify_pending_teacher() is
  'Queues an email to the admins when a teacher account arrives pending. Best effort in every direction: it never fails a signup and it carries no secret.';

drop trigger if exists profiles_notify_pending_teacher on profiles;
create trigger profiles_notify_pending_teacher
  after insert on profiles
  for each row execute function public.notify_pending_teacher();

-- ----------------------------------------------------------- wiring it up --
-- Per deployment, in the SQL editor, once. Without it nothing is sent and
-- nothing breaks:
--
--   insert into app_config (key, value)
--   values ('functions_url', 'https://<project-ref>.supabase.co/functions/v1')
--   on conflict (key) do update set value = excluded.value, updated_at = now();
--
-- And the function needs a mail provider to have anything to send with:
--
--   supabase secrets set RESEND_API_KEY=...
--   supabase secrets set MAIL_FROM='Ascend Now <no-reply@yourdomain>'
--   supabase secrets set APP_URL=https://sat-teachers.vercel.app
--   supabase functions deploy notify_pending_teacher --no-verify-jwt
