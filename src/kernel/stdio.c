#include "stdio.h"
#include "x86.h"

void putc(char letter) {
    x86_Put_Message(letter, 0);
}

void puts(const char* text) {
    while (*text) {
        putc(*text);
        text++;
    }
}
