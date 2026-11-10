"""
Turn tidy.py's output into the migrations that put it into the bank.

    python3 tools/questionbank/make_update.py rows.json tidy.json \\
        --number 91 --title the_english_bank_as_text --out supabase/migrations

Each question is one update by source_ref, and only of a question that still
reads as the import left it: the stem is checked against the one 0075–0085
wrote, so a question a teacher has corrected since is left alone, and running
the migration a second time changes nothing.

Two files, because two kinds of change are ready at different times. Text is
ready the moment the migration runs. A figure cut out of a whole-question
picture is served from the app's public folder, so it exists only once the app
is deployed — the questions that point at one are in their own migration, to
be applied after that deploy and not before, or they would show a broken
picture in between.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

TAG = "$qb$"
PICTURE_STEM = "This question is shown as a picture."


def lit(value) -> str:
    if value is None or value == "":
        return "null"
    text = str(value)
    if TAG in text:
        raise ValueError(f"text contains the quoting tag: {text[:60]}")
    if "\x00" in text:
        raise ValueError(f"text contains a NUL, which psql cuts the line at: {text[:60]}")
    return f"{TAG}{text}{TAG}"


def as_stored(text: str) -> str:
    """What the import actually stored, given what it wrote.

    The export maps a few characters to nothing — the ʻokina of "Hawaiʻi", a
    minus on a graph's axis — and the import wrote them as NUL bytes, which
    psql takes as the end of the line: everything from the NUL to the end of
    its line, the line break included, never reached the database.
    """
    return re.sub(r"\x00[^\n]*\n?", "", text)


def md5(s: str) -> str:
    return hashlib.md5(s.encode("utf-8")).hexdigest()


def rubble(stem: str) -> bool:
    return "??" in stem or stem.count("|") > 4


def update(before: dict, after: dict) -> str:
    """One question's update, guarded by the stem the import left it with."""
    current = PICTURE_STEM if before.get("image_url") and rubble(before["stem"]) else as_stored(before["stem"])
    return (
        "update questions set "
        f"passage = {lit(after.get('passage'))}, "
        f"passage_underline = {lit(after.get('passage_underline'))}, "
        f"stem = {lit(after['stem'])}, "
        f"image_url = {lit(after.get('image_url'))} "
        f"where source_ref = '{after['source_ref']}' and md5(stem) = '{md5(current)}';"
    )


HEADER = """\
-- ============================================================================
--  {number} — {heading}
--
{body}
--
--  {count} questions. Written by tools/questionbank/make_update.py from the
--  bank as 0075–0085 left it; each update is by source_ref and only of a
--  question whose stem is still the imported one, so a question corrected
--  by hand since is not touched, and a second run changes nothing.
-- ============================================================================

"""


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("rows", type=Path, help="the bank as imported (from_migrations.py)")
    ap.add_argument("tidy", type=Path, help="tidy.py's output")
    ap.add_argument("--number", type=int, required=True)
    ap.add_argument("--subject", default="english")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()

    before = {r["source_ref"]: r for r in json.loads(args.rows.read_text())}
    after = [r for r in json.loads(args.tidy.read_text()) if r["subject"] == args.subject]

    text, figures = [], []
    for r in after:
        b = before[r["source_ref"]]
        if "figure not cut yet" in (r.get("tidy_notes") or []):
            continue
        if (r.get("image_url") or "").startswith("/question-figures/"):
            figures.append(update(b, r))
        else:
            text.append((b, r))

    # The text questions still hold their imported stem in the database, so
    # their migration carries the rules (tidy_english.sql) rather than the
    # text — a few kilobytes instead of a megabyte. What the rules cannot
    # rebuild from the database is data: the underlines, and any question
    # whose stored stem lost words to a NUL (as_stored), which goes in whole.
    underlines = {r["source_ref"]: r["passage_underline"] for _, r in text if r.get("passage_underline")}
    blob = json.dumps(underlines, ensure_ascii=False, sort_keys=True)
    if "'" in blob:
        raise ValueError("an underline holds a quote mark; quote the JSON before embedding it")
    damaged = [(b, r) for b, r in text if as_stored(b["stem"]) != b["stem"]]
    exceptions = "array[" + ", ".join(f"'{r['source_ref']}'" for _, r in damaged) + "]::text[]"
    rules = (Path(__file__).with_name("tidy_english.sql").read_text()
             .replace("{{UNDERLINES}}", blob).replace("{{EXCEPTIONS}}", exceptions))
    whole = "\n".join(
        update(b, r).replace(" where ", " where passage is null and ", 1) for b, r in damaged
    )
    text_sql = rules + ("\n-- Stored short of a line: written out in full.\n" + whole + "\n" if whole else "")

    files = [
        (args.number, "the_english_bank_reads_as_text",
         "the English bank reads as text",
         "--  College Board's Reading and Writing questions, as the app shows its own:\n"
         "--  the passage on the left and the question alone on the right, each\n"
         "--  sentence running on instead of breaking where the printed page did, the\n"
         "--  notes of a Rhetorical Synthesis question as bullets and not a picture of\n"
         "--  them, and the underlined sentence underlined where the export's rule\n"
         "--  says which it is. No word of any question changes. The rules are\n"
         "--  tools/questionbank/tidy.py's, run here on the stems the database holds\n"
         "--  (tidy_english.sql), so this carries the rules and not the text.",
         text_sql, len(text)),
        (args.number + 1, "an_english_figure_is_only_the_figure",
         "an English figure is only the figure",
         "--  The 133 Reading and Writing questions with a chart or a table went in\n"
         "--  as a picture of the whole question. Each now has its passage and\n"
         "--  question as text and a picture of the chart or table alone, cut from\n"
         "--  the old picture (tools/questionbank/figures.py) and served from\n"
         "--  apps/web/public/question-figures/cb.\n"
         "--\n"
         "--  APPLY AFTER THE APP IS DEPLOYED with that folder in it, never before:\n"
         "--  until then the pictures these rows point at do not exist.",
         "\n".join(figures) + "\n", len(figures)),
    ]
    args.out.mkdir(parents=True, exist_ok=True)
    for number, name, heading, body, sql, count in files:
        path = args.out / f"{number:04d}_{name}.sql"
        path.write_text(HEADER.format(number=f"{number:04d}", heading=heading, body=body, count=count) + sql)
        print(f"  {path.name}  {count} questions  {path.stat().st_size // 1024} KB")


if __name__ == "__main__":
    main()
