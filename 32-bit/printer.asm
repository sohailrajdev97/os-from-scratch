[bits 32] ; Enter protected mode

VGA_BASE equ 0xb8000 ; Base address of video graphics array
WHITE_ON_BLACK equ 0x0f ; 0 -> Background & f -> Foreground

; Load the starting (base) address of the string in ebx before calling this method. String ends with null character (0)

start_32_print:
  pusha
  mov edx, VGA_BASE

loop_32_print:

  ; ax -> 2 bytes => al = 1 byte & ah = 1 byte

  mov al, [ebx] ; Store data byte in al

  cmp al, 0
  je end_32_print

  mov ah, WHITE_ON_BLACK ; Store color byte in ah

  mov [edx], ax
  add edx, 2 ; Add 2 to edx as a unit is 2 bytes in VGA memory
  add ebx, 1 ; Make ebx point to next character in string

  jmp loop_32_print

end_32_print:
  popa
  ret