---
title: "Reproducible Pipelines"
slug: reproducible-pipelines
chapter_id: "06-05"
block: "06_workflows"
block_title: "Workflows"
order: 5
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
  secondary: [decomposition]
paths:
  short: false
  long: false
topics: []
vault_backing: []
substrate:
  - "_legacy/PM_DH/"
prerequisites: ["01-03", "06-01"]
next: "06-06"
related: ["02-07", "06-06", "06-07"]
license: CC-BY-4.0
---

# Reproducible Pipelines

Lead: A reproducible pipeline survives the developer. This chapter covers the operational pattern: declared dependencies, scripted steps, parameterised runs, captured outputs, and the discipline of writing a pipeline that a colleague can rerun in three years.

## Learning Goals

- Declare dependencies (pinned versions, lockfiles, container images) and explain the trade-offs.
- Script a multi-step pipeline (Make, Snakemake, shell, Python) with clear inputs and outputs.
- Parameterise and version a run so it can be reproduced exactly.
- Recognise the three failure modes of irreproducible work and apply countermeasures.

> Chapter in progress.
