-- ============================================================================
--  0094 — the maths notation, as it is set
--
--  Three characters the maths alphabet draws rather than writes, which the
--  import wrote as the nearest ASCII the labelling had for them. None of this
--  reads the export again and none of it changes what a question says; each is
--  the same character under another name.
--
--      a decimal point   drawn as a raised dot, so "0·9" is "0.9". A dot with
--                        space around it is multiplication and is left alone.
--      a radical's bar   drawn as the rule over what is under the root, and
--                        read as a minus in front of it: "3√-13" is "3√13".
--      the digit nought  labelled from the same shapes as the letter o, so a
--                        numeral can come back with an o in it: "1o/27" is
--                        "10/27". Only where a digit stands beside it, which
--                        is never a word.
--
--  And the space an expression set inline leaves inside the brackets it is set
--  in: "( 7/2 , 9/2 )" for "(7/2, 9/2)".
--
--  Mathematics only. The English bank writes a raised dot for a bullet (0091),
--  which is not a decimal point.
--
--  Every rule was checked against the 147 questions whose options
--  math_figure.py read back independently and agreed with the database on:
--  each of the 46 it disagreed on, it disagreed in exactly one of these
--  ways. Re-runnable, because each rule leaves text it has already fixed
--  alone.
-- ============================================================================

-- One expression, used on a stem and on an option alike: the raised dot
-- between two digits, the radical's bar, the nought read as an o on either
-- side of a digit, and the space an inline expression leaves against the
-- punctuation and the brackets it is set in.
create or replace function pg_temp.cb_notation(t text) returns text
language sql immutable as $fn$
  select regexp_replace(
           regexp_replace(
             regexp_replace(
               regexp_replace(
                 regexp_replace(
                   regexp_replace(
                     regexp_replace(
                       regexp_replace(
                         regexp_replace(t, '([0-9])·([0-9])', '\1.\2', 'g'),
                         '√ ?-([0-9(])', '√\1', 'g'),
                       '(?<=[0-9])o', '0', 'g'),
                     'o(?=[0-9])', '0', 'g'),
                   ' +([,.;:?])', '\1', 'g'),
                 '\( +', '(', 'g'),
               ' +\)', ')', 'g'),
             '\(- +', '(-', 'g'),
           '(?<=, )- +', '-', 'g')
$fn$;

update questions set stem = pg_temp.cb_notation(stem), updated_at = now()
where source_ref like 'CB-%' and subject = 'mathematics'
  and stem is distinct from pg_temp.cb_notation(stem);

update question_options o set body = pg_temp.cb_notation(o.body)
from questions q
where q.id = o.question_id and q.source_ref like 'CB-%' and q.subject = 'mathematics'
  and o.body is distinct from pg_temp.cb_notation(o.body);
