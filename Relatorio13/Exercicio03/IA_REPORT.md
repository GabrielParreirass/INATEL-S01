# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Para desenvolver a solução do catálogo de Iwai em LISP, entendi as regras de negócio individualmente, mas recorri à Inteligência Artificial para entender melhor como encadear transformações em listas de forma sequencial e funcional

### Prompt 1
> "O exercício pede para encadear várias etapas sequenciais na função `processa-venda`: primeiro filtrar, depois aplicar o imposto com map, depois o bônus com outro map, e no fim gerar a string de saída. Como posso criar uma cadeia de variáveis onde o passo 2 usa o resultado do passo 1, o passo 3 usa o resultado do passo 2, e assim por diante, dentro da mesma função?"

### Prompt 2
> "No momento em que eu aplico o `mapcar` para atualizar o preço de uma arma (adicionando o imposto), eu tentei apenas alterar o campo usando um setf, mas sei que isso quebra a pureza funcional. Qual é a forma correta de usar o `mapcar` para atualizar apenas um campo de uma estrutura em LISP sem corromper a lista original?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA introduziu a diretiva `let*`. Diferente do `let` comum (onde as variáveis locais são inicializadas todas ao mesmo tempo e não "se enxergam"), o `let*` avalia as declarações de cima para baixo. Isso permitiu que eu criasse variáveis como `armas`, `armas-com-imposto` e `armas-processadas`, onde cada uma consome a lista gerada exatamente pela etapa de cima.
- **Para o Prompt 2:** O modelo confirmou que modificar objetos existentes (`setf`) vai contra os princípios da programação funcional. A solução indicada foi retornar uma nova instância da estrutura dentro do `mapcar`. Ao usar o `make-item` no bloco lambda, passei os campos antigos (`item-nome i`) inalterados, e no campo `preco`, passei o valor novo passando pela função `(adiciona-imposto (item-preco i))`.

---

## Relatório de Satisfação e Aprendizado

### 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
As respostas resolveram a parte mais desafiadora do exercício: o encadeamento de pipeline. Sem a orientação sobre o `let*`, eu provavelmente tentaria aninhar múltiplos parênteses de `mapcar` uns dentro dos outros, o que deixaria o código ilegível e difícil de debugar caso algum cálculo estivesse errado.

### 2. De que forma ela solucionou a sua dúvida
Eu estava incerto sobre como o LISP lidava com a cópia de estruturas em listas iteradas. A IA solucionou essa dúvida deixando muito claro o conceito de imutabilidade: toda transformação (map) gera um dado completamente novo. A explicação prática de recriar a estrutura dentro do lambda tornou a manipulação dos dados visível e segura.

### 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
1. Controle de Escopo Sequencial: A diferença crítica entre `let` e `let*`. Saber que o asterisco permite dependência de variáveis adjacentes facilita muito a organização de algoritmos que operam em fases ou passos bem definidos.
2. Transformações Puras: Compreendi na prática que alterar um único valor em uma estrutura em um contexto funcional significa "clonar" o objeto inteiro atualizando a propriedade desejada no momento da criação, mantendo o histórico de processamento seguro contra sobrescritas indesejadas.