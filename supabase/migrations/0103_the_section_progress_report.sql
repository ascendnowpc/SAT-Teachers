-- ============================================================================
--  0103 — the Section Progress Report goes to the parent, through the PC
--
--  Parents do not open the platform, so the report leaves it: a one-page PDF
--  per subject (lib/sectionReport) that the student's PC downloads, or emails
--  to the parent from the student's progress page with a note of their own.
--  It goes through the PC — the scope's answer to "only through the PC, or
--  straight to the parent?" — so the PC adds context before a parent reads it.
--
--  Two tables and one function:
--
--    student_parents      the parent's name and email, one row per student.
--                         The PC sets it for their own students; an admin for
--                         any. Staff and the PC read it.
--    parent_report_emails every send, sent or failed: who sent it, to whom,
--                         the note, and why it failed. Written only by the
--                         function that sends (email_parent_report, on the
--                         service role); staff and the PC read it.
--
--    set_parent_contact(student, name, email)
--
--  The address is never taken from the request that sends: the function reads
--  it here, so a report goes only where the student's PC or an admin said the
--  parent is. Both go with the student when the clean-up deletes them (0071).
-- ============================================================================

create table if not exists student_parents (
  student_id   uuid primary key references profiles(id) on delete cascade,
  parent_name  text check (parent_name is null or length(parent_name) <= 120),
  parent_email text check (parent_email is null
                           or (length(parent_email) <= 254 and parent_email ~ '^[^@\s]+@[^@\s]+\.[^@\s]+$')),
  updated_at   timestamptz not null default now(),
  updated_by   uuid references profiles(id) on delete set null
);

comment on table student_parents is
  'The parent a Section Progress Report is emailed to: set by the student''s PC or an admin (0103).';

alter table student_parents enable row level security;

drop policy if exists student_parents_staff_read on student_parents;
create policy student_parents_staff_read on student_parents for select
  using ((select is_teacher()));

drop policy if exists student_parents_pc_read on student_parents;
create policy student_parents_pc_read on student_parents for select
  using ((select is_pc())
         and exists (select 1 from profiles s where s.id = student_id and s.pc_id = (select auth.uid())));

revoke insert, update, delete, truncate on student_parents from anon, authenticated;

create table if not exists parent_report_emails (
  id         uuid primary key default gen_random_uuid(),
  student_id uuid not null references profiles(id) on delete cascade,
  sent_by    uuid references profiles(id) on delete set null,
  sent_to    text not null,
  subjects   text[] not null default '{}',
  note       text check (note is null or length(note) <= 2000),
  status     text not null check (status in ('sent', 'failed')),
  detail     text,
  created_at timestamptz not null default now()
);

comment on table parent_report_emails is
  'Every Section Progress Report emailed to a parent, sent or failed — written by email_parent_report only (0103).';

create index if not exists parent_report_emails_student on parent_report_emails (student_id, created_at desc);

alter table parent_report_emails enable row level security;

drop policy if exists parent_report_emails_staff_read on parent_report_emails;
create policy parent_report_emails_staff_read on parent_report_emails for select
  using ((select is_teacher()));

drop policy if exists parent_report_emails_pc_read on parent_report_emails;
create policy parent_report_emails_pc_read on parent_report_emails for select
  using ((select is_pc())
         and exists (select 1 from profiles s where s.id = student_id and s.pc_id = (select auth.uid())));

revoke insert, update, delete, truncate on parent_report_emails from anon, authenticated;

-- ----------------------------------------------------------------- setting ---
create or replace function public.set_parent_contact(p_student uuid, p_name text, p_email text)
returns void
language plpgsql security definer set search_path = public as $$
declare
  v_email text := nullif(lower(btrim(coalesce(p_email, ''))), '');
  v_name  text := nullif(btrim(coalesce(p_name, '')), '');
begin
  if not exists (select 1 from profiles where id = p_student and role = 'student') then
    raise exception 'no such student';
  end if;
  if not (is_admin()
          or (is_pc() and exists (select 1 from profiles where id = p_student and pc_id = auth.uid()))) then
    raise exception 'only the student''s PC or an admin sets the parent''s email';
  end if;
  if v_email is not null and v_email !~ '^[^@\s]+@[^@\s]+\.[^@\s]+$' then
    raise exception 'that is not an email address';
  end if;

  if v_email is null and v_name is null then
    delete from student_parents where student_id = p_student;
    return;
  end if;

  insert into student_parents (student_id, parent_name, parent_email, updated_at, updated_by)
  values (p_student, v_name, v_email, now(), auth.uid())
  on conflict (student_id) do update
     set parent_name = excluded.parent_name,
         parent_email = excluded.parent_email,
         updated_at = now(),
         updated_by = auth.uid();
end $$;

revoke execute on function public.set_parent_contact(uuid, text, text) from public, anon, authenticated;
grant  execute on function public.set_parent_contact(uuid, text, text) to authenticated;

comment on function public.set_parent_contact(uuid, text, text) is
  'The student''s PC, or an admin, sets the parent''s name and email the Section Progress Report goes to; both empty forgets them (0103).';
