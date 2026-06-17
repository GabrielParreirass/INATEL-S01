# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

construí a base de fatos com algumas espécies de teste por conta própria. Porém, utilizei a Inteligência Artificial para me ajudar a entender a mecânica de unificação de variáveis

### Prompt 1
> "No Prolog, como eu verifico se um animal tem pelo menos dois nichos no banco de dados? Eu tentei colocar a regra com `nicho(Animal, X)` e `nicho(Animal, Y)`, mas o Prolog acaba retornando verdadeiro mesmo para animais que só têm um nicho cadastrado. Por que ele faz isso?"

### Prompt 2
> "o operador `\=` entre X e Y, o que exatamente esse operador faz na minha regra `especie_dominante(Animal)` e onde eu devo posicioná-lo no código?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou um conceito fundamental do Prolog chamado *Unificação*. Quando eu peço para o Prolog buscar `nicho(Animal, X)` e depois `nicho(Animal, Y)`, o motor lógico tenta satisfazer as condições. Se a garça só tem o nicho 'rios', o Prolog faz `X = rios` e, logo em seguida, faz `Y = rios` lendo o mesmo fato novamente. Como ele conseguiu preencher X e Y (mesmo sendo com o mesmo dado), ele considera a regra verdadeira.
- **Para o Prompt 2:** o operador `\=` significa "não unifica com" (ou, em termos práticos, "é diferente de"). Ao colocar `X \= Y` logo após a busca dos dois nichos, eu crio uma restrição rígida. O Prolog agora é obrigado a buscar um valor para X e um valor para Y que não sejam idênticos. Se o animal só tiver um nicho, o Prolog tentará repetir o valor, esbarrará na regra `\=`, falhará e descartará aquele animal.

---

## Relatório de Satisfação e Aprendizado

### 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Sem a explicação sobre unificação, eu continuaria achando que usar duas variáveis com letras diferentes (`X` e `Y`) já era o suficiente para o compilador entender que eu queria dois registros separados no banco de fatos. A dica de sintaxe finalizou o meu código com sucesso.

### 2. De que forma ela solucionou a sua dúvida
A IA solucionou a minha confusão ao demonstrar que, no paradigma lógico, as variáveis são apenas "espaços vazios" que a engine tenta preencher de qualquer forma possível para tornar a premissa verdadeira. Dizer que X e Y não podem ser iguais é a única forma de garantir a pluralidade de fatos.

### 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros
1. **Nomes de Variáveis não Garantem Exclusividade:** Apenas nomear variáveis como `A` e `B` não impede que ambas apontem para a mesma constante no banco de dados.
2. **Restrição Pós-Busca:** A ordem das cláusulas importa. Aprendi que devo primeiro pedir para o Prolog buscar os fatos (`nicho(Animal, X), nicho(Animal, Y)`) e só depois aplicar a restrição matemática/lógica (`X \= Y`). Se eu tentasse colocar o `\=` antes de X e Y terem recebido algum valor, o programa não funcionaria como o esperado.