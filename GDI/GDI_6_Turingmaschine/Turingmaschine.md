[Folien](https://docs.google.com/presentation/d/1DXSoVKMnkuWsoDUlKb8SdPBgCw8e1COLG83mPZ4wAlg/edit?usp=sharing)

[Video](https://www.youtube.com/watch?v=SGvOrLy6QVg)

[Online Turing Machine Simulator](https://turingmachinesimulator.com/)

## Literatur

* [Prokop, Lukas: Grundlagen der Informatik, 2014, S.29-40](https://github.com/chpollin/Teaching/blob/master/GDI/Literature/PROKOP_GDI_Skriptum.pdf)



## Assignment 5

**Gegeben ist die Turingmaschine mit dem Eingabeband und dem Programm** **aus folgender Tabelle.  Die Bewegungsrichtungen sind rechts (>) und links (<). Weiters ist folgendes gegeben:**

**EINGABEBAND**

*Fett ist jeweils Start und Haltezustand.* 

* Start: **0**122112210
* **Ende:** 02221222**0**0
* **Zustände:** Z1, Z2, Z3, Z4 und HALT
* **Arbeitsalphabet:** 0,1,2
* **Startzustand:** Z1
* **Haltezustand:** HALT

**Verhalten der Turingmaschine**

Die Turingmaschine ersetzt alle Einser mit dem Zeichen, das sich vor Ausführung der Turingmaschine **rechts** neben der jeweiligen Eins befindet. Nachdem sie alle Ersetzungen durchgeführt hat, geht sie in den Zustand HALT, sobald sie eine Null als Eingabezeichen findet. 
Das Eingabeband ist am Anfang mit Einsen und Zweiern gefüllt, die links und rechts von unendlich vielen Nullen umgeben sind.

**1) Vervollständige die fehlenden Werte in der Zustandstabelle. Schreibe  den ganzen Ablauf (per Hand) der Turingmaschine mit gegebenen Start und  Endzustand auf.**

**Zustandstabelle:**

|  Z1  |  2   |      |  Z3  |  0   |  >   |
| :--: | :--: | ---- | :--: | :--: | :--: |
|  Z1  |  0   |      |  Z3  |  0   |  >   |
|  Z2  |  2   |      |  Z3  |  1   |  >   |
|  Z3  |  1   |      |  Z4  |      |  >   |
|  Z3  |  2   |      |  Z3  |      |      |
|  Z3  |  0   |      | HALT |  0   |      |
|  Z4  |  1   |      |  Z2  |  1   |  <   |
|  Z4  |  2   |      |  Z3  |  2   |      |
|  Z4  |      |      |  Z1  |      |  <   |
|      |      |      |      |      |      |

**2) Gib weiters an, wie oft sich die Turingmaschine bei der Ausführung mit dem gegebenen Eingabeband im Zustand Z3 befindet.** 

Hier gibt es zwei Lösungen je nach dem, wie die Zustandstabelle aussieht.

**3) Schreibe einen Code für https://turingmachinesimulator.com, der bei gegebenem Input gegebenen Output ausgibt.**

