section .text
global _start
_start:

  mov rax, 1
  mov rdi, 1
  mov rsi, pergunta
  mov rdx, 19
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, input_user
  mov rdx, 10
  syscall

  mov rcx, rax
  dec rcx

  mov rsi, input_user
  xor rax, rax
  xor rbx, rbx

loop_atoi:
  cmp rcx, 0
  je fim_atoi

  mov bl, [rsi]
  sub bl, '0'

  imul rax, 10
  add rax, rbx

  inc rsi
  dec rcx
  jmp loop_atoi

fim_atoi:
  add rax, 5
  mov rdi, buffer_out + 9
  mov byte [rdi], 10
  mov rcx, 1

loop_itoa:
  dec rdi
  xor rdx, rdx
  mov rbx, 10
  div rbx

  add dl, '0'
  mov [rdi], dl
  inc rcx

  cmp rax, 0
  jne loop_itoa

  mov rsi, rdi
  mov rax, 1
  mov rdi, 1
  mov rdx, rcx
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall

section .data
  pergunta: db "Escreva um numero: "

section .bss
  buffer_out: resb 10
  input_user: resb 10
