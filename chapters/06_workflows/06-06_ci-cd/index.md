---
title: "CI/CD for Research Code"
slug: ci-cd
chapter_id: "06-06"
block: "06_workflows"
block_title: "Workflows"
order: 6
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
  secondary: [pattern-recognition]
paths:
  short: false
  long: false
topics: []
vault_backing: []
substrate:
  - "_legacy/PM_DH/"
prerequisites: ["06-01", "06-05"]
next: "06-07"
related: ["04-06", "06-01", "06-05"]
license: CC-BY-4.0
---

# CI/CD for Research Code

Lead: Continuous integration and deployment move quality checks from human memory to a workflow file. This chapter introduces GitHub Actions, the discipline of pre-commit hooks, automated tests, and the static-site deploy pipeline that ships an edition or a documentation site on every push.

## Learning Goals

- Read a GitHub Actions workflow and explain its triggers, jobs, and steps.
- Write a CI workflow that runs tests, validates data, and deploys a static site.
- Apply pre-commit hooks for formatting and linting without blocking the writer.
- Recognise CI/CD as a research-data quality gate, not only an engineering practice.

> Chapter in progress.
