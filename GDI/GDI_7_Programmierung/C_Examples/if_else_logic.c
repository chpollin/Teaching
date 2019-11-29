#include <stdio.h>

// Ausgabe: Dreieck
// true AND true AND true = true 
// (a - b > c) && (a + c > b) && (b + c > a) = false --> kein Dreieck

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
