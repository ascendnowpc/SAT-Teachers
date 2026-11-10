"""
Read a question as College Board publishes it, into the bank's own notation.

    python3 tools/questionbank/collegeboard.py ITEMS_DIR LIST.json --refs refs.txt --out cb.json

The export (extract.py) is a PDF in which every mathematical character is drawn
rather than written, and 591 maths questions came out of it with their
mathematics missing — a blank option, "the graph of the equation  is a line",
or the whole question carried as a picture. The Educator Question Bank serves
the same questions with their mathematics intact, in one of two shapes:

    current items   MathML, structured: every fraction, power and root is a
                    node. Read exactly.
    disclosed items an image of each expression, with the words a screen
                    reader speaks for it ("the fraction with numerator x plus 1,
                    and denominator 2, end fraction"). spoken.py reads those.

Both become the plain text the bank already stores and MathText draws: a/b for
a fraction, x^(2) for a power, √ for a root, a hyphen for minus, one equation
to a line. A table, a graph or a drawn figure is not text: it is kept as the
HTML College Board drew it, for render_figures.mjs to turn into the question's
picture.
"""

from __future__ import annotations

import argparse
import hashlib
import html as htmllib
import json
import re
from pathlib import Path

from bs4 import BeautifulSoup, NavigableString, Tag

from spoken import FIXES, SIMPLE, speak_to_text, wrapped

LABELS = "ABCD"

# ---------------------------------------------------------------------------
# MathML
# ---------------------------------------------------------------------------

BINARY = {"=", "+", "-", "<", ">", "≤", "≥", "±", "∓", "×", "÷", "≠", "≈", "·", "⋅", "→", "≅", "∼", "~"}
SIGNS = {"-", "+", "±", "∓"}
OPEN, CLOSE = "([{", ")]}"
FUNCTIONS = {"sin", "cos", "tan", "log", "ln", "sec", "csc", "cot"}
OVERLINE = "̅"
SUBSCRIPT = str.maketrans("0123456789aehijklmnoprstuvx+-=()",
                          "₀₁₂₃₄₅₆₇₈₉ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓ₊₋₌₍₎")
MINUS = {"−": "-", "–": "-", "&minus;": "-"}


def _name(n: Tag) -> str:
    return n.name.split(":")[-1].lower()


def _kids(n: Tag) -> list[Tag]:
    return [c for c in n.children if isinstance(c, Tag)]


def _txt(n: Tag) -> str:
    s = n.get_text()
    s = s.replace(" ", " ").replace("⁡", "").replace("⁢", "").replace("​", "")
    for a, b in MINUS.items():
        s = s.replace(a, b)
    return s


def binds(s: str) -> bool:
    """Whether a term is one unit to MathText's fraction reader (lib/fractions)."""
    return bool(s) and all(c.isalnum() or c in ".√°′^()" + OVERLINE or c in "₀₁₂₃₄₅₆₇₈₉ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓ" for c in s) \
        and _balanced(s)


def _balanced(s: str) -> bool:
    d = 0
    for c in s:
        d += c == "("
        d -= c == ")"
        if d < 0:
            return False
    return d == 0


def group(s: str) -> str:
    """A radicand: bare only when it is one number or letter; else bracketed."""
    s = s.strip()
    if re.fullmatch(r"\d[\d,]*(\.\d+)?|[A-Za-zπθ]", s) or wrapped(s):
        return s
    return f"({s})"


def frac(num: str, den: str) -> str:
    n, d = num.strip(), den.strip()
    n = n if SIMPLE.fullmatch(n) or wrapped(n) else f"({n})"
    d = d if SIMPLE.fullmatch(d) or wrapped(d) else f"({d})"
    return f"{n}/{d}"


def sup(base: str, exp: str) -> str:
    b = base.strip()
    e = exp.strip()
    if e in ("′", "'", "″"):
        return b + ("′" if e != "″" else "″")
    if not (binds(b) and not b.startswith("-")) and not (b.startswith("(") and b.endswith(")") and _balanced(b[1:-1])):
        b = f"({b})"
    return f"{b}^({e})"


def sub(base: str, s: str) -> str:
    s = s.strip()
    t = s.translate(SUBSCRIPT)
    if all(c in "₀₁₂₃₄₅₆₇₈₉ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓ₊₋₌₍₎" for c in t):
        return base + t
    return f"{base}_{s}" if len(s) == 1 else f"{base}_({s})"


def overline(s: str) -> str:
    return "".join(c + OVERLINE if c.isalnum() else c for c in s)


def mathml(n: Tag) -> str:
    """One MathML node as bank text."""
    k = _name(n)
    if k in ("math", "mrow", "mstyle", "mpadded", "semantics", "mtd", "merror", "mlabeledtr"):
        return seq(_kids(n)) if _kids(n) else _txt(n).strip()
    if k in ("annotation", "annotation-xml", "mphantom", "none", "mprescripts"):
        return ""
    if k in ("mi", "mn", "ms"):
        return _txt(n).strip()
    if k == "mtext":
        return re.sub(r"\s+", " ", _txt(n))
    if k == "mspace":
        return " "
    if k == "mo":
        return _txt(n).strip()
    if k == "mfenced":
        o, c = n.get("open", "("), n.get("close", ")")
        sep = n.get("separators", ",").strip() or ","
        inner = (sep[0] + " ").join(mathml(x) for x in _kids(n))
        return f"{o}{inner}{c}"
    kids = _kids(n)
    if k == "mfrac":
        if n.get("linethickness") in ("0", "0px", "0pt"):  # a binomial-style stack, not a fraction
            return f"{mathml(kids[0])} {mathml(kids[1])}"
        return frac(mathml(kids[0]), mathml(kids[1]))
    if k == "msup":
        return sup(mathml(kids[0]), mathml(kids[1]))
    if k == "msub":
        return sub(mathml(kids[0]), mathml(kids[1]))
    if k == "msubsup":
        return sup(sub(mathml(kids[0]), mathml(kids[1])), mathml(kids[2]))
    if k == "msqrt":
        return "√" + group(seq(kids))
    if k == "mroot":
        i = mathml(kids[1]).strip()
        sign = {"3": "∛", "4": "∜"}.get(i, f"^({i})√")
        return sign + group(mathml(kids[0]))
    if k in ("mover", "munderover"):
        base, acc = mathml(kids[0]), _txt(kids[-1]).strip()
        if acc in ("¯", "‾", "―", "-", "_", "‒", "̅"):
            return overline(base)
        if acc in ("⌒", "⏜", "︵"):
            return "arc " + base
        if acc in ("→", "⇀", "⃗"):
            return base + "⃗"
        if acc in ("^", "ˆ"):
            return base + "̂"
        return base + acc
    if k == "munder":
        return mathml(kids[0])
    if k == "menclose":
        inner = seq(kids)
        return overline(inner) if "top" in (n.get("notation") or "") else inner
    if k == "mtable":
        rows = []
        for tr in kids:
            cells = [seq(_kids(td)) if _kids(td) else _txt(td) for td in _kids(tr)] if _name(tr) in ("mtr", "mlabeledtr") else [mathml(tr)]
            rows.append(tidy(" ".join(cells)))
        return "\n".join(rows)
    return seq(kids) if kids else _txt(n).strip()


CONTAINERS = ("mrow", "mstyle", "mpadded", "semantics")


def _edge(n: Tag, side: int) -> bool:
    """Whether n begins (side 0) or ends (side -1) with a fraction."""
    k = _name(n)
    if k == "mfrac":
        return n.get("linethickness") not in ("0", "0px", "0pt")
    if k in CONTAINERS:
        kids = [c for c in _kids(n) if _name(c) not in ("mspace",)]
        return bool(kids) and _edge(kids[side], side)
    return False


def seq(nodes: list[Tag]) -> str:
    """A row of MathML nodes, spaced the way the bank spaces them: binary
    operators with a space each side, a sign in front of a term without."""
    out: list[str] = []
    prev = None  # 'op' | 'open' | 'term' | None
    for i, n in enumerate(nodes):
        if _name(n) == "mo":
            op = _txt(n).strip()
            if not op:
                continue
            if op in OPEN:
                out.append(op)
                prev = "open"
            elif op in CLOSE:
                out.append(op)
                prev = "term"
            elif op in (",", ";"):
                out.append(op + " ")
                prev = "open"
            elif op in BINARY:
                unary = op in SIGNS and (prev in (None, "op", "open") or n.get("form") == "prefix")
                out.append(op if unary else f" {op} ")
                prev = "open" if unary else "op"
            else:  # ° ′ % ! $ ∠ | and the rest sit against what they belong to
                out.append(op)
                prev = "term" if op not in ("∠", "$", "|") or prev == "term" else "open"
            continue
        s = mathml(n)
        if not s:
            continue
        # A fraction beside a term or a bracket is a product. MathText reads a
        # fraction's numerator back over a bracket and its denominator on into
        # one, so "7/6(6x - 5)" would set 6(6x - 5) under the bar: a space
        # keeps them apart, the way the test sets them.
        last = "".join(out)[-1:]
        if out and _edge(n, 0) and (last.isalnum() or last in ")′°"):
            out.append(" ")
        elif out and i and _edge(nodes[i - 1], -1) and (s[:1].isalnum() or s[:1] in "(√∛"):
            out.append(" ")
        elif out and _name(n) == "mi" and out[-1].strip() in FUNCTIONS:
            out.append(" ")
        out.append(s)
        prev = "term"
    return tidy("".join(out))


def tidy(s: str) -> str:
    s = re.sub(r"[ \t]+", " ", s)
    s = re.sub(r" *\n *", "\n", s)
    s = re.sub(r"\( +", "(", s)
    s = re.sub(r" +\)", ")", s)
    s = re.sub(r" +,", ",", s)
    return s.strip(" ")


# ---------------------------------------------------------------------------
# HTML around it
# ---------------------------------------------------------------------------

FIGURE_TAGS = {"figure", "table", "svg"}


def is_math_img(t: Tag) -> bool:
    return t.name == "img" and "math-img" in (t.get("class") or [])


def is_figure(t: Tag) -> bool:
    if t.name in FIGURE_TAGS:
        return True
    if t.name == "img" and not is_math_img(t):
        return True
    return False


def has_figure(t: Tag) -> bool:
    if is_figure(t):
        return True
    return any(is_figure(x) for x in t.find_all(True) if x.name in FIGURE_TAGS or x.name == "img")


class Reader:
    """Walks one HTML fragment into lines of text and a list of figures."""

    def __init__(self, spoken_log: list | None = None):
        self.spoken_log = spoken_log if spoken_log is not None else []

    def inline(self, n) -> str:
        if isinstance(n, NavigableString):
            if n.__class__.__name__ in ("Comment", "ProcessingInstruction", "Doctype", "Declaration"):
                return ""
            return re.sub(r"\s+", " ", str(n).replace(" ", " "))
        if not isinstance(n, Tag):
            return ""
        nm = _name(n)
        if nm == "math":
            s = mathml(n)
            return " " + s + " " if "\n" not in s else "\n" + s + "\n"
        if nm == "br":
            return "\n"
        if is_math_img(n):
            alt = (n.get("alt") or "").strip()
            if alt:
                s = speak_to_text(htmllib.unescape(alt))
            else:  # no words to read: read off College Board's image by eye, keyed by the image
                key = "IMG:" + hashlib.md5((n.get("src") or "").encode()).hexdigest()[:12]
                s = FIXES.get(key, "[[?]]")
            self.spoken_log.append((alt, s))
            return " " + s + " "
        if nm == "sup":
            return "^(" + self.inline_all(n).strip() + ")"
        if nm == "sub":
            return sub("", self.inline_all(n).strip())
        if is_figure(n):
            return ""
        if nm in ("p", "div", "li") or "sr-only" in (n.get("class") or []):
            # a paragraph inside a paragraph is still a paragraph; a screen
            # reader's long description is not part of the question
            return "" if "sr-only" in (n.get("class") or []) else "\n" + self.inline_all(n) + "\n"
        return self.inline_all(n)

    def inline_all(self, n: Tag) -> str:
        return "".join(self.inline(c) for c in n.children)

    def blocks(self, fragment: str) -> tuple[list[str], list[str]]:
        soup = BeautifulSoup(fragment or "", "html.parser")
        lines: list[str] = []
        figures: list[str] = []
        self._walk(soup, lines, figures)
        return [l for l in lines if l.strip()], figures

    def _walk(self, node: Tag, lines: list[str], figures: list[str]) -> None:
        buf = ""
        for c in node.children:
            if isinstance(c, Tag) and "sr-only" in (c.get("class") or []):
                continue
            if isinstance(c, Tag) and is_figure(c):
                lines.extend(self._para(buf)); buf = ""
                figures.append(str(c))
            elif isinstance(c, Tag) and _name(c) in ("p", "div", "li", "ul", "ol", "section", "blockquote", "figure", "caption", "tbody", "center") or (
                    isinstance(c, Tag) and has_figure(c)):
                lines.extend(self._para(buf)); buf = ""
                if _name(c) in ("ul", "ol"):
                    roman = "roman" in (c.get("style") or "") or c.get("type") == "I"
                    for i, li in enumerate(x for x in c.children if isinstance(x, Tag) and x.name == "li"):
                        mark = (ROMAN[i] + ". ") if roman else ("" if c.name == "ul" else f"{i + 1}. ")
                        sub_lines: list[str] = []
                        self._walk(li, sub_lines, figures)
                        if sub_lines:
                            lines.append(mark + sub_lines[0])
                            lines.extend(sub_lines[1:])
                elif has_figure(c):
                    self._walk(c, lines, figures)
                else:
                    lines.extend(self._para(self.inline_all(c)))
            else:
                buf += self.inline(c)
        lines.extend(self._para(buf))

    @staticmethod
    def _para(s: str) -> list[str]:
        out = []
        for line in s.split("\n"):
            line = tidy(line)
            line = re.sub(r" ([,.;:?!])(?=\s|$)", r"\1", line)
            line = re.sub(r"\( ", "(", line)
            if line:
                out.append(line)
        return out


ROMAN = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII"]


# ---------------------------------------------------------------------------
# One question
# ---------------------------------------------------------------------------

def read_item(qid: str, meta: dict, raw) -> dict:
    log: list = []
    rd = Reader(log)
    if isinstance(raw, list):  # disclosed item
        d = raw[0]
        body_l, body_f = rd.blocks(d.get("body") or "")
        prompt_l, prompt_f = rd.blocks(d.get("prompt") or "")
        ans = d["answer"]
        options = []
        for lab in "abcd":
            ch = (ans.get("choices") or {}).get(lab)
            if ch is None:
                continue
            l, f = rd.blocks(ch.get("body") or "")
            options.append({"label": lab.upper(), "text": "\n".join(l), "figures": f})
        exp_l, exp_f = rd.blocks(ans.get("rationale") or "")
        key = (ans.get("correct_choice") or "").upper() or None
        kind = "choice" if ans.get("style") == "Multiple Choice" else "entry"
        accepted = None
        stem_lines, figures = body_l + prompt_l, body_f + prompt_f
        shape = "disclosed"
    else:
        d = raw
        stem_lines, figures = rd.blocks(d.get("stem") or "")
        if d.get("stimulus"):
            sl, sf = rd.blocks(d["stimulus"])
            stem_lines, figures = sl + stem_lines, sf + figures
        options = []
        for i, o in enumerate(d.get("answerOptions") or []):
            l, f = rd.blocks(o.get("content") or "")
            options.append({"label": LABELS[i], "text": "\n".join(l), "figures": f})
        exp_l, exp_f = rd.blocks(d.get("rationale") or "")
        kind = "choice" if d.get("type") == "mcq" else "entry"
        ca = d.get("correct_answer") or []
        key = ca[0] if kind == "choice" and ca else None
        accepted = [a.strip() for a in ca] if kind == "entry" else None
        shape = "current"
    return {
        "ref": f"CB-{qid}",
        "shape": shape,
        "kind": kind,
        "stem": "\n".join(stem_lines),
        "figures": figures,
        "options": options,
        "key": key,
        "accepted": accepted,
        "explanation": "\n".join(exp_l),
        "explanation_figures": len(exp_f),
        "spoken": log,
    }


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("items", type=Path)
    ap.add_argument("listing", type=Path)
    ap.add_argument("--refs", type=Path, required=True)
    ap.add_argument("--out", type=Path, required=True)
    a = ap.parse_args()
    listing = {q["questionId"]: q for q in json.loads(a.listing.read_text())}
    refs = [l.split()[0] for l in a.refs.read_text().split("\n") if l.strip()]
    out = []
    for ref in refs:
        qid = ref[3:]
        raw = json.loads((a.items / f"{qid}.json").read_text())
        out.append(read_item(qid, listing[qid], raw))
    a.out.write_text(json.dumps(out, ensure_ascii=False, indent=1))
    print(f"{len(out)} questions -> {a.out}")


if __name__ == "__main__":
    main()
