---
title: "Coding Agents"
slug: coding-agents
chapter_id: "07-05"
block: "07_ai"
block_title: "AI"
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
vault_backing:
  - path: "c:/Users/Chrisi/Documents/obsidian/Applied Generative AI/"
    read_on: 2026-05-14
substrate: []
prerequisites: ["07-02"]
next: "07-06"
related: ["06-03", "07-02", "07-06"]
license: CC-BY-4.0
---

# Coding Agents

Lead: Coding agents (Claude Code, Cursor, agentic IDEs) move LLMs from advisor to executor. This chapter introduces the agent loop (perception, planning, action, tool use), the operational discipline of working with an agent, and the new role of the DH developer as supervisor and reviewer.

## Learning Goals

- Describe an agent loop and the tools an agent typically has (file edit, shell, web fetch).
- Run a coding agent on a small DH task (data clean-up, schema migration, viewer scaffold).
- Apply the discipline of context curation (CLAUDE.md, prompts, memory).
- Reason about safety, review effort, and when to refuse an agent's suggestion.

> Chapter in progress. Closes partial vault gap "Claude Code Tutorial" planned in Phase 1.5.
