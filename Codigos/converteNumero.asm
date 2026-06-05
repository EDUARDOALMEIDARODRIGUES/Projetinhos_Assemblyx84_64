section .text
global _start
_start:
  mov rax, 12355 ; numero que eu quero

  mov rdi, bu + 9 ; recebe a primeira posição
  mov byte [rdi], 10 ; move quebra linha par o fim
  mov rcx, 1 ; sera usado para como contador de caracteres

loop_div:
  dec rdi
  xor rdx, rdx
  mov rbx, 10
  div rbx

  add dl, '0'
  mov [rdi], dl
  inc rcx

  cmp rax, 0
  jne loop_div

  mov rax, 1
  mov rdx, rcx
  mov rsi, rdi
  mov rdi, 1
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall

section .bss
  bu: resb 10
