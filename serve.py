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
SOURCES = ["course.typ", "site.typ", "lib", "assets", "build.py"]


def newest_source() -> float:
    latest = 0.0
    for name in SOURCES:
        p = HERE / name
        paths = p.rglob("*") if p.is_dir() else [p]
        for f in paths:
            if f.is_file():
                latest = max(latest, f.stat().st_mtime)
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
