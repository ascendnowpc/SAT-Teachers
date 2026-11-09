"""
Turn a read manifest into the migration that loads it.

    python3 tools/questionbank/make_migration.py \
        --manifest bank.json --number 0075 --title english_questions \
        --images https://<project>.supabase.co/storage/v1/object/public/question-images \
        --out supabase/migrations

Every question becomes one seed_pool_question call (0074), which upserts on
source_ref — so the migration is re-runnable and says the same thing on a
fresh database and on the live one.

Two kinds of question come out of the manifest:

    choice   four options and a key of A, B, C or D.
    entry    no options, and College Board's accepted answers — ".1764, .1765,
             3/17" is one key, because a repeating decimal may be truncated or
             rounded (0073).

A question College Board's export gives no key for is left out and listed at
the end of the run. There are 81 of them, all mathematics, all older items
whose answer is only stated inside the rationale prose; importing them would
mean guessing what counts as right, and a question nobody can be marked
against is worse than a question that is not there.

The output is split into files of --chunk questions so that no single
migration is too large to apply in one go.
"""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

# Written as a dollar-quoted string, so the tag must not appear in the text.
TAG = "$qb$"

# What a question says when its own words could not be read and the picture is
# carrying it. Without this the stem the decoder gave up on — a hedge of rules
# and question marks — is what the student is shown beside a perfectly good
# picture of the question.
PICTURE_STEM = "This question is shown as a picture."


def is_rubble(stem: str) -> bool:
    """Whether a stem came out as wreckage rather than words."""
    return "??" in stem or stem.count("|") > 4


def lit(value) -> str:
    """One value as SQL."""
    if value is None or value == "":
        return "null"
    if isinstance(value, bool):
        return "true" if value else "false"
    if isinstance(value, (int, float)):
        return str(value)
    text = str(value)
    if TAG in text:
        # No question in the export contains it; say so rather than emit
        # something that would close the quote early.
        raise ValueError(f"text contains the quoting tag: {text[:60]}")
    return f"{TAG}{text}{TAG}"


def accepted_of(correct: str) -> list[str]:
    """College Board's accepted answers, as it writes them.

    Split on a comma followed by a space, which is how the export separates
    them — never on the comma alone, because "1,100" is one answer.
    """
    return [a.strip() for a in re.split(r",\s+", correct.strip()) if a.strip()]


def call(q: dict, images: str | None) -> str | None:
    correct = (q.get("correct") or "").strip()
    if not correct:
        return None

    choice = bool(re.fullmatch(r"[A-D]", correct))
    options = q.get("options") or {}
    if choice and len(options) != 4:
        return None

    image = None
    if q.get("image_file") and images:
        image = f"{images.rstrip('/')}/{q['image_file']}"

    if choice:
        opts = json.dumps(
            [{"label": k, "body": options[k]} for k in ("A", "B", "C", "D")],
            ensure_ascii=False,
        )
        options_sql = f"{lit(opts)}::jsonb"
        correct_sql = f"'{correct}'::answer_option"
        accepted_sql = "null"
    else:
        options_sql = "null"
        correct_sql = "null"
        answers = accepted_of(correct)
        if not answers:
            return None
        accepted_sql = "array[" + ", ".join(lit(a) for a in answers) + "]::text[]"

    # A picture is only a replacement for the words when the words are gone.
    # Where the prose survived it is kept, even on a question that also has a
    # picture — most of those are a chart beside a perfectly readable stem.
    stem = q["stem"]
    if image and is_rubble(stem):
        stem = PICTURE_STEM

    return (
        "select seed_pool_question("
        f"{lit(q['source_ref'])}, {lit(q['subject'])}, {lit(q['section'])}, {lit(q['skill'])}, "
        f"{lit(q['difficulty'])}::difficulty_level, {lit(q.get('passage'))}, {lit(stem)}, "
        f"{lit(image)}, {options_sql}, {correct_sql}, {accepted_sql}, {lit(q.get('explanation'))});"
    )


HEADER = """\
-- ============================================================================
--  {number} — {heading}
--
--  {count} questions from College Board's SAT Suite Question Bank, into the
--  {subject} practice pool. Part {part} of {parts}.
--
--  Read out of the export by tools/questionbank (see the README): the prose
--  from its text, the mathematics from the shapes it is drawn with, and a
--  picture of the figure where a question carries one. Every row names its
--  own question by College Board's id, so running this twice writes the same
--  bank — and a question already in the pool keeps its place in it.
-- ============================================================================

"""


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--manifest", type=Path, required=True)
    ap.add_argument("--number", type=int, required=True, help="first migration number")
    ap.add_argument("--title", required=True, help="file-name title, in_this_shape")
    ap.add_argument("--heading", required=True, help="the line after the number")
    ap.add_argument("--images", default=None, help="public base URL of the pictures bucket")
    ap.add_argument("--chunk", type=int, default=500)
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()

    data = json.loads(args.manifest.read_text())
    rows: list[str] = []
    skipped: list[str] = []
    subject = ""
    for q in data["questions"]:
        subject = q["subject"]
        line = call(q, args.images)
        if line is None:
            skipped.append(q["source_ref"])
        else:
            rows.append(line)

    chunks = [rows[i : i + args.chunk] for i in range(0, len(rows), args.chunk)]
    args.out.mkdir(parents=True, exist_ok=True)
    for n, chunk in enumerate(chunks):
        number = f"{args.number + n:04d}"
        name = args.title if len(chunks) == 1 else f"{args.title}_{n + 1}"
        path = args.out / f"{number}_{name}.sql"
        path.write_text(
            HEADER.format(
                number=number,
                heading=args.heading,
                count=len(chunk),
                subject="English" if subject == "english" else "Mathematics",
                part=n + 1,
                parts=len(chunks),
            )
            + "\n".join(chunk)
            + "\n"
        )
        print(f"  {path.name}  {len(chunk)} questions  {path.stat().st_size // 1024} KB")

    print(f"{len(rows)} questions written, {len(skipped)} left out (no key in the export)")
    if skipped:
        print("  " + ", ".join(skipped[:8]) + (" ..." if len(skipped) > 8 else ""))


if __name__ == "__main__":
    main()
