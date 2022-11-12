# Abstract

Die Lehrveranstaltung bildet eine theoretische und praktische Einführung in die Modellierung von geisteswissenschaftlichen Daten mit XML, wobei ein besonderer Fokus auf den Standard Text Encoding for Interchange (TEI) gelegt wird. TEI hat sich in den letzten zwei Jahrzehnten zu einem de-facto-Standard für die semantische Auszeichnung und Anreicherung von geisteswissenschaftlichen Daten entwickelt und kommt zum Beispiel bei der Entwicklung von digitalen Editionen, digitalen Sammlungen und linguistischen Textkorpora zum Einsatz.
In der Lehrveranstaltung wird durch eine Mischung aus Vortrag, Diskussion und praktischen Übungen in das Arbeiten mit XML und Schemasprachen, Grundlagen der Modellierung und Textauszeichnung mit TEI und das Arbeiten mit den TEI Guidelines, sowie X-Technologien eingeführt. Es wird exemplarisch (Schritt für Schritt) eine digitale Edition umgesetzt: von der XML/TEI Kodierung bis zur basalen Webdarstellung mittels X-Technologien (XPath, XSL-Transformation, etc.).

# Sessions

* Einführung in XML und TEI
* Digitale Edition
* XML Schema (RELAX NG)
* Textkodierung - TEI vertieft
* XPath
* XSLT
* Tools und Workflows

# Assignments

## Assignment 1 - Projektidee & Basisannotation in XML/TEI

### Projektskizze 

Überlege dir ein Thema für eine digitale Edition und suche dir dafür Material (bis zu 5 Seiten Text reichen aus). Überlege dir welche Forschungsfragen interessant sein könnten, sowie was du annotieren bzw. auszeichnen möchtest. Beschreibe dein Vorhaben auf einer Seite. 

### XML/TEI  

Überführe den Text deine Materialien in ein XML/TEI Dokument und zeichne dort die grundlegende Textstruktur aus. Das sind Paragraphen, Überschriften, Zeilen- oder Seitenumbrüche etc.. Verknüpfte dein XML/TEI mit den Digitalisaten. Annotierte noch keine inhaltlichen Dinge, wie Personen, Orte, Datumsangaben etc. Versuche weiters einen einfachen teiHeader zu gestalten, wo grundlegende Metadaten zur Quelle, dem Editionsvorhaben etc. abgebildet werden. Diese XML/TEI Dokumente (wenn du mehrere Ausgangsdokumente hast; kann aber auch nur ein einzelnes Dokument sein) werden in den folgenden Assignments erweitert. Sei vorbereitet deine Arbeit in 5 min zu präsentieren.

## Assignment 2 - Vertiefte XML/TEI Annotation

Ausgehend von deiner Forschungsfrage und deinem XML/TEI Grundgerüst aus Ass1 wird in Ass2 tiefer annotiert. Und zwar hinsichtlich Named Entities (Personen, Orte, Organisationen, etc.) oder anderer semantische, linguistische, textkritische oder philologische Phänomene. Dabei ist wichtig diese Phänomene mittels Indices, Taxonomien sowie über andere Normdaten (GND, GeoNames, Wikidata) etc. zu normalisieren. Setze weiters einen detaillierten teiHeader um, der Informationen zur Edition, Quelle (physikalisch, Standort), Publikation, oder anderen wichtigen Aspekten umfasst. Das Recherchieren der geeigneten Elemente und Attribute in der TEI ist Teil der Aufgabe.  

Desto detaillierter und tiefer ausgearbeitet, desto besser für die Note.  

Lade bitte die/das XML/TEI File(s) hoch. **Diese müssen wohlgeformt und valide sein!**

## Assignment 3 - Web-Repräsentation / Digitale Edition mit XSLT

Das aus Ass 2 entstandene XML/TEI soll nun mittels XSLT zur einer Web-Repräsentation transformiert werden. Wir machen das lokal und mit dem Oxygen XML Editor. Schreibe dazu eine XSL Transformation, die deine Ausgangsdaten in eines für deine Forschungsfrage passende Frontend Interface überführt. Gegebenenfalls musst du etwas an deinem XML/TEI anpassen, weil dir jetzt eine Unstimmigkeit aufgefallen ist. Zur Beurteilung muss in der Lage sein die Transformation auch bei mir lokal durchführen zu können.  

Styling und Design sind nicht zentral für dieses Assignment. Es gibt ein Bootstrap 5 basiertes Framework, das zu verwenden ist. Im Fokus steht der geschrieben XSLT Code, der aus deinem XML/TEI ein HTML generiert.  

Du musst in der Lage sein deinen Code erklären zu können.

## Assignment 4 - Analyse, Reflexion und Review
