global _blaster_test

%macro OUTB 2
  mov dx, %1
  mov al, %2
  out dx, al
%endmacro

%macro INB 1
  mov dx, %1
  in al, dx
%endmacro

_blaster_test:
   ; RESET
    OUTB 0x226, 1
    mov ah, 86h
    mov cx, 0x0000
    mov dx, 0xFFFF
    int 15h
    OUTB 0x226, 0

    ; turn speaker on
    OUTB 0x22C, 0xD1

    OUTB 0x0A, 5 ; disable channel 1
    OUTB 0x0C, 1
    OUTB 0x0B, 0x49 ; turn to transfern mode
    OUTB 0x83, 0x01
    OUTB 0x02, 0x04
    OUTB 0x02, 0x0F
    OUTB 0x03, 0xFF
    OUTB 0x03, 0x0F
    OUTB 0x0A, 1

    ; doing things with the sound blaster
    OUTB 0x22C, 0x40
    OUTB 0x22C, 165
    OUTB 0x22C, 0xC0
    OUTB 0x22C, 0x00
    OUTB 0x22C, 0xFE
    OUTB 0x22C, 0x0F
