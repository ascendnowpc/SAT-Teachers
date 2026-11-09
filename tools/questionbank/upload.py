"""
Put the question pictures into the question-images bucket.

    SUPABASE_URL=https://<project>.supabase.co \
    SUPABASE_SERVICE_KEY=<service role key> \
    python3 tools/questionbank/upload.py --pictures ./pictures

The bucket is the one 0020 made, and it is public to read and teacher-only to
write — so this uploads with the service role key rather than a signed-in
session, the same way a migration writes rather than a teacher.

Each file is stored under its own name, which is the question's source_ref
(CB-ac472881.png). That is what the import migrations point at, so uploading
the same picture twice replaces it rather than making a second one, and a
picture can be re-cut and re-uploaded without touching the database.

Run it before the import migrations, so that no question is published with a
picture that is not there yet.
"""

from __future__ import annotations

import argparse
import os
import sys
import urllib.error
import urllib.request
from pathlib import Path

BUCKET = "question-images"


def put(base: str, key: str, path: Path) -> tuple[bool, str]:
    url = f"{base.rstrip('/')}/storage/v1/object/{BUCKET}/{path.name}"
    request = urllib.request.Request(
        url,
        data=path.read_bytes(),
        method="POST",
        headers={
            "Authorization": f"Bearer {key}",
            "apikey": key,
            "Content-Type": "image/png",
            "Cache-Control": "public, max-age=31536000, immutable",
            # Replace rather than refuse, so a re-cut picture can be sent again.
            "x-upsert": "true",
        },
    )
    try:
        with urllib.request.urlopen(request, timeout=60) as r:
            return 200 <= r.status < 300, str(r.status)
    except urllib.error.HTTPError as e:
        return False, f"{e.code} {e.read()[:160].decode('utf-8', 'replace')}"
    except Exception as e:  # noqa: BLE001 — the name of whatever went wrong is the message
        return False, str(e)


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--pictures", type=Path, required=True)
    ap.add_argument("--limit", type=int, default=0, help="stop after N, for a look")
    args = ap.parse_args()

    base = os.environ.get("SUPABASE_URL", "").strip()
    key = os.environ.get("SUPABASE_SERVICE_KEY", "").strip()
    if not base or not key:
        sys.exit("set SUPABASE_URL and SUPABASE_SERVICE_KEY")

    files = sorted(args.pictures.glob("*.png"))
    if args.limit:
        files = files[: args.limit]
    if not files:
        sys.exit(f"no pictures in {args.pictures}")

    sent = 0
    failed: list[tuple[str, str]] = []
    for n, path in enumerate(files, 1):
        ok, why = put(base, key, path)
        if ok:
            sent += 1
        else:
            failed.append((path.name, why))
        if n % 100 == 0:
            print(f"  {n}/{len(files)}", flush=True)

    print(f"{sent} of {len(files)} uploaded to {BUCKET}")
    for name, why in failed[:10]:
        print(f"  failed {name}: {why}")
    if len(failed) > 10:
        print(f"  ... and {len(failed) - 10} more")
    if failed:
        sys.exit(1)


if __name__ == "__main__":
    main()
