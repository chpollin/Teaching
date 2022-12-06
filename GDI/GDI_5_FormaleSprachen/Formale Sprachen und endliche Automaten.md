* [Folien](https://docs.google.com/presentation/d/1TcEmapxsaebBDcY73URAaE1AieseT_XzoDLhpZQNxJA/edit?usp=sharing)
* [Video](https://www.youtube.com/watch?v=eTFsb7qROt0)
* [RegExr: Learn, Build, & Test RegEx](https://regexr.com/)

## Literatur und Ressourcen

* [Prokop, Lukas: Grundlagen der Informatik, 2014, S.69-83](https://github.com/chpollin/Teaching/blob/master/GDI/Literature/PROKOP_GDI_Skriptum.pdf)
* Grundlagen der Informatik, Lehrvideo; Formale Sprache, Endlicher Automat (DEA) - mit Übungsteil, https://www.youtube.com/playlist?list=PLqIUu1-N8ToMF0mmpyhHViR8Blv_bUAuy
* [https://de.wikipedia.org/wiki/Formale_Sprache](https://de.wikipedia.org/wiki/Formale_Sprache)

## Skript

### Formale Sprachen

Eine formale Sprache besteht aus Wörtern, deren Buchstaben einem Alphabet entnommen sind und nach bestimmten Regeln wohlgeformt sind.

Das Alphabet einer formalen Sprache besteht aus Symbolen, Buchstaben oder Token, die zu Zeichenketten der Sprache verkettet werden.

Jede Zeichenkette, die aus Symbolen dieses Alphabets zusammengesetzt ist, wird als Wort bezeichnet, und die Wörter, die zu einer bestimmten formalen Sprache gehören, werden manchmal wohlgeformte Wörter oder wohlgeformte Formeln genannt. Eine formale Sprache wird häufig durch eine formale Grammatik wie eine reguläre Grammatik oder eine kontextfreie Grammatik definiert, die aus ihren Bildungsregeln besteht.

### Kontextfreie Sprachen

In der theoretischen Informatik beschreibt eine kontextfreie Grammatik eine kontextfreie Sprachen. Kontextfreie Grammatik `G` bestehen aus Vokabular `V`, Terminalsymbolen `Σ`, Produktionsregeln `P` und einem Startsymbol `S`. Sie sind dabei deckungsgleich mit der Typ-2-Grammatik der Chomsky-Hierarchie.

`G = (V, Σ, P, S)`

V … endliches Vokabular = Variablen = Nonterminale = Nichterminale
Σ … ein Alphabet (Terminale)
P … Produktionsregeln
S … Startsymbol

Nichtterminale Symbole können durch andere Symbole ersetzt werden, während terminale Symbole unveränderlich sind.

`L = { anbn | n∈N } = {ab, aabb, aaabbb, aaaabbbb, …}`

`L = {S, {a,b}, {S→aSb, S→ε}, S}`

```
S → aSb
→ aaSbb
→ aaaSbbb
→ aaaSbbb
→ aaabbb
```

Im Gegensatz zur regulären Gramamtiken können wir jetzt mit Klammerstrukturen Ausdrücken umgehen.

### Kontextsensitiven Sprachen

Die kontextsensitiven Grammatiken sind eine Klasse formaler Grammatiken und identisch mit den _Typ-1_-Grammatiken der Chomsky-Hierarchie. Sie zeichnen sich dadurch aus, dass einzelne Nichtterminalsymbole nur in einem vorgegebenen Kontext ersetzt werden dürfen.

Der Unterschied zu den kontextfreien Sprachen ist, dass Terminalsymbole und Nonterminalsymbole oder 2 Nonterminalsymbole auf der linken Seite Seit sein dürfen.

### Chomsky Hierarchie

Die Chomsky Hierarchie stellt in der theoretischen Informatik eine Hierarchie von Klassen formaler Grammatiken dar, welche formale Sprachen erzeugen. Dabei wird zwischen vier verschiedenen Typen der Grammatik (Hierarchiestufen) unterschieden, die nach den Einschränkungen ihrer Produktion handeln.

Die Chomsky-Hierarchie teilt formale Grammatiken in vier verschiedene Klassen ein, die sich in der Einschränkung der Produktionsregeln der verschiedenen Typen unterscheiden. Hierbei schränkt Typ-0 die Sprache überhaupt nicht ein, während Typ-3 die Grammatik sehr stark einschränkt.

Allgemein kann man sagen, dass alle formalen Grammatiken mindestens vom Typ-0 sind, da hier keine Einschränkungen gestellt werden. Es kann also aus jedem Wort ein beliebiges anderes Wort entstehen.
Die Typ-1-Grammatiken erzeugen kontextsensitive Sprachen. Eine nichtdeterministische, linear beschränkte Turingmaschine – also eine Turingmaschine, deren Band durch die Länge beschränkt ist – kann diese Sprache erkennen.
Kommen wir nun zu Typ-2 , also den kontextfreien, Grammatiken. Diese sind zusätzlich dadurch eingeschränkt, dass jede Regel der Grammatik auf der linken Seite genau ein nichtterminales Symbol, und auf der rechten Seite eine beliebige Kombination aus terminalen und nichtterminalen Symbolen enthalten muss. Die Kombination muss hierbei immer mindestens ein Element enthalten.
Zu guter Letzt widmen wir uns den Typ-3-Grammatiken, auch reguläre Grammatiken genannt. Sie sind im Vergleich zu Typ-2-Grammatiken zusätzlich dadurch eingeschränkt, dass auf der rechten Seite der Produktionsregeln genau ein Terminalsymbol sein muss und optional ein Nichtterminalsymbol sein kann. Je nachdem, auf welcher Seite des Terminalsymbols das nichtterminale Symbol ist, spricht man von einer linksregulären oder einer rechtsregulären Grammatik. Typ-3-Grammatiken erzeugen die regulären Sprachen. Endliche Automaten erkennen diese Sprachen.

## Assignment 4 (Reguläre Ausdrücke und Automaten)

**1) Konstruiere einen RegEx der auf folgende Terme matcht**

`abbca, abbbcca, ac, accca, acc`

**2) Gib an welche der folgenden Terme auf den angegebenen RegEx matchen.**

`ac?c+a?a*ca?`

- `acaaacccaaa`
- `aaaaaaca`
- `acabca`
- `acc`

**3) Gib an welche der folgenden Terme auf den angegebenen RegEx matchen. Hier werden Zeichenklassen etc. verwendet. Diese könnten von der verwendeten Programmiersprache bzw. Umgebung leicht unterschiedlich sein.)**

`\d+.(\d{2}|M\w+).\d{2}[5|6]0`

- *01.02.1950*
- *1.02.1906*
- *100.00.1960*
- *01.Mai.1950*
- *01.Maerz.1950*

**4) Gib an welche der folgenden Terme auf den angegebenen Regulären Ausdruck matchen. Du kannst dieses RegEx auch kürzen.**

`(ac(c+a?)?|(a+(c|c+)?(caac)?ca)+(ca)?)+`

- accaaccaacaaccaca
- acaaac
- accaccca
- cacaaa

**5) Zeichne einen endlichen deterministischen Automaten, der genau die Wörter akzeptiert, die (ausschließlich) durch gegebenen RegEx akzeptiert werden. Versuche ihn so vereinfacht wie möglich zu zeichnen, also mit minimaler Knotenanzahl. Gib alle Endzustände an (doppelte Kreise)**

`(ac+a*)|(c+a*c)?`

**6) Definiere ein Alphabet 𝝨 für die formale Sprache der Addition, Subtraktion, Multiplikation und Division von rationalen Zahlen (+, -, Komma/Punkt). Gib 2 gültige und zwei ungültige Wörter dieser Sprache an. Beschreibe die Regeln dieser formale Sprachen in Worten.**

Beispiele: 

* 10 - 1 = 9
* 5.5 + 1.5 = 1 (ist gültig, da nur die Syntax beschrieben wird, nicht die Semantik dieser formalen Sprache)
* 100 * 0.5 / 1 = 50 
* ... 

**7) Zeichne eine Syntaxdiagramm für die formale Sprache der Addition, Subtraktion, Multiplikation und Division von Rationalen Zahlen.**

**8) Schreibe einen RegEx der auf [ISBN-10 und ISBN-13](https://de.wikipedia.org/wiki/Internationale_Standardbuchnummer#ISBN-13) Nummern matcht inklusive dem Text "ISBN-10: " oder "ISBN-13: ". Verwende dafür explizit Zeichenklassen. Du kannst z.B: [https://regexr](https://regexr) verwenden**. 

Du Semantik in ISBN-10 und ISBN-13 musst du nicht abbilden (Prüfsumme). Die ISBN-13 besteht aus fünf Zahlengruppen, ISBN-10 aus 4. Der String "ISBN-10: " bzw. "ISBN-13: " soll im RegEx auch enthalten sein (mit dem Leerzeichen)

**Wörter die Matchen sollen:**

* ISBN-10: 3-680-08783-7
* ISBN-13: 978-3-86680-192-9
* ... 

**Matchen** **nicht:**

* ISBN-12: 973-3-86684-192-9
* ISBN-10: 11-33-86631-007-20
* ... 

**9) Verwende den Befehl [egrep](https://www.computerhope.com/unix/uegrep.htm) im Terminal, um aus den zwei Dateien `uk-500.csv` und `us-500.csv`  mittels eines RegEx alle Email-Adressen auszulesen, die nach dem *@* ein „gmail.com“ beinhalten.**

**10) Verwende den [egrep](https://www.computerhope.com/unix/uegrep.htm)  Befehl  im Terminal, um aus den zwei Dateien `uk-500.csv` und `us-500.csv` mittels eines RegEx alle Web-Adressen auszulesen. Schreibe das Ergebnis in eine neue Datei, direkt in der  Konsole. Der Befehl dafür schaut so aus:**

` egrep -i -oh HIER STEHT DEIN REGEX uk-500.csv > mails.txt`

