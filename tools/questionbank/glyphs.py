"""
Read the character a drawn shape stands for.

The export draws each mathematical character as a vector path, so the shapes
have to be recognised rather than read. They are not handwriting, though: the
same character is drawn by the same renderer every time, so the shapes fall
into a small, exact alphabet. 203,545 drawn shapes across the maths export fall
into 927 clusters, and 186 of those — labelled once, by eye, from contact
sheets — account for 96.9% of them.

glyphs.npz holds that alphabet: a 16x16 ink picture of each cluster and the
character it is. A shape is read by rasterising it the same way and taking the
nearest cluster, which is how it was clustered in the first place.

A shape no cluster is near enough to, and a shape in a cluster nobody labelled,
are both reported as unknown rather than guessed at. Unlabelled clusters are
mostly not characters at all — the rings, bars and shaded cells a chart is
drawn from — so a question full of them is a question with a chart in it, and
the caller shows a picture of it instead.
"""

from __future__ import annotations

from pathlib import Path

import numpy as np
from PIL import Image

# The resolution the alphabet was built at. Inference has to match it: the same
# shape rasterised at another size lands a little further from its cluster.
DPI = 200
SCALE = DPI / 72.0

# How far a shape may sit from a cluster and still be read as it. Set from the
# clustering that produced the alphabet.
NEAR = 0.45

_MODEL: dict | None = None


def _model() -> dict:
    global _MODEL
    if _MODEL is None:
        z = np.load(Path(__file__).with_name("glyphs.npz"), allow_pickle=True)
        _MODEL = {
            "cents": z["cents"].astype(np.float32),
            "labels": list(z["labels"]),
            "aspect": z["aspect"],
        }
    return _MODEL


def aspect_band(width: float, height: float) -> int:
    """Rules, wide shapes and ordinary glyphs are never each other.

    A fraction bar and a letter cannot be told apart once both are squashed
    into a 16x16 box, so they are never compared: the band is part of the key.
    """
    a = width / max(height, 1e-6)
    return 0 if a > 6 else (1 if a > 2.2 else 2)


def picture(page_gray: np.ndarray, rect, width: int, height: int) -> np.ndarray | None:
    """One shape as the 16x16 unit vector the alphabet is built from."""
    x0, y0, x1, y1 = (int(round(v * SCALE)) for v in (rect.x0, rect.y0, rect.x1, rect.y1))
    x0 = max(0, x0 - 1)
    y0 = max(0, y0 - 1)
    x1 = min(width, x1 + 1)
    y1 = min(height, y1 + 1)
    if x1 <= x0 or y1 <= y0:
        return None
    crop = page_gray[y0:y1, x0:x1]
    if crop.size == 0:
        return None
    im = Image.fromarray(crop.astype(np.uint8)).resize((16, 16), Image.LANCZOS)
    a = 255.0 - np.asarray(im, dtype=np.float32)
    if a.max() <= 0:
        return None
    v = (a / a.max()).flatten()
    n = float(np.linalg.norm(v))
    if n < 1e-6:
        return None
    return v / n


def read(vec: np.ndarray, band: int) -> tuple[str, bool]:
    """The character for a shape, and whether it was read confidently.

    Returns ("", True) for a shape that is not in the alphabet — unknown — and
    (char, False) for one that is.
    """
    m = _model()
    same = np.where(m["aspect"] == band)[0]
    if len(same) == 0:
        return "", True
    d = np.linalg.norm(m["cents"][same] - vec, axis=1)
    j = int(d.argmin())
    if d[j] >= NEAR:
        return "", True
    label = m["labels"][same[j]]
    if not label:
        return "", True
    return label, False
