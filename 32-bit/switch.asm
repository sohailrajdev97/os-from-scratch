[bits 16]
switch_to_pm:

    ; 1. disable interrupts as interrupt routines are 16 bit routines and if called in 32 bit mode, may crash the CPU    
    cli

    ; 2. load the GDT descriptor
    lgdt [gdt_descriptor]

    ; First bit of cr0 controls the protected mode
    mov eax, cr0 
    or eax, 0x1 ; 3. set 32-bit mode bit in cr0
    mov cr0, eax

    ;4. Do a far jump to complete the execution of instructions in the pipeline
    jmp CODE_SEG:init_pm

[bits 32]
init_pm: ; we are now using 32-bit instructions
    mov ax, DATA_SEG ; 5. update the segment registers
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000 ; 6. update the stack right at the top of the free space
    mov esp, ebp

    call BEGIN_PM ; 7. Call a well-known label with useful code