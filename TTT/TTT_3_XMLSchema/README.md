# XML Schema

[Folien: XML-Schemata und RELAX NG](https://docs.google.com/presentation/d/1uxDHXrYJDtgBn2v460P-P3GbCALaZh87KPfNTAdBymM/edit?usp=sharing)

## Literatur

* [RELAX NG](http://books.xmlschemata.org/relaxng/page2.html)
* [RELAX NG Tutorial](https://speedata.github.io/relaxngtutorial-de/)

## Übung

**Die Lösungen zu diesen Übungen findest du [hier](https://github.com/chpollin/Teaching/tree/master/TTT/TTT_2_XMLSchema/Uebungen).**

**1.) Erweitere [memo_schema.rng](https://github.com/chpollin/Teaching/tree/master/TTT/TTT_2_XMLSchema/Uebungen).**

Folgende Spezifikationen sollen umgesetzt sein:

- Wir wollen, dass wir `<to>` und `<from>` noch weiter spezifizieren können und zwar über ein Attribut type, das ausschließlich mit dem  String “*Droid*”, “*Jedi*” oder “*Sith*” befüllt werden kann. `@type` soll aber  optional sein.
- Jedes `<memo>` soll ein `<head>` als erstes Kindelement verfügen, in  dem sich ein leeres Element `<ref/>` befindet, das ein `@target` Attribut hat, das auf eine beliebige URL verweist.
- Dazu brauchst du neben den bekannten Strukturen noch:
  - `<empty/>`
  - `<data type="anyURI"/>`
  -  `<choice>`
  -  `<value>`
- Du wirst merken, dass du für `<to>` und `<from>` zweimal dasselbe  definierst. Man kann Patterns auch auslagern und dann referenzieren.  Definiere die optionale Auswahl von `@type` als “Benanntes Muster”. Hint:
  * `<define name="Typing">`
  * `<ref name="Typing"/>`
  * [https://speedata.github.io/relaxngtutorial-de/](https://speedata.github.io/relaxngtutorial-de)
- Füge ein weiteres valides `<memo>` hinzu.