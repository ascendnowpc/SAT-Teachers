-- ============================================================================
--  Security contract — run this against any environment before shipping.
--
--    psql "$DATABASE_URL" -f supabase/tests/rls_contract.sql
--
--  Creates a teacher, a student and an admin the way the product does, asserts
--  what each seat can and cannot reach, then cleans up after itself.  Every row
--  must say PASS.
--
--  The assertions that matter most:
--    * a student can never read question_keys — the answer key lives in its own
--      table precisely because RLS cannot hide a column of a row it grants
--    * a signup asking for `admin` is coerced to `student`
--    * a teacher account arrives INACTIVE and reads nothing until an admin
--      approves it (0044) — signup is open to anyone with an email address
--    * nobody rewrites their own role, display id or approval (0044)
--    * an admin reads every session, every form and every report, and writes
--      none of them
--    * a SUSPENDED account cannot sign in at all (0045), where an account that
--      is merely waiting for approval still can — that is how it is told so
-- ============================================================================

create or replace function public.__rls_check()
returns table(seat text, assertion text, expected text, actual text, verdict text)
language plpgsql
as $fn$
declare
  t_id uuid := gen_random_uuid();
  s_id uuid := gen_random_uuid();
  a_id uuid := gen_random_uuid();
  sess uuid;
  n    int;
  ok   boolean;
begin
  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values
    (t_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
     'rlscheck.teacher@example.test', crypt('x', gen_salt('bf')), now(), now(), now(),
     '{"provider":"email"}', '{"role":"teacher","full_name":"RLS Teacher"}'),
    -- deliberately asks for admin; the trigger must refuse it
    (s_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
     'rlscheck.student@example.test', crypt('x', gen_salt('bf')), now(), now(), now(),
     '{"provider":"email"}', '{"role":"admin","full_name":"RLS Student"}'),
    (a_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
     'rlscheck.admin@example.test', crypt('x', gen_salt('bf')), now(), now(), now(),
     '{"provider":"email"}', '{"role":"teacher","full_name":"RLS Admin"}');

  -- The one door the product does not have. An admin is made in the SQL editor
  -- by somebody who already owns the project, which is the whole of 0044's
  -- answer to "who lets the first admin in".
  update profiles set role = 'admin', is_active = true where id = a_id;

  return query select 'signup'::text, 'requested role is coerced, not trusted'::text,
    'student'::text,
    (select role::text from profiles where id = s_id),
    (select case when role = 'student' then 'PASS' else 'FAIL' end from profiles where id = s_id);

  return query select 'signup'::text, 'readable ids are issued'::text, 'TCH-* / STU-*'::text,
    (select string_agg(display_id, ' / ' order by display_id) from profiles where id in (t_id, s_id)),
    (select case when count(*) = 2 then 'PASS' else 'FAIL' end from profiles where id in (t_id, s_id));

  -- 0044. Signup is open to the internet and a teacher reads every answer key
  -- in the bank, so the account arrives switched off.
  return query select 'signup'::text, 'a new teacher account arrives pending'::text,
    'inactive'::text,
    (select case when is_active then 'active' else 'inactive' end from profiles where id = t_id),
    (select case when not is_active then 'PASS' else 'FAIL' end from profiles where id = t_id);

  -- ------------------------------------------------- the pending teacher ----
  perform set_config('request.jwt.claims',
    json_build_object('sub', t_id::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';

  return query select 'pending teacher'::text, 'is not staff yet'::text, 'false'::text,
    is_teacher()::text, (case when not is_teacher() then 'PASS' else 'FAIL' end)::text;

  begin
    update profiles set is_active = true where id = t_id;
    select count(*) into n from profiles where id = t_id and is_active;
    ok := (n = 0);
  exception when others then ok := true;
  end;
  return query select 'pending teacher'::text, 'cannot approve themselves'::text,
    'blocked'::text, (case when ok then 'blocked' else 'APPROVED' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  begin
    update profiles set display_id = 'TCH-0001' where id = t_id;
    select count(*) into n from profiles where id = t_id and display_id = 'TCH-0001';
    ok := (n = 0);
  exception when others then ok := true;
  end;
  return query select 'pending teacher'::text, 'cannot take another id'::text,
    'blocked'::text, (case when ok then 'blocked' else 'RENAMED' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  execute 'reset role';
  perform set_config('request.jwt.claims', '', true);

  -- The admin lets them in. Through the RPC, as the portal does.
  perform set_config('request.jwt.claims',
    json_build_object('sub', a_id::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';
  perform set_profile_active(t_id, true);
  execute 'reset role';
  perform set_config('request.jwt.claims', '', true);

  return query select 'admin'::text, 'approves a pending teacher'::text, 'active'::text,
    (select case when is_active then 'active' else 'inactive' end from profiles where id = t_id),
    (select case when is_active then 'PASS' else 'FAIL' end from profiles where id = t_id);

  -- ---------------------------------------------------------- teacher ----
  perform set_config('request.jwt.claims',
    json_build_object('sub', t_id::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';

  begin
    perform create_question('english', 'craft_and_structure', null,
      'Which choice completes the text?', 'medium'::difficulty_level, null,
      '[{"label":"A","body":"gentle"},{"label":"B","body":"diverse"}]'::jsonb,
      'B'::answer_option, 'Diverse fits.');
    ok := true;
  exception when others then ok := false;
  end;
  return query select 'teacher'::text, 'can author a question'::text, 'yes'::text,
    (case when ok then 'yes' else 'no' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from questions;
  return query select 'teacher'::text, 'reads the bank'::text, '1'::text, n::text,
    (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from question_keys;
  return query select 'teacher'::text, 'reads answer keys'::text, '1'::text, n::text,
    (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  begin
    perform create_question('english', null, null, 'Bad key', 'easy'::difficulty_level, null,
      '[{"label":"A","body":"a"},{"label":"B","body":"b"}]'::jsonb, 'D'::answer_option, null);
    ok := false;
  exception when others then ok := true;
  end;
  return query select 'teacher'::text, 'correct option must be one of the options'::text,
    'rejected'::text, (case when ok then 'rejected' else 'accepted' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  -- A session for the admin seat to read, and a written form to read with it.
  insert into sessions (teacher_id, student_id, subject, title, scheduled_at)
  values (t_id, s_id, 'english', 'RLS check session', now())
  returning id into sess;

  insert into session_reports (session_id, teacher_reflection)
  values (sess, 'Worked hard, read too fast.');

  execute 'reset role';
  perform set_config('request.jwt.claims', '', true);

  -- ---------------------------------------------------------- student ----
  perform set_config('request.jwt.claims',
    json_build_object('sub', s_id::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';

  select count(*) into n from questions;
  return query select 'student'::text, 'reads the bank'::text, '0'::text, n::text,
    (case when n = 0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from question_options;
  return query select 'student'::text, 'reads options'::text, '0'::text, n::text,
    (case when n = 0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from question_keys;
  return query select 'student'::text, 'reads ANSWER KEYS'::text, '0'::text, n::text,
    (case when n = 0 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from profiles;
  return query select 'student'::text, 'reads profiles (own only)'::text, '1'::text, n::text,
    (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  begin
    perform create_question('english', null, null, 'Sneaky', 'easy'::difficulty_level, null,
      '[{"label":"A","body":"a"},{"label":"B","body":"b"}]'::jsonb, 'A'::answer_option, null);
    ok := false;
  exception when others then ok := true;
  end;
  return query select 'student'::text, 'blocked from authoring'::text, 'blocked'::text,
    (case when ok then 'blocked' else 'allowed' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  begin
    update profiles set role = 'teacher' where id = s_id;
    select count(*) into n from profiles where id = s_id and role = 'teacher';
    ok := (n = 0);
  exception when others then ok := true;
  end;
  return query select 'student'::text, 'cannot self-promote to teacher'::text,
    'blocked'::text, (case when ok then 'blocked' else 'PROMOTED' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  execute 'reset role';
  perform set_config('request.jwt.claims', '', true);

  -- ------------------------------------------------------------- admin ----
  perform set_config('request.jwt.claims',
    json_build_object('sub', a_id::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';

  select count(*) into n from profiles where id in (t_id, s_id, a_id);
  return query select 'admin'::text, 'reads every profile, not only students'::text, '3'::text,
    n::text, (case when n = 3 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from sessions where id = sess;
  return query select 'admin'::text, 'reads a session they do not teach'::text, '1'::text,
    n::text, (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  select count(*) into n from session_reports where session_id = sess;
  return query select 'admin'::text, 'reads the write-up'::text, '1'::text,
    n::text, (case when n = 1 then 'PASS' else 'FAIL' end)::text;

  -- Read-only is the whole design: there is no admin write policy anywhere, and
  -- every RPC that changes a session still asks assert_session_teacher.
  begin
    update sessions set title = 'Admin was here' where id = sess;
    select count(*) into n from sessions where id = sess and title = 'Admin was here';
    ok := (n = 0);
  exception when others then ok := true;
  end;
  return query select 'admin'::text, 'cannot edit a session'::text, 'blocked'::text,
    (case when ok then 'blocked' else 'EDITED' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  begin
    perform set_session_status(sess, 'cancelled'::session_status);
    ok := false;
  exception when others then ok := true;
  end;
  return query select 'admin'::text, 'cannot run a teacher''s RPC'::text, 'blocked'::text,
    (case when ok then 'blocked' else 'RAN' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  begin
    perform set_profile_active(a_id, false);
    ok := false;
  exception when others then ok := true;
  end;
  return query select 'admin'::text, 'cannot switch themselves off'::text, 'blocked'::text,
    (case when ok then 'blocked' else 'SUSPENDED' end)::text,
    (case when ok then 'PASS' else 'FAIL' end)::text;

  execute 'reset role';
  perform set_config('request.jwt.claims', '', true);

  -- ------------------------------------------ the student, once suspended ---
  -- is_teacher() has always asked is_active; this is what that buys.
  perform set_config('request.jwt.claims',
    json_build_object('sub', a_id::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';
  perform set_profile_active(t_id, false);
  execute 'reset role';
  perform set_config('request.jwt.claims', '', true);

  perform set_config('request.jwt.claims',
    json_build_object('sub', t_id::text, 'role', 'authenticated')::text, true);
  execute 'set local role authenticated';

  select count(*) into n from question_keys;
  return query select 'suspended teacher'::text, 'loses the answer keys'::text, '0'::text,
    n::text, (case when n = 0 then 'PASS' else 'FAIL' end)::text;

  execute 'reset role';
  perform set_config('request.jwt.claims', '', true);

  -- 0045. Losing every row is the right amount of data and the wrong door: a
  -- removed teacher should be stopped at the sign-in form, not left clicking
  -- around an empty copy of the product.
  return query select 'suspended teacher'::text, 'cannot sign in at all'::text,
    'banned'::text,
    (select case when banned_until > now() then 'banned' else 'can sign in' end
       from auth.users where id = t_id),
    (select case when banned_until > now() then 'PASS' else 'FAIL' end
       from auth.users where id = t_id);

  -- And the distinction the approval queue depends on: off is two things.
  return query select 'suspended teacher'::text, 'is marked suspended, not pending'::text,
    'suspended_at set'::text,
    (select case when suspended_at is null then 'null' else 'set' end
       from profiles where id = t_id),
    (select case when suspended_at is not null then 'PASS' else 'FAIL' end
       from profiles where id = t_id);

  delete from session_reports where session_id = sess;
  delete from sessions where id = sess;
  delete from questions where created_by = t_id;
  -- 0032 dropped the cascade from auth.users, so the profiles go by hand.
  delete from profiles where id in (t_id, s_id, a_id);
  delete from auth.users where id in (t_id, s_id, a_id);
end $fn$;

select * from public.__rls_check();

drop function public.__rls_check();
