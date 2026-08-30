#!/usr/bin/env python3
"""
Extract SAT question screenshots from an Ascend Now practice-test PDF.

The source documents are Google Docs full of Bluebook screenshots pasted three
to a page, with no machine-readable text. This pulls each embedded image out as
a separate file and emits a manifest that the Phase 1 import UI consumes: an
admin confirms each crop and tags domain / skill / difficulty / answer key.

Usage:
    python3 tools/pdf_extract.py INPUT.pdf --out ./extracted [--dpi 200]

Outputs:
    <out>/pages/p01.png        full page renders, for visual QA of the split
    <out>/items/item-001.png   one image per question
    <out>/manifest.json        one record per item, ready for import

Requires: pymupdf
"""
from __future__ import annotations

import argparse
import json
from pathlib import Path

import pymupdf


def extract(pdf_path: Path, out_dir: Path, dpi: int = 200) -> dict:
    doc = pymupdf.open(pdf_path)
    (out_dir / "pages").mkdir(parents=True, exist_ok=True)
    (out_dir / "items").mkdir(parents=True, exist_ok=True)

    items: list[dict] = []
    # Section headings ("Module 1", "Module 2") are the only real text in these
    # files; they mark which module the following items belong to.
    current_section = None
    seq = 0

    for page_no in range(doc.page_count):
        page = doc[page_no]

        page.get_pixmap(dpi=dpi).save(out_dir / "pages" / f"p{page_no + 1:02d}.png")

        text = page.get_text().strip()
        infos = page.get_image_info(xrefs=True)

        if text and not infos:
            current_section = text.splitlines()[0].strip()
            continue

        # Top-to-bottom so sequence numbers match reading order.
        for info in sorted(infos, key=lambda i: i["bbox"][1]):
            seq += 1
            name = f"item-{seq:03d}.png"
            pix = pymupdf.Pixmap(doc, info["xref"])
            if pix.n - pix.alpha >= 4:  # CMYK -> RGB
                pix = pymupdf.Pixmap(pymupdf.csRGB, pix)
            pix.save(out_dir / "items" / name)

            items.append(
                {
                    "sequence": seq,
                    "file": f"items/{name}",
                    "source_page": page_no + 1,
                    "section": current_section,
                    "width": info["width"],
                    "height": info["height"],
                    # Filled in by a human during import. A question is not
                    # usable in a live session until difficulty and the answer
                    # key are present, so these start explicitly null rather
                    # than guessed.
                    "domain": None,
                    "skill": None,
                    "difficulty": None,
                    "difficulty_rationale": None,
                    "correct_option": None,
                    "target_seconds": None,
                }
            )

    manifest = {
        "source_file": pdf_path.name,
        "page_count": doc.page_count,
        "item_count": len(items),
        "render_mode": "image",
        "status": "needs_key",
        "items": items,
    }
    (out_dir / "manifest.json").write_text(json.dumps(manifest, indent=2))
    return manifest


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("pdf", type=Path)
    ap.add_argument("--out", type=Path, default=Path("./extracted"))
    ap.add_argument("--dpi", type=int, default=200)
    args = ap.parse_args()

    m = extract(args.pdf, args.out, args.dpi)
    print(f"{m['item_count']} items from {m['page_count']} pages -> {args.out}")
    sections = {i["section"] for i in m["items"]}
    for s in sorted(sections, key=lambda x: (x is None, x)):
        n = sum(1 for i in m["items"] if i["section"] == s)
        print(f"  {s or '(no section)'}: {n} items")


if __name__ == "__main__":
    main()
