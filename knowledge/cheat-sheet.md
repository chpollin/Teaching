---
title: "DH Developer Skriptum — Cheat Sheet"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
---

# Cheat Sheet

Operational rules on one page. When writing a chapter or editing a knowledge document, follow these. Rationale lives in the linked source document.

## Five Non-Negotiable Rules

1. **Both-Paths Convention.** Every chapter has Short Synthesis (essayistic, single figure, no subheadings, 400–700 words) and Long Form (systematic, numbered subsections, 1500–3500 words). Two takes on one atom, not two lengths. Long written first, Short distilled from Long. See `specification.md` and `design.md`.
2. **CT Marker is mandatory.** Every chapter opens with a blockquote naming one of four operations (Decomposition, Pattern Recognition, Abstraction, Algorithm Design) and a framing question. The question is not the title rephrased. See `specification.md` "CT-Marker Distribution".
3. **Vault-backing is dated, not live.** Each entry is `{ path, read_on }`. When revising a chapter, re-read backings, update `read_on`. See `architecture.md` "Vault-Drift Protocol".
4. **Substrate is research material, never quoted verbatim.** Long Form openings must read as if substrate did not exist. See `design.md` "Substrate Re-use Policy".
5. **Source of truth is the repo.** The vault mirror documents the project; the textbook content lives only here.

## Forbidden List

- Emojis in chapter text or knowledge documents
- Dashes (em or en) as punctuation
- AI-filler phrases ("In conclusion", "Let us delve into", "It is worth noting", "Importantly")
- Quoting vault paragraphs verbatim
- Quoting substrate paragraphs verbatim
- Editing `_legacy/` content
- Time estimates anywhere in the knowledge base or journal
- Personal contact data of third parties (use roles)

## Frontmatter Required Fields

```yaml
title, slug, chapter_id, block, block_title, order
project, method, template, status
created, updated, language, version, authors
ct_markers (primary + secondary), paths (short + long)
```

Plus: `vault_backing[]` with `path` and `read_on`, `substrate[]`, `prerequisites`, `next`, `related`, `license`. See `specification.md` "Chapter Frontmatter".

## Length Envelope

- Short Synthesis: 400–700 words (hard cap 700)
- Long Form: 1500–3500 words (hard cap 3500 — if longer, split into two chapters)

`build.mjs` warns pre-Gate C, hard-fails post-Gate C.

## Quality Gates

| Gate | When | Source |
|---|---|---|
| A — Skeleton | After Phase 1 | `specification.md` |
| B — Pilot | After Phase 2 | `specification.md` |
| C — Wave | After each Phase 3 wave | `specification.md` |
| D — Launch | Phase 5 | `specification.md` |

Each gate has mechanical and human checks.

## Writing Sequence per Chapter

1. Decide working title + check substrate + check vault-backing
2. Decide CT primary from block target (see `specification.md`)
3. Add row to per-chapter table in `data.md`
4. Create stub folder + `index.md` with full frontmatter
5. Write Long Form (3–6 numbered subsections, runnable code, worked examples)
6. Distil Short Synthesis (one figure, essayistic, no subheadings)
7. Write exercises, further reading, glossary, related
8. Set `paths.short: true`, `paths.long: true`, `status: draft`
9. Log session in `journal.md`

## Voice in Two Lines

- **Short:** essayistic, single-figure, conversational without being chatty. Lead with question or scene, end with smallest mental model.
- **Long:** patient, operational, systematic. Numbered subsections, runnable code, worked examples.

Sample passages in `design.md`. Negative examples in `design.md` "Anti-Voice".

## Sources

Central list in `sources.md`. Linked from individual documents.
