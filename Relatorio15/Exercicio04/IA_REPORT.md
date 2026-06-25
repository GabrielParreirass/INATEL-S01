# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Neste último exercício de PROLOG focado na identificação de componentes folha e raiz, desenvolvi a lógica de dependências de forma autônoma. No entanto, consultei a Inteligência Artificial para solucionar um problema técnico sobre como definir o universo de itens válidos antes de aplicar regras de negação.

### Prompt 1
> "Na minha regra `peca_raiz(P)`, eu escrevi apenas `\+ precisa(P, _)`. Porém, quando testo, o Prolog não me retorna a lista das peças que não precisam de nada, ele apenas falha. Como eu corrijo essa regra para ele listar as peças corretamente?"

### Prompt 2
> "Criei a regra `componente(P) :- categoria(P, _).` como você sugeriu. Para a query final do exercício, preciso verificar se a peça é raiz e se a categoria dela é diferente de propulsão. Onde exatamente eu devo colocar a condição `C \= propulsao` na minha busca?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA relembrou o conceito fundamental de que o operador de negação `\+` não gera resultados, ele apenas testa variáveis já instanciadas. Se eu passasse `P` vazio, o Prolog não saberia quais peças testar. A solução foi criar uma regra auxiliar chamada `componente(P)` que extrai todos os itens declarados nos fatos de categoria, servindo como uma "fonte geradora" para a variável `P` antes de aplicar a negação por falha `\+ precisa(P, _)`.
- **Para o Prompt 2:** O modelo explicou a ordem de avaliação lógica. Primeiro, eu devo garantir que `P` seja uma peça raiz chamando a regra. Depois, devo resgatar a categoria daquela peça específica chamando `categoria(P, C)`. Somente após a variável `C` estar preenchida com a categoria da peça, eu aplico o operador relacional de diferença `C \= propulsao` para descartar o item caso ele pertença àquele grupo.

---

## Relatório de Satisfação e Aprendizado

### 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
A resposta foi crucial para eu terminar o sistema. Tentar listar informações usando apenas fatos negativos é um erro comum e a IA corrigiu rapidamente o meu fluxo de dados, demonstrando como extrair variáveis de um fato para alimentar a negação de outro.

### 2. De que forma ela solucionou a sua dúvida
Eu não estava entendendo de onde o Prolog deveria "tirar" as peças se a regra era justamente sobre "peças que não estão no lado esquerdo do predicado precisa". A IA solucionou isso evidenciando que em bancos de dados lógicos, devemos usar outros relacionamentos (neste caso, as categorias) como um catálogo principal de todos os itens existentes.

### 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
Com a finalização deste código, reforcei as seguintes bases de desenvolvimento em PROLOG:
1. **Domínio de Variáveis:** Nenhuma negação por falha deve operar no vácuo. Se o objetivo é listar resultados, a variável da regra principal precisa nascer de uma busca positiva preliminar.
2. **Avaliação Sequencial Estruturada:** O motor lógico lê da esquerda para a direita (ou de cima para baixo). Restrições como `\=` ou `>` só fazem sentido e só funcionam se as variáveis testadas já tiverem sido unificadas na linha imediatamente superior.