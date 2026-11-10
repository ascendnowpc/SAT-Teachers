"""
Put a question read out of College Board's export into the shape the app shows.

extract.py reads the export the way it is printed, line by line, and what it
gives back still carries the printed page:

    every printed line ends in a line break, so a sentence breaks wherever the
    page's margin fell — "nearly double the number / reported in Carlo
    Bianchi" — on a screen of any width;

    a word hyphenated at the margin is two halves, "knuckle- / walking";

    the passage and the question are one block of text, so the app shows the
    passage where the question goes and "This question stands on its own"
    where the passage goes;

    a bullet is a shape the alphabet did not know, written "?" or "·";

    an underline is a rule under the line, which reads as a minus sign at the
    end of every line it underlines — and a question about "the underlined
    sentence" is unanswerable without it.

This is the translation back. It is text in, text out, and touches only the
English bank's layout and the line breaks of both subjects: no word, number or
key is changed. A Reading and Writing question becomes a passage (the text, its
notes, its paired texts) and a stem (the question alone), in the house style
the diagnostic tests already use: paragraphs apart by a blank line, a heading
over its text, verse kept to its lines, notes as bullets.

    python3 tools/questionbank/tidy.py rows.json --out tidy.json
"""

from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass, field
from pathlib import Path

# A printed line at least this long ran to the margin, so the line after it
# carries on the same paragraph. The export's full lines are 122 to 158
# characters (99% of them); a paragraph's last line, and every line of verse,
# stops short of the margin.
FULL = 110

# A bullet as the decoder wrote it: a shape it did not know ("?") or a middle
# dot. Only ever at the start of a line, followed by a space.
BULLET = re.compile(r"^[?·•]\s+")

HEADING = re.compile(r"^Text [12]$")

# What a sentence ends with, for finding where the question starts: a full
# stop, a question or exclamation mark, a colon, a closing quote or bracket, or
# the blank a completion item leaves.
SENTENCE_END = re.compile(r"(?:[.?!:)\]]|[”\"’']|_{3,})$")

PICTURE_STEM = "This question is shown as a picture."


def join(a: str, b: str) -> str:
    """Two printed lines of one paragraph, as one."""
    a = a.rstrip()
    b = b.lstrip()
    # A word hyphenated at the margin keeps its hyphen and loses the break:
    # College Board only breaks a line at a hyphen the word already had.
    if re.search(r"[A-Za-z]-$", a) or a.endswith("—") or a.endswith("/"):
        return a + b
    return f"{a} {b}"


def reflow(text: str | None) -> str | None:
    """Running text with the page's line breaks taken out, its paragraphs kept.

    For an explanation, an option or a maths stem: a line that ran to the
    margin continues into the next, and a line that stopped short ends its
    paragraph, so an equation or a list set on its own line stays on it.
    """
    if text is None:
        return None
    lines = [l.rstrip() for l in text.split("\n")]
    out: list[str] = []
    cur: str | None = None
    for line in lines:
        if not line.strip():
            if cur is not None:
                out.append(cur)
                cur = None
            continue
        if cur is None:
            cur = line.strip()
        else:
            cur = join(cur, line)
        if len(line) < FULL:
            out.append(cur)
            cur = None
    if cur is not None:
        out.append(cur)
    return "\n".join(out)


@dataclass
class Passage:
    """A Reading and Writing question, taken apart."""

    passage: str | None
    stem: str
    underline: str | None = None
    # Why a part of it should be looked at by a person, if anything.
    notes: list[str] = field(default_factory=list)
    # The lines the decoder read off a figure, which belong to its picture.
    figure_lines: list[str] = field(default_factory=list)
    bullets: bool = False


# An underline is a rule under the words, which the decoder reads as a minus
# sign and sets after the last piece of printed text that starts before it: at
# the end of the line, or where the type changes mid-line — before a curly
# apostrophe, a dash or a quotation mark, which the export sets as separate
# runs. A real hyphen sits between two letters; a marker sits beside
# punctuation.
# "don- ’t" loses the space with the marker; "Jinshanzhuang--—" loses both.
_MARK_MID = re.compile(r"(?<=[A-Za-z0-9.,;:?!”’)])-+\s?(?=[’“”—])|(?<=\s)-(?=[“”’])")
# Beside punctuation, or a second minus after a real hyphen ("two--").
_MARK_END = re.compile(r"(?<=[.,;:?!”’)\]])-$|(?<=[A-Za-z]-)-$")
_HYPHEN_END = re.compile(r"(?<=[A-Za-z])-$")
# A rule beside a shape the alphabet did not know, where the type changes to
# italic for a title: "masterpiece --?-History of Mexico", "(--?Plebejus".
_DEBRIS = re.compile(r"-+\?-?(?=[A-Za-z])")


def _strip_underlines(lines: list[str], underlined: bool) -> tuple[list[str], list[int]]:
    """Take the underline rules out of the text, and say which lines had one.

    A marker beside punctuation is a rule wherever it is. A minus after a
    letter at the end of a line is either a rule or a word hyphenated at the
    margin. In a question about something underlined it is taken for a rule
    when it is next to a line already known to carry one — spreading along a
    run of such lines — or, where nothing marks the underline for certain,
    when it is the question's only run of them. Anywhere else it is left as
    the hyphen it reads as.
    """
    out: list[str] = []
    sure: set[int] = set()
    for i, line in enumerate(lines):
        cleaned = _MARK_END.sub("", _MARK_MID.sub("", _DEBRIS.sub("", line)))
        if cleaned != line:
            sure.add(i)
        out.append(cleaned)
    marked = set(sure)
    if not underlined:
        return out, sorted(marked)

    ends = {i for i, line in enumerate(out) if _HYPHEN_END.search(line)}
    if marked:
        grew = True
        while grew:
            grew = False
            for i in sorted(ends - marked):
                if (i - 1) in marked or (i + 1) in marked:
                    marked.add(i)
                    grew = True
    elif ends:
        run = sorted(ends)
        if run == list(range(run[0], run[-1] + 1)):
            marked.update(run)
    # A line already cleaned of a certain marker keeps what is left: in "two--"
    # the hyphen that remains is the word's own.
    for i in (marked - sure) & ends:
        out[i] = out[i][:-1]
    return out, sorted(marked)


# The question's first words. Scanned for from the end, so a passage line that
# happens to start with one is never taken for the question.
_OPENER = re.compile(
    r"^(Which|What|How|Why|Based on|According to|As used in|The student wants|It can most"
    r"|The text|In the text|Assuming|Information in|Taken together)\b"
)


def _question_start(lines: list[str]) -> int:
    """The index of the line the question begins on.

    The question is the last thing printed, and opens with one of a handful of
    phrases, so the last line that opens with one is where it starts. Failing
    that, walking back from the last line while the line before does not end a
    sentence finds where the final sentence starts. A Rhetorical Synthesis
    question opens with what the student wants, on a line before the question
    proper, and comes with it.
    """
    i = None
    for k in range(len(lines) - 1, max(-1, len(lines) - 5), -1):
        if _OPENER.match(lines[k]):
            i = k
            break
    if i is None:
        i = len(lines) - 1
        while i > 0 and not (
            SENTENCE_END.search(lines[i - 1].rstrip()) or lines[i - 1].startswith("©")
        ):
            i -= 1
    while i > 0 and lines[i - 1].startswith("The student wants"):
        i -= 1
    return i


def _passage_start(lines: list[str], q: int) -> int:
    """Where the passage begins, when a figure's labels come before it.

    A chart's title, its ticks and its labels read as short lines ahead of the
    passage. The passage is one paragraph of full lines ending in a shorter
    one, so walking back from the line before the question over full lines
    finds its first.
    """
    if q == 0:
        return 0
    i = q - 1
    while i > 0 and len(lines[i - 1]) >= FULL and "|" not in lines[i - 1] and "??" not in lines[i - 1]:
        i -= 1
    return i


def _blocks(lines: list[str]) -> tuple[str, bool]:
    """Passage lines as the passage the app stores.

    A heading ("Text 1") sits over its text with a single line break; notes
    become bullets, one to a line; verse keeps its lines; a paragraph runs on
    and is set apart from the next by a blank line.
    """
    units: list[tuple[str, str]] = []  # (kind, text): para | verse | bullet | heading
    cur: str | None = None
    cur_kind = "para"
    bullets = False

    def flush():
        nonlocal cur
        if cur is not None:
            units.append((cur_kind, cur))
            cur = None

    for line in lines:
        s = line.strip()
        if not s:
            flush()
            continue
        if HEADING.match(s):
            flush()
            units.append(("heading", s))
            continue
        m = BULLET.match(s)
        if m:
            flush()
            cur, cur_kind = "• " + s[m.end():].strip(), "bullet"
            bullets = True
        elif cur is None:
            cur, cur_kind = s, "para"
        else:
            cur = join(cur, s)
        if len(line) < FULL:
            # Stopped short of the margin: the end of a paragraph, a bullet or
            # a line of verse. Which of those is settled below.
            if cur_kind == "para" and cur == s:
                cur_kind = "line"
            flush()
    flush()

    out: list[str] = []
    prev = None
    for kind, text in units:
        if prev is None:
            out.append(text)
        elif prev == "heading":
            out.append("\n" + text)
        elif kind == "bullet" and prev == "bullet":
            out.append("\n" + text)
        elif kind == "line" and prev == "line":
            # Consecutive lines that each stopped short: verse, or a play's
            # lines. They stay as printed.
            out.append("\n" + text)
        else:
            out.append("\n\n" + text)
        prev = kind
    return "".join(out), bullets


# A sentence ends at a full stop, question or exclamation mark (and any
# closing quote or bracket after it) followed by a space and a capital, a
# quotation mark or a bracket. A decimal point has no space after it, and the
# abbreviations a passage uses before a name are not ends at all — an initial
# is, except "I", which is a word. An attribution line (©) starts afresh.
_END = re.compile(r"[.?!]+[”\"’)\]]*(?=\s+[A-Z“\"‘(\[©])|\n")
_ABBREV = re.compile(r"(?:\b(?:Mr|Mrs|Ms|Dr|St|Jr|Sr|Mt|vs|etc|No|Vol|Fig|ca)|\b[A-HJ-Z])\.$")


def _sentences(text: str) -> list[tuple[int, int]]:
    """Sentence spans of a paragraph, as (start, end) offsets."""
    spans: list[tuple[int, int]] = []
    start = 0
    while start < len(text) and text[start].isspace():
        start += 1
    for m in _END.finditer(text):
        if _ABBREV.search(text[: m.start() + 1]):
            continue
        spans.append((start, m.end()))
        start = m.end()
        while start < len(text) and text[start].isspace():
            start += 1
    if start < len(text):
        spans.append((start, len(text)))
    return spans


def _underlined_sentence(lines: list[str], marked: list[int], start: int) -> str | None:
    """The one sentence the marked lines underline, when only one fits.

    The rule says which printed lines are underlined, not where on the first
    and last of them it starts and stops. A sentence that begins on the first
    marked line and ends on the last, and touches no other, is the underlined
    sentence; when no sentence or more than one fits, nothing is underlined
    rather than the wrong words.
    """
    if not marked:
        return None
    first, last = marked[0], marked[-1]
    if marked != list(range(first, last + 1)):
        return None
    # The passage's lines joined as reflow joins them, with each line's span.
    text = ""
    spans: dict[int, tuple[int, int]] = {}
    for i in range(start, len(lines)):
        line = lines[i].strip()
        if not line:
            continue
        if HEADING.match(line):
            # "Text 1" is a heading, not the start of its first sentence.
            text += "\n"
            continue
        text = join(text, line) if text and not text.endswith("\n") else text + line
        spans[i] = (len(text) - len(line), len(text))
    if first not in spans or last not in spans:
        return None
    # Starts on the first underlined line and ends on the last one.
    fits = [
        (s, e)
        for s, e in _sentences(text)
        if spans[first][0] <= s < spans[first][1] and spans[last][0] < e <= spans[last][1]
    ]
    if len(fits) != 1:
        return None
    s, e = fits[0]
    return text[s:e].strip()


def english(stem: str, has_figure_rubble: bool = False) -> Passage:
    """A Reading and Writing stem as the passage and the question."""
    # The export maps the ʻokina of "Hawaiʻi" and "ʻāina" to nothing, which the
    # import wrote as a NUL — and psql cut the line short there (0079).
    stem = stem.replace("\x00", "ʻ")
    lines = [l.rstrip() for l in stem.split("\n") if l.strip()]
    lower = stem.lower()
    asks_underlined = "underlined" in lower
    lines, marked = _strip_underlines(lines, asks_underlined)

    q = _question_start(lines)
    question = reflow("\n".join(lines[q:])) or ""
    question = re.sub(r"\s*\n\s*", " ", question).strip()

    notes: list[str] = []
    if not _OPENER.match(question):
        notes.append(f"question opens oddly: {question[:60]!r}")

    start = _passage_start(lines, q) if has_figure_rubble else 0
    figure_lines = lines[:start]
    body = lines[start:q]
    passage, bullets = _blocks(body) if body else ("", False)

    underline = None
    if asks_underlined:
        # Only "the underlined sentence" is a whole sentence by definition; a
        # portion, a claim or a phrase can stop anywhere, and its ends are
        # exactly what the rule did not keep.
        if re.search(r"underlined\s+sentence\b", lower):
            underline = _underlined_sentence(lines[:q], [m for m in marked if m < q], start)
        if underline is None:
            notes.append("underline not recovered")
        elif underline not in passage:
            notes.append("underline not found in the passage")
            underline = None

    return Passage(
        passage=passage or None,
        stem=question,
        underline=underline,
        notes=notes,
        figure_lines=figure_lines,
        bullets=bullets,
    )


def is_rubble(stem: str) -> bool:
    """A stem the decoder could not read (make_migration.py's test, 0085)."""
    return "??" in stem or stem.count("|") > 4


# Five English questions whose picture is not a figure at all but a sliver of
# one printed line: the decoder could not read the rule under an underlined
# word, so it cut a picture of the line. The words are all in the text; what
# the sliver adds is where the underline runs, read off it by eye here.
OVERRIDES: dict[str, dict] = {
    # Words in Context: the underline is the word the question names.
    "CB-aa7ae735": {"image_url": None, "underline_word": "reaching"},
    "CB-c2c26e20": {"image_url": None, "underline_word": "suggestion"},
    "CB-213248f7": {"image_url": None, "underline_word": "simply"},
    # "the underlined claim": the sentence the sliver shows underlined from
    # "In his 1950 masterpiece", ending where the next sentence begins.
    "CB-378c66d5": {"image_url": None, "underline": (
        "In his 1950 masterpiece History of Mexico, Medellín fuses these influences into a style so "
        "idiosyncratic that it resists efforts to view his work through the lens of nationality or "
        "cultural identity.")},
    # "the underlined portion": the sliver underlines this line's sentence,
    # up to its colon, and nothing on the line after it carries the rule.
    "CB-590f0ad2": {"image_url": None, "underline": "Consider the silver-studded blue butterfly (Plebejus argus)"},
}

# Where a figure cut out of a whole-question picture is served from: the
# app's own public folder, as the diagnostic tests' figures are (0041).
FIGURE_URL = "/question-figures/cb/{ref}.png"


def tidy(r: dict, figures: Path | None = None) -> dict:
    """One row of the bank, put into the shape the app shows."""
    t = dict(r)
    ref = r["source_ref"]
    if r["subject"] == "english":
        whole = bool(r.get("image_url")) and is_rubble(r["stem"])
        p = english(r["stem"], has_figure_rubble=whole)
        t.update(passage=p.passage, stem=p.stem, passage_underline=p.underline,
                 tidy_notes=p.notes, figure_lines=p.figure_lines)
        # Notes are words, not a figure: the picture of them goes.
        if p.bullets and r.get("skill") == "rhetorical_synthesis":
            t["image_url"] = None
        if whole:
            # The chart or table alone, cut out of the picture of the whole
            # question (figures.py); until it is cut, nothing changes.
            if figures is not None and (figures / f"{ref}.png").exists():
                t["image_url"] = FIGURE_URL.format(ref=ref)
            else:
                t["tidy_notes"] = p.notes + ["figure not cut yet"]
        o = OVERRIDES.get(ref)
        if o:
            t["image_url"] = o["image_url"]
            word = o.get("underline_word")
            if word and t["passage"] and t["passage"].count(word) == 1:
                t["passage_underline"] = word
            elif o.get("underline") and o["underline"] in (t["passage"] or ""):
                t["passage_underline"] = o["underline"]
            t["tidy_notes"] = [n for n in t["tidy_notes"] if n != "underline not recovered"]
            if not t.get("passage_underline"):
                t["tidy_notes"].append("override underline not found")
    else:
        t["stem"] = reflow(r["stem"])
    t["options"] = [dict(o, body=reflow(o["body"]) or "") for o in (r.get("options") or [])] or r.get("options")
    t["explanation"] = reflow(r.get("explanation"))
    return t


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("rows", type=Path, help="rows as from_migrations.py writes them")
    ap.add_argument("--figures", type=Path, default=None,
                    help="the folder figures.py cut the charts and tables into")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()

    rows = json.loads(args.rows.read_text())
    out = [tidy(r, args.figures) for r in rows]
    args.out.write_text(json.dumps(out, ensure_ascii=False, indent=1))
    print(f"{len(out)} questions -> {args.out}")


if __name__ == "__main__":
    main()
