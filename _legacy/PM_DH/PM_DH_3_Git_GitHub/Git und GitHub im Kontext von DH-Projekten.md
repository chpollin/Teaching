#pm_dh #projectmanagement

* *[Folien](https://docs.google.com/presentation/d/17QrDqIVVFtxc7_AMzSI8zGGMyMGS21DB8ciWEg1OCXE/edit?usp=sharing)

# Literatur und Ressourcen

* [openHPI (2020). Let’s Git - Versionsverwaltung und OpenSource](https://open.hpi.de/courses/git2020)
* Blischak, J. D., Davenport, E. R., & Wilson, G. (2016). A quick introduction to version control with Git and GitHub. PLoS computational biology, 12(1), e1004668.
* Git and GitHub Introduction, [https://www.w3schools.com/git/git_intro.asp?remote=github](https://www.w3schools.com/git/git_intro.asp?remote=github)
* Git and GitHub Tutorial For Beginners | Full Course [2021] [NEW], [https://www.youtube.com/watch?v=3fUbBnN_H2c&ab_channel=Amigoscode](https://www.youtube.com/watch?v=3fUbBnN_H2c&ab_channel=Amigoscode)

# Skript

### Einführung

### Agenda

* Einführung (15 min)
* Git und seine Grundprinzipien (45 min)
* Arbeiten mit GitHub (45 min)
* GitHub als Projektmanagement Tool (45 min)
* GitHub und Dokumentation (45 min)
* Recap und Wiederholung  (30 min)

### Lernziele

* Beschreiben und Verstehen der Grundlagen von Git und der grundsätzlichen Git Workflows (anlegen, einchecken, staging, commiting).
* Umgang mit der Software GitHub Desktop und das Anwenden grundsätzlicher Git Workflows in GitHub.
* Nutzen der Aspekte des Projektmanagements von GitHub (issues etc.) und kennenlernen von Best Practices.
* Nutzen der Möglichkeiten der Dokumentation vinnerhalb von GitHub und kennenlernen von Best Practices.

#### 1. Block - Git und seine Grundprinzipien

“_I’m an egotistical bastard, and I name all my projects after myself. First ‘Linux’, now ‘Git’._”

Ein Vorgänger System, das von Linux-Entwickler*innen verwendet wurde, konnte nicht mehr kostenlos verwendet werden und so entschloss der Erfinder von Linux - Linus Torvald - seine eigene Quellcode-Management-Software zu entwickeln. Was rauskam, ist Git. Und Git heißt eben auch “Blödmann”. Aber eigentlich dachte sich Linus Torvald, dass “Git” einfach ein kurzer Befehl ist, den man sich leicht merken kann. 

Was ist Git? #Git ist ein freies, verteiltes Versionsverwaltungssystem für Dateien. Eine oder mehrere Personen sind so in der Lage, an einer gleichen Codegrundlage - also mit Dateien - zu arbeiten. Jeder/jede sieht die Änderungen des anderen, man kann gemeinsam Versionen verwalten, man sieht “was hat der/die andere gemacht?” und wenn es Konflikte gibt - also bei unserer gemeinsamen Arbeit ist was schiefgegangen - dann können wir diese Konflikte strukturiert beheben. Git ist vielleicht so etwas wie ein Mediator. Git erlaubt es, die ganze Geschichte des Entwicklungsprozesses einer Software zu dokumentieren und mit Dateien kollaborativ zu arbeiten.

Und genau mit dieser Kerntechnologie - Git -, die wirklich State-of-the-Art ist - jeder/jeder im IT-Bereich arbeitet, damit und es ist in der Entwicklung von Software nicht mehr wegzudenken ist, werden wir uns im 1. Block beschäftigen.

**Begriffe**

Aber schauen uns wir vorher noch ein paar Grundbegriffe an.

**Was ist eine Datei?** 

Diese Frage mag trivial klingen, aber es geht um das Verwalten unsere Dateien. Wir wollen kollaborativ und möglichst effizient an unseren Dateien arbeiten. Dateien sind nach bestimmten Strukturen geordnete Daten. Unsere Text- oder Bilddateien. Beispielsweise .jpg oder .png für Bilder und eben auch unsere XML-Dateien. In einem Editionsvorhaben arbeiten mehrere Personen an einer gemeinsamen Sammlung an XML/TEI Dateien. Daten werden gelöscht, hinzugefügt, geändert. Dateien verändern sich also. Das wäre doch schön, wenn man immer einen guten Überblick über alle Änderungen hätte.

**Was ist eine Version?** 

Eine Version beschreibt den Inhalt einer Datei zu einem bestimmten Zeitpunkt und jede Änderung erzeugt eine neue Version. Ab wann wird von einer neuen Version gesprochen? Technisch gesehen, wenn sich ein Zeichen ändert, aber das ist nicht immer pragmatisch. Von einer digitalen Edition wollen Sie ja keine neue Version, nur weil sie einen Buchstaben - oder vielleicht gerade doch, weil sie auf der Ebene von Zeichen edieren - ausgebessert haben, sondern vielleicht eher, wenn inhaltlich eine Veränderung geschieht, oder ein größerer Eingriff. Aber das ist ein anderes Thema.

**XML-Beispiel**

Ich habe hier ein einfaches XML Beispiel. Eine XML Datei, die ein Memo beinhaltet mit dem Text “For your support thank I must!”. Und vielleicht möchte man statt den Anführungszeichen auch eine XML Element verwenden und setzt die direkte Rede in ein &lt;q> Element. Schon haben wir eine neue Version dieses Dokuments. Und wenn Sie jetzt damit weiter arbeiten wollen, dann hilft Git und Anbieter der Software Git - wie #GitHub - genau diese Art von Veränderungen zu dokumentieren, austauschen zu können und nachzuvollziehen. 

**Was ist Versionskontrolle?**

Das ist der Sinn einer Versionskontrolle. Diese ermöglichen die Verwaltung verschiedener Versionen von Dateien und erlauben so einen “Blick zurück” durch die Versionen von Dateien.

Da gibt es - mal ganz einfach gesagt:

* **Lokale Versionskontrollen** - auf unserem Rechner wissen wir über eine Datei, dass sie sich in der 3. Version befindet. 
* **Zentralisierte Versionskontrollen**, ein Server weiß über die Version einer Datei Bescheid und diese sind am Server gespeichert. 
* **Verteilte Versionskontrolle**: lokale Rechner und Server gemeinsam wissen über die Versionierung. Sie spiegeln sich also gegenseitig. Bei einer zentralen Versionskontrolle kann es beim Ausfall des Servers zu großen Problemen kommen. Verteilte Systeme sind da sicherer und stabiler. 

**Git ist - nochmal zusammenfassend - ein verteiltes Versionsverwaltungssystem von Dateien. Wie funktioniert es jetzt genau? **

Wir haben eine XML-Datei. Diese Datei befindet sich in unserem Working Directory. Das Working Directory oder auch Working Tree genannt umfasst alle Dateien an denen gerade gearbeitet wird. Vielleicht alle XML/TEI Dateien an denen Sie im Editionsvorhaben arbeiten.

* Bei Git gibt es dann noch die sogenannte **Staging Area** und die **Commit History**. 
* Das XML wurde bearbeitet und wir haben eine neue Version.
* Die Information über die Änderung muss jetzt in unser System - in unser Git. Dafür verwenden wir den Befehl: <strong><code>git add memo.xml</code></strong> Das würde man so in den Computer eingeben bzw. mit einem Programm “in Auftrag” geben. Das schauen wir uns noch genauer an. Jeder Befehl beginnt immer mit git, damit man auch weiß welches “add” es ist. <code>add</code> ist der eigentlich Befehl - wir wollen unsere veränderte Datei - eben <strong><code>memo.xml</code></strong>- in der Staging Area anmelden. Wir wollen diese Datei hinzufügen - liebes Git - aber noch nicht “den anderen” mitteilen. 
* Ist eine Datei mit add im System aufgenommen, können wir nun mit <strong><code>git commit</code></strong> sagen, dass für alle angemeldeten Dateien, wenn es eine Änderung gibt, ein Commit eröffnet wird. Ein Commit ist ein save point / ein Sicherungspunkt. Wir haben genau den jetzigen Status unsere Dateien gesichert. Von der Staging Area kommt es also in die Commit History. Und dort reihen sich die Commits / die Sicherungspunkte.

→ alles was bis jetzt passiert ist, ist auf unserem lokalen Rechner passiert.

**Lokaler Rechner und Remote Server**

Jetzt braucht es noch einen Server für die verteilte Versionskontrolle. GitHub ist eine Hosting Plattform, die es uns erlaubt unsere Projekte zu hosten. Andere solcher Hosting Plattformen sind GitLab oder beispielsweise Codecommit. Diese Hosting Plattform nutzen die Software Git für ihre Services. Mit dem Befehl <strong><code>git pull</code></strong> schicken wir nun unsere Commits gegen den Server. Noch konkreter zu einem Git Repository und ein Repository (Repo) beinhalten eine Sammlung von Dateien verschiedener Versionen eines Projekts. 

Unsere Dateien, mit ihren Änderungen werden am Server abgeglichen und - wenn es keine Konflikte gibt - dementsprechend upgedated. Mit dem Befehl `git pull` können sich jetzt alle anderen die letztgültige Version vom Server herunterziehen. Erst jetzt ist die Änderung von ihrer Kollegin/ihrem Kollegen auch auf ihrem lokalen Rechner, Sie können eine Änderung machen, es kommt in die Staging Area, diese Änderung commiten - es gibt einen neuen registrierten Sicherungspunkt und dann auf GitHub - auf den Server - pushen, und alle anderen können sich die aktuellen Daten wieder pullen.

**Git Befehle**

Schauen wir mal auf die Git Befehle, von denen wir bis jetzt gehört haben. Das sind bei weitem noch nicht alle, aber mal ganz wichtige. 

* $ git add
* $ git commit
* $ git push
* $ git clone
* $ git pull
	* Der Befehl git pull ist eigentlich eine Kombination aus zwei anderen Befehlen: git fetch gefolgt von git merge. In der ersten Phase führt git pull einen git fetch aus, der den lokalen Branch umfasst, auf den HEAD verweist. Sobald die Inhalte heruntergeladen wurden, startet git pull einen Merge-Workflow. Es wird ein neuer Merge-Commit erstellt und HEAD wird so aktualisiert, dass er auf den neuen Commit verweist.
	* $ git fetch
	* $ git merge

**Grundprinzipien von Git**

Schauen wir nur als kurzen theoretischen Einschub auf die Grundprinzipien von Git.

1. **Snapshots, statt Unterschiede**
   Git betrachtet seine Daten wie eine Reihe von Schnappschüssen. Es gibt also nicht eine Liste von Dateien, wo jeder Datei mit ihren Änderungen abgespeichert ist, sondern, es handelt sich um einen Stapel von Schnappschüssen. 
2. **Fast jede Operation ist lokal**
   Die meisten Aktionen in Git benötigen nur lokale Dateien und Ressourcen, um ausgeführt zu werden – im Allgemeinen werden keine Informationen von einem anderen Computer in Ihrem Netzwerk benötigt.
3. **Git stellt Integrität sicher**
   Von allen zu speichernden Daten berechnet Git Prüfsummen (engl. checksum) und speichert diese als Referenz zusammen mit den Daten ab. Das macht es unmöglich, dass sich Inhalte von Dateien oder Verzeichnissen ändern, ohne dass Git das mitbekommt.
4. **Git fügt im Regelfall nur Daten hinzu**
5. **Die drei Zustände**
   Eine wichtige Information im Umgang mit Git. Git definiert drei Hauptzustände, in denen sich eine Datei befinden kann: committet, geändert und für Commit vorgemerkt als _staged_
   1. **Modified** bedeutet, dass eine Datei geändert, aber noch nicht in die lokale Datenbank eingecheckt wurde.
   2. **Staged** bedeutet, dass eine geänderte Datei in ihrem gegenwärtigen Zustand für den nächsten Commit vorgemerkt ist.
   3. **Committed** bedeutet, dass die Daten sicher in der lokalen Datenbank gespeichert sind.

#### 2. Block - Arbeiten mit GitHub

Wo wir gerade theoretisch über die Dinge geredet haben, werden wir das jetzt praktisch umsetzen. 

**Command Line vs. GUI Clients**

Wo und wie geben wir die Git -Befehle ein?
Es gibt zwei Welten: Die Welt der Coder und Hacker, die immer mit der Command Line arbeiten und die Befehle als Text eingeben in eine Konsole bzw. Terminal. Und die Welt der Menschen, die mit einem GUI Client - also einem Graphical User Interface arbeiten, das es einer Userin erlaubt, mit der Mouse ein Interface zu nutzen, um so dieselben Befehle in Auftrag zu geben. Das ist wichtig, egal ob Konsole oder UI wir machen genau dieselben Dinge. 

Command Line ist eher relevant, wenn viele Funktionalitäten von Git verwendet werden, was für Softwareentwicklung zentral ist. Ich selber arbeite auch mit einem GUI, wenn ich Git verwende - und zwar mit GitHub Desktop. Das kann man auf Mac und Windows verwenden. Arbeite ich mit meinem privaten Laptop - dort habe ich Linux als Betriebssystem, dann arbeite ich mit der Command Line. 

Aber es gibt eine Fülle von Tools, die Git einsatzfähig machen: TortoiseGit, Git Extensions oder GitKraken. Prinzipiell könnten sie alle auch mit unterschiedlichen Tools arbeiten: 3 haben GitHub Dekstop, 5 andere haben Git Extension und dann gibts noch eine Gruppe mit GitKraken. Nicht dass ich das empfehlen würde, aber rein technisch sollte das kein Problem sein, da alle Tools ja Git unterstützen und Git ja in den Tools umgesetzt wird.

**Gemeinsames Hands-On: “mein memo.xml” Slides 1-7**

Legen wir direkt los mit einem ersten Hands-On. Wir haben Git Hub Desktop installiert und wir haben ein gemeinsames GitHub Repository und zwar das [https://github.com/KlassikStiftungWeimar/Test-Training-Repo](https://github.com/KlassikStiftungWeimar/Test-Training-Repo). Wir wollen nun mit den Dateien diese Repoitories arbeiten. Dafür müssen wir es clonen. Weiters möchte ich Sie einladen einen eigenen Ordner anzulegen und darin ein XML, wie das memo.xml, pushen.

Gehen wir das Schritt für Schritt durch: 

Zuerst erstelle ich einen neuen Ordners mit dem Namen GitHub. Ich habe den auf meinem lokalen Rechner hier C:\Users\pollin\Documents\GitHub. Der kann liegen wo Sie das möchten, aber der Ordner Documents auf Windwos System würde sich anbieten. Und hier sieht man nun bei mir alle GitHub und GitLab Repositories, die ich hier verwalte. Und stimmt ich hab einen GitHub Ordner in dem ich GitLab auch als Repository habe - das ist nicht konsistent. Aber es ist ja alles Git, egal ob GitHub oder GitLab. Das funktioniert im Kern gleich. Das sind also alles meine lokalen Repositories. 

* Clonen das Repository [https://github.com/KlassikStiftungWeimar/Test-Training-Repo](https://github.com/KlassikStiftungWeimar/Test-Training-Repo)
* KlassikStiftungWeimar Ordner anlegen
* neues XML erstellen
* umbenennen, verändern und im Ordner “xml” ablegen
* Achtung, bei gleichen Vornamen, also gleichen Dateinamen! - kann jetzt aber gerne auch passieren.
* Commit und Nachricht
* Staging Areay → Commit History → push → pull
* History in Git hub Desktop
* Fetch origin
* Bearbeite von XML Dokumenten von anderen.
* Konflikte (das aber später noch genauer)
* GitHub Ansicht von [https://github.com/KlassikStiftungWeimar/Test-Training-Repo](https://github.com/KlassikStiftungWeimar/Test-Training-Repo) 

**“The Perfect Commit”**

[Folieininhalt]

* Verschriftlichte Konvention 
* eigene Best-Pratice festschreiben 
* abhängig von Teamgröße, Anforderungen, Komplexität und Effizienz
* für neue Mitarbeiter*innen gut

**Zusammenfassung [Pause?]**

Was haben wir gerade gemacht? Wiederholung.

**Branches 1**

Jeder Commit ist bei einem Hash identifiziert. Alle Commits sind innerhalb eines Branches. Wir haben bisher den **main branch** verwendet. Neben dem main branch können wir zusätzliche branches anlegen, wobei ein Branch stets einen weiteren unabhängigen Entwicklungsprozess repräsentiert. Eben dafür gedacht, falls ein zweiter oder dritter Entwickler ein neues Feature entwickeln will, dann nimmer er sich zum aktuellen Zeitpunkt den main branch und erzeugt seine Abzweigung auf der nun unabhängig entwickeln kann. Ist das Feature fertig, also die Indexansicht einer digitalen Edition, dann kann es wieder zurück in den main gebracht werden. Oder anders Beispiel:  jemand macht einen neuen branch und bearbeitet den teiHeader, jemand anderer macht einen neuen branch für den body. Jetzt können beide parallel und unabhängig voneinander arbeiten und zu einem Zeitpunkt X kommt das eine und dann das andere wieder in den main branch. 

Der main branch heißt erst seit kurzem so und wurde früher master branch genannt. Wenn Sie wo einen master branch sehen, dann ist das eben der main. 

**Branches 2**

[Darstellung Branches erklären]

**Branches und Pull request**

In unserem Test GitHub habe ich zwei Branches erstellt: teiHeader und teiBody. Ich habe in teiHeader branch 3 bibl Elemente im teiHeader hinzugefügt und im teiBody branch ein fehlendes &lt;p> am Ende ausgebessert. Wir sehen das in der History in GitHub Desktop. Dann habe ich - was natürlich nur bedingt sinnvoll ist alleine - die Banches einen nach dem anderen wieder gemerged. Das macht man mit Pull request - also einer Anfrage, ob wir etwas in main pullen dürfen. Da muss nämlich jemand das Okay geben, ob eh alles passt. Bzw. ist es sinnvoll so einen Workflow aufzusetzen.

* Erzeugen wir nun noch 2 weitere &lt;bibl> im header und fügen wir noch ein &lt;p> i Body hinzu. 
* Zeigen, dass wechsel der Branches in GitHub Desktop auch zu wechseln der Daten im Ordner führt.
* Den Pull Request Workflow vorzeigen.

**Hands-On: eigener Branch**

* ein branch mit dem eigenen name ist jetzt nicht so sinnvoll: besser development, feature X, staging, … also die Funktion eines branches bennen. 

**Merge Conflicts**

Es kann natürlich was schiefgehen und es kommt zum Konflikt. Reden wir darüber, was Konflikte sind, wann sie passieren und warum und wie wir sie bereinigen können. 

Sie passieren, wenn wir etwas mergen, also unsere lokalen Daten in ein Repository pushen. Also Beispiel beim mergen von branches, oder wenn 2 Personen die gleiche Datei bearbeitet haben und am Repo noch eine ältere Version ist. Einige Sachen merged Git automatisch, sowas wie Leerzeichen in einem XML. Das ist kein Problem, aber dann gibt es Situationen, wo Git nicht entscheiden kann, was die aktuellste Variante ist. Der Klassiker ist, wenn die gleich Zeile Code von zwei Personen in zwei separaten Commits verändert wurde und Git weiß dann nicht welcher Commit zu präferieren ist.

* Man kann einen Konflikt immer rückgängig machen und zur Version davor zurückgehen.
* Wir müssen einfach die Datei wieder in die richtige Form bringen. Mit den Kolleg*innen zu reden; es gibt Tools, die helfen. 

**“Branching Strategies”**

Git lässt es einem komplett offen, wie man mit branches arbeitet. Git liefert nur das Tool, wie man es am besten für seine Arbeit nutzt, muss man selber festmachen. Auch hier bietet sich eine verschriftlichte Konvention an

* Mainline Development
    * Man arbeitet in ein gemeinsames main
* State, Releases, and Feature Branches
    * Long-Running Branches (main)
    * Short-Lives branches (ein Feature, Bugfix etc.)
* GitFlow

Keine Herangehensweise ist schlechter, oder besser. Es kommt halt darauf an. man arbeitet meistens zwischen den Extremen. Aber da würde ich gar nicht zu viel Zeit investieren, da Ihre Anforderungen nicht so komplex sind. Sich ausreden, wer für was zuständig ist, jemand der einen Überblick über alles hat, gemeinsame Regeln beim Commiten etc. \
Und wenn man mehr Struktur möchte, überlegt man sich branches.

#### 3. Block - GitHub als Projektmanagement Tool

GitHub kann man wirklich auch gut als Tool für das Projektmanagement nutzen. Ich finde es persönlich nicht zu umfangreich und man kann findet relativ schnell seine Dinge. Wir verwenden es auch in der Firma als Tool zum Projektmanagement und am ZIM in Graz verwenden wir GitLab, was aber sehr ähnliche Funktionalitäten hat. Das Praktische an GitHub ist, dass unsere Dateien ja sowieso dort sind. Also das Projektmanagement ist der Dateien zentriert und das empfinde ich im Kontext von DH Projekten recht angenehm. 

In diesem Block werden wir die wichtigsten PM Werkzeuge, die GitHub liefert, uns anschauen und auch ausprobieren.

Wir werden uns Issues, Labels, Milestones und Projects in GitHub anschauen. Wieder gilt: GitHub liefert ein Werkzeug und es gibt nicht die eine richtige Anwendung, sondern man muss sich das selber organisieren. 

**Issues**

Mit Issues wird die Arbeit getrackt, also mitgeschrieben. Sie drücken aus: wer macht wann was. Wie wichtig ist was, gibts was Wichtiges zu berücksichtigen, wer kann mir wie konkret helfen. Und gleichzeit dokumentieren Issues auch die Arbeit. Sie spiegeln den Prjektstrukturplan wieder. Dabei könen Issues sowohl Tasks sein, wie auch ganze Workpakages. Damit wird Feedback, Aufgaben, Bugs festgehalten und koordiniert. 

Hier sehen wir ein Beispiel Issue
* Edit
* Assignees, @chpollin
* Screenshots
* Comments + Reactions
* Labels
* Filters
* Label
* Assigned
* Milestones

**Milestones**

Mit Milestones lassen sich Issues zusammenfassen und mit einem Datum versehen.

**Beispiele**
* Mit dokumentieren in Schönberg
* Zusammenarbeiten in DHCraft bei exil
* Koordinieren bei SZD

**Hands-On: Issue anlegen**

#### 4. Block - GitHub und Dokumentation

Neben dem Verwalten unsere Dateien und dem gemeinsamen arbeiten daran, sowie dem Projektmanagement, ist die Dokumentation auch ein essenzieller Bereich von Git und GitHub. In dem Zusammenhang werden wir gemeinsam 3 be4reiche anschauen: Markdown, ReadMe Files in GitHub und das Wiki.

**Markdown**

Markdown ist eine seit 2004 existierende _Lightweight Markdown Language_. Markup Language kennen Sie, XML ist auch eine. Ganz knapp gesagt: Markdown ist wie XML, nur viel reduzierter und einfacher und mit einem konkreten Anwendungsfall, nämlich Text zu strukturieren: Paragraphen, Überschriften, Listen, Links, Tabellen und Code Snippets. Und es ist eben für Dokumentationen im Kontext von Git gemacht.

Mehrere Tools können Markdown lesen. So zum Beispiel Visual Studio Code, oder Oxygen.
* Überschriften, Text, ungeordnete Liste, Code Block
* Absätze, geordnete Liste, italic und bold
* Blockquote, Links, Bilder, Tabelle, Table of Contents
* [wie man auf GitHub eine Änderung im Markdown macht]

Extended Syntax bedeutet, dass es Grundelemente gibt, die überall gerendert werden, und dann noch eine erweiterte Syntax, z.B. für Tabellen. In GitHub wird auch die Extended Syntax angezeigt. 

[https://github.com/KlassikStiftungWeimar/Test-Training-Repo/blob/main/documents/cheatsheet.md](https://github.com/KlassikStiftungWeimar/Test-Training-Repo/blob/main/documents/cheatsheet.md) 

**ReadMe**

**Wiki**
