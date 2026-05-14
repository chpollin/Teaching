---
title: "DH Developer Skriptum — Data"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
template:
  name: Vorlage Datengrundlage
  version: 0.1
  url: https://dhcraft.org/Promptotyping/promptotyping-document/data
  alias: https://dhcraft.org/Promptotyping/#promptotyping-document-data
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
topics:
  - "[[Data Modelling]]"
---

# DH Developer Skriptum — Data

> **Living Document.** This document is materially incomplete by design until Phase 1. The Per-Chapter Mapping Table and the Legacy URL Mapping are skeletons that fill row-by-row as chapters get stubbed (Phase 1) and as `_legacy/` migration runs (Phase 0a). If a section reads as empty, that emptiness is the current state, not a defect. Updates land here, not in a separate progress document.

## Definition of "Data" Here

The data of this project is the material that feeds each chapter: legacy substrate from the 2022–2023 course materials in `_legacy/`, and conceptual backing from the Obsidian vault.

This document maps substrate and vault documents to chapters and defines the writing-queue order. Chapters with strong substrate plus strong vault-backing are written first; chapters with substrate but no vault-backing trigger a vault-side write beforehand; chapters with neither are written last.

## Substrate Inventory

The `_legacy/` folder (after Phase 0a) contains substrate from eight course units. Substrate is research material; verbatim quotation is forbidden. See `design.md` "Substrate Re-use Policy" for rewrite rules.

| Substrate origin | Lines/files | Strength | Used in block |
|---|---|---|---|
| `_legacy/GDI/` | 11 MDs, ~2250 lines, Linux script dominant | strong | 01 CS Fundamentals, 02 Data (partial) |
| `_legacy/InfoMod/` | 7 MDs, 595 lines, TORDF Python+RDF | strong | 03 Semantic Web |
| `_legacy/WebDev/` | 6 thin MDs + 39 HTML/JS files | mixed (exercises strong, prose thin) | 04 Web |
| `_legacy/TTT/` | 8 MDs + 47 XML/XSL/RNG files | strong | 05 Editions |
| `_legacy/PM_DH/` | 4 MDs, 261-line Git script dominant | strong | 06 Workflows |
| `_legacy/WissMod/` | 1 stub (14 lines) | none | (skip) |
| `_legacy/DataSteward/` | 2 files | weak | 06 Workflows (licenses) |
| `_legacy/Schools/Wuppertal21/` | workshop materials | none | (skip) |

Strong substrates carry the majority of the legacy material's value. The two weak-or-none substrates leave their chapters to be vault-backed only.

## Vault-Backing Inventory

The Obsidian vault at `c:/Users/Chrisi/Documents/obsidian/` provides conceptual backing. Per Phase-1.5 reverification (2026-05-14):

- Strong vault density: Blocks 02 (Data), 05 (Editions), 07 (AI), 08 (InfoViz).
- Medium vault density: Blocks 03 (Semantic Web), 04 (Web), 06 (Workflows).
- Sparse vault density: Block 00 (Foundations, needs synthesis writing) and Block 01 (CS Fundamentals, substrate-dominant).

Per-chapter backings are enumerated when each chapter is taken up in Phase 1.

### Vault Gaps (Phase 1.5 reverification, 2026-05-14)

Four real gaps:

1. Projektmanagement (for Block 06).
2. Datenbanken Grundlagen (for Block 02).
3. Linked Open Data Intro (for Block 03).
4. Semantic Web Intro (for Block 03).

Three partial gaps (existing documents, need extension):

5. Lizenzen: `Coding/Open Source Lizenzierung.md` exists since 2026-05; needs a research-data-license counterpart.
6. REST-APIs Grundkonzepte: `Coding/Webentwicklung/Fetch API.md` exists; conceptual REST page still missing.
7. Claude Code und Tools: `Applied Generative AI/.../Claude Code.md` exists; tool integration patchy.

Phase 1.5 closes these before the corresponding chapters are written.

## Writing Queue

Five waves. Order balances vault density, substrate strength, and didactic position.

| Wave | Blocks | Rationale |
|---|---|---|
| Pilot | 00 Foundations | Calibrates voice; defines vocabulary used everywhere |
| A | 07 AI | Vault-dense, thematically central |
| B | 05 Editions | Doubly backed (vault + TTT substrate) |
| C | 02 Data + 08 InfoViz | Vault-strong, didactically central |
| D | 04 Web + 01 CS Fundamentals | Complementary: vault synthesis + substrate distillation |
| E | 03 Semantic Web + 06 Workflows | Hardest; benefits from Phase 1.5 |

Wave order is recommendation. Deviations are logged in `journal.md`.

## Per-Chapter Mapping Table

Fills as chapters get stubbed in Phase 1. Status `stub` means folder and frontmatter exist with lead and learning goals; `draft` means both paths are written; `published` means a chapter has passed Gate B or Gate C.

| Chapter ID | Title (working) | Block | CT primary | Substrate file | Vault-backing | Status | Notes |
|---|---|---|---|---|---|---|---|
| 00-01 | The Three Literacies | 00 | abstraction | — | AI Literacy folder | stub | Pilot |
| 00-02 | Computational Thinking for the DH Developer | 00 | pattern-recognition | — | Computational Thinking | stub | Pilot |
| 00-03 | Promptotyping as Method | 00 | algorithm-design | — | Promptotyping folder | stub | Pilot |
| 01-01 | Information, Data, Knowledge | 01 | abstraction | GDI_1_Information | DIKW, Kodierung | stub | |
| 01-02 | Character Encoding, Bits & Bytes | 01 | abstraction | GDI_2_Zeichenkodierung | Zeichenkodierung | stub | |
| 01-03 | Shell and Filesystem | 01 | algorithm-design | GDI_0_LinuxUndKonsole | — | stub | Vault sparse |
| 01-04 | Logic and Algorithms | 01 | algorithm-design | GDI_3, GDI_4, GDI_8 | — | stub | Vault sparse |
| 01-05 | How the Internet and Web Work | 01 | abstraction | GDI_9_Internet | — | stub | Vault sparse |
| 02-01 | What Is Data in the Humanities? | 02 | abstraction | — | Forschungsdaten, Daten in den GW | stub | |
| 02-02 | Data Modelling Basics | 02 | abstraction | — | Datenmodellierung | stub | |
| 02-03 | XML Foundations | 02 | abstraction | TTT_1_XML_TEI | Standards und Datenmodelle | stub | |
| 02-04 | JSON and CSV | 02 | pattern-recognition | — | JSON | stub | |
| 02-05 | Authority Data and Controlled Vocabularies | 02 | pattern-recognition | — | Standards und Datenmodelle | stub | |
| 02-06 | Persistent Identifiers | 02 | abstraction | — | Persistent Identifier | stub | |
| 02-07 | FAIR Principles in Practice | 02 | decomposition | — | Research Data Concepts | stub | |
| 02-08 | Metadata and Dublin Core | 02 | pattern-recognition | — | — | stub | Vault gap (Dublin Core dedicated) |
| 03-01 | Semantic Web Intro | 03 | abstraction | InfoMod_0_WebofData_LOD | — | stub | Vault gap (closes in Phase 1.5) |
| 03-02 | RDF Basics | 03 | pattern-recognition | InfoMod_1_RDF | Standards und Datenmodelle | stub | |
| 03-03 | Querying with SPARQL | 03 | algorithm-design | InfoMod_2_SPARQL | Standards und Datenmodelle | stub | |
| 03-04 | Linked Open Data | 03 | pattern-recognition | InfoMod_0_WebofData_LOD | — | stub | Vault gap (closes in Phase 1.5) |
| 03-05 | Ontologies: OWL, CIDOC-CRM, RiC-O | 03 | abstraction | — | Standards und Datenmodelle | stub | |
| 03-06 | Factoid and Prosopography | 03 | abstraction | — | DH Knowledge | stub | |
| 04-01 | Web Architecture | 04 | decomposition | WebDev | — | stub | |
| 04-02 | Semantic HTML | 04 | abstraction | WebDev | Semantic HTML, HTML Living Standard | stub | |
| 04-03 | CSS and Responsive Design | 04 | pattern-recognition | WebDev | CSS, Responsive Web Design | stub | |
| 04-04 | JavaScript and the DOM | 04 | algorithm-design | WebDev | JavaScript folder, DOM | stub | |
| 04-05 | REST APIs and Fetch | 04 | pattern-recognition | WebDev | Fetch API | stub | Partial vault gap (REST conceptual) |
| 04-06 | Static Site Deployment | 04 | decomposition | WebDev | Static Site Deployment | stub | |
| 04-07 | Web Accessibility | 04 | abstraction | WebDev | Web Accessibility | stub | |
| 04-08 | Web Components | 04 | abstraction | WebDev | Web Components | stub | |
| 05-01 | Scholarly Editions | 05 | abstraction | TTT | — | stub | |
| 05-02 | TEI Basics | 05 | pattern-recognition | TTT | — | stub | |
| 05-03 | TEI Critical Apparatus | 05 | abstraction | TTT | — | stub | |
| 05-04 | Prosopography and Registers | 05 | abstraction | TTT | — | stub | |
| 05-05 | IIIF and Image Annotation | 05 | pattern-recognition | TTT | — | stub | |
| 05-06 | HTR and Transcription Workflows | 05 | algorithm-design | TTT | — | stub | |
| 05-07 | Edition Publication | 05 | decomposition | TTT | — | stub | |
| 05-08 | Agentic Editions | 05 | algorithm-design | TTT | — | stub | |
| 06-01 | Git and GitHub | 06 | pattern-recognition | PM_DH | Git und GitHub | stub | |
| 06-02 | Project Management for DH | 06 | decomposition | PM_DH | — | stub | Vault gap (closes in Phase 1.5) |
| 06-03 | Promptotyping as Method | 06 | abstraction | PM_DH | — | stub | |
| 06-04 | Open Source Licensing | 06 | abstraction | PM_DH, DataSteward | Open Source Lizenzierung | stub | Partial vault gap (data licences) |
| 06-05 | Reproducible Pipelines | 06 | algorithm-design | PM_DH | — | stub | |
| 06-06 | CI/CD for Research Code | 06 | algorithm-design | PM_DH | — | stub | |
| 06-07 | Research Data Management | 06 | decomposition | PM_DH | Research Data and Open Science | stub | |
| 06-08 | Documentation Practice | 06 | abstraction | PM_DH | — | stub | |
| 07-01 | LLMs for DH Developers | 07 | abstraction | — | Applied Generative AI | stub | |
| 07-02 | Prompting and Context Engineering | 07 | pattern-recognition | — | Applied Generative AI | stub | |
| 07-03 | Retrieval Augmented Generation | 07 | algorithm-design | — | Applied Generative AI | stub | |
| 07-04 | Embeddings and Semantic Search | 07 | abstraction | — | Applied Generative AI | stub | |
| 07-05 | Coding Agents | 07 | algorithm-design | — | Applied Generative AI | stub | Partial vault gap (Claude Code) |
| 07-06 | AI Literacy and Ethics | 07 | abstraction | — | AI Literacy folder | stub | |
| 08-01 | Information Visualisation Fundamentals | 08 | abstraction | — | — | stub | Vault sparse |
| 08-02 | Charts and Maps for Humanities Data | 08 | pattern-recognition | — | — | stub | Vault sparse |
| 08-03 | Coordinated Multiple Views | 08 | abstraction | — | — | stub | Vault sparse |
| 08-04 | Visualisation for Editions | 08 | abstraction | — | — | stub | Vault sparse |

## Legacy URL Mapping

Old course URLs that need redirect stubs, generated by `build.mjs` step 7. The table is empty until Phase 0a; it is populated from the legacy folder structure.

| Old URL path | New chapter target | Notes |
|---|---|---|

## Workflow for the Writer

When taking a chapter into Phase 1 (stub):

1. Decide the working title.
2. Check `_legacy/` for substrate. Note the file path.
3. Check the Obsidian vault for backing documents. Read them. List the absolute paths.
4. If a vault gap is exposed, log it under "Vault Gaps" and defer the chapter until Phase 1.5 closes the gap.
5. Decide the CT primary based on the block's CT mix (see `specification.md`).
6. Add the row to the per-chapter table.
7. Create the stub folder and `index.md` with frontmatter referencing the paths.

When promoting a chapter from stub to draft:

1. Reread the vault-backing documents.
2. Update the chapter frontmatter `vault_backing[].read_on` to today.
3. Write Long Form first.
4. Distil Short Synthesis.
5. Set `paths.short: true`, `paths.long: true`, `status: draft`.
6. Log the writing session in `journal.md`.

## Related

- `specification.md` (CT distribution targets, frontmatter spec)
- `architecture.md` (legacy URL redirect mechanism, Vault-Drift Protocol)
- `roadmap.md` (waves are Milestones 5–9)
- `journal.md` (writing sessions and deviations)
