#include <stdio.h>

// Ausgabe: auf meinem Rechner: -2147479015 + Warning 
// es passiert ein Integer-Overflow. Unser reservierter Speicher für den Datentyp int geht aus.
// d

int main () {
  printf("Signed 32-bit:\n");
  printf("%d\n", 46341 * 46341);
  return 0;
}
