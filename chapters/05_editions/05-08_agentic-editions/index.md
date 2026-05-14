---
title: "Agentic Editions"
slug: agentic-editions
chapter_id: "05-08"
block: "05_editions"
block_title: "Editions"
order: 8
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
template:
  name: chapter
  version: 0.1
  url: https://dhcraft.org/Promptotyping/promptotyping-document/chapter
  alias: https://dhcraft.org/Promptotyping/#promptotyping-document-chapter
status: stub
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
ct_markers:
  primary: algorithm-design
  secondary: [abstraction]
paths:
  short: false
  long: false
topics: []
vault_backing: []
substrate:
  - "_legacy/TTT/"
prerequisites: ["05-06", "07-01"]
next: "06-01"
related: ["05-06", "07-01", "07-05"]
license: CC-BY-4.0
---

# Agentic Editions

Lead: Recent LLMs make agentic edition pipelines feasible: a Coding Agent transcribes from IIIF, structures the result in TEI, annotates entities, and produces a release candidate that a human edits. This chapter introduces the pipeline pattern, the cost of trust, and the editorial discipline that survives automation.

## Learning Goals

- Describe an agentic edition pipeline (IIIF, HTR, TEI structuring, entity linking, review).
- Identify which steps an agent can own and which require an editor.
- Apply quality controls (sampling, divergence checks, gold sets) to an agentic run.
- Place agentic editions in the wider question of scholarly authorship and trust.

> Chapter in progress.
