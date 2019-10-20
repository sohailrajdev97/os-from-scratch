mov ah, 0x0e ; tty mode

mov bp, 0x8000 ; this is an address far away from 0x7c00 so that we don't get overwritten
mov sp, bp ; if the stack is empty then sp points to bp. SP point to last filled location

push 'A'
push 'B'
push 'C'

; to show how the stack grows downwards
mov al, [0x7ffe] ; 0x8000 - 2 bcoz stack operations are word based in x86
int 0x10 ; Prints A as A (0x0041) is stored in little endian --> 41 in lower memory and 00 in higher

mov al, [0x7ffc]
int 0x10 ; Print B

; No output
mov al, [0x8000]
int 0x10


; recover our characters using the standard procedure: 'pop'
; We can only pop full words so we need an auxiliary register to manipulate
; the lower byte
pop bx
mov al, bl
int 0x10 ; prints C

pop bx
mov al, bl
int 0x10 ; prints B

pop bx
mov al, bl
int 0x10 ; prints A

jmp $
times 510-($-$$) db 0
dw 0xaa55