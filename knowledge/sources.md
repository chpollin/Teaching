---
title: "DH Developer Skriptum — Sources"
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

# Sources

Central source list for the knowledge folder. Individual documents reference here rather than maintain their own bibliography sections. This is the project-level bibliography, not a chapter-level "Further Reading" — chapter-level references live in each chapter's own `## Further Reading` section.

## Method and Theory

Wing, J. M. (2006). *Computational Thinking.* Communications of the ACM 49(3), 33–35. [foundational definition of CT]

DHCraft (2025). *Promptotyping Method.* https://dhcraft.org/Promptotyping/ [the method this textbook is itself an artefact of]

Sahle, P. (2016). *What is a Scholarly Digital Edition?* In: Driscoll, M. J. & Pierazzo, E. (eds.), *Digital Scholarly Editing: Theories and Practices*. Open Book Publishers. [reference for Block 05 Editions]

Borgman, C. L. (2015). *Big Data, Little Data, No Data: Scholarship in the Networked World.* MIT Press. [epistemic frame for the literacy trias]

## Design and Voice

Williams, R. (2008). *The Non-Designer's Design Book.* Peachpit Press, 3rd ed. [layout principles informing the visual stance]

Bringhurst, R. (2013). *The Elements of Typographic Style.* Hartley & Marks, 4th ed. [typography baseline]

DHCraft (2025). *Design System.* Internal reference. [hellgrau/schwarz/teal palette]

## Static Site Architecture

GitHub Pages documentation. https://docs.github.com/en/pages

CommonMark Specification. https://commonmark.org/

`marked` (Markdown parser). https://marked.js.org/

`gray-matter` (YAML frontmatter parser). https://github.com/jonschlinkert/gray-matter

Lunr.js (client-side search). https://lunrjs.com/

## Practice-Role Backing

Reference projects mentioned in `user-stories.md`:

- Stefan Zweig Digital — https://stefanzweig.digital/
- Notker Edition — https://gams.uni-graz.at/notker
- ZBZ-OCR-TEI — https://github.com/chpollin/zbz-ocr-tei
- M³GIM — Modellierung der Malaniuk-Geschichten in Memoriam
- SuGW — Sozialgeschichte des urbanen Gerichts in Wien
- HerData — Klassik Stiftung Weimar correspondence data
- Forschungsleitstelle — multi-agent orchestration model

## Conventions referenced

- [[Konvention Project Overview]] (vault)
- [[Konvention Promptotyping Documents]] (vault)
- [[Konvention anchor-project]] (vault)
- [[Konvention Forschungsleitstelle Lane Protocol]] (vault)

## Citation Style for Chapters

Each chapter's `## Further Reading` follows a hybrid style:

- Academic: `Author, Year. Title. Venue.` (DOI or stable URL inline)
- Web: footnote with access date in `YYYY-MM-DD` form
- Vault concepts: `[[Concept]]` wikilinks resolve to vault-mirror paths in the repo
- Code: cite the tool name + version + URL

Examples and exact templates in `design.md` (forthcoming "Citation Style" section).

## Maintenance

- Sources are added when used. Unused entries are not removed eagerly — another document may still reference them.
- Project-level sources (this document) versus chapter-level Further Reading: keep separate, no overlap.
- Vault-backing references in chapter frontmatter are private research traces and do not appear here.
