---
title: Integration
project:
  name: Teaching
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
status: draft
created: 2026-10-15
updated: 2026-10-15
language: en
---

# Integration

Teaching supplies maintained material targets to the academic website. The website owns public teaching context and material discovery; the material remains at its canonical source.

## Counterpart

The counterpart is `chpollin/chpollin.github.io`. Its existing `content/teaching.json` and `content/teaching/*.json` describe university teaching and continuing education. Existing course data already link to chapter and historical material targets in this repository.

## Public information architecture

| Entry | User question | Content owner |
|---|---|---|
| University teaching | Which course is this, where does it take place, and what is taught? | Academic website and institutional sources |
| Teaching materials | What can I learn or reuse on this topic? | Teaching supplies units; academic website supplies concise discovery text and links |
| Course material references | What material belongs to this session? | Course context on the academic website, linked unit at its canonical source |

The existing teaching page gains a material entry alongside the course overview. A first implementation can use ordinary links to verified material targets. A dedicated catalogue data format is introduced only when the actual selected material needs it. Free workshop materials appear through this material entry; their presence creates no institutional course attribution.

## Ownership contract

| Information | Maintained source | Permitted projection |
|---|---|---|
| Institutional title, programme and offering | Website course dataset with institutional evidence | Course overview and detail page |
| Unit text, exercise, data and media provenance | Teaching unit or explicitly linked canonical KCE source | Link and concise description |
| Material identifier, title, target, language and topic | Maintained material record in Teaching, once implemented | Material overview and course references |
| Short public selection and navigation | Academic website | Teaching page |
| Material review and reuse evidence | Material-owning repository | Accurate public qualification where needed |

## Minimal material reference

A material reference identifies a stable unit, its readable title, canonical target, language, topic, prerequisites or level and a short purpose. The public access indication and reuse licence remain distinct. Review evidence is preserved at the source. The actual structured field names must be agreed with the existing validators before a catalogue is implemented.

No network request is required to render the public core. The website uses explicit locally maintained references for the first integration. If a generated export later becomes useful, its format, source and build checks are specified before adoption. A live cross-repository dependency is unnecessary for the initial material links.

## Handover and checks

Teaching provides a reviewed target and the evidence required for its public description. The website verifies the target, institutional attribution and generated link. Replacing a target requires checking all local consumers and existing public addresses. Course metadata, unit text and institutional claims remain editable at their respective maintained sources.

Acceptance requires a working path from teaching overview to material, consistent title and language, accurate source attribution and preserved existing course links. A navigation mock-up establishes proposed behaviour. Only a source change plus a successful build and browser inspection establishes implemented behaviour.

## Publication boundary

The 2026-10-15 author decision establishes the shared editorial direction. Source content, rights, subject acceptance and publication are assessed for the actual material. This integration document neither proves a completed material migration nor changes the published website.

## Related

- [Project](project.md)
- [Specification](specification.md)
- [Plan](plan.md)
- [Academic website knowledge index](https://github.com/chpollin/chpollin.github.io/blob/master/knowledge/INDEX.md)
