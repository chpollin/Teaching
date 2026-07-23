---
title: "DH Developer Skriptum — Roadmap"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
---

# DH Developer Skriptum — Roadmap

## Purpose

Operational roadmap. Binds the formal scope (`specification.md`), the build mechanics (`architecture.md`), and the material inventory (`data.md`) into a sequence of executable milestones.

No time estimates. The sequence is fixed; pace is open.

## Six Phases, Eleven Milestones

The project moves through six phases. Within each phase, one or more milestones mark verifiable progress. Each milestone has an entry condition (what must be true to start it), the work to be done, and an exit condition (what must be true to mark it complete, usually tied to a Quality Gate).

| Phase | Milestones | Quality Gate |
|---|---|---|
| Phase 0 — Setup | M1 Phase 0 complete, site live as skeleton | — |
| Phase 1 — Skeleton | M2 45 chapter stubs, navigation complete | Gate A |
| Phase 1.5 — Vault gaps | M3 Vault gaps closed | — |
| Phase 2 — Pilot | M4 Pilot Block 0 complete | Gate B |
| Phase 3 — Waves | M5 Wave A · M6 Wave B · M7 Wave C · M8 Wave D · M9 Wave E | Gate C per wave |
| Phase 4 — Exercises | M10 Exercises, code, cross-linking | — |
| Phase 5 — Launch | M11 Launch | Gate D |

Quality Gate criteria (mechanical and human checks) live in `specification.md` "Quality Gates".

## Phase 0 — Setup and Architecture

**Goal:** Repository refactored, GitHub Pages serves the new site, build pipeline runs end-to-end.

### Milestone 1 — Phase 0 complete, site live as skeleton

**Entry condition:** Knowledge folder seeded (complete as of 2026-05-14), `CLAUDE.md` at repo root (complete), vault mirror and ACTIVE-WORK entry in place (complete).

Three thematic commits in order:

**Commit 1 — Migration.** Destructive operation; verify with the user before executing.
- Delete `_config.yml`
- Create `.nojekyll` at repo root
- `git mv` the eight legacy folders to `_legacy/`: `GDI/`, `WebDev/`, `InfoMod/`, `TTT/`, `PM_DH/`, `WissMod/`, `DataSteward/`, `Schools/`
- Move old `README.md` to `_legacy/README_2022.md`

**Commit 2 — Architecture.**
- Create `chapters/` with eight block folders (`00_foundations/` through `08_infoviz/`)
- Each block folder gets a `_block.md` stub (overview, learning goals, chapter list)
- Create `site/` with `index.html`, `chapter.html`, `block.html`, `404.html`, CSS skeleton (`assets/css/dhcraft.css`, `prism.css`), JS skeletons (`assets/js/app.js`, `nav.js`, `search.js`)
- Create `package.json` with dependencies (`marked`, `gray-matter`, `lunr`)
- Write `build.mjs` (under 200 lines) implementing the eight-step pipeline from `architecture.md`
- Run `npm install && npm run build`; verify `docs/` is populated

**Commit 3 — Promptotyping layer.**
- Capture the already-written `knowledge/` folder (8 files plus this `roadmap.md`) and repo-root `CLAUDE.md` in a clean commit
- Push to `master`; verify GitHub Pages picks up the build (source: `master` branch, `/docs` folder)

**Exit condition (M1):**
- `chpollin.github.io/Teaching/` shows the home page with 8 block tiles
- Each block tile leads to a block-index page
- The build runs without errors
- Frontmatter validator works (verify by testing a deliberately broken stub, then fixing it)
- Redirect stubs exist for legacy URLs and resolve correctly

## Phase 1 — Skeleton of 45 Chapters

**Goal:** All 45 chapters exist as minimal stubs. Navigation is complete. The site looks done from outside but most chapters are empty.

### Milestone 2 — 45 chapter stubs, navigation complete

**Entry condition:** Milestone 1 complete.

Per chapter (45 times):
- Create directory `chapters/<block>/<chapter_id>_<slug>/`
- Create `index.md` with complete frontmatter (per `specification.md` "Chapter Frontmatter")
- Write a 1–3 sentence lead paragraph in the body
- Write 3–5 learning goals as bullets
- Add a "Chapter in progress" marker
- Set `status: stub`, `paths.short: false`, `paths.long: false`
- Add `vault_backing` entries (with `read_on` date) or explicit `vault_backing: []` with a `lücken-notiz` field
- Add `substrate` entries pointing into `_legacy/` where applicable
- Set `prerequisites`, `next`, `related` (the latter can be sparse at stub stage)

Parallel work in `data.md`:
- Fill the per-chapter mapping table (all 45 rows)
- Fill the legacy URL mapping table for redirect stubs

**Exit condition (M2 = Quality Gate A):**
- `npm run build` succeeds with zero validator errors
- `chapters.json` lists exactly 45 chapters
- Every stub has lead, learning goals, backing entry (or explicit gap note)
- Site navigation shows the full 8-block accordion structure
- Sidebar accordion renders correctly with CT-marker badges

## Phase 1.5 — Close Vault Gaps

**Goal:** Vault contains atomic knowledge documents for the seven previously-flagged backings, so Phase 2 and Phase 3 chapters can be vault-backed.

### Milestone 3 — Vault gaps closed

**Entry condition:** Milestone 2 complete. Vault gaps reverified against current vault state (the four real gaps and three partial gaps documented in `data.md` "Vault Gaps").

Four atomic vault documents to write (each follows vault CLAUDE.md §4: Summary + Key Points + Synthesis + Sources):

1. Projektmanagement (Vault location: `Coding/Projektmanagement.md` or `Vault Operations/`)
2. Datenbanken Grundlagen (Vault location: `Coding/` or `Digital Humanities/Knowledge/`)
3. Linked Open Data Intro (Vault location: `Digital Humanities/Standards und Datenmodelle/`)
4. Semantic Web Intro (Vault location: `Digital Humanities/Standards und Datenmodelle/`)

Three partial documents to extend:

5. Lizenzen — add a research-data-license counterpart to the existing `Coding/Open Source Lizenzierung.md`
6. REST-APIs Grundkonzepte — add a conceptual layer beyond `Coding/Webentwicklung/Fetch API.md`
7. Claude Code und Tools — extend the existing Claude Code document toward fuller tool integration

After writing, the relevant chapter stubs in the repository get their `vault_backing` field updated with the new paths and `read_on` dates.

**Exit condition (M3):**
- All four new vault documents exist with proper frontmatter, summary, key points, synthesis, sources
- All three extensions are merged into existing documents
- Affected chapter stubs in `chapters/` reference the new backings
- `data.md` "Vault Gaps" section is updated to reflect closure

## Phase 2 — Pilot Block 0

**Goal:** Three chapters fully written as the style and convention reference. The pilot defines voice for the rest of the textbook.

### Milestone 4 — Pilot Block 0 complete

**Entry condition:** Milestone 3 complete (or partially — the three pilot chapters do not depend on the four vault gaps, since Block 0 chapters are vault-light syntheses).

Three chapters, each fully written:

- `00-01_three-literacies` — Data + Computational + AI Literacy as a connected practice; CT primary: Abstraction
- `00-02_computational-thinking` — the four CT operations with DH examples; CT primary: Pattern Recognition
- `00-03_promptotyping-overview` — the method as bridge concept to practice; CT primary: Algorithm Design

Per chapter:
- Write Long Form first (1500–3500 words, 3–6 numbered subsections, runnable examples where applicable)
- Distil Short Synthesis (400–700 words, essayistic, one core insight, no subheadings)
- Add CT marker blockquote with primary operation and framing question
- Write exercises (concrete, testable)
- Write further reading
- Build chapter glossary
- Set 3+ `related:` cross-references
- Promote `status: stub` → `draft`, then `draft` → `review`
- Update `paths.short: true`, `paths.long: true`

External reading by one domain-near person; feedback summarised in `journal.md` with date and reviewer role.

Stilguide v1 lessons folded into `design.md` (voice subtleties surfaced by the pilot).

**Exit condition (M4 = Quality Gate B):**
- All three chapters complete, both paths within length envelope
- CT markers set and non-generic
- 3+ valid `related:` per chapter
- External reading documented
- `design.md` v1 updated with pilot lessons

## Phase 3 — Wave-Based Content Filling

**Goal:** All 42 remaining chapters written, both paths complete, both within envelope. The textbook is content-complete in draft form.

Five waves, chosen for oscillating writing friction (not monotonically increasing difficulty). Wave order is recommendation, not contract — log any deviation in `journal.md`.

### Milestone 5 — Wave A complete (Block 07 AI)

**Entry condition:** Milestone 4 complete. Pilot voice calibrated.

Six chapters in Block 07. Vault-dense (Applied Generative AI, AGKI-AG knowledge, Promptotyping documents). Practice role primarily served: AI-Augmented Researcher.

**Exit condition (M5 = Quality Gate C):**
- All Block 07 chapters at `status: review` or `published`
- Spot-check of 2 random chapters against `design.md` voice rules
- CT distribution still tracks block target (mostly Algorithm Design + Abstraction, some Pattern Recognition)
- Cross-references valid

### Milestone 6 — Wave B complete (Block 05 Editions)

Eight chapters in Block 05. Doubly backed (Vault + TTT substrate including Struwwelpeter and Schönberg cases). Practice role primarily served: Edition Builder.

Quality Gate C as above.

### Milestone 7 — Wave C complete (Block 02 Data + Block 08 InfoViz)

Twelve chapters total (8 Data + 4 InfoViz). Vault-strong, didactically central. Practice roles primarily served: Research Data Engineer, Knowledge Graph Builder (partial), Cultural-Heritage Tool Maker (partial).

Quality Gate C.

### Milestone 8 — Wave D complete (Block 04 Web + Block 01 CS Fundamentals)

Thirteen chapters total (8 Web + 5 CS). Complementary: vault synthesis (Web) plus substrate distillation (CS from GDI). Practice roles primarily served: Cultural-Heritage Tool Maker, Edition Builder (for Web deployment chapters).

Quality Gate C.

### Milestone 9 — Wave E complete (Block 03 Semantic Web + Block 06 Workflows)

Fourteen chapters total (6 Semantic Web + 8 Workflows). Hardest blocks last — Semantic Web because the vault gaps closed in Milestone 3 are most needed here; Workflows because Project Management gap and substrate (PM_DH) blend least obviously. Practice role primarily served: Knowledge Graph Builder, all practice roles for Workflows.

Quality Gate C.

After M9: all 45 chapters at `status: review` minimum. Skriptum is content-complete in draft.

## Phase 4 — Exercises, Code, Cross-Linking

**Goal:** Exercises tested, code examples run, cross-references stabilised, glossary consolidated.

### Milestone 10 — Exercises, code, cross-linking

**Entry condition:** Milestone 9 complete.

- Each exercise is run at least once on a fresh machine; expected outputs documented; difficulty marker assigned
- Code examples placed under `chapters/<chapter>/exercises/` or `assets/`
- Global cross-reference pass: every `related:` entry resolved, "see also" sections built by renderer
- Glossary consolidation: every term appears identically across chapters; first-use definitions consistent
- Prism.js code highlighting tested for all languages used
- Citation block added per chapter (Teaching Adopter requirement)
- Self-check questions added per chapter (Self-Learner requirement)
- `chapter.json` siblings generated for each chapter (Coding Agent requirement, if not already in build pipeline)

**Exit condition (M10):**
- Every exercise verified runnable
- No broken cross-references
- Glossary internally consistent
- All 45 chapters at `status: review` or `published`

## Phase 5 — Polish and Launch

**Goal:** Public launch. Textbook is `published`, externally validated, announced.

### Milestone 11 — Launch

**Entry condition:** Milestone 10 complete.

- Final Lunr search index built; search verified for chapter titles, section headings, glossary terms
- Mobile and browser-matrix testing: Chrome, Firefox, Safari (last two versions)
- Lighthouse pass: first contentful paint under 1.5s on 3G profile
- `README.md` at repo root finalised (project statement, reading paths, contribution guide)
- About page with DHCraft branding and link to Promptotyping method
- 2–3 external test readers, each reads 5+ chapters; feedback structured in three columns (works, doesn't, surprised); folded into a Gate D journal entry
- Blog post on DHCraft site announcing launch
- AGKI-AG webinar announcement
- Workshop synergies activated (link from VetMedAI, ZBZ-OCR-TEI, etc., where relevant)

**Exit condition (M11 = Quality Gate D):**
- All 45 chapters at `status: published`
- External readers signed off
- Performance targets met
- Launch communication out

## Deviations

**2026-07-23 — D-programme supersedes M3 to M9.** The content-filling sequence is re-planned in `diss-integration.md`: the author's dissertation and the teaching corpus become substrate sources, a Grounded Vault instance (`skriptum-vault`, from the template DigitalHumanitiesCraft/grounded-vault) becomes the evidence layer, and milestones D0 to D8 replace the wave sequence M3 to M9. M10 and M11 remain, M10 extended by a chapter-against-claims consistency pass. Quality gates apply unchanged. First deliverable of the new programme: pilot chapter 03-02 (see `journal.md`).

The wave order in Phase 3 is recommendation. If external context (a workshop, a citation request, a paper deadline) makes a different chapter more urgent, that chapter is written first. The deviation is logged in `journal.md` with reason. Quality gates apply regardless of order.

If a chapter fails a Gate C spot-check, it returns to `draft`. The wave is not complete with one broken chapter. Repair before marking M5–M9 complete.

If Phase 1.5 vault gaps cannot be closed, the corresponding Phase 3 wave is deferred.

## Status Tracker

The current state of each milestone. Updated as milestones complete.

| Milestone | Status | Notes |
|---|---|---|
| M1 — Phase 0 complete | completed | Three commits on master: 28dd38e (Promptotyping layer), 1b6f6bf (migration), 2483b2f (architecture). Build runs, eight block index pages render. |
| M2 — 45 chapter stubs | completed | 45/45 stubs written. Build renders 45 chapter pages plus 9 block indices. Gate A mechanical checks pass: frontmatter valid, chapters.json present, search.json present, navigation reachable, assets load under /Teaching/ prefix. |
| M3 — Vault gaps closed | superseded | Replaced by D-programme (`diss-integration.md`); the two Block-03 gaps are substrate-covered by the dissertation, Projektmanagement by the teaching corpus. |
| M4 — Pilot Block 0 | superseded | Pilot function moved to chapter 03-02 (drafted 2026-07-23); Block 00 becomes D8. |
| M5 — Wave A (07 AI) | superseded | Now D5. |
| M6 — Wave B (05 Editions) | superseded | Now D4. |
| M7 — Wave C (02 Data + 08 InfoViz) | superseded | Now D2 and D3. |
| M8 — Wave D (04 Web + 01 CS) | superseded | Now D7. |
| M9 — Wave E (03 Semantic Web + 06 Workflows) | superseded | Now D1 (in progress: 03-02 drafted) and D6. |
| M10 — Exercises and cross-linking | pending | |
| M11 — Launch | pending | |

Pre-Milestone-1 setup (knowledge folder, CLAUDE.md, vault mirror, ACTIVE-WORK) is recorded in `journal.md`.

## Related

- `specification.md` (the formal scope this roadmap operationalises)
- `data.md` (the writing queue and vault-backing inventory)
- `architecture.md` (the build pipeline that Milestone 1 stands up)
- `journal.md` (chronological record of completed work and deviations)
- `INDEX.md` (knowledge folder navigation)
