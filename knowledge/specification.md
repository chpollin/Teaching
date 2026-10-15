---
title: Specification
project:
  name: Teaching
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
status: draft
created: 2026-05-14
updated: 2026-10-15
language: en
---

# Specification

Teaching organises reusable units around an observable learning outcome, a concrete task and inspectable evidence. A course or workshop selects these units for its audience; topic navigation offers a second way into the same material.

## Content areas

| Area | Learning purpose | Existing source locations to inspect |
|---|---|---|
| Computational foundations | Understand representations and operate a reproducible computing environment | `_legacy/GDI`, `chapters/01_cs_fundamentals` |
| Data and knowledge modelling | Structure, model, query and document data | `_legacy/InfoMod`, `_legacy/WissMod`, `_legacy/DataSteward`, `chapters/02_data`, `chapters/03_semantic_web` |
| Web and research artefacts | Build and inspect an accessible digital artefact | `_legacy/WebDev`, `chapters/04_web` |
| Digital editions | Encode, transform and critically inspect textual sources | `_legacy/TTT`, `chapters/05_editions` |
| Research workflows | Organise sources, versioned work and reproducible transformations | `_legacy/PM_DH`, `chapters/06_workflows` |
| Information visualisation | Choose and evaluate visual encodings against source data | `chapters/08_infoviz` |
| ai-literacies | Apply and evaluate generative AI in a defined domain task | `chapters/07_ai`, workshop sources, the vault curriculum profile and suitable KCE units |

The locations establish material provenance, not completeness or quality. Topic labels can evolve with observed retrieval needs. Existing chapter identifiers and addresses remain stable until an explicit migration maps their consumers.

## ai-literacies curriculum

The vault document `Projects/Teaching/ai-literacies.md` owns the competence profile and its theoretical links. Its three paths map to Teaching as follows.

| Path | Entry task | Inspectable performance | Reuse boundary |
|---|---|---|---|
| Understand and evaluate generative AI | Compare outputs for a domain question or extract structured information from a source image | Distinguish observations, generated claims, verified values and unresolved cases | VetMedAI is source material; examples, rights and domain assumptions require review |
| Develop artefacts through Promptotyping | Describe a small research or teaching artefact, build an iteration and inspect it against explicit requirements | Relate requirements, data, implementation and acceptance evidence | Prefer the established method and existing KCE material; a local task explains its audience-specific adaptation |
| Organise knowledge and projects with AI harnesses | Prepare a bounded source collection and document an allowed reading or write-back operation | Trace a claim to its source and verify a resulting change against its authorised scope | KCE owns its maintained teaching basis; Grounded Vault and Research Mission Control retain their method definitions |

Information and Data Literacy, Computational Thinking, verification and critical reflection cross these paths. Units identify the prerequisites they actually need. Tool-specific instructions carry the source and context needed for later revision.

## Learning unit contract

| Element | Required editorial content |
|---|---|
| Identity | Stable identifier, readable title, language and canonical material target |
| Audience and situation | Role, domain task, prior knowledge and context-specific assumptions |
| Learning outcome | Observable action and the evidence by which it can be assessed |
| Learning material | Explanation or worked example with public sources and explicit source boundaries |
| Task | Input, permitted assistance, expected output and instructions sufficient to attempt the task |
| Assessment | Separate formal, source-based and professional criteria; unresolved cases remain visible |
| Reflection | Limits, omissions and relevant ethical, infrastructure or institutional constraints |
| Reuse evidence | Material origin, licence, third-party exceptions and generalisation changes |
| Media | Optional links to slides, video, code or data serving the same unit |
| Relationships | Prerequisites, related units and course or workshop uses |
| Review evidence | What was checked, against which source, and what the responsible person accepted |

This is an editorial contract. A machine-readable catalogue and its parser remain implementation work. Until then, a unit can express the contract as ordinary Markdown. Optional media create no obligation to produce slides or video for every unit. Existing material keeps its language; translation follows a concrete teaching use and carries a relation to the maintained source.

## Reuse and evidence

A public URL establishes access. Reuse additionally requires compatible rights and a traceable origin. Context-specific branding, institution-specific instructions, sensitive examples and assumed domain knowledge are checked before a workshop unit is generalised. Third-party material retains its own terms. Local text and code follow their repository licences where applicable.

Learning performance is assessed through the learner's own task under stated AI assistance. A polished artefact alone establishes no individual competence gain. Claims of gain additionally require an appropriate baseline comparison, as described in the vault's literacy model.

## Existing renderer compatibility

`build.mjs` currently reads `chapters/` and validates `title`, `slug`, `chapter_id`, `block`, `block_title`, `order`, `status`, `ct_markers` and `paths`. It recognises `stub`, `draft`, `review` and `published`, and uses the existing Computational Thinking vocabulary. Existing chapter pages use Short Synthesis and Long Form sections and renderer length envelopes.

These are current renderer contracts. The broader learning-unit contract does not change them by documentation alone. Existing pages keep their metadata and body structure until a tested renderer migration supports another form. Former fixed chapter totals, balanced marker quotas, whole-book length obligations and D-milestones no longer define Teaching completion.

## Acceptance scenarios

- A learner enters through a course page and reaches the correct canonical unit with its task and prerequisites.
- A learner enters through a topic and can identify the appropriate level and material language without knowing the internal folder layout.
- A teacher reuses a unit after checking sources, rights and context; the adaptation identifies its origin and didactic change.
- A course and a workshop refer to the same unit without copying its text into portfolio data.
- A KCE reference opens the maintained KCE resource; a local adaptation preserves the relationship to that source.
- An existing public course or material address continues to resolve after navigation changes.

## Validation and acceptance

Technical validation covers metadata, links, escaping, keyboard access and current rendering. Source review checks factual claims against the material actually read. Subject acceptance and publication remain with the responsible human. A unit is described only at the stage the evidence supports. The next implementation must provide a focused check that fails when a published material target is missing or assigned to the wrong source.

## Related

- [Project](project.md)
- [Integration](integration.md)
- [Plan](plan.md)
- [Architecture](architecture.md)
