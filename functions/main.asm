[org 0x7c00] ; BIOS offset

mov bx, SOHAIL ; ORG at line 1 will add 0x7c00 to the relative address of the label
call print

call print_new_line

mov bx, RAJDEV
call print

jmp $

%include "printer.asm"

SOHAIL:
  db 'SOHAIL', 0

RAJDEV:
  db 'RAJDEV', 0

; Zero padding
times 510-($-$$) db 0

; magic number
dw 0xaa55