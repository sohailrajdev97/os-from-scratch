; Setup the video interrupt to display the contents of al
mov ah, 0x0e

; Named memory location
message_to_display:
  db "S"

; Get the memory location of message_to_display in bx
mov bx, message_to_display

; Add an offset of 0x7c00 in the location as bios is loaded at a base of 0x7c00
add bx, 0x7c00

; Fetch the value 'S'
mov al, [bx]

; Raise the video interrupt
int 0x10

; zero padding and magic bios number
times 510-($-$$) db 0
dw 0xaa55