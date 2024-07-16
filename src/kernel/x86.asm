global _x86_Put_Message
_x86_Put_Message:
    push bp
    mov bp, sp

    push bx

    mov ah, 0Eh
    ; bp + 4 : message
    ; bp + 6 : page
    mov al, [bp + 4]
    mov bh, [bp + 6]

    int 10h

    pop bx
    mov sp, bp
    pop bp
    ret

global _x86_clear
_x86_clear:
    xor ax, ax
    int 0x10

    mov ax, 0x0003
    int 0x10

    ret

global _x86_keyboard
_x86_keyboard:
    mov ah, 0
    int 16h

    ret
