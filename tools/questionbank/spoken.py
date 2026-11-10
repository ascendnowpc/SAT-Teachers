"""
Read an expression from the words a screen reader speaks for it.

College Board's disclosed items carry each expression as an image, and the
image's alt text is the expression spoken aloud:

    "the fraction with numerator 2 x minus 1, and denominator 3, end fraction"
    "open parenthesis, 1 point 1 5, close parenthesis, raised to the t power"
    "the square root of b squared, minus 4 a c, end root"

This turns those words back into the bank's notation — 2x - 1/3 as
"(2x - 1)/3", powers as "^( )", roots as "√". The constructions that say where
they end ("end fraction", "end root", "close parenthesis") are read exactly.
Those that do not — "the square root of 5", "the fraction 240 over 360 times
pi" — take the shortest reading, one term, which is how the test sets them.

Whatever is ambiguous is not decided here alone: collegeboard.py logs every
expression it reads, and each one holding a fraction, root, power or
subscript was checked against College Board's own image of it, with
corrections in spoken_fixes.json, which this reads first.
"""

from __future__ import annotations

import json
import re
from pathlib import Path

FIXES_PATH = Path(__file__).with_name("spoken_fixes.json")
FIXES: dict[str, str] = json.loads(FIXES_PATH.read_text()) if FIXES_PATH.exists() else {}

UNITS = {"thirty": 30, "forty": 40, "fifty": 50, "zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7,
         "eight": 8, "nine": 9, "ten": 10, "eleven": 11, "twelve": 12, "thirteen": 13, "twenty": 20}
DENOMS = {"half": 2, "halves": 2, "third": 3, "thirds": 3, "fourth": 4, "fourths": 4, "quarter": 4,
          "quarters": 4, "fifth": 5, "fifths": 5, "sixth": 6, "sixths": 6, "seventh": 7, "sevenths": 7,
          "eighth": 8, "eighths": 8, "ninth": 9, "ninths": 9, "tenth": 10, "tenths": 10, "twelfth": 12,
          "twelfths": 12, "fourteenth": 14}
ORDINAL = {"second": "2", "third": "3", "fourth": "4", "fifth": "5", "sixth": "6", "seventh": "7",
           "eighth": "8", "ninth": "9", "tenth": "10", "nth": "n", "zeroth": "0", "first": "1",
           "eleventh": "11", "twelfth": "12", "thirteenth": "13", "fourteenth": "14", "fifteenth": "15",
           "sixteenth": "16", "seventeenth": "17", "eighteenth": "18", "nineteenth": "19", "twentieth": "20"}
GREEK = {"pi": "π", "theta": "θ", "alpha": "α", "beta": "β"}
FUNCS = {"sine": "sin", "cosine": "cos", "tangent": "tan", "sin": "sin", "cos": "cos", "tan": "tan"}

# Longest first. Each maps to an operator the bank writes with a space each side.
BINOPS = [
    ("is less than or equal to", "≤"), ("is greater than or equal to", "≥"),
    ("less than or equal to", "≤"), ("greater than or equal to", "≥"),
    ("is not equal to", "≠"), ("is less than", "<"), ("is greater than", ">"),
    ("less than", "<"), ("greater than", ">"), ("is approximately equal to", "≈"),
    ("is approximately", "≈"), ("approximately equals", "≈"),
    ("which is approximately equal to", "≈"), ("which is approximately", "≈"),
    ("which is less than or equal to", "≤"), ("which is greater than or equal to", "≥"),
    ("which is less than", "<"), ("which is greater than", ">"),
    ("plus or minus", "±"), ("minus or plus", "∓"), ("divided by", "÷"),
    ("which equals", "="), ("which is equal to", "="), ("equals", "="), ("equal to", "="), ("is equal to", "="), ("plus", "+"), ("minus", "-"),
    ("times", "·"), ("is", "="),
]
UNIT_WORDS = {"centimeters": "cm", "centimeter": "cm", "meters": "m", "meter": "m", "inches": "in.",
              "inch": "in.", "feet": "ft", "foot": "ft", "millimeters": "mm", "kilometers": "km",
              "kilograms": "kg", "grams": "g", "seconds": "s", "units": "units", "dollars": "dollars"}
RELATIONS = ("which equals", "equals", "is less than", "is greater than", "is equal to",
             "is not equal to", "is approximately")
STOPS = {"end fraction", "end root", "and denominator", "close parenthesis", "close bracket",
         "end absolute value", "end exponent", "end power", "power", "and"}


def tokenize(s: str) -> list[str]:
    s = s.replace("’", "'").replace("‐", "-").replace("–", "-")
    s = re.sub(r"(?<=[a-z])-(?=[a-z])", " ", s)  # one-third -> one third
    toks = re.findall(r"\d[\d,]*\.\d+|\.\d+|\d[\d,]*\d|\d|[A-Za-z']+|[,:;.]|[^\sA-Za-z\d]", s)
    out = []
    for t in toks:
        if t == "," and out and out[-1] == ",":
            continue
        out.append(t)
    return out


class P:
    def __init__(self, toks: list[str]):
        self.t = toks
        self.i = 0

    # -- helpers ---------------------------------------------------------
    def peek(self, k: int = 0) -> str | None:
        j = self.i + k
        return self.t[j] if j < len(self.t) else None

    def low(self, k: int = 0) -> str:
        p = self.peek(k)
        return p.lower() if p and (len(p) > 1 or p in "aI") else (p or "")

    def at(self, phrase: str, skip_commas: bool = True) -> int:
        """Tokens matched if `phrase` is next (commas between words allowed)."""
        words = phrase.split()
        j = self.i
        for w in words:
            while skip_commas and j < len(self.t) and self.t[j] == ",":
                j += 1
            if j >= len(self.t):
                return 0
            tok = self.t[j]
            if tok.lower() != w or (len(tok) == 1 and tok not in "a" and w != tok.lower()):
                return 0
            if len(tok) == 1 and tok.isupper() and len(w) == 1:
                return 0  # a capital letter is a variable, not the word "a"
            j += 1
        return j - self.i

    def eat(self, phrase: str) -> bool:
        n = self.at(phrase)
        if n:
            self.i += n
            return True
        return False

    def skip_commas(self) -> None:
        while self.peek() == ",":
            self.i += 1

    def ends_ahead(self, closer: str, opener: str) -> bool:
        """Whether `closer` comes later at this nesting level."""
        depth = 0
        save = self.i
        try:
            while self.peek() is not None:
                if self.at(opener):
                    depth += 1
                    self.i += self.at(opener)
                    continue
                if self.at(closer):
                    if depth == 0:
                        return True
                    depth -= 1
                    self.i += self.at(closer)
                    continue
                self.i += 1
            return False
        finally:
            self.i = save

    # -- grammar ---------------------------------------------------------
    def expr(self, stops: tuple[str, ...] = (), short: bool = False) -> str:
        """Items up to a stop phrase. `short` stops at the first operator or
        comma too: the scope of a construction that does not say where it ends."""
        parts: list[tuple[str, str]] = []  # (kind, text) kind: atom|op|sep
        line_start = 0
        while self.peek() is not None:
            if any(self.at(s) for s in stops):
                break
            if self.peek() in (",", ";"):
                if short and parts:
                    break
                # "AB equals 9, BC equals 18.5": a comma between two relations separates them
                if not short and any(k == "op" and t in "=<>≤≥≠" for k, t in parts[line_start:]):
                    j = self.i + 1
                    while j < len(self.t) and self.t[j] != ",":
                        j += 1
                    ahead = " ".join(self.t[self.i + 1:j]).lower()
                    if re.search(r"\b(equals|is less than|is greater than|is equal to)\b", ahead) and \
                            not re.match(r"(which|equals|is|and|or|so|then|minus|plus|times|divided|over|squared|cubed|to|raised)\b", ahead):
                        self.i += 1
                        parts.append(("sep", ","))
                        line_start = len(parts)
                        continue
                nxt = self.peek(1) or ""
                if parts and parts[-1][0] == "atom" and parts[-1][1][-1:].isdigit() and (
                        nxt[:1].isdigit() or nxt.lower() == "negative") and not short:
                    self.i += 1
                    parts.append(("sep", ","))  # 72, 73, 76: a list, not a product
                    continue
                # "comma" is said; a bare comma is a pause
                self.i += 1
                continue
            if self.peek() in (":", "."):
                if self.peek() == ":":
                    parts.append(("sep", ":"))
                self.i += 1
                continue
            if self.at("and") and parts and parts[-1][0] == "atom" and parts[-1][1].isdigit() \
                    and self.low(1) in UNITS and self.low(2) in DENOMS:
                self.eat("and")  # "11 and two thirds" is the mixed number 11 2/3
                continue
            if "and" not in stops and self.at("and") and any(k == "op" and t in "=<>≤≥" for k, t in parts[line_start:]):
                self.eat("and")
                parts.append(("sep", "\n"))
                line_start = len(parts)
                continue
            if self.eat("comma"):
                if short and parts:
                    self.i -= 1
                    break
                parts.append(("sep", ","))
                continue
            op = self.binop()
            if op:
                if short and parts and op != "·":
                    self.i -= op_len(self, op)
                    break
                if op in "-+±" and (not parts or parts[-1][0] in ("op", "sep")):
                    parts.append(("sign", op))
                elif op == "·" and short and parts:
                    # "times" inside a short scope: keep going only for a plain coefficient
                    self.i -= op_len(self, op)
                    break
                elif op == "·":
                    parts.append(("times", ""))
                else:
                    parts.append(("op", op))
                continue
            if self.eat("over"):
                # "a over b": the term before and the term after
                run = []
                while parts and parts[-1][0] == "atom":
                    run.insert(0, parts.pop()[1])
                left = "".join(run)
                right = self.expr(stops=stops, short=True)
                parts.append(("atom", frac(left, right)))
                continue
            a = self.atom(stops)
            if a is None:
                w = self.peek()
                if short and parts and re.fullmatch(r"[A-Za-z][A-Za-z']+", w or ""):
                    break  # a unit after a short term belongs to the expression around it
                self.i += 1
                if re.fullmatch(r"[A-Za-z][A-Za-z']+", w or ""):
                    # a word the page prints too: a unit, or prose inside the expression
                    word = UNIT_WORDS.get(w.lower(), w)
                    if self.eat("squared"):
                        word += "^(2)"
                    elif self.eat("cubed"):
                        word += "^(3)"
                    parts.append(("word", word))
                continue
            a = self.postfix(a, stops)
            parts.append(("atom", a))
        return assemble(parts)

    def binop(self) -> str | None:
        for words, sym in BINOPS:
            if words == "is" and (self.at("is the") or not self.at("is")):
                continue
            if self.eat(words):
                return sym
        return None

    def atom(self, stops) -> str | None:
        p = self.peek()
        lp = self.low()
        if p is None:
            return None
        if self.eat("the line segment"):
            return overline(self.letters())
        if self.eat("the length of") and not self.at("line segment"):
            return self.atom(stops) or ""
        if self.eat("open parenthesis") or self.eat("left parenthesis") or (
                self.at("parenthesis") and not self.at("parenthesis close") and self.eat("parenthesis")):
            inner = self.expr(stops=("close parenthesis", "right parenthesis"))
            self.eat("close parenthesis") or self.eat("right parenthesis")
            return f"({inner})"
        if self.eat("open bracket"):
            inner = self.expr(stops=("close bracket",))
            self.eat("close bracket")
            return f"[{inner}]"
        if self.eat("open brace"):
            eqs = [self.expr(stops=("and", "close brace"))]
            while self.eat("and"):
                eqs.append(self.expr(stops=("and", "close brace")))
            self.eat("close brace")
            return "\n".join(eqs)
        if self.eat("the absolute value of") or self.eat("absolute value of"):
            if self.ends_ahead("end absolute value", "the absolute value of"):
                inner = self.expr(stops=("end absolute value",))
                self.eat("end absolute value")
            else:
                inner = self.expr(stops=stops, short=True)
            return f"|{inner}|"
        if self.eat("the negative of") or self.eat("negative of"):
            self.skip_commas()
            a = self.atom(stops)
            return "-" + (self.postfix(a, stops) if a else "")
        if self.eat("negative"):
            a = self.atom(stops)
            return "-" + (self.postfix(a, stops) if a else "")
        if self.eat("positive"):
            return self.atom(stops) or ""
        if self.eat("the fraction with numerator") or self.eat("fraction with numerator"):
            num = self.expr(stops=("and denominator",))
            self.eat("and denominator")
            if self.ends_ahead("end fraction", "the fraction"):
                den = self.expr(stops=("end fraction",) + RELATIONS)
                self.eat("end fraction")
            else:
                den = self.expr(stops=stops + RELATIONS)
            return frac(num, den)
        if self.eat("the fraction") or self.eat("fraction"):
            num = self.expr(stops=("over",) + stops, short=False)
            self.eat("over")
            if self.ends_ahead("end fraction", "the fraction"):
                den = self.expr(stops=("end fraction",))
                self.eat("end fraction")
            else:
                den = self.expr(stops=stops, short=True)
            return frac(num, den)
        for lead in ("the square root of", "square root of", "the positive square root of",
                     "the cube root of", "cube root of", "the fourth root of", "fourth root of",
                     "the nth root of", "nth root of"):
            if self.eat(lead):
                sign = "∛" if "cube" in lead else "∜" if "fourth" in lead else "ⁿ√" if "nth" in lead else "√"
                self.skip_commas()
                if self.ends_ahead("end root", "root of"):
                    inner = self.expr(stops=("end root",))
                    self.eat("end root")
                else:
                    inner = self.expr(stops=stops, short=True)
                return sign + group(inner)
        if self.eat("line segment") or self.eat("segment"):
            return overline(self.letters())
        if self.eat("the length of line segment") or self.eat("length of line segment"):
            return self.letters()
        if self.eat("angle"):
            return "∠" + self.letters()
        if self.eat("triangle"):
            return "△" + self.letters()
        if self.eat("arc"):
            return "arc " + self.letters()
        if self.eat("the point with coordinates") or self.eat("the points with coordinates") \
                or self.eat("the ordered pair") or self.eat("with coordinates") or self.eat("the point"):
            a = self.expr(stops=("comma",) + stops, short=True)
            self.eat("comma")
            b = self.expr(stops=stops, short=True)
            return f"({a}, {b})"
        if lp in FUNCS:
            self.i += 1
            self.eat("of")
            a = self.atom(stops)
            a = self.postfix(a, stops) if a else ""
            return f"{FUNCS[lp]}{a if wrapped(a) else '(' + a + ')'}"  # sin(32°), tan(A)
        if self.eat("side"):
            return self.letters()  # "side B C" in a ratio is printed BC
        if self.eat("the measure of") or self.eat("measure of"):
            a = self.atom(stops) or ""
            return f"m({a})"
        if self.eat("the"):
            return self.atom(stops)  # "the" before anything else is only said
        if lp in GREEK:
            self.i += 1
            return GREEK[lp]
        if lp in ("degrees", "degree"):
            self.i += 1
            return "°"
        if lp in ("twenty", "thirty", "forty", "fifty") and self.low(1) in UNITS and 0 < UNITS[self.low(1)] < 10:
            tens = {"twenty": 20, "thirty": 30, "forty": 40, "fifty": 50}[lp]
            n = tens + UNITS[self.low(1)]
            self.i += 2
            if self.low() in DENOMS:
                self.i += 1
                return f"{n}/{DENOMS[self.low(-1)]}"
            return str(n)
        if lp in UNITS and self.low(1) in DENOMS:
            n, d = UNITS[lp], DENOMS[self.low(1)]
            self.i += 2
            return f"{n}/{d}"
        if lp in ("a",) and self.low(1) in DENOMS and p == "a":
            self.i += 2
            return f"1/{DENOMS[self.low(-1)]}"
        if re.fullmatch(r"\d+", p) and self.low(1) in DENOMS and self.low(1) not in ("second",):
            self.i += 2
            return f"{p}/{DENOMS[self.low(-1)]}"
        if re.fullmatch(r"\d[\d,]*(\.\d+)?|\.\d+", p):
            self.i += 1
            num = p
            if self.eat("point"):
                digs = ""
                while self.peek() and (re.fullmatch(r"\d", self.peek()) or
                                       (self.low() in UNITS and UNITS[self.low()] < 10)):
                    digs += self.peek() if self.peek().isdigit() else str(UNITS[self.low()])
                    self.i += 1
                if not digs and self.peek() and re.fullmatch(r"\d+", self.peek()):
                    digs = self.peek()  # "0 point 90" as well as "0 point 9 0"
                    self.i += 1
                num += "." + digs
            # "1 2 5" is a number read digit by digit only after "point"; otherwise a product
            return num
        if p.lower() == "point" and self.peek(1) and re.fullmatch(r"\d", self.peek(1)):
            self.i += 1
            digs = ""
            while self.peek() and re.fullmatch(r"\d", self.peek()):
                digs += self.peek()
                self.i += 1
            return "0." + digs
        if lp in UNITS:
            self.i += 1
            num = str(UNITS[lp])
            if self.at("point") and self.peek(1) and re.fullmatch(r"\d+", self.peek(1)):
                self.eat("point")  # "zero point 4"
                digs = ""
                while self.peek() and re.fullmatch(r"\d", self.peek()):
                    digs += self.peek()
                    self.i += 1
                if not digs:
                    digs = self.peek()
                    self.i += 1
                num += "." + digs
            return num
        if re.fullmatch(r"[A-Za-z]", p):
            self.i += 1
            # f of x: a function applied
            if self.at("of") and not self.at("of the"):
                self.eat("of")
                self.skip_commas()
                a = self.atom(stops)
                a = self.postfix(a, stops) if a else ""
                return f"{p}({a})" if not (a.startswith("(") and a.endswith(")")) else f"{p}{a}"
            return p
        if lp in ("percent",):
            self.i += 1
            return "%"
        if p in ("$", "%", "°", "'", "(", ")"):
            self.i += 1
            return p
        return None

    def letters(self) -> str:
        s = ""
        self.skip_commas()
        if self.peek() and re.fullmatch(r"[A-Z]{2,4}", self.peek()):
            s = self.peek()
            self.i += 1
            return s
        while self.peek() and re.fullmatch(r"[A-Za-z]", self.peek()) and not (self.peek() == "a" and s):
            s += self.peek()
            self.i += 1
            if self.peek() == "," and self.peek(1) and re.fullmatch(r"[A-Z]", self.peek(1)):
                self.i += 1
        return s

    def postfix(self, a: str, stops) -> str:
        while True:
            if self.eat("squared"):
                a = sup(a, "2")
            elif self.eat("cubed"):
                a = sup(a, "3")
            elif self.eat("sub") or self.eat("subscript"):
                b = self.atom(stops) or ""
                a = subscript(a, b)
            elif self.eat("prime"):
                a += "′"
            elif self.eat("degrees") or self.eat("degree"):
                a += "°"
            elif self.eat("percent"):
                a += "%"
            elif self.at("to the power of") or self.at("raised to the power of"):
                self.eat("raised")
                self.eat("to the power of")
                if self.ends_ahead("end exponent", "to the power of"):
                    e = self.expr(stops=("end exponent",))
                    self.eat("end exponent")
                else:
                    e = self.expr(stops=stops, short=True)
                a = sup(a, e)
            elif self.at("to the power") or self.at("raised to the power"):
                self.eat("raised")
                self.eat("to the power")
                if self.ends_ahead("end power", "to the power"):
                    e = self.expr(stops=("end power",))
                    self.eat("end power")
                else:
                    e = self.expr(stops=stops, short=True)
                a = sup(a, e)
            elif self.at("to the") or self.at("raised to the"):
                save = self.i
                self.eat("raised")
                self.eat("to the")
                # "to the fourth power", "to the t power", "to the negative x power",
                # "to the one half power", "to the negative, open parenthesis, x plus 1, close parenthesis, power"
                lw = self.low()
                if lw in ORDINAL and self.low(1) == "power":
                    e = ORDINAL[lw]
                    self.i += 2
                else:
                    e = self.expr(stops=("power",))
                    if not self.eat("power"):
                        self.i = save
                        return a
                a = sup(a, e)
            else:
                return a


def op_len(p: P, sym: str) -> int:
    for words, s in BINOPS:
        if s == sym:
            n = len(words.split())
            back = p.t[p.i - n:p.i]
            if [w.lower() for w in back] == words.split():
                return n
    return 1


def binds(s: str) -> bool:
    if not s:
        return False
    d = 0
    for c in s:
        if c == "(":
            d += 1
        elif c == ")":
            d -= 1
            if d < 0:
                return False
        elif not (c.isalnum() or c in ".√∛°′^̅₀₁₂₃₄₅₆₇₈₉ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓπθ"):
            return False
    return d == 0


SIMPLE = re.compile(r"[^\W_][^\W_.,]*(?:[.,][^\W_]+)*(?:\^\([^\W_.]+(?:\.[^\W_]+)?\))?|√[^\W_]+(?:\.[^\W_]+)?")


def group(s: str) -> str:
    """A radicand: bare only when it is one number or letter, √2, √y; else bracketed."""
    s = s.strip()
    if re.fullmatch(r"\d[\d,]*(\.\d+)?|[A-Za-zπθ]", s) or wrapped(s):
        return s
    return f"({s})"


def wrapped(s: str) -> bool:
    """Whether s is one bracketed group from end to end."""
    if not (s.startswith("(") and s.endswith(")")):
        return False
    d = 0
    for i, c in enumerate(s):
        d += c == "("
        d -= c == ")"
        if d == 0 and i < len(s) - 1:
            return False
    return True


def frac(n: str, d: str) -> str:
    n, d = n.strip(), d.strip()
    # Bare only when MathText reads it whole without help: a number, a letter,
    # a simple power, √2. Anything more is bracketed; MathText drops brackets
    # that only hold a numerator or a denominator together.
    n = n if SIMPLE.fullmatch(n) or wrapped(n) else f"({n})"
    d = d if SIMPLE.fullmatch(d) or wrapped(d) else f"({d})"
    return f"{n}/{d}"


def sup(b: str, e: str) -> str:
    b = b.strip()
    if not (binds(b) and not b.startswith("-")) and not (b.startswith("(") and b.endswith(")")):
        b = f"({b})"
    return f"{b}^({e.strip()})"


SUB = str.maketrans("0123456789aehijklmnoprstuvx", "₀₁₂₃₄₅₆₇₈₉ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓ")


def subscript(a: str, b: str) -> str:
    t = b.translate(SUB)
    if t and all(c in "₀₁₂₃₄₅₆₇₈₉ₐₑₕᵢⱼₖₗₘₙₒₚᵣₛₜᵤᵥₓ" for c in t):
        return a + t
    return f"{a}_{b}" if len(b) == 1 else f"{a}_({b})"  # V_B: no subscript capitals exist


def overline(s: str) -> str:
    return "".join(c + "̅" for c in s)


def assemble(parts: list[tuple[str, str]]) -> str:
    # A signed term after a binary plus or minus is bracketed: 16 - (-8).
    fixed: list[tuple[str, str]] = []
    k = 0
    while k < len(parts):
        kind, txt = parts[k]
        if kind == "sign" and txt == "-" and fixed and fixed[-1][0] == "op" and fixed[-1][1] in "+-" \
                and k + 1 < len(parts) and parts[k + 1][0] == "atom":
            fixed.append(("atom", f"(-{parts[k + 1][1]})"))
            k += 2
            continue
        if kind == "atom" and txt.startswith("-") and fixed and fixed[-1][0] == "op" and fixed[-1][1] in "+-":
            txt = f"({txt})"
        fixed.append((kind, txt))
        k += 1
    parts = fixed
    out = ""
    prev = None
    for kind, txt in parts:
        if kind == "times":
            out += "\x00"  # decided once the next term is known
            continue
        if kind == "word":
            out = out.rstrip() + " " + txt + " "
            prev = "op"
            continue
        if kind == "op":
            out += f" {txt} "
        elif kind == "sign":
            out += txt
        elif kind == "sep":
            out = out.rstrip() + {",": ", ", ":": ": ", "\n": "\n"}[txt]
        else:
            if prev == "atom":
                last = out[-1:]
                if "/" in txt.split("^")[0] and (last.isalnum() or last in ")′°") \
                        or "/" in out.split(" ")[-1] and (txt[:1].isalnum() or txt[:1] in "(√∛"):
                    out += " "  # a fraction beside a term: keep them apart
                elif last.isdigit() and txt[:1].isdigit():
                    out += " · "  # two numbers side by side are a product
                elif "\n" in txt or last == "\n":
                    out += "\n"
            out += txt
        prev = kind if kind != "sign" else "op"
    # "times" is how a reader says a product the page sets side by side: 5(2x),
    # (x - 1)(x + 2), 2√3. Only two numbers, which would run together, get a dot.
    def times(m):
        a, b = m.group(1), m.group(2)
        if "/" in a.split(" ")[-1] and (re.fullmatch(r"-?[\d.,]+", b) or b[:1] == "("):
            return f"{a} {b if b[:1] == '(' else '(' + b + ')'}"  # 9/10 (100): kept off the denominator
        if re.fullmatch(r"[\w.,]+/[\w.,]+", b) and (a[-1:].isalnum() or a[-1:] == ")") and "/" not in a.split(" ")[-1]:
            return f"{a}({b})"  # 4(a/4): a fraction after a term is bracketed
        if b.startswith("-") and "/" not in a.split(" ")[-1]:
            return f"{a}({b})"  # 4(2)(-t): a negative factor is bracketed
        m = re.fullmatch(r"(-?[\d.,]+)(\^\(.*\))", b)
        if m and not a.endswith("/"):
            return f"{a}({m.group(1)}){m.group(2)}"  # 1,800(1.02)^(t)
        if re.fullmatch(r"-?[\d.,]+", b) or (b[:1].isdigit() and binds(b) and "/" not in b):
            return f"{a}({b})"  # 4(1), k(2), -6(-6): how the page sets a product with a number
        if a[-1:].isdigit() and (b[:1].isdigit() or b[:1] == "."):
            return f"{a} × {b}"
        if "/" in a.split(" ")[-1] and (b[:1] == "(" or b[:1].isalnum()):
            return f"{a} {b}"
        if b[:1] == "(" or a[-1:] == ")":
            return a + b
        if "/" in a.split(" ")[-1] or "/" in b.split(" ")[0].split("^")[0]:
            return f"{a} {b}"
        if b[:1].isdigit():
            return f"{a} × {b}"
        return a + b
    while "\x00" in out:
        out = re.sub(r"([^\s\x00]*) *\x00 *([^\s\x00]*)", times, out, count=1)
    out = out.replace("\x00", "")
    out = re.sub(r"[ \t]+", " ", out)
    out = re.sub(r" *\n *", "\n", out)
    return out.strip()


def speak_to_text(alt: str) -> str:
    """The bank's text for one spoken expression."""
    key = alt.strip()
    if key in FIXES:
        return FIXES[key]
    # "This answer choice consists of two equations." is said, not printed
    key = re.sub(r"^(This answer choice|Each option|Each answer choice|The system)\s+consists of \w+ equations\.\s*", "", key)
    # "the set consisting of 0, negative 1, and 5" is {0, -1, 5}
    m = re.fullmatch(r"(?:the )?set consisting of (.*)", key)
    if m:
        items = [x for x in re.split(r",\s*(?:and\s+)?|\s+and\s+", m.group(1)) if x.strip()]
        return "{" + ", ".join(speak_to_text(x.strip()) for x in items) + "}"
    # "Equation 1: ... Equation 2: ..." is a system, one equation to a line
    if re.match(r"(?:[Ee]quation|[Ii]nequality) \d+\s*:", key):
        eqs = re.split(r"(?:[Ee]quation|[Ii]nequality) \d+\s*:\s*", key)
        return "\n".join(speak_to_text(e.strip(" .,\n")) for e in eqs if e.strip(" .,\n"))
    toks = tokenize(key)
    p = P(toks)
    s = p.expr()
    # "2 comma 0" on its own is a point: the page prints its brackets, the reader does not say them
    # A segment on its own is printed with its bar; inside an equation or a
    # ratio the reader still says "line segment", but the page prints its length.
    if "\u0305" in s and not re.fullmatch(r"(?:[A-Z]\u0305){2}", s):
        s = s.replace("\u0305", "")
        s = re.sub(r"\(([A-Z]{2})\)(?!\^)", r"\1", s)
    if re.fullmatch(r"-?[\w.√/]+, -?[\w.√/]+", s) or (
            re.search(r"\bcomma\b", key) and _top_commas(s) == 1 and not re.search(r"[=<>≤≥\n]", s)
            and not wrapped(s)):
        s = f"({s})"
    return s


def _top_commas(s: str) -> int:
    d = n = 0
    for c in s:
        d += c in "([{"
        d -= c in ")]}"
        n += c == "," and d == 0
    return n
