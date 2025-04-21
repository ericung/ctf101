; nasm -f elf64 my_and_program.asm
; ld -o my_and_program my_and_program.o
; ./my_and_program

section .data
    hex_digits db "0123456789abcdef"
    result_string db "Result: 0000000000000000", 0

section .text
    global _start

_start:
    xor rax,rax
    xor rdi,rdi
    dec edi
    push rdi
    push rax
    pop  rdi
    pop  rax
 
    mov rdi, result_string
    mov rcx, 16

convert_loop:
    mov rbx, rax
    and rbx, 0xF
    lea rsi, [hex_digits + rbx]
    mov bl, byte [rsi]
    mov [rdi + rcx - 1], bl
    shr rax, 4
    loop convert_loop

    mov rax, 1
    mov rdi, 1
    mov rsi, result_string
    mov rdx, 24
    syscall

    mov rdi, 0
    mov rax, 60
    syscall


xor rax,rax
xor rdi,rdi
dec edi
push rdi
push rax
pop  rdi
pop  rax
