"""
Give a maths question its words back, and leave the figure as the only picture.

    python3 tools/questionbank/math_figure.py INPUT.pdf --refs refs.txt --out math.json

0085 put 451 of College Board's questions behind a picture of the whole page,
because the words that came out beside them were wreckage. 0091–0092 gave the
English 133 their text back. These are the maths 318, and the wreckage has one
cause.

A maths page draws every mathematical character as a vector path, and so does
a chart: its axis ticks, its bars, its plotted rings. extract.py groups drawn
shapes into expressions by touch, which is right for a fraction and wrong for
a chart — the chart's ink is one enormous cluster, it reaches the baseline of
the first line of prose under it, and the inline expression sitting on that
line is swallowed into it. So the question lost its mathematics twice over:
the chart was unreadable, and "the corresponding values of g(x)" came out as
"the corresponding values of".

The way back is to read the prose first and the shapes second:

    the prose      the text layer alone, which on these pages is intact. The
                   question's words are the last run of lines that read as
                   sentences; a chart's axis labels and a table's rows sit
                   above them and do not.
    the shapes     re-grouped within the prose's own band, so a cluster can no
                   longer reach up into the chart. The inline expressions then
                   decode on their own, which is what they could not do before.
    the figure     everything above the prose: cropped, trimmed to its ink, and
                   the only picture the question carries.

A question is only rewritten when all of that holds — no wreckage left in the
prose, no drawn shape on a prose line that went unread, and a figure to show.
Anything else keeps the picture it has and is listed at the end of the run, so
a question is never quietly left with half its mathematics missing.
"""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

import pymupdf

from extract import (BODY_TOP, LINE_TOL, PAGE_STRIDE, Atom, between,
                     correct_y_and_text, expressions, lines_of, marker_y,
                     span_text, split_options, text_of)
from layout import decode

# A word, for deciding whether a line is a sentence or a chart's labelling.
WORD = re.compile(r"[A-Za-z][A-Za-z'’‐-]+")

# A line ending in two bare numbers is a table's row, however many words it
# opens with: "Does not have camping facilities 8 4".
TABLE_ROW = re.compile(r"(?:(?<=\s)|^)-?\d+(?:\.\d+)?\s+-?\d+(?:\.\d+)?\s*$")

# Lines this far apart or less are one line of the page.
BAND = LINE_TOL

# A drawn shape is on a line of prose when its centre sits within the line's
# own band, grown by this much — an exponent's foot sits above the baseline.
ON_LINE = 6.0

# Half the height of the "Question" label, so the figure's search begins just
# under it: the page header's table is drawn from rules too, and a full-width
# rule at the top of the page is not a figure.
LABEL = 6.0

# Room left around a cropped figure, in points.
PAD = 4.0

# A block of ink shallower than this is a line, not a figure: a displayed
# equation set on its own line under the question, which belongs in the stem
# and is read as mathematics. A chart, a table or a drawn shape is taller.
FIGURE_MIN_H = 30.0

# The body's left margin. The export sets the question's own paragraph against
# it and indents a figure's labelling, wherever the figure sits.
MARGIN = 22.0

# Two lines further apart than this are not the same paragraph. The export sets
# its prose about 14 points apart and leaves 4 to 6 between one line's foot and
# the next line's head; a figure standing between two paragraphs leaves 300.
LINE_GAP = 14.0


def _notation(s: str) -> str:
    """The notation the export draws, written the way the app sets it.

    Three shapes of the maths alphabet are drawn rather than written and come
    back as the nearest ASCII the labelling had for them. None of this is a
    guess about what the page says — each is the same character under another
    name:

        a decimal point   drawn as a raised dot, so "0·9" is "0.9". A dot with
                          space around it is multiplication and is left alone.
        a radical's bar   drawn as the rule over what is under the root, and
                          read as a minus in front of it: "√-34" is "√34".
        a segment's bar   drawn as the rule over the two points it joins, and
                          read the same way: "the length of -XY" is "XY",
                          which is how College Board's own alt text reads it.
    """
    s = re.sub(r"(?<=\d)·(?=\d)", ".", s)
    s = re.sub(r"√\s*-(?=[\d(])", "√", s)
    s = re.sub(r"(?<![A-Za-z0-9])-{1,2}([A-Z]{2,})\b", r"\1", s)
    # The alphabet labelled the digit nought and the letter o from the same
    # shapes, so a numeral can come back with an o in it: "1o/27" is "10/27".
    # Only where a digit stands beside it, which is never a word.
    s = re.sub(r"(?<=\d)o|o(?=\d)", "0", s)
    # An expression set inline leaves the page's own space in front of the
    # punctuation that follows it: "the graph of y = f(x) ." for "...f(x)."
    s = re.sub(r" +([,.;:?])", r"\1", s)
    # And around the brackets it is set in: "( 7/2, 9/2 )" for "(7/2, 9/2)".
    s = re.sub(r"\( +", "(", s)
    s = re.sub(r" +\)", ")", s)
    s = re.sub(r"(?<=[(,]) *- +", lambda m: m.group(0)[:-1].replace("- ", "-") or "-", s)
    s = re.sub(r"\(- +", "(-", s)
    s = re.sub(r"(?<=, )- +", "-", s)
    return s


def _is_rule(a: Atom) -> bool:
    """A drawn rule, not a character.

    A table is drawn from rules, and a rule is the same shape as a minus sign.
    One that is wide, or repeated, is a table's edge that reached into the band
    of the line beneath it — never the minus of an expression, which is about
    five points wide and comes with something to subtract.
    """
    t = a.text.strip()
    if not t or any(c.isalnum() for c in t):
        return False
    if set(t) <= {"-", "\u2013", "\u2014", "_"}:
        return len(t) > 1 or (a.x1 - a.x0) > 20.0
    return False


def _rubble(s: str) -> bool:
    """The decoder's own marks, as a line of the page is judged by them:
    shapes it could not read, and the hedge of rules a table is drawn from."""
    return "??" in s or s.count("|") > 2


def _mangled(s: str) -> str | None:
    """Why a question's own words cannot be trusted as text, if they cannot.

    Stricter than _rubble, which only has to tell a line of prose from a
    chart's labelling. This is the last word on whether a question is rewritten
    at all, so it asks the harder question: is anything missing, doubled, or
    welded to a word it does not belong to?
    """
    if "??" in s or s.count("|") > 2:
        return "shapes the decoder could not read"
    # A lone question mark ends a stem; one inside an expression — "26^(?)",
    # "?25" — is a shape nobody read, and the character it stands for is not
    # worth guessing at from the sense of the sentence.
    if re.search(r"\?(?![\s\n]|$)", s):
        return "a shape written as a question mark"
    if re.search(r"(?<![-\w])--(?![\w])", s):
        return "a rule with nothing under it"
    # A rule welded to a word — "a plumber--f(h)'s", "values of -g(x)-g(x)" —
    # is an expression dropped where the page did not put it, so the sentence
    # has lost the place it belonged in.
    if re.search(r"--(?=[A-Za-z0-9(])|(?<=[)A-Za-z0-9])--", s):
        return "an expression welded to a word"
    if re.search(r"\)-(?=[A-Za-z(])", s):
        return "an expression welded to a word"
    # Two spaces where the page set one: whatever filled that gap is somewhere
    # else in the sentence now.
    if re.search(r"\S  +\S", s):
        return "a gap in the sentence that nothing fills"
    if re.search(r"\bII\b", s):
        return "a numeral read as letters"
    # Two commas together: the commas of "Points M, N, and P" are drawn, and
    # these clustered with each other instead of with the letters they follow.
    if re.search(r",,", s):
        return "punctuation gathered away from its words"
    # A digit against a closing bracket — "(x - 5)2(x + 4)" — is an exponent
    # that came back on the baseline, which says something else about the
    # expression than the page does.
    if re.search(r"\)\d", s):
        return "an exponent read on the baseline"
    return None


def _table_row(s: str) -> bool:
    return bool(TABLE_ROW.search(s.strip()))


def _sentence(s: str) -> bool:
    s = s.strip()
    return bool(s) and not _rubble(s) and not _table_row(s) and len(WORD.findall(s)) >= 4


def text_atoms(page, index: int, offset: float, top: float) -> list[Atom]:
    """The page's text layer alone — no drawn shapes read, none decoded."""
    out: list[Atom] = []
    for block in page.get_text("rawdict")["blocks"]:
        for line in block.get("lines", []):
            for span in line["spans"]:
                text = span_text(span)
                if not text.strip():
                    continue
                x0, y0, x1, y1 = span["bbox"]
                if (y0 + y1) / 2 <= top:
                    continue
                out.append(Atom(x0, x1, offset + (y0 + y1) / 2, text, page=index,
                                rect=[x0, y0, x1, y1]))
    return out


def _left(line: list[Atom]) -> float:
    return min(a.rect[0] for a in line if a.rect)


def prose_runs(lines: list[list[Atom]]) -> list[list[int]]:
    """Which of these lines are the question's own words.

    The export sets the question against the left margin and sets a figure's
    labelling — a chart's axis numbers, a table's row and column headings —
    indented, wherever the figure sits. So the words are the lines that begin
    at the margin, and the figure is what is left: above them, below them, or
    between a lead-in sentence and the question it leads into.

    A line of a run need not read as a sentence: a stem that ends on its own
    short line, "∠QPR?", is the question's last word and belongs with it.
    """
    margin = [i for i, ln in enumerate(lines) if _left(ln) < MARGIN]

    def head(i: int) -> float:
        return min(a.rect[1] for a in lines[i] if a.rect)

    def foot(i: int) -> float:
        return max(a.rect[3] for a in lines[i] if a.rect)

    def page_of(i: int) -> int:
        return lines[i][0].page

    # Adjacent on the page, not merely adjacent in the list. A figure drawn
    # entirely from vector paths puts no text between the paragraph above it
    # and the question below, so those two lines are neighbours in the list and
    # 300 points apart on the page.
    runs: list[list[int]] = []
    for i in margin:
        if (runs and i == runs[-1][-1] + 1
                and page_of(i) == page_of(runs[-1][-1])
                and head(i) - foot(runs[-1][-1]) <= LINE_GAP):
            runs[-1].append(i)
        else:
            runs.append([i])
    return [r for r in runs if any(_sentence(text_of([lines[i]])) for i in r)]


def band(page, index: int, offset: float, lo: float, hi: float | None) -> list[Atom]:
    """The drawn mathematics of one band of one page, read and decoded.

    Bounding the band is the whole point: a cluster free to grow across the
    page grows out of the chart and into the line of prose under it, taking
    the expression there with it.
    """
    out: list[Atom] = []
    for rect, gs in expressions(page, top=lo, bottom=hi):
        d = decode(gs)
        out.append(Atom(rect.x0, rect.x1, offset + (rect.y0 + rect.y1) / 2, d.text,
                        unsure=not d.ok, doubts=d.doubts, page=index,
                        rect=[rect.x0, rect.y0, rect.x1, rect.y1]))
    return out


def unread_in(page, lo: float, hi: float, claimed: list[Atom]) -> int:
    """Drawn shapes inside a band that no decoded expression covers.

    A hole in the prose — "the values of , where and f" — is a drawn shape on
    a line of prose that was grouped into the chart instead of into the line.
    Counting them inside the band, and only there, is how the run knows the
    words are whole: a table's bottom rule just above the first line of prose
    is the figure's, not the prose's.
    """
    boxes = [a.rect for a in claimed if a.rect]
    missed = 0
    for d in page.get_drawings():
        r = d["rect"]
        cy, cx = (r.y0 + r.y1) / 2, (r.x0 + r.x1) / 2
        if not (lo <= cy <= hi):
            continue
        if any(b[0] - 1 <= cx <= b[2] + 1 and b[1] - 1 <= cy <= b[3] + 1 for b in boxes):
            continue
        missed += 1
    return missed


def read_question(doc, pages: list[int]) -> dict:
    """One question, read prose first and shapes second."""
    first = doc[pages[0]]

    flat: list[Atom] = []
    for n, p in enumerate(pages):
        flat += text_atoms(doc[p], p, n * PAGE_STRIDE, BODY_TOP if n == 0 else 0.0)

    y_q = marker_y(flat, "Question")
    y_a = marker_y(flat, "Answer")
    y_c, correct = correct_y_and_text(flat)
    y_r = marker_y(flat, "Rationale")
    ends = [y for y in (y_a, y_c, y_r) if y is not None]
    y_end = min(ends) if ends else None

    lines = lines_of(between(flat, y_q, y_end))
    runs = prose_runs(lines)
    if not runs:
        return {"ok": False, "why": "no paragraph at the margin to read as the question"}
    taken = {i for r in runs for i in r}
    prose_lines = [lines[i] for i in sorted(taken)]
    figure_lines = [ln for i, ln in enumerate(lines) if i not in taken]

    # Each paragraph gets its own band, so a cluster can never grow from the
    # figure into the line of prose beside it.
    bands: list[tuple[float, float]] = []
    written: list[tuple[float, float]] = []
    for r in runs:
        rects = [x.rect for i in r for x in lines[i] if x.rect and x.page == pages[0]]
        if rects:
            lo, hi = min(x[1] for x in rects), max(x[3] for x in rects)
            # Read a little above and below the words, for an exponent's head
            # and a denominator's foot; measure the gaps from the words
            # themselves, so a figure keeps its own closing rule.
            bands.append((lo - ON_LINE, hi + ON_LINE))
            written.append((lo, hi))
    if not bands:
        return {"ok": False, "why": "the question's words are not on the page it opens on"}
    bands.sort(); written.sort()

    # --- what lies in the gaps around the words -----------------------------
    stop = y_a if y_a is not None else (y_c if y_c is not None else y_r)
    edge = min(stop, first.rect.y1) if stop is not None else first.rect.y1
    # Below the "Question" label: the header's table is drawn from rules too,
    # and a full-width rule at the top of the page is not a figure.
    gaps: list[tuple[float, float]] = []
    at = (y_q + LABEL) if y_q is not None else BODY_TOP
    for lo, hi in written:
        if lo > at:
            gaps.append((at, lo))
        at = max(at, hi)
    if edge > at:
        gaps.append((at, edge))

    aside = [x for ln in figure_lines for x in ln if x.page == pages[0]]
    found = [(g, figure_box(first, g[0], g[1], aside, bands)) for g in gaps]
    shallow, tall = [], []
    for g, box in found:
        if box is None:
            continue
        (shallow if box["y1"] - box["y0"] < FIGURE_MIN_H else tall).append((g, box))

    # --- the mathematics of the question: among its words, and displayed ----
    read_bands = list(bands) + [g for g, _ in shallow]
    kept: list[Atom] = []
    for lo, hi in read_bands:
        kept += band(first, pages[0], 0.0, lo, hi)
    for n, p in enumerate(pages[1:], start=1):
        kept += band(doc[p], p, n * PAGE_STRIDE, 0.0, None)
    # Every shape the bands account for, rules included: that is what the
    # coverage test asks about. The rules are then left out of the question,
    # because a table's edge is not part of its sentence.
    claimed = between(kept, y_q, y_end)
    kept = [x for x in claimed if not _is_rule(x)]

    stem = _notation(text_of(lines_of([x for ln in prose_lines for x in ln] + kept)))

    # --- the options, read in their own band -------------------------------
    opts = None
    if y_a is not None:
        opt_atoms = list(between(flat, y_a, y_c))
        for n, p in enumerate(pages):
            o = n * PAGE_STRIDE
            lo = max(y_a - o, 0.0)
            hi = min((y_c - o) if y_c is not None else doc[p].rect.y1, doc[p].rect.y1)
            if hi > lo:
                opt_atoms += band(doc[p], p, o, lo, hi)
        opts = split_options(lines_of(opt_atoms))
        if opts is not None:
            opts = {k: _notation(v) for k, v in opts.items()}

    # --- is it whole? -------------------------------------------------------
    why: list[str] = []
    if sum(c.isalpha() for c in stem) < 15:
        why.append("too few words recovered")
    wrong = _mangled(stem)
    if wrong:
        why.append(f"the question's words carry {wrong}")
    if any(x.unsure for x in kept if x.page == pages[0]):
        why.append("a shape among the words went unread")
    missed = sum(unread_in(first, lo, hi, [x for x in claimed if x.page == pages[0]])
                 for lo, hi in read_bands)
    if missed:
        why.append(f"{missed} drawn shape(s) among the words that nothing covers")
    if opts is None and y_a is not None:
        why.append("the four options could not be told apart")
    elif opts is not None and any(not v.strip() for v in opts.values()):
        why.append("an option with nothing in it")
    elif opts is not None and any(_mangled(v) for v in opts.values()):
        why.append("an option carries "
                   + next(_mangled(v) for v in opts.values() if _mangled(v)))

    box = _one_figure([b for _, b in tall])
    if box is None:
        why.append("no one figure to show beside the words")

    return {
        "ok": not why,
        "why": "; ".join(why),
        "stem": stem,
        "options": opts,
        "correct": correct,
        "figure": box and {"page": pages[0] + 1, **box},
    }


def _area(b: dict | None) -> float:
    return 0.0 if b is None else max(0.0, b["x1"] - b["x0"]) * max(0.0, b["y1"] - b["y0"])


def _one_figure(boxes: list[dict]) -> dict | None:
    """One crop, where the question's ink falls in one place.

    College Board gives a question one figure, and a question carries one
    picture. Where ink falls in more than one of the gaps around the words,
    the lesser is a stray rule rather than a second figure only if it is
    slight; where it is not, the question is left alone rather than shown half
    a figure.
    """
    if not boxes:
        return None
    big = max(boxes, key=_area)
    rest = sum(_area(b) for b in boxes if b is not big)
    if _area(big) <= 0:
        return None
    return big if rest / _area(big) <= 0.05 else None


def figure_box(page, lo: float, hi: float, text_in: list[Atom],
               words: list[tuple[float, float]] = ()) -> dict | None:
    """The extent of everything the page puts between `lo` and `hi`.

    A chart's own ink is nearly all vector paths and its axis numbers are drawn
    rather than written, so on most of these pages there is no text beside the
    prose at all — the figure has to be found as ink, not as lines.
    """
    if hi <= lo:
        return None
    xs0, ys0, xs1, ys1 = [], [], [], []

    def add(x0, y0, x1, y1):
        if y1 <= lo or y0 >= hi:
            return
        # A rule over a pair of points — the bar of "TU" — stands a little
        # above the line it belongs to, outside the words' own extent and
        # inside the band they are read in. It is the sentence's, not the
        # figure's, so it is not cropped with the figure.
        cy = (y0 + y1) / 2
        if any(a <= cy <= b for a, b in words):
            return
        xs0.append(x0); ys0.append(max(y0, lo))
        xs1.append(x1); ys1.append(min(y1, hi))

    for d in page.get_drawings():
        r = d["rect"]
        add(r.x0, r.y0, r.x1, r.y1)
    for info in page.get_image_info():
        add(*info["bbox"])
    for a in text_in:
        if a.rect:
            add(*a.rect)

    if not xs0:
        return None
    return {"x0": round(max(0.0, min(xs0) - PAD), 1),
            "y0": round(max(lo, min(ys0) - PAD), 1),
            "x1": round(max(xs1) + PAD, 1),
            "y1": round(min(hi, max(ys1) + PAD), 1)}


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("pdf", type=Path)
    ap.add_argument("--refs", type=Path, required=True,
                    help="one source_ref (CB-xxxxxxxx) per line, or comma separated")
    ap.add_argument("--out", type=Path, required=True)
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
            end = starts[n + 1] if n + 1 < len(starts) else doc.page_count
            at.setdefault(m.group(1), (i, end))

    rows, held = [], []
    for qid in sorted(wanted):
        if qid not in at:
            held.append((qid, "not in this export"))
            continue
        i, end = at[qid]
        r = read_question(doc, list(range(i, end)))
        r["source_ref"] = f"CB-{qid}"
        if r["ok"]:
            rows.append(r)
        else:
            held.append((qid, r["why"]))

    args.out.write_text(json.dumps({"source": args.pdf.name, "questions": rows}, indent=1))
    print(f"{len(rows)} questions read back as text -> {args.out}")
    print(f"{len(held)} kept the picture they have:")
    for qid, why in held:
        print(f"  CB-{qid}: {why}")


if __name__ == "__main__":
    main()
