# M3GIM Mobilitätskarte, Workshop-Demo

Minimale statische Karte als Abschluss der Hands-on-Kette für die KUG Summer School und den GDA-Göttingen-Workshop. Sie zeigt datierte Auftritte aus dem Nachlass Ira Malaniuk (Kunstuniversität Graz, Signatur UAKUG/NIM) als Punkte auf einer neutralen Basiskarte, verbunden in zeitlicher Reihenfolge.

## Zweck im Workshop

Endpunkt der Kette Bild zu Text zu Tupeln zu Karte. Die Teilnehmenden erzeugen aus extrahierten und normalisierten Angaben eine `data.csv` und sehen sie hier als Karte. Der Schritt macht das Thema strukturierte Daten und Normalisierung greifbar, weil die Karte ohne einheitliche Datumsangaben, einheitliche Ortsnamen und ergänzte Koordinaten nicht funktioniert.

## Starten

Die Seite liest `data.csv` per fetch und läuft deshalb nur über einen lokalen Server, nicht per Doppelklick.

```
python -m http.server
```

Dann die angezeigte Adresse im Browser öffnen. In VS Code alternativ Live Server auf diesem Ordner.

## Daten

`data.csv`, semikolongetrennt, Spalten `signatur;ort;lat;lon;datum;anlass`. Die Zeilen stammen aus echten Plakaten des Bestands (Objekttabelle M3GIM). Die Koordinaten sind als Anreicherung ergänzt, der Bestand selbst trägt keine.

## Herkunft

Datenquelle ist das M3GIM-Projekt (`DHCraft/m3gim`). Das zugehörige Hands-on-Material mit Aufgabenstellungen und Prompts liegt im Vault unter `Teaching/Workshops/2026-07-19 - M3GIM Hands-on Demo-Korpus.md`.
