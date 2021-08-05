# Einführung in XML und TEI

[Folien: XML & TEI](https://docs.google.com/presentation/d/1fl0mrNu-NYNPvR9EhfEAedEdb8qoTlE-vXvN0PnKsis/edit?usp=sharing)

[Video: XML](https://youtu.be/1ap-zO_bTMs)

[Video: TEI](https://youtu.be/j0VwsoGEfrk)

## Literatur

## Übungen

**Die Lösungen zu diesen Übungen findest du [hier](https://github.com/chpollin/Teaching/tree/master/TTT/TTT_1_XML_TEI/Uebungen).**

**1.) Suche dir eine Geschichte aus im [Struwwelpeter](https://de.wikisource.org/wiki/Der_Struwwelpeter) Überlege dir ein einfaches XML-Modell, wie man diese Geschichten auszeichnen/strukturieren könnte.**

- Die Tiefe und Komplexität sollte sich am “Memo”-Beispiel orientieren.
- Nutze den XML-Editor Oxygen dafür. 
- Verwende nur maximal 5 unterschiedliche Elemente und 2 unterschiedliche Attribute.
- Verwende aber auch mindestens ein Element aus dem Dublin Core und binde den Namespace ein. 
- Lade dein XML-Dokument auf Moodle hoch.

Das XML muss wohlgeformt sein.

**2.) Suche dir eine Geschichte aus im [Struwwelpeter](https://de.wikisource.org/wiki/Der_Struwwelpeter). Überlege dir wie du diese Geschichte als XML/TEI Dokument beschreiben kannst.**  

Befülle den teiHeader mit den Metadaten, beschriebe die äußere Struktur  des Textes und füge einfache Annotationen hinzu. Unter einfachen  Annotationen verstehen sich in dieser Übung die Auszeichnung von Namen,  Orten, Datumsangaben oder anderen Begriffen, die dir wichtig erscheinen. Versuche diese Entitäten mittels Attribute zu normalisieren bzw. zu  klassifizieren. 

Nutze den XML-Editor Oxygen dafür. Das XML/TEI muss wohlgeformt und valide sein.

## Assignment 1 - XML, TEI und RELAX NG für den Stuwwelpeter

Du bist moderne Pädagogin/moderner Pädagoge und findest was im [Stuwwelpeter](https://de.wikipedia.org/wiki/Struwwelpeter) vermittelt wird so gar nicht zeitgemäß. Du hast dir überlegt eine digitale Edition des Stuwwelpeter zu erstellen, in der du  bestimmte Textpassagen versuchst zu kommentieren. Auf https://de.wikipedia.org/wiki/Struwwelpeter findet man recht viel Informationen dazu. Versuche unter diesem Gesichtspunkt und dem möglichen (fiktiven) Forschungsinteresse einer Pädagogin/eines Pädagogen folgende Aufgaben durchzuführen: 

1. Erstelle ein XML Dokument in dem du “[Zur hundertsten Auflage](https://de.wikisource.org/wiki/Der_Struwwelpeter/Zur_hundertsten_Auflage)”, “[Vorspruch](https://de.wikisource.org/wiki/Der_Struwwelpeter/Vorspruch)”, “[Struwwelpeter](https://de.wikisource.org/wiki/Der_Struwwelpeter/Struwwelpeter)”, sowie eine Geschichten deiner Wahl mit XML auszeichnest. Entwickle deine eigenen Kriterien dafür. Richte es aber so aus, dass du auch Kommentare an bestimmte Textpassagen knüpfen kannst (wie eine Fußnote). Verwende min 8 unterschiedliche Elemente und min 2 Attribute. Überlege dir wie du die Metadaten zum Buch Stuwwelpeter modellierst.
2. Entwerfe ein XML-Schema mit RELAX NG, das genau deinem Markup aus erster Aufgabe entspricht.
3. Erstelle ein XML/TEI zu [Zur hundertsten Auflage](https://de.wikisource.org/wiki/Der_Struwwelpeter/Zur_hundertsten_Auflage), [Vorspruch](https://de.wikisource.org/wiki/Der_Struwwelpeter/Vorspruch), [Struwwelpeter](https://de.wikisource.org/wiki/Der_Struwwelpeter/Struwwelpeter), sowie 3 Geschichten deiner Wahl (https://tei-c.org/guidelines/). Versuche nun nicht nach deinem Modell auszuzeichnen, sondern verwende die TEI dazu. Verwende min 8 Elemente und 2 Attribute Überlege dir wie du die Metadaten zum Buch Stuwwelpeter sinnvoll im teiHeader modellierst.

4. Schreibe eine Reflexion deiner Arbeit. Suche dir 3 passende Begriffe rund um das Thema “Digitale Edition” ([KONDE](https://www.digitale-edition.at/archive/objects/context:konde/methods/sdef:Context/get?mode=terms)) und führe sie mit der fiktiven digitalen Edition des Struwwelpeters zusammen. Welche Begriffe bringst du damit zusammen und warum?  (max. 2 Seite).
Alternativ kannst du statt der Reflexion einen Foliensatz/eine Präsentation (~5min) deiner Arbeit vorberieten und deine Ergebnisse und deine Gedanken (Struwwelpeter + “Digitale Edition”) den Kolleginnen und Kollegen im nächsten Blocktermin präsentieren.
5. Lade auf Moodle ein ASS1_NACHNAME.zip hoch, das insgesamt 4 Files beinhaltet: zwei .xml (deine Auszeichnung, TEI Auszeichnung), ein .rng und ein Text/Word-File beinhaltet.


