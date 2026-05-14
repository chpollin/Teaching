#include <stdio.h>

// Ausgabe: 8
// "<<" scheibt alle Bits eins nach links. Entspricht einer Multiplikation mit 2.
// Ein Links-Shiften um 3 ist somit das gleiche wie eine Multiplikation mit 8 (2*2*2) 

int main() {
  int x = 1 << 3;
  printf("%d", x);
  printf("\n");
  return 0;
}
