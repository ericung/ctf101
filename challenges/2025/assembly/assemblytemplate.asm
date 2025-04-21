;-------------------------------------------------------------------------------
; Program Name:    [Program Name].asm
; Description:     [Brief description of the program's purpose]
; Author:          [Your Name]
; Date:            [Date]
; Target Platform: [e.g., Linux x86-64, Windows x86-32]
; Assembler:       [e.g., NASM, GAS, MASM]
;-------------------------------------------------------------------------------

; --- Directives ---
bits 64             ; Or bits 32.  Specify the processor mode.
; %include "my_macros.inc"  ; Include custom macros (optional)

section .data       ; Read-only, initialized data
    ; [Initialized data: strings, constants, lookup tables]
    ; Example:
    message db "Result: ", 0
    newline db 10
    format_string db "The result is: %d", 10, 0

section .bss        ; Read-write, uninitialized data
    ; [Uninitialized data: variables]
    ; Example:
    result resq 1     ; Reserve space for a 64-bit result

section .text       ; Code section
    global _start     ; Entry point
    ; extern printf    ;  Import external functions (e.g., from libc)

_start:
    ; --- Prologue ---
    ; [Set up the stack frame]
    push rbp
    mov rbp, rsp
    ; sub rsp, 32    ; Allocate space for local variables (if needed)

    ; --- 2.1: Load Input ---
    ; [Load data from registers, memory, or the stack]
    ; Example:
    mov rax, 10
    mov rbx, 5

    ; --- 2.2: Perform Calculation/Operation ---
    ; [Implement the core logic of the program]
    ; [Use comments to explain each step]
    ; Example:
    add rax, rbx    ;  rax = rax + rbx

    ; --- 2.3: Store Output ---
    ; [Store the result in the designated location]
    ; Example:
    ; mov [result], rax  ; Store the result in memory
     ; Or
    ; mov rdi, rax       ;  Move result to rdi for printing

   ; --- 2.4:  Call external functions (if needed)
   ;  Example
    ; mov rdi, format_string
    ; mov rsi, rax
    ; xor eax, eax
    ; call printf

    ; --- 2.5: Prepare for Output (e.g., string conversion) ---
    ; [Convert numerical results to strings, if necessary, for printing]

    ; --- 2.6: Output Result ---
    ; [Display the result to the user (e.g., using system calls)]
     mov rax, 1
     mov rdi, 1
     mov rsi, message
     mov rdx, 8
     syscall

    ; --- Epilogue ---
    ; [Restore the stack frame and return]
    mov rsp, rbp
    pop rbp
    mov rax, 0       ;  Return code (0 for success)
    ret

; --- Subroutines (Functions) ---
; [Define any subroutines here, following the same structure]
; Example:
; my_function:
;     push rbp
;     mov rbp, rsp
;     ; Function body
;     mov rax, 123
;     mov rsp, rbp
;     pop rbp
;     ret

