# TORDF

Here you can find some tutorials for different options to convert your CSV or XML files to RDF. 
You can find all the sample files for these tutorials in the [Code section](https://github.com/chpollin/Teaching) of this respository.

**Author: Christopher Pollin, Sabrina Strutz**

## CSV to RDF via Python + rdflib

* All the important files for this tutorial can be found in the folder [CSV_to_RDF_Python](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/CSV_to_RDF_Python/)
* Open a jupyter notebook (if you don't have it yet, download it from the [Jupyter-Website](https://jupyter.org/)) OR create a new notebook on [Google Colab](https://colab.research.google.com/)
* You may use the provided jupyter notebook and execute it directly or you can go through the following code snippets step by step and copy them into your notebook
* At first we have to install rdflib and pandas:
  * If you are sure about having installed one or both requirements, you can skip this step
  * If you are not sure and you run this code eventhough you already have both requirements, it's very likely you get some messages like "Requirement already satisfied" or an upgrade warning about another pip version available. You may ignore those messages.
  ```
  #installing rdflib and panda
  !pip install rdflib
  !pip install pandas
  ```
* Go on by importing the needed libraries:
    ```
    #importing libraries
    from rdflib import Graph, Literal, Namespace, URIRef
    from rdflib.namespace import DCTERMS, RDF, RDFS, SKOS, XSD
    import pandas as pd
    import urllib
    ```
* Now we have to generate the graph and create namespaces and prefixes:
  * The variabel result_graph contains the rdf graph we want to generate and serialize in a new output file. So, now we have to predefine all needed namespaces and add them to result_graph.   
  ```
  #generating a graph
  result_graph = Graph()
    
  #creating namespaces and @prefixes in rdf    
  VOID = Namespace("http://rdfs.org/ns/void#")
  DCTERMS = Namespace("http://purl.org/dc/terms/")
  DC = Namespace("http://purl.org/dc/elements/1.1/")
  OT = Namespace("http://wallscope.co.uk/resource/olympics/team/")
  DBO = Namespace("http://dbpedia.org/ontology/")
  DBP = Namespace("http://dbpedia.org/property/")
  OA = Namespace("http://wallscope.co.uk/resource/olympics/athlete/")
  OC = Namespace("http://wallscope.co.uk/resource/olympics/city/")
  O = Namespace("http://wallscope.co.uk/resource/olympics/")
  FOAF = Namespace("http://xmlns.com/foaf/0.1/")
  RDFS = Namespace("http://www.w3.org/2000/01/rdf-schema#")
  XSD = Namespace("http://www.w3.org/2001/XMLSchema#")
  SKOS = Namespace("http://www.w3.org/2004/02/skos/core#")

  result_graph.bind("void", VOID)
  result_graph.bind("dcterms", DCTERMS)
  result_graph.bind("dc", DC)
  result_graph.bind("ot", OT)
  result_graph.bind("dbo", DBO)
  result_graph.bind("dbp", DBP)
  result_graph.bind("oa", OA)
  result_graph.bind("oc", OC)
  result_graph.bind("o", O)
  result_graph.bind("foaf", FOAF)
  result_graph.bind("rdfs", RDFS)
  result_graph.bind("xsd", XSD)
  result_graph.bind("skos", SKOS)

  BASE_URL = "http://wallscope.co.uk/resource/olympics/athlete/"    
    ```
* Download athlete_events_smaller.csv, adapt the path to the file in your code and print it: 
  * The CSV contains 2500 athletes and for each athlete multiple rows can exist. 
  * The header of the CSV looks like the following: "ID","Name","Sex","Age","Height","Weight","Team","NOC","Games","Year","Season","City","Sport","Event","Medal"
  * *Please note:* If you are using Google Colab, you first have to upload the CSV file into the sample_data folder (located in the content folder). If you have difficulties uploading the CSV into the sample_data folder directly, try uploading the CSV file into the content folder and then drag it into the sample_data folder.
  ```
  #loading the CSV and printing it
  df = pd.read_csv("sample_data/athlete_events_smaller.csv", encoding="utf8") 
  ```
* Now we have to get all distinct teams, cities, games, names etc. to create our triples (most of them with rdfs:label):
  * *By the way:* the quote() function will [URL encode](https://de.wikipedia.org/wiki/URL-Encoding) your string generating "%27" instead of apostrophes or "%20" instead of empty spaces etc., so your URL stays valid.
  ```
  #making sure the URIs are valid
  def normalizeAndEncodeString(string):
    string = str(string).replace(" ", "")
    string = urllib.parse.quote(string)
    return string
  
  #creating teams like ot:Netherlands a dbo:SportsTeam with a rdfs:label
  #adding @en as data literal using the language parameter  
  for team in df['Team'].unique():
    try:
        team_uri = URIRef("http://wallscope.co.uk/resource/olympics/team/" + normalizeAndEncodeString(team))
        result_graph.add((team_uri, RDF.type, DBO.SportsTeam))
        result_graph.add((team_uri , RDFS.label, Literal(team, lang='en') ))
    except:
        print("Log: failed to create a team_uri")    
 
  #creating cities like oc:SquawValley a dbo:City with rdfs:label
  #using str(city).replace(" ", "")), because whitespaces in city names like "Squaw Valley" would lead to invalid URIs  
  for city in df['City'].unique():
    city_uri = URIRef("http://wallscope.co.uk/resource/olympics/city/" + normalizeAndEncodeString(city) )
    result_graph.add((city_uri, RDF.type, DBO.City))
    # add @en to data literal via lang param
    result_graph.add((city_uri , RDFS.label, Literal(city, lang='en') ))

  #creating sports like o:SpeedSkating a dbp:Sport
  for sport in df['Sport'].unique():
    sport_uri = URIRef("http://wallscope.co.uk/resource/olympics/" + normalizeAndEncodeString(sport) )
    result_graph.add((sport_uri, RDF.type, DBO.Sport))
    
  #creating seasons like o:Summer a dbo:TimePeriod
  for season in df['Season'].unique():
    season_uri = URIRef("http://wallscope.co.uk/resource/olympics/" + normalizeAndEncodeString(season) )
    result_graph.add((season_uri, RDF.type, DBO.TimePeriod))
    result_graph.add((season_uri , RDFS.label, Literal(season, lang='en') ))
    
  #creating disciplines like o:SpeedSkatingWomen500metres a o:Discipline .
  for discipline in df['Event'].unique():
    # just for having a valid url; maybe not the best idea ;)
    discipline_uri = URIRef("http://wallscope.co.uk/resource/olympics/" + normalizeAndEncodeString(discipline) )
    result_graph.add((discipline_uri, RDF.type, O.Discipline))
    result_graph.add((discipline_uri , RDFS.label, Literal(discipline, lang='en') ))

  #adding Male and Female as skos:Concept
  female = URIRef("http://wallscope.co.uk/resource/olympics/F")
  male = URIRef("http://wallscope.co.uk/resource/olympics/M")
  result_graph.add(( female , RDF.type, SKOS.Concept))
  result_graph.add(( female , RDFS.label, Literal("female", lang='en') ))
  result_graph.add(( female , RDFS.label, Literal("weiblich", lang='de') ))
  result_graph.add(( male, RDF.type, SKOS.Concept))
  result_graph.add(( male , RDFS.label, Literal("male", lang='en') ))
  result_graph.add(( male , RDFS.label, Literal("männlich", lang='de') ))
  ``` 
    
* Our next step is to create athletes and group them by their ID connecting them with some characteristics and their results:
  ```
  #creating athletes like <ol:Athlete rdf:about="https://gams.uni-graz.at/olympia.1#9792"/>
  #grouping by value in the ID-column
  df_group_by_id = df.groupby('ID')
  #iterating over all groups
  for ID, df_group in df_group_by_id:

    #getting <http://wallscope.co.uk/resource/olympics/athlete/24> instead of oa:NilsEgilAaness 
    athlete_uri = URIRef(BASE_URL + str(ID))
    result_graph.add((athlete_uri, RDF.type, FOAF.Person))

    #iterating over all elements inside the group
    for row_index, row in df_group.iterrows():
      #names - foaf:name with a rdfs:label (foaf:name "Neil Agius")
      if(row["Name"]):
        result_graph.add(( athlete_uri, RDFS.label, Literal(row["Name"]) ))
        result_graph.add(( athlete_uri, FOAF.name, Literal(row["Name"]) ))  
      #age - foaf:age 17, Weight - dbp:weight 65, Height - dbp:height 169; only integers
      if(row["Age"]):
        #integer is the default datatype for number, adding this with datatype=XSD.integer or datatype=XSD.float to the literal
        result_graph.add(( athlete_uri, FOAF.age, Literal(row["Age"] , datatype=XSD.integer) ))
      if(row["Height"].is_integer()):
        result_graph.add(( athlete_uri, DBP.height, Literal(row["Height"] ) ))
      if(row["Weight"].is_integer()):
        result_graph.add(( athlete_uri, DBP.weight, Literal(row["Weight"] ) ))

      #sex - foaf:gender o:F
      if(row["Sex"] == "F"):
        result_graph.add((athlete_uri, FOAF.gender, URIRef( female ) ))
      if(row["Sex"] == "M"):
        result_graph.add((athlete_uri, FOAF.gender, URIRef( male ) ))

      #team - dbp:team ot:Netherlands
      if(row["Team"]):
        result_graph.add(( athlete_uri, DBP.team, URIRef("http://wallscope.co.uk/resource/olympics/team/" + normalizeAndEncodeString(row["Team"]) )))

      #game - o:Game o:2004Summer with rfd:label (combining it with city, and season)
      if(row["Games"]):
        game_uri = URIRef("http://wallscope.co.uk/resource/olympics/" + str(row["Games"]).replace(" ", ""))
        result_graph.add((game_uri, RDF.type, DBO.Olympics))
        #adding @en to data literal via lang param
        result_graph.add((game_uri , RDFS.label, Literal( row["Games"], lang='en' ) ))
        result_graph.add((game_uri , O.city, URIRef("http://wallscope.co.uk/resource/olympics/city/" + str(row["City"]).replace(" ", "")) ))
        result_graph.add((game_uri , O.season, URIRef("http://wallscope.co.uk/resource/olympics/" + str(row["Season"]).replace(" ", "")) ))
 
      #sport - o:NordicCombined a dbo:Sport 
      #discipline - :NordicCombinedMen%27sTeam a o:Discipline with rdfs:label
      discipline_string = urllib.parse.quote(str(row["Event"]).replace(" ", ""))
      discipline_uri = URIRef("http://wallscope.co.uk/resource/olympics/" + discipline_string )
      result_graph.add((discipline_uri , O.sport, URIRef("http://wallscope.co.uk/resource/olympics/" + str(row["Sport"]).replace(" ", "")) ))

      #results - o:result.1 a o:Result (combining it with athlete, discipline and game)
      result_uri = URIRef("http://wallscope.co.uk/resource/olympics/" + "result." + str(ID))
      result_graph.add((result_uri, RDF.type, O.Result))
      result_graph.add((result_uri, O.athlete, athlete_uri)) 
      result_graph.add((result_uri, O.discipline, discipline_uri)) 
      result_graph.add((result_uri, O.game, game_uri)) 
    ```
* When creating a new file with your output, you have the following options:
  * format="xml" - creates plain xml/rdf
  * format="pretty-xml" - abbreviated RDF/XML syntax
  * format="turtle" - creates a turtle file
  * *Please note:* In Google Colab you will find your output in the content folder.
  ```
  #creating an output file
  result_graph.serialize(destination = "olympia_output.ttl", format="turtle")
  ```
* Your output should look like in [this file](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/CSV_to_RDF_Python/olympia_output.ttl).
  
* You can now adapt the jupyter file to your data. Have fun! :)



## CSV to RDF via tarql (Windows 10, tarql-1.2)

* All the important files for this tutorial can be found in the folder [tarql-1.2](https://github.com/chpollin/Teaching/tree/master/InfoMod/InfoMod_4_TORDF/tarql-1.2)
* You can either:
  * get all you need from the code section of this Teaching repository and continue directly in your Windows terminal; or
  * download [tarql-1.2.zip](https://github.com/tarql/tarql/releases/download/v1.2/tarql-1.2.zip), unzip it and put the TechCrunchcontinentalUSA.csv and query.sparql from the code section of this repository into your local tarql-1.2 folder 
* Use the Windows terminal to navigate to your tarql-1.2 folder
* We can now generate an RDF from the CSV (TechCrunchcontinentalUSA.csv) with the tarql mapping (query.sparql) by using the following command:
  ```
  bin\tarql query.sparql TechCrunchcontinentalUSA.csv
  ```
* To save the result into a turtle file, we can use this command:
  ```
  bin\tarql query.sparql TechCrunchcontinentalUSA.csv > output.ttl
  ```
  The output file will be saved automatically in your tarql-1.2 folder and will look like [this](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/tarql-1.2/output.ttl).
  
  *Please note:* for further information on this example see also [Example #1](https://tarql.github.io/examples/) from the tarql website

* Let's try to do the same now with our olympics data:
  * Put the olympics_snippet.csv and also the query_olympics_v1.sparql into your local tarql-1.2 folder.
  * Our sparql query mapping looks like this:
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
  * The command has to be adapted like this:
    ```
    bin\tarql query_olympics_v1.sparql olympics_snippet.csv > output_olympics1.ttl
    ```
    This mapping will generate URIs for every athlete and every athlete will be defined as foaf:Person.
    
    However, in our output you will find `rdf:type  foaf:Person` twice for oa:24, because there are two rows in the CSV for this athlete.
    
    ```
    oa:5    rdf:type  foaf:Person .

    oa:24   rdf:type  foaf:Person ;
            rdf:type  foaf:Person .

    oa:25   rdf:type  foaf:Person .

    oa:26   rdf:type  foaf:Person .
    ```
  * Let's edit the data in our mapping: 
    * We can add name, age, gender, height and weight.
    * Using BIND ?Sex can be transformed to ?Sex_uri to generate an object property. 
    * Moreover, with BIND we are able to get hold of all “NA” (empty strings) for height and weight.
    * We still have the duplicate entries for foaf:age und foaf:Person, because for some persons there is more than one row as they competed in several olympic games. (One way to avoid this, is to have your data separated in several CSV files without having any duplicate columns or rows in the single CSV files. Whenever you might come up with a better solution to get rid of those duplicates, please let me know!)
  * Our adapted sparql query mapping (query_olympics_v2.sparql) looks like this now:
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
* Adapt the command in your terminal and check your new output file that will look like [this](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/tarql-1.2/output_olympics2.ttl):
  ```
  bin\tarql query_olympics_v2.sparql olympics_snippet.csv > output_olympics2.ttl
  ```
* To become acquainted with all the editing options of Tarql you can read through the full [Tarql documentation](https://tarql.github.io).
* Have fun adapting the sparql query mapping to your data! :)



## XML to RDF via XSLT

* Download the [Oxygen XML Editor](https://www.oxygenxml.com/xml_editor/download_oxygenxml_editor.html) and install it.
* Get the example files from the code section of the repository folder [TEI_to_RDF_XSLT](https://github.com/chpollin/Teaching/tree/master/InfoMod/InfoMod_4_TORDF/TEI_to_RDF_XSLT)
* Open the XML file schlandersberger_accounts.xml or the XSL file TEI_to_RDF_get_started.xsl.
* Configure the Transformation Scenario as shown in the screenshot below. 
  * In the tab _XSLT_ choose your source XML file with your data and use the TEI_to_RDF_get_started.xsl for the transformation.
  * Switch to the tab _Output_ and go to _Save as_ where you can enter the path and the file name.

![grafik](https://user-images.githubusercontent.com/30200424/135826810-114585f9-805c-428f-9d40-70c4188ace0f.png)


### Transformation with TEI_to_RDF_get_started.xsl 

* When you apply the transformation scenario with the TEI_to_RDF_get_started.xsl, it will generate an output file showing a basic structure with the root element `<rdf:RDF>` with some namespaces. The output format is XML/RDF.
```
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:schema="https://schema.org/" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:bk="https://gams.uni-graz.at/o:depcha.bookkeeping#" xmlns:void="http://rdfs.org/ns/void#"><...></rdf:RDF>
```
* The stylesheet also generates the element `void:Dataset` which allows you to add metadata to an LOD dataset (you may want to describe where the RDF dump is, which vocabularies were used, how many triples...).
```
<void:Dataset rdf:about="https://example.com#o:depcha.schlandersberger.1">
        <dcterms:title>Digitale Edition der Schlandersberger Rechnungen</dcterms:title>
        <dcterms:publisher>Zentrum für Informationsmodellierung - Universität
            Graz</dcterms:publisher>
        <void:vocabulary rdf:resoruce="https://gams.uni-graz.at/o:depcha.bookkeeping#"/>
</void:Dataset>
```
* You will also find the entity `bk:Transaction` with its data property `bk:entry`. Every `bk:Transaction` corresponds to a transaction in the schlandersberger accounts and is anotated with @ana="bk:entry" in the TEI/XML. 
``` 
<bk:Transaction rdf:about="https://example.com#d1e2396">
  <bk:entry>Item hans Püdd hat geben 1 purd Eÿsen für ussassen zinss üm 6 lb perner von aine Gans das es von meine herrn hat.</bk:entry>
</bk:Transaction>    
```

### Transformation with TEI_to_RDF_taxonomy_to_SKOS.xsl

* The element <taxonomy> can be transfered to [SKOS](https://www.w3.org/2004/02/skos/). With SKOS you can build taxonomies, thesauri etc. within the framework of the Semantic Web. The sample data (schlandersberger_accounts.xml) contains a taxonomy of economic goods (see snippet below).   
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
        <...>
     </category>  
  </taxonomy>
<classDecl>
``` 
* If we now apply the transformation scenario using the TEI_to_RDF_taxonomy_to_SKOS.xsl to the schlandersberger_accounts.xml, we will get the following output (snippet):
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
    <...>
</rdf:RDF>  
``` 
## Transformation of person lists from XML to RDF (Exercise)

* When transforming the data from the file szd_personenliste.xml or from wheaton_accounts.xml with [TEI_to_RDF_listPerson_to_schema_foaf.xsl](https://github.com/chpollin/Teaching/blob/master/InfoMod/InfoMod_4_TORDF/TEI_to_RDF_XSLT/TEI_to_RDF_listPerson_to_schema_foaf.xsl), the result does not look very appealing yet. 
* Think about how you would have to adapt the stylesheet for a better output.


## Other ways to get your data into RDF

### CSV to RDF via OpenRefine + RDF Extension
* See [OpenRefine/RDF Extension Tutorial](https://medium.com/wallscope/creating-linked-data-31c7dd479a9e)


