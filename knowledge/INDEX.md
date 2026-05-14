---
title: "Knowledge Folder Index"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
template:
  name: Vorlage Index
  version: 0.1
  url: https://dhcraft.org/Promptotyping/promptotyping-document/index
  alias: https://dhcraft.org/Promptotyping/#promptotyping-document-index
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
---

# Knowledge Folder Index

## Purpose

The Promptotyping knowledge base for the DH Developer Skriptum. Eleven documents specify the project's identity, formal substance, design, build, material, narrative substance, operational roadmap, operational rules in short form, project-level sources, and chronological record. The folder is the canonical reference for any agent or human writing into the textbook.

The Obsidian vault at `c:/Users/Chrisi/Documents/obsidian/Projects/dh-developer-skriptum/` mirrors the project but is documentation. Source of truth is the repository.

## Reading Order

1. `project.md` — what this textbook is and why
2. `specification.md` — 45 chapters, both-paths convention, CT distribution, quality gates
3. `design.md` — voice, sample passages, DE-EN glossary
4. `data.md` — substrate × vault-backing, writing queue
5. `architecture.md` — build pipeline, routing, deployment
6. `user-stories.md` — eight reader roles
7. `roadmap.md` — phases, milestones, status tracker
8. `cheat-sheet.md` — operational rules on one page (for active writing sessions)
9. `sources.md` — project-level bibliography
10. `journal.md` — chronological record

When fixing a specific failure mode, jump to the document whose function matches it. See [[Konvention Promptotyping Documents]] reading heuristic.

## Document Map

| File | Function | Question it answers |
|---|---|---|
| `INDEX.md` | Navigation | What lives here, in what order, what do project terms mean? |
| `project.md` | Identity | What is this textbook? |
| `specification.md` | Substance (formal) | What does it contain, in what shape, by what rules? |
| `design.md` | Form | How does it look and sound? |
| `data.md` | Material | What substrate and what vault knowledge feeds each chapter? |
| `architecture.md` | Build | How is the static site assembled and deployed? |
| `user-stories.md` | Substance (narrative) | Who uses this and for what? |
| `roadmap.md` | Plan | What is the sequence of work, what milestones, what is next? |
| `cheat-sheet.md` | Operational summary | What are the non-negotiable rules in shortest form? |
| `sources.md` | Bibliography | What are the project-level references for the knowledge base? |
| `journal.md` | Genesis | How did we get here and what was decided? |

## Project Glossary

Operational terms used across the knowledge documents.

- **Block** — One of the eight thematic groupings (00 Foundations to 08 InfoViz). A block contains 3 to 8 chapters and has a `_block.md` overview page.
- **Chapter** — An atomic teaching unit, one folder under `chapters/`, one `index.md`. Forty-five chapters total.
- **Chapter ID** — Two-segment identifier like `01-02` (block-number, chapter-position). Used as foreign key in cross-references, redirects, and substrate mapping.
- **Both-Paths Convention** — Every chapter holds two H2 sections in one Markdown file: `## Short Synthesis` (essayistic) and `## Long Form` (systematic). They share frontmatter, exercises, glossary.
- **Path** — Either the short or the long route through a chapter. Readers choose; the renderer presents both as tabs.
- **CT-Marker** — A blockquote opening each chapter, naming one of the four Computational Thinking operations (Decomposition, Pattern Recognition, Abstraction, Algorithm Design) and a framing question.
- **Literacy Trias** — Data Literacy, Computational Literacy, AI Literacy as three intersecting axes.
- **Substrate** — Legacy material under `_legacy/` (former GDI, WebDev, InfoMod, TTT, PM_DH course content). Research source, not for verbatim quotation.
- **Vault-Backing** — Path to an Obsidian vault document that holds the conceptual ground for a chapter. Declared in chapter frontmatter as `vault_backing:` with `path` and `read_on`.
- **Writing Queue** — The order in which chapters are written, derived from `data.md`.
- **DH Developer** — The reader profile this textbook addresses: someone who builds with data, code, and AI in humanities contexts.

## Related

- [[Konvention Promptotyping Documents]] (vault)
- [[Vorlagen Promptotyping Documents]] (vault)
- `../CLAUDE.md` (repo root, action layer)
- `roadmap.md` (operational sequence)
