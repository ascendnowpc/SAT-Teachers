"""
Cut each maths question's figure, and nothing else, out of the export.

    python3 tools/questionbank/math_pictures.py INPUT.pdf --manifest math.json \\
        --out apps/web/public/question-figures/cb

math_figure.py gives back each question's words and the box its figure stands
in. This cuts that box out of the page: rendered at 200 dpi, which is what the
export's own bitmaps are drawn at, trimmed to its ink so a chart does not
arrive surrounded by half a page of white, and held to 32 shades of grey,
which every one of these charts already is — a third of the bytes and no
visible difference.

Beside the English figures (figures.py), in the app's public folder rather
than the question-images bucket, because these are served with the app.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import numpy as np
import pymupdf
from PIL import Image

DPI = 200
PAPER = 248   # lighter than this is paper when the crop is trimmed
PAD = 10      # room left round the figure, in pixels


def trim(im: Image.Image) -> Image.Image:
    """The picture, cut back to its own ink with a little room round it."""
    a = np.asarray(im.convert("L"))
    ink = a < PAPER
    rows = np.where(ink.any(axis=1))[0]
    cols = np.where(ink.any(axis=0))[0]
    if not len(rows) or not len(cols):
        return im
    return im.crop((max(0, int(cols[0]) - PAD), max(0, int(rows[0]) - PAD),
                    min(im.width, int(cols[-1]) + 1 + PAD),
                    min(im.height, int(rows[-1]) + 1 + PAD)))


def cut(doc, fig: dict) -> Image.Image:
    page = doc[fig["page"] - 1]
    clip = pymupdf.Rect(fig["x0"], fig["y0"], fig["x1"], fig["y1"])
    pix = page.get_pixmap(dpi=DPI, clip=clip)
    im = Image.frombytes("RGB" if pix.n >= 3 else "L", (pix.width, pix.height), pix.samples)
    return trim(im).convert("L").quantize(colors=32)


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("pdf", type=Path)
    ap.add_argument("--manifest", type=Path, required=True)
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()

    doc = pymupdf.open(args.pdf)
    rows = json.loads(args.manifest.read_text())["questions"]
    args.out.mkdir(parents=True, exist_ok=True)

    made, small = 0, []
    for r in rows:
        if not r.get("figure"):
            continue
        im = cut(doc, r["figure"])
        # A crop of nothing is not a figure; say so rather than write a sliver.
        if im.width < 40 or im.height < 40:
            small.append(r["source_ref"])
            continue
        im.save(args.out / f"{r['source_ref']}.png", optimize=True)
        made += 1
    print(f"{made} figures -> {args.out}")
    if small:
        print(f"  too small to be a figure, {len(small)}: {', '.join(small)}")


if __name__ == "__main__":
    main()
