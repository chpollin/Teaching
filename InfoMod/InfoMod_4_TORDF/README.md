# TORDF

## CSV to RDF via Python + rdflib

https://colab.research.google.com/drive/1BWLXoEmgbMWclX7CW3eeFJKW3d6l_k_5?usp=sharing 

## CSV to RDF via tarql (Windows 10, tarql-1.2)

* https://tarql.github.io/
* Download [tarql-1.2.zip](https://github.com/tarql/tarql/releases/download/v1.2/tarql-1.2.zip) + entzippen
* mit Eingabeaufforderung (CMD) in den tarql-1.2 Folder gehen
* TechCrunchcontinentalUSA.csv und query.sparql in den tarql-1.2 Folder geben (entspricht dem ersten Beispiel http://tarql.github.io/examples/) 
* **`bin\tarql query.sparql TechCrunchcontinentalUSA.csv`**
  erzeugt aus den Daten im CSV ein RDF auf Basis des Mappings in query.sparql.
* **`bin\tarql query.sparql TechCrunchcontinentalUSA.csv > output.ttl`**
  so kann das Ergebnis in ein neues turtle file geben werden.

### **Versuchen wir das nun für die olympischen Athleten. Also mit olympics_snippet.csv**

Mit dieser SPARQL Query (query_olympic_v1.sparql):

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

oa:5    rdf:type  foaf:Person .

oa:24   rdf:type  foaf:Person ;
            rdf:type  foaf:Person .

oa:25   rdf:type  foaf:Person .

oa:26   rdf:type  foaf:Person .

Weiter angepasst und age, gender, name, height und weight abgedeckt. Mit BIND kann man die Dinge noch weiter bearbeiten. So haben wir aus ?Sex die ?Sex_uri gebastelt, damit wir eine object property haben und wir haben die “NA” also leeren String für height und weight abgefangen. Die Doppelung bei foaf:age und foaf:Person haben wir aber immer noch (hier müsste man noch überlegen/schauen, ob man mittels tarql auch diese Doppelungen abdecken könnte.)

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

## CSV to RDF via OpenRefinde + RDF Extension

* https://medium.com/wallscope/creating-linked-data-31c7dd479a9e 

## XML to RDF via XSLT

## 

