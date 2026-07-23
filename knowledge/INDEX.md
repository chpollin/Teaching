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

The Promptotyping knowledge base for the DH Developer Skriptum. Twelve documents specify the project's identity, formal substance, design, build, material, narrative substance, operational roadmap, operational rules in short form, project-level sources, chronological record, and a dated change log of the knowledge folder itself. The folder is the canonical reference for any agent or human writing into the textbook.

The Obsidian vault at `c:/Users/Chrisi/Documents/obsidian/Projects/dh-developer-skriptum/` mirrors the project but is documentation. Source of truth is the repository.

## Reading Order

1. `project.md` — what this textbook is and why
2. `specification.md` — 45 chapters, both-paths convention, CT distribution, quality gates
3. `design.md` — voice, sample passages, DE-EN glossary
4. `data.md` — substrate × vault-backing, writing queue
5. `architecture.md` — build pipeline, routing, deployment
6. `user-stories.md` — eight reader roles
7. `roadmap.md` — phases, milestones, status tracker
7a. `diss-integration.md` — content-filling programme D0 to D8 (dissertation + teaching corpus + Grounded Vault evidence layer); supersedes roadmap M3 to M9
8. `cheat-sheet.md` — operational rules on one page (for active writing sessions)
9. `sources.md` — project-level bibliography
10. `journal.md` — chronological record
11. `CHANGELOG.md` — dated list of substantial changes to the knowledge folder (diff trail, not narrative)

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
| `diss-integration.md` | Plan (content programme) | How do dissertation, teaching corpus, and the Grounded Vault evidence layer fill the 45 chapters? |
| `cheat-sheet.md` | Operational summary | What are the non-negotiable rules in shortest form? |
| `sources.md` | Bibliography | What are the project-level references for the knowledge base? |
| `journal.md` | Genesis | How did we get here and what was decided? |
| `CHANGELOG.md` | Diff trail | What changed in the knowledge folder and when? |

## Project Glossary

Quick-lookup definitions of operational terms. **Authoritative definitions live in the source documents**: when the glossary entry and the source disagree, the source prevails.

- **Block** — One of eight thematic groupings (00 Foundations to 08 InfoViz). Authoritative: `specification.md` "The Eight Blocks".
- **Chapter** — Atomic teaching unit, one folder under `chapters/`, one `index.md`. Forty-five total. Authoritative: `specification.md`.
- **Chapter ID** — Two-segment identifier like `01-02`. Authoritative: `specification.md` "Chapter Frontmatter".
- **Both-Paths Convention** — Every chapter holds `## Short Synthesis` and `## Long Form` in one Markdown file. Authoritative: `specification.md` "Both-Paths Convention" and `design.md` "Voice".
- **Path** — Either Short or Long route through a chapter. Authoritative: `specification.md`.
- **CT-Marker** — Blockquote opening each chapter with one Computational Thinking operation and a framing question. Authoritative: `specification.md` "CT-Marker Distribution".
- **Literacy Trias** — Data Literacy, Computational Literacy, AI Literacy. Authoritative: `project.md` "The Literacy Trias".
- **Substrate** — Legacy material under `_legacy/`. Authoritative: `data.md` "Substrate Inventory" and `design.md` "Substrate Re-use Policy".
- **Vault-Backing** — Path to an Obsidian vault document with `path` and `read_on`. Authoritative: `architecture.md` "Vault-Drift Protocol".
- **Writing Queue** — Order in which chapters are written. Authoritative: `data.md`.
- **DH Developer** — Reader profile this textbook addresses. Authoritative: `project.md` "Audience" and `user-stories.md`.

## Related

- [[Konvention Promptotyping Documents]] (vault)
- [[Vorlagen Promptotyping Documents]] (vault)
- `../CLAUDE.md` (repo root, action layer)
- `roadmap.md` (operational sequence)
