# Projetos com Assembly x84_64
### Descrição:
Fiz alguns projetos com o assembly x84_64, obviamente de acordo com a arquitetura do meu processador, no sistema Linux. Usei o Nasm para esses algoritmos

### Feramentas usadas:
![Assembly](https://img.shields.io/badge/-Assembly-0D1117?style=for-the-badge&logo=assemblyscript&labelColor=0D1117&textColor=0D1117&logoColor=FF642D)&nbsp;
![Neo vim](https://img.shields.io/badge/-NeoVim-0D1117?style=for-the-badge&logo=neovim&labelColor=0D1117&textColor=0D1117)&nbsp;

### Ola mundo :)

```assembly

section .text
global _start
_start:

  mov rax, 1
  mov rdi, 1
  mov rsi, saudacao
  mov rdx, 13
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall

section .data
  saudacao: db "Ola mundo :)", 13

```

###Print de uma mensagem do usuario

Esse algoritmo pega uma mensagem do usuario e imprime na tela

```assembly
section .text
global _start
_start:

  mov rax, 1
  mov rdi, 1
  mov rsi, saudacao
  mov rdx, 21
  syscall
  
  mov rax, 0
  mov rdi, 0
  mov rsi, msg
  mov rdx, 20
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall

section .data
  saudacao: db "Escreva sua mensagem", 21

section .bss
  msg: resb 21

```
