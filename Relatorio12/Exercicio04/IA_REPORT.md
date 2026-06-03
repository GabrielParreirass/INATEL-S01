# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Para este exercício eu construí toda a estrutura de tipos de dados e as funções básicas. No entanto, consultei a IA para tirar duas dúvidas específicas sobre como medir o tamanho de uma lista dentro de *Guards* e como otimizar o cálculo de acréscimo percentual.

### Prompt 1
> "No Haskell, como eu faço para verificar se uma lista tem mais de 3 elementos dentro de uma condição Guard? O meu tipo `Atendimento` tem o campo `listaServicos`. Preciso aplicar uma taxa se a pessoa contratou mais de 3 serviços"

### Prompt 2
> "Para adicionar o acréscimo de 25% sobre o valor total do atendimento, eu escrevi `total + (total * 0.25)`. Existe alguma forma mais idiomática ou limpa de escrever isso?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou que o Haskell possui uma função nativa chamada `length` que retorna o tamanho de uma lista. Ela recomendou usá-la diretamente na expressão booleana do *Guard*.
  **Trecho sugerido:**
    | length (listaServicos atendimento) > 3 = ...
  **Para o Prompt 2:** O modelo sugeriu que, matematicamente, adicionar 25% a um valor é o mesmo que multiplicar esse valor por 1.25.
  **Trecho sugerido:**
    | length (listaServicos atendimento) > 3 = total * 1.25

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Saber que eu precisava passar a lista como argumento para a função global length destravou a lógica do meu programa, permitindo que eu finalizasse a função valorFinalAtendimento.

2. De que forma ela solucionou a sua dúvida
Eu estava tentando encontrar alguma forma de iterar a lista ou usar recursão para contar os itens na mão, o que deixaria o código enorme. A IA me lembrou que a biblioteca padrão do Haskell (Prelude) já é muito rica em operações de lista.

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros

Funções Padrão de Lista: O Haskell já oferece ferramentas como length, sum, e last prontas para uso. Sempre vale a pena tentar compor essas funções nativas antes de criar lógicas recursivas do zero para resolver problemas triviais de contagem.

Elegância Funcional: Em linguagens declarativas, a simplicidade matemática é muito valorizada. Transformar uma expressão extensa de adição percentual em uma única multiplicação (* 1.25) reduz a chance de erros de parênteses e torna a linha muito mais limpa para futuros mantenedores lerem.