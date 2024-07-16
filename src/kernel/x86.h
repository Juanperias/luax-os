#pragma once
#include "stdint.h"

void _cdecl x86_Put_Message(char c, uint8_t page);
void _cdecl x86_clear();
char _cdecl x86_keyboard();
