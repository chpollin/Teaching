# TORDF

## CSV to RDF via Python + rdflib

## CSV to RDF via tarql (Windows 10, tarql-1.2)

* https://tarql.github.io
* Download [tarql-1.2.zip](https://github.com/tarql/tarql/releases/download/v1.2/tarql-1.2.zip) + entzippen
* mit Eingabeaufforderung (CMD) in den tarql-1.2 Folder gehen
* TechCrunchcontinentalUSA.csv und query.sparql in den tarql-1.2 Folder geben (entspricht dem ersten Beispiel http://tarql.github.io/examples/) 
* **`bin\tarql query.sparql TechCrunchcontinentalUSA.csv`**
  erzeugt aus den Daten im CSV ein RDF auf Basis des Mappings in query.sparql.
* **`bin\tarql query.sparql TechCrunchcontinentalUSA.csv > output.ttl`**
  so kann das Ergebnis in ein neues turtle file geben werden.

### **Versuchen wir das nun mit olympics_snippet.csv**

Mit dieser SPARQL Query (query_olympic_v1.sparql):

```
PREFIX ot:<http://wallscope.co.uk/resource/olympics/team/>
PREFIX dbo:<http://dbpedia.org/ontology/>
PREFIX dbp:<http://dbpedia.org/property/>
PREFIX oa:<http://wallscope.co.uk/resource/olympics/athlete/>
PREFIX oc:<http://wallscope.co.uk/resource/olympics/city/>
PREFIX o:<http://wallscope.co.uk/resource/olympics/>
PREFIX foaf:<http://xmlns.com/foaf/0.1/>
PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd:<http://www.w3.org/2001/XMLSchema#>
PREFIX skos:<http://www.w3.org/2004/02/skos/core#>

CONSTRUCT {
  ?URI a foaf:Person.
}
FROM <file:olympics_snippet.csv>
WHERE {
  BIND (URI(CONCAT('http://wallscope.co.uk/resource/olympics/athlete/', ?ID)) AS ?URI)
}
```

und dem Aufruf

**bin\tarql query_olympic_v1.sparql olympics_snippet.csv > output.ttl`**

bekommt man die URIS für jeden Athleten erzeugt und sie sind als foaf:Person definiert. Wobei `rdf:type  foaf:Person` für oa:24 doppelt vorkommt, da es zwei rows gibt für diesen Athleten.

```
oa:5    rdf:type  foaf:Person .

oa:24   rdf:type  foaf:Person ;
        rdf:type  foaf:Person .

oa:25   rdf:type  foaf:Person .

oa:26   rdf:type  foaf:Person .
```

Weiter angepasst und age, gender, name, height und weight abgedeckt. Mit BIND kann man die Dinge noch weiter bearbeiten. So haben wir aus ?Sex die ?Sex_uri gebastelt, damit wir eine object property haben und wir haben die “NA” also leeren String für height und weight abgefangen. Die Doppelung bei foaf:age und foaf:Person haben wir aber immer noch. Hier müsste man noch überlegen, ob man mittels tarql auch diese Doppelungen abdecken könnte. Sie entsteht, weil es für mehrere Personen mehrere Zeilen gibt, da sie an weiteren olympischen Spielen teilgenommen haben. 

```SPARQL
PREFIX ot:<http://wallscope.co.uk/resource/olympics/team/>
PREFIX dbo:<http://dbpedia.org/ontology/>
PREFIX dbp:<http://dbpedia.org/property/>
PREFIX oa:<http://wallscope.co.uk/resource/olympics/athlete/>
PREFIX oc:<http://wallscope.co.uk/resource/olympics/city/>
PREFIX o:<http://wallscope.co.uk/resource/olympics/>
PREFIX foaf:<http://xmlns.com/foaf/0.1/>
PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd:<http://www.w3.org/2001/XMLSchema#>
PREFIX skos:<http://www.w3.org/2004/02/skos/core#>

CONSTRUCT {
  ?URI a foaf:Person;
    foaf:name ?Name;
    foaf:age ?Age;
    foaf:gender ?Sex_uri;
    dbp:height ?Height_fixed;
    dbp:weight ?Weigth_fixed.
    
}
FROM <file:olympics_snippet.csv>
WHERE {
  BIND (URI(CONCAT('http://wallscope.co.uk/resource/olympics/athlete/', STR(?ID))) AS ?URI)
  BIND (IF(?Height != 'NA', ?Height, ?nothing) AS ?Height_fixed)
  BIND (IF(?Weigth != 'NA', ?Weigth, ?nothing) AS ?Weigth_fixed)
  BIND (IRI(CONCAT('http://wallscope.co.uk/resource/olympics/', STR(?Sex))) AS ?Sex_uri)
}
```

## CSV to RDF via OpenRefine + RDF Extension

* https://medium.com/wallscope/creating-linked-data-31c7dd479a9e 

## XML to RDF via XSLT

* [Oxygen XML Editor](https://www.oxygenxml.com/xml_editor/download_oxygenxml_editor.html) herunterladen und installieren.
* Transformationsszenario einrichten. Wie im folgenden Screenshot. Unter dem reiter _Output_ muss noch unter _save as_ der Pfad und Dateiname angegeben werden.
![grafik](https://user-images.githubusercontent.com/30200424/135826810-114585f9-805c-428f-9d40-70c4188ace0f.png)

### TEI_to_RDF_get_started.xsl 

* Erzeugt die Grundstruktur, das Wurzelelemente `<rdf:RDF>` und ein paar Namespaces. Das Output-Format ist XML/RDF.
* Das Stylesheet erzeugt ein `void:Dataset`, das es erlaubt Metadaten zu einem LOD-Datensatz hinzuzügen. Dinge wie: wo ist der RDF-dump, welche Vokabularien wurden verwendet, wieviele Triples...
```
<void:Dataset rdf:about="https://example.com#o:depcha.schlandersberger.1">
        <dcterms:title>Digitale Edition der Schlandersberger Rechnungen</dcterms:title>
        <dcterms:publisher>Zentrum für Informationsmodellierung - Universität
            Graz</dcterms:publisher>
        <void:vocabulary rdf:resoruce="https://gams.uni-graz.at/o:depcha.bookkeeping#"/>
</void:Dataset>
```
* Und ein `bk:Transaction`, das eine data property `bk:entry` hat. Jede `bk:Transaction` entspricht einer Transaktion im Rechnungsbuch und wird im XML/TEI mit dem @ana="bk:entry" annotiert. 
``` 
<bk:Transaction rdf:about="https://example.com#d1e2396">
  <bk:entry>Item hans Püdd hat geben 1 purd Eÿsen für ussassen zinss üm 6 lb perner von aine Gans das es von meine herrn hat.</bk:entry>
</bk:Transaction>    
```

### TEI_to_RDF_taxonomy_to_SKOS.xsl

Das Element <taxonomy> in TEI lässt sich gut nach [SKOS](https://www.w3.org/2004/02/skos/) überführen. Mit SKOS werden Taxonomien, Thesauri etc. im Kontext des Semantic Web umgesetzt. Im Falle der Beispieldaten handelt es sich um eine Taxonomie von wirtschaftlichen Gütern. 
#### <taxonomy> Input (Snippet)  
``` 
<classDecl>
  <taxonomy ana="bk:Index">
     <gloss>Commodities</gloss>
     <category xml:id="Getreide">
        <catDesc><term ref="wd:Q2995529" xml:lang="de">Getreide</term></catDesc>
        <category xml:id="Roggen">
           <catDesc><term ref="wd:Q12099" xml:lang="de">Roggen</term></catDesc>
        </category>
        <category xml:id="Weizen">
           <catDesc><term ref="wd:Q15645384" xml:lang="de">Weizen</term></catDesc>
           <category xml:id="guterWeizen">
              <catDesc><term xml:lang="de">Guter Weizen</term></catDesc>
           </category>
           <category xml:id="schlechterWeizen">
              <catDesc><term xml:lang="de">Schlechter Weizen</term></catDesc>
           </category>
        </category>
        <category xml:id="Gerste">
           <catDesc><term ref="wd:Q11577" xml:lang="de">Gerste</term></catDesc>
        </category>
     </category>  
  </taxonomy>
<classDecl>
``` 
#### SKOS Output (Snippet)
``` 
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/" xmlns:schema="https://schema.org/"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:bk="https://gams.uni-graz.at/o:depcha.bookkeeping#" xmlns:void="http://rdfs.org/ns/void#">
    <skos:ConceptScheme rdf:about="https://example.com#Taxonomy">
        <dc:title>Commodities</dc:title>
        <skos:hasTopConcept rdf:resource="https://example.com#d1e243"/>
        <skos:hasTopConcept rdf:resource="https://example.com#d1e285"/>
        <skos:hasTopConcept rdf:resource="https://example.com#d1e306"/>
        <skos:hasTopConcept rdf:resource="https://example.com#d1e356"/>
        <skos:hasTopConcept rdf:resource="https://example.com#d1e400"/>
    </skos:ConceptScheme>
    <skos:Concept rdf:about="https://example.com#d1e243">
        <skos:inScheme rdf:resource="https://example.com#Taxonomy"/>
        <skos:narrower rdf:resource="https://example.com#d1e249"/>
        <skos:narrower rdf:resource="https://example.com#d1e256"/>
        <skos:narrower rdf:resource="https://example.com#d1e277"/>
        <skos:prefLabel>Getreide</skos:prefLabel>
        <skos:relatedMatch rdf:resource="https://www.wikidata.org/wiki/Q2995529"/>
    </skos:Concept>
    <skos:Concept rdf:about="https://example.com#d1e249">
        <skos:inScheme rdf:resource="https://example.com#Taxonomy"/>
        <skos:broader rdf:resource="https://example.com#d1e243"/>
        <skos:prefLabel>Roggen</skos:prefLabel>
        <skos:relatedMatch rdf:resource="https://www.wikidata.org/wiki/Q12099"/>
    </skos:Concept>
    <skos:Concept rdf:about="https://example.com#d1e256">
        <skos:inScheme rdf:resource="https://example.com#Taxonomy"/>
        <skos:narrower rdf:resource="https://example.com#d1e262"/>
        <skos:narrower rdf:resource="https://example.com#d1e269"/>
        <skos:broader rdf:resource="https://example.com#d1e243"/>
        <skos:prefLabel>Weizen</skos:prefLabel>
        <skos:relatedMatch rdf:resource="https://www.wikidata.org/wiki/Q15645384"/>
    </skos:Concept>
    <skos:Concept rdf:about="https://example.com#d1e262">
        <skos:inScheme rdf:resource="https://example.com#Taxonomy"/>
        <skos:broader rdf:resource="https://example.com#d1e256"/>
        <skos:prefLabel>Guter Weizen</skos:prefLabel>
    </skos:Concept>
    <skos:Concept rdf:about="https://example.com#d1e269">
        <skos:inScheme rdf:resource="https://example.com#Taxonomy"/>
        <skos:broader rdf:resource="https://example.com#d1e256"/>
        <skos:prefLabel>Schlechter Weizen</skos:prefLabel>
    </skos:Concept>
    <skos:Concept rdf:about="https://example.com#d1e277">
        <skos:inScheme rdf:resource="https://example.com#Taxonomy"/>
        <skos:broader rdf:resource="https://example.com#d1e243"/>
        <skos:prefLabel>Gerste</skos:prefLabel>
        <skos:relatedMatch rdf:resource="https://www.wikidata.org/wiki/Q11577"/>
    </skos:Concept>  
</rdf:RDF>  
``` 
  
### [TEI_to_RDF_taxonomy_to_SKOS.xsl](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/TEI_to_RDF_XSLT/TEI_to_RDF_taxonomy_to_SKOS.xsl)

## Exercise

Wenn man nun mit [TEI_to_RDF_listPerson_to_schema_foaf.xsl](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/TEI_to_RDF_XSLT/TEI_to_RDF_listPerson_to_schema_foaf.xsl) die Daten [szd_personenliste.xml](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/TEI_to_RDF_XSLT/data/szd_personenliste.xml) oder
[wheaton_accounts.xml](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/TEI_to_RDF_XSLT/data/wheaton_accounts.xml) transformiert, sieht das Ergebnis noch nicht schön aus.
Überlege inwieweit du [TEI_to_RDF_listPerson_to_schema_foaf.xsl](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/TEI_to_RDF_XSLT/TEI_to_RDF_listPerson_to_schema_foaf.xsl) anpassen musst.

