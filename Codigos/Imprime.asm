section .text
global _start
_start:

  mov rax, 1
  mov rdi, 1
  mov rsi, saudacao
  mov rdx, 23
  syscall
  
  mov rax, 0
  mov rdi, 0
  mov rsi, msg
  mov rdx, 20
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, 23
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall

section .data
  saudacao: db "Escreva sua mensagem: ", 22

section .bss
  msg: resb 21
