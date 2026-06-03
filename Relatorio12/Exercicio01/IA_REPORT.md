# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Escrevi a lógica principal e a declaração de tipos, mas utilizei a Inteligência Artificial para me ajudar a compreender o *Pattern Matching* com *Record Syntax* e o uso de *Guards*.

### Prompt 1
> "No Haskell, eu preciso criar um tipo `Bebida` com nome, tipo e preço, e um tipo `Pedido` com uma lista de bebidas e um status. Como eu crio essas estruturas de dados de forma que eu consiga acessar o preço de uma bebida facilmente depois?"

### Prompt 2
> "Preciso criar uma função `valorTotalPedido :: Pedido -> Double`. O exercício pede para eu usar 'guards' para retornar `0.0` se o status for `Cancelado`. Como eu escrevo o guard para verificar um campo específico dentro da minha estrutura `Pedido`?"

### Prompt 3
> "Como eu faço *Pattern Matching* em Haskell para pegar apenas o primeiro elemento de uma lista que está dentro do meu tipo `Pedido`? A assinatura é `primeiraBebida :: Pedido -> String`. Quero tratar o caso de lista vazia e o caso de ter elementos"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA recomendou o uso de *Record Syntax*. Diferente de declarar `data Bebida = Bebida String String Double`, a *Record Syntax* permite nomear os campos (`nome :: String, preco :: Double`). Isso automaticamente gera "funções getter" no Haskell, então basta eu chamar `preco bebida` para extrair o valor, o que facilita muito a manipulação.
- **Para o Prompt 2:** O modelo explicou que os *Guards* substituem cadeias de `if/else`. Para checar o status, eu precisei adicionar `deriving (Eq)` no tipo `StatusPedido` para o Haskell saber compará-los. 
  **Trecho sugerido:**
  valorTotalPedido pedido
      | status pedido == Cancelado = 0.0
      | otherwise = sum (map preco (listaBebidas pedido))

- **Para o Prompt 3:** A IA explicou como desconstruir o Pedido diretamente nos parâmetros da função. Em vez de usar if ou funções como head, posso escrever uma versão da função para quando a lista for [] e outra para quando a lista tiver o formato (b:_), onde b é a primeira bebida e _ ignora o resto.
      **Trecho sugerido:**
    primeiraBebida (Pedido [] _) = "Vazia"
    primeiraBebida (Pedido (b:_) _) = nome b

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
As respostas foram extremamente diretas e resolveram meus problemas imediatamente. Ver exemplos curtos usando os meus próprios tipos (Pedido e Bebida) acelerou a compreensão sem que eu perdesse o controle da lógica.

2. De que forma ela solucionou a sua dúvida
A IA solucionou minhas duvidas me apresentando o poder do Pattern Matching. A ideia de que você pode "desempacotar" a estrutura de dados direto nos parâmetros da função ((Pedido (b:_) _)).

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros

Poder do Pattern Matching: Aprendi a lidar com listas sem depender de loops explícitos. Tratar o cenário vazio [] e o cenário cons (x:xs) garante que meu código seja seguro e não gere exceções em tempo de execução ao tentar pegar elementos inexistentes.