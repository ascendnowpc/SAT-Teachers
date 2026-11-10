"""
Read College Board's SAT Suite Question Bank export into one manifest.

    python3 tools/questionbank/extract.py INPUT.pdf --out bank.json

The export writes one question per page: an identifying header, a table of
Assessment / Test / Domain / Skill / Difficulty, the question, its options, the
key, and College Board's own rationale. The Reading and Writing export is
ordinary text throughout. The maths export is ordinary text too, except that
every mathematical character is drawn rather than written — so the text layer
of a maths page reads "In the given equation, and are constants", with the
glyphs the page actually shows missing from it.

This puts them back. Each drawn shape is read by glyphs.py, the shapes are
grouped into expressions, each expression is rebuilt by layout.py, and the
result is dropped back into the prose at the position it occupies on the page.
A question whose shapes cannot all be read — which, in practice, is a question
with a chart or a diagram in it — is marked for a picture instead, with the
region to crop, and nothing about it is guessed at.

The manifest is the import's input, not the database's: every field is named
the way the app names it, and the loader in supabase/ reads it as it stands.
"""

from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass, field
from pathlib import Path

import numpy as np
import pymupdf

from glyphs import DPI, SCALE, aspect_band, picture, read
from layout import Glyph, decode

# Everything above this is the page header and its table, never the question.
BODY_TOP = 120.0

# Two shapes whose boxes, grown by this much, touch are part of one expression.
# Half the gap the export leaves between two separate inline expressions, and
# comfortably more than the gap inside one.
GROW_X = 2.5
GROW_Y = 2.0

# Atoms whose centres sit within this many points are on the same line. The
# export sets its prose about 14 points apart.
LINE_TOL = 5.0

SECTIONS = {
    "Reading and Writing": {
        "Information and Ideas": "information_and_ideas",
        "Craft and Structure": "craft_and_structure",
        "Expression of Ideas": "expression_of_ideas",
        "Standard English Conventions": "standard_english_conventions",
    },
    "Math": {
        "Algebra": "algebra",
        "Advanced Math": "advanced_math",
        "Problem-Solving and Data Analysis": "problem_solving_and_data_analysis",
        "Geometry and Trigonometry": "geometry_and_trigonometry",
    },
}

# College Board's skill names, in their wording, against the app's. The maths
# nineteen are the app's nineteen exactly. The English ten are the app's eleven
# less one: the app splits Command of Evidence into Textual and Quantitative
# and the export does not, so the export's single name is kept as it is.
SKILLS = {
    "Central Ideas and Details": "central_ideas_and_details",
    "Command of Evidence": "command_of_evidence",
    "Inferences": "inferences",
    "Words in Context": "words_in_context",
    "Text Structure and Purpose": "text_structure_and_purpose",
    "Cross-Text Connections": "cross_text_connections",
    "Rhetorical Synthesis": "rhetorical_synthesis",
    "Transitions": "transitions",
    "Boundaries": "boundaries",
    "Form, Structure, and Sense": "form_structure_and_sense",
    "Linear equations in one variable": "linear_equations_in_one_variable",
    "Linear equations in two variables": "linear_equations_in_two_variables",
    "Linear functions": "linear_functions",
    "Systems of two linear equations in two variables": "systems_of_two_linear_equations_in_two_variables",
    "Linear inequalities in one or two variables": "linear_inequalities_in_one_or_two_variables",
    "Equivalent expressions": "equivalent_expressions",
    "Nonlinear equations in one variable and systems of equations in two variables": "nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables",
    "Nonlinear functions": "nonlinear_functions",
    "Ratios, rates, proportional relationships, and units": "ratios_rates_proportional_relationships_and_units",
    "Percentages": "percentages",
    "One-variable data: Distributions and measures of center and spread": "one_variable_data_distributions_and_measures_of_center_and_spread",
    "Two-variable data: Models and scatterplots": "two_variable_data_models_and_scatterplots",
    "Probability and conditional probability": "probability_and_conditional_probability",
    "Inference from sample statistics and margin of error": "inference_from_sample_statistics_and_margin_of_error",
    "Evaluating statistical claims: Observational studies and experiments": "evaluating_statistical_claims_observational_studies_and_experiments",
    "Area and volume": "area_and_volume",
    "Lines, angles, and triangles": "lines_angles_and_triangles",
    "Right triangles and trigonometry": "right_triangles_and_trigonometry",
    "Circles": "circles",
}


def _key(name: str) -> str:
    """A skill name reduced to what identifies it.

    The export is not consistent with itself: it writes both "Cross-Text
    Connections" and "Cross-text Connections", and the header's text layer
    carries the same kerning spaces that put "propor tional" in the middle of
    a skill name. Neither is a different skill.
    """
    return re.sub(r"[^a-z0-9]", "", name.lower())


SKILL_BY_KEY = {_key(k): v for k, v in SKILLS.items()}


@dataclass
class Atom:
    """A piece of the page in reading order: prose, or a rebuilt expression."""

    x0: float
    x1: float
    cy: float
    text: str
    unsure: bool = False
    doubts: list[str] = field(default_factory=list)
    page: int = 0
    rect: list[float] | None = None
    is_image: bool = False


def page_gray(page) -> tuple[np.ndarray, int, int]:
    pix = page.get_pixmap(dpi=DPI)
    img = np.frombuffer(pix.samples, dtype=np.uint8).reshape(pix.height, pix.width, pix.n)
    gray = (img[:, :, :3].mean(axis=2) if pix.n >= 3 else img[:, :, 0]).astype(np.float32)
    return gray, pix.width, pix.height


def expressions(page, top: float = BODY_TOP,
                bottom: float | None = None) -> list[tuple[pymupdf.Rect, list[Glyph]]]:
    """The page's drawn shapes, read and grouped into expressions.

    `bottom`, where it is given, keeps the grouping inside a band of the page.
    A chart is drawn from the same vector paths as an expression is, so a
    cluster that is free to grow across the whole page grows from the chart
    into the line of prose beneath it and swallows the expression sitting
    there (math_figure.py). Bounding the band is what keeps them apart.
    """
    drawings = [d for d in page.get_drawings()
                if d["rect"].y0 > top and (bottom is None or d["rect"].y1 < bottom)]
    if not drawings:
        return []
    gray, w, h = page_gray(page)

    glyphs: list[Glyph] = []
    rects: list[pymupdf.Rect] = []
    for d in drawings:
        r = d["rect"]
        vec = picture(gray, r, w, h)
        if vec is None:
            continue
        char, unsure = read(vec, aspect_band(r.width, r.height))
        glyphs.append(Glyph(char, r.x0, r.y0, r.x1, r.y1, unsure))
        rects.append(r)

    # Connected components: two shapes belong together when their boxes, grown
    # a little, touch. A fraction holds together because its bar touches both
    # halves; two separate inline expressions stay apart because the export
    # leaves more room between them than inside them.
    n = len(glyphs)
    parent = list(range(n))

    def find(i: int) -> int:
        while parent[i] != i:
            parent[i] = parent[parent[i]]
            i = parent[i]
        return i

    def union(i: int, j: int) -> None:
        a, b = find(i), find(j)
        if a != b:
            parent[b] = a

    order = sorted(range(n), key=lambda i: glyphs[i].x0)
    for ii, i in enumerate(order):
        gi = glyphs[i]
        for j in order[ii + 1 :]:
            gj = glyphs[j]
            if gj.x0 > gi.x1 + 2 * GROW_X:
                break
            if gj.x0 - GROW_X > gi.x1 + GROW_X or gi.x0 - GROW_X > gj.x1 + GROW_X:
                continue
            if gj.y0 - GROW_Y > gi.y1 + GROW_Y or gi.y0 - GROW_Y > gj.y1 + GROW_Y:
                continue
            union(i, j)

    groups: dict[int, list[int]] = {}
    for i in range(n):
        groups.setdefault(find(i), []).append(i)

    out = []
    for members in groups.values():
        gs = [glyphs[i] for i in members]
        r = pymupdf.Rect(
            min(g.x0 for g in gs), min(g.y0 for g in gs),
            max(g.x1 for g in gs), max(g.y1 for g in gs),
        )
        out.append((r, gs))
    return out


# Pages are stacked this far apart when a question runs over more than one, so
# that the last line of a page and the first of the next never merge.
PAGE_STRIDE = 2000.0

# A space narrower than this is not a word break. The export sets a real space
# about 2.2 points wide and also emits hair-thin ones — a fifth of a point —
# inside words to kern a pair of letters, which is why its own text layer reads
# "Mar ta Coll" and "repor ted". Taken at face value those reach the student.
HAIR_SPACE = 1.0


def span_text(span) -> str:
    """A span's text, with the export's kerning spaces left out."""
    out = []
    for c in span["chars"]:
        if c["c"] == " " and (c["bbox"][2] - c["bbox"][0]) < HAIR_SPACE:
            continue
        out.append(c["c"])
    return "".join(out)


def atoms_for(page, index: int, offset: float, top: float) -> list[Atom]:
    """Every piece of one page's body — prose, expressions and pictures.

    `top` is where the body starts on this page: below the header and its
    table on the page a question opens with, and the very top of a page it
    merely continues onto.
    """
    out: list[Atom] = []

    raw = page.get_text("rawdict")
    for block in raw["blocks"]:
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

    for rect, gs in expressions(page, top):
        d = decode(gs)
        out.append(
            Atom(rect.x0, rect.x1, offset + (rect.y0 + rect.y1) / 2, d.text,
                 unsure=not d.ok, doubts=d.doubts, page=index,
                 rect=[rect.x0, rect.y0, rect.x1, rect.y1])
        )

    # Some of the bank's older questions carry their mathematics as a picture
    # rather than as drawn characters. There is nothing to read in those, and
    # nothing to decode: the picture is the question, and it is lifted out as
    # it stands.
    for info in page.get_image_info():
        x0, y0, x1, y1 = info["bbox"]
        if y1 <= top:
            continue
        out.append(
            Atom(x0, x1, offset + (y0 + y1) / 2, "", unsure=True,
                 doubts=["the question is drawn as a picture"], page=index,
                 rect=[x0, y0, x1, y1], is_image=True)
        )
    return out


def lines_of(atoms: list[Atom]) -> list[list[Atom]]:
    """Atoms grouped into visual lines, each left to right."""
    if not atoms:
        return []
    out: list[list[Atom]] = []
    for a in sorted(atoms, key=lambda a: (a.cy, a.x0)):
        if out and abs(a.cy - out[-1][0].cy) <= LINE_TOL:
            out[-1].append(a)
        else:
            out.append([a])
    return [sorted(line, key=lambda a: a.x0) for line in out]


def text_of(lines: list[list[Atom]]) -> str:
    """Lines of atoms as text, with a space wherever the page leaves a gap."""
    rendered = []
    for line in lines:
        s = ""
        end: float | None = None
        for a in line:
            if end is not None and a.x0 - end > 1.0 and not s.endswith(" ") and not a.text.startswith(" "):
                s += " "
            s += a.text
            end = a.x1
        rendered.append(s.strip())
    return "\n".join(r for r in rendered if r)


def header(page) -> dict | None:
    """Question ID, test, domain, skill and difficulty, from the text layer."""
    flat = re.sub(r"\s+", " ", page.get_text())
    m = re.search(r"Question ID: (\w+)", flat)
    if not m:
        return None
    qid = m.group(1)
    m = re.search(r"SAT (Reading and Writing|Math) (.+?) (Easy|Medium|Hard) ", flat)
    if not m:
        return None
    test, rest, difficulty = m.group(1), m.group(2).strip(), m.group(3).lower()
    domain = next((d for d in SECTIONS[test] if rest.startswith(d)), None)
    if domain is None:
        return None
    skill = re.sub(r"\s+", " ", rest[len(domain):]).strip()
    return {
        "source_ref": f"CB-{qid}",
        "subject": "english" if test == "Reading and Writing" else "mathematics",
        "section": SECTIONS[test][domain],
        "skill": SKILL_BY_KEY.get(_key(skill)),
        "skill_name": skill,
        "difficulty": difficulty,
    }


def marker_y(atoms: list[Atom], exact: str) -> float | None:
    for a in atoms:
        if a.text.strip() == exact:
            return a.cy
    return None


def correct_y_and_text(atoms: list[Atom]) -> tuple[float | None, str | None]:
    for a in atoms:
        s = a.text.strip()
        if s.startswith("Correct Answer:"):
            return a.cy, s[len("Correct Answer:"):].strip()
    return None, None


def between(atoms: list[Atom], lo: float | None, hi: float | None) -> list[Atom]:
    return [
        a
        for a in atoms
        if (lo is None or a.cy > lo + 1.0) and (hi is None or a.cy < hi - 1.0)
    ]


def split_options(lines: list[list[Atom]]) -> dict[str, str] | None:
    """The four choices, each from its label to the next."""
    opts: dict[str, str] = {}
    current: str | None = None
    for line in lines:
        s = text_of([line])
        m = re.match(r"^([A-D])\.\s*(.*)$", s)
        if m:
            current = m.group(1)
            opts[current] = m.group(2).strip()
        elif current:
            opts[current] = (opts[current] + " " + s).strip()
    if len(opts) != 4:
        return None
    return opts


def question(doc, pages: list[int]) -> dict | None:
    """One question, which may run over more than one page.

    229 of the export's questions do. Their pages are read as one sheet —
    stacked, so that reading order across a page break is just reading order —
    because a question whose key or last option sits on the following page
    would otherwise be imported without them.
    """
    head = header(doc[pages[0]])
    if head is None:
        return None

    atoms: list[Atom] = []
    for n, p in enumerate(pages):
        # The header and its table are only on the page the question opens on;
        # a page it continues onto carries body text from the very top.
        top = BODY_TOP if n == 0 else 0.0
        atoms += atoms_for(doc[p], p, n * PAGE_STRIDE, top)

    y_q = marker_y(atoms, "Question")
    y_a = marker_y(atoms, "Answer")
    y_c, correct = correct_y_and_text(atoms)
    y_r = marker_y(atoms, "Rationale")

    # The question ends at whichever of the three comes first. A handful of the
    # bank's older items carry no "Correct Answer:" line at all — their key is
    # only stated inside the rationale — and without Rationale as a backstop
    # the question would swallow the whole explanation.
    ends = [y for y in (y_a, y_c, y_r) if y is not None]
    stem_atoms = between(atoms, y_q, min(ends) if ends else None)
    stem = text_of(lines_of(stem_atoms))

    option_atoms = between(atoms, y_a, y_c) if y_a is not None else []
    options = split_options(lines_of(option_atoms)) if y_a is not None else None

    rationale_atoms = between(atoms, y_r, None) if y_r is not None else []
    rationale = text_of(lines_of(rationale_atoms))

    # What the student is shown is what decides the picture. A shape the
    # rationale could not be read from is worth recording — a teacher reads
    # that — but it is no reason to put the question itself behind a picture.
    asked = stem_atoms + option_atoms
    unsure_asked = [a for a in asked if a.unsure]
    suspect = _suspicious(stem, options)

    out = dict(head)
    out.update(
        {
            "stem": stem,
            "options": options,
            "correct": correct,
            "explanation": rationale,
            "needs_picture": bool(unsure_asked) or bool(suspect),
            # Where the prose came through intact, only the figure needs
            # showing and the question keeps its real stem and options. Where
            # it did not, nothing about the question can be trusted as text
            # and the whole of it is the picture.
            "crop": None if not (unsure_asked or suspect)
            else ("figure" if _prose_ok(stem, options) and unsure_asked else "whole"),
            "picture": _picture_rect(
                unsure_asked, stem_atoms, option_atoms,
                whole=not (_prose_ok(stem, options) and unsure_asked),
            )
            if (unsure_asked or suspect)
            else None,
            "doubts": sorted({d for a in asked for d in a.doubts} | set(suspect)),
            "unreadable_shapes": len(unsure_asked),
            "explanation_unreadable": sum(1 for a in rationale_atoms if a.unsure),
        }
    )
    return out


def _suspicious(stem: str, options: dict[str, str] | None) -> list[str]:
    """Reasons to distrust a question that every shape was read from.

    Recognising every shape is not the same as having read the question. A
    table is drawn from rules, and a rule is a character the alphabet knows —
    so a table comes through as a hedge of bars with the numbers scattered
    through it, and nothing about that is "unreadable". These are the marks
    of a question that came out as rubble, and they send it to a picture just
    as an unknown shape does.
    """
    out: list[str] = []
    joined = stem + " " + " ".join((options or {}).values())

    if options is not None and any(not v.strip() for v in options.values()):
        out.append("an option with nothing in it")
    # A single question mark ends most stems; two together is the decoder
    # writing down what it could not read.
    if "??" in joined:
        out.append("shapes written as question marks")
    # Absolute value comes in pairs and rarely more than one pair; a row of
    # bars is a table's edges or a chart's axis ticks.
    if joined.count("|") > 4 or "|||" in joined.replace(" ", ""):
        out.append("a hedge of rules, which is a table or a chart")
    return out


def _prose_ok(stem: str, options: dict[str, str] | None) -> bool:
    """Whether the words of the question survived, whatever the figure did."""
    joined = stem + " " + " ".join((options or {}).values())
    if "??" in joined or joined.count("|") > 4:
        return False
    if options is not None and any(not v.strip() for v in options.values()):
        return False
    # A stem that is mostly symbols is rubble, however few shapes went unread.
    letters = sum(c.isalpha() for c in stem)
    return letters >= 20


def _picture_rect(unsure: list[Atom], stem_atoms: list[Atom], option_atoms: list[Atom],
                  whole: bool = False):
    """The region to crop, when a question has to be shown as a picture.

    The unreadable shapes are what need showing — a chart, nearly always — so
    the crop is their own extent, grown to the width of the text around them so
    the picture is not a slice through the middle of a figure.
    """
    asked = stem_atoms + option_atoms

    # A picture is cut from one page. The page holding most of the unreadable
    # shapes decides it; where nothing was unreadable and it is only the shape
    # of the result that is wrong, the page the question opens on does.
    anchor = unsure or asked
    if not anchor:
        return None
    pages: dict[int, list[Atom]] = {}
    for a in anchor:
        pages.setdefault(a.page, []).append(a)
    page = max(pages, key=lambda p: len(pages[p]))
    on_page = [a for a in asked if a.page == page and a.rect]

    if whole:
        # Everything the student would be shown, from the first line to the
        # last option.
        boxes = [a.rect for a in on_page]
    else:
        boxes = [a.rect for a in pages[page] if a.rect]
    if not boxes:
        return None

    y0 = min(b[1] for b in boxes)
    y1 = max(b[3] for b in boxes)
    x0 = min(b[0] for b in boxes)
    x1 = max(b[2] for b in boxes)

    if not whole:
        # Widen a figure to the text sitting beside it, so the crop is not a
        # slice through the middle of a chart.
        beside = [a for a in on_page if y0 - 8 <= a.rect[1] and a.rect[3] <= y1 + 8]
        if beside:
            x0 = min(x0, min(a.rect[0] for a in beside))
            x1 = max(x1, max(a.rect[2] for a in beside))

    return {"page": page + 1,
            "x0": round(x0, 1), "y0": round(y0, 1),
            "x1": round(x1, 1), "y1": round(y1, 1)}


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("pdf", type=Path)
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--limit", type=int, default=0, help="stop after N pages, for a look")
    args = ap.parse_args()

    doc = pymupdf.open(args.pdf)
    last = args.limit or doc.page_count

    # Where each question starts. Everything up to the next start belongs to it.
    starts = [i for i in range(doc.page_count)
              if doc[i].get_text().startswith("Question ID:")]

    rows: list[dict] = []
    for n, i in enumerate(starts):
        if i >= last:
            break
        end = starts[n + 1] if n + 1 < len(starts) else doc.page_count
        q = question(doc, list(range(i, end)))
        if q is None:
            continue
        q["source_page"] = i + 1
        q["source_pages"] = end - i
        rows.append(q)
        if len(rows) % 200 == 0:
            print(f"  {len(rows)} questions", flush=True)

    args.out.write_text(json.dumps({"source": args.pdf.name, "questions": rows}, indent=1))
    clean = sum(1 for r in rows if not r["needs_picture"])
    print(f"{len(rows)} questions -> {args.out}")
    print(f"  {clean} read in full, {len(rows) - clean} need a picture")


if __name__ == "__main__":
    main()
