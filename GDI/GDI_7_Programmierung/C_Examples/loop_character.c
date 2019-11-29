#include <stdio.h>

// Ausgabe: ABCDEFGH
// A + 1 = B, weil in der ASCII Tabelle

int main() {
  char letter;
  for(letter = 'A'; letter <= 'H'; letter++) {
    printf("%c\n", letter);
  }
  for(letter = 'A'; letter <= 'H'; letter++) {
    printf("ASCII value of %c = %d \n", letter, letter);
  }
  return 0;
}
