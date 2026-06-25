# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Neste exercício de avaliação de componentes industriais, criei as relações e os encadeamentos sozinho. No entanto, precisei utilizar a Inteligência Artificial para compreender a sintaxe de operadores matemáticos no PROLOG e como executar uma query para verificar a "ausência" de um fato.

### Prompt 1
> "No Prolog, como eu verifico se o valor de uma variável é maior que um número específico? Na minha regra `peca_critica(P)`, preciso verificar se os MW do componente P são maiores que 5."

### Prompt 2
> "A query do exercício pede para eu encontrar um componente que 'não seja necessário para nenhum outro componente'. Eu sei como achar quem precisa de quem usando `precisa(Alguem, P)`, mas como eu pergunto ao Prolog para confirmar que NINGUÉM precisa desse P?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA esclareceu que operadores matemáticos relacionais funcionam de maneira muito familiar no Prolog. Após resgatar o valor através do fato `consumo(P, MW)`, basta utilizar `MW > 5` na linha de baixo para aplicar a restrição. Caso a condição falhe, o motor fará *backtracking* para procurar outro componente.
- **Para o Prompt 2:** O modelo apresentou um conceito poderoso chamado "Negação por Falha" (*Negation as Failure*), representado pelo operador `\+`. Para checar se ninguém precisa do componente `C`, a instrução fornecida foi `\+ precisa(_, C)`. O símbolo `_` (variável anônima) indica "qualquer coisa". Se o Prolog tentar encontrar "qualquer coisa que precise de C" e falhar, o operador `\+` inverte o resultado para verdadeiro.

---

## Relatório de Satisfação e Aprendizado

### 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
As respostas foram diretas e essenciais para a elaboração do meu script. Sem a introdução do operador `\+`, eu estaria travado tentando criar rotinas complexas para contar elementos em uma lista (algo difícil em lógicas puras) só para ver se a contagem era zero.

### 2. De que forma ela solucionou a sua dúvida
Eu tinha receio de misturar aritmética com a dedução lógica do Prolog, mas a IA mostrou que, desde que a variável numérica já esteja instanciada (já tenha um valor resgatado do banco), o uso de `>` é perfeitamente válido. A solução da negação solucionou meu gargalo de "como testar o que não existe".

### 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
Nesta atividade consolidei duas habilidades vitais da linguagem:
1. **Aritmética como Restrição:** Em PROLOG, os testes matemáticos (como `>` ou `<`) atuam como filtros (restrições) durante o fluxo lógico, e não como cálculos em si. Eles bloqueiam a árvore de busca se os números não baterem.
2. **Negação por Falha (`\+`):** Aprendi que em linguagens declarativas nós não provamos que uma premissa negativa é verdade; nós provamos que a premissa positiva falha. `\+ precisa(_, C)` significa estritamente "é impossível provar que alguém precise de C", o que atende perfeitamente ao conceito de "componente isolado" exigido pela query.