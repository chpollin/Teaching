---
title: "DH Developer Skriptum — Architecture"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
template:
  name: Vorlage Architecture
  version: 0.1
  url: https://dhcraft.org/Promptotyping/promptotyping-document/architecture
  alias: https://dhcraft.org/Promptotyping/#promptotyping-document-architecture
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
topics:
  - "[[Static Site Deployment]]"
knowledge-sources:
  standards:
    - label: "CommonMark"
      url: https://commonmark.org/
    - label: "GitHub Pages documentation"
      url: https://docs.github.com/en/pages
  tools:
    - label: "marked"
      url: https://marked.js.org/
    - label: "gray-matter"
      url: https://github.com/jonschlinkert/gray-matter
    - label: "Lunr.js"
      url: https://lunrjs.com/
---

# DH Developer Skriptum — Architecture

## Approach

A static site compiled from Markdown to HTML by one Node script. No framework, no SSG ecosystem, no bundler, no CSS preprocessor. The whole build is auditable in one reading.

## Stack

| Layer | Choice | Note |
|---|---|---|
| Runtime | Node 20 LTS | available across platforms |
| Markdown parser | `marked` v12+ | CommonMark-compliant |
| Frontmatter parser | `gray-matter` | YAML frontmatter |
| Search index | `lunr` v2 | client-side, ~30 KB index for 45 chapters |
| Code highlight | `prism.js` (browser-side) | runs on rendered pages |
| CSS | hand-written, single stylesheet, ~400 lines | scoped by component |
| JS | three vanilla ES modules | app.js (router), nav.js (sidebar), search.js (Lunr loader) |
| Hosting | GitHub Pages from `/docs` on `master` | no CI required initially |

Two npm scripts: `build` and `validate`. No CI initially; the build runs locally and the result is committed.

## Folder Layout

```
Teaching/
├── CLAUDE.md
├── README.md
├── LICENSE-CC-BY
├── LICENSE-MIT
├── .nojekyll
├── package.json
├── package-lock.json
├── build.mjs
├── knowledge/
├── chapters/
├── site/
├── docs/
└── _legacy/
```

`docs/` is committed because GitHub Pages requires it on `master`. Generated files in `docs/` are not hand-edited; the build owns the folder.

## Build Pipeline

`build.mjs` runs in eight steps.

1. Read templates: `site/index.html`, `site/chapter.html`, `site/block.html`, `site/404.html`.
2. Walk `chapters/`. Per `index.md`: parse frontmatter with `gray-matter`; validate; split body on `## Short Synthesis` and `## Long Form` H2 markers; parse each section with `marked`; compute word counts; compare against length envelope from `specification.md`; render chapter HTML into `docs/chapters/<block>/<chapter>/index.html`.
3. Walk `chapters/*/`. Per `_block.md`: render the block index page; write to `docs/chapters/<block>/index.html`.
4. Generate `docs/data/chapters.json`: all frontmatter plus computed fields (`url`, `block_url`, `word_count_short`, `word_count_long`).
5. Generate `docs/data/search.json`: Lunr index over title, both bodies, glossary headwords.
6. Generate `docs/index.html`: home page with literacy-trias intro and 8 block tiles.
7. Generate redirect stubs from the migration table in `data.md`: each old path gets `docs/<old-path>/index.html` with meta-refresh.
8. Copy static assets: `site/assets/` → `docs/assets/`; `site/404.html` → `docs/404.html`; touch `.nojekyll`; generate `sitemap.xml` and `robots.txt`.

## Frontmatter Validator

Pure function invoked at step 2.

Required fields:

```javascript
const required = [
  "title", "slug", "chapter_id", "block", "block_title", "order",
  "project", "method", "template", "status",
  "created", "updated", "language", "version", "authors",
  "ct_markers", "paths"
];
```

Type checks:

- `chapter_id` matches `/^\d{2}-\d{2}$/`
- `order` is an integer
- `status` is one of `stub | draft | review | published`
- `ct_markers.primary` is one of `decomposition | pattern-recognition | abstraction | algorithm-design`
- `paths.short` and `paths.long` are booleans
- `vault_backing` items each carry `path` (string) and `read_on` (YYYY-MM-DD)

On failure, the validator prints the file path and the failing field and exits with code 1.

## Routing

Static path-based routes. GitHub Pages serves files as-is.

```
/                                       → docs/index.html
/chapters/01_cs_fundamentals/           → block index
/chapters/01_cs_fundamentals/01-02_character-encoding/
                                        → chapter page
/<legacy-path>/                         → redirect stub
```

The path tab switcher (Short / Long) is client-side: both sections live in the same HTML page, separated by ARIA tab panels, switched by JavaScript. Tab choice persists in `localStorage`. With JavaScript disabled, both sections render stacked.

## Client-Side JavaScript

Three vanilla ES modules, no bundler.

- `site/assets/js/app.js`: bootstrap. Loads `chapters.json`, mounts the sidebar, attaches keyboard handlers (`Cmd/Ctrl+K` for search, `1`/`2` for path switch), hydrates the path tab switcher.
- `site/assets/js/nav.js`: sidebar accordion. Reads `chapters.json` once, groups by block, renders aside with CT-marker badges, highlights the current chapter from URL.
- `site/assets/js/search.js`: lazy-loads `search.json` and Lunr when the search overlay opens. Renders results grouped by block.

Total client JS: approximately 250 lines.

## Vault-Drift Protocol

A chapter's `vault_backing:` field declares which vault documents informed the chapter at writing time. Vault documents change. The protocol prevents drift.

**Backing references are dated, not live.** Each entry is `{ path, read_on }`. The `read_on` date is the date the writer last consulted the document.

**Revision rule.** When a chapter is revised, the writer rereads the vault-backing documents and updates `read_on`, removes backings that no longer apply, or adds new ones.

**Vault-side awareness (optional).** Vault documents that serve as backings may carry a `backed_chapters: [chapter_id, ...]` field in their own frontmatter. Not a requirement of the textbook; the textbook works if the vault has no such metadata.

**No live URL backing.** Vault paths in chapter frontmatter are absolute paths on the maintainer's machine, not URLs, not portable. Backings are private research traces, not citations. Citations for readers belong in `## Further Reading`.

**Fork portability.** Anyone who forks the repository inherits dead `vault_backing[].path` entries pointing into the original maintainer's filesystem. The build does not fail on dead vault paths; it treats them as opaque markers. Forks have three options. First, replace each backing with a path on the fork's own system on next chapter revision. Second, replace with a URL when the backing concept exists as a public reference (Wikipedia article, standards document, vault made public). Third, leave the path as a provenance trace and rely on `## Further Reading` for the public-facing source list. The first option is the cleanest; the third is the lowest-cost; the second is the most informative for downstream readers. The choice is per-chapter, not project-wide.

## Deployment

GitHub Pages serves `docs/` from `master`. Deploy steps:

1. Run `npm run build`.
2. Commit the changes to `docs/`.
3. Push to `master`.
4. GitHub Pages picks up the change within one to two minutes.

`.nojekyll` in repo root and in `docs/` prevents GitHub from running Jekyll over the output.

Custom domain deferred: add `CNAME` in `docs/`, configure DNS, enable HTTPS in Pages settings.

## Migration of Legacy URLs

Mapping lives in `data.md` (table "Legacy URL Mapping"). Build step 7 generates a redirect stub for each old path:

```html
<!doctype html>
<meta http-equiv="refresh" content="0; url=/Teaching/chapters/05_editions/05-03_tei-basics/">
<title>Moved</title>
<link rel="canonical" href="/Teaching/chapters/05_editions/05-03_tei-basics/">
<p>This page moved to <a href="/Teaching/chapters/05_editions/05-03_tei-basics/">TEI Basics</a>.</p>
```

When a legacy path maps to a chapter that does not yet exist, the stub points to the block index with a note linking into `_legacy/`.

## Performance Targets

- First contentful paint under 1.5s on a 3G connection profile.
- Search index loaded only when the search overlay opens.
- No external CDN dependencies. Fonts self-hosted.
- No JavaScript framework runtime.

Measured at Phase 5 with Lighthouse. Numbers recorded in `journal.md`.

## Excluded from This Architecture

- No comments, reactions, or social features.
- No user accounts.
- No analytics initially. If introduced later, self-hosted privacy-respecting only.
- No internationalisation infrastructure. English-only by design.
- No PDF or EPUB export.
- No live search index update. Rebuilt at every `npm run build`.

## Related

- `specification.md` (frontmatter spec)
- `design.md` (visual layer, components)
- `data.md` (legacy URL mapping)
- `roadmap.md` (build pipeline standup is Milestone 1)
- `../CLAUDE.md` (action layer)
