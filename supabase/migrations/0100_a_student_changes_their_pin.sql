-- ============================================================================
--  0100 — a student changes their own PIN
--
--  0067 gave each student a PIN, and only a tutor or an admin could change it
--  (reset_student_pin). Now the student — or their parent, signed in with the
--  student's ID and PIN — changes it from Settings in their account:
--
--    student_change_pin(key, current, new)
--
--  It asks for the current PIN as well as the key, so a device left signed in
--  is not enough to lock the student out. A wrong current PIN counts towards
--  0067's lock exactly as a wrong PIN at sign-in does (five wrong: fifteen
--  minutes, doubling), and it returns what happened rather than raising it,
--  because a raise would roll back the very count that slows guessing.
--
--    {ok: true}
--    {ok: false, reason: 'wrong'}            the current PIN does not match
--    {ok: false, reason: 'locked', until}
--    {ok: false, reason: 'invalid'}          the new one is not four digits
--    {ok: false, reason: 'same'}             the new one is the current one
--
--  A changed PIN signs the student out everywhere else — every other key is
--  deleted — and keeps this device signed in. Staff and the student's PC still
--  read the PIN (0067), as they need to when a student forgets it.
-- ============================================================================

create or replace function public.student_change_pin(p_key text, p_current text, p_new text)
returns jsonb
language plpgsql security definer set search_path = public as $$
declare
  v_student uuid := student_for_key(p_key);
  v_pins    student_pins;
  v_tries   int;
  v_new     text := btrim(coalesce(p_new, ''));
begin
  select * into v_pins from student_pins where student_id = v_student for update;
  if v_pins.student_id is null then raise exception 'no PIN for this student'; end if;

  if v_pins.locked_until is not null and v_pins.locked_until > now() then
    return jsonb_build_object('ok', false, 'reason', 'locked', 'until', v_pins.locked_until);
  end if;

  if v_pins.pin <> btrim(coalesce(p_current, '')) then
    v_tries := v_pins.failed_attempts + 1;
    update student_pins
       set failed_attempts = v_tries,
           locked_until = case when v_tries % 5 = 0
                               then now() + least(interval '15 minutes' * power(2, v_tries / 5 - 1),
                                                  interval '1 day')
                          end
     where student_id = v_student
    returning locked_until into v_pins.locked_until;
    if v_pins.locked_until is not null then
      return jsonb_build_object('ok', false, 'reason', 'locked', 'until', v_pins.locked_until);
    end if;
    return jsonb_build_object('ok', false, 'reason', 'wrong');
  end if;

  if v_new !~ '^[0-9]{4}$' then
    return jsonb_build_object('ok', false, 'reason', 'invalid');
  end if;
  if v_new = v_pins.pin then
    return jsonb_build_object('ok', false, 'reason', 'same');
  end if;

  update student_pins
     set pin = v_new, failed_attempts = 0, locked_until = null, updated_at = now()
   where student_id = v_student;

  -- Signed out everywhere but here.
  delete from student_login_keys
   where student_id = v_student
     and key_hash <> encode(sha256(convert_to(coalesce(p_key, ''), 'UTF8')), 'hex');

  return jsonb_build_object('ok', true);
end $$;

revoke execute on function public.student_change_pin(text, text, text) from public, anon, authenticated;
grant  execute on function public.student_change_pin(text, text, text) to anon, authenticated;

comment on function public.student_change_pin(text, text, text) is
  'The signed-in student changes their own PIN, given the current one; wrong guesses count towards the sign-in lock, and every other device is signed out (0100).';
