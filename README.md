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

### Print de uma mensagem do usuario

Esse algoritmo pega uma mensagem do usuario e imprime na tela

```assembly
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

```

### Converção de numero para String

Esse algoritomo converte um numero para uma String e printa ela na tela

```assembly
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
```

### Loop for

um loop for no assembly

```assembly
section .text
global _start
_start:
  mov rbx, 5 ; numero que eu quero

loop_div:
  sub rbx, 1 ; subtrai o numero por 1 e muda seus bytes

  mov rax, 1 ; define função de escrita
  mov rdi, 1 ; define que é uma saida
  mov rsi, msg ; define o que saida
  mov rdx, 5 ; tamanho da mensagem
  syscall

  cmp rbx, 0 ; rbx é igual a 0? sem flags Signed
  jne loop_div ; caso não seja retorna ao inicio da seção

  mov rax, 60 ; sair
  xor rdi, rdi ; limpa o registrador de direção de index e diz que tudo ocorreu bem
  syscall ; chama o kernel e termina a execução

section .data
  msg: db "ola ", 4 ; espaço na memoria para a mensagem 
```
