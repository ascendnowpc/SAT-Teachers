"""
Rebuild a mathematical expression from the shapes a PDF draws it with.

College Board's Question Bank export writes its prose as text and draws its
mathematics as vector paths — one path per glyph, plus a filled rectangle for
every fraction bar. The text layer therefore holds "In the given equation,
and are constants" where the page shows "In the given equation, s and r are
constants". Nothing is missing from the page; it is missing from the text.

This module takes the glyphs of one expression — each already classified into a
character by glyphs.py — and returns the expression as a string, using the
notation the app already renders: "a/b" for a fraction (MathText sets those as
stacked fractions) and "^" for an exponent.

The geometry is what carries the structure, so that is what is read:

    a bar          a path far wider than it is tall. It is a fraction bar when
                   glyphs sit both above and below it, and a minus sign when
                   they do not.
    a fraction     everything above the bar within its span is the numerator,
                   everything below it the denominator. Both are rebuilt by
                   this same function, so fractions nest.
    an exponent    a glyph markedly smaller than the run's body text whose
                   foot sits above the run's baseline.

Anything this cannot read confidently is reported rather than guessed at:
`decode` returns the text and a list of reasons it is unsure, and the caller
falls back to a picture of the region. A wrong equation in front of a student
is worse than a picture of the right one.
"""

from __future__ import annotations

from dataclasses import dataclass, field


# A path this much wider than it is tall, and no taller than this, is a rule:
# a fraction bar or a minus sign. The export draws both as a thin rectangle;
# what separates them is whether anything sits above and below.
RULE_ASPECT = 6.0
RULE_MAX_HEIGHT = 1.2

# A glyph whose height is less than this fraction of the run's body height is a
# superscript or subscript rather than part of the line.
SMALL_RATIO = 0.72

# How far above the baseline a small glyph's foot must sit to read as an
# exponent, as a fraction of the body height.
RAISE_RATIO = 0.25

# Where a space is written, as a fraction of the body height — expressions are
# set at several sizes on one page, so an absolute gap would break numbers up
# in one place and run words together in another.
#
# Two digits or letters side by side are held together much harder than a
# letter and an operator: "110" losing its middle digit to a space is a
# different number, while "f(x) = 2" reads the same either way.
GAP_RUN = 0.80
GAP_LOOSE = 0.30

# Characters that are never a superscript, however small they are set. A
# relation is drawn short and high — "=" is two thin strokes above the
# baseline — and reads as an exponent unless it is excluded by name.
OPERATORS = set("=+-<>≤≥÷·×±≠")


@dataclass
class Glyph:
    """One drawn shape, already read as a character."""

    char: str
    x0: float
    y0: float
    x1: float
    y1: float
    # Set when glyphs.py could not classify the shape confidently.
    unsure: bool = False

    @property
    def width(self) -> float:
        return self.x1 - self.x0

    @property
    def height(self) -> float:
        return self.y1 - self.y0

    @property
    def cx(self) -> float:
        return (self.x0 + self.x1) / 2

    @property
    def cy(self) -> float:
        return (self.y0 + self.y1) / 2

    @property
    def is_rule(self) -> bool:
        return (
            self.height <= RULE_MAX_HEIGHT
            and self.width >= RULE_ASPECT * max(self.height, 0.01)
        )


@dataclass
class Decoded:
    text: str
    # Why the result should not be trusted, if anything. Empty means confident.
    doubts: list[str] = field(default_factory=list)

    @property
    def ok(self) -> bool:
        return not self.doubts


def decode(glyphs: list[Glyph]) -> Decoded:
    """One expression's glyphs, in reading order, as text."""
    doubts: list[str] = []
    if not glyphs:
        return Decoded("", [])
    unsure = [g for g in glyphs if g.unsure]
    if unsure:
        doubts.append(f"{len(unsure)} shape(s) not recognised")
    text = _render(list(glyphs), doubts)
    return Decoded(text, doubts)


def _body_height(glyphs: list[Glyph]) -> float:
    """The height of ordinary, full-size glyphs in a run.

    The median of the non-rule heights, which is the body text even when the
    run is mostly exponents: a run is written at one size and decorated at
    another, not the other way round.
    """
    hs = sorted(g.height for g in glyphs if not g.is_rule)
    if not hs:
        return 1.0
    return hs[len(hs) // 2]


DESCENDERS = set("ypgqj,;()[]{}/")


def _baseline(glyphs: list[Glyph]) -> float | None:
    """The line the run sits on.

    Taken as the commonest foot rather than the middle one. Most characters
    rest on the baseline exactly, so they agree; the ones that do not —
    brackets, and letters with a tail like f, y and p — hang below it, and
    there are enough of them in a short expression to drag an average or a
    median down. A baseline set too low makes every x-height letter look
    raised, and "f(x)" comes out as "f" with a superscript x.
    """
    body = _body_height(glyphs)
    # Only glyphs set at the run's own size, and only ones that rest on the
    # line. A bracket is drawn far taller than the text and hangs well below
    # it, a tail on y or p does the same, and a superscript is drawn smaller
    # and sits above it — each would move the answer.
    sitting = [
        g for g in glyphs
        if not g.is_rule
        and g.char not in DESCENDERS
        and body * 0.8 <= g.height <= body * 1.3
    ]
    # Nothing left to measure against. "(x, y)" is all brackets, a comma and a
    # tail, and guessing a line from any of them would raise the x into an
    # exponent it never was. Say so instead, and the caller raises nothing.
    if not sitting:
        return None

    feet: dict[float, int] = {}
    for g in sitting:
        key = round(g.y1 * 2) / 2
        feet[key] = feet.get(key, 0) + 1
    best = max(feet.values())
    # Among equally common feet, the highest on the page. Everything left in
    # this set either rests on the baseline or hangs below it on a tail, and
    # the page's y grows downwards, so the smallest value is the line itself.
    return min(k for k, v in feet.items() if v == best)


def _fraction_bars(glyphs: list[Glyph]) -> list[Glyph]:
    """The rules that are fraction bars: something close above and below.

    "Close" is what separates a fraction from a minus sign. Any rule in a
    stacked expression has something above it and something below it
    somewhere; only a fraction bar has them within a line of itself, which is
    where a numerator and a denominator sit.
    """
    body = _body_height(glyphs)
    reach = body * 1.5
    bars = []
    for g in glyphs:
        if not g.is_rule:
            continue
        span = [
            o
            for o in glyphs
            if o is not g and o.cx > g.x0 - 0.5 and o.cx < g.x1 + 0.5
        ]
        above = any(o.y1 <= g.cy and g.cy - o.y1 <= reach for o in span)
        below = any(o.y0 >= g.cy and o.y0 - g.cy <= reach for o in span)
        if above and below:
            bars.append(g)
    return bars


def _render(glyphs: list[Glyph], doubts: list[str]) -> str:
    """A run of glyphs as text, splitting at the outermost fraction bars."""
    if not glyphs:
        return ""

    bars = _fraction_bars(glyphs)
    if bars:
        # The outermost bar is the widest one that no other bar contains.
        def contained_by(a: Glyph, b: Glyph) -> bool:
            return b is not a and b.x0 <= a.x0 and b.x1 >= a.x1 and b.width > a.width

        outer = [b for b in bars if not any(contained_by(b, o) for o in bars)]
        outer.sort(key=lambda b: b.x0)
        return _render_with_fractions(glyphs, outer, doubts)

    return _render_line(glyphs, doubts)


def _render_with_fractions(
    glyphs: list[Glyph], bars: list[Glyph], doubts: list[str]
) -> str:
    """Left to right, writing each fraction as (numerator)/(denominator)."""
    used: set[int] = set()
    # Each piece carries where it starts and ends, so the gaps between pieces
    # are real gaps on the page and not just the advance from one to the next.
    pieces: list[tuple[float, float, str]] = []

    bar_ix = {id(b): i for i, g in enumerate(glyphs) for b in bars if g is b}

    # Every glyph goes to the bar it is nearest to, rather than to whichever
    # bar is considered first. Two fractions side by side overlap in x often
    # enough — "1/2 + 3/4" sets them close — and first-come assignment left
    # the second bar with nothing above or below it and reported a fraction
    # with an empty half.
    halves: dict[int, tuple[list[Glyph], list[Glyph]]] = {
        bar_ix[id(b)]: ([], []) for b in bars
    }
    for i, g in enumerate(glyphs):
        if i in bar_ix.values():
            continue
        owner = None
        best = None
        for b in bars:
            if g.cx <= b.x0 - 0.5 or g.cx >= b.x1 + 0.5:
                continue
            d = abs(g.cy - b.cy)
            if best is None or d < best:
                best = d
                owner = b
        if owner is None:
            continue
        # A glyph that straddles the bar belongs to neither half — a bracket
        # drawn tall enough to enclose the whole fraction is the usual case —
        # so it is left where it is and written alongside.
        if g.y1 > owner.cy and g.y0 < owner.cy:
            continue
        num, den = halves[bar_ix[id(owner)]]
        (num if g.y1 <= owner.cy else den).append(g)
        used.add(i)

    for bar in bars:
        bi = bar_ix[id(bar)]
        num, den = halves[bi]
        used.add(bi)
        if not num or not den:
            doubts.append("a fraction with an empty half")
            continue
        top = _render(num, doubts)
        bottom = _render(den, doubts)
        pieces.append((bar.x0, bar.x1, f"{_wrap(top)}/{_wrap(bottom)}"))

    for i, g in enumerate(glyphs):
        if i in used:
            continue
        pieces.append((g.x0, g.x1, _render_line([g], doubts)))

    pieces.sort(key=lambda p: p[0])
    body = _body_height(glyphs)
    out = ""
    last_end: float | None = None
    for x0, x1, s in pieces:
        if last_end is not None and x0 - last_end > body * GAP_LOOSE and not out.endswith(" "):
            out += " "
        out += s
        last_end = x1
    return out.strip()


def _wrap(s: str) -> str:
    """Brackets around a fraction's half, unless it plainly does not need them.

    "12x+28" over "4" has to be written "(12x+28)/4": without the brackets the
    app — and a student — would read 12x + 28/4. A single term does not need
    them, and reads better without.
    """
    s = s.strip()
    if not s:
        return s
    if len(s) == 1:
        return s
    if s.isalnum():
        return s
    if s.startswith("(") and s.endswith(")") and _balanced(s[1:-1]):
        return s
    return f"({s})"


def _balanced(s: str) -> bool:
    depth = 0
    for c in s:
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth < 0:
                return False
    return depth == 0


def _render_line(glyphs: list[Glyph], doubts: list[str]) -> str:
    """A run with no fraction in it: left to right, exponents raised."""
    if not glyphs:
        return ""
    ordered = sorted(glyphs, key=lambda g: g.x0)
    body = _body_height(ordered)
    baseline = _baseline(ordered)

    out = ""
    last_end: float | None = None
    last_char = ""
    sup_open = False

    for g in ordered:
        char = _char_of(g, doubts)
        small = (not g.is_rule) and g.height < body * SMALL_RATIO
        raised = (
            small
            and baseline is not None
            and (baseline - g.y1) > body * RAISE_RATIO
            and char not in OPERATORS
        )

        if sup_open and not raised:
            out += ")"
            sup_open = False

        if last_end is not None and not raised:
            # A run of digits or letters is one token and is only broken by a
            # gap far wider than the one that separates a term from a sign.
            joined = last_char[-1:].isalnum() and char[:1].isalnum()
            want = body * (GAP_RUN if joined else GAP_LOOSE)
            if g.x0 - last_end > want and not out.endswith(" "):
                out += " "

        if raised and not sup_open:
            out += "^("
            sup_open = True

        out += char
        last_end = g.x1
        last_char = char

    if sup_open:
        out += ")"
    return out.strip()


def _char_of(g: Glyph, doubts: list[str]) -> str:
    if g.is_rule:
        # A rule that reached here is not a fraction bar, so it is a minus.
        return "-"
    if not g.char:
        doubts.append("an unreadable shape")
        return "?"
    return g.char
