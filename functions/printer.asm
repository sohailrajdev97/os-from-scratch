; Prints string present whose base address is stored in BX

print:

  pusha

start_printing:

  mov al, [bx]
  cmp al, 0
  je end

  ; tty mode
  mov ah, 0x0e

  ; video interrupt
  int 0x10

  add bx, 1
  jmp start_printing

print_new_line:

  pusha
  mov ah, 0x0e
  mov al, 0x0a ; newline char
  int 0x10
  mov al, 0x0d ; carriage return
  int 0x10
  jmp end

end:
  popa
  ret
