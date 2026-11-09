"""
Cut the picture for every question that could not be read in full.

    python3 tools/questionbank/pictures.py INPUT.pdf --manifest bank.json --out ./pictures

extract.py reads what it can and marks the rest. What is left is nearly always
a figure: a chart, a plotted grid, a table, a drawn triangle — or, in 359 of
the bank's older maths questions, the whole question as a bitmap. None of that
is text, and none of it should be guessed at, so it is cut out of the page as
it stands and carried as the question's picture.

Two shapes of crop, because there are two shapes of problem:

    figure   the prose read cleanly and only a figure did not. The figure
             alone is cut, and the question keeps its real stem and options.
             It lands in questions.image_url, which is the stimulus pane the
             app already draws a figure in (0020) — so nothing about the app
             has to change for these.
    whole    the prose itself came out with holes in it. Nothing of that
             question can be trusted as text, so the whole of it is cut, from
             the first line to the last option.

The crop is rendered at 200 dpi, which is what the export's own bitmaps are
drawn at, and trimmed to its ink so that a figure does not arrive surrounded
by half a page of white.
"""

from __future__ import annotations

import argparse
import io
import json
from pathlib import Path

import numpy as np
import pymupdf
from PIL import Image

DPI = 200
SCALE = DPI / 72.0

# Breathing room round the ink, in points, so nothing is clipped at the edge.
# Less of it at the top: the section heading above a question sits close, and
# a generous margin catches the tails of its letters.
PAD = 5.0
PAD_TOP = 1.5

# Anything lighter than this counts as paper when the crop is trimmed.
INK = 248


def trim(im: Image.Image) -> Image.Image:
    """The picture with its margins taken off."""
    a = np.asarray(im.convert("L"))
    ink = a < INK
    if not ink.any():
        return im
    rows = np.where(ink.any(axis=1))[0]
    cols = np.where(ink.any(axis=0))[0]
    m = int(PAD * SCALE / 2)
    top = max(0, rows[0] - m)
    bottom = min(a.shape[0], rows[-1] + 1 + m)
    left = max(0, cols[0] - m)
    right = min(a.shape[1], cols[-1] + 1 + m)
    return im.crop((left, top, right, bottom))


def cut(doc, spot: dict) -> Image.Image:
    page = doc[spot["page"] - 1]
    rect = pymupdf.Rect(
        max(0.0, spot["x0"] - PAD),
        max(0.0, spot["y0"] - PAD_TOP),
        min(page.rect.x1, spot["x1"] + PAD),
        min(page.rect.y1, spot["y1"] + PAD),
    )
    pix = page.get_pixmap(clip=rect, dpi=DPI)
    return trim(Image.open(io.BytesIO(pix.tobytes("png"))).convert("RGB"))


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("pdf", type=Path)
    ap.add_argument("--manifest", type=Path, required=True)
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()

    data = json.loads(args.manifest.read_text())
    doc = pymupdf.open(args.pdf)
    args.out.mkdir(parents=True, exist_ok=True)

    made = 0
    missing = 0
    for q in data["questions"]:
        if not q.get("needs_picture"):
            continue
        spot = q.get("picture")
        if not spot:
            missing += 1
            continue
        name = f"{q['source_ref']}.png"
        im = cut(doc, spot)
        im.save(args.out / name, optimize=True)
        q["image_file"] = name
        q["image_size"] = [im.width, im.height]
        made += 1
        if made % 200 == 0:
            print(f"  {made} pictures", flush=True)

    args.manifest.write_text(json.dumps(data, indent=1))
    total = sum((args.out / f"{q['source_ref']}.png").stat().st_size
                for q in data["questions"] if q.get("image_file"))
    print(f"{made} pictures -> {args.out}  ({total / 1_048_576:.1f} MB)")
    if missing:
        print(f"  {missing} marked for a picture with nowhere to cut it")


if __name__ == "__main__":
    main()
