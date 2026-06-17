# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Para este exercício sobre cadeias alimentares, modelei a base de conhecimento (os fatos) sozinho. No entanto, como o conceito de recursão é muito abstrato, utilizei a Inteligência Artificial para tirar dúvidas sobre como o compilador processa regras que chamam a si mesmas e como evitar ciclos infinitos.

### Prompt 1
> "No Prolog, o exercício pede para criar um 'Caso Base' e um 'Passo Recursivo' para a mesma regra `fluxo_energia(A, D)`. Como eu escrevo isso no código? Eu declaro a regra duas vezes ou uso um comando `if/else` dentro dela?"

### Prompt 2
> "Eu escrevi a regra recursiva, mas o motor lógico entrou em um 'loop infinito' ou deu erro de falta de memória (Stack Limit). Fiquei sabendo que a ordem das cláusulas importa no Prolog. Eu devo colocar o passo recursivo antes ou depois do caso base?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou que no paradigma lógico não usamos laços como `while` ou `for`. A recursão é declarada criando a mesma regra duas vezes (com a mesma assinatura `fluxo_energia`). O Prolog automaticamente testará a primeira (o caso base). Se ela falhar ou precisarmos de mais respostas (no *Backtracking*), ele descerá para ler a segunda (o passo recursivo).
  **Trecho sugerido:**
  ```prolog
  fluxo_energia(A, D) :- alimenta(A, D).
  fluxo_energia(A, D) :- alimenta(A, Z), fluxo_energia(Z, D).

- **Para o Prompt 2:** O modelo destacou uma regra de ouro da recursão em Prolog: o caso base deve sempre vir primeiro. Se eu colocar a chamada recursiva antes do caso de parada, o compilador vai continuar "mergulhando" na regra chamando a si mesmo antes de verificar se ele já encontrou um fato direto, o que estoura a pilha de memória (Stack Overflow). Além disso, ela me alertou para não colocar a chamada recursiva logo no início do passo recursivo, garantindo que o Prolog resolva um fato concreto (alimenta(A, Z)) antes de se aprofundar

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Compreender que a mesma regra deve ser escrita em múltiplos blocos independentes foi uma quebra de paradigma importante para mim. As dicas de ordenação evitaram que eu travasse o ambiente de execução com chamadas infinitas.

2. De que forma ela solucionou a sua dúvida
Eu achava que uma regra em Prolog só podia ser declarada uma única vez e que precisava conter todas as lógicas dentro dela usando separadores OR (;). A IA me ensinou que declarar múltiplas versões de uma mesma regra é a forma mais idiomática, segura e limpa de construir ramificações e recursões na linguagem.

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
Definições Múltiplas: Uma regra pode (e muitas vezes deve) ter múltiplas definições (cláusulas). O motor lógico tentará avaliá-las de cima para baixo.

Prioridade de Parada: Em recursão, as condições de sucesso mais simples (Casos Base) devem obrigatoriamente estar no topo do arquivo. Isso garante que a recursão consiga "tocar o fundo" e retornar.

Mergulho Seguro: No passo recursivo, a condição imediata (alimenta(A, Z)) deve preceder a chamada recursiva (fluxo_energia(Z, D)). Isso garante que o Prolog apenas chame a recursividade após já ter "andado um passo" na árvore de conhecimento.