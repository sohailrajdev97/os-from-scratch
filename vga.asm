; VGA Base address = 0xb8000

; Offset upper 4 bits as we have to address a total of 20 bits
mov ax, 0xb000
mov ds, ax

; Lower 16 bits for VGA
mov bx, 0x8000

mov al, 'X' ; VGA Text Mode - Data
mov ah, 0xf4 ; VGA Text Mode - BG, FG & Blinking

mov [bx], ax

jmp $

times 510-($-$$) db 0
dw 0xaa55