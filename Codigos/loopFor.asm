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
