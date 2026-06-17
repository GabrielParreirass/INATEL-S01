# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

estruturei os fatos da base de conhecimento por conta própria, mas precisei da ajuda da Inteligência Artificial para entender a sintaxe de operadores lógicos e o comportamento da *engine* de inferência ao retornar dados repetidos.

### Prompt 1
> "No Prolog, eu preciso criar a regra `especie_chave(Animal)`. Como eu escrevo a sintaxe para dizer que a condição é (alimenta de água OU terra) E (nicho é rios, pântano OU profundezas)?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou que o operador lógico `E` (AND) é representado pela vírgula `,`, enquanto o operador lógico `OU` (OR) é representado pelo ponto e vírgula `;`. Para combinar múltiplas condições, é obrigatório agrupar os blocos com parênteses, caso contrário o Prolog pode avaliar a ordem de forma incorreta.
  **Trecho sugerido:**
  ```prolog
  especie_chave(Animal) :-
      (alimenta(Animal, agua) ; alimenta(Animal, terra)),
      (nicho(Animal, rios) ; nicho(Animal, pantano) ; ...).

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Montar as condições OR e AND era o ponto central do exercício, e a explicação clara sobre o uso dos parênteses evitou que a minha regra validasse animais incorretos. 

2. De que forma ela solucionou a sua dúvida
aprendi que o Prolog não retorna apenas "os dados", mas sim "as provas" de que algo é verdade. Se há duas provas, ele mostra as duas.

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
Memorizei definitivamente que a vírgula , atua unindo fatos obrigatórios (AND), e o ponto e vírgula ; cria caminhos alternativos (OR).
