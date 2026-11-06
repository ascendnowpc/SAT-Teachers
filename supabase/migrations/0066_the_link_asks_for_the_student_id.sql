-- ============================================================================
--  0066 — the link asks for the student ID
--
--  A session's link (/s/<access_token>) used to be the whole of a student's
--  access: whoever held it was the student. It is the address now, and the
--  student ID is the login. Opening the link asks for the ID, and only the
--  right one is handed the session's entry key — which is what every link
--  call takes from here on.
--
--    access_token  in the link the teacher sends, unchanged. On its own it
--                  opens nothing; it can only be asked "whose test is this?"
--                  through enter_by_token.
--    entry_key     handed back by enter_by_token for the right ID, and kept
--                  by that browser for the visit. session_for_token reads
--                  it, so every *_by_token door checks it without any of
--                  them changing shape — their p_token is the entry key now.
--
--  The ID is no secret on its own — BATO26-1 is built from a name and a
--  year — so it is the second half of the check and never the first: without
--  the link it opens nothing, and without it the link opens nothing either.
--
--  Safe for the app being served before it in one direction only: the old
--  app sends the access token to the *_by_token doors, which no longer
--  accept it, so a student on the old app is told the link is not valid.
--  Apply it with the app that asks for the ID, not ahead of it.
-- ============================================================================

-- ------------------------------------------------------------- the key -----
-- The default carries its expression inline, as access_token's does since
-- 0035: a column default runs as the role doing the INSERT, and a helper
-- function would need granting to every teacher for the sake of a default.
alter table sessions add column if not exists entry_key text;
update sessions
   set entry_key = replace(gen_random_uuid()::text, '-', '') || replace(gen_random_uuid()::text, '-', '')
 where entry_key is null;
alter table sessions alter column entry_key set default
  (replace(gen_random_uuid()::text, '-', '') || replace(gen_random_uuid()::text, '-', ''));
alter table sessions alter column entry_key set not null;

create unique index if not exists sessions_entry_key_key on sessions (entry_key);

comment on column sessions.entry_key is
  'What the student''s browser holds once they have opened the link and given '
  'their student ID (enter_by_token). Every *_by_token function takes it. The '
  'link''s access_token alone opens nothing (0066).';

-- ------------------------------------------------------- every door --------
-- Every *_by_token function starts here, so this one change is the whole of
-- the check. A key that is not one is "that link is not valid", as a bad
-- token always was — no hint about what exists behind it.
create or replace function public.session_for_token(p_token text)
returns uuid
language plpgsql security definer set search_path = public as $$
declare v_id uuid;
begin
  select id into v_id from sessions where entry_key = p_token;
  if v_id is null then raise exception 'that link is not valid'; end if;
  return v_id;
end $$;

revoke execute on function public.session_for_token(text) from public, anon, authenticated;

-- ------------------------------------------------------------ the login ----
-- The link and the ID, in; the entry key, out. The ID is read the way people
-- type it: spaces around it and lower case are forgiven, nothing else is.
--
-- A bad link and a wrong ID say different things, on purpose: somebody
-- holding a link that does not work should be told to ask for it again, and
-- somebody with the right link and a typo should be told to check the ID.
-- Telling them apart gives away nothing the link did not already.
create or replace function public.enter_by_token(p_token text, p_student text)
returns text
language plpgsql security definer set search_path = public as $$
declare
  v_key  text;
  v_code text;
begin
  select s.entry_key, p.display_id
    into v_key, v_code
    from sessions s
    join profiles p on p.id = s.student_id
   where s.access_token = p_token;

  if v_key is null then
    raise exception 'that link is not valid';
  end if;

  if v_code is null
     or upper(btrim(coalesce(p_student, ''))) <> upper(v_code) then
    raise exception 'that student ID does not match this link';
  end if;

  return v_key;
end $$;

revoke execute on function public.enter_by_token(text, text) from public, anon, authenticated;
grant  execute on function public.enter_by_token(text, text) to anon, authenticated;
