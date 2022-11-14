* [Folien](https://docs.google.com/presentation/d/1F-Kq0NN6Zxd2ijR7TTrmjHLwGwnTy35nXp6W17E3bWw/edit?usp=sharing)

## Literatur und Ressourcen

* Georg Vogeler, Patrick Sahle. XML. In: Digital Humanities. Fotis Jannidis, Hubertus Kohle und Malte Rehbein (Hrsg.). Stuttgart, 2017, 138-140. [https://doi.org/10.1007/978-3-476-05446-3](https://doi.org/10.1007/978-3-476-05446-3).
- [https://de.wikipedia.org/wiki/XPath](https://de.wikipedia.org/wiki/XPath)
- What is XPath?, [https://www.w3schools.com/xml/xpath_intro.asp](https://www.w3schools.com/xml/xpath_intro.asp)
- [https://maxtoroq.github.io/xpath-ref/](https://maxtoroq.github.io/xpath-ref/)

## Übung

Gegeben ist [szd_werke.xml](). Dieses XML/TEI repräsentiert eine Liste (listBibl) von Werken im Nachlass von Stefan Zweig. Schreibe für folgende Fragen geeignete XPath Ausdrücke:
1. Selektiere alle Werke (biblFull), die nicht "Deutsch" als Sprache angeführt haben. 
   * Lösung: `//listBibl/biblFull[not(.//lang = 'Deutsch')]`
2. Gibt alle vorhanden Incipit (`<incipit>`) von Werken aus, die 'Romane/Erzählungen' klassifiziert wurden `<term type="classification" xml:lang="de">Romane/Erzählungen</term>`.
   * `listBibl/biblFull[.//term[@type] = 'Romane/Erzählungen']//incipit`
3. Bei wievielen Werken gab es mehr als zwei Beteiligte? Gib jeweils den ersten Titel zurück.
   * `//biblFull[.//editor/position()>1]//title[1]`
   * `count(//biblFull[.//editor/position()>1])`
4. Gib die Signaturen alle deutschsprachigen Werke aus, in denen mit Bleistift (in denen im Textknoten die Zeichenfolge 'Bleistift' vorkommt) `material[@ana='szdg:WritingInstrument']`) geschrieben wurde.
   * `//listBibl/biblFull[.//lang = 'Deutsch'][.//material[@ana='szdg:WritingInstrument'][contains(text(), 'Bleistift')]]//idno[@type="signature"]`
5. Überlege dir einen eigenen Xpath und beschreibe kurz, was er aussagt.


