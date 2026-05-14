---
title: "DH Developer Skriptum — User Stories"
project:
  name: dh-developer-skriptum
  repository: https://github.com/chpollin/Teaching
method:
  name: Promptotyping
  url: https://dhcraft.org/Promptotyping/
template:
  name: Vorlage User Stories
  version: 0.1
  url: https://dhcraft.org/Promptotyping/promptotyping-document/user-stories
  alias: https://dhcraft.org/Promptotyping/#promptotyping-document-user-stories
status: active
created: 2026-05-14
updated: 2026-05-14
language: en
version: 0.1
authors: ["Christopher Pollin"]
topics:
  - "[[Scholar-Centered Design]]"
  - "[[User Stories]]"
---

# DH Developer Skriptum — User Stories

## Reader Roles by DH Developer Practice

Roles are organised by the kind of work the reader does in a DH project, not by reading style. A single person can occupy multiple roles across a career. Roles are derived from project archetypes in the DHCraft portfolio: scholarly editions, research-data infrastructure, cultural-heritage tooling, AI-augmented research workflows, knowledge-graph construction, plus three cross-cutting roles (teaching adopter, self-learner, coding agent).

| Role | Working context | Builds | Reads |
|---|---|---|---|
| Edition Builder | scholarly edition project | TEI edition with reading interface, apparatus, IIIF facsimiles | 02 Data, 05 Editions, 04 Web |
| Research Data Engineer | research-data infrastructure | pipelines, controlled vocabularies, FAIR-compliant publishing | 01 CS, 02 Data, 06 Workflows |
| Cultural-Heritage Tool Maker | museum, archive, library | research tool over a collection, interactive viewers | 02 Data, 03 Semantic Web, 04 Web, 08 InfoViz |
| AI-Augmented Researcher | any DH project using LLMs | prompt pipelines, agent harnesses, LLM-assisted curation | 00 Foundations, 07 AI, 06 Workflows |
| Knowledge Graph Builder | prosopography, semantic enrichment, LOD | RDF data, SPARQL endpoints, Wikidata enrichment | 02 Data, 03 Semantic Web, 08 InfoViz |
| Teaching Adopter | university DH program | course modules, exercises, citable chapters | structural overview, sample chapters |
| Self-Learner | own time, no course | a working skill in a chosen area | depends on track |
| Coding Agent | machine-reading the textbook | grounded citations, structured references | frontmatter, JSON, chapters |

Anti-roles (whom the textbook does not target) are listed at the end.

## Role Descriptions and Stories

Stories follow the form: *As a <role>, I want <capability>, so that <benefit>*.

## Priority Stories per Role

For quality-gate review, three priority stories per role serve as acceptance baseline. A chapter that fails a priority story for a role it claims to serve goes back to draft. Other stories are *additional*: they refine the role but do not gate acceptance.

| Role | Priority Story Numbers (in order below) |
|---|---|
| Edition Builder | 1 (manuscript-TEI relationship), 3 (critical apparatus modelling), 7 (deployment to static site) |
| Research Data Engineer | 1 (format choice), 4 (FAIR principles concretely), 7 (Python/shell pipelines reliably) |
| Cultural-Heritage Tool Maker | 2 (standard ontologies), 3 (coordinated views), 7 (accessibility standards) |
| AI-Augmented Researcher | 1 (precise prompts), 2 (fabrication vs. retrieval), 8 (Critical-Expert-in-the-Loop) |
| Knowledge Graph Builder | 1 (RDF as data model), 3 (SPARQL against Wikidata), 5 (factoid model for source-criticism) |
| Teaching Adopter | 1 (machine-readable licence), 2 (stable permalinks + citation), 6 (block overviews) |
| Self-Learner | 1 (self-check questions), 2 (recommended order + prerequisites), 3 (reference solutions) |
| Coding Agent | 1 (stable frontmatter schema), 2 (stable chapter IDs), 4 (public JSON data files) |

Priority numbers refer to the order of stories under each role section below. Story selection is revisable: if a chapter wave consistently surfaces a different priority for a role, update this table and journal the change.

### Edition Builder

A scholar or developer working on a digital scholarly edition. Corpus is letters, a manuscript codex, a critical edition with apparatus, a literary or archival corpus. Reference projects in DHCraft's authoring practice: Stefan Zweig Digital, Notker Psalter Edition, ZBZ-OCR-TEI, EditionCrafter, teiCrafter.

- As an Edition Builder, I want to understand the relationship between manuscript, transcription, and TEI markup so that I can model my source faithfully and reproducibly.
- As an Edition Builder, I want a clear workflow from PDF or image input to a structured TEI edition so that I can plan a project realistically.
- As an Edition Builder, I want to model a critical apparatus (witnesses, variants, sigla) in TEI so that scholarly judgement is preserved in machine-readable form.
- As an Edition Builder, I want to render TEI to a reading interface with selectable layers so that readers can switch between scholarly views.
- As an Edition Builder, I want to integrate IIIF manifests for facsimile delivery so that my edition connects to library infrastructure.
- As an Edition Builder, I want to apply OCR or HTR sensibly, including how to validate output, so that I can scale transcription without losing trust in the result.
- As an Edition Builder, I want a deployment path from TEI source to public static site so that my edition is citable and persistent on a modest budget.
- As an Edition Builder, I want to understand where LLM assistance helps and where it harms so that I integrate AI without compromising scholarship.

### Research Data Engineer

A developer or data steward maintaining or building research-data infrastructure: ingest, transformation, curation, vocabularies, FAIR-compliant publication. Reference projects: HerData (Klassik Stiftung Weimar correspondence data), SuGW (medieval legal records), Klawiter rescue work in DIA-XAI.

- As a Research Data Engineer, I want to model humanities data in appropriate formats (XML, JSON, RDF, CSV) so that I can choose the right shape for the job.
- As a Research Data Engineer, I want to build reconciliation and enrichment pipelines against Wikidata, GND, GeoNames so that data gains durable identifiers and external linkage.
- As a Research Data Engineer, I want to design controlled vocabularies and authority data structures so that domain meaning is encoded.
- As a Research Data Engineer, I want to apply FAIR principles concretely so that my data is durable and reusable.
- As a Research Data Engineer, I want to use version control for data, not just code, so that data history is auditable and recoverable.
- As a Research Data Engineer, I want to publish data to trusted repositories with proper metadata so that data is citable and findable.
- As a Research Data Engineer, I want to write Python or shell pipelines that transform between formats reliably so that workflows are reproducible.
- As a Research Data Engineer, I want to use LLMs for data-curation tasks with appropriate human review so that I scale curation without losing quality.

### Cultural-Heritage Tool Maker

A developer building a research tool or public interface over a cultural collection. Institution is a museum, archive, library, or research centre. Reference projects: M³GIM (archival data on Ira Malaniuk), CorrespExplorer, Notker Edition's layer interface.

- As a Cultural-Heritage Tool Maker, I want to choose between a static site and a dynamic application based on collection size and update frequency.
- As a Cultural-Heritage Tool Maker, I want to model collection metadata in standard ontologies (CIDOC-CRM, RiC-O, Dublin Core) so that my tool is interoperable.
- As a Cultural-Heritage Tool Maker, I want to build coordinated views (map, timeline, network, list) of a collection so that researchers can explore from multiple angles.
- As a Cultural-Heritage Tool Maker, I want my tools to work on modest infrastructure so that institutions can sustain them long-term.
- As a Cultural-Heritage Tool Maker, I want to integrate IIIF for image delivery and APIs for federated search.
- As a Cultural-Heritage Tool Maker, I want to handle multilingual data so that institutions with international audiences can use my tool.
- As a Cultural-Heritage Tool Maker, I want my interface to meet accessibility standards so that the tool reaches its public.
- As a Cultural-Heritage Tool Maker, I want to license collection data and code separately and clearly so that downstream reuse is possible.

### AI-Augmented Researcher

A scholar or developer integrating generative AI into a humanities research workflow. Not training models; using frontier LLMs as tools. Reference frameworks: the Promptotyping method, Forschungsleitstelle as multi-agent orchestration, AGKI-AG community knowledge.

- As an AI-Augmented Researcher, I want to write prompts that frame a research task precisely so that LLM output is reusable.
- As an AI-Augmented Researcher, I want to recognise when an LLM is fabricating versus retrieving so that I do not propagate confabulations into scholarship.
- As an AI-Augmented Researcher, I want to build small agent harnesses for repeatable research operations so that LLM use becomes infrastructure.
- As an AI-Augmented Researcher, I want to apply Promptotyping or comparable methods so that I have a disciplined process for LLM-assisted artefact development.
- As an AI-Augmented Researcher, I want to evaluate LLM output against human gold standards so that I can defend AI use to peer review.
- As an AI-Augmented Researcher, I want to integrate LLMs into pipelines via APIs so that AI use is operational.
- As an AI-Augmented Researcher, I want to understand the licensing, provenance, and ethics of LLM use so that I make defensible choices.
- As an AI-Augmented Researcher, I want to use Critical-Expert-in-the-Loop patterns so that AI scale meets scholarly judgement.

### Knowledge Graph Builder

A developer modelling humanities data as a knowledge graph: RDF, ontologies, SPARQL, linked open data. Reference projects: SuGW (factoid prosopography), HerData (AGRELON relations), DEPCHA, Bookkeeping Ontology, REA Model.

- As a Knowledge Graph Builder, I want to understand RDF as a data model, not just a syntax.
- As a Knowledge Graph Builder, I want to choose an ontology appropriate for my domain (CIDOC-CRM for objects, BIO/AGRELON for people, RiC-O for archives).
- As a Knowledge Graph Builder, I want to write SPARQL queries against Wikidata and other endpoints.
- As a Knowledge Graph Builder, I want to publish my own graph to a sustainable endpoint or as RDF dumps.
- As a Knowledge Graph Builder, I want to apply the factoid model where source-criticism matters so that I represent contested claims rather than collapsing them.
- As a Knowledge Graph Builder, I want to visualise networks meaningfully (not just hairballs) so that the graph yields research insight.
- As a Knowledge Graph Builder, I want to use LLMs for entity disambiguation while controlling for hallucination.
- As a Knowledge Graph Builder, I want my data to remain editable as a graph so that scholarship can iterate on relations.

### Teaching Adopter

A lecturer or programme director assembling course material. Evaluates whether to adopt this textbook (or parts) as course material, exercise source, or reading.

- As a Teaching Adopter, I want a clear, machine-readable licence per chapter so that I know what I can adopt, adapt, and redistribute.
- As a Teaching Adopter, I want stable permalinks and a recommended citation form so that I can include chapters in a syllabus.
- As a Teaching Adopter, I want the structure to be visible at a glance so that I can decide adoption efficiently.
- As a Teaching Adopter, I want a contribution path that does not assume I am a developer so that I can suggest corrections without learning Git.
- As a Teaching Adopter, I want the voice to be authored but adoptable so that I can integrate chapters without the result sounding outsourced.
- As a Teaching Adopter, I want block overviews that summarise learning goals, prerequisites, and chapter composition so that I can assemble custom reading lists.
- As a Teaching Adopter, I want exercises with explicit difficulty markers and expected duration so that I can integrate them into existing course timetables.

### Self-Learner

A reader working through the textbook outside a formal course frame. Motivated by a project of their own or by curiosity about DH practice.

- As a Self-Learner, I want self-check questions or small assessments at chapter ends so that I can verify understanding without an instructor.
- As a Self-Learner, I want a recommended reading order with explicit prerequisites so that I can construct a coherent learning path.
- As a Self-Learner, I want exercises with reference solutions or expected outputs so that I can confirm I did them correctly.
- As a Self-Learner, I want to bookmark or persist reading progress so that I can resume after an interruption.
- As a Self-Learner, I want pointers to communities of practice at relevant chapter ends so that I can move from self-study into a network.
- As a Self-Learner, I want the textbook to acknowledge that self-learning is a primary use.

### Coding Agent

A machine reader (Claude Code, Cursor, a custom agent). Reads the textbook as a knowledge source for grounded answers, code citations, and structured retrieval.

- As a Coding Agent, I want every chapter to expose machine-readable frontmatter with stable schema so that I can index, cite, and reason over content without ambiguous parsing.
- As a Coding Agent, I want cross-references to use stable chapter IDs rather than fluctuating titles so that references survive title revisions.
- As a Coding Agent, I want code blocks tagged with language, executable status, and tool version so that I can quote runnable code accurately.
- As a Coding Agent, I want public, well-documented, stable JSON data files (chapters.json, search.json) so that I can query the textbook as a knowledge source.
- As a Coding Agent, I want the licence to be machine-readable in frontmatter and HTML metadata so that I can attribute correctly when quoting.
- As a Coding Agent, I want glossary terms unambiguously linked from first use so that I can resolve term meaning without guessing.
- As a Coding Agent, I want the CT marker to be a controlled vocabulary so that I can group chapters by computational-thinking lens.

## Reading-Mode Guidance per Role

Practice roles read differently. This section maps how each role typically moves through the textbook.

| Role | Typical path | Primary blocks | Reading shape |
|---|---|---|---|
| Edition Builder | Long for build chapters, Short for context | 05, 02, 04 | task-driven dive, returns for reference |
| Research Data Engineer | Long, runs exercises | 02, 06, 01 | weekly sessions while building a pipeline |
| Cultural-Heritage Tool Maker | Long for tooling, Short for theory | 04, 02, 03, 08 | sustained over a project lifecycle |
| AI-Augmented Researcher | Both paths, reflective re-reading | 00, 07, 06 | iterative: read, try, return |
| Knowledge Graph Builder | Long, deep Semantic Web focus | 02, 03, 08 | concentrated theory phase, then application |
| Teaching Adopter | Scanning, occasional deep read | structural overviews, sample chapters | scattered evaluation moments |
| Self-Learner | Recommended order, both paths | starts at 00 Foundations | sequential, interrupted, resumed |
| Coding Agent | Per-request, structured | per chapter via JSON | task-scoped retrieval |

Short Synthesis serves: any role's first encounter with an unfamiliar topic, any role's "what is this about" question, the Self-Learner's first pass through a new block, the Teaching Adopter's adoption check.

Long Form serves: any role doing the work, the Practising Researcher building, the Cultural-Heritage Tool Maker integrating, the Knowledge Graph Builder learning a new ontology, the Coding Agent retrieving operational content.

## Cross-Role Tensions

Tensions in the design space, with resolutions.

- **Operational depth vs. accessibility.** Practice roles want version-specific detail; first-time readers want a clean first read. Resolution: depth lives in numbered Long-Form subsections clearly labelled. Short Synthesis stays single-figure.
- **Stable structure vs. evolving content.** Coding Agent and Teaching Adopter want stable IDs; the textbook will revise content. Resolution: chapter IDs are permanent; titles and slugs are revisable.
- **German tradition vs. international reach.** Substrate is largely German-tradition DH; readers come from a wider field. Resolution: DE-EN glossary in `design.md` plus deliberate inclusion of non-German projects as worked examples.
- **Practice-driven vs. theory-anchored.** Practice roles want to ship; the textbook also teaches Computational Thinking and conceptual foundations. Resolution: CT marker frames each chapter so theory and practice meet in the same atom.
- **Authorial voice vs. teaching adoptability.** The textbook has a recognisable voice; adopters want neutral material. Resolution: chapters use authored voice without first-person editorial.

## Anti-Roles

The textbook does not target:

- A computer-science student looking for systems programming depth. Block 01 contextualises CS for humanities.
- A casual humanities reader curious about the digital turn. The textbook expects the reader to build.
- An AI engineer looking for ML internals. AI Literacy here is operational.
- A pure prompt-engineering audience. Prompting is one practice among many.
- A pure front-end-web audience. Block 04 Web serves DH artefact deployment.

## Composite Reader Trajectories

1. An Edition Builder starting a digital-edition project enters via `05-01_what-is-a-scholarly-edition`, follows the block through TEI modelling and apparatus, then crosses to `04-05_static-site-deployment`. Months later, they return to `07-03_llms-for-markup` when they integrate LLM-assisted transcription.
2. A Research Data Engineer reads `02-04_data-modelling-basics`, then `06-02_version-control-for-data`, then `02-07_fair-principles`. They cite specific chapter IDs in a data-management plan.
3. A Cultural-Heritage Tool Maker reads `03-02_rdf-basics`, `02-06_authority-data`, then `08-02_coordinated-views`. The textbook becomes a project reference manual.
4. An AI-Augmented Researcher discovers the textbook through the AGKI-AG community. They read `00-03_promptotyping-overview` and `07-04_promptotyping-method`, then adopt the method in their next project.
5. A Knowledge Graph Builder reads block 03 in sequence, runs all SPARQL exercises, then reads `02-05_factoid-model`. They contribute corrections to ontology references via pull request.
6. A Teaching Adopter scans block 02 in one lunch break and assigns three chapters and one exercise. They link from their syllabus using stable chapter IDs.
7. A Self-Learner starts at block 00, follows the recommended order, finishes the textbook over months, and ends with a small portfolio piece built using its exercises.
8. A Coding Agent retrieves `02-04` and `03-02` to answer a user's question about modelling person records as RDF. The agent quotes accurately and attributes CC-BY.

## Consequences for Textbook Design

The stories are the acceptance baseline for chapter and site decisions.

- Edition Builder, Research Data Engineer, Cultural-Heritage Tool Maker, Knowledge Graph Builder stories drive operational depth of Long Form, inclusion of runnable code, references to real DH projects.
- AI-Augmented Researcher stories drive inclusion of harness patterns, prompt design discipline, Critical-Expert-in-the-Loop guidance.
- Teaching Adopter stories drive licence, citation, block-overview infrastructure.
- Self-Learner stories drive self-check questions, expected outputs, status markers.
- Coding Agent stories drive stable frontmatter schema, stable chapter IDs, JSON data files, controlled vocabularies.

At every quality gate, a sample of chapters is reviewed against the stories of two randomly chosen roles.

## Related

- `project.md` (mission, audience definition)
- `design.md` (voice, both-paths functional difference, DE-EN glossary)
- `specification.md` (frontmatter schema, CT distribution)
- `data.md` (substrate sources from the projects referenced in role descriptions)
- `roadmap.md` (waves serve which roles when)
- [[Scholar-Centered Design]]
- [[User Stories]]
- [[Project Overview Stefan Zweig Digital]]
- [[HerData - Frauen in Goethes Korrespondenz]]
- [[Project Overview M³GIM]]
- [[Project Overview SuGW]]
- [[Promptotyping MOC]]
