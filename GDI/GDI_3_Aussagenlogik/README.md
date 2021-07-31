# Aussagenlogik

* [Folien](https://docs.google.com/presentation/d/1dujrq3RTFDCgTUwCNwAacjZK6SfUYasNXWxUyLktdnY/edit?usp=sharing)
* [Video](https://youtube.com/embed/2vfaQLVStmU)
* [Wolfram|Alpha](https://www.wolframalpha.com/input/?i=%28p+and+q%29+or+r)

## Literatur

* [Prokop, Lukas: Grundlagen der Informatik, 2014, S.13-22](https://github.com/chpollin/Teaching/blob/master/GDI/Literature/PROKOP_GDI_Skriptum.pdf)



## Assignment 2 (Aussagenlogik)

**1.) Formalisiere jede der folgenden Aussagen durch eine aussagenlogische Formel:**

*Aus den Formulierungen "Wenn... dann", "zusammen", "Entweder...oder", "nicht", "aber"
lassen sich Terme der Aussagenlogik schließen.
Reduziere weiter die Aussage in ihre einzelnen Atomformeln.
"regnet" ist eine Atomformel mit der Bedeutung "es regnet" und "nass" ist eine Atomformel mit der
Bedeutung "die Straße ist nass", dann bedeutet "regnet" AND "nass" "es regnet und die Straße ist
nass". Statt "regnet" und "nass" kannst du auch einfach p und q als Variablen verwenden.*

1.1) *Wenn du die drei Fragen beantwortet hast, dann kannst du die Brücke des Todes überqueren.*

1.2) *Die Ritter der Kokosnuss gibt es nur zusammen mit Pferden und Kokosnüssen.*

1.3) *Entweder wird ein Gebüsch gekauft oder es wird kein Gebüsch gekauft.*

**2.) Formuliere die Regel, "*wenn der Hahn auf dem Misthaufen kräht, dann ändert sich*
*das Wetter oder es bleibt so, wie es ist*" als Formel der Aussagenlogik. Zeige mittels Wahrheitstabelle, dass die
Formel eine Tautologie ist (Wahrheitstabelle)**

**3.) Begründe ob folgende Formeln erfüllbar, gültig oder unerfüllbar sind.
Erfüllbar bist ist eine Formel, wenn mindesten einmal "wahr" in der Wahrheitstabelle auftaucht.
Gültig wenn alle "wahr" sind und unerfüllbar wenn alle "falsch" sind.**

​    3.1)  `a → a ∧ b`

​    3.2) `(a → b) → (b → a)`

​    3.3) `(a ∧ b) → (¬a v ¬b)`

​    3.4) `(⊥ → p) ∧ ¬(q ←→ p) ∧ ¬((¬p ∧ ¬q) → q)`

**4.) Zeichne einen Parse Tree für folgende Formel und verwende den Tree, um zu über-
prüfen, ob die Zuordnung (Modell) *{p = F, q =T, r = F}* die Formel *true* oder *false* werden lässt. Finde
ein Modell, welches das Gegenteil erreicht.**

  `(¬(r ←→ q) → ¬r) ∧ (¬(r → q) ∨ (p → q))`

**5.) Gib folgende Befehle in deiner Konsole ein:**

* `echo $(( 2 & 3 ))`
* `echo $(( 2 && 3 ))`

und

* `echo $(( 5 | 5 ))`
* `echo $(( 5 || 5 ))`

Erkläre was jeweils passiert und um welche Operatoren es sich handelt. Info dazu gibt es [hier](https://www.linux.com/tutorials/logical-ampersand-bash/)

**6.) Was ist die Konjunktive Normalform (KNF) des folgenden logischen Ausdrucks:**

`(p -> q) ∧ (¬q v p)`

**7.) Zeichne einen Parse Tree für folgende Formel und verwende dieses Modell: `{p = F, q = T, r = F}`
Ist diese Formel erfüllbar? **
**Erstelle auch eine Wahrheitstabelle und die KNF für diese Formel**.

`((q -> ¬p) v r) -> (q ∧ (r -> p))`
