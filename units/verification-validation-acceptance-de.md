---
title: Verification, Validation und Acceptance
status: draft
created: 2026-10-17
updated: 2026-10-17
language: de
unit_id: verification-validation-acceptance-de
---

# Verification, Validation und Acceptance

Eine Editionsansicht kann technisch funktionieren und eine unsichere Lesung trotzdem als gesicherten Text zeigen. In dieser Einheit prüfen Sie, welche Aussage ein Befund trägt, welche Prüfung noch fehlt und unter welchen Bedingungen eine interne Besprechung vertretbar wäre.

Der Text ist ein nicht abgenommener Lehrentwurf. Die Begriffe folgen vorläufig dem KCE-Entwurf vom 15. Oktober 2026. Seine offene Autorenentscheidung bleibt bestehen.

## Zielgruppe und Lernziel

Die Einheit richtet sich an Studierende und Lehrende der Digital Humanities sowie an Mitarbeitende in Editionsprojekten. Vorausgesetzt wird die Unterscheidung zwischen einer Quelle, ihrer Transkription und ihrer Anzeige. Programmierkenntnisse, ein AI-Konto und ein XML-Validator sind nicht erforderlich. TEI bezeichnet hier ein XML-basiertes Format für die Auszeichnung von Texten; die Übung verlangt keine TEI-Implementierung.

Nach der Bearbeitung können Sie einen Prüfbericht schreiben, der technische Konformität, fachliche Quellenprüfung und zweckgebundene Annahme trennt. Erkennbar wird dies an einer begründeten Befundtabelle und einem Entwurf für eine Annahmeentscheidung, der den konkreten Zustand und seine Grenzen nennt. Die Einheit passt zum Themenbereich ai-literacies und zur Arbeit an digitalen Editionen. Ein bestimmter Kurs ist ihr noch nicht zugeordnet.

## Lehrtext

Technical Verification fragt in der hier verwendeten Lehrterminologie, ob ein Artefakt festgelegte Anforderungen erfüllt. Ein Schema-Check untersucht die kodierten Strukturen anhand eines bestimmten Schemas. Ein bestandener Check reicht deshalb nur so weit wie die Anforderungen, die dieses Schema ausdrückt. Die Darstellung im Browser benötigt eigene Prüfungen. Diese Unterscheidung folgt dem KCE-Ausgangsentwurf, Abschnitt Lehrtext.

Validation bezeichnet dort die fachliche Prüfung an Quelle und Forschungszweck. Bei einer Edition betrifft sie beispielsweise die Begründung einer Lesung und den angemessenen Umgang mit Unsicherheit. Eine fachlich unsichere Lesung kann formal korrekt kodiert sein. Die Beurteilung braucht die Quelle und die editorischen Regeln, die für den jeweiligen Fall gelten.

Acceptance bezeichnet im Ausgangsentwurf die verantwortliche Annahme eines identifizierten Zustands für einen benannten Zweck. Eine interne Besprechung der Darstellung und eine Veröffentlichung verlangen unterschiedliche Nachweise. Die Entscheidung nennt deshalb Zustand, Verwendungszweck, vorliegende Prüfungen, offene Fragen und verantwortliche Rolle. Ein Prüfbericht kann diese Entscheidung vorbereiten.

Das Wort Validation wird auch für formale Prüfungen verwendet. Der Ausgangsentwurf weist ausdrücklich auf Schema-Validierung hin und dokumentiert eine abweichende Begriffszuordnung in älterem KCE-Material. Benennen Sie in Ihrem Bericht jeweils Gegenstand und Kriterium der Prüfung. Die vorläufige Wortwahl dieser Einheit entscheidet diesen offenen redaktionellen Punkt nicht.

Ein weiterer Agent kann einen Prüfhinweis liefern. Für dessen Beurteilung muss erkennbar sein, welche Quelle zugänglich war und was tatsächlich geprüft wurde. In dieser Übung beurteilen Sie einen solchen Bericht anhand seines dokumentierten Umfangs. Eine allgemeine Wirksamkeit agentischer Reviews wird damit nicht untersucht.

## Arbeitsmaterial

Alle folgenden Angaben sind eigens konstruierte Übungsdaten. Sie stammen aus keiner historischen Quelle und aus keinem ausgeführten Modell- oder Validatorlauf. Die Kennungen A bis E dienen nur dem Vergleich im Fall. Es liegt weder ein vollständiges TEI-Dokument noch ein Schema vor. Sie führen deshalb keinen Schema-Check nach, sondern beurteilen die Reichweite eines vorgegebenen Befunds.

| Kennung | Material im Fall |
|---|---|
| A | Redaktionelle Arbeitsnotiz: „Die Lesung des Wortes `Rat` ist unsicher. Vor einer Aussage zur Quelle muss die Stelle am Original geprüft werden.“ Das Original ist im Übungspaket nicht vorhanden. |
| B | Datenzustand B1: Text `Der Rat tagte.`; markiertes Wort `Rat`; Lesestatus `unsicher`; Bezug auf Notiz A. Diese Tabelle beschreibt den Inhalt der Auszeichnung in gewöhnlicher Sprache. |
| C | Prüfprotokoll C1: „B1 besteht den Check gegen Schema S1.“ Weitere Prüfkriterien, die Schemadatei und die Ausführungsumgebung fehlen. |
| D | Anzeige D1: `Der Rat tagte.` Es gibt weder eine sichtbare Unsicherheitsmarkierung noch eine Erläuterung dazu. |
| E | Agentenbericht E1: „Die Transkription wirkt plausibel.“ Der Bericht nennt D1 als Eingabe und dokumentiert keinen Zugriff auf das Original oder B1. |

Für diesen Übungsfall gilt die ausdrücklich gesetzte Darstellungsanforderung R1: Jede in den Daten markierte unsichere Lesung muss in der Anzeige am betroffenen Wort erkennbar sein; eine Erläuterung muss die Bedeutung der Markierung nennen. Für die interne Besprechung soll die Darstellung dieser Unsicherheit diskutiert werden. Über die historische Richtigkeit des Wortes soll dort noch nicht entschieden werden.

## Aufgabe

Bearbeiten Sie die Schritte zunächst ohne den Erwartungshorizont. Papier oder ein lokaler Texteditor genügen. Im Grunddurchgang arbeiten Sie ohne AI-Unterstützung. Optional darf ein bereits zugelassenes System anschließend Gegenargumente zum eigenen Bericht formulieren. Dokumentieren Sie dann Eingabe, Antwort und die Änderungen, die Sie selbst begründet übernehmen. Ein externer Lauf ist für diese Einheit nicht nötig.

1. Vergleichen Sie B1 mit D1 anhand von R1. Benennen Sie den konkreten Unterschied und die Grenze Ihrer Aussage zur Fehlerursache.
2. Füllen Sie die Befundtabelle unten aus. Trennen Sie eine gegebene Behauptung, einen selbst nachvollziehbaren Vergleich und eine fehlende Prüfung.
3. Schreiben Sie eine korrigierte Anzeige D2 als gewöhnlichen Text mit einer verständlichen Markierung und Erläuterung. Prüfen Sie D2 erneut gegen R1.
4. Entwerfen Sie einen Vorschlag für die verantwortliche Editionsleitung. Benennen Sie den vorgeschlagenen Zustand, den Zweck der internen Besprechung, die noch fehlende Quellenprüfung und die Grenze gegenüber einer Veröffentlichung. Formulieren Sie eine ausstehende Entscheidung, keine bereits erteilte Freigabe.
5. Erklären Sie, was E1 zur Beurteilung der historischen Lesung beiträgt und welche Unterlagen für eine belastbare Prüfung nachgereicht werden müssten.

### Abgabevorlage

| Gegenstand | Kriterium oder Frage | Befund mit Materialkennung | Aussagegrenze oder nächster Prüfschritt |
|---|---|---|---|
| Schema-Check C1 | | | |
| Vergleich B1 und D1 | | | |
| Historische Lesung | | | |
| Agentenbericht E1 | | | |
| Eigene Anzeige D2 | | | |

Ergänzen Sie unter der Tabelle die Anzeige D2 und Ihren Entscheidungsvorschlag. Der Vorschlag enthält die verantwortliche Rolle, die Zustandskennungen, den vorgesehenen Zweck, die vorhandenen Nachweise und die offenen Einschränkungen.

## Erwartungshorizont

| Gegenstand | Tragfähiger Befund | Grenze |
|---|---|---|
| C1 | Im Szenario wird Konformität von B1 mit S1 berichtet. | Ohne Schema und Ausführungsnachweis ist der Check hier nicht reproduziert. Selbst ein zutreffender Check belegt die historische Lesung nicht. |
| B1 und D1 | B1 hält die Unsicherheit fest. D1 zeigt sie nicht. Damit verletzt D1 die gesetzte Anforderung R1. | Der Vergleich lokalisiert den Verlust zwischen Daten und Anzeige. Ohne Transformation und Oberfläche zu untersuchen, steht die technische Ursache nicht fest. |
| Historische Lesung | A dokumentiert eine offene Quellenfrage. | Das fehlende Original verhindert eine eigene Entscheidung, ob `Rat` richtig gelesen ist. Auch die Arbeitsnotiz wird dadurch nicht zum Ersatz des Originals. |
| E1 | Der Bericht enthält ein Plausibilitätsurteil zu D1. | Dokumentierter Quellenzugriff und Kriterien für eine historische Lesungsprüfung fehlen. Das Urteil beseitigt die Unsicherheit nicht. |
| D2 | Wortbezogene Markierung und ihre Erläuterung lassen sich gegen R1 vergleichen. | Ein Textentwurf belegt keine Umsetzung in einer wirklichen Editionsoberfläche. |

Eine mögliche Anzeige D2 lautet:

> Der [Rat?] tagte.
>
> `[Wort?]` kennzeichnet eine unsichere Lesung. Die Lesung `Rat` ist noch nicht am Original geprüft.

Andere Markierungen sind möglich, sofern sie R1 erfüllen. Die vorgeschlagene Schreibweise ist eine Übungslösung und keine allgemeine Editionsrichtlinie.

Ein möglicher Entscheidungsvorschlag lautet:

> Der Editionsleitung wird vorgeschlagen, den Zustand aus B1 und dem Textentwurf D2 für eine interne Besprechung der Unsicherheitsdarstellung anzunehmen. Der Vergleich zeigt, dass D2 die Unsicherheit am Wort und in der Erläuterung sichtbar macht. Der Schema-Befund C1 ist im Übungspaket nur berichtet und wurde hier nicht reproduziert. Die historische Lesung bleibt ungeprüft, bis das Original und die geltenden Editionsrichtlinien vorliegen. Eine Umsetzung im Browser und deren Bedienbarkeit wurden nicht geprüft. Eine Veröffentlichung ist von diesem Vorschlag nicht erfasst. Die Entscheidung der Editionsleitung steht aus.

## Ergebnisprüfung und Reflexion

Prüfen Sie Ihre Abgabe anhand der folgenden Kriterien. Eine Lehrperson oder eine andere lernende Person kann denselben Vergleich durchführen und Abweichungen mit den Materialkennungen begründen.

- Die Tabelle behandelt alle vorgegebenen Gegenstände und nennt für jeden Befund einen nachvollziehbaren Beleg oder ausdrücklich das Fehlen eines Belegs.
- Der Unterschied zwischen B1 und D1 ist mit R1 begründet. Die historische Lesung bleibt offen.
- D2 markiert das betroffene Wort und erläutert die Markierung. Der Text behauptet keine bereits ausgeführte Softwarekorrektur.
- Der Entscheidungsvorschlag nennt Zustand, Zweck, verantwortliche Rolle und Einschränkungen. Eine erfolgte Annahme wird nicht erfunden.
- C1 und E1 werden entsprechend ihrem dokumentierten Prüfumfang behandelt.

Falls ein Kriterium fehlt, überarbeiten Sie die betreffende Zeile und erläutern Sie die Änderung. Unterschiede zwischen zwei begründeten Vorschlägen können in der Besprechung bestehen bleiben. Die Kriterien prüfen das Lernziel dieses Falls; sie sind keine validierte Messskala für AI Literacy.

Übertragen Sie den Fall abschließend auf eine eigene Domänenaufgabe. Welche fachliche Frage könnte trotz eines bestandenen Formatchecks offenbleiben? Welche Quelle und welche verantwortliche Rolle müssten dafür hinzukommen? Der konstruierte Fall erlaubt weder einen Befund zur historischen Lesung noch eine Aussage über den Kompetenzzuwachs durch die Einheit.

## Herkunft, Rechte und Prüfstand

Ausgangspunkt ist der vollständig gelesene KCE-Entwurf [Verification, Validation und Acceptance](../../../DHCraft/knowledge-context-agentic-engineering/script/drafts/verification-validation-acceptance-de.md) vom 15. Oktober 2026. Gelesen wurde die lokale Datei im Repository `DigitalHumanitiesCraft/knowledge-context-agentic-engineering` bei Commit `5455a3b`. Der Link öffnet den benachbarten lokalen Checkout in der vorhandenen Ordnerstruktur; außerhalb dieser Struktur ist die Quelle über Repository, Commit und Dateipfad aufzufinden. Ihre Lehrbegriffe und ihr Editionsszenario wurden zu einer Aufgabe mit explizitem Datenzustand, Darstellungsanforderung, Abgabevorlage und Erwartungshorizont ausgearbeitet. Die Zielgruppe und der Verzicht auf eine Programmieraufgabe sind didaktische Vorschläge dieser Adaption. Die lokale Quellenprüfung betrifft diesen vollständigen Entwurf; seine Literatur- und Google-Abgleiche wurden hier nicht erneut durchgeführt. Es wird keine neue externe Literatur als geprüft ausgegeben.

KCE führt Originaltexte unter CC BY 4.0. Diese Adaption folgt der bestehenden [Textlizenz von Teaching](../LICENSE-CC-BY), ebenfalls CC BY 4.0. Als Herkunft sind KCE und Digital Humanities Craft sowie diese Teaching-Adaption zu nennen. Das Arbeitsmaterial ist eigens konstruiert; es enthält keine übernommenen Faksimiles, Bilder oder personenbezogenen Quelldaten. Die unveränderten KCE-Ausgangsmaterialien behalten ihre eigenen Pflegeorte und Rechtehinweise.

Der Entwurf wurde mit Codex ausgearbeitet. Der redaktionelle Abgleich und der manuelle Durchgang des Falls durch dieselbe Arbeitssession sind von einer unabhängigen Prüfung und einer Erprobung mit Lernenden zu unterscheiden. Fachliche und didaktische Abnahme stehen aus. Die offene KCE-Terminologieentscheidung RD-002 und die Annahme des Ausgangsentwurfs RD-025 werden durch diese Adaption nicht entschieden. Die Einheit ist lokal erschlossen und nicht veröffentlicht.

[Zur Materialübersicht](README.md)
