* [Folien](https://docs.google.com/presentation/d/11g9T2wCwGb7ao-ieYO3oPBwUQ2ZkJ2cMYRlodgMB6sE/edit?usp=sharing)

#internet #web #gdi

# Literatur und Ressourcen

# Skript

## Internet und Web

World Wide Web, Web, WWW, … ist riesige, weltweit verteilte Informations- und Datensammlung, auf die über das Internet mit Hilfe des Hypertext Transfer Protocols (HTTP) zugegriffen werden kann.

Das WWW
* wurde 1989/90 von Robert Cailliau und Tim Berners-Lee im europäischen Kernforschungszentrum CERN eingeführt
* ist als Internetanwendungen Client-Server-basiert
* Browser (WWW-Client) interpretiert angeforderten WWW-Dokumente und stellt dabei ein Graphical User Interface (GUI) zur Verfügung.
* Informationen liegen in Form von Hypermedia-Dokumenten (auch Hypertext-Dokumenten) vor, die mit Hyperlinks verknüpft sind.
* Der Browser interpretiert Hypertext-Dokumenten. Diese trennen immer Dokumentenstruktur (Hypertext Markup Language - HTML) und Dokumentendarstellung (Cascading Stylesheets - CSS).
* Zur weltweit eindeutigen Identifikation und Adressierung von WWW-Dokumenten dienen sogenannte URIs – Uniform Resource Identifier.
* Zugriff auf WWW-Dokumente erfolgt nach dem Client/Server-Paradigma:

Das Internet
* ist ein weltweiter Zusammenschluss verschiedenartiger Computer-Netzwerke zu einem virtuellem Netz.
* Es ist die technische Infrastruktur auf dem unterschiedliche (Internet)Dienste, wie das Web oder Mail laufen.
* Der Datenaustausch erfolgt, über Grenzen der einzelnen physikalischen Netzwerke hinweg, über technisch normierte Internetprotokolle.
* Das Internet folgt einer offenen und dezentralisierten Systemarchitektur.

Weiters gibt es noch Begriffe wie Clear Web, Deep Web und Dark Web.

## Internet: Die Infrastruktur und das Netz der Rechennetze

Ein Rechnernetz oder Rechnernetzwerk ist...  
* ein Zusammenschluss von Geräten  
* zur gegenseitigen Kommunikation  
* mithilfe von Kommunikationsprotokolle

## [jvns.ca/cat.png](https://jvns.ca/cat.png)

* Bei uns am Rechner: Betriebssystem, Rechner, Router Browser.
* Wir kommunizieren mit jvns.ca, einem Server, und einem DNS Server, der weiß wo die Ressource hinter der Zeichenfolge "jvns.ca" eigentlich liegt.
* Dazwischen: Viele Router im Internet und Datenpakete

## Pakete im Internet

Alle Daten werden im Internet als Pakete übermittelt. Jedes Paket ist eine Folge von Bits und diese Folge von Bits wird in einzelne Sektionen eingeteilt (head, body, etc.) und muss eben richtig dekodiert werden. 

Hier sehen wir ein UDP Paket, das den Text "mangotea" beinhaltet. Es hat ingesamt 50 Bytes. Damit man auch weiß wie man die Bitfolge intepretieren muss gibt es die Internet bzw. Kommunikationsprotokolle.

Das User Datagram Protocol (UDP) ist ein minimales, verbindungsloses Netzwerkprotokoll, das zur Transportschicht der Internetprotokollfamilie gehört. Das ist en Protokoll, das neben dem # Transmission Control Protocol (TCP) existiert. UDP nimmt es nicht so genau, ob wirklich alle Daten richtig ankommen, was eben bei Videotelefonie oder Streaming auch kein Problem ist. TCP ist so gebaut, dass alle Daten ganz genau ankommen müssen. 

* Media Access Control (MAC): die Beiden Rechner die kommunizieren. 
* TTL ... Time to Live
* welcher Port am Rechner 

## Schritte um zum Katzenbild zu kommen

* Das sind nur die grundlegenden Schritte. Es gibt natürlich mehr.
* Schnapp dir die IP Adresse. Dazu musst du mit einem DNS Server kommunizieren.
* Öffne einen socket, ein vom Betriebssystem bereitgestelltes Objekt, das als Kommunikationsendpunkt dient. Das übernimmt das Betriebssystem. 
* Dann wird eine TCP (oder UDP) Verdingung aufgebaut. Also die zwei Akteure sprechen nun in der Sprache TCP.
* Dann wird Angefragt mit einem HTTP request: hast du die Ressource [https://jvns.ca/cat.png](https://jvns.ca/cat.png) wo liegen? Und dann bekomm man einen HTTP response mit einem HTTP status.
* Clean up

## IP Adressen 


## Transmission Control Protocol - TCP

## HTTP - Hyper Text Transfer Protocol

* Zugriff auf Ressourcen des WWW wird durch HTTP Protokoll  geregelt, das Prozeduren zum Abruf und zur Anlieferung der durch URIs eindeutig gekennzeichneten Ressourcen bereitstelle.
* regelt Kommunikation zwischen dem informationsanfordernden WWW-Client – Browser und einem informationsanbietenden WWW-Server.
* HTTP setzt auf zuverlässigem, verbindungsbasierten Internet-Transportdienst TCP auf.
* Ablauf:
  * Browser – WWW-Client – initiiert Kommunikation mit einem Server indem er diese durch eine  URI gekennzeichnete Informationsressource anfordert – Request  
  * Server nimmt Anforderung entgegen, verarbeitet sie und antwortet entsprechend – Response
  * Ist Ressource verfügbar und darf Browser auf sie zugreifen, liefert der Server die Ressource zusammen mit einem positivem Statuscode aus .
  * ist Ressource nicht verfügbar oder ist der Zugriff für den Browser verboten, antwortet der Server mit einem negativen Statuscode.


## URI, URL, URN

## OSI - Open Systems Interconnection Model