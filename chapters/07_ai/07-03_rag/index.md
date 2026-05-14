---
title: "Retrieval Augmented Generation"
slug: rag
chapter_id: "07-03"
block: "07_ai"
block_title: "AI"
order: 3
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
prerequisites: ["07-02", "07-04"]
next: "07-04"
related: ["07-02", "07-04", "08-03"]
license: CC-BY-4.0
---

# Retrieval Augmented Generation

Lead: RAG combines a retriever with a generator to ground answers in a source corpus. This chapter introduces the architecture (chunk, embed, retrieve, generate), the design choices that decide quality (chunking strategy, retrieval cutoff, reranking), and the DH application: a question-answer interface over an edition or archive.

## Learning Goals

- Describe a RAG pipeline and identify the four design choices that decide quality.
- Build a small RAG system over a DH corpus (edition, register, archive).
- Reason about evaluation (faithfulness, answer relevance, retrieval recall) for a research RAG.
- Recognise where RAG is the wrong tool and a structured query is better.

> Chapter in progress.
