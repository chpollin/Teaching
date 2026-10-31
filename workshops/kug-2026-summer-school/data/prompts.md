# Prompts der Hands-on-Kette A bis D

Die vier Prompts der M3GIM-Hands-on-Kette zum Kopieren. Reihenfolge wie im Workshop, A und B an Tag 1, C und D an Tag 2. A, B und D laufen mit einem Claude-Modell über claude.ai, C mit einem Gemini-Modell über Google AI Studio.

## A Bereinigung (Claude)

```
Du hilfst bei der Datenbereinigung eines Personenindex aus einem
Musikarchiv. Die angehängte Tabelle stammt aus einer gewachsenen
Sammlung und enthält echte Fehler.

Aufgabe:
1. Vereinheitliche die Namen streng auf das Format "Nachname, Vorname",
   mit genau einem Leerzeichen nach dem Komma und ohne Leerzeichen am
   Zeilenende. Löse Versalschreibung und fehlende Kommas auf. Behalte
   ein Adelspraedikat wie "von" nach dem Vornamen ("Karajan, Herbert von").
2. Finde Dubletten, also Personen, die unter zwei IDs doppelt gefuehrt
   sind. Achte auch auf Dubletten, die nur ueber Kontextwissen erkennbar
   sind, etwa Geburtsname gegen Kuenstlername. Nenne die betroffenen IDs
   und schlage vor, welche ID bleibt und welche wegfaellt.
3. Melde IDs, die aus der laufenden Nummerierung fallen, als
   Pruefhinweis, ohne sie selbst umzunummerieren. Melde ebenso einen
   Eintrag, dessen Name unleserlich oder beschaedigt ist, statt ihn
   zu raten.
4. Bring die Lebensdaten auf ein einheitliches Format JJJJ–JJJJ mit
   Bis-Strich. Faellt ein Wert aus dem Muster, melde ihn als Pruefhinweis.
5. Ziehe die Rolle (Komponist, Dirigent, Saenger und so weiter) aus dem
   Freitext in eine eigene Spalte "rolle" und loese Abkuerzungen auf.
   Lass die urspruengliche Anmerkung stehen, wenn sie mehr sagt als die
   Rolle.
6. Pruefe die Spalte wikidata_id. Bring volle URLs auf die nackte QID.
   Schlage fuer Personen ohne QID eine vor, aber nur, wenn du dir sicher
   bist. Bei Unsicherheit lass das Feld leer und schreibe "pruefen".
   Erfinde keine QID und uebernimm keine ungepruefte QID aus der Tabelle
   ohne Pruefhinweis.

Wichtig: Aendere keine Namen inhaltlich, korrigiere nur Schreibweise und
Struktur. Wenn du etwas nicht entscheiden kannst, sag es, statt zu raten.

Gib das Ergebnis als Tabelle zurueck mit den Spalten:
m3gim_id, name, rolle, lebensdaten, wikidata_id, anmerkung, pruefhinweis

Die Daten stehen in der angehaengten Datei personenindex-uebung.xlsx.
```

## B Extraktion (Claude)

```
Du extrahierst strukturierte Daten aus dem Text eines historischen
Konzertplakats für ein Musikarchiv. Ziel ist, jede benennbare Aussage
als Tupel aus typ, name und rolle zu erfassen.

Erlaubte Werte für typ: person, ort, werk, institution, datum.
Erlaubte Werte für rolle je typ:
- person: Leitung, dirigent:in, sänger:in, Komponist:in, auftritt
- ort: auffuehrungsort, Aufführung, entstehungsort
- werk: Aufführung, auftritt, erwähnt
- institution: auffuehrungsort, gastspiel, rahmenveranstaltung
- datum: Aufführung, erwähnt

Regeln:
1. Extrahiere nur, was im Text steht. Erfinde nichts, ergänze kein
   Wissen von außen.
2. Nutze für rolle ausschließlich die erlaubten Werte. Passt keiner,
   schreibe "unklar" und zitiere die Textstelle.
3. Vereinheitliche Personennamen auf "Nachname, Vorname". Wenn eine
   Person unter einer Namensvariante steht (zum Beispiel Vorname
   abweichend), führe sie unter der wahrscheinlich gemeinten Person und
   vermerke die Variante in der Spalte beleg.
4. Trage in die Spalte beleg die wörtliche Textstelle ein, aus der das
   Tupel stammt.

Gib das Ergebnis als Tabelle zurück mit den Spalten:
typ, name, rolle, beleg

Hier der Text:
[Plakattext von oben einfügen]
```

## C Transkription (Gemini)

```
Transkribiere den Text dieser gescannten historischen Vorlage
vollständig und wortgetreu.

Regeln:
1. Gib den Text zeilenweise so wieder, wie er auf der Vorlage steht,
   von oben nach unten. Bei mehreren Spalten transkribiere Spalte für
   Spalte und kennzeichne den Spaltenwechsel.
2. Übernimm Groß- und Kleinschreibung wie im Original.
3. Löse keine Abkürzungen auf und korrigiere keine alte Rechtschreibung.
4. Kennzeichne unleserliche Stellen mit [unleserlich].
5. Gib nur die Transkription zurück, ohne Deutung.
```

## D Normalisierung mit QID-Vorschlag (Claude)

```
Aus den folgenden extrahierten Angaben soll eine CSV für eine Karte werden.
Normalisiere und schlage Normdaten vor, aber trage keine Koordinaten ein.

Aufgabe:
1. Vereinheitliche jeden Ortsnamen auf eine Form ohne Zusätze (aus "Wien?"
   wird "Wien").
2. Bring jedes Datum auf das Format JJJJ-MM-TT. Ist nur ein Bereich gegeben
   (JJJJ-MM-TT/JJJJ-MM-TT), nimm das Anfangsdatum und behalte den Bereich in
   einer Spalte anmerkung.
3. Schlage für jeden Ort eine Wikidata-QID vor, aber nur, wenn du dir sicher
   bist. Bei Unsicherheit lass wikidata_qid leer und schreibe "prüfen" in
   anmerkung. Erfinde keine QID.
4. Lass die Spalten lat und lon leer. Die Koordinaten werden von Hand aus
   Wikidata übernommen, nicht von dir.
5. Behalte die Archivsignatur als Quelle je Zeile.

Gib eine CSV mit Semikolon als Trennzeichen zurück, Spalten:
signatur;ort;wikidata_qid;lat;lon;datum;anlass;anmerkung

Hier die Angaben:
[Ortstupel aus der Extraktion einfügen]
```
