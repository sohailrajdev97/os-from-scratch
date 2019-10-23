[org 0x7c00]
  mov bp, 0x3000
  mov sp, bp

jmp $

times 510 - ($ - $$) db 0
dw 0xaa55

times 512 db "S" ; Sector 2
times 512 db "R" ; Sector 3