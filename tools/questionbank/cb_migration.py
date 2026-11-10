"""Write the migration that puts collegeboard.py's text into the bank.

    python3 tools/questionbank/cb_migration.py cb.json refs.txt HEADER.sql > supabase/migrations/00xx_….sql

cb.json is collegeboard.py's output; refs.txt has a line per question,
"CB-xxxxxxxx kind md5prefix key", the first eight characters of the md5 of the
stem the bank holds now. Every update is by source_ref and only of a question
whose stem still has that md5, so a question corrected by hand since is left
alone, and a second run changes nothing: each question's options and key are
written before its stem, while the guard still holds.
"""
import json
import sys

FIG = "/question-figures/cb/{}.png"


def lit(s: str | None) -> str:
    if s is None:
        return "null"
    assert "$qb$" not in s
    return f"$qb${s}$qb$"


def main(cb_path: str, refs_path: str, header_path: str) -> None:
    guard = {}
    for line in open(refs_path, encoding="utf-8"):
        if line.strip():
            ref, _kind, old8, *_ = line.split()
            guard[ref] = old8
    out = [open(header_path, encoding="utf-8").read().rstrip("\n"), ""]
    for q in sorted(json.load(open(cb_path, encoding="utf-8")), key=lambda q: q["ref"]):
        ref, old8 = q["ref"], guard[q["ref"]]
        where = f"q.source_ref = '{ref}' and left(md5(q.stem), 8) = '{old8}'"
        for o in q["options"]:
            img = FIG.format(f"{ref}-{o['label']}") if o["figures"] else None
            out.append(
                f"update question_options o set body = {lit(o['text'])}, image_url = {lit(img)} "
                f"from questions q where q.id = o.question_id and o.label = '{o['label']}' and {where};"
            )
        out.append(
            f"update question_keys k set explanation = {lit(q['explanation'])} "
            f"from questions q where q.id = k.question_id and {where};"
        )
        img = FIG.format(ref) if q["figures"] else None
        out.append(
            f"update questions set stem = {lit(q['stem'])}, image_url = {lit(img)}, updated_at = now() "
            f"where source_ref = '{ref}' and left(md5(stem), 8) = '{old8}';"
        )
    sys.stdout.write("\n".join(out) + "\n")


if __name__ == "__main__":
    main(*sys.argv[1:4])
