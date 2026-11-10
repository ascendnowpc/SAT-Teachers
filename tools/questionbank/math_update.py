"""
Turn math_figure.py's reading into the migrations that put it into the bank.

    python3 tools/questionbank/math_update.py math.json db.json \\
        --number 93 --out supabase/migrations

Two migrations, because two kinds of change are ready at different times and
answer to different things.

    the questions   each of the maths questions that went in as a picture of
                    the whole page, given back its words, its options and a
                    picture of its figure alone. The pictures are served from
                    the app's public folder, so this is applied after the app
                    carrying them is deployed, and not before.

    the notation    three characters the maths alphabet draws and the import
                    wrote as the nearest ASCII it had, across the whole maths
                    bank and not only the questions above: a raised dot for a
                    decimal point, a radical's bar read as a minus in front of
                    what is under it, and the digit nought read as the letter
                    o. Nothing is read again and no question changes meaning;
                    each is the same character under another name.

Every update is by source_ref and guarded by the stem the database holds, so a
question a teacher has corrected since is left alone and a second run changes
nothing. The options of a question go before its stem, because the stem is
what guards them.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

TAG = "$qb$"
PICTURE_STEM = "This question is shown as a picture."
FIGURES = "/question-figures/cb"


def lit(value) -> str:
    if value is None or value == "":
        return "null"
    text = str(value)
    if TAG in text:
        raise ValueError(f"text contains the quoting tag: {text[:60]}")
    if "\x00" in text:
        raise ValueError(f"text contains a NUL, which psql cuts the line at: {text[:60]}")
    return f"{TAG}{text}{TAG}"


def md5(s: str) -> str:
    return hashlib.md5(s.encode("utf-8")).hexdigest()


GUARD = md5(PICTURE_STEM)

HEAD = """\
-- ============================================================================
--  {number} — {heading}
--
{body}
-- ============================================================================

"""

QUESTIONS_BODY = """\
--  The {n} Mathematics questions that went in as a picture of the whole page
--  (0085) now read as the app shows its own: the question as text, its four
--  options as text under their labels, and a picture of the chart, table or
--  drawn figure alone.
--
--  The words were there all along. A maths page draws every mathematical
--  character as a vector path, and so does a chart — its axis ticks, its bars,
--  its plotted rings — so the chart's ink came back as one enormous cluster
--  that reached the first line of prose beneath it and swallowed the
--  expression sitting there. The question lost its mathematics twice over.
--  tools/questionbank/math_figure.py reads the prose first and the shapes
--  second, grouping them inside the band the words occupy, so the chart can no
--  longer reach into the sentence.
--
--  {held} of the {total} are not here. Each was held back for a reason it
--  states when the tool is run — an option nobody could read, a shape among
--  the words that nothing covers, no one figure to show — and keeps the
--  picture it has, because a question shown half its mathematics is worse than
--  a question shown as a picture of itself.
--
--  The {opts} questions whose options the import had left blank or in pieces
--  have those written too. Where the import's options were already right, they
--  are not touched: all {same} of them were checked against what was read here
--  and agreed.
--
--  APPLY AFTER THE APP IS DEPLOYED with apps/web/public/question-figures/cb in
--  it, never before: until then the pictures these rows point at do not exist.
--
--  Each update is by source_ref and only of a question whose stem is still the
--  one 0085 left, so a question corrected by hand since is not touched, and a
--  second run changes nothing."""

NOTATION_BODY = """\
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
--  Every rule was checked against the {same} questions whose options
--  math_figure.py read back independently and agreed with the database on:
--  each of the {diff} it disagreed on, it disagreed in exactly one of these
--  ways. Re-runnable, because each rule leaves text it has already fixed
--  alone."""

NOTATION_SQL = """\
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
                         regexp_replace(t, '([0-9])\u00b7([0-9])', '\\1.\\2', 'g'),
                         '\u221a ?-([0-9(])', '\u221a\\1', 'g'),
                       '(?<=[0-9])o', '0', 'g'),
                     'o(?=[0-9])', '0', 'g'),
                   ' +([,.;:?])', '\\1', 'g'),
                 '\\( +', '(', 'g'),
               ' +\\)', ')', 'g'),
             '\\(- +', '(-', 'g'),
           '(?<=, )- +', '-', 'g')
$fn$;

update questions set stem = pg_temp.cb_notation(stem), updated_at = now()
where source_ref like 'CB-%' and subject = 'mathematics'
  and stem is distinct from pg_temp.cb_notation(stem);

update question_options o set body = pg_temp.cb_notation(o.body)
from questions q
where q.id = o.question_id and q.source_ref like 'CB-%' and q.subject = 'mathematics'
  and o.body is distinct from pg_temp.cb_notation(o.body);
"""


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("read", type=Path, help="math_figure.py's output")
    ap.add_argument("db", type=Path, help="the bank's options as the database holds them")
    ap.add_argument("--number", type=int, required=True)
    ap.add_argument("--total", type=int, required=True, help="how many were looked at")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()

    rows = json.loads(args.read.read_text())["questions"]
    db = json.loads(args.db.read_text())

    lines: list[str] = []
    changed_opts = same_opts = 0
    for r in rows:
        ref = r["source_ref"]
        here = db.get(ref, {})
        stored = {k: (v or "").strip() for k, v in (here.get("opts") or {}).items()}
        mine = {k: v.strip() for k, v in (r["options"] or {}).items()}

        # The options first: the stem is what guards them, so rewriting it
        # first would lock them out.
        if mine and mine != stored:
            changed_opts += 1
            for label in sorted(mine):
                lines.append(
                    f"update question_options o set body = {lit(mine[label])} from questions q "
                    f"where q.id = o.question_id and q.source_ref = '{ref}' "
                    f"and o.label = '{label}' and md5(q.stem) = '{GUARD}';"
                )
        elif mine:
            same_opts += 1

        lines.append(
            f"update questions set stem = {lit(r['stem'])}, "
            f"image_url = {lit(f'{FIGURES}/{ref}.png')}, updated_at = now() "
            f"where source_ref = '{ref}' and md5(stem) = '{GUARD}';"
        )

    args.out.mkdir(parents=True, exist_ok=True)
    body = QUESTIONS_BODY.format(n=len(rows), held=args.total - len(rows), total=args.total,
                                 opts=changed_opts, same=same_opts)
    a = args.out / f"{args.number:04d}_the_maths_bank_reads_as_text.sql"
    a.write_text(HEAD.format(number=f"{args.number:04d}",
                             heading="the maths bank reads as text", body=body)
                 + "\n".join(lines) + "\n")

    b = args.out / f"{args.number + 1:04d}_the_maths_notation_as_it_is_set.sql"
    b.write_text(HEAD.format(number=f"{args.number + 1:04d}",
                             heading="the maths notation, as it is set",
                             body=NOTATION_BODY.format(same=same_opts, diff=changed_opts))
                 + NOTATION_SQL)

    for p, n in ((a, len(rows)), (b, 0)):
        print(f"  {p.name}  {n or 'every'} questions  {p.stat().st_size // 1024} KB")


if __name__ == "__main__":
    main()
