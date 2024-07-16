#include "stdint.h"
#include "stdio.h"
#include "x86.h"
#include "sound.h"

void _cdecl cstart_(uint16_t bootDrive)
{
    x86_clear();
    blaster_test();
    puts(">");
    char command[256];

    int index = 0;

    while (true) {
        uint8_t key = x86_keyboard();
        if (index > 210) {
            for (int i = 0; i < 3; ++i) {
                blaster_test();
            }
            index = 0;
            for (int i = 0; i < index; i++) {
                command[i] = '\0';
            }
            x86_clear();
        }
        command[index] += key;
        index += 1;
        if (key == (uint8_t)13) {
            putc(10);
            putc(10);
            command_line(command);
            for (int i = 0; i < index; i++) {
                command[i] = '\0';
            }
            index = 0;

        }
        putc(key);
    }
}
