# CLAUDE.md — DH Developer Skriptum

Action layer for AI agents working in this repository. Imperative where `knowledge/` is descriptive. Read on session start; load the knowledge folder before writing.

## Identity

This repository is an English DH Developer textbook produced under the Promptotyping method. Forty-five atomic chapters in eight thematic blocks; each chapter has two paths (Short Synthesis and Long Form) and a Computational Thinking marker. The textbook integrates Data, Computational, and AI Literacy and is itself a Promptotyping artefact.

Source of truth is this repository. The Obsidian vault at `c:/Users/Chrisi/Documents/obsidian/` provides research substrate and documents project genesis. Textbook content lives only in the repository.

## Source Documents (read in order on session start)

1. `knowledge/project.md` — what this textbook is
2. `knowledge/specification.md` — formal scope, 45 chapters, Both-Paths Convention, CT distribution, frontmatter schema, quality gates
3. `knowledge/design.md` — voice, sample passages, typography, DE-EN glossary
4. `knowledge/architecture.md` — build pipeline, Vault-Drift Protocol, deployment
5. `knowledge/data.md` — substrate × vault-backing, writing queue
6. `knowledge/user-stories.md` — eight practice roles
7. `knowledge/roadmap.md` — phases, milestones, status
8. `knowledge/INDEX.md` — navigation, project glossary

When fixing a specific failure mode, jump to the document whose function matches it. Reading heuristic in `INDEX.md`.

## Writing Rules

### Language

The textbook is in English. Vault-research is in German. Translate idiomatically, do not calque. Field-specific German terms are introduced once with English explanation; use the DE-EN glossary in `design.md`. Extend the glossary when new terms surface; record additions in `journal.md`.

### Both-Paths Convention

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

The two paths differ in epistemic posture.

Short Synthesis is essayistic: leads with a question, image, or scene; holds one core insight; no subheadings, no bulleted lists, no code blocks longer than three lines; ends with the smallest mental model in one sentence.

Long Form is systematic: numbered subsections, lists where they earn their place, runnable code blocks, worked examples with intermediate state, patient operational voice.

Acceptance test: Short answers *what and why*; Long answers *how*.

Write Long first; distil Short afterwards.

Length envelope: Short 400–700 words; Long 1500–3500 words. Hard caps: Short ≤ 700, Long ≤ 3500. A chapter exceeding 3500 is split into two chapters. The build script measures and warns; after Quality Gate C, out-of-envelope is hard fail.

### CT-Marker

Each chapter opens with a blockquote naming one of four Computational Thinking operations (Decomposition, Pattern Recognition, Abstraction, Algorithm Design) and a framing question:

```markdown
> **CT in focus:** Abstraction — How do we represent every writing system using only on/off states?
```

The question is not the chapter title rephrased.

Per-block target mix is in `specification.md`. Per-chapter assignment is in `data.md`.

### Vault-Backing Citation

Cite vault concepts inline with wikilinks: `[[Concept Name]]`. The renderer turns this into a link.

Frontmatter `vault_backing` is a list of objects with `path` and `read_on`:

```yaml
vault_backing:
  - path: "c:/Users/Chrisi/Documents/obsidian/Research Data and Open Science/Concepts/Zeichenkodierung.md"
    read_on: 2026-05-14
```

Vault paragraphs are not copied verbatim. The textbook is new text written from substrate, not a translation. See Vault-Drift Protocol in `architecture.md`: when revising a chapter, reread the backing and update `read_on`.

### Substrate Re-use

Legacy material under `_legacy/` is substrate. Three classes (see `design.md` "Substrate Re-use Policy"):

- Exercise substrate: translate carefully, keep didactic shape, modernise tooling where it has shifted.
- Content substrate: treat as research notes. Rewrite from scratch.
- Code substrate: modernise to current conventions, run, then include.

A chapter's Long Form opening reads as if substrate did not exist. Recognisable paragraphs from substrate mean an incomplete rewrite.

### Voice

- Second person singular for the reader (`you encode`, `you write`).
- Active verbs.
- One idea per paragraph.
- Vary sentence length.
- Technical terms introduced once with name and brief sense.
- Code blocks runnable or marked as pseudocode. Linux/macOS prompts marked `$`; PowerShell `PS>`; output without prompt.
- Worked examples carry intermediate state.
- Cross-reference chapters by slug and title (`see [02-03_data-modelling]`).

## Forbidden

- Emojis in chapter text, knowledge documents, journal, or commit messages.
- Dashes (em or en) as punctuation in textbook prose. Use commas, parentheses, colons, or two sentences instead.
- AI-filler phrases: "In conclusion", "Let us delve into", "It is worth noting", "Importantly", "It should be mentioned", "In this section we will explore".
- Hedging unless uncertainty is real.
- Quoting vault paragraphs verbatim.
- Quoting substrate paragraphs verbatim.
- Editing files in `_legacy/`.
- Time estimates in the knowledge base, journal, or roadmap.
- Personal contact data of third parties. Use roles.
- Concrete monetary amounts. Use hour quotas, invoice status, payment terms.
- Bypassing pre-commit hooks (`--no-verify`) without explicit user authorisation.
- Force-pushing to `master` without explicit user authorisation.

## Quality Gates Before Promoting a Chapter to `published`

A chapter advances from `draft` to `review` when:

1. `npm run build` succeeds with zero validator errors for the chapter.
2. Both paths exist and respect the length envelope.
3. CT marker has both operation and question; the question is non-generic.
4. `related:` lists at least three existing chapters.
5. Exercises are concrete; at least one runs end-to-end on a fresh machine.
6. A journal entry exists for the writing session with date and writer.

A chapter advances from `review` to `published` after a wave Quality Gate C passes (with the chapter in the spot-check sample) or after an external reviewer signs off in `journal.md`.

Full Quality Gate criteria (A skeleton, B pilot, C wave, D launch) are in `specification.md`.

## Working with Git

- Create new commits rather than amending. Pre-commit-hook failures mean the commit did not happen — fix and create a new commit.
- Stage files by name, not `git add -A`.
- Phase 0 splits into three thematic commits, in order: (1) Migration; (2) Architecture; (3) Promptotyping layer.
- Do not push to `master` without explicit user authorisation when destructive operations are involved.
- Commit messages: imperative mood, English, subject under 70 characters, blank line, body explains *why* not *what*.

## When to Ask the User

Ask before deciding when the decision affects scope, sequence, granularity, conflict resolution, or architecture. Specifically: before adding or removing a block, before changing the eight-block taxonomy, before redefining the Both-Paths Convention, before adding chapters beyond 45, before pushing destructive git operations.

## When to Write Without Asking

Producing chapter content per specification; fixing typos; adjusting word counts to envelope; fixing broken cross-references; adding to the glossary; journalising a session; updating `read_on` dates on a re-read of a backing. These are routine and within established conventions.

## Vault Connection

The vault at `c:/Users/Chrisi/Documents/obsidian/` is research substrate and project documentation. Two files in the vault are updated from repository sessions:

- `Projects/dh-developer-skriptum/Project Overview DH Developer Skriptum.md`: update when a phase completes or a major decision is made.
- `ACTIVE-WORK.md`: update the project entry when the milestone advances.

Vault-backing chapters reference vault documents read-only. Do not modify a vault document because of a chapter's needs; if the vault document is wrong or incomplete, write a vault gap note in `knowledge/data.md`.

## Tool Use

- Prefer specialised tools over Bash: Read for known paths, Glob for patterns, Grep for content search, Edit/Write for file changes.
- Do not re-read a file you just edited.
- Run independent tool calls in parallel.
- Use TodoWrite for tasks with three or more discrete steps. Mark items complete as soon as done.

## Distillation

The Promptotyping principle: maximum information with minimum tokens. Each knowledge document carries one function. Redundancy across documents is replaced by links. Important content sits in the first sentences and the last. Refactor when a document drifts.

The rule applies to chapter content. Short Synthesis is distillation; Long Form is exposition; both serve the reader's time.

## Related

- `knowledge/INDEX.md`
- `knowledge/specification.md`
- `knowledge/design.md`
- `knowledge/roadmap.md`
- `knowledge/journal.md`
- `c:/Users/Chrisi/Documents/obsidian/Vault Operations/Konventionen/Konvention Promptotyping Documents.md`
