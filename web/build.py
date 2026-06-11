# /// script
# dependencies = ["beautifulsoup4", "pagefind[extended]"]
# ///
"""
Build the HTML site for the multivariable calculus notes.

Usage:
    uv run web/build.py
    uv run web/build.py --skip-pdf
    uv run web/build.py --skip-compile
"""

import argparse
import json
import posixpath
import re
import shutil
import subprocess
import sys
from pathlib import Path, PurePosixPath
from typing import Any, Dict, List, Optional, Tuple, cast

try:
    from bs4 import BeautifulSoup, Tag
except ImportError:
    print("Error: beautifulsoup4 required. Run with: uv run web/build.py")
    sys.exit(1)

ROOT = Path(__file__).resolve().parent.parent
WEB_DIR = ROOT / "web"
DIST_DIR = WEB_DIR / "dist"
ASSETS_SRC = WEB_DIR / "assets"

LANG = "en"
SITE_TITLE = "Multivariable Calculus"
GITHUB_URL = "https://github.com/yunfeix2009/multi-var-notes-ocw"
BASE_URL = "/"
HEADING_TAGS = {"h2", "h3", "h4", "h5", "h6"}
TOC_MIN_LEVEL = 2

ICON_HAMBURGER = (
    '<svg width="20" height="20" viewBox="0 0 20 20" fill="none"'
    ' stroke="currentColor" stroke-width="2">'
    '<path d="M3 5h14M3 10h14M3 15h14"/></svg>'
)
ICON_SEARCH = (
    '<svg width="18" height="18" viewBox="0 0 24 24" fill="none"'
    ' stroke="currentColor" stroke-width="2">'
    '<circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>'
)
ICON_GITHUB = (
    '<svg width="20" height="20" viewBox="0 0 16 16" fill="currentColor">'
    '<path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17'
    ".55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94"
    "-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87"
    " 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59"
    ".82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27"
    "s1.36.09 2 .27c1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82"
    " 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01"
    ' 1.93-.01 2.2 0 .21.15.46.55.38A8.01 8.01 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>'
    "</svg>"
)
ICON_TOC = (
    '<svg width="20" height="20" viewBox="0 0 20 20" fill="none"'
    ' stroke="currentColor" stroke-width="2">'
    '<path d="M3 4h14M3 8h10M3 12h12M3 16h8"/></svg>'
)
ICON_THEME_LIGHT = (
    '<svg viewBox="0 0 512 512" width="18" height="18" aria-hidden="true" fill="currentColor">'
    '<path d="M361.5 1.2c5 2.1 8.6 6.6 9.6 11.9L391 121l107.9 19.8c5.3 1 9.8 4.6 11.9 9.6'
    "s1.5 10.7-1.6 15.2L446.9 256l62.3 90.3c3.1 4.5 3.7 10.2 1.6 15.2s-6.6 8.6-11.9 9.6"
    "L391 391 371.1 498.9c-1 5.3-4.6 9.8-9.6 11.9s-10.7 1.5-15.2-1.6L256 446.9l-90.3 62.3"
    "c-4.5 3.1-10.2 3.7-15.2 1.6s-8.6-6.6-9.6-11.9L121 391 13.1 371.1c-5.3-1-9.8-4.6-11.9"
    "-9.6s-1.5-10.7 1.6-15.2L65.1 256 2.8 165.7c-3.1-4.5-3.7-10.2-1.6-15.2s6.6-8.6 11.9-9.6"
    "L121 121 140.9 13.1c1-5.3 4.6-9.8 9.6-11.9s10.7-1.5 15.2 1.6L256 65.1 346.3 2.8"
    'c4.5-3.1 10.2-3.7 15.2-1.6zM160 256a96 96 0 1 1 192 0 96 96 0 1 1 -192 0z'
    "m224 0a128 128 0 1 0 -256 0 128 128 0 1 0 256 0z\"/></svg>"
)


def heading_level(tag: Tag) -> int:
    return int(tag.name[1])


def ensure_anchor_id(node: Tag, fallback_text: str) -> str:
    node_id = node.get("id", "")
    if node_id:
        return node_id
    slug = re.sub(r"[^\w-]", "-", fallback_text.lower())[:60].strip("-") or "section"
    node["id"] = slug
    return slug


def clean_title_text(text: str) -> str:
    text = " ".join(text.split())
    text = re.sub(r"^\d+(?:\.\d+)*\s+", "", text)
    text = re.sub(r"^[A-Z](?:\.\d+)*\s+", "", text)
    return text.strip()


def clean_title_html(heading: Tag) -> str:
    cloned = BeautifulSoup(str(heading), "html.parser").find(heading.name)
    if cloned is None:
        return ""
    first_text = cloned.find(string=True)
    if first_text is not None:
        cleaned = re.sub(r"^\s*\d+(?:\.\d+)*\s+", "", str(first_text))
        cleaned = re.sub(r"^\s*[A-Z](?:\.\d+)*\s+", "", cleaned)
        first_text.replace_with(cleaned)
    return cloned.decode_contents().strip()


def heading_inner_html(heading: Tag) -> str:
    cloned = BeautifulSoup(str(heading), "html.parser").find(heading.name)
    return cloned.decode_contents().strip() if cloned else ""


def section_filename(section_id: str) -> str:
    return "index.html" if section_id == "cover" else f"{section_id}/index.html"


def relative_href(current_file: str, target_file: str, anchor: Optional[str] = None) -> str:
    current_dir = PurePosixPath(current_file).parent.as_posix()
    rel = posixpath.relpath(target_file, current_dir if current_dir != "." else ".")
    if rel == "index.html":
        rel = "./"
    elif rel.endswith("/index.html"):
        rel = rel[: -len("index.html")]
    return f"{rel}#{anchor}" if anchor else rel


def asset_href(current_file: str, asset_path: str) -> str:
    current_dir = (PurePosixPath(LANG) / PurePosixPath(current_file)).parent.as_posix()
    return posixpath.relpath(asset_path, current_dir if current_dir != "." else ".")


def theorem_toc_entry(theorem_box: Tag, section: Tag, level: int) -> Optional[dict]:
    classes = theorem_box.get("class", [])
    if "thm-box" not in classes or "thm-remark" in classes:
        return None

    head = theorem_box.find("p", class_="thm-head")
    if head is None:
        return None

    text = " ".join(head.get_text(" ", strip=True).split())
    if not text:
        return None

    anchor = theorem_box
    while isinstance(anchor.parent, Tag) and anchor.parent is not section and not anchor.get("id"):
        anchor = anchor.parent
    anchor_id = ensure_anchor_id(anchor, text)

    return {
        "level": level,
        "kind": "theorem",
        "id": anchor_id,
        "text": text,
        "html": head.decode_contents().strip(),
    }


def compile_typst() -> Path:
    full_html = DIST_DIR / "full-en.html"
    DIST_DIR.mkdir(parents=True, exist_ok=True)
    cmd = [
        "typst", "compile",
        "--features", "html",
        "--format", "html",
        "--package-path", str(ROOT / "packages"),
        "--input", "html=true",
        str(ROOT / "main.typ"),
        str(full_html),
    ]
    print(f"  Compiling HTML: {' '.join(cmd[-3:])}")
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        sys.stderr.write(result.stderr)
        sys.exit(1)
    print(f"    -> {full_html.name}")
    return full_html


def compile_pdf() -> None:
    pdf_dir = DIST_DIR / "pdf"
    pdf_dir.mkdir(parents=True, exist_ok=True)
    out = pdf_dir / "multi-var-notes.pdf"
    cmd = [
        "typst", "compile",
        "--features", "html",
        "--package-path", str(ROOT / "packages"),
        str(ROOT / "main.typ"),
        str(out),
    ]
    print("  Compiling PDF...")
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        sys.stderr.write(result.stderr)
        print("  WARNING: PDF compilation failed", file=sys.stderr)
        return
    print(f"    -> pdf/{out.name}")


def extract_local_toc(section: Tag) -> list[dict]:
    toc: list[dict] = []
    current_heading_level = TOC_MIN_LEVEL
    for node in section.descendants:
        if not isinstance(node, Tag):
            continue
        if node.name in HEADING_TAGS:
            lvl = heading_level(node)
            heading_id = ensure_anchor_id(node, node.get_text(strip=True))
            current_heading_level = lvl
            toc.append({
                "level": lvl,
                "kind": "heading",
                "id": heading_id,
                "text": node.get_text(strip=True),
                "html": heading_inner_html(node),
            })
            continue

        entry = theorem_toc_entry(node, section, level=current_heading_level + 1)
        if entry is not None:
            toc.append(entry)
    return toc


def discover_structure(
    soup: BeautifulSoup,
) -> Tuple[List[Tuple[str, str, str]], List[Dict[str, Any]], Dict[str, int]]:
    pages: List[Tuple[str, str, str]] = []
    nav_items: List[Dict[str, Any]] = []
    nav_depths: Dict[str, int] = {}

    for section in soup.find_all("section", class_="chapter"):
        sid = section.get("id", "")
        if not sid:
            continue

        title_heading = section.find(["h1", "h2", "h3", "h4", "h5", "h6"], recursive=False)
        if title_heading is not None:
            depth = max(0, heading_level(title_heading) - 1)
        else:
            depth = len(section.find_parents("section", class_="chapter"))

        page_title = (
            clean_title_text(title_heading.get_text(" ", strip=True))
            if title_heading
            else sid.replace("-", " ").title()
        )
        nav_title_html = clean_title_html(title_heading) if title_heading else page_title

        if sid == "cover":
            page_title = "Home"
            nav_title_html = "Home"

        filename = section_filename(sid)
        pages.append((sid, filename, page_title))
        nav_items.append({
            "id": sid,
            "filename": filename,
            "title": page_title,
            "html": nav_title_html,
            "depth": depth,
        })
        nav_depths[sid] = depth

    return pages, nav_items, nav_depths


def build_nav_tree(nav_items: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    roots: List[Dict[str, Any]] = []
    stack: List[Dict[str, Any]] = []

    for item in nav_items:
        node: Dict[str, Any] = {
            "id": item["id"],
            "filename": item["filename"],
            "title": item["title"],
            "html": item["html"],
            "depth": item["depth"],
            "children": [],
        }

        while stack and int(stack[-1]["depth"]) >= int(node["depth"]):
            stack.pop()

        if stack:
            cast(List[Dict[str, Any]], stack[-1]["children"]).append(node)
        else:
            roots.append(node)

        stack.append(node)

    return roots


def build_global_nav(
    nav_items: List[Dict[str, Any]],
    current_id: str,
    current_file: str,
) -> str:
    tree = build_nav_tree(nav_items)
    lines = ['<nav class="global-nav" aria-label="Global navigation">']

    def render_nodes(nodes: List[Dict[str, Any]], level: int) -> None:
        indent = "  " * (level + 1)
        lines.append(f"{indent}<ul>")
        for node in nodes:
            sid = cast(str, node["id"])
            filename = cast(str, node["filename"])
            nav_title_html = cast(str, node["html"])
            depth = int(cast(int, node["depth"]))
            children = cast(List[Dict[str, Any]], node["children"])

            classes = [f"nav-depth-{depth}"]
            if depth > 0:
                classes.append("nav-sub")
            if sid == current_id:
                classes.append("active")
            if children:
                classes.append("has-children")
            cls = f' class="{" ".join(classes)}"'

            href = relative_href(current_file, filename)
            lines.append(f"{indent}  <li{cls}>")
            if children:
                group_id = f"nav-group-{sid}"
                lines.append(f"{indent}    <div class=\"nav-item-row\">")
                lines.append(
                    f"{indent}      <a href=\"{href}\" data-nav-depth=\"{depth}\">{nav_title_html}</a>"
                )
                lines.append(
                    f"{indent}      <button class=\"nav-collapse-toggle\" aria-controls=\"{group_id}\" aria-expanded=\"true\" aria-label=\"Collapse subsection\"></button>"
                )
                lines.append(f"{indent}    </div>")
                lines.append(f"{indent}    <div class=\"nav-children\" id=\"{group_id}\">")
                render_nodes(children, level + 2)
                lines.append(f"{indent}    </div>")
            else:
                lines.append(f"{indent}    <a href=\"{href}\" data-nav-depth=\"{depth}\">{nav_title_html}</a>")
            lines.append(f"{indent}  </li>")
        lines.append(f"{indent}</ul>")

    render_nodes(tree, 0)
    lines.append("</nav>")
    return "\n".join(lines)


def build_local_toc(toc: list[dict]) -> str:
    if not toc:
        return ""

    lines = [
        '<nav class="local-toc" aria-label="On this page">',
        "  <h3>On this page</h3>",
        "  <ul>",
    ]
    for item in toc:
        css_level = max(TOC_MIN_LEVEL, min(item["level"], 6))
        classes = [f"toc-l{css_level}"]
        if item["kind"] == "heading":
            classes.append("toc-page")
        elif item["kind"] == "theorem":
            classes.append("toc-theorem")
        cls = f' class="{" ".join(classes)}"'
        lines.append(f'    <li{cls}><a href="#{item["id"]}">{item["html"]}</a></li>')
    lines += ["  </ul>", "</nav>"]
    return "\n".join(lines)


def build_page(
    section_html: str,
    global_nav: str,
    local_toc: str,
    title: str,
    prev_link: Optional[tuple[str, str]],
    next_link: Optional[tuple[str, str]],
    current_file: str,
) -> str:
    prev_btn = (
        f'<a href="{relative_href(current_file, prev_link[0])}" class="nav-prev">&larr; {prev_link[1]}</a>'
        if prev_link else "<span></span>"
    )
    next_btn = (
        f'<a href="{relative_href(current_file, next_link[0])}" class="nav-next">{next_link[1]} &rarr;</a>'
        if next_link else "<span></span>"
    )
    home_href = relative_href(current_file, "index.html")
    stylesheet_href = asset_href(current_file, "assets/style.css")
    script_href = asset_href(current_file, "assets/modifications.js")

    return f"""\
<!DOCTYPE html>
<html lang="{LANG}" data-theme="light">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{title} - {SITE_TITLE}</title>
  <meta name="pagefind-base" content="{BASE_URL}">
  <link rel="stylesheet" href="{stylesheet_href}">
  <script>
    (function(){{
      var t = localStorage.getItem("theme") || "auto";
      if (t === "auto") t = matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
      document.documentElement.dataset.theme = t;
    }})();
  </script>
</head>
<body>
  <header class="topbar" data-pagefind-ignore>
    <div class="topbar-left">
      <button class="sidebar-toggle-btn" id="sidebar-toggle-left" aria-label="Menu">{ICON_HAMBURGER}</button>
      <a href="{home_href}" class="topbar-title">{SITE_TITLE}</a>
    </div>
    <div class="topbar-right">
      <button class="search-trigger" aria-label="Search">{ICON_SEARCH} <kbd>Ctrl+K</kbd></button>
      <button class="theme-toggle" aria-label="Toggle theme" title="Toggle theme">{ICON_THEME_LIGHT}</button>
      <a href="{GITHUB_URL}" class="github-link" aria-label="GitHub" target="_blank" rel="noopener">{ICON_GITHUB}</a>
      <button class="sidebar-toggle-btn" id="sidebar-toggle-right" aria-label="Table of contents">{ICON_TOC}</button>
    </div>
  </header>
  <div class="layout">
    <aside class="sidebar-left" data-pagefind-ignore>
      <div class="sidebar-header">
        <a href="{home_href}" class="site-title">{SITE_TITLE}</a>
      </div>
      {global_nav}
    </aside>
    <main class="content">
      {section_html}
      <footer class="page-nav" data-pagefind-ignore>
        {prev_btn}
        {next_btn}
      </footer>
    </main>
    <aside class="sidebar-right" data-pagefind-ignore>
      {local_toc}
    </aside>
  </div>
  <div class="sidebar-backdrop" id="sidebar-backdrop"></div>
  <div class="search-overlay" id="search-overlay">
    <div class="search-dialog">
      <div class="search-header">
        <input type="text" class="search-input" id="search-input" placeholder="Search..." autocomplete="off">
        <kbd class="search-close">Esc</kbd>
      </div>
      <div class="search-results" id="search-results"></div>
    </div>
  </div>
  <script src="{script_href}"></script>
</body>
</html>"""


def split_and_generate(full_html: Path) -> None:
    out_dir = DIST_DIR / LANG
    out_dir.mkdir(parents=True, exist_ok=True)

    print("  Parsing HTML...")
    soup = BeautifulSoup(full_html.read_text(encoding="utf-8"), "html.parser")
    pages, nav_items, _nav_depths = discover_structure(soup)
    sections: dict[str, Tag] = {}

    for section in soup.find_all("section", class_="chapter"):
        sid = section.get("id", "")
        if sid:
            sections[sid] = section

    id_to_file: dict[str, str] = {}
    for sid, fname, _title in pages:
        if sid not in sections:
            continue
        id_to_file[sid] = fname
        for elem in sections[sid].find_all(attrs={"id": True}):
            id_to_file[elem["id"]] = fname

    for index, (sid, fname, title) in enumerate(pages):
        if sid not in sections:
            continue

        page_section = BeautifulSoup(str(sections[sid]), "html.parser").find("section")
        if page_section is None:
            continue

        for nested in page_section.find_all("section", class_="chapter"):
            nested.decompose()

        for a_tag in page_section.find_all("a", href=True):
            href = a_tag["href"]
            if href.startswith("#"):
                target_id = href[1:]
                target_file = id_to_file.get(target_id)
                if target_file and target_file != fname:
                    a_tag["href"] = relative_href(fname, target_file, target_id)

        local_toc = build_local_toc(extract_local_toc(page_section))
        global_nav = build_global_nav(nav_items, sid, fname)
        prev_link = (
            (
                cast(str, nav_items[index - 1]["filename"]),
                cast(str, nav_items[index - 1]["title"]),
            )
            if index > 0 else None
        )
        next_link = (
            (
                cast(str, nav_items[index + 1]["filename"]),
                cast(str, nav_items[index + 1]["title"]),
            )
            if index < len(nav_items) - 1 else None
        )

        page = build_page(
            section_html=page_section.decode_contents(),
            global_nav=global_nav,
            local_toc=local_toc,
            title=title,
            prev_link=prev_link,
            next_link=next_link,
            current_file=fname,
        )

        out_path = out_dir / fname
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(page, encoding="utf-8")
        print(f"    -> {LANG}/{out_path.relative_to(out_dir).as_posix()}")


def generate_redirect_index() -> None:
    html = """\
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Multivariable Calculus</title>
  <script>window.location.replace("en/index.html");</script>
  <meta http-equiv="refresh" content="0;url=en/index.html">
</head>
<body>
  <p>Redirecting... <a href="en/index.html">Open the notes</a></p>
</body>
</html>"""
    (DIST_DIR / "index.html").write_text(html, encoding="utf-8")
    print("  -> index.html")


def copy_assets() -> None:
    assets_dist = DIST_DIR / "assets"
    assets_dist.mkdir(parents=True, exist_ok=True)
    for src in ASSETS_SRC.glob("*"):
        if src.is_file():
            shutil.copy2(src, assets_dist / src.name)
            print(f"  -> assets/{src.name}")


def run_pagefind() -> None:
    pf_args = ["--site", str(DIST_DIR), "--output-subdir", "assets/pagefind"]
    candidates = [
        [sys.executable, "-m", "pagefind"] + pf_args,
        ["pagefind"] + pf_args,
        ["npx", "-y", "pagefind"] + pf_args,
    ]
    for cmd in candidates:
        try:
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
            if result.returncode == 0:
                print("  Pagefind indexing complete")
                return
        except (FileNotFoundError, subprocess.TimeoutExpired):
            continue
    print("  WARNING: Pagefind not available, search disabled")


def main() -> None:
    parser = argparse.ArgumentParser(description="Build the HTML notes site")
    parser.add_argument("--skip-pdf", action="store_true", help="Skip PDF compilation")
    parser.add_argument("--skip-compile", action="store_true", help="Skip Typst HTML compilation")
    parser.add_argument("--skip-search", action="store_true", help="Skip Pagefind indexing")
    parser.add_argument("--base-url", default="/", help="Base URL prefix for deployment")
    args = parser.parse_args()

    global BASE_URL
    BASE_URL = args.base_url

    print("=== Building Multivariable Calculus site ===\n")

    lang_dir = DIST_DIR / LANG
    if lang_dir.exists():
        shutil.rmtree(lang_dir)

    if not args.skip_compile:
        print("[1/5] Compiling Typst -> HTML")
        full_html = compile_typst()
    else:
        print("[1/5] Skipping Typst compilation")
        full_html = DIST_DIR / "full-en.html"
        if not full_html.exists():
            print(f"Error: {full_html.name} not found. Run without --skip-compile first.")
            sys.exit(1)

    print("\n[2/5] Splitting pages")
    split_and_generate(full_html)
    try:
        full_html.unlink()
    except FileNotFoundError:
        pass

    if not args.skip_pdf:
        print("\n[3/5] Compiling PDF")
        compile_pdf()
    else:
        print("\n[3/5] Skipping PDF compilation")

    print("\n[4/5] Copying assets")
    generate_redirect_index()
    copy_assets()

    if not args.skip_search:
        print("\n[5/5] Building search index")
        run_pagefind()
    else:
        print("\n[5/5] Skipping search indexing")

    print(f"\nDone. Open {DIST_DIR / 'index.html'} in a browser.")


if __name__ == "__main__":
    main()
