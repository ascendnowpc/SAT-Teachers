"""
Read the imported bank back out of its migrations.

    python3 tools/questionbank/from_migrations.py supabase/migrations --out rows.json

0075–0084 are the import: one seed_pool_question call per question, each value
dollar-quoted. They are the bank as it was loaded, so they are what a later
correction is worked out from — without the export PDFs, which are not kept in
the repository. Each row comes back with the fields make_migration.py wrote.
"""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

TAG = "$qb$"
START = "select seed_pool_question("
FIELDS = ("source_ref", "subject", "section", "skill", "difficulty", "passage", "stem",
          "image_url", "options", "correct", "accepted", "explanation")


def _calls(text: str):
    """The argument text of every seed_pool_question call, quoting respected."""
    i = 0
    while True:
        i = text.find(START, i)
        if i < 0:
            return
        j = i + len(START)
        depth = 1
        while depth:
            if text.startswith(TAG, j):
                j = text.index(TAG, j + len(TAG)) + len(TAG)
                continue
            depth += {"(": 1, ")": -1}.get(text[j], 0)
            j += 1
        yield text[i + len(START): j - 1]
        i = j


def _args(s: str) -> list[str]:
    out, cur, i, depth = [], "", 0, 0
    while i < len(s):
        if s.startswith(TAG, i):
            k = s.index(TAG, i + len(TAG)) + len(TAG)
            cur, i = cur + s[i:k], k
            continue
        c = s[i]
        depth += {"(": 1, "[": 1, ")": -1, "]": -1}.get(c, 0)
        if c == "," and depth == 0:
            out.append(cur.strip())
            cur = ""
        else:
            cur += c
        i += 1
    out.append(cur.strip())
    return out


def _value(a: str):
    if a == "null":
        return None
    m = re.fullmatch(r"\$qb\$(.*)\$qb\$(::[\w\[\]]+)?", a, re.S)
    if m:
        return m.group(1)
    m = re.fullmatch(r"'(.*)'::answer_option", a)
    if m:
        return m.group(1)
    if a.startswith("array["):
        return re.findall(r"\$qb\$(.*?)\$qb\$", a, re.S)
    return a


def read(migrations: Path) -> list[dict]:
    rows = []
    for f in sorted(migrations.glob("00[78][0-9]_*question_bank_*.sql")):
        for call in _calls(f.read_text()):
            values = [_value(a) for a in _args(call)]
            if len(values) != len(FIELDS):
                raise ValueError(f"{f.name}: {len(values)} arguments in {call[:80]}")
            row = dict(zip(FIELDS, values))
            row["options"] = json.loads(row["options"]) if row["options"] else None
            row["file"] = f.name
            rows.append(row)
    return rows


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("migrations", type=Path)
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()
    rows = read(args.migrations)
    args.out.write_text(json.dumps(rows, ensure_ascii=False))
    print(f"{len(rows)} questions -> {args.out}")


if __name__ == "__main__":
    main()
