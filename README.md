# DH Developer Skriptum

An English-language textbook for the Digital Humanities Developer. Forty-five atomic chapters in eight thematic blocks. Each chapter is readable along two paths (a short essayistic synthesis and a long systematic exposition) and is framed by one Computational Thinking operation. The textbook is produced under the Promptotyping method.

The site is published at `https://chpollin.github.io/Teaching/`.

## Status

In development. The Promptotyping infrastructure (knowledge folder, action layer, vault mirror) is complete. Phase 0 (repository refactor) is the next step. Chapters are stubs or unwritten. See `knowledge/roadmap.md` for the milestone status.

This repository is a refactor of a 2022–2023 collection of teaching materials in German. Legacy content is being moved to `_legacy/` and serves as research substrate for the new English textbook. Legacy URLs receive redirect stubs.

## What This Textbook Teaches

Three literacies as one practice:

- **Data Literacy** — reading, structuring, modelling, and licensing humanities data.
- **Computational Literacy** — operating shells, version control, format transformations, static-site deployment, pipelines.
- **AI Literacy** — using generative AI as a research tool, with disciplined prompt design and clear evaluation.

Each chapter foregrounds one Computational Thinking operation (Decomposition, Pattern Recognition, Abstraction, Algorithm Design) as the methodological core.

## Who This Is For

Eight practice-driven reader roles, detailed in `knowledge/user-stories.md`:

- Edition Builder
- Research Data Engineer
- Cultural-Heritage Tool Maker
- AI-Augmented Researcher
- Knowledge Graph Builder
- Teaching Adopter
- Self-Learner
- Coding Agent

## Repository Layout

```
Teaching/
├── CLAUDE.md           # action layer for AI agents
├── README.md           # this file
├── LICENSE-CC-BY       # content licence
├── LICENSE-MIT         # code licence (added in Phase 0)
├── .nojekyll           # disables GitHub's Jekyll build (added in Phase 0)
├── package.json        # build dependencies (added in Phase 0)
├── build.mjs           # static-site generator (added in Phase 0)
├── knowledge/          # Promptotyping knowledge base (canonical specification)
├── chapters/           # textbook content (added in Phase 0)
├── site/               # site templates and assets (added in Phase 0)
├── docs/               # build output, served by GitHub Pages (added in Phase 0)
└── _legacy/            # archived 2022-2023 substrate (moved in Phase 0)
```

## How to Read

Start with `knowledge/INDEX.md` for navigation and the project glossary. Then:

- `knowledge/project.md` — what this textbook is
- `knowledge/specification.md` — formal scope, chapter structure, quality gates
- `knowledge/design.md` — voice and form
- `knowledge/roadmap.md` — phases, milestones, status tracker

## Build

After Phase 0 is complete:

```bash
npm install
npm run build
```

The script reads Markdown from `chapters/`, validates frontmatter, splits each chapter's Short and Long sections, renders HTML into `docs/`, generates `chapters.json` and `search.json`, and produces redirect stubs for legacy URLs. Pipeline details in `knowledge/architecture.md`.

## Method

The textbook is developed under the Promptotyping method (`https://dhcraft.org/Promptotyping/`). The knowledge base in `knowledge/` is canonical; `CLAUDE.md` is the agent action layer that references it. Every writing session is recorded in `knowledge/journal.md`.

## Licence

Content: CC-BY-4.0 (existing `LICENSE-CC-BY`).
Code and site: MIT (added in Phase 0).
Legacy content under `_legacy/` retains its original CC-BY-4.0.

## Contributing

The repository is currently in an authored phase. External contributions become possible after Quality Gate B (pilot block complete) and are documented at that point.

For corrections and suggestions, open a GitHub issue.

## Related

- `https://github.com/chpollin/Teaching` — this repository
- `https://chpollin.github.io/Teaching/` — published site
- `https://dhcraft.org/` — DHCraft
- `https://dhcraft.org/Promptotyping/` — Promptotyping method
