"""
Cut the figure each option of a question is, where the option is a figure.

    python3 tools/questionbank/math_options.py INPUT.pdf --refs refs.txt \\
        --out options.json --pictures apps/web/public/question-figures/cb

A handful of College Board's maths questions ask "which table gives three
values of x…" or "which graph represents the system?", and answer it with four
tables or four graphs. Those options are drawn, not written: the import wrote
them as the wreckage the decoder made of a table's rules — "||| ??? |||" — and
that is what a student is shown today.

There is nothing to read in them and nothing to guess at. Each option is a
figure, so each option gets a figure of its own, cut from the page the way
math_pictures.py cuts the question's: the band between one option's label and
the next, everything to the right of the label, trimmed to its ink.

A question only counts as one of these when all four of its options are
figures. A question with two drawn options and two written ones would be half
a question either way, and is listed at the end of the run instead.
"""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

import numpy as np
import pymupdf
from PIL import Image

from extract import BODY_TOP, PAGE_STRIDE, correct_y_and_text, marker_y
from math_figure import text_atoms

DPI = 200
PAPER = 248   # lighter than this is paper when the crop is trimmed
PAD = 10      # room left round a figure, in pixels
GUTTER = 2.0  # points left between the label column and the crop
YPAD = 2.0    # points of air kept above and below a figure, in points
LEAD = 6.0    # points of the label's own line kept above the figure
# White taller than this between two pieces of ink is the join between two
# figures; anything less is the gap between a table's rows.
GAP = 7.0

# A crop smaller than this in either direction is not a table or a graph.
MIN_SIDE = 30


def labels_of(doc, pages: list[int]) -> tuple[dict[str, tuple[int, float, float, float]], float | None, float | None]:
    """Each option's label: the page it is on, its box, and where the list ends.

    Returned as label -> (page, the label's own box, its y0, its stacked cy),
    with the stacked cy only so the labels can be put in reading order across
    a question that runs over more than one page. The box is kept so the label
    itself can be left out of the ink the page is read for.
    """
    flat = []
    for n, p in enumerate(pages):
        flat += text_atoms(doc[p], p, n * PAGE_STRIDE, BODY_TOP if n == 0 else 0.0)

    y_a = marker_y(flat, "Answer")
    y_c, _ = correct_y_and_text(flat)
    if y_a is None:
        return {}, None, None

    found: dict[str, tuple[int, float, float, float]] = {}
    for a in flat:
        m = re.match(r"^([A-D])\.$", a.text.strip())
        if not m or a.rect is None:
            continue
        if a.cy <= y_a or (y_c is not None and a.cy >= y_c):
            continue
        # The first time a label appears is its own; anything later is the
        # rationale talking about it.
        found.setdefault(m.group(1), (a.page, tuple(a.rect), a.rect[1], a.cy))
    return found, y_a, y_c


def ink_items(page, lo: float, hi: float,
              skip: list[tuple[float, float, float, float]]) -> list[tuple[float, float, float, float]]:
    """Every piece of ink this page puts in the band, bar the option labels.

    The labels are left out by name rather than by cutting the page at a
    margin to the right of them: a graph sets its y-axis numbers further left
    than the label column, and a cut there takes the first digit off every one
    of them.
    """
    out: list[tuple[float, float, float, float]] = []

    def add(bx0, by0, bx1, by1):
        if by1 <= lo or by0 >= hi:
            return
        out.append((max(by0, lo), min(by1, hi), bx0, bx1))

    for d in page.get_drawings():
        r = d["rect"]
        add(r.x0, r.y0, r.x1, r.y1)
    for info in page.get_image_info():
        add(*info["bbox"])
    for block in page.get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            for span in line["spans"]:
                if not span.get("text", "").strip():
                    continue
                b = span["bbox"]
                if any(abs(b[0] - r[0]) < 1 and abs(b[1] - r[1]) < 1 for r in skip):
                    continue
                add(*b)
    return out


def blocks_of(items: list[tuple[float, float, float, float]], gap: float = GAP) -> list[dict]:
    """The ink gathered into the separate figures it draws.

    The option labels cannot mark where one figure ends and the next begins:
    College Board sets "B." against the middle of the table beside it, so that
    table starts well above its own label and a crop that ran to the next
    label would carry the top of the next table with it. The white between two
    figures is the only thing that marks the join, so that is what is read.
    """
    if not items:
        return []
    out: list[dict] = []
    for y0, y1, x0, x1 in sorted(items):
        if out and y0 <= out[-1]["y1"] + gap:
            b = out[-1]
            b["y1"] = max(b["y1"], y1)
            b["x0"] = min(b["x0"], x0)
            b["x1"] = max(b["x1"], x1)
        else:
            out.append({"y0": y0, "y1": y1, "x0": x0, "x1": x1})
    return out


def trim(im: Image.Image) -> Image.Image:
    a = np.asarray(im.convert("L"))
    ink = a < PAPER
    rows = np.where(ink.any(axis=1))[0]
    cols = np.where(ink.any(axis=0))[0]
    if not len(rows) or not len(cols):
        return im
    return im.crop((max(0, int(cols[0]) - PAD), max(0, int(rows[0]) - PAD),
                    min(im.width, int(cols[-1]) + 1 + PAD),
                    min(im.height, int(rows[-1]) + 1 + PAD)))


def cut(doc, box: dict) -> Image.Image:
    page = doc[box["page"] - 1]
    pix = page.get_pixmap(dpi=DPI, clip=pymupdf.Rect(box["x0"], box["y0"], box["x1"], box["y1"]))
    im = Image.frombytes("RGB" if pix.n >= 3 else "L", (pix.width, pix.height), pix.samples)
    return trim(im).convert("L").quantize(colors=32)


def read_options(doc, pages: list[int]) -> dict:
    """The four option figures of one question, or why there are not four.

    The export sets these two ways round. A table stands beside its label, so
    "B." and its table share a line. A graph is wider, and stands above a label
    set at the left margin under it. Both keep reading order — A's figure comes
    before B's, and A's label before B's — so the figures found on a page are
    paired with the labels found on that page in the order they are set, and
    neither layout has to be recognised as such.
    """
    found, y_a, y_c = labels_of(doc, pages)
    if sorted(found) != ["A", "B", "C", "D"]:
        return {"ok": False, "why": f"the labels found were {sorted(found) or 'none'}"}

    by_page: dict[int, list[str]] = {}
    for label, (page, _, _, _) in found.items():
        by_page.setdefault(page, []).append(label)

    boxes: dict[str, dict] = {}
    for n, page in enumerate(pages):
        labels = by_page.get(page)
        if not labels:
            continue
        offset = n * PAGE_STRIDE
        height = doc[page].rect.y1
        lo = (y_a - offset) if y_a is not None and 0 <= y_a - offset <= height else 0.0
        hi = (y_c - offset) if y_c is not None and 0 <= y_c - offset <= height else height

        skip = [found[l][1] for l in labels]
        blocks = blocks_of(ink_items(doc[page], lo, hi, skip))
        if len(blocks) != len(labels):
            return {"ok": False,
                    "why": f"{len(blocks)} figure(s) beside {len(labels)} label(s) on one page"}
        # The band each figure stands in is what the ink settles; how wide it
        # is, is not. A graph draws its axis numbers in a way the page's own
        # list of drawings does not report at all, so a crop cut to the ink
        # the list knows about takes the first digit off every one of them.
        # The crop therefore runs from the label column to the edge of the
        # page and is trimmed back to what actually prints (trim), which is
        # the only account of the page that misses nothing.
        edge = max(r[2] for r in skip) + GUTTER
        right = doc[page].rect.x1
        ordered = sorted(blocks, key=lambda b: b["y0"])
        for i, (label, b) in enumerate(zip(sorted(labels, key=lambda l: found[l][3]), ordered)):
            top, bottom = b["y0"] - YPAD, b["y1"] + YPAD
            if i > 0:
                top = max(top, (ordered[i - 1]["y1"] + b["y0"]) / 2)
            if i + 1 < len(ordered):
                bottom = min(bottom, (b["y1"] + ordered[i + 1]["y0"]) / 2)
            boxes[label] = {"page": page + 1,
                            "x0": round(edge, 1), "y0": round(max(top, lo), 1),
                            "x1": round(right, 1), "y1": round(min(bottom, hi), 1)}

    if sorted(boxes) != ["A", "B", "C", "D"]:
        return {"ok": False, "why": "a figure could not be found for every option"}
    return {"ok": True, "options": boxes}


HEAD = """\
-- ============================================================================
--  {number} — four tables are four options, not one picture
--
--  {n} maths questions ask "which table gives three values of x…" or "which
--  graph represents the system?", and answer it with four tables or four
--  graphs. The import had nothing to read in those options and wrote down the
--  wreckage the decoder made of a table's rules — "x -/(|-h(x) |)| |(-1)/" —
--  which is what a student is shown today. Three of them it left blank.
--
--  Each option is a figure, so each option now has one (0095), cut from the
--  page by tools/questionbank/math_options.py and served from
--  apps/web/public/question-figures/cb. The body is emptied rather than
--  guessed at: these options have no wording, and the label is what the
--  student chooses.
--
--  THE QUESTION'S OWN PICTURE GOES. Every one of these carried one, and in
--  every case it was the four options cropped together as a single image —
--  the import's answer to a region it could not read. With each option
--  carrying its own, that picture would show the four tables twice. None of
--  the {n} has a stimulus of its own; the equations above the question are in
--  its stem, as text.
--
--  APPLY AFTER THE APP IS DEPLOYED with those figures in it, and after 0095.
--
--  Each update is guarded by what the database holds now — the option's own
--  wreckage, the question's own picture — so an option a teacher has
--  corrected since is left alone, and a second run changes nothing.
--
--  An option's guard names two readings of that wreckage: the one the import
--  wrote and the one 0094 leaves behind, which tidies a raised dot and a stray
--  space inside a bracket and so rewrites 53 of these 88. Either is the
--  wreckage this migration is for, so 0094 and this one may be applied in
--  either order and neither decides whether an option gets its figure.
-- ============================================================================

"""


def write_migration(rows: list[dict], guards: dict, number: int, out: Path,
                    also: dict | None = None) -> Path:
    """The rows that point each option at its figure, guarded by what is there.

    `also` is a second reading of the same bodies — the one 0094 leaves behind,
    which tidies a raised dot and a stray space inside a bracket and so changes
    53 of these 88. Either is the wreckage this migration is for, and which of
    them is in the database depends only on whether 0094 has run yet. Both are
    accepted so that the order of the two does not decide whether an option
    gets its figure; anything else in that column is somebody's correction and
    is left alone.
    """
    lines: list[str] = []
    for r in rows:
        ref = r["source_ref"]
        g = guards.get(ref)
        if g is None:
            raise SystemExit(f"no guard for {ref}")
        for label in sorted(r["options"]):
            seen = {g["opts"][label]}
            if also and ref in also:
                seen.add(also[ref][label])
            whether = (f"md5(o.body) = '{next(iter(seen))}'" if len(seen) == 1
                       else "md5(o.body) in (" + ", ".join(f"'{h}'" for h in sorted(seen)) + ")")
            lines.append(
                f"update question_options o set body = '', image_url = '{r['options'][label]}' "
                f"from questions q where q.id = o.question_id and q.source_ref = '{ref}' "
                f"and o.label = '{label}' and {whether};"
            )
        lines.append(
            f"update questions set image_url = null, updated_at = now() "
            f"where source_ref = '{ref}' and md5(coalesce(image_url, '')) = '{g['img']}';"
        )

    out.mkdir(parents=True, exist_ok=True)
    path = out / f"{number:04d}_four_tables_are_four_options.sql"
    path.write_text(HEAD.format(number=f"{number:04d}", n=len(rows)) + "\n".join(lines) + "\n")
    return path


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("pdf", type=Path)
    ap.add_argument("--refs", type=Path, required=True)
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--pictures", type=Path, required=True)
    ap.add_argument("--guards", type=Path,
                    help="md5 of each option body and of each question's image_url, "
                         "as the database holds them; required to write a migration")
    ap.add_argument("--also", type=Path,
                    help="md5 of each option body as 0094 leaves it, so the two "
                         "migrations may be applied in either order")
    ap.add_argument("--migration", type=Path, help="where to write the migration")
    ap.add_argument("--number", type=int, default=96)
    args = ap.parse_args()

    wanted = {r.strip().removeprefix("CB-")
              for r in re.split(r"[,\s]+", args.refs.read_text()) if r.strip()}

    doc = pymupdf.open(args.pdf)
    starts = [i for i in range(doc.page_count)
              if doc[i].get_text().startswith("Question ID:")]
    at: dict[str, tuple[int, int]] = {}
    for n, i in enumerate(starts):
        m = re.search(r"Question ID:\s*(\w+)", doc[i].get_text())
        if m:
            at.setdefault(m.group(1), (i, starts[n + 1] if n + 1 < len(starts) else doc.page_count))

    args.pictures.mkdir(parents=True, exist_ok=True)
    rows, held = [], []
    for qid in sorted(wanted):
        if qid not in at:
            held.append((qid, "not in this export"))
            continue
        i, end = at[qid]
        r = read_options(doc, list(range(i, end)))
        if not r["ok"]:
            held.append((qid, r["why"]))
            continue
        made, small = {}, []
        for label, box in r["options"].items():
            im = cut(doc, box)
            if im.width < MIN_SIDE or im.height < MIN_SIDE:
                small.append(label)
                continue
            name = f"CB-{qid}-{label}.png"
            im.save(args.pictures / name, optimize=True)
            made[label] = f"/question-figures/cb/{name}"
        if small:
            for label in made:
                (args.pictures / f"CB-{qid}-{label}.png").unlink(missing_ok=True)
            held.append((qid, f"option {', '.join(small)} cropped to nothing"))
            continue
        rows.append({"source_ref": f"CB-{qid}", "options": made})

    args.out.write_text(json.dumps({"source": args.pdf.name, "questions": rows}, indent=1))
    print(f"{len(rows)} questions given four option figures -> {args.out}")
    if held:
        print(f"{len(held)} left alone:")
        for qid, why in held:
            print(f"  CB-{qid}: {why}")

    if args.migration:
        if not args.guards:
            raise SystemExit("--migration needs --guards")
        path = write_migration(rows, json.loads(args.guards.read_text()),
                               args.number, args.migration,
                               json.loads(args.also.read_text()) if args.also else None)
        print(f"  {path.name}  {len(rows)} questions  {path.stat().st_size // 1024} KB")


if __name__ == "__main__":
    main()
