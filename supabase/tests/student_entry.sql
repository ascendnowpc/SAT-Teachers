-- ============================================================================
--  The link asks for the student ID (0066)
--
--    psql "$DATABASE_URL" -f supabase/tests/student_entry.sql
--
--  What has to hold:
--
--    * every session has an entry key: 64 characters, its own, and not its
--      link's token
--    * the link's token alone opens nothing: no reading, no starting
--    * the link and the right ID hand back the entry key — typed in lower
--      case or with spaces round it too
--    * a wrong ID, no ID and another student's ID are refused, and say so;
--      a bad link says the link is not valid
--    * the entry key opens its own session, and the payload carries neither
--      the token nor the key
--    * anon (the signed-out browser) can ask; session_for_token stays
--      internal
--
--  Every row must read PASS. Cleans up after itself and is safe to run
--  against a real database.
-- ============================================================================

create or replace function public.__as(p uuid, r text default 'authenticated') returns void
language plpgsql as $$
begin
  execute 'reset role';
  perform set_config('request.jwt.claims',
    case when p is null then '' else json_build_object('sub', p::text, 'role', r)::text end, true);
  execute format('set local role %I', r);
end $$;

create or replace function public.__verdict(ok boolean) returns text
language sql as $$ select case when ok then 'PASS' else 'FAIL' end $$;

create or replace function public.__student_entry_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  pc    profiles;
  stu   profiles;
  other profiles;
  sess  uuid; sess2 uuid;
  link  text; link2 text;
  key   text; key2 text;
  got   text; txt text; j jsonb;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'se.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;

  pc := create_pc_profile('Pat', 'Entry', 'se.pc@example.test');

  perform __as(t_id);
  select * into stu   from create_student('Lia', 'Entry', pc.id);
  select * into other from create_student('Omar', 'Entry', pc.id);

  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, stu.id, 'english', now() - interval '1 minute')
  returning id, access_token, entry_key into sess, link, key;
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, other.id, 'english', now() - interval '1 minute')
  returning id, access_token, entry_key into sess2, link2, key2;

  -- ============ 1. the key ============
  return query select '1 key'::text, 'a session gets one'::text, '64 chars'::text,
    coalesce(length(key), 0)::text || ' chars', __verdict(length(key) = 64);
  return query select '1 key'::text, 'and it is not the link''s token'::text, 'different'::text,
    (case when key = link then 'same' else 'different' end), __verdict(key <> link);
  return query select '1 key'::text, 'and no two sessions share one'::text, 'different'::text,
    (case when key = key2 then 'same' else 'different' end), __verdict(key <> key2);

  perform __as(null, 'postgres');
  select count(*)::text into txt from sessions where entry_key is null;
  return query select '1 key'::text, 'no session is without one'::text, '0'::text, txt, __verdict(txt = '0');

  -- ============ 2. the link alone ============
  perform __as(null, 'anon');
  begin perform session_by_token(link); txt := 'read';
  exception when others then txt := 'refused'; end;
  return query select '2 link alone'::text, 'cannot read the test'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  begin perform start_session_by_token(link); txt := 'started';
  exception when others then txt := 'refused'; end;
  return query select '2 link alone'::text, 'cannot start it'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  -- ============ 3. the student ID ============
  begin got := enter_by_token(link, 'XXXX26-999'); txt := 'entered';
  exception when others then txt := sqlerrm; end;
  return query select '3 entering'::text, 'a wrong ID is refused'::text,
    'that student ID does not match this link'::text, txt,
    __verdict(txt = 'that student ID does not match this link');

  begin got := enter_by_token(link, other.display_id); txt := 'entered';
  exception when others then txt := 'refused'; end;
  return query select '3 entering'::text, 'so is another student''s ID'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  begin got := enter_by_token(link, null); txt := 'entered';
  exception when others then txt := 'refused'; end;
  return query select '3 entering'::text, 'and no ID at all'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  begin got := enter_by_token('not-a-real-link', stu.display_id); txt := 'entered';
  exception when others then txt := sqlerrm; end;
  return query select '3 entering'::text, 'a bad link says so'::text, 'that link is not valid'::text, txt,
    __verdict(txt = 'that link is not valid');

  got := enter_by_token(link, stu.display_id);
  return query select '3 entering'::text, 'the right ID hands back the key'::text, 'the key'::text,
    (case when got = key then 'the key' else coalesce(got, 'nothing') end), __verdict(got = key);

  got := enter_by_token(link, '  ' || lower(stu.display_id) || ' ');
  return query select '3 entering'::text, 'typed in lower case with spaces, too'::text, 'the key'::text,
    (case when got = key then 'the key' else coalesce(got, 'nothing') end), __verdict(got = key);

  got := enter_by_token(link2, other.display_id);
  return query select '3 entering'::text, 'each link answers to its own student'::text, 'its own key'::text,
    (case when got = key2 then 'its own key' else 'another' end), __verdict(got = key2);

  -- ============ 4. the key opens the test ============
  perform start_session_by_token(key);
  j := session_by_token(key);
  return query select '4 key'::text, 'opens its own session'::text, sess::text,
    coalesce(j->'session'->>'id', '(none)'), __verdict(j->'session'->>'id' = sess::text);
  return query select '4 key'::text, 'which it started'::text, 'live'::text,
    coalesce(j->'session'->>'status', '(none)'), __verdict(j->'session'->>'status' = 'live');
  return query select '4 key'::text, 'and the payload carries neither secret'::text, 'absent'::text,
    (case when position(link in j::text) > 0 or position(key in j::text) > 0
            or position('entry_key' in j::text) > 0 or position('access_token' in j::text) > 0
          then 'present' else 'absent' end),
    __verdict(position(link in j::text) = 0 and position(key in j::text) = 0
              and position('entry_key' in j::text) = 0 and position('access_token' in j::text) = 0);

  -- ============ 5. who can ask ============
  perform __as(null, 'postgres');
  return query select '5 grants'::text, 'enter_by_token(text,text) — the link'::text, 'anon, authenticated'::text,
    concat_ws(', ',
      case when has_function_privilege('anon', 'public.enter_by_token(text,text)', 'execute') then 'anon' end,
      case when has_function_privilege('authenticated', 'public.enter_by_token(text,text)', 'execute') then 'authenticated' end),
    __verdict(has_function_privilege('anon', 'public.enter_by_token(text,text)', 'execute')
              and has_function_privilege('authenticated', 'public.enter_by_token(text,text)', 'execute'));
  return query select '5 grants'::text, 'session_for_token(text) — internal'::text, 'nobody'::text,
    (case when has_function_privilege('anon', 'public.session_for_token(text)', 'execute')
            or has_function_privilege('authenticated', 'public.session_for_token(text)', 'execute')
          then 'somebody' else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.session_for_token(text)', 'execute')
              and not has_function_privilege('authenticated', 'public.session_for_token(text)', 'execute'));

  -- Cleanup.
  delete from sessions where id in (sess, sess2);
  delete from profiles where id in (stu.id, other.id, t_id, pc.id);
  delete from auth.users where id = t_id;
end $fn$;

select * from public.__student_entry_check();

drop function public.__student_entry_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
