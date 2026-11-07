-- ============================================================================
--  A student signs in with their ID and a PIN (0067)
--
--    psql "$DATABASE_URL" -f supabase/tests/student_sign_in.sql
--
--  What has to hold:
--
--    * a new student gets a 4-digit PIN; staff and the student's own PC read
--      it; another PC, a signed-out caller and every client write do not
--    * the right ID and PIN sign in — typed in lower case with spaces too —
--      and hand back a key that is kept only as its hash
--    * a wrong PIN and an unknown ID say the same thing
--    * five wrong in a row lock it, even against the right PIN; once the lock
--      has passed the right PIN works and clears the count
--    * a key opens that student's page and nobody else's: their tests, each
--      with an entry key that opens it, and no other student's
--    * a made-up, expired or signed-out key opens nothing, and nor does the
--      key of a student who has been suspended
--    * a tutor can give a new PIN, which differs, clears the lock and signs
--      the student out; a PC and a signed-out caller cannot
--    * the grants are what they say
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

create or replace function public.__student_sign_in_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  pc    profiles;
  pc2   profiles;
  stu   profiles;
  other profiles;
  sess  uuid; sess_other uuid;
  pin   text; pin2 text; txt text;
  r     jsonb; home jsonb; key text; key2 text;
  n     int;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'ssi.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Malya Rao"}');
  update profiles set is_active = true where id = t_id;

  pc  := create_pc_profile('Pat', 'Pin', 'ssi.pc@example.test');
  pc2 := create_pc_profile('Pia', 'Other', 'ssi.pc2@example.test');
  -- create_pc_profile makes the profile; a PC reads as a signed-in auth user.
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data)
  values (pc.id,  '00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'ssi.pc@example.test',  crypt('x',gen_salt('bf')), now(),now(),now(), '{"provider":"email"}','{}'),
         (pc2.id, '00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'ssi.pc2@example.test', crypt('x',gen_salt('bf')), now(),now(),now(), '{"provider":"email"}','{}');

  perform __as(t_id);
  select * into stu   from create_student('Lia', 'Pin', pc.id);
  select * into other from create_student('Omar', 'Pin', pc2.id);
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, stu.id, 'english', now() - interval '1 minute') returning id into sess;
  insert into sessions (teacher_id, student_id, subject, scheduled_at)
  values (t_id, other.id, 'english', now() - interval '1 minute') returning id into sess_other;

  -- ============ 1. the PIN ============
  select sp.pin into pin from student_pins sp where sp.student_id = stu.id;
  return query select '1 pin'::text, 'a new student gets one, and staff read it'::text, '4 digits'::text,
    coalesce(pin, '(none)'), __verdict(pin ~ '^[0-9]{4}$');

  perform __as(pc.id);
  select sp.pin into txt from student_pins sp where sp.student_id = stu.id;
  return query select '1 pin'::text, 'the student''s own PC reads it'::text, pin, coalesce(txt, '(nothing)'),
    __verdict(txt = pin);

  perform __as(pc2.id);
  select count(*) into n from student_pins sp where sp.student_id = stu.id;
  return query select '1 pin'::text, 'another PC does not'::text, '0'::text, n::text, __verdict(n = 0);

  perform __as(null, 'anon');
  begin select count(*) into n from student_pins; txt := n::text || ' rows';
  exception when others then txt := 'refused'; end;
  return query select '1 pin'::text, 'nor does a signed-out caller'::text, 'refused'::text, txt,
    __verdict(txt = 'refused' or txt = '0 rows');

  perform __as(t_id);
  begin update student_pins set pin = '0000' where student_id = stu.id; get diagnostics n = row_count;
        txt := n::text || ' changed';
  exception when others then txt := 'refused'; end;
  return query select '1 pin'::text, 'and no client writes it, staff included'::text, 'refused'::text, txt,
    __verdict(txt in ('refused', '0 changed'));

  -- ============ 2. signing in ============
  perform __as(null, 'anon');
  r := student_sign_in(stu.display_id, case when pin = '0000' then '1111' else '0000' end);
  return query select '2 sign in'::text, 'a wrong PIN is refused'::text, 'wrong'::text,
    coalesce(r->>'reason', r::text), __verdict(r->>'reason' = 'wrong');

  r := student_sign_in('ZZZZ99-999', pin);
  return query select '2 sign in'::text, 'an unknown ID says the same thing'::text, 'wrong'::text,
    coalesce(r->>'reason', r::text), __verdict(r->>'reason' = 'wrong');

  r := student_sign_in('  ' || lower(stu.display_id) || ' ', pin);
  key := r->>'key';
  return query select '2 sign in'::text, 'the right pair signs in, however the ID is typed'::text, '64-char key'::text,
    coalesce(length(key)::text || '-char key', r::text), __verdict((r->>'ok')::boolean and length(key) = 64);

  perform __as(null, 'postgres');
  select count(*) into n from student_login_keys where key_hash = key;
  return query select '2 sign in'::text, 'the key itself is not stored'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from student_login_keys
   where key_hash = encode(sha256(convert_to(key, 'UTF8')), 'hex') and student_id = stu.id;
  return query select '2 sign in'::text, 'only its hash, against the student'::text, '1'::text, n::text, __verdict(n = 1);
  select failed_attempts into n from student_pins where student_id = stu.id;
  return query select '2 sign in'::text, 'and the wrong try before it is forgotten'::text, '0'::text, n::text,
    __verdict(n = 0);

  -- ============ 3. guessing ============
  perform __as(null, 'anon');
  for i in 1..5 loop
    r := student_sign_in(other.display_id, 'abcd');
  end loop;
  return query select '3 lock'::text, 'five wrong in a row lock it'::text, 'locked'::text,
    coalesce(r->>'reason', r::text), __verdict(r->>'reason' = 'locked');

  perform __as(null, 'postgres');
  select sp.pin into pin2 from student_pins sp where sp.student_id = other.id;
  perform __as(null, 'anon');
  r := student_sign_in(other.display_id, pin2);
  return query select '3 lock'::text, 'even against the right PIN'::text, 'locked'::text,
    coalesce(r->>'reason', r::text), __verdict(r->>'reason' = 'locked');

  perform __as(null, 'postgres');
  update student_pins set locked_until = now() - interval '1 second' where student_id = other.id;
  perform __as(null, 'anon');
  r := student_sign_in(other.display_id, pin2);
  key2 := r->>'key';
  return query select '3 lock'::text, 'once it has passed, the right PIN works'::text, 'true'::text,
    coalesce(r->>'ok', r::text), __verdict((r->>'ok')::boolean);

  perform __as(null, 'postgres');
  select failed_attempts into n from student_pins where student_id = other.id;
  return query select '3 lock'::text, 'and clears the count'::text, '0'::text, n::text, __verdict(n = 0);

  update student_pins set failed_attempts = 9 where student_id = other.id;
  perform __as(null, 'anon');
  r := student_sign_in(other.display_id, 'abcd');
  perform __as(null, 'postgres');
  select round(extract(epoch from locked_until - now()) / 60) into n from student_pins where student_id = other.id;
  return query select '3 lock'::text, 'the second lock is twice as long'::text, '30 min'::text,
    n::text || ' min', __verdict(n = 30);
  update student_pins set failed_attempts = 0, locked_until = null where student_id = other.id;

  -- ============ 4. the student's page ============
  perform __as(null, 'anon');
  home := student_home(key);
  return query select '4 page'::text, 'the key opens the student''s own page'::text, stu.display_id,
    coalesce(home->'student'->>'display_id', '(none)'), __verdict(home->'student'->>'display_id' = stu.display_id);
  return query select '4 page'::text, 'with their test on it'::text, sess::text,
    coalesce(home->'sessions'->0->>'id', '(none)'), __verdict(home->'sessions'->0->>'id' = sess::text);
  select count(*) into n from jsonb_array_elements(home->'sessions') e where e->>'id' = sess_other::text;
  return query select '4 page'::text, 'and nobody else''s'::text, '0'::text, n::text, __verdict(n = 0);

  r := session_by_token(home->'sessions'->0->>'entry_key');
  return query select '4 page'::text, 'a test on it opens with no more asking'::text, sess::text,
    coalesce(r->'session'->>'id', '(none)'), __verdict(r->'session'->>'id' = sess::text);

  txt := home::text;
  return query select '4 page'::text, 'no key, level or note is on it'::text, 'absent'::text,
    (case when position('correct_option' in txt) > 0 or position('teacher_notes' in txt) > 0
            or position('"level"' in txt) > 0 or position('is_correct' in txt) > 0
          then 'present' else 'absent' end),
    __verdict(position('correct_option' in txt) = 0 and position('teacher_notes' in txt) = 0
              and position('"level"' in txt) = 0 and position('is_correct' in txt) = 0);

  begin perform student_home('not-a-key'); txt := 'opened';
  exception when others then txt := sqlerrm; end;
  return query select '4 page'::text, 'a made-up key opens nothing'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');

  perform __as(null, 'postgres');
  update student_login_keys set expires_at = now() - interval '1 second' where student_id = other.id;
  perform __as(null, 'anon');
  begin perform student_home(key2); txt := 'opened';
  exception when others then txt := 'signed out'; end;
  return query select '4 page'::text, 'nor an expired one'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');

  perform __as(null, 'postgres');
  update profiles set is_active = false where id = stu.id;
  perform __as(null, 'anon');
  begin perform student_home(key); txt := 'opened';
  exception when others then txt := 'signed out'; end;
  return query select '4 page'::text, 'nor a suspended student''s'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');
  r := student_sign_in(stu.display_id, pin);
  return query select '4 page'::text, 'who cannot sign in again either'::text, 'closed'::text,
    coalesce(r->>'reason', r::text), __verdict(r->>'reason' = 'closed');
  perform __as(null, 'postgres');
  update profiles set is_active = true where id = stu.id;

  -- ============ 5. signing out ============
  perform __as(null, 'anon');
  perform student_sign_out(key);
  begin perform student_home(key); txt := 'opened';
  exception when others then txt := 'signed out'; end;
  return query select '5 out'::text, 'a signed-out key opens nothing'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');

  -- ============ 6. a new PIN ============
  key := student_sign_in(stu.display_id, pin)->>'key';
  perform __as(pc.id);
  begin perform reset_student_pin(stu.id); txt := 'reset';
  exception when others then txt := 'refused'; end;
  return query select '6 new pin'::text, 'a PC cannot give one'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  perform __as(null, 'anon');
  begin perform reset_student_pin(stu.id); txt := 'reset';
  exception when others then txt := 'refused'; end;
  return query select '6 new pin'::text, 'nor a signed-out caller'::text, 'refused'::text, txt,
    __verdict(txt = 'refused');

  perform __as(null, 'postgres');
  update student_pins set failed_attempts = 7, locked_until = now() + interval '1 hour' where student_id = stu.id;
  perform __as(t_id);
  pin2 := reset_student_pin(stu.id);
  return query select '6 new pin'::text, 'a tutor can, and it is a different PIN'::text, 'different'::text,
    (case when pin2 = pin then 'same' else 'different' end), __verdict(pin2 ~ '^[0-9]{4}$' and pin2 <> pin);

  perform __as(null, 'anon');
  begin perform student_home(key); txt := 'opened';
  exception when others then txt := 'signed out'; end;
  return query select '6 new pin'::text, 'which signs the student out'::text, 'signed out'::text, txt,
    __verdict(txt = 'signed out');
  r := student_sign_in(stu.display_id, pin2);
  return query select '6 new pin'::text, 'clears the lock, and works'::text, 'true'::text,
    coalesce(r->>'ok', r::text), __verdict((r->>'ok')::boolean);

  -- ============ 7. grants ============
  perform __as(null, 'postgres');
  for txt in select unnest(array['student_sign_in(text,text)', 'student_home(text)', 'student_sign_out(text)']) loop
    return query select '7 grants'::text, txt || ' — signed out too'::text, 'anon'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute') then 'anon' else 'nobody' end),
      __verdict(has_function_privilege('anon', 'public.'||txt, 'execute'));
  end loop;
  return query select '7 grants'::text, 'reset_student_pin(uuid) — signed in only'::text, 'authenticated'::text,
    (case when has_function_privilege('anon', 'public.reset_student_pin(uuid)', 'execute') then 'anon too!'
          when has_function_privilege('authenticated', 'public.reset_student_pin(uuid)', 'execute') then 'authenticated'
          else 'nobody' end),
    __verdict(not has_function_privilege('anon', 'public.reset_student_pin(uuid)', 'execute')
              and has_function_privilege('authenticated', 'public.reset_student_pin(uuid)', 'execute'));
  for txt in select unnest(array['student_for_key(text)', 'new_student_pin()', 'give_student_a_pin()']) loop
    return query select '7 grants'::text, txt || ' — internal'::text, 'nobody'::text,
      (case when has_function_privilege('anon', 'public.'||txt, 'execute')
              or has_function_privilege('authenticated', 'public.'||txt, 'execute')
            then 'somebody' else 'nobody' end),
      __verdict(not has_function_privilege('anon', 'public.'||txt, 'execute')
                and not has_function_privilege('authenticated', 'public.'||txt, 'execute'));
  end loop;

  -- Cleanup.
  delete from sessions where id in (sess, sess_other);
  delete from profiles where id in (stu.id, other.id, t_id, pc.id, pc2.id);
  delete from auth.users where id in (t_id, pc.id, pc2.id);
end $fn$;

select * from public.__student_sign_in_check();

drop function public.__student_sign_in_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
