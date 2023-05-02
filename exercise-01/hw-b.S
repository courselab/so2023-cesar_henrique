    .code16

    .global _start

_start:

    movb $0xe, %ah # Set BIOS teletype mode

    movw $0x0, %bx

loop:
    movb msg(%bx), %al # Load msg
    cmp $0x0, %al
    je halt # Jump Halt
    int $0x10 # Issue BIOS interrupt
    add $0x1, %bx
    jmp loop

halt:
    hlt # Halt
    jmp halt # Safeguard

msg:

    .string "Hello World"
    .fill 510 - (. - _start), 1, 0
    .word 0xaa55 # # Boot signature