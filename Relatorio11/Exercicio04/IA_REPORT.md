# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Neste exercício envolvendo o universo de "Dungeon Meshi", elaborei a arquitetura e a lógica sozinho, mas utilizei a Inteligência Artificial para me ajudar a estruturar corretamente as regra de métodos abstratos e as diferenças  de inicialização entre Agregação e Composição. Seguem os prompts:

### Prompt 1
> "Na classe abstrata `Monstro`, declarei o método `public abstract void virarPrato();`. O compilador está dando erro dizendo que falta o corpo do método.

### Prompt 2
> "No meu exercício, a classe `Prato` precisa receber um `Monstro` como Agregação e um `Tempero` como Composição. No construtor de `Prato`, como eu diferencio elas?

### Prompt 3
> "Criei um `ArrayList<Prato> cardapio` e adicionei os pratos nele. Quero usar um for para chamar o método `servir()` de cada prato da lista.

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou que métodos abstratos não possuem corpo na superclasse, servindo apenas como um contrato. A sintaxe correta exige que a linha termine em ponto e vírgula `;`. Quem define as chaves e o comportamento real são as classes filhas usando a anotação `@Override`.
- **Para o Prompt 2:** A IA demonstrou que a diferença ocorre na passagem de parâmetros e no ciclo de vida.
  **Trecho sugerido:**
  public Prato(String nome, Monstro monstroRecebidoDeFora, String nomeTempero) {
      this.monstro = monstroRecebidoDeFora; // Agregação: objeto já existe e é injetado.
      this.tempero = new Tempero(nomeTempero); // Composição: o objeto nasce e morre aqui dentro.
  }
- **Para o Prompt 3**: confirmou que o laço for já cria automaticamente uma variável de referência iterável. Não é necessário extrair nada manualmente, permitindo a execução do método diretamente no objeto da iteração. Exemplo dado: for (Prato p : cardapio) { p.servir(); }.

## Relatório de Satisfação e Aprendizado
1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Tiraram minha dúvida principal sobre sintaxe de classes abstratas que me impedia de compilar o arquivo. A parte mais útil foi o esclarecimento prático no código sobre como escrever construtores, que lidam com agregações e composições simultaneamente sem misturar os conceitos.

2. De que forma ela solucionou a sua dúvida
Sempre tive confusão em como o Java sabe se algo é composição ou agregação. A IA solucionou essa dúvida me mostrando que o Java não rotula essas relações. O new Tempero instanciado internamente significa que se o Prato for apagado da memória, o tempero some junto (Composição). Já o Monstro foi criado na Main e apenas passado por referência (Agregação), o que significa que o monstro existe antes do prato.

3. O que você aprendeu com aquele retorno para aplicar em problemas futuros

Contratos Abstratos: Ao usar a palavra-chave abstract num método, encerro com ;. Isso obriga as classes filhas a tomarem a responsabilidade da implementação, garantindo um código padronizado.

Design de Construtores: Construtores podem receber não apenas objetos prontos, mas parâmetros primitivos (como String nomeTempero) único objetivo é alimentar o "nascimento" de um objeto interno que compõe aquela classe.

Agilidade com Coleções: O uso do for simplifica imensamente o acionamento de métodos em lote, eliminando a necessidade de lidar com contadores e índices .get(i) para executar rotinas simples como servir().