-- ============================================================================
--  0039 — the sessions list counts what the student answered
--
--  The list said 27 questions for a lesson in which the student answered six.
--  Both numbers are true of something: question_count is every row the session
--  holds, and since 0027 a session loads a whole test at a time and loads
--  another one when the level moves, so a six-question lesson that started easy
--  and went hard carries forty rows the student never saw.
--
--  Nobody reading a list of past lessons wants that number. "How much did we
--  get through" is the question that column answers, so it is going to answer
--  it: answered_count is the questions the student actually worked — answered
--  or answered-and-revealed — and nothing else.
--
--  What it deliberately does not count:
--
--    * staged questions. Loaded, never in front of them.
--    * voided questions, including the one on screen when the level moved. A
--      switch is a decision that this question was not the one for the lesson;
--      it is not an answer the student failed to give, and counting it against
--      the total is the same lie in a smaller font.
--
--  question_count stays exactly what it was and is still what the paper's
--  length is read from. This is a second number, not a correction to that one.
-- ============================================================================

alter table sessions add column if not exists answered_count int not null default 0;

comment on column sessions.answered_count is
  'How many questions the student actually answered in this session (answered or revealed). Maintained by trigger; staged and voided items are not counted.';

create or replace function public.sync_session_answered_count()
returns trigger language plpgsql security definer set search_path = public as $$
declare v_session uuid := case when tg_op = 'DELETE' then old.session_id else new.session_id end;
begin
  update sessions s
     set answered_count = (select count(*) from session_items i
                            where i.session_id = v_session
                              and i.status in ('answered','revealed'))
   where s.id = v_session;
  return null;
end $$;

-- Insert and delete like the 0016 counter, and update as well: this number
-- moves when an item's status changes, which is most of what happens to one.
drop trigger if exists session_items_answered_count on session_items;
create trigger session_items_answered_count
  after insert or delete or update of status on session_items
  for each row execute function public.sync_session_answered_count();

update sessions s
   set answered_count = (select count(*) from session_items i
                          where i.session_id = s.id
                            and i.status in ('answered','revealed'))
 where s.answered_count is distinct from (select count(*) from session_items i
                                           where i.session_id = s.id
                                             and i.status in ('answered','revealed'));
