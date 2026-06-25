# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Neste exercício avançado sobre gerenciamento de inventário espacial, a manipulação de banco de dados se tornou mais complexa. Compreendi a lógica de restrição de categorias sozinho, mas precisei da ajuda da Inteligência Artificial para entender como simular o conceito de quantificação universal ("para todos") em PROLOG, já que a linguagem não possui laços de repetição nativos.

### Prompt 1
> "No Prolog, como eu implemento a lógica de 'TODOS os requisitos'? A dica do exercício diz para usar 'Não existe um requisito que o hangar não possua'. Como eu ligo a minha regra `precisa` com a regra `item_faltante` usando operadores lógicos para chegar nesse resultado?"

### Prompt 2
> "Entendi que devo usar o operador de negação `\+` em volta das duas condições. Mas como exatamente o motor do Prolog lê a linha `\+ (precisa(Componente, Req), item_faltante(Hangar, Req))`? Por que isso equivale a um 'FOR ALL'?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou que em linguagens lógicas, expressar "Todos possuem X" é matematicamente equivalente a dizer "Não existe nenhum caso que não possua X". Para escrever isso em código, a instrução foi colocar as duas condições entre parênteses para agrupar o escopo da busca, e aplicar o operador `\+` no início do grupo. A sintaxe correta sugerida foi `\+ (precisa(Componente, Req), item_faltante(Hangar, Req))`.
- **Para o Prompt 2:** O modelo detalhou a técnica conhecida como *Dupla Negação* na programação lógica. Quando o Prolog lê essa linha, ele tenta encontrar *pelo menos uma* peça (`Req`) que seja necessária para o `Componente` e que, ao mesmo tempo, esteja faltando no `Hangar`. Se ele conseguir encontrar essa peça faltante (ou seja, a condição interna é verdadeira), o `\+` externo inverte para `falso` e a regra `pode_montar` falha. Se ele procurar por toda a base de dados e não encontrar nenhuma peça faltando, a busca interna falha e o `\+` inverte o resultado para `verdadeiro`.

---

## Relatório de Satisfação e Aprendizado

### 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
As respostas foram definitivas para a finalização do meu script. Eu estava tentado a buscar soluções usando manipulação de listas ou recursão complexa para "contar" quantos requisitos existiam e quantos o hangar tinha, o que seria totalmente contraprodutivo. A IA me redirecionou para o caminho correto do raciocínio lógico formal.

### 2. De que forma ela solucionou a sua dúvida
Eu não estava conseguindo visualizar como uma linguagem sem um laço iterativo `for-each` poderia varrer todos os componentes para validar uma aprovação. A IA solucionou esse bloqueio ao me apresentar a beleza matemática de provar uma afirmação universal através da falha de sua negação (prova por contradição).

### 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
Com o fechamento deste exercício, consolidei uma das regras mais poderosas e contra-intuitivas da modelagem em PROLOG:
1. **Quantificação Universal por Dupla Negação:** Sempre que um problema exigir que "todos os X devam satisfazer Y", não tentarei contar os elementos. Em vez disso, usarei o padrão `\+ (X, \+ Y)` ou, dependendo das regras já criadas, `\+ (X, regra_de_falha(Y))`.
2. **Escopo Agrupado:** Aprendi que os parênteses `( )` funcionam como uma barreira de proteção em consultas conjuntas. Usar `\+ (A, B)` obriga o Prolog a tentar resolver A e B em conjunto antes de negar o resultado final, diferente de usar `\+ A, B` que apenas negaria a primeira premissa separadamente.