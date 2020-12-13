# Mengen und Prädikatenlogik

* [Folien](https://docs.google.com/presentation/d/19b51V9_RjuJAN9ogYhZnPZVNFqUhMPqgbDJviZoaoDk/edit?usp=sharing)
* [Video](https://youtu.be/zs8ZHLRPZhI)

## Assignment

**1.) Überführe folgende Sätze in Formeln der Prädikatenlogik. Sei so präzise wie möglich. Definiere alle Variablen.** 

1.1) Alle Menschen brauchen Wasser.

1.2) Nicht jeder mag Kaffee.

1.3) Nicht jeder/jede Student/In mag sowohl die Programmiersprache C als auch XSLT.

1.4) Einige Zwerge mögen überhaupt niemanden.

**2.) Gegeben sind die 3 Mengen: **

**A={3,5,7,12,14,17,19,23}**

**B={3,5,17}**

**C={12,14,17,24}**

Beurteile, ob die folgenden Aussagen wahr oder falsch sind: 

- *B ⊂ A*
- *C ⊆ A*
- *C ⊆ B*

[Mehr Information gibt es hier.](https://www.mathebibel.de/teilmenge)

**3) Zeige mit einem VENN-Diagramm, ob folgende Aussage true oder false ist.**

*D'⋂(B∪C) = (D'⋂B)∪(D'⋂C*) 

**4.) Welche der folgenden Aussagen sind äquivalent zu `¬∀x A(x) ⇒ B(x)`? [2 Punkte]**

- `∃x ¬(A(x) ⇒ B(x))`
- `∃x A(x) ∧ ¬B(x)`
- `∀x ¬(A(x) ⇒ B(x))`
- `∀x A(x) ⇒ ¬ B(x)`

**5.) Welche der folgenden Formeln formalisieren die Aussage "Es gibt eine Straße in der jeder Baum groß ist."? [2 Punkte]**

Dabei ist S die Menge aller Straßen, B ist die Menge aller Bäume. Außerdem  geben die Prädikate stehtIn(b, s) und istGroß(b) an, ob der Baum b in  der Straße s steht beziehungsweise, ob der Baum b groß ist.

- `∃s∈S ¬∃b∈B stehtIn(b, s) ∧ ¬istGroß(b)`
- `∃s∈S ∀b∈ B stehtIn(b, s) ⇒ istGroß(b)`
- `∃s∈S ∀b∈B stehtIn(b, s) ∧ istGroß(b)`
- `∃s∈S ¬∀b∈B ¬stehtIn(b,s) ∧ istGroß(b)`