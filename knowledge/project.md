---
title: "DH Developer Skriptum — Project"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
template:
  name: Vorlage Projekt-Wissensdokument
  version: 0.1
  url: https://dhcraft.org/Promptotyping/promptotyping-document/project
  alias: https://dhcraft.org/Promptotyping/#promptotyping-document-project
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
topics:
  - "[[Digital Humanities]]"
  - "[[Computational Thinking]]"
  - "[[AI Literacy]]"
  - "[[Data Literacy]]"
  - "[[Promptotyping]]"
knowledge-sources:
  institutions:
    - label: "Centre for Information Modelling, University of Graz"
      url: https://informationsmodellierung.uni-graz.at/
    - label: "DHCraft"
      url: https://dhcraft.org/
  methods:
    - label: "Promptotyping Method"
      url: https://dhcraft.org/Promptotyping/
    - label: "Computational Thinking (Wing 2006)"
      url: https://doi.org/10.1145/1118178.1118215
---

# DH Developer Skriptum — Project

## Scope

An English-language textbook for the Digital Humanities Developer. Forty-five atomic chapters in eight thematic blocks. Each chapter has two H2 sections (Short Synthesis and Long Form) and is framed by one Computational Thinking operation. The textbook is published as a static site on GitHub Pages and developed under the Promptotyping method.

The project is a refactor of `chpollin/Teaching`, a German-language collection of course materials from 2022 and 2023. Existing material is moved to `_legacy/` and serves as research substrate; no substrate is quoted verbatim.

## Not in Scope

- Introductory text for readers who do not intend to build artefacts.
- A Python textbook with humanities examples. Code is one of three literacies.
- An introduction to machine learning. AI Literacy is treated operationally.
- A translation of the German substrate. Substrate is research material.

## Mission

The reader who finishes the textbook can: model humanities data in a chosen format and ontology, operate a Linux toolchain, transform data between formats, deploy a static site, build a TEI edition with an XSLT pipeline, manage a research project with version control and clear licensing, operate generative AI as a working tool, and visualise the result.

Output target: capacity to apply the Promptotyping method to a self-defined research artefact.

## The Literacy Trias

The textbook treats three literacies as one practice with three lenses.

**Data Literacy** is the capacity to read, structure, model, and license data — knowing what a dataset is, what a controlled vocabulary provides, when XML is preferable to CSV, what a persistent identifier commits to.

**Computational Literacy** is the capacity to operate computational systems — using a shell, version-controlling code, transforming formats with scripts, deploying a static site, running a pipeline.

**AI Literacy** is the capacity to operate generative AI as a tool — writing prompts that distil knowledge, recognising LLM hallucination, knowing which research operations LLMs support and which they damage, building harnesses with discipline.

The three literacies share a methodological core: Computational Thinking — Decomposition, Pattern Recognition, Abstraction, Algorithm Design — applied equally to data modelling, code, and prompt design. Each chapter foregrounds one CT operation.

## Rationale

Three pressures motivate the project.

First, generative AI has changed the operational profile of a humanities developer's work: prompt engineering, agent harnesses, and LLM-assisted curation are now research tools. Teaching materials are not yet adjusted.

Second, the existing `chpollin/Teaching` substrate is fragmented across courses, dated, and German-only. Consolidation is required.

Third, the DHCraft consultancy practice and the Applied Generative AI working group (AGKI-AG) produce practical knowledge — on AI harnesses, edition pipelines, the Promptotyping method itself — without a teaching home.

## Audience

Eight practice-driven reader roles, detailed in `user-stories.md`: Edition Builder, Research Data Engineer, Cultural-Heritage Tool Maker, AI-Augmented Researcher, Knowledge Graph Builder, Teaching Adopter, Self-Learner, Coding Agent. Each role brings concrete DH project tasks; stories drive chapter design choices.

The Short path serves first-encounter readers and Self-Learners on a new topic. The Long path serves practising readers executing tasks. Both paths are written for every chapter.

## Method

The textbook is itself a Promptotyping artefact. Its knowledge base is in `knowledge/`, its action layer in `CLAUDE.md`, its substrate in `_legacy/`, its build pipeline in `build.mjs`. Every writing session is recorded in `journal.md`. Quality gates with mechanical and human acceptance criteria are specified in `specification.md`.

## Source-of-Truth Rule

The repository is canonical. The Obsidian vault at `c:/Users/Chrisi/Documents/obsidian/` mirrors the project for personal knowledge management and provides research substrate, but textbook content lives only in the repository.

Vault-backing references (`vault_backing:` in chapter frontmatter) are dated research traces with a `read_on` field, not live dependencies. The Vault-Drift Protocol in `architecture.md` describes the handling.

## Visibility

The site is public from the first push to `master`. GitHub Pages serves `chpollin.github.io/Teaching/` as soon as the build runs, including while most chapters are stubs. Stubs carry a "Chapter in progress" marker with a link to `_legacy/` substrate where present.

## Success Criteria

- Forty-five chapters published with both paths, CT-marker, exercises, cross-references.
- A reader can complete the Short path through a block in one sitting and the Long path over a week.
- At least three academic articles or blog posts cite the textbook as a teaching resource within twelve months of launch.
- The textbook is referenced by the DHCraft training portfolio.
- The build pipeline remains under 200 lines without becoming a maintenance burden.

## Related

- `specification.md` (formal scope)
- `design.md` (voice and form)
- `roadmap.md` (operational sequence)
- `user-stories.md` (reader roles)
- [[Project Overview DH Developer Skriptum]] (vault mirror)
- [[Promptotyping]] (method)
- [[Applied-GenerativeAI MOC]] (AI Literacy entry point)
