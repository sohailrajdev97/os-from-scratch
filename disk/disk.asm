read_from_disk:

  pusha

  ; Setup interrupt parameters
  mov ah, 0x02
  mov dl, [drive_number]
  mov dh, [head_number]
  mov cl, [sector_number]
  mov ch, [cylinder_number]
  mov al, [sector_count]
  mov bx, [output_buffer_base]

  ; Keep a copy of sector count on stack
  push ax

  int 0x13
  jc disk_error

  ; Check if all sectors were read or not
  pop bx
  cmp al, bl
  jne sectors_error

  popa
  ret

disk_error:
    mov bx, DISK_ERROR
    call print
    call print_new_line
    ; mov dh, ah ; ah = error code, dl = disk drive that dropped the error
    ; call print_hex ; check out the code at http://stanislavs.org/helppc/int_13-1.html
    jmp $

sectors_error:
    mov bx, SECTORS_ERROR
    call print
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0