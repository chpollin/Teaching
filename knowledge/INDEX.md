---
title: Index
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

# Index

Teaching maintains learning materials shared across university courses and workshops. Current identity, editorial requirements and website relationships are owned by the documents below. The documents use the repository convention without a separate local schema version.

## Current reading path

1. [Project](project.md) establishes purpose, audience and project relationships.
2. [Handoff](handoff.md) records any received input awaiting integration.
3. [Specification](specification.md) defines content areas, learning units and acceptance.
4. [Integration](integration.md) defines the academic website relationship.
5. [Plan](plan.md) describes the pending implementation sequence.
6. [Journal](journal.md) records the provenance of integrated changes.

## Existing implementation and source documents

| Document | Use under the shared Teaching direction |
|---|---|
| [Architecture](architecture.md) | Prior description of the chapter renderer. Verify against code before technical work |
| [Data](data.md) | Historical substrate and chapter mapping. Inspect original sources before reuse |
| [Design](design.md) | Existing textbook design and writing proposals. Evaluate against the actual target interface |
| [User stories](user-stories.md) | Historical DH Developer reader scenarios that may inform a concrete unit |
| [Sources](sources.md) | Bibliographic leads requiring full-text checks for newly written claims |
| [Roadmap](roadmap.md) | Superseded textbook milestones. Current work follows Plan |
| [Dissertation integration](diss-integration.md) | Superseded D-programme and possible source relationships for book work |
| [Cheat sheet](cheat-sheet.md) | Historical textbook writing instructions. Current action layer governs new work |
| [Changelog](CHANGELOG.md) | Dated knowledge-base changes |

The former chapter totals, mandatory dual-path writing programme and textbook acceptance milestones are superseded by the author decisions of 2026-10-15. Retained source documents preserve the earlier design. Their normative statements apply only to the old textbook context. Current requirements are in Specification. Existing machine-enforced chapter rules remain current renderer contracts until implementation changes them.

## Material locations

- `_legacy/` preserves historical course sources.
- `chapters/` holds the existing chapter material in its renderer-compatible format.
- `workshops/` holds workshop sources and examples.
- `site/` and `build.mjs` implement the current presentation.
- `docs/` contains generated output.

## Terms

### Learning unit

A maintained teaching object connecting a learning outcome, material, task and inspectable evidence.

### Course or workshop selection

A contextual sequence of unit references with its own audience and teaching circumstances.

### ai-literacies

The AI-related area within Teaching, grounded in the vault competence profile and connected to existing method and KCE sources.

### Material reference

A public description and link to a maintained unit, with the information needed to identify its purpose, language and prerequisites.
