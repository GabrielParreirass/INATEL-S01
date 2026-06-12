# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Na construção dessa rotina de farm de Teyvat, implementei a estrutura de dados das recompensas por conta própria, mas recorri à Inteligência Artificial para compreender a sintaxe correta de operadores lógicos compostos no LISP e aprender atalhos na passagem de funções como argumento.

### Prompt 1
> "Em LISP, na minha função `bonus-elemental`, preciso verificar se o elemento do local é 'pyro' ou 'electro' para aplicar a taxa de 20%. Como escrevo um comando condicional `OR` dentro de um bloco `cond`?"

### Prompt 2
> "A minha função `vale-a-pena` precisa retornar verdadeiro se duas coisas acontecerem ao mesmo tempo: a recompensa calculada for maior que 500 e a dificuldade for menor ou igual a 3. Como eu faço uma expressão booleana combinando as duas condições e retornando verdadeiro/falso?"

### Prompt 3
> "Na hora de usar a função de filtragem `remove-if-not`, eu não queria ter que escrever um `(lambda (x) (vale-a-pena x))` de novo se eu já tenho a função pronta com esse nome. Existe uma forma de passar a função que eu já criei diretamente como parâmetro do `remove-if-not`?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou que os operadores lógicos no LISP atuam como funções regulares (notação prefixa). Portanto, o `or` vem antes de tudo, envolvendo as condições lógicas que devem ser avaliadas. A solução fornecida foi a expressão `(or (eq el 'pyro) (eq el 'electro))`.
- **Para o Prompt 2:** O modelo orientou que, assim como o `or`, o `and` no LISP engloba todas as expressões. Uma característica interessante pontuada pela resposta é que não preciso escrever um `if` explícito para retornar verdadeiro ou falso: a própria expressão `(and ... ...)` já avalia e devolve o booleano `t` ou `nil` nativamente. O trecho sugerido foi: `(and (> (bonus-elemental loc) 500) (<= (local-dificuldade loc) 3))`.
- **Para o Prompt 3:** O retorno indicou a existência do operador `#'` (macro `function`). Ele permite referenciar o objeto de função diretamente pelo nome para usá-lo como argumento em funções de alta ordem, enxugando bastante a sintaxe. A sugestão foi escrever simplesmente `(remove-if-not #'vale-a-pena catalogo)`.

---

## Relatório de Satisfação e Aprendizado

### 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Especialmente no uso de funções de primeira classe, a dica do `#'` eliminou a redundância do meu código, evitando lambdas desnecessários onde já existia uma função projetada exatamente para a checagem necessária.

### 2. De que forma ela solucionou a sua dúvida
Eu estava com dificuldade na sintaxe dos blocos condicionais, muitas vezes errando a quantidade de parênteses ao tentar alinhar múltiplas verificações booleanas. A IA me mostrou a clareza da notação prefixa: em LISP, funções como `and` e `or` funcionam exatamente igual à soma `+`, recebendo as sentenças lógicas à sua direita, resolvendo o problema de escopo de forma bem padronizada.

### 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
1. **Lógica em Prefixos:** Todas as operações lógicas e matemáticas seguem a mesma regra gramatical de ficar em primeiro lugar na lista de avaliação `(operador exp1 exp2)`. 
2. **Retornos Lógicos Diretos:** Não é necessário encapsular expressões relacionais (`>` ou `<=`) dentro de blocos se o objetivo já é retornar o próprio booleano resultante dessa relação.
3. **Ponteiros de Função:** O uso de `#'nome-da-funcao` é a maneira mais elegante e direta de injetar funções auxiliares (`callbacks`) em ferramentas de iteração de lista, deixando a leitura da rotina principal muito mais próxima da linguagem natural.