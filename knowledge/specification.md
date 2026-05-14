---
title: "DH Developer Skriptum — Specification"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
template:
  name: Vorlage Specification
  version: 0.1
  url: https://dhcraft.org/Promptotyping/promptotyping-document/specification
  alias: https://dhcraft.org/Promptotyping/#promptotyping-document-specification
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
topics:
  - "[[Requirements Engineering]]"
  - "[[Computational Thinking]]"
---

# DH Developer Skriptum — Specification

## Scope

Forty-five atomic chapters in eight thematic blocks. Each chapter has two paths (Short Synthesis and Long Form) and is framed by one Computational Thinking operation. Blocks are sequential by didactic order and cross-linked; readers may follow the spine or enter at a thematic block.

The site is rendered statically by `build.mjs` and served by GitHub Pages. Search uses Lunr.js. No backend, no database.

## The Eight Blocks

| ID | Title | Chapters | Substrate origin |
|---|---|---|---|
| 00 | Foundations | 3 | Vault (new) |
| 01 | Computer Science Fundamentals | 5 | GDI (Linux script) |
| 02 | Data | 8 | Vault, fragments from GDI |
| 03 | Semantic Web | 6 | InfoMod (TORDF) |
| 04 | Web | 8 | WebDev (39 HTML/JS files) |
| 05 | Editions | 8 | TTT (TEI walkthroughs) |
| 06 | Workflows | 8 | PM_DH (Git script) |
| 07 | AI | 6 | Vault (AGKI-AG, Applied GenAI) |
| 08 | InfoViz | 4 | Vault (Information Visualisation) |

Block 0 is the pilot block. It defines vocabulary used by other blocks: the literacy trias, Computational Thinking, and the Promptotyping method.

Block titles, chapter slugs, and per-chapter mapping (substrate file, vault-backing path, CT-marker primary, prerequisites) are recorded in `data.md`.

## Both-Paths Convention

### Mandatory Form

Every chapter is one `index.md` with two H2 sections in order:

```markdown
# Chapter Title

> **CT in focus:** <Operation> — <question>

## Short Synthesis
[400–700 words]

## Long Form
[1500–3500 words, 3–6 numbered subsections]

## Exercises
## Further Reading
## Glossary
```

### Functional Difference

The two paths differ in epistemic posture, not in content scope.

**Short Synthesis is essayistic.** It poses a question, develops one core insight through one or two concrete examples, and ends with the smallest mental model. No subheadings, no bulleted lists, no code blocks longer than three lines.

**Long Form is systematic.** It defines, structures, and operationalises the same atom. Numbered subsections. Lists where they earn their place. Worked examples with intermediate state.

Acceptance test: a reader who has read only Short knows *what* the chapter is about and *why*; a reader who has read Long knows *how* to do the thing. Neither path is a summary or expansion of the other.

### Writing Sequence

Long is written first. Short is distilled from Long. This sequence is enforced because distillation from full material is honest, while padding a Short into a Long produces thin Long sections.

### Length Envelope

The build script measures word counts. Out-of-envelope chapters fail the build with a warning until Quality Gate C, then with a hard fail. Hard caps: Short ≤ 700, Long ≤ 3500. A chapter that exceeds 3500 is split into two chapters.

## CT-Marker Distribution

Each chapter opens with one Computational Thinking operation as primary lens, framed as a blockquote question. The four operations:

- **Decomposition** (Dec): breaking a problem into parts solvable independently.
- **Pattern Recognition** (Pat): seeing the same shape recur across instances.
- **Abstraction** (Abs): choosing what to keep and what to ignore in a model.
- **Algorithm Design** (Alg): sequencing operations to produce a reliable result.

Target distribution: roughly even across the four operations (approximately eleven chapters per primary operation, given 45 chapters).

Per-block primary mix:

| Block | Chapters | Suggested primary mix |
|---|---|---|
| 00 Foundations | 3 | Abs, Pat, Alg |
| 01 CS Fundamentals | 5 | mostly Abs (encoding, file system, processes), some Alg |
| 02 Data | 8 | Abs (modelling), Dec (normalisation), Pat (vocabularies) |
| 03 Semantic Web | 6 | Abs (ontology), Pat (RDF patterns) |
| 04 Web | 8 | Dec (separation of concerns), Alg (request-response, build) |
| 05 Editions | 8 | Abs (markup as model), Pat (apparatus patterns) |
| 06 Workflows | 8 | Alg (Git, CI, pipelines), Dec (project decomposition) |
| 07 AI | 6 | Alg (agent loops), Abs (prompt patterns), Pat (LLM behaviour) |
| 08 InfoViz | 4 | Abs (visual encoding), Pat (chart families) |

Concrete primary-and-secondary assignment per chapter is recorded in `data.md`.

CT-marker text template: `> **CT in focus:** <Operation> — <question that frames the chapter through that lens>`. The question is not the chapter title rephrased.

## Chapter Frontmatter

Required fields:

```yaml
---
title: "Chapter Title"
slug: chapter-slug
chapter_id: "01-02"
block: "01_cs_fundamentals"
block_title: "Computer Science Fundamentals"
order: 2
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
status: stub  # stub | draft | review | published
created: YYYY-MM-DD
updated: YYYY-MM-DD
language: en
version: 0.1
authors: ["Christopher Pollin"]
ct_markers:
  primary: abstraction
  secondary: [decomposition]
paths:
  short: false
  long: false
topics:
  - "[[Vault Concept]]"
vault_backing:
  - path: "c:/Users/Chrisi/Documents/obsidian/.../Concept.md"
    read_on: YYYY-MM-DD
substrate:
  - "_legacy/GDI/.../source.md"
prerequisites: ["01-01"]
next: "01-03"
related: ["02-02", "05-01"]
license: CC-BY-4.0
---
```

The frontmatter validator (`build.mjs`) enforces field presence and types: `title`, `chapter_id`, `block`, `order`, `status`, `template`, `ct_markers.primary`, `paths.short`/`paths.long` as booleans. A missing or mistyped field fails the build with the file path.

`vault_backing` is a list of objects with `path` and `read_on`, not bare paths. This implements the Vault-Drift Protocol (see `architecture.md`).

## Quality Gates

Four gates, each with mechanical and human acceptance criteria. The build script performs mechanical checks; human checks are recorded in `journal.md`.

### Gate A — Skeleton Pass (after Phase 1)

Mechanical:
- `npm run build` succeeds with zero validator errors.
- Every chapter folder has `index.md`.
- Every frontmatter has all required fields.
- `chapters.json` lists exactly 45 chapters.

Human (recorded in `journal.md`):
- Every chapter has a 1–3 sentence lead in the body.
- Every chapter has 3–5 learning goals as a bulleted list.
- Every chapter has either a `vault_backing` entry or an explicit `vault_backing: []` with a `lücken-notiz` field.

### Gate B — Pilot Pass (after Phase 2)

Mechanical:
- All three Block 0 chapters have `paths.short: true` and `paths.long: true`.
- Word counts of Short are 400–700; word counts of Long are 1500–3500.
- CT-marker exists and contains both the operation and a question.
- `related:` contains at least three valid chapter IDs.

Human (recorded in `journal.md`):
- External reading by a domain-near person; written feedback summarised in `journal.md` with date and reviewer role.
- Voice-consistency check across the three chapters by one reviewer reading in sequence.
- `design.md` updated with any voice or terminology decisions surfaced by the pilot.

### Gate C — Wave Pass (after each Phase 3 wave)

Mechanical:
- All chapters in the wave have both paths complete and respect the length envelope (hard fail).
- CT distribution after the wave tracks the target mix from `data.md`.
- No broken cross-references.

Human (recorded in `journal.md`):
- Spot-check of two random chapters against `design.md` voice rules.
- Review of CT-marker questions for non-genericity.

### Gate D — Launch Pass (Phase 5)

Mechanical:
- All 45 chapters at status `published`.
- Search index covers every chapter with non-empty hits for chapter titles.
- Mobile rendering tested in Chrome, Firefox, Safari (last two versions).

Human (recorded in `journal.md`):
- Two to three external test readers, each reads 5+ chapters.
- Feedback structured in three columns: works, doesn't, surprised. Folded into a Gate D journal entry.

## Forbidden

- Emojis in chapter text or knowledge documents.
- Dashes (em or en) as punctuation in textbook prose.
- AI-filler phrases: "In conclusion", "Let us delve into", "It is worth noting", "Importantly".
- Quoting vault paragraphs verbatim.
- Quoting substrate paragraphs verbatim.
- Editing `_legacy/` content.
- Time estimates anywhere in the knowledge base or journal.
- Personal contact data of third parties. Use roles.

## Decisions

Append-only record of architectural decisions.

**2026-05-14 — Both-paths convention with functional differentiation.** Separate Short and Long files were rejected because they would double the frontmatter surface and risk drift. Both paths live in one file, differentiated by epistemic posture (essayistic vs. systematic), not by content scope.

**2026-05-14 — CT distribution engineered, not improvised.** The original "at least one different operation per block" rule was rejected because it permitted all chapters in a block to share the same primary CT. The block-level guideline above sets primary mix per block; `data.md` makes the per-chapter assignment explicit.

**2026-05-14 — Vault-backing as dated reference, not live dependency.** Backing references are research traces (`path` + `read_on`), not links to evolving documents. See `architecture.md` Vault-Drift Protocol.

**2026-05-14 — Phase 1 reduced to minimal stubs.** The original plan required full outlines for all 45 chapters before the pilot; this risked stylistic drift between pre-pilot outlines and post-pilot voice. Phase 1 now creates minimal stubs (frontmatter + 1-sentence lead). Outlines are written when each block is taken up.

**2026-05-14 — Phase 0 splits into three thematic commits.** One for migration (`git mv` to `_legacy/`), one for architecture (folders, `build.mjs`, `site/`), one for Promptotyping layer (`knowledge/`, `CLAUDE.md`). Keeps `git blame` legible on substrate files.

## Related

- `project.md` (identity)
- `data.md` (per-chapter assignments)
- `design.md` (voice and form)
- `architecture.md` (build, Vault-Drift Protocol)
- `roadmap.md` (operational sequence)
- `journal.md` (decisions in chronological context)