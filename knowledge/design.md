---
title: "DH Developer Skriptum — Design"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
template:
  name: Vorlage Design
  version: 0.1
  url: https://dhcraft.org/Promptotyping/promptotyping-document/design
  alias: https://dhcraft.org/Promptotyping/#promptotyping-document-design
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
topics:
  - "[[Information Visualisation]]"
  - "[[Scholar-Centered Design]]"
  - "[[Typografie]]"
---

# DH Developer Skriptum — Design

## Design Principles

- Quiet surface, generous whitespace, sober typography, one accent colour.
- No animations, no popovers, no marketing affordances.
- Mobile rendering is the same content reflowed, not a stripped-down version.
- Interface elements support reading; they do not foreground themselves.

Visual anchor: DHCraft minimalism. Light grey surface (`#d5d5d5`), white content panel (`#ffffff`), black text (`#111111`), single accent for active states and CT-marker badge (`#0a7d6b` teal). Inter for UI and Short Synthesis, Source Serif Pro for Long Form prose, JetBrains Mono for code.

## Voice — General

- Second person singular when addressing the reader (`you encode`, `you write`).
- Active verbs. Where passive voice creeps in, decide whether the agent matters; if yes, name them.
- One idea per paragraph.
- Vary sentence length.
- Technical terms introduced once with conventional name and brief sense, then used freely. Glossary at chapter end is the safety net.
- No filler phrases: "It is worth noting", "Importantly", "In conclusion", "Let us delve into", "It should be mentioned".
- No hedging unless uncertainty is real.
- No emojis.
- No dashes (em or en) as punctuation. Where the German original used an em-dash for parenthetical insertion, use commas, parentheses, or a colon. Where it used em-dash for emphasis, break into two sentences.

## Voice — Short Synthesis

Essayistic, single-figure, conversational without being chatty.

- Lead with a question, an image, or a small concrete scene. Not with a definition.
- Hold one core insight throughout. If two insights pull, the chapter is two chapters.
- No subheadings, no bulleted lists, no code blocks longer than three lines.
- End with the smallest mental model the reader carries away in one sentence.

## Voice — Long Form

Patient, operational, systematic.

- Numbered subsections (`### 1. ...`, `### 2. ...`). Three to six per chapter.
- Bulleted lists where they earn their place: enumerations of more than four items, parallel cases, definitions of distinct things.
- Code blocks runnable or marked as pseudocode. Linux/macOS commands prefixed with `$`; Windows PowerShell with `PS>`; output without prompt.
- Worked examples carry intermediate state.
- Cross-reference other chapters by slug and title; the renderer turns these into links.

## Sample Passages

Anchors for voice calibration. Future chapters compared against these for tone.

### Sample Short Synthesis (excerpt, ~150 words)

> Why does your name in a database not match itself?
>
> The student record says "Müller, Anna"; the alumni file says "Mueller, Anna"; the conference badge prints "Anna Müller". A computer treating these as strings has three different people. A human reading them has one. Somewhere between the two, a decision was made: that *the same name* is the same name even when its bytes differ.
>
> That decision is *encoding*. It is the small, invisible contract that says a Codepoint U+00FC ("ü") stands for the letter you would write by hand, regardless of whether it was typed on a German keyboard, an American keyboard with an Option key, or a Latin-1 system that knew nothing of Unicode.
>
> Encodings are old, plural, and politically charged: they record who in the world was thought worth representing in computing, and when. The smallest mental model: a character is not a thing, it is a *codepoint plus an encoding*. Lose one, lose the character.

### Sample Long Form opening (excerpt, ~200 words)

> ### 1. The Problem of Representation
>
> Computers store and transmit numbers. A character, the letter `A`, the punctuation mark `.`, the symbol `λ`, the emoji `🜂`, is not a number. To put a character into a file, an email, or a database column, you need a contract that maps characters to numbers and back.
>
> That contract has two parts. First, a character set: an inventory of characters, each assigned a unique number called a codepoint. The Unicode character set assigns codepoint `U+00FC` to `ü`, codepoint `U+0041` to `A`, codepoint `U+1F702` to `🜂`. Second, an encoding: a rule for turning codepoints into bytes that a machine can actually store. UTF-8 encodes `U+00FC` as two bytes, `0xC3 0xBC`; UTF-16 encodes the same codepoint as two bytes in a different sequence; Latin-1 uses one byte but cannot represent codepoints above 255.
>
> A file is bytes. Bytes mean nothing without an encoding. If you read a UTF-8 file as Latin-1, you do not see `ü`. You see `Ã¼`. The bytes have not changed; the contract has been read wrong.

The two passages handle the same atom from different positions. Short treats encoding as a political and cognitive phenomenon. Long treats encoding as a technical mechanism with named parts.

## Anti-Voice

Negative examples calibrate as much as positive ones. The passages below are what the textbook does *not* sound like.

### Anti-Pattern A — Generic Textbook Voice

> In this chapter, we will explore the fascinating topic of character encoding. Encoding is a very important concept in computer science. As we will see, there are many different encodings, each with their own strengths and weaknesses. It is worth noting that the most popular encoding today is UTF-8, but other encodings like Latin-1 are still widely used. Let us delve into the details.

What is wrong. Filler phrases ("fascinating", "very important", "as we will see", "it is worth noting", "let us delve into"), passive vagueness ("are still widely used"), no concrete image, no specific claim, hedging without reason. The reader learns nothing in 70 words.

### Anti-Pattern B — Marketing Voice

> Master character encoding! In this comprehensive chapter, you will discover the secrets of UTF-8, Latin-1, and Unicode. Whether you are a beginner or an experienced developer, this guide will revolutionise how you handle text data. By the end, you will be encoding like a pro!

What is wrong. Imperative-with-exclamation register, false stakes ("revolutionise"), unearned promise ("encoding like a pro"), audience pandering. A textbook is not an advertisement.

### Anti-Pattern C — Padded Long Form

> ### 1. Introduction
>
> Encoding is the process by which characters are converted into bytes so that computers can store and transmit them. This is an important topic in digital humanities because humanists work with text, and text must be encoded for it to be processed by computers. In the following sections, we will discuss the history of encodings, their structure, and their use in digital humanities projects.

What is wrong. Tautology ("Encoding is the process by which characters are converted into bytes"), justification by audience ("important, because humanists work with text"), forward-pointing without delivering ("we will discuss"). The reader is told a chapter is coming, not given a chapter.

### Anti-Pattern D — Short That Should Be Long

> Character encoding is critical. UTF-8 is the most common. Always check your encoding. Bad encoding causes bugs. Use UTF-8 everywhere.

What is wrong. Short Synthesis is not a bullet list of headlines. The figure is missing: no question, no scene, no insight, just declarative assertions. Short is essayistic, not telegraphic.

### Anti-Pattern E — Long That Should Be Short

> ### 1. Foundations of Character Representation
>
> The question of how to represent character information in computational systems is a complex topic that touches on history, linguistics, politics, software engineering, mathematical foundations, and design philosophy. To approach this topic comprehensively, we will first examine the history of computational representation from the earliest punched-card systems through the development of ASCII in the 1960s, the rise of code pages in the 1970s and 1980s, the development of ISO standards in the late 1980s, and finally the unification under Unicode beginning in 1991, including the ongoing evolution of the Unicode Consortium's work.

What is wrong. Sweeping setup without anchor, history dump as substitute for argument, single sentence eats 80 words on table-of-contents content. Long Form is patient and operational, not encyclopedic.

### How to use these anti-patterns

When a draft chapter feels off, compare it to A through E. If it matches one, rewrite. If a section is hard to compare, that section is probably also off, in a way not yet catalogued. Add the new anti-pattern here and journal the addition.

## Typography

- Sans-serif (Inter): UI, navigation, Short Synthesis prose, table cells, code-block captions, glossary headwords.
- Serif (Source Serif Pro): Long Form prose, exercise text, further reading.
- Monospace (JetBrains Mono): code blocks, inline code, file paths, CLI prompts.

Sizes, base 16px:

| Element | Size | Line height |
|---|---|---|
| Long Form body | 18px / 1.125rem | 1.7 |
| Short Synthesis body | 17px | 1.6 |
| H1 chapter title | 32px | 1.2 |
| H2 path heading | 24px | 1.3 |
| H3 subsection | 20px | 1.35 |
| Code block | 15px | 1.55 |
| Sidebar navigation | 14px | 1.5 |
| CT-marker | 16px italic | 1.5 |

Long Form body is larger and more open than Short Synthesis body, reflecting different reading postures.

## Colour Tokens

| Token | Hex | Use |
|---|---|---|
| `--bg-surface` | `#d5d5d5` | Page background outside content panel |
| `--bg-content` | `#ffffff` | Content panel |
| `--bg-code` | `#f4f4f4` | Code blocks, inline code |
| `--text-primary` | `#111111` | Body text |
| `--text-muted` | `#666666` | Captions, dates, metadata |
| `--accent` | `#0a7d6b` | Active nav, CT-marker badge, focused link |
| `--accent-soft` | `#e4f0ee` | CT-marker background, callout-info background |
| `--border` | `#cccccc` | Hairline rules, table dividers |

Dark mode deferred to Phase 5.

## Components

- **Block tile** (home page): card with block number, title, two-sentence intro, chapter count, status.
- **Chapter card** (block page): chapter number, title, lead sentence, CT-marker badge, status indicator.
- **CT-marker badge**: pill with operation name (Dec / Pat / Abs / Alg) in `--accent` on `--accent-soft`.
- **Path tab switcher**: two tabs at chapter top, "Short Synthesis" and "Long Form". Choice persists in `localStorage`. Default for first visit is Long; default for returning visit is the path last chosen.
- **Cross-reference link**: text link with `→` prefix and target chapter slug. Hover shows the target chapter's lead sentence.
- **Glossary headword**: bold sans-serif, followed by definition in serif. Linked to chapter where the term is introduced.
- **Search overlay**: keyboard shortcut `Cmd/Ctrl+K`, modal over content, results grouped by block.
- **Status marker**: banner at chapter top when status is not `published`, naming the status and linking to substrate or vault-backing if relevant.

## DE-EN Terminology Glossary

The glossary stabilises German source terminology in English. "Use" is the canonical choice; "Avoid" lists tempting calques.

| Deutsch | Use | Avoid |
|---|---|---|
| Auszeichnung (TEI/XML) | markup | annotation |
| Apparat (kritischer Apparat) | apparatus (critical apparatus) | commentary |
| Anmerkungsapparat | note apparatus | footnote system |
| Befund (TEI editions) | reading | finding |
| Beleg (philology) | attestation | evidence |
| Bestand (archive) | holdings | inventory |
| Datensatz | record | dataset (whole collection only) |
| Datenmodell | data model | model |
| Datenmodellierung | data modelling | data design |
| Editionswissenschaft | scholarly editing | editorial science |
| Erschließung | description (archival), processing | indexing |
| Fassung | version | recension (specific philological cases only) |
| Forschungsdaten | research data | scholarly data |
| Forschungsfrage | research question | inquiry |
| Forschungsumgebung | research environment | research platform |
| Geisteswissenschaften | humanities | the arts |
| Geschichtswissenschaft | history (as discipline) | historical science |
| Handschrift | manuscript | hand-written |
| Kollation | collation | comparison |
| Lemma | lemma | headword (dictionary context only) |
| Metadaten | metadata | meta-information |
| Normdaten | authority data | normative data |
| Provenienz | provenance | origin |
| Quelle (historical) | source | resource |
| Repräsentation | representation | depiction |
| Sammlung | collection | gathering |
| Schreibhand | scribal hand | writer's hand |
| Sigel (text-critical) | siglum (plural sigla) | abbreviation |
| Textgenese | textual genesis | text history |
| Textzeuge | textual witness | testimony |
| Überlieferung | transmission | tradition (avoid except in religious contexts) |
| Variante | variant | alternative |
| Verzeichnung | description (archival) | listing |
| Wissensbestand | body of knowledge | knowledge inventory |

The glossary extends as chapters surface new terms. Additions are recorded in `journal.md`.

## Substrate Re-use Policy

Substrate under `_legacy/` is research material. Three classes:

- **Exercise substrate**: concrete tasks validated by classroom use. Translate, keep didactic shape, modernise tooling only where it has shifted.
- **Content substrate**: explanatory prose from old course materials. Treat as research notes. Rewrite from scratch with the new voice.
- **Code substrate**: Python, shell, RDF examples. Modernise to current language conventions, run them, then include.

The Long Form opening of any substrate-backed chapter reads as if substrate did not exist. If a reader who has read the substrate can recognise paragraphs, the rewrite is incomplete.

## Related

- `project.md`
- `specification.md`
- `architecture.md`
- `../CLAUDE.md` (action layer, socialises on this document)
- [[Scholar-Centered Design]]
- [[Information Visualisation]]
