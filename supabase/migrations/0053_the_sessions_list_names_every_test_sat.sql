-- ============================================================================
--  0053 — the sessions list names every test the student sat
--
--  The list's Level column read sessions.level, which is the test the queue is
--  running — so a finished session reads as whichever test it happened to end
--  on. A lesson that worked ten medium questions and then dropped to easy for
--  three was listed as "Easy", which is the one thing about it that is not
--  true: the medium test is most of what happened.
--
--  So a session keeps the tests the student actually sat beside the count of
--  what they answered (0039), and on the same terms: levels_sat is the level of
--  each question answered or answered-and-revealed, once each, in the order
--  the student first reached it. A question set aside by a level move is not
--  in it, for the reason it is not in answered_count — it was not sat.
--
--  sessions.level keeps its meaning — where the queue is — and is still what
--  the console and the loader read. This is a second fact, not a correction
--  to that one.
-- ============================================================================

alter table sessions add column if not exists levels_sat text[] not null default '{}';

comment on column sessions.levels_sat is
  'The tests the student answered questions on, each once, in the order first reached: {medium,easy} for a lesson that moved down. Maintained by trigger with answered_count; set-aside questions are not counted.';

-- The levels, from the questions themselves: a question chosen from another
-- test (0047) is that test's, whatever the queue was running when it went up.
create or replace function public.session_levels_sat(p_session uuid)
returns text[] language sql stable set search_path = public as $$
  select coalesce(array_agg(t.level order by t.first_asked, t.level), '{}')
    from (select q.difficulty::text as level,
                 min(coalesce(i.asked_no, i.sequence_no)) as first_asked
            from session_items i
            join questions q on q.id = i.question_id
           where i.session_id = p_session
             and i.status in ('answered', 'revealed')
           group by q.difficulty) t
$$;

revoke execute on function public.session_levels_sat(uuid) from public, anon, authenticated;

-- One trigger for both numbers, so an answer moves the session row once.
create or replace function public.sync_session_answers()
returns trigger language plpgsql security definer set search_path = public as $$
declare v_session uuid := case when tg_op = 'DELETE' then old.session_id else new.session_id end;
begin
  update sessions s
     set answered_count = (select count(*) from session_items i
                            where i.session_id = v_session
                              and i.status in ('answered','revealed')),
         levels_sat     = session_levels_sat(v_session)
   where s.id = v_session;
  return null;
end $$;

revoke execute on function public.sync_session_answers() from public, anon, authenticated;

drop trigger if exists session_items_answered_count on session_items;
drop trigger if exists session_items_answers on session_items;
create trigger session_items_answers
  after insert or delete or update of status on session_items
  for each row execute function public.sync_session_answers();

drop function if exists public.sync_session_answered_count();

update sessions s
   set levels_sat = session_levels_sat(s.id)
 where s.levels_sat is distinct from session_levels_sat(s.id);
