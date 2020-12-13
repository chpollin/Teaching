# Programmierung

[Folien](https://docs.google.com/presentation/d/1WBCxSS84iDArrbYUP5ybT-jiFkaE67arz2ghEvuzYeU/edit?usp=sharing)

[Video](https://www.youtube.com/watch?v=0Te9S22fPcs&feature=youtu.be)

## Literatur

* [C-Tuorial](http://www.c-howto.de/tutorial/)
* [Video Tutorial für C](https://www.youtube.com/watch?v=1uR4tL-OSNI)
* [Tutorial für x86 Assembly](https://www.youtube.com/watch?v=75gBFiFtAb8)

## Assignment

**1.1) Kompiliere und führe alle C-Programme in [deiner Konsole](https://www.geeksforgeeks.org/compiling-a-c-program-behind-the-scenes/) aus.** 

**1.2) Im ersten Teil geht es darum die Programme auszuführen und zu verstehen, warum sie den jeweiligen Output haben. Führe selbstständig Recherche im Web durch, um die einzelnen unklaren Programmstrukturen zu verstehen.''**

**1.3) Schaue dir für jedes dieser Beispiele den Assembler Code (X86-64 gcc 9.2)  an und erkläre in grob.**

Nutze dazu https://godbolt.org/. Ziel dieser Aufgabe ist es nicht alles zu verstehen, sondern experimentell an die Sache ran zu gehen. Wenn du Dinge dabei nicht verstehst, ist es okay diese Dinge als Frage zu formulieren und sie nicht zu beantworten. 

**Bitoperationen**

```c
#include <stdio.h>
int main() {
  int x = 1 << 3;
  printf("%d", x);
  return 0;
}
```

**Schleifen**

```c
#include <stdio.h>
int main() {
  char letter;
  for(letter = 'A'; letter <= 'H'; letter++) {
    printf("%c", letter);
  }
  return 0;
}
```

**Bedingungen**

```c
#include <stdio.h>
int main() {
  int a, b, c;
  a = 11;
  b = 12;
  c = 20;
  if((a + b > c) && (a + c > b) && (b + c > a)) {
    printf("Dreieck\n");
  } else {
    printf("kein Dreieck\n");
  }
  return 0;
}
```

**Strings**

```c
#include <stdio.h>
int main() {

  char str[] = "Banane";
  str[3] = '\0';
  printf("%s", str);
  return 0;
}
```

**Zahlen**

```c
#include <stdio.h>

int main () {
  printf("Signed 32-bit:\n");
  printf("%d\n", 46341 * 46341);
  return 0;
}
```

