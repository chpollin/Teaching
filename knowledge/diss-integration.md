---
title: "DH Developer Skriptum — Dissertation and Grounded-Vault Integration"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
status: active
created: 2026-07-23
updated: 2026-07-23
language: en
version: 0.1
authors: ["Christopher Pollin"]
---

# DH Developer Skriptum — Dissertation and Grounded-Vault Integration

Plan document for the content-filling programme decided 2026-07-23. It supersedes the wave order in `roadmap.md` Phase 3 (deviation logged in `journal.md`); the phases, quality gates, and both-paths rules of `specification.md` and the substrate rules of `design.md` remain in force unchanged. Read this document together with `roadmap.md`; the old milestones M10 and M11 stay the tail of the programme.

## Decision Summary

Three decisions, taken by the operator on 2026-07-23:

1. **The author's dissertation becomes the third substrate source.** Pollin, C. (2025): *Modelling, Operationalising and Exploring Historical Information*, University of Graz (published, unipub). Its chapters map onto the textbook blocks (table below). The dissertation text is registered as external substrate and is not committed to this public repository; chapters cite it in Further Reading.
2. **A Grounded Vault instance becomes the evidence layer.** A new repository (working name `skriptum-vault`) is instantiated from the template `DigitalHumanitiesCraft/grounded-vault`. Sources (dissertation chapters, course materials, slides, external literature) are processed into representations, distillates, and atomic claims with machine-checkable anchors. Chapter-writing agents work from the claim layer instead of raw sources.
3. **Grounding depth is substrate-layer.** Distillates and claims serve as evidenced substrate for chapter writing; the textbook chapters themselves stay readable teaching prose without anchor apparatus. Auditability lives in the claim layer, reachable via each chapter's `substrate` frontmatter.

## Source Inventory

Two source families beyond the existing `_legacy/` substrate and vault backing.

**Dissertation chapters to blocks:**

| Diss. chapter | Textbook blocks | Note |
|---|---|---|
| 2 DEPCHA | 03, 05 (worked example throughout) | Bookkeeping Ontology, TEI-to-RDF |
| 3 Historical Information | 00, 02 (02-01, 02-02) | theoretical foundation |
| 4 Modelling | 02, 03 (03-05), 05 | core, multiply connected |
| 5 Operationalising | 03 (complete), 02-06, 02-07 | pilot 03-02 already written from it; covers the two former vault gaps (Semantic Web Intro, LOD Intro) on the substrate side |
| 6 Exploring | 08, 03-03 | Block 08 was substrate-less before |
| 7 LLMs | 07 | scholarly grounding for the vault-dense AI block |

**Teaching corpus to blocks** (courses per chpollin.github.io/teaching, materials in their course repos):

| Course area | Textbook block |
|---|---|
| Grundlagen der Informatik | 01 CS Fundamentals |
| Data Steward, Library and Information Studies | 02 Data |
| Informations- und Wissensmodellierung; Semantic Web und LOD; Advanced Information Modelling | 03 Semantic Web |
| Webentwicklung (incl. Agentic Coding) | 04 Web |
| TEI Text Encoding; Knowledge Engineering in DH | 05 Editions |
| Angewandte GenKI im Forschungsprojektmanagement | 06 Workflows (closes the former Projektmanagement vault gap) |
| Angewandte GenKI und Prompt Engineering | 07 AI |
| Informationsvisualisierung | 08 InfoViz |

With these two families, every block has at least one strong substrate source. The per-source inventory (concrete repos, files, slide decks per course) is compiled in milestone D0 and recorded in this document.

## Milestones D0 to D8

Numbering `D` to avoid collision with `roadmap.md` M1 to M11. M1 and M2 are complete; D0 to D8 replace the old M3 to M9 sequence; M10 and M11 follow unchanged, with M10 extended by a chapter-against-claims consistency pass.

**Recurring inner structure of every block milestone (D1 to D8):**

1. *Grounding.* Work the block's sources into the vault instance: stable representations with block anchors (`00_representation`), one distillate per source (`10_distillates`), atomic cross-source claims with a topic MOC (`20_claims`). Exit: `tools/validate.py` green.
2. *Writing.* Chapters in this repository from the claim layer, per Both-Paths Convention; chapter frontmatter `substrate` points to the claim documents.
3. *Checking.* Skriptum validator green, Gate C (envelope, voice spot-check against `design.md`, cross-references), machine review over the new claims.

| # | Milestone | Sources | Output |
|---|---|---|---|
| D0 | Foundation | — | `skriptum-vault` instantiated (SETUP.md parameters: topic backbone = the eight blocks; source types dissertation, course material, slides, literature); dissertation full text acquired locally; per-course source inventory compiled; this document updated; pilot 03-02 reviewed by operator; voice lessons folded into `design.md` |
| D1 | Block 03 Semantic Web | Diss. ch. 5 and 2; InfoMod legacy; courses Semantic Web und LOD, Informations- und Wissensmodellierung, Advanced Information Modelling | 5 chapters (03-02 exists) plus grounded claim base |
| D2 | Block 02 Data | Diss. ch. 3 and 4; Data Steward, Library and Information Studies | 8 chapters |
| D3 | Block 08 InfoViz | Diss. ch. 6; course Informationsvisualisierung | 4 chapters |
| D4 | Block 05 Editions | Diss. ch. 4 and 2; TTT legacy; courses TEI, Knowledge Engineering in DH | 8 chapters |
| D5 | Block 07 AI | Diss. ch. 7; GenKI and Prompt Engineering courses | 6 chapters |
| D6 | Block 06 Workflows | GenKI im Forschungsprojektmanagement; PM_DH legacy | 8 chapters |
| D7 | Blocks 01 CS + 04 Web | Grundlagen der Informatik, GDI legacy; Webentwicklung, WebDev legacy | 13 chapters |
| D8 | Block 00 Foundations | Dissertation triad Modelling/Operationalising/Exploring as frame (content decision with operator before writing) | 3 chapters |

Order rationale: strongest substrate first; D1 first also calibrates the vault architecture against the finished pilot chapter before it scales. The order is operator-changeable; deviations are journalised.

## Agent Model

Three Opus waves per milestone under a single orchestrator; delegation stays flat (no agent spawns agents).

- **Distill wave.** One agent per source produces representation and distillate. Anchor conventions and prohibition lists are passed verbatim in the task.
- **Claim and write wave.** Claim agents per topic work cross-source; source conflicts are marked `contested`, never smoothed. Then one chapter agent per chapter, equipped with claim MOC, vault-backing paths, and the `design.md` voice rules including anti-patterns.
- **Review wave.** A machine-review agent (which wrote none of it) checks claims adversarially; a Gate C spot-check runs over the chapters. The orchestrator verifies every agent self-report against the real file and validator state before committing; commits and pushes happen per milestone.

Operator touchpoints: provide the dissertation full text, review pilot 03-02, gate verdict per milestone, expert spot-checks in the claim layer at will.

## Open Operator Points

1. Source of the dissertation full text (unipub download or author's copy). The 2026-07-23 session worked from a pasted excerpt of chapter 5 (up to section 5.1.7, truncated).
2. Review of pilot chapter 03-02 (gates D0).
3. Confirmation or reordering of D1 to D8.

## Related

- `roadmap.md` (M-milestones; D-programme replaces M3 to M9)
- `data.md` (substrate inventory; dissertation registered there 2026-07-23)
- `specification.md` (quality gates, both-paths convention, unchanged)
- `design.md` (voice and substrate re-use policy, unchanged)
- `journal.md` (2026-07-23 entries: pilot chapter, this plan)
- Template repository: https://github.com/DigitalHumanitiesCraft/grounded-vault
