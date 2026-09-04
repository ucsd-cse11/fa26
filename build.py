#!/usr/bin/env python3
"""Build site/ from site.typ.

Typst does everything except one thing: html.elem("link"/"script"/"meta")
lands in <body>, because 0.15 exposes no way to write into <head>. This
script hoists those, and that is the whole reason it exists. If a later
Typst gains head control, delete this file and call typst directly.
"""
import re
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
SITE = HERE / "site"
# <link> and <meta> are void; <script> and <style> carry a closing tag.
HOIST = re.compile(r"<(?:link|meta)\b[^>]*>|<(script|style)\b[^>]*>.*?</\1>", re.S)


def hoist_head(html: str) -> str:
    body = html.split("<body>", 1)
    if len(body) != 2:
        return html
    moved = []

    def take(m):
        moved.append(m.group(0))
        return ""

    body[1] = HOIST.sub(take, body[1])
    if not moved:
        return html
    return body[0].replace("</head>", "".join(moved) + "</head>", 1) + "<body>" + body[1]


def main():
    r = subprocess.run(
        ["typst", "compile", "--features", "html,bundle", "-f", "bundle",
         str(HERE / "site.typ"), str(SITE)],
        cwd=HERE, capture_output=True, text=True)
    sys.stderr.write(r.stderr)
    if r.returncode != 0:
        return r.returncode
    for page in SITE.rglob("*.html"):
        page.write_text(hoist_head(page.read_text()))
    return 0


if __name__ == "__main__":
    sys.exit(main())
