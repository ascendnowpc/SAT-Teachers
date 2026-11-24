-- ============================================================================
--  Fixed Sets A to D (0109)
--
--    psql "$DATABASE_URL" -f supabase/tests/fixed_sets.sql
--
--  What has to hold, on the bank the migrations load:
--
--    * a draft is 10 questions of the domain: 3 easy, 3 medium, 4 hard,
--      easiest first, and no two sets of a domain share a question
--    * drafting again fills only the labels missing
--    * a swap keeps the difficulty and takes a question no set holds
--    * an approved set is locked: no swap, no delete — until it is put back
--    * a targeted test records the approved set it was booked from; a draft
--      is refused, and so is another teacher's session
--    * a PC is refused everything; signed out reads nothing
--
--  Every row must read PASS. Cleans up after itself.
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

create or replace function public.__fixed_check()
returns table(step text, detail text, expected text, actual text, verdict text)
language plpgsql as $fn$
declare
  t_id  uuid := gen_random_uuid();
  t2_id uuid := gen_random_uuid();
  pc    profiles;
  stu   profiles;
  dom   text;
  labels text[]; j jsonb; txt text; n int; a uuid; b uuid; sess uuid; s2 uuid; q_before uuid; q_after uuid;
begin
  -- The English domain with the most questions in the bank.
  select q.section into dom
    from questions q join question_set_items qi on qi.question_id = q.id join question_sets qs on qs.id = qi.set_id
   where qs.subject = 'english' and qs.is_active and q.status = 'published' and q.section is not null
   group by q.section order by count(distinct q.id) desc limit 1;

  insert into auth.users (id, instance_id, aud, role, email, encrypted_password,
                          email_confirmed_at, created_at, updated_at,
                          raw_app_meta_data, raw_user_meta_data)
  values (t_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'fs.teacher@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Mal Fixed"}'),
         (t2_id,'00000000-0000-0000-0000-000000000000','authenticated','authenticated',
          'fs.teacher2@example.test', crypt('x',gen_salt('bf')), now(),now(),now(),
          '{"provider":"email"}','{"role":"teacher","full_name":"Two Fixed"}');
  update profiles set is_active = true where id in (t_id, t2_id);
  pc := create_pc_profile('Pal', 'Fixed', 'fs.pc@example.test');
  delete from fixed_sets where section = dom;
  perform __as(t_id);
  select * into stu from create_student('Fia', 'Fixed', pc.id);

  -- ============ 1. a draft ============
  labels := draft_fixed_sets('english', dom);
  return query select '1 draft'::text, 'drafts from A'::text, 'starts A'::text, array_to_string(labels, ''),
    __verdict(labels[1] = 'A' and cardinality(labels) >= 1);
  select id into a from fixed_sets where section = dom and label = 'A';
  select string_agg(q.difficulty::text || '=' || c::text, ',' order by q.difficulty) into txt
    from (select q.difficulty, count(*) c from fixed_set_items i join questions q on q.id = i.question_id
           where i.set_id = a group by q.difficulty) q;
  return query select '1 draft'::text, 'ten: 3 easy, 3 medium, 4 hard'::text, 'easy=3,medium=3,hard=4'::text, txt,
    __verdict(txt = 'easy=3,medium=3,hard=4');
  select count(*) into n from (
    select i.position, q.difficulty, lag(q.difficulty) over (order by i.position) as prev
      from fixed_set_items i join questions q on q.id = i.question_id where i.set_id = a) x
   where prev is not null and difficulty < prev;
  return query select '1 draft'::text, 'easiest first'::text, '0 steps down'::text, n || ' steps down', __verdict(n = 0);
  select count(*) - count(distinct i.question_id) into n
    from fixed_set_items i join fixed_sets s on s.id = i.set_id where s.section = dom;
  return query select '1 draft'::text, 'no question in two sets of the domain'::text, '0'::text, n::text, __verdict(n = 0);
  select count(*) into n from fixed_set_items i join questions q on q.id = i.question_id
   join fixed_sets s on s.id = i.set_id where s.section = dom and q.section <> dom;
  return query select '1 draft'::text, 'every question on the domain'::text, '0 off it'::text, n || ' off it', __verdict(n = 0);

  -- ============ 2. again ============
  n := (select count(*) from fixed_sets where section = dom);
  labels := draft_fixed_sets('english', dom);
  return query select '2 again'::text, 'drafting again adds only what is missing'::text, 'no new A'::text,
    (case when 'A' = any(labels) then 'a new A' else 'no new A' end),
    __verdict(not ('A' = any(labels)) and (select count(*) from fixed_sets where section = dom and label = 'A') = 1);

  -- ============ 3. a swap ============
  select i.question_id into q_before from fixed_set_items i where i.set_id = a and i.position = 10;
  q_after := swap_fixed_set_question(a, 10);
  select (select difficulty from questions where id = q_before)::text || '→' || (select difficulty from questions where id = q_after)::text into txt;
  return query select '3 swap'::text, 'the same difficulty, a new question'::text, 'hard→hard'::text, txt,
    __verdict(txt = 'hard→hard' and q_before <> q_after);
  select count(*) - count(distinct i.question_id) into n
    from fixed_set_items i join fixed_sets s on s.id = i.set_id where s.section = dom;
  return query select '3 swap'::text, 'still no question in two sets'::text, '0'::text, n::text, __verdict(n = 0);

  -- ============ 4. approved: locked ============
  perform approve_fixed_set(a, true, 'Checked by Malya');
  begin perform swap_fixed_set_question(a, 1); txt := 'swapped';
  exception when others then txt := 'refused'; end;
  return query select '4 approved'::text, 'no swap on an approved set'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  begin perform delete_fixed_set(a); txt := 'deleted';
  exception when others then txt := 'refused'; end;
  return query select '4 approved'::text, 'no delete either'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  j := fixed_sets_overview('english');
  select e->>'status' || ', ' || (e->>'approved_by') || ', ' || jsonb_array_length(e->'questions') into txt
    from jsonb_array_elements(j) e where (e->>'id')::uuid = a;
  return query select '4 approved'::text, 'the overview says who approved it'::text, 'approved, Mal Fixed, 10'::text, txt,
    __verdict(txt = 'approved, Mal Fixed, 10');

  -- ============ 5. booked from ============
  perform __as(null, 'postgres');
  insert into sessions (teacher_id, student_id, subject, scheduled_at, mode) values (t_id, stu.id, 'english', now() + interval '1 day', 'targeted')
  returning id into sess;
  insert into sessions (teacher_id, student_id, subject, scheduled_at, mode) values (t2_id, stu.id, 'english', now() + interval '2 days', 'targeted')
  returning id into s2;
  perform __as(t_id);
  perform record_fixed_set(sess, a);
  select set_label into txt from session_fixed_sets where session_id = sess;
  return query select '5 booked'::text, 'a targeted test records its set'::text, 'A'::text, coalesce(txt, '(none)'), __verdict(txt = 'A');
  select id into b from fixed_sets where section = dom and label = 'B';
  if b is not null then
    begin perform record_fixed_set(sess, b); txt := 'recorded';
    exception when others then txt := 'refused'; end;
    return query select '5 booked'::text, 'a draft is not booked from'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  end if;
  begin perform record_fixed_set(s2, a); txt := 'recorded';
  exception when others then txt := 'refused'; end;
  return query select '5 booked'::text, 'nor recorded on another teacher''s test'::text, 'refused'::text, txt, __verdict(txt = 'refused');

  -- ============ 6. who ============
  perform __as(pc.id);
  begin perform draft_fixed_sets('english', dom); txt := 'drafted';
  exception when others then txt := 'refused'; end;
  return query select '6 who'::text, 'a PC is refused'::text, 'refused'::text, txt, __verdict(txt = 'refused');
  perform __as(null, 'anon');
  select count(*) into n from fixed_sets;
  return query select '6 who'::text, 'signed out reads nothing'::text, '0'::text, n::text, __verdict(n = 0);

  -- Cleanup.
  perform __as(null, 'postgres');
  delete from sessions where id in (sess, s2);
  delete from fixed_sets where section = dom;
  delete from student_login_keys where student_id = stu.id;
  delete from profiles where id in (stu.id, t_id, t2_id, pc.id);
  delete from auth.users where id in (t_id, t2_id);
end $fn$;

select * from public.__fixed_check();

drop function public.__fixed_check();
drop function public.__verdict(boolean);
drop function public.__as(uuid, text);
