---
title: "DH Developer Skriptum — Journal"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
template:
  name: Vorlage Journal
  version: 0.1
  url: https://dhcraft.org/Promptotyping/promptotyping-document/journal
  alias: https://dhcraft.org/Promptotyping/#promptotyping-document-journal
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
---

# DH Developer Skriptum — Journal

Chronological record of decisions, deviations, and writing sessions. Append-only. Newest entries on top.

## 2026-05-14 — Roadmap document added

A ninth knowledge document, `roadmap.md`, was added to the folder to make the operational sequence of work explicit. Previously the project plan was distributed across `specification.md` (eight blocks, quality gates), `data.md` (writing-queue waves), and `specification.md` Decisions (Phase 0 commit strategy) without a single document binding them into a sequence. `roadmap.md` lists six phases, eleven milestones, entry conditions, exit conditions, and how milestones tie to the four quality gates. A status tracker table at the end records milestone state.

`INDEX.md` reading order and document map updated to include `roadmap.md` between `user-stories.md` and `journal.md`. Repo-root `CLAUDE.md` source-documents list updated likewise; `roadmap.md` is flagged as "what to do next".

## 2026-05-14 — Action layer, plan pointer, vault mirror, ACTIVE-WORK entry

Four artefacts produced to complete the Promptotyping setup beyond the `knowledge/` folder.

**`CLAUDE.md` at repo root.** The action layer for any AI agent working in this repository. Imperative where the knowledge folder is descriptive. Sections: identity, source documents to read on session start (in order), writing rules (language, Both-Paths Convention, CT marker, vault-backing citation, substrate re-use, voice), forbidden list, six-criterion bar for promoting a chapter to `review`, git discipline, when to ask vs when to write without asking, vault connection rules, tool-use discipline, substrate-language summary, distillation principle. Socialises on `design.md` per the Knowledge-Action-Komposition pattern.

**Plan file replaced by pointer.** `C:/Users/Chrisi/.claude/plans/mellow-chasing-sun.md` rewritten as a one-page pointer to the `knowledge/` folder. Original plan content recoverable from git history. Maintenance burden eliminated: knowledge folder is the only canonical specification.

**Vault project document in lean pattern.** `c:/Users/Chrisi/Documents/obsidian/Projects/dh-developer-skriptum/Project Overview DH Developer Skriptum.md` created following [[Konvention Project Overview]] in German. Two-paragraph executive summary, Mission Control with reading paths into the repo, Sources with Live-and-Code plus Documentation links, related-projects mapping connecting the eight practice roles to existing DHCraft projects (SZD, HerData, M³GIM, SuGW, Forschungsleitstelle, EditionCrafter, etc.).

**ACTIVE-WORK entry.** Added under "Aktiv" between Forschungsleitstelle and Agentic Edition Pipeline. Inline metadata: folder, status: aktiv, repo: chpollin/Teaching, milestone for Phase 0 commits, six next-step arrows from Phase 0 Commit 1 through Phase 2 Pilot. ACTIVE-WORK `updated:` frontmatter bumped to 2026-05-14.

### Phase 0 sequence ready to execute

The Promptotyping infrastructure is complete. The next session can move straight into the three thematic Phase 0 commits:

1. Migration — delete `_config.yml`, create `.nojekyll`, `git mv` eight legacy folders to `_legacy/`
2. Architecture — `chapters/` skeleton with eight `_block.md` files, `site/` shells, `package.json`, `build.mjs` (~120 lines)
3. Promptotyping layer — already complete (this `knowledge/` folder, the repo-root `CLAUDE.md`); the commit captures any final touches

### Method notes

The order knowledge folder → CLAUDE.md → plan pointer → vault mirror → ACTIVE-WORK follows Promptotyping's Knowledge-then-Action principle. Knowledge documents are written first to establish vocabulary and conventions; the Action layer then references them. The vault mirror uses the lean pattern because the repo carries the project's substance.

## 2026-05-14 — User stories rewritten on practice-role axis

`user-stories.md` was rewritten a second time. The previous version organised readers by reading mode (Introductory Student, Practising Researcher, Self-Learner, etc.), which was rejected as misframed: reading mode is not the right axis for a DH developer textbook. The correct axis is DH developer practice: what the reader is building, in which project context, with which DH content.

The role set is now organised by practice, drawn from the DHCraft project portfolio (Stefan Zweig Digital, HerData, M³GIM, SuGW, ZBZ-OCR-TEI, EditionCrafter, Forschungsleitstelle, teiCrafter, coOCR, Notker Edition, CorrespExplorer):

- Edition Builder (scholarly editions, TEI, IIIF, apparatus)
- Research Data Engineer (pipelines, FAIR, controlled vocabularies, data publishing)
- Cultural-Heritage Tool Maker (museum, archive, library tools; coordinated views; ontologies)
- AI-Augmented Researcher (LLMs in DH workflows, Promptotyping, agent harnesses)
- Knowledge Graph Builder (RDF, SPARQL, ontologies, LOD, prosopography)
- Teaching Adopter (course adoption, citable chapters)
- Self-Learner (no-course autonomous reading)
- Coding Agent (machine reader)

Each practice role carries 6–8 stories that name concrete DH operations: modelling a critical apparatus in TEI, building reconciliation pipelines against Wikidata, choosing an ontology for a museum collection, writing SPARQL, applying Critical-Expert-in-the-Loop. Reading mode is preserved as a secondary layer per role in a Reading-Mode Guidance section.

Composite trajectories were rewritten to follow practice roles through real DH project lifecycles. The Cross-Role Tensions section now includes "Practice-driven vs. theory-anchored" as a tension resolved through the CT marker.

The "International Reader" role from the previous version was folded into design demands across all practice roles. Translation-awareness is a cross-cutting requirement carried by the DE-EN glossary in `design.md`.

## 2026-05-14 — Knowledge folder seeded

The `knowledge/` folder was created with all eight Promptotyping documents in their first full version. The folder fills the Promptotyping conventions from [[Konvention Promptotyping Documents]] and serves as the canonical reference for any future writing.

### What was produced

Eight documents, written in this order:

1. `INDEX.md` — navigation, document map, project glossary
2. `project.md` — identity, mission, literacy trias, audience, success criteria
3. `specification.md` — eight blocks, 45 chapters, both-paths convention (with functional differentiation), CT distribution rules, frontmatter schema, four quality gates with hard acceptance criteria
4. `design.md` — DHCraft visual stance, voice rules for Short vs. Long, sample passages, typography, colour tokens, DE-EN glossary
5. `architecture.md` — stack (Node, marked, gray-matter, Lunr), build pipeline, frontmatter validator, vault-drift protocol, routing
6. `data.md` — substrate inventory, vault-backing inventory, writing-queue waves, per-chapter mapping table (empty, fills in Phase 1), legacy URL mapping (empty, fills in Phase 0a)
7. `user-stories.md` — three personas (Lina, Markus, Dr. Schmidt) plus anti-personas
8. `journal.md` — this document

### What was decided

The seven plan-file weaknesses identified before writing got resolved in place:

- **Both-paths functional difference made explicit.** Short is essayistic, single-figure, no subheadings; Long is systematic, operational, numbered subsections. Two takes on one atom, not two lengths of the same content. Sample passages anchor the voice (`design.md`).
- **CT distribution engineered.** Per-block target mix specified in `specification.md`; per-chapter assignment goes into `data.md` when chapters get stubs.
- **Phase 1 reduced to minimal stubs.** Outlines deferred to per-block uptake. Documented in `specification.md` decisions.
- **Phase 1.5 reverification done.** Of seven original vault gaps, four remain real, three are partial. Documented in `data.md` "Vault Gaps".
- **Quality gates given hard criteria.** Four gates (A skeleton, B pilot, C wave, D launch) with mechanical and human checks (`specification.md`).
- **Vault-drift protocol.** Backings are dated (`path` + `read_on`), not live. Optional vault-side awareness via `backed_chapters` field (`architecture.md`).
- **Phase 0 split into three commits.** Migration, architecture, Promptotyping layer (`specification.md` decisions).

### What is next

- Update the plan file at `C:/Users/Chrisi/.claude/plans/mellow-chasing-sun.md` to reflect the resolved weaknesses, or supersede the plan with this knowledge folder as the canonical specification.
- Make a decision on the Phase 0 sequence: write `CLAUDE.md` and `build.mjs` next, or first move `_legacy/` and clear out `_config.yml`?
- Create the Vault mirror at `c:/Users/Chrisi/Documents/obsidian/Projects/dh-developer-skriptum/Project Overview DH Developer Skriptum.md`.
- Add the ACTIVE-WORK entry in the Vault.

### Method notes

The knowledge folder was written in one session as a coherent piece — every document refers to siblings consistently. This was possible because no chapter content existed yet; the documents specify a future, they do not describe a present. Future updates will be incremental.

The English-output decision (project language = English, vault language = German) holds for the knowledge folder. The vault mirror under `Projects/` will be in German, following vault convention.

No emojis. No dashes as punctuation. The voice across documents is intentionally less essayistic than the textbook itself — knowledge documents serve agents and writers, not readers; clarity and grep-ability beat style.
