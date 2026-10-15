# Teaching

Reusable learning materials for university teaching and workshops in the Digital Humanities and related professional contexts. Materials connect source work, data, computational practice and generative AI through concrete tasks and verifiable results.

The academic [teaching page](https://chpollin.github.io/teaching/) provides course context and is the intended entry for thematic material discovery. This repository maintains the material. ai-literacies is the AI-related area within the shared collection.

## Editorial direction

The author confirmed the shared university-and-workshop scope on 2026-10-15. The former DH Developer Skriptum continues as source material; its independent writing programme has been incorporated into the Applied Generative AI for Research book. KCE retains its maintained teaching system and is linked where it already provides a suitable unit.

Current code still renders the existing chapter organisation. The broader material entry and generalised learning units are documented implementation work. This direction does not establish subject acceptance of existing drafts.

## Materials

- `_legacy/` contains historical course sources.
- `chapters/` contains existing chapter material.
- `workshops/` contains workshop examples and teaching sources.
- `knowledge/` contains the current editorial contract, integration plan and provenance.
- `site/` and `build.mjs` implement the current site; `docs/` contains generated output.

## Work from the maintained knowledge

Start with [Index](knowledge/INDEX.md), [Project](knowledge/project.md) and [Specification](knowledge/specification.md). [Integration](knowledge/integration.md) describes the academic website relationship. [Plan](knowledge/plan.md) describes the next implementation.

## Existing renderer

With the installed project dependencies:

```sh
npm run validate
npm run build
```

The renderer operates on the current chapter schema. Documentation changes to the broader unit model do not migrate the renderer or its public pages.

## Licence

Original teaching text follows [CC BY 4.0](LICENSE-CC-BY), and original code follows [MIT](LICENSE-MIT). Check the applicable licence and provenance of each reused source or third-party asset. Access and permission to reuse are separate properties.
