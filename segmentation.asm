; tty mode
mov ah, 0x0e

mov al, [message]
int 0x10 ; Display the message (Will display garbage due to missing offset)

mov bx, 0x7c0 ; Not 0x7c00 as internally bx is right shifted by 4 bits during memory referencing
mov ds, bx ; We can not directly initialise DS
mov al, [message]
int 0x10

mov es, bx
mov al, [es:message] ; We have to explicitly specify ES as an offset whereas DS is automatically used as data segment offset
int 0x10

jmp $

message:
  db "S"

times 510 - ($-$$) db 0
dw 0xaa55