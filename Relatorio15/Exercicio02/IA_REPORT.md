# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Neste exercício sobre análise de hangares espaciais e deficiência energética, construí a base de fatos e a estrutura lógica das regras de forma autônoma. Contudo, solicitei o auxílio da Inteligência Artificial para compreender um erro de escopo envolvendo o uso do operador de negação do PROLOG.

### Prompt 1
> "Criei a regra `hangar_combate(H)` usando `peca(H, P1, combate)` e `peca(H, P2, combate)`. Como eu garanto que o motor do Prolog não vai atribuir a mesma peça para P1 e P2, fazendo um hangar com apenas uma peça ser considerado verdadeiro?"

### Prompt 2
> "Na regra `falta_energia(H)`, eu escrevi apenas `\+ peca(H, _, propulsao)`. Quando eu chamo a regra passando um hangar específico, ela funciona. Mas quando eu tento rodar a query `falta_energia(H).` pedindo para o Prolog listar quais hangares têm falta de energia, ele simplesmente retorna `false` e não lista nada. Por que o operador de negação quebra a busca geral?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA orientou a utilização do operador de desigualdade lógica `\=`. Ao adicionar `P1 \= P2` logo após a captura das duas peças, eu forço a *engine* de unificação a buscar obrigatoriamente dois átomos distintos no banco de dados para o mesmo hangar `H`.
- **Para o Prompt 2:** O modelo me ensinou o conceito de "Negação Segura" em PROLOG. O operador `\+` não serve para "gerar" ou "buscar" variáveis, ele serve apenas para testar variáveis que já existem. Se `H` estiver vazio (não vinculado), o Prolog pergunta: "É impossível achar qualquer peça de propulsão em qualquer lugar?". Como existe uma peça de propulsão no hangar 1, ele responde "Falso" e encerra. A solução dada foi criar uma regra `hangar(H)` antes do `\+` para obrigar o Prolog a primeiro pegar um hangar válido, e só depois testar se ele *não* possui propulsão.

---

## Relatório de Satisfação e Aprendizado

### 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
A resposta foi vital para o funcionamento correto da última Query do exercício. Eu jamais conseguiria descobrir sozinho que o operador de negação tem limitações quanto à criação de variáveis. A dica de extrair uma lista de hangares antes de aplicar o teste negativo salvou a lógica do sistema.

### 2. De que forma ela solucionou a sua dúvida
Eu estava convicto de que qualquer regra em PROLOG poderia ser consultada de forma aberta (passando variáveis soltas como `H`) ou fechada (passando constantes como `h2`). A IA solucionou esse mal-entendido me mostrando que regras que começam com negação quebram a característica bidirecional do paradigma lógico, exigindo que o contexto (a variável) seja preenchido antes.

### 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
Com a conclusão desta etapa, fixei dois fundamentos essenciais de modelagem lógica:
1. **Diferenciação de Fatos (`\=`):** Sempre que o sistema exigir "duas instâncias" de algo no banco de dados, é estritamente necessário declarar as duas variáveis e aplicar a restrição de desigualdade imediatamente abaixo para evitar a auto-unificação.
2. **Ancoragem de Variáveis em Negação:** Aprendi a regra de ouro do *Negation as Failure*: nunca inicie uma regra com `\+` se a variável que você está negando estiver solta. Sempre busque o alvo no banco de dados primeiro (ex: `hangar(H)`) para ancorar o escopo e fazer a negação funcionar apenas sobre aquele indivíduo isolado.