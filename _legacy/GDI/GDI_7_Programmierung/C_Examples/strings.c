#include <stdio.h>

// Ausgabe: Ban
// weil wir das 4. Zeichen in Banane (wir beginnen bei 0 zu zählen)
// auf \0 setzen. Das entspricht einem 0-Byte und das beendet immer einen String.  

int main() {
  char str[] = "Banane";
  str[3] = '\0';
  printf("%s\n", str);
  return 0;
}
