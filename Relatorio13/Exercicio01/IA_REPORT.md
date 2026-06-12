# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonscea
- **Matrícula:** 644

---

## Histórico de Prompts

Para este exercício da Farmácia da Maomao, modelei a lógica matemática sozinho, porém utilizei a Inteligência Artificial para me ajudar a traduzir esses conceitos de Programação Funcional para o Lisp.

### Prompt 1
> "Estou fazendo um código em LISP. Como eu crio uma estrutura de dados customizada de forma que eu consiga criar campos nome e precoBase para acessar depois?"

### Prompt 2
> "O exercício pede para usar 'guards' para retornar '10ml', '25ml' ou '50ml' dependendo do peso e idade na função `calcula-dosagem`. Como eu construo essa mesma estrutura de checagem condicional múltipla e o caso padrão em LISP?"

### Prompt 3
> "A função `descricao-erva` precisa juntar o nome da erva, o preço e a dosagem em uma única String para retornar, não é para imprimir direto na tela. Como eu faço concatenação de strings no LISP para devolver esse texto?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou que em Lisp a ferramenta mais próxima para isso é a macro `defstruct`. Ao usar `(defstruct erva nome preco-base)`, o Lisp automaticamente gera construtores como `make-erva` e métodos de acesso (getters) combinando o nome da struct e do campo, como `erva-nome` e `erva-preco-base`.
- **Para o Prompt 2:** O modelo ensinou que a forma idiomática de substituir *Guards* no Lisp é a estrutura `cond`. Ela recebe pares de condições e resultados. Para simular o `otherwise` (caso padrão) do Haskell, o Lisp utiliza um `t` (verdadeiro) no último caso lógico.
  **Trecho sugerido:**
  ```lisp
  (cond
    ((< idade 5) "10ml")
    (t "50ml"))

- **Para o Prompt 3:** O retorno detalhou o uso da função format. A IA explicou que se o primeiro argumento do format for t, ele imprime no console. Mas se o primeiro argumento for nil, o format simplesmente constrói e retorna a string montada com as variáveis. Usei as tags ~A para texto e ~,2F para formatar o preço com duas casas decimais.

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Tentar concatenar strings em Lisp sem saber que o (format nil ...) existe resultaria em códigos gigantescos usando funções de lista ou concatenate 'string. A instrução direta me poupou muito tempo de leitura da documentação (que costuma ser bem antiga e densa no caso de Lisp).

2. De que forma ela solucionou a sua dúvida
A minha maior dificuldade era "Como fazer pattern matching sem ter o comando no Lisp?". A IA solucionou isso mostrando que o cond com string-equal resolve o mesmo problema lógico de verificar o nome da erva e aplicar o fator correto, adaptando a instrução para o que a linguagem oferece nativamente.

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
Estruturas de Dados (defstruct): O Lisp lida muito bem com registros nomeados. A geração automática dos prefixos (nome-da-struct-nome-do-campo) é peculiar, mas garante que não haja colisão de nomes de variáveis no programa.

O Poder do cond: Em Lisp, raramente usamos if aninhados. O cond atua exatamente como um bloco switch-case, tornando qualquer árvore de decisão muito limpa e aninhada dentro de seus respectivos parênteses.

Comandos Embutidos Versáteis: A função format faz o trabalho de interpolação de strings e de saída padrão dependendo de um único parâmetro (t ou nil), o que demonstra a versatilidade de comandos antigos no Common Lisp.