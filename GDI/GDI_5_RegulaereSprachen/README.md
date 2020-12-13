# Reguläre Sprachen (RegEx)
[Folien](https://docs.google.com/presentation/d/1TcEmapxsaebBDcY73URAaE1AieseT_XzoDLhpZQNxJA/edit?usp=sharing)

[Video](https://www.youtube.com/watch?v=eTFsb7qROt0)

[RegExr: Learn, Build, & Test RegEx](https://regexr.com/)

## Assignment

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

