# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Para a resolução desta atividade, optei por desenvolver a lógica e a estrutura das classes manualmente, utilizando a IA apenas para solucionar dúvidas e conceitos específicos de Java.


### Prompt 1
> "No mesmo exercício, preciso implementar uma Agregação entre a classe `CasteloAnimado` e a classe `Divisao`. Eu sei que preciso usar um `ArrayList<Divisao>`, mas para ser considerada uma agregação (e não composição), eu devo dar o 'new ArrayList' dentro do construtor do Castelo ou devo passar a lista pronta como parâmetro no construtor?"

### Prompt 2
> "Qual é a maneira correta para fazer um loop em Java? Quero percorrer o meu `ArrayList<Divisao>` chamado `divisoes` e imprimir o método `getNome()` de cada uma."

---

## Respostas Obtidas

- **Para o Prompt 1:** O modelo esclareceu a diferença. Respondeu que, para ser uma Agregação clássica (onde as divisões podem existir independentemente do castelo), eu deveria instanciar o `ArrayList` fora (no `Main`) e passá-lo como argumento no construtor de `CasteloAnimado`: `public CasteloAnimado(ArrayList<Divisao> divisoes) { this.divisoes = divisoes; }`.
- **Para o Prompt 2:** O modelo forneceu a sintaxe do for aprimorado do Java, mostrando o bloco de código: `for (Divisao d : divisoes) { System.out.println(d.getNome()); }`.

---

## Relatório de Satisfação e Aprendizado

### 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
As respostas foram excelentes e muito direcionadas. Elas ajudaram a destravar o desenvolvimento do código sempre que eu esbarrava em detalhes de sintaxe ou nuances conceituais do Java. Como não pedi o código inteiro, a IA funcionou perfeitamente como um "professor particular", me dando apenas as peças que faltavam para que eu mesmo montasse o quebra-cabeça.

### 2. De que forma ela solucionou a sua dúvida
A IA foi muito clara ao solucionar a confusão que eu tinha sobre a inicialização de listas na Agregação. Ao confirmar que a injeção da lista pronta via parâmetro no construtor é o que garante o acoplamento fraco (característica da agregação), consegui implementar a relação entre `CasteloAnimado` e `Divisao` com segurança. A explicação sobre o uso do `super()` também preencheu uma lacuna teórica importante sobre herança de classes abstratas.

### 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
1. Em Java, a palavra-chave `super()` é essencial para reaproveitar a lógica de inicialização de superclasses, evitando repetição de código (como `this.nome = nome` de novo na classe filha).
2. O ciclo de vida dos objetos define onde eles são instanciados. Se o objeto A depende do objeto B, mas