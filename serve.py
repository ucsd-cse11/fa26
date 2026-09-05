#!/usr/bin/env python3
"""Serve site/ on :8003, rebuilding when a source file is newer than the build.

The rebuild is lazy — checked per request rather than by a polling thread —
so editing course.typ or site.css and hitting reload is the whole loop.
Reachable at https://ships-cook.exe.xyz:8003/ (exe.dev login required;
only the primary port can be public).
"""
import subprocess
import sys
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path

HERE = Path(__file__).resolve().parent
SITE = HERE / "site"
PORT = 8003
DEPS = HERE / ".deps.json"
# Used only before the first build has reported its dependencies.
FALLBACK = ["*.typ", "lib/*.typ", "assets/*"]


def sources():
    """Every file the last build actually read, per typst's own --deps.

    Asking typst beats maintaining a list here: a new chapter, a new
    import, or an #asset read is picked up without touching this file.
    """
    if DEPS.exists():
        import json
        inputs = json.loads(DEPS.read_text()).get("inputs", [])
        paths = [HERE / p for p in inputs]
    else:
        paths = [f for pat in FALLBACK for f in HERE.glob(pat)]
    return paths + [HERE / "build.py"]


def newest_source() -> float:
    latest = 0.0
    for f in sources():
        if f.is_file():
            latest = max(latest, f.stat().st_mtime)
        else:
            return float("inf")  # a listed input vanished: force a rebuild
    return latest


def built() -> float:
    index = SITE / "index.html"
    return index.stat().st_mtime if index.exists() else 0.0


def rebuild_if_stale():
    if newest_source() <= built():
        return
    r = subprocess.run([sys.executable, str(HERE / "build.py")],
                       cwd=HERE, capture_output=True, text=True)
    sys.stderr.write(r.stderr)
    if r.returncode == 0:
        sys.stderr.write("rebuilt\n")


class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(SITE), **kwargs)

    def send_head(self):
        rebuild_if_stale()
        return super().send_head()

    def log_message(self, fmt, *args):
        pass


if __name__ == "__main__":
    rebuild_if_stale()
    print(f"serving {SITE} on :{PORT}")
    ThreadingHTTPServer(("0.0.0.0", PORT), Handler).serve_forever()
