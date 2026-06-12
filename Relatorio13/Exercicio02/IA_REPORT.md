# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Na resolução deste exercício, estruturei a lógica dos dados do catálogo de 4546B sozinho. Porém, precisei  da ajuda da IA para aprender comandos específicos da linguagem LISP para manipulação de listas e simulação de tipos fixos.

### Prompt 1
> "preciso que o campo `periculosidade` de uma criatura só aceite os valores fixos Baixa, Media e Alta. Como declaro valores literais como se fossem categorias pré-definidas sem usar strings?"

### Prompt 2
> "Preciso criar a função `filtra-por-perigo` que recebe uma lista de estruturas e me devolve a lista apenas com aqueles cuja periculosidade não seja Baixa. Como faço esse filtro lógico sobre uma lista em Lisp?"

### Prompt 3
> "A função `relatorio-profundidade` precisa primeiro filtrar as criaturas do ambiente 'Deep' e logo em seguida transformar cada estrutura em uma string. Como juntar o processo de filtrar e de transformar cada item na mesma rotina?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou o conceito de *Símbolos* em LISP. Ela recomendou o uso da aspa simples (`'`) antes da palavra, como `'baixa`, `'media` e `'alta`. O LISP trata esses termos como identificadores únicos na memória, otimizando comparações usando a função `eq`.
- **Para o Prompt 2:** A IA me apresentou as funções nativas de remoção condicional: `remove-if` e `remove-if-not`. Como eu queria tudo que *não* fosse baixa, a sugestão foi: `(remove-if (lambda (c) (eq (criatura-periculosidade c) 'baixa)) catalogo)`. O comando usa uma função anônima `lambda` para avaliar cada item.
- **Para o Prompt 3:** O explicou como combinar o `mapcar` (usado para mapear transformações) com o filtro.  
  **Trecho sugerido:**
  ```lisp
  (mapcar (lambda (c) (format nil "...")) 
          (remove-if-not (lambda (c) (string-equal (criatura-ambiente c) "Deep")) catalogo))

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
O suporte pontual nas funções de alta ordem (mapcar e remove-if) evitou que eu perdesse muito tempo estruturando laços de repetição manuais. Além disso, introduzir o conceito de Símbolos (') logo no início tornou meu código bem mais robusto e idiomático.

2. De que forma ela solucionou a sua dúvida
A explicação da IA tirou a minha dúvida sobre como unir operações sem poluir o código com variáveis temporárias: o resultado de (remove-if-not ...) vira imediatamente o argumento de lista que o (mapcar ...) consome, tudo encapsulado por seus próprios parênteses.

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
Identificadores Rápidos: Uso de símbolos ('simbolo) para estados em vez de depender exclusivamente da comparação pesada de Strings.

Separação de Funções de Filtro: Para remover algo, usamos remove-if. Para reter algo específico, remove-if-not. Entender essa divisão facilita bastante a semântica da leitura.

Mapeamento Transformador: O comando mapcar é essencial para converter listas de Estruturas complexas (como minha lista de Criatura) em listas de primitivas (como uma lista de Strings prontas para a tela), isolando assim a lógica de dados da apresentação visual no terminal.