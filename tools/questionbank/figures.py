"""
Cut the chart or table out of a picture of a whole question.

    python3 tools/questionbank/figures.py tidy.json --pictures ./pictures \\
        --out apps/web/public/question-figures/cb

For a Reading and Writing question with a chart or a table, the decoder
could not read the figure, so the whole question went in as one picture —
the figure, the passage, the question and the choices (pictures.py, "whole").
tidy.py gives the passage and the question back as text, so the picture
should carry the figure and nothing else.

College Board sets a figure centred above the passage, and every line of the
passage starts at the left margin. So the figure is everything above the
first run of printed lines that start at the picture's left edge — a test
read off the picture's own ink, not off the decoder, which is what failed.
Every figure this cut was checked by eye against the picture it came from.

The result is greyscale, which every one of these charts and tables already
is, held to 32 shades: a third of the bytes and no visible difference.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import numpy as np
from PIL import Image

INK = 200          # darker than this is ink when the lines are found
PAPER = 248        # lighter than this is paper when the sides are trimmed
LEFT = 22          # a printed line starts this close to the picture's left edge
PAD = 10           # room left round the figure, in pixels


def rows_of_ink(im: Image.Image) -> list[list[int]]:
    """Each horizontal run of ink as [top, bottom, left, right]."""
    a = np.asarray(im.convert("L"))
    on = (a < INK).any(axis=1)
    out: list[list[int]] = []
    y, h = 0, len(on)
    while y < h:
        if not on[y]:
            y += 1
            continue
        top = y
        while y < h and on[y]:
            y += 1
        cols = np.where((a[top:y] < INK).any(axis=0))[0]
        out.append([top, y, int(cols[0]), int(cols[-1]) + 1])
    # A pixel or two of white inside one printed line — the dot of an i, an
    # accent — is not a new line.
    merged: list[list[int]] = []
    for b in out:
        if merged and b[0] - merged[-1][1] <= 2:
            m = merged[-1]
            m[1], m[2], m[3] = b[1], min(m[2], b[2]), max(m[3], b[3])
        else:
            merged.append(b)
    return merged


def first_text_line(rows: list[list[int]]) -> int | None:
    """The index of the passage's first line: a line-high run of ink at the
    left margin, followed by another one there (or by nothing)."""
    for k, (top, bottom, left, _) in enumerate(rows):
        if left <= LEFT and 14 <= bottom - top <= 34:
            nxt = rows[k + 1] if k + 1 < len(rows) else None
            if nxt is None or nxt[2] <= LEFT + 40:
                return k
    return None


def cut(path: Path) -> Image.Image | None:
    """The figure above the passage, or None when there is none to cut."""
    im = Image.open(path).convert("RGB")
    rows = rows_of_ink(im)
    k = first_text_line(rows)
    if not k:
        return None
    fig = im.crop((0, 0, im.width, min(im.height, rows[k - 1][1] + PAD)))
    a = np.asarray(fig.convert("L"))
    cols = np.where((a < PAPER).any(axis=0))[0]
    fig = fig.crop((max(0, int(cols[0]) - PAD), 0, min(fig.width, int(cols[-1]) + 1 + PAD), fig.height))
    return fig.convert("L").quantize(colors=32)


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("rows", type=Path, help="the bank as imported, from from_migrations.py")
    ap.add_argument("--pictures", type=Path, required=True,
                    help="the questions' current pictures, named by source_ref")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()

    def rubble(stem: str) -> bool:
        return "??" in stem or stem.count("|") > 4

    rows = json.loads(args.rows.read_text())
    args.out.mkdir(parents=True, exist_ok=True)
    made, skipped = 0, []
    for r in rows:
        if r["subject"] != "english" or not r.get("image_url"):
            continue
        # Only a question that went in as a whole picture has a figure to cut.
        if not rubble(r["stem"]):
            continue
        src = args.pictures / f"{r['source_ref']}.png"
        fig = cut(src) if src.exists() else None
        if fig is None:
            skipped.append(r["source_ref"])
            continue
        fig.save(args.out / f"{r['source_ref']}.png", optimize=True)
        made += 1
    print(f"{made} figures -> {args.out}")
    if skipped:
        print(f"  no figure found in {len(skipped)}: {', '.join(skipped)}")


if __name__ == "__main__":
    main()
