#include "commands.h"
#include "stdio.h"
#include "string.h"
#include "x86.h"
#include "sound.h"

void command_line(char command[256]) {
    if (echo_command(command) == 1) return;
    if (clear_command(command) == 1) return;
    if (sound_command(command) == 1) return;

    puts("COMMAND NOT FOUND");
    putc(10);
}

int echo_command(char command[256]) {
    // echo
    char trimmed_command[6];
    for (int counter = 0; counter < 5; counter++) {
        trimmed_command[counter] = command[counter];
    }

    trimmed_command[5] = '\0';

    if (strcmp(trimmed_command, "print") == 0) {
        putc(10);

        char message[249];

        for (int count = 0; count < 256; count++) {
            message[count] = command[count + 6];
        }

        puts(message);

        putc(10);
        return 1;
    }
}

int clear_command(char command[256]) {
    char trimmed_command[6];
    for(int counter = 0; counter < 5; counter++) {
        trimmed_command[counter] = command[counter];
    }
    trimmed_command[5] = '\0';

    if (strcmp(trimmed_command, "clear") == 0) {
        x86_clear();
        return 1;
    }

    return 0;
}

int sound_command(char command[256]) {
    char trimmed_command[6];
    for(int counter = 0; counter < 5; counter++) {
        trimmed_command[counter] = command[counter];
    }
    trimmed_command[5] = '\0';

    if (strcmp(trimmed_command, "sound") == 0) {
        blaster_test();
    }
}
