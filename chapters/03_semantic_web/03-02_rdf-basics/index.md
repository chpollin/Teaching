---
title: "RDF Basics"
slug: rdf-basics
chapter_id: "03-02"
block: "03_semantic_web"
block_title: "Semantic Web"
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
status: draft
created: 2026-05-14
updated: 2026-07-23
language: en
version: 0.2
authors: ["Christopher Pollin"]
ct_markers:
  primary: pattern-recognition
  secondary: [abstraction]
paths:
  short: true
  long: true
topics: ["RDF", "Turtle", "serialisation", "RDFS", "RDF-star"]
vault_backing:
  - path: "c:/Users/Chrisi/Documents/obsidian/Digital Humanities/Standards und Datenmodelle/RDF.md"
    read_on: 2026-07-23
  - path: "c:/Users/Chrisi/Documents/obsidian/Digital Humanities/Standards und Datenmodelle/RDFS.md"
    read_on: 2026-07-23
substrate:
  - "_legacy/InfoMod/InfoMod_1_RDF/RDF und RDFS.md"
  - "_legacy/InfoMod/InfoMod_1_RDF/Exercise/"
  - "Pollin 2025, Modelling, Operationalising and Exploring Historical Information, ch. 5 (author's copy, not in repository)"
prerequisites: ["03-01"]
next: "03-03"
related: ["03-01", "03-03", "03-05", "02-02"]
license: CC-BY-4.0
---

# RDF Basics

> **CT in focus:** Pattern Recognition — What single three-part pattern can record a medal win, a nineteenth-century debt, and a manuscript attribution alike?

## Short Synthesis

Open a day book from 1828. One line reads: "Sept. 15. Settlement with Derius Drake for ax delivered, $1.50." A human reader unpacks this without effort. There was a transaction. It happened on a date. It involved a person. It concerned an object and an amount of money. The line is one string of ink, but the knowledge in it is a small web of connected claims.

A spreadsheet forces that web into a row: one column for date, one for person, one for amount. This works until it does not. What if two people were involved? What if the amount is disputed between two sources? What if you want to connect Derius Drake in this ledger to the same Derius Drake in a church register? Rows and columns answer the questions the table designer anticipated. Historical research keeps asking questions nobody anticipated.

The Resource Description Framework, RDF, takes the opposite starting point. Instead of designing a container and pouring data in, you break knowledge down into its smallest complete statements and let structure emerge from their connections. Each statement is a triple: subject, predicate, object. The transaction involves Derius Drake. The transaction has the date 1828-09-15. The amount is 1.50 dollars. Each triple stands on its own, and every triple follows the same three-part pattern. Because subjects and objects are identified by web addresses (IRIs), a triple written in Graz can point at a resource defined in Boston, and the two statements join into one graph the moment they meet.

That is the insight this chapter turns into practice: RDF is a data model, and the formats you will meet, Turtle, JSON-LD, N-Triples, are only different ways of writing the same graph down. Learn to see the graph behind the syntax and the syntaxes become interchangeable, the way you already treat a CSV export and an Excel sheet as two skins of one table. The graph has no fixed schema to outgrow. When a new question arrives, when a second source contradicts the first, when a person turns out to be two people, you add triples. You never redesign the container, because there is no container.

There is a cost. A graph of atomic statements is more verbose than a tidy table, harder to eyeball, and it needs its own query language before it answers anything (see [03-03_sparql], Querying with SPARQL). The trade is worth it exactly where humanities data lives: heterogeneous sources, incomplete records, contested claims, and entities that recur across collections.

The smallest mental model: RDF is knowledge chopped into three-word sentences, and a database is what happens when the sentences start sharing words.

## Long Form

### 1. From Table to Graph

Most data you have met so far arrives in rectangles. A CSV of Olympic athletes has one row per result and one column per attribute. A relational database refines the rectangle but keeps its logic: schema first, data second. The schema is a set of decisions about which questions the data will answer.

Historical material resists this. Consider a single line from the Wheaton Day Book, an account book kept in Massachusetts between 1828 and 1859: a settlement with one Derius Drake for an ax, at one dollar fifty. To put this in a table you must decide the columns now: date, creditor, debtor, commodity, amount, currency. Then the next page produces an entry with two debtors, or a payment partly in kind, or a sum a later hand corrected. Each surprise is a schema migration.

RDF inverts the order. You commit to nothing but a pattern: every piece of knowledge is expressed as a statement with exactly three parts, subject, predicate, and object. Such a statement is called a triple.

```
subject         predicate        object
:Transaction123 :involvesPerson  :DeriusDrake
:Transaction123 :amount          "1.50"
```

A set of triples is an RDF graph. Subjects and objects are the nodes; predicates are the labelled, directed edges between them. Two triples that mention the same resource connect automatically. Nothing else is needed: no table definition, no column order, no migration when statement number 5001 has a shape the first 5000 lacked.

The graph view has a second consequence that tables cannot replicate. Because nodes are identified globally (next section), graphs from different sources merge by simple union. Your transcription of the day book and a colleague's prosopography of Massachusetts farmers become one queryable graph the moment both use the same identifier for Derius Drake. This is the mechanism behind Linked Open Data (see [03-04_linked-open-data], Linked Open Data).

### 2. Three Kinds of Term

Every position in a triple is filled by one of three kinds of term, and the rules about which kind may stand where are the whole grammar of RDF.

**IRIs** identify resources. An IRI (Internationalized Resource Identifier) is a generalisation of the URL that permits Unicode. `http://example.org/DeriusDrake` names a person; the IRI is the name, whether or not a browser finds a page there. IRIs give RDF its global reach: because identifiers live in namespaces you control, your `:Transaction123` cannot collide with anyone else's, and reusing a foreign IRI, say a Wikidata entity, is an act of deliberate linking, an idea you know from authority files (see [02-05_authority-data-and-vocabularies], Authority Data and Controlled Vocabularies).

**Literals** carry values: strings, numbers, dates. A literal may declare a datatype (`"1828-09-15"^^xsd:date`) or a language tag (`"axe"@en`). Datatypes matter because they tell a machine that `"1.50"` is a decimal it can sum, and that two spellings of a date denote the same day.

**Blank nodes** are resources without a global name, existential placeholders. Use them when something must exist as a node, the unnamed recipient of a payment, but minting an IRI for it would be pretence of knowledge you do not have. Use them sparingly; a blank node cannot be referenced from outside its graph.

The placement rules: a subject is an IRI or blank node. A predicate is always an IRI. An object may be any of the three. In consequence, a literal can never be the subject of a statement. You cannot say things about `"1.50"`; you can only say things about resources. If you catch yourself wanting to annotate a value, that is a modelling signal: the value deserves promotion to a resource, a `:MoneyAmount123` with a `:value` and a `:unit`, which can then carry as many further statements as the sources demand.

In practice you will mint IRIs in a namespace you control, typically under a project domain, and reuse foreign IRIs wherever a shared referent exists. The decision follows a simple heuristic. Entities your project is *about* and that others might want to link to (persons, places, transactions, documents) get project IRIs, ideally stable ones (see [02-06_persistent-identifiers], Persistent Identifiers). Entities the wider world already identifies (Massachusetts, the US dollar, the concept "speed skating") should point at established authorities such as Wikidata or the GND, because every reused IRI is a free join with everyone else's data.

### 3. Writing the Graph Down: Turtle

Turtle is the serialisation you will read and write most. It is designed for humans, and it compresses repetitive graph structure into a form close to prose punctuation. Here is the Wheaton entry, built up in three steps.

First, one triple, fully spelled out:

```turtle
<http://example.org/Transaction123> <http://example.org/involvesPerson> <http://example.org/DeriusDrake> .
```

Legal, but unreadable. Second, prefix declarations shorten the namespaces:

```turtle
@prefix : <http://example.org/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

:Transaction123 :involvesPerson :DeriusDrake .
```

Third, Turtle's punctuation folds several statements about one subject together. A semicolon repeats the subject; a comma repeats subject and predicate; `a` abbreviates `rdf:type`:

```turtle
@prefix : <http://example.org/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

:Transaction123 a :FinancialTransaction ;
    :date "1828-09-15"^^xsd:date ;
    :involvesPerson :DeriusDrake ;
    :amount "1.50"^^xsd:decimal ;
    :description "Settlement for ax delivered on September 1st" .
```

Read this back as what it is: five triples sharing a subject. `:Transaction123` is typed as a financial transaction; it carries a date, a person, an amount, and a free-text description. The datatype annotations are the machine-facing half of the contract. `^^xsd:date` promises a parseable calendar day; `^^xsd:decimal` promises arithmetic.

Notice what the model made you do. The day book line mentioned an ax, a delivery date in September, and a settlement date. The five triples above capture some of this and flatten the rest into the description string. Modelling is deciding which distinctions become structure and which stay prose, and the decision is revisable: tomorrow you can add `:concernsObject :Ax123` without touching what exists. Data modelling as an activity has its own chapter (see [02-02_data-modelling-basics], Data Modelling Basics).

### 4. One Graph, Many Serialisations

The graph is the invariant; the file format is a choice. The same five triples in N-Triples, the line-based format used for bulk exchange and diffing:

```
<http://example.org/Transaction123> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://example.org/FinancialTransaction> .
<http://example.org/Transaction123> <http://example.org/date> "1828-09-15"^^<http://www.w3.org/2001/XMLSchema#date> .
<http://example.org/Transaction123> <http://example.org/involvesPerson> <http://example.org/DeriusDrake> .
```

(Two triples omitted; the pattern continues.) Every line is one complete triple, no prefixes, no state. Ugly for humans, ideal for machines and version control.

And in JSON-LD, the format web APIs and IIIF manifests speak:

```json
{
  "@context": {
    "@vocab": "http://example.org/",
    "xsd": "http://www.w3.org/2001/XMLSchema#"
  },
  "@id": "http://example.org/Transaction123",
  "@type": "FinancialTransaction",
  "date": { "@value": "1828-09-15", "@type": "xsd:date" },
  "involvesPerson": { "@id": "http://example.org/DeriusDrake" },
  "amount": { "@value": "1.50", "@type": "xsd:decimal" }
}
```

JSON-LD is ordinary JSON with an `@context` that maps keys to IRIs. It exists because the Semantic Web community learned, after years of asking developers to adopt new formats, to add semantics to a format developers already used. A JavaScript application can consume JSON-LD as plain JSON and ignore the semantics entirely; an RDF tool reads the same file as a graph. This dual readability is why IIIF chose it.

Two further formats you will encounter without writing them. RDF/XML, the oldest serialisation, embeds the graph in XML and survives in archival contexts and older repository software. RDFa embeds triples in HTML attributes so that a web page carries its own structured data; search engines read it, and schema.org rests on this mechanism.

The practical rule: choose Turtle for editing, teaching, and anything a human reviews; N-Triples for pipelines, dumps, and version control diffs; JSON-LD for APIs and the web; RDF/XML only when a legacy system demands it. Conversion between all of them is lossless, because each is a complete notation for the same abstract graph. Exercise 3 makes you perform the round-trip so the equivalence stops being a claim and becomes an observation.

### 5. Typing and a Little Schema: RDFS

RDF alone says nothing about what a `:FinancialTransaction` is. RDF Schema (RDFS) adds a small vocabulary, about a dozen terms, for describing your terms. The two mechanisms you will use constantly:

```turtle
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix crm: <http://www.cidoc-crm.org/cidoc-crm/> .

:FinancialTransaction rdfs:subClassOf crm:E7_Activity ;
    rdfs:label "Financial Transaction"@en ;
    rdfs:comment "A documented exchange of value between economic agents."@en .

:involvesPerson a rdf:Property ;
    rdfs:domain :FinancialTransaction ;
    rdfs:range :Person .
```

`rdfs:subClassOf` builds hierarchies with inheritance: every `:FinancialTransaction` is automatically also a `crm:E7_Activity`, so a query for activities finds your transactions without extra triples. Here your local vocabulary docks onto CIDOC-CRM, the reference ontology for cultural heritage (see [03-05_ontologies-and-cidoc], Ontologies). `rdfs:domain` and `rdfs:range` declare what kinds of resource a property connects. Beware a trap for programmers: these are not validation constraints. RDF operates under the open-world assumption, so a domain declaration does not reject a mistyped subject; it infers that the subject is a transaction. Validation is a separate concern with separate tools (SHACL), and absence of a triple never means the fact is false, only that it is unstated. For most DH vocabularies RDFS is enough; reach for OWL only when you need disjointness, cardinality, or real inference.

### 6. Statements about Statements

Historical data has a need most data models ignore: the claims themselves have provenance. The ledger says the amount was 1.50; a journal in another hand says 1.75. You do not want to pick a winner. You want to record both claims, each with its source and your confidence in it.

Classic RDF offers workarounds (reification, named graphs), all clumsy at the level of a single statement. The current answer is RDF-star, standardised in RDF 1.2, which lets a triple be the subject of another triple, written with double angle brackets:

```turtle
<< :MoneyAmount123 :value "1.50"^^xsd:decimal >>
    :accordingTo :LedgerBook7 ;
    :certainty 0.9 .

<< :MoneyAmount123 :value "1.75"^^xsd:decimal >>
    :accordingTo :JournalBook3 ;
    :certainty 0.7 .
```

Two conflicting attestations coexist, each annotated, neither erased. For source-critical modelling this is the structural mechanism the factoid approach builds on (see [03-06_factoid-and-prosopography], Factoid and Prosopography). At this stage, recognise the pattern and its purpose; you will use it in earnest once plain triples feel routine.

## Exercises

1. **From CSV to Turtle.** Take `olympics_snippet.csv` from the chapter materials (an extract of Olympic athlete results: name, team, year, medal). Model it as RDF and write it as Turtle by hand. Decide yourself which resources get IRIs (athletes? events? medals?) and which values stay literals with datatypes. Where no established vocabulary comes to mind, coin properties in your own namespace. There is no single correct graph; there are defensible and undefensible modelling decisions. Note one decision you hesitated over and why.

2. **Validate and inspect with rdflib.** Install Python and run `pip install rdflib`. Then check your exercise 1 file:

   ```python
   from rdflib import Graph

   g = Graph()
   g.parse("olympics.ttl", format="turtle")
   print(len(g), "triples")
   for s, p, o in g:
       print(s, p, o)
   ```

   A parse error means invalid Turtle; the error message names the line. Fix until the graph loads, then check the triple count against your expectation.

3. **Serialisation round-trip.** With the graph from exercise 2 loaded, run `print(g.serialize(format="json-ld"))` and `print(g.serialize(format="nt"))`. Compare the three files: find one triple and locate it in each serialisation. Load the JSON-LD back into a fresh graph and confirm the triple count is unchanged.

4. **Statements about statements.** Extend your Turtle file from exercise 1: pick one triple whose content could plausibly be contested (a disputed result, an uncertain team affiliation) and annotate it using RDF-star syntax with a source and a certainty value. Keep the annotation in a separate file: rdflib does not yet parse quoted-triple syntax (tested with 7.6), so your exercise 2 script would fail on it. Validate the RDF-star file with a tool that implements RDF 1.2, for example Apache Jena's `riot --validate` or Oxigraph; if you install neither, hand-check the syntax against the examples in section 6 and state in one sentence what your annotation asserts and what it deliberately leaves open.

## Further Reading

- W3C: *RDF 1.1 Primer*. https://www.w3.org/TR/rdf11-primer/ — the canonical gentle introduction.
- W3C: *RDF 1.2 Concepts and Abstract Syntax*. https://www.w3.org/TR/rdf12-concepts/ — includes triple terms (RDF-star).
- W3C: *RDF 1.1 Turtle*. https://www.w3.org/TR/turtle/ — the full syntax you write.
- Tomaszuk, D. and Hyland-Wood, D. (2020): "RDF 1.1: Knowledge Representation and Data Integration Language for the Web." *Symmetry* 12(1), 84.
- Pollin, C. (2025): *Modelling, Operationalising and Exploring Historical Information*. Dissertation, University of Graz, chapter 5 — the historical-information perspective this chapter draws on, including statement-level metadata for contested sources.

## Glossary

**Triple** — the atomic RDF statement: subject, predicate, object.

**Graph** — a set of triples; nodes are subjects and objects, labelled edges are predicates.

**IRI** — Internationalized Resource Identifier; the global name of a resource, Unicode-capable superset of the URL.

**Literal** — a concrete value (string, number, date), optionally typed or language-tagged; only ever an object.

**Blank node** — a node without a global identifier, asserting existence without a name.

**Datatype** — the machine-facing type of a literal, e.g. `xsd:date`, `xsd:decimal`.

**Serialisation** — a concrete file syntax for a graph: Turtle, N-Triples, JSON-LD, RDF/XML.

**Prefix** — a declared abbreviation for a namespace IRI in Turtle and related syntaxes.

**rdf:type** — the property that assigns a resource to a class; abbreviated `a` in Turtle.

**RDFS** — RDF Schema; a small vocabulary for declaring classes, class hierarchies, and property domains and ranges.

**Open-world assumption** — the interpretive stance that an absent statement is unknown, never false.

**RDF-star** — extension standardised in RDF 1.2 that allows triples about triples, enabling statement-level provenance and certainty.
