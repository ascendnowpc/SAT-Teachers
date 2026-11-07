-- ============================================================================
--  0069 — ten questions, a minute each
--
--  The brief's mini-test is 10–15 questions at about a minute a question. A
--  new targeted test started at 5 (0061, when no skill could fill more); it
--  starts at 10 now, and the booking form gives each question a one-minute
--  clock and the whole test a minute a question with one to spare. An admin
--  still sets the default per subject in Settings, and a teacher still sets
--  each test.
--
--  Only a subject still on the old default moves: one an admin has set stays
--  where they set it.
--
--  And what a test is said to hold is what it holds. targeted_tests.set_size
--  is the size the teacher asked for; when the bank is short — and at 10, most
--  skills are — the set holds fewer. The test's own screen already counts the
--  set (0062), and so does progress (0063); 0068's score and the student's
--  page read set_size and would have called the shortfall "not reached". They
--  count the set now.
-- ============================================================================

alter table progress_config alter column default_set_size set default 10;
update progress_config set default_set_size = 10 where default_set_size = 5;

create or replace function public.targeted_result(p_session uuid)
returns jsonb
language sql stable security definer set search_path = public as $$
  with s as (
    select s.id, (select count(*) from targeted_set_items x where x.session_id = s.id) as set_count
      from sessions s
      join targeted_tests t on t.session_id = s.id
     where s.id = p_session and s.mode = 'targeted' and s.status = 'completed'
  ),
  met as (
    select q.section, q.skill, coalesce(a.is_correct, false) as right_one, coalesce(a.timed_out, false) as timed_out
      from s
      join session_items i on i.session_id = s.id and i.status in ('answered', 'revealed')
      join questions q on q.id = i.question_id
      left join session_item_assessments a on a.session_item_id = i.id
  )
  select case when not exists (select 1 from s) then null else
    jsonb_build_object(
      'right',       (select count(*) from met where right_one),
      'reached',     (select count(*) from met),
      'timed_out',   (select count(*) from met where timed_out),
      'not_reached', greatest(0, (select set_count from s) - (select count(*) from met)),
      'skills', coalesce((
        select jsonb_agg(jsonb_build_object('section', section, 'skill', skill, 'right', r, 'of', n)
                         order by r::numeric / n, skill)
          from (select section, skill, count(*) filter (where right_one) as r, count(*) as n
                  from met group by section, skill) g), '[]'::jsonb))
  end
$$;

revoke execute on function public.targeted_result(uuid) from public, anon, authenticated;

create or replace function public.student_home(p_key text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare v_student uuid := student_for_key(p_key);
begin
  return jsonb_build_object(
    'student', (select jsonb_build_object('full_name', p.full_name, 'display_id', p.display_id)
                  from profiles p where p.id = v_student),
    'sessions', coalesce((
      select jsonb_agg(jsonb_build_object(
               'id',              s.id,
               'title',           s.title,
               'subject',         s.subject,
               'mode',            s.mode,
               'status',          s.status,
               'scheduled_at',    s.scheduled_at,
               'opened_early_at', s.opened_early_at,
               'link',            s.access_token,
               'entry_key',       s.entry_key,
               'section',         t.section,
               'skill',           t.skill,
               'set_size',        case when t.session_id is not null
                                       then (select count(*) from targeted_set_items x where x.session_id = s.id)
                                  end,
               'revealed',        (select count(*) from session_items i
                                    where i.session_id = s.id and i.status = 'revealed'),
               'right',           (select count(*) from session_items i
                                    where i.session_id = s.id and i.status = 'revealed'
                                      and i.revealed_result = 'correct'),
               'score',           case when s.mode = 'targeted' and s.status = 'completed'
                                       then (select jsonb_build_object('right', r->'right', 'reached', r->'reached')
                                               from targeted_result(s.id) r)
                                  end)
             order by s.scheduled_at desc)
        from sessions s
        left join targeted_tests t on t.session_id = s.id
       where s.student_id = v_student
         and s.status <> 'cancelled'), '[]'::jsonb));
end $$;

revoke execute on function public.student_home(text) from public, anon, authenticated;
grant  execute on function public.student_home(text) to anon, authenticated;
