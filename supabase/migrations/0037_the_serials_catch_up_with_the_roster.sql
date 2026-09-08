-- ============================================================================
--  0037 — the serial counts the people, not the sign-ups that were thrown away
--
--  A student added today came out as SNEG26-14 on a roster of three students.
--  Nothing is broken; this is 0007 working exactly as written. The trailing
--  number comes from display_id_counters, which only ever goes up:
--
--     30 Aug  teacher "Test" signs up                      teacher 1
--             student "test" signs up
--     30 Aug  0007's backfill rebuilds both ids in signup order:
--               teacher  -> TEST26-1                       teacher next = 2
--               student  -> takes serial 1, computes TEST26-1, which the
--                           teacher already holds, so BURNS it and takes 2
--                        -> TEST26-2                       student next = 3
--     31 Aug  student "rana walid" signs up -> RANW26-3    student next = 4
--     …       ten more students sign up, take 4 … 13, and are deleted again
--                                                          student next = 14
--     08 Sep  "Sneha gupta" is added        -> SNEG26-14   student next = 15
--
--  Ten test accounts came and went. Deleting one never gave its number back —
--  0007 says so on purpose, so a code identifies a person for the life of the
--  account — and the teacher counter tells the same story: it stands at 9 with
--  one teacher on the books.
--
--  That rule is right for a roster people have been issued codes from. It is
--  wrong about the first fortnight of a project, where the accounts were
--  scratch and the gap is not history, it is debris. So this is a one-off
--  correction to the damage rather than a change to the rule: after it, the
--  counter still only goes up and a deleted account still leaves a hole.
--
--  What it does, per role:
--
--    * a profile whose serial is HIGHER than the number of profiles in its
--      role is pulled down, in signup order, into the numbers just above the
--      highest serial that is being kept. Here that is SNEG26-14 -> SNEG26-4,
--      because two students already hold 2 and 3.
--    * the counter is then set to one past the highest serial in use.
--
--  Numbers already in use are never moved and never reused, so TEST26-2 and
--  RANW26-3 stand. A code that would collide with one already taken is left
--  alone rather than forced.
--
--  On a database whose serials already match its roster — every fresh one,
--  and this one after today — every branch below is a no-op.
-- ============================================================================

do $$
declare
  v_role  user_role;
  v_count int;
  v_next  int;
  v_new   text;
  p       record;
begin
  foreach v_role in array array['teacher', 'student']::user_role[] loop
    select count(*) into v_count from profiles where role = v_role;
    continue when v_count = 0;

    -- The highest serial that is not itself over-numbered: what is kept.
    select coalesce(max(split_part(display_id, '-', 2)::int), 0) into v_next
      from profiles
     where role = v_role
       and split_part(display_id, '-', 2)::int <= v_count;

    for p in
      select id, display_id
        from profiles
       where role = v_role
         and split_part(display_id, '-', 2)::int > v_count
       order by created_at
    loop
      v_next := v_next + 1;
      v_new := split_part(p.display_id, '-', 1) || '-' || v_next;

      -- Somebody else's code. Leave this profile as it is rather than move it
      -- onto a number that is spoken for; the unique index would refuse it
      -- anyway and this says why instead.
      continue when exists (select 1 from profiles x where x.display_id = v_new);

      update profiles set display_id = v_new where id = p.id;
      raise notice '0037: % -> %', p.display_id, v_new;
    end loop;

    -- One past whatever is actually in use. Upserted rather than updated: a
    -- role with no counter row yet would otherwise keep starting at 1.
    select coalesce(max(split_part(display_id, '-', 2)::int), 0) + 1 into v_next
      from profiles where role = v_role;

    insert into display_id_counters (role, next_no)
    values (v_role, v_next)
    on conflict (role) do update set next_no = excluded.next_no;
  end loop;
end $$;
