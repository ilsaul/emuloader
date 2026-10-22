#!/usr/bin/env python3
"""Regenerate dist_template/docs/changelog.htm from CHANGELOG.md.

Versions newer than LAST_MANUAL_VERSION are written between the BEGIN/END
markers in changelog.htm; the hand-written entries below them (8.9.4 and
older, from Ciro's 8.9.4 package) are left untouched. The page uses CRLF line
endings and the page_styles.css layout (inner_box/contents_title/contents_text). The script is idempotent:

    python3 tools/changelog_to_htm.py
"""
import datetime
import html
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CHANGELOG = ROOT / "CHANGELOG.md"
HTM = ROOT / "dist_template" / "docs" / "changelog.htm"
LAST_MANUAL_VERSION = "8.9.4"
BEGIN = "<!-- BEGIN generated from CHANGELOG.md by tools/changelog_to_htm.py: do not edit -->"
END = "<!-- END generated from CHANGELOG.md -->"

VERSION_RE = re.compile(r"^## \[([^\]]+)\]\s*-\s*(\S+)")
SECTION_RE = re.compile(r"^### (.+)")
BULLET_RE = re.compile(r"^( *)- (.*)")


def inline(text):
    text = html.escape(text, quote=False)
    text = re.sub(r"\*\*(.+?)\*\*", r"<b>\1</b>", text)
    text = re.sub(r"`([^`]+)`", r"<code>\1</code>", text)
    text = re.sub(r"&lt;(https?://[^\s&]+)&gt;", r"\1", text)
    text = re.sub(r"(https?://[^\s<)]+[^\s<).,;])", r'<a href="\1">\1</a>', text)
    return text


def format_date(value):
    try:
        return datetime.date.fromisoformat(value).strftime("%B %d, %Y")
    except ValueError:
        return value


def parse(markdown):
    versions = []
    for line in markdown.splitlines():
        m = VERSION_RE.match(line)
        if m:
            if m.group(1) == LAST_MANUAL_VERSION:
                break
            versions.append({"version": m.group(1), "date": format_date(m.group(2)),
                             "intro": [], "sections": []})
            continue
        if not versions or not line.strip():
            continue
        current = versions[-1]
        m = SECTION_RE.match(line)
        if m:
            current["sections"].append((m.group(1).strip(), []))
            continue
        m = BULLET_RE.match(line)
        if m and current["sections"]:
            level = len(m.group(1)) // 2
            items = current["sections"][-1][1]
            if level == 0 or not items:
                items.append([inline(m.group(2))])
            else:
                items[-1].append("&nbsp;&nbsp;" * (level - 1) + "- " + inline(m.group(2)))
            continue
        if not current["sections"]:
            current["intro"].append(inline(line.strip()))
            continue
        sys.exit(f"Unsupported line in CHANGELOG.md: {line!r}")
    return versions


def render(versions):
    out = [BEGIN]
    for v in versions:
        out.append('      <div id="inner_box">')
        out.append(f'      <div id="contents_title">Version {v["version"]} Change Log - {v["date"]}</div>')
        out.append('      <div id="contents_text">')
        if v["intro"]:
            out.append(f'         <p>{" ".join(v["intro"])}</p>')
        for title, items in v["sections"]:
            out.append(f"         <h2>{html.escape(title)}</h2>")
            for item in items:
                out.append("            <h3>" + "<br/>\r\n                ".join(item) + "</h3>")
        out.append("      </div>")
        out.append('      <div class="TRON2"></div>')
        out.append("      </div>")
        out.append("      <br/>")
    out.append("      " + END)
    return "\r\n".join(out) + "\r\n"


def main():
    versions = parse(CHANGELOG.read_text(encoding="utf-8"))
    block = render(versions)
    page = HTM.read_bytes().decode("latin-1")
    if BEGIN in page:
        start = page.index(BEGIN)
        end = page.index(END) + len(END) + 2
        page = page[:start] + block + page[end:]
    else:
        # Skip Ciro's commented template block ("October ??") at the top.
        anchor = re.compile(r'^[ \t]*<div id="inner_box">\r\n[ \t]*<div id="contents_title">Version '
                            + re.escape(LAST_MANUAL_VERSION) + r' Change Log - [A-Z][a-z]+ \d', re.M)
        m = anchor.search(page)
        if not m:
            sys.exit("Insertion point not found in changelog.htm")
        start = m.start()
        page = page[:start] + "      " + block + page[start:]
    HTM.write_bytes(page.encode("latin-1", "xmlcharrefreplace"))
    print(f"{HTM.relative_to(ROOT)}: {len(versions)} versions generated "
          f"({versions[0]['version']} .. {versions[-1]['version']})")


if __name__ == "__main__":
    main()
