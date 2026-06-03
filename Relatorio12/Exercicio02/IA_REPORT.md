# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Construí os tipos de dados e a lógica principal em Haskell sozinho. utilizei a Inteligência Artificial para tirar duas dúvidas específicas sobre funções matemáticas e otimização de variáveis locais dentro das "guardas" (Guards).

### Prompt 1
> "No Haskell, tenho uma função `totalItens :: [Item] -> Double`. Como eu combino o `sum` e o `map` para somar apenas o campo 'preco' da minha lista de itens do tipo `Item`?"

### Prompt 2
> "Na minha função `valorFinal :: Compra -> Double`, eu uso guards para checar o status e o valor total. Se o status não for 'Cancelada', eu verifico se `totalItens (listaItens compra) > 200`. Se for, eu retorno `totalItens (listaItens compra) * 0.9`. Tem alguma forma de eu não precisar escrever e recalcular `totalItens (listaItens compra)` duas vezes no meu código?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou que em Haskell as funções avaliam da direita para a esquerda quando ecritas de forma simples. A recomendação foi usar a sintaxe `sum (map preco itens)`. O `map preco itens` extrai uma lista apenas com os valores `[80.0, 100.0, 30.0]`, e então o `sum` recebe essa nova lista e faz o somatório.
- **Para o Prompt 2:** O modelo me apresentou o `where`. Em Haskell, não declaramos variáveis no meio do bloco soltas como em Java, mas podemos usar o `where` no final da função para criar definições locais. 
  **Trecho sugerido:**
  valorFinal compra
      | status compra == Cancelada = 0.0
      | total > 200.0              = total * 0.90
      | otherwise                  = total
      where 
          total = totalItens (listaItens compra)

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
As dicas focaram em mostrar as melhores práticas de escrever o código.

2. De que forma ela solucionou a sua dúvida
Eu estava com dificuldade de entender como guardar o resultado de uma operação temporária. A explicação sobre o where solucionou isso, mostrando como "apelidar" uma expressão matemática para usá-la nas checagens lógicas (total > 200.0).

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros

Composição de Funções de Lista: Funções como map, filter e sum são modulares. Ao invés de tentar fazer tudo de uma vez, em Haskell é melhor fatiar o problema: primeiro transformamos a lista (com map), depois reduzimos (com sum).

Uso da cláusula Where: Aprendi que o where é a melhor forma de deixar o código limpo ao usar Guards. Ele evita a repetição de chamadas de função custosas e torna a leitura da lógica principal muito mais fácil.