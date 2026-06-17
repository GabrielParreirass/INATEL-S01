# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

estruturei as condições lógicas principais sozinho aplicando o que aprendi no exercício anterior. Contudo, consultei a Inteligência Artificial para solucionar um problema de duplicidade espelhada nos resultados da minha consulta.

### Prompt 1
> "Criei a regra `competidores_diretos(A, B)` verificando se A come sol e terra, e se B come sol e terra. Lembrei de usar o `A \= B` para que uma árvore não compita com ela mesma. Porém, o Prolog está me retornando `A = arvore, B = samambaia` e logo depois `A = samambaia, B = arvore`. Como eu impeço o Prolog de mostrar o mesmo par espelhado?"

### Prompt 2
> "O que exatamente o operador `@<` faz no Prolog? Ele compara letras ou compara valores numéricos?"

---

## Respostas Obtidas

- **Para o Prompt 1:** o operador de diferença `\=` apenas impede que as variáveis sejam preenchidas com o mesmo exato dado (como `arvore` e `arvore`). Como avalia todas as combinações da base, ele inevitavelmente inverterá a ordem em algum momento. Para resolver isso, a IA sugeriu substituir `A \= B` por `A @< B`, o que força uma ordem estrita e descarta a permutação invertida.
  **Trecho sugerido:**
  ```prolog
  competidores_diretos(A, B) :-
      alimenta(A, sol), alimenta(A, terra),
      alimenta(B, sol), alimenta(B, terra),
      A @< B.

- **Para o Prompt 2:** O modelo detalhou que o operador @< é usado para "comparação de termos padrão" (ordem alfabética/dicionário para átomos no Prolog), diferente do < tradicional, que é estritamente usado para avaliar expressões aritméticas. Ao forçar que o nome do primeiro competidor venha antes no alfabeto que o segundo, garantimos que o par só seja exibido uma única vez.

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Em consultas complexas de bancos de dados relacionais, resultados espelhados dificultam muito a leitura do relatório final.

2. De que forma ela solucionou a sua dúvida
Eu estava tentando encontrar uma forma de "salvar" os pares em uma lista e depois checar se o inverso já existia, o que seria desnecessariamente complexo. A IA me mostrou que usar a própria ordem dos átomos para quebrar a simetria é uma técnica muito mais elegante e natural dentro do paradigma lógico.

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
O Perigo da Simetria: Regras que relacionam dois objetos de mesma classe (como "A e B são amigos" ou "A e B são competidores") sempre gerarão retornos espelhados no Backtracking se não aplicarmos uma trava direcional.

Comparação de Termos: Aprendi a diferença entre comparar números matematicamente (< ou >) e comparar a estrutura lexical dos átomos e strings (@< e @>). Entender quando usar qual evitará que meus programas quebrem com erros de tipo (type errors) em avaliações futuras.