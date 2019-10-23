[org 0x7c00]

  call read_from_disk

  mov bx, [output_buffer_base]
  call print

  call print_new_line
  call print_new_line

  add bx, 512
  call print
  
  jmp $

  %include "disk.asm"
  %include "../functions/printer.asm"

  output_buffer_base:
    dw 0x6000
  
  sector_count:
    db 0x02
  
  cylinder_number:
   db 0x00
  
  sector_number:
    db 0x02
  
  head_number:
    db 0x00
  
  drive_number:
    db 0x80

  times 510 - ($ - $$) db 0
  dw 0xaa55

  ; Sector 2
  times 511 db "S"
  db 0

  ; Sector 3
  times 511 db "R"
  db 0