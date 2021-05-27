# SPARQL

[Folien: Triplestore einrichten (Blazegraph)](https://docs.google.com/presentation/d/12wupTsbqfXMki7r1WuUHkVflTrP_jr-7pRpMuKjqyXs/edit?usp=sharing)

[Video: Triplestore einrichten (Blazegraph)](https://youtu.be/LjB8kAOv5mM)

[Folien: SPARQL](https://docs.google.com/presentation/d/19rQz1HBn1OtVPdI0wvLWP3e5U5L75DK1y6S8BV-TVEw/edit?usp=sharing)

[Video: SPARQL 1](https://youtu.be/rfECeJ-JHVo)

[Video: SPARQL 2](https://youtu.be/cbWP-pRyCVk)

## Literatur

## Exercise

Installiere einen Triplestore: Blazegraph oder GraphDB. Die Anleitung dafür findest du in den Folien.

Lade folgende Datensätze (RDF/turtle) herunter und importiere sie in deiner Graphendatenbank: 

- https://github.com/wallscope/olympics-rdf/blob/master/data/olympics-ttl-nodup.zip
- https://github.com/wallscope/superhero-rdf/blob/master/data/superhero-ttl.zip 

Stelle sicher, dass du die Daten ingestiert hast mit einer simplen SPARQL-Query:

*select \* where { 
   ?s ?p ?o .
} limit 100 
*

Jetzt kannst du auch alle SPARQL aus den Folien/Screencast selber ausprobieren. 

**SPARQL 1**

Ermittele wie viele Medaillen die einzelnen Länder (genauer gesagt: NOCs) bisher gewonnen haben.
Lassen Sie sich die Liste absteigend nach der Zahl der Medaillen sortieren.
Das Ergebnis soll so aussehen: [wie eine der SQL Übungen]

"United States"@en  5371
"Soviet Union"@en   2618
...

**SPARQL 2**

Gib die 20 längsten names der athlete aus.

- In der ersten Spalte soll die athlete URI stehen, in der zweiten Spalte  die Zahl der Zeichen stehen und in der zweiten Spalte der Name.
- Sortieren Sie absteigend nach der Zahl der Zeichen und aufsteigend nach fullname.
- Gib nur die ersten 20 Ergebniszeilen aus.