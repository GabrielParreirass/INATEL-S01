# IA_REPORT.md

## Identificação

- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Para a elaboração do exercício da Casa de Shows, estruturei os tipos de dados básicos da aplicação de forma independente, utilizei a Inteligência Artificial para tirar dúvidas sobre a aplicação de taxas financeiras e o resgate do último elemento de uma lista em _Pattern Matching_.

### Prompt 1

> "No Haskell, a minha função `custoTotalEvento :: Evento -> Double` precisa retornar 0 se estiver Cancelado, e se não estiver, precisa somar o cachê das bandas e adicionar uma taxa de 20%. Como eu escrevo essa multiplicação de 20% no final da minha soma `sum (map cache (listaBandas evento))`?"

### Prompt 2

> "Na minha função `bandaAbertura :: Evento -> String`, eu usei `(Evento (b:_) _)` no pattern matching para pegar o primeiro elemento `b`. Mas agora preciso fazer a função `bandaEncerramento`, que pega o último. O exercício pede para usar a função `last`. Como eu aplico o `last` usando pattern matching na lista?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA me orientou que o cálculo matemático direto seria multiplicar toda a expressão por 1.20 (que representa os 100% + 20% de taxa). Para deixar o código mais legível e evitar parênteses excessivos, ela também recomendou isolar a soma usando o `where`.
  **Trecho sugerido:**
  | otherwise = totalCaches \* 1.20
  where totalCaches = sum (map cache (listaBandas evento))
- **Para o Prompt 2:** O modelo explicou que não existe um operador nativo como o : (cons) que funcione de trás para frente no Pattern Matching (não dá para fazer algo como (_:b)). A solução foi capturar a lista inteira numa variável (ex: bandas) dentro do Pattern Matching e então aplicar a função last nessa variável.
  **Trecho sugerido:**
  Haskell
  bandaEncerramento (Evento [] _) = "Nenhuma banda programada."
  bandaEncerramento (Evento bandas \_) = nome (last bandas)

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Em vez de tentar calcular a taxa usando lógicas de percentual longas, a IA me lembrou do cálculo direto com fator multiplicador (1.20) e solucionou perfeitamente o meu bloqueio com a função last.

2. De que forma ela solucionou a sua dúvida
Eu achava que todo Pattern Matching com listas obrigatoriamente exigia desconstruir com a cabeça e cauda (x:xs). A IA solucionou isso me mostrando que eu posso apenas dar um "nome" inteiro para a lista que está no tipo Evento e, no corpo da função, chamar qualquer função auxiliar de lista sobre ela (no caso, last bandas).

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
Expressões Matemáticas Limpas: Multiplicações flutuantes (como * 1.20) funcionam de forma natural sobre funções de redução como o sum.

Flexibilidade do Pattern Matching: O Pattern Matching serve tanto para "quebrar" uma estrutura em pedaços (x:xs) quanto para apenas "desempacotar" a variável de dentro do tipo Record, facilitando o acesso ao que eu realmente preciso no momento (neste caso, a lista de bandas, para passar para o last).