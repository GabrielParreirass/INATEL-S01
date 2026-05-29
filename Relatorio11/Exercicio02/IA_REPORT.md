# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

Para este exercício do Leblanc, construí a estrutura base das classes e a lógica principal. Utilizei a Inteligência Artificial apenas como suporte para validar conceitos, solicitando exemplos em código para as seguintes dúvidas:

### Prompt 1
> "Estou modelando uma herança em Java onde `CafeGourmet` herda de `Cafe`. Na classe pai, o `preco` é `private`. Como eu faço para o método `@Override calcularPrecoFinal()` da classe filha acessar o preço da classe pai para somar com o `bonusAroma`?"

### Prompt 2
> "No exercício, a classe `CafeteriaLeblanc` tem uma Composição com a classe `Menu`. Instanciei o `Menu` no construtor da cafeteria. Porém no `Main` como eu faço para adicionar um café nesse menu se o atributo `menu` é privado dentro de `CafeteriaLeblanc`?"

### Prompt 3
> "A minha lista no `Menu` é um `ArrayList<Cafe>`. Se eu adicionar um `CafeGourmet` nela, na hora de fazer o for, o Java vai saber chamar o `calcularPrecoFinal()` modificado do Gourmet ou vai chamar o da classe pai?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA explicou que atributos privados não podem ser acessados diretamente pelas subclasses. A solução dada foi utilizar o método getter público da superclasse para recuperar o valor. 
  **Trecho sugerido pela IA:**
  @Override
  public double calcularPrecoFinal() {
      return getPreco() + this.bonusAroma;
  }

- **Para o Prompt 2:** O modelo desaconselhou o uso de um getMenu(), pois isso quebraria o encapsulamento (exporia as entranhas da cafeteria para o Main). Em vez disso, sugeriu criar um método wrapper (delegador) dentro de CafeteriaLeblanc que simplesmente repassa a ordem para o menu.
**Trecho sugerido pela IA:**

public void adicionarNoCardapio(Cafe c) {
    this.menu.adicionarCafe(c); // Delega a ação para o objeto interno
}

- **Para o Prompt 3:** O retorno confirmou que sim, o Java saberá executar o método correto. A IA introduziu brevemente o conceito de Polimorfismo, explicando que o comportamento do método é determinado em tempo de execução com base no tipo real do objeto instanciado (na memória), e não no tipo da variável de referência da lista.

### Relatório de Satisfação e Aprendizado
- 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
Elas me ajudaram a resolver os gargalos do código sem que eu precisasse terceirizar a lógica inteira do exercício. A sugestão de usar um método delegador para adicionar itens no menu salvou meu design de classes, garantindo que o encapsulamento da Composição se mantivesse intacto.

- 2. De que forma ela solucionou a sua dúvida
A IA atuou tirando as "pedras do caminho". Quando travei no acesso ao atributo privado na herança, a instrução simples de usar o getPreco() clareou minha mente, pois eu estava tentando acessar a variável preco diretamente com o super. Além disso, a confirmação teórica sobre o Polimorfismo no loop for-each me deu a segurança necessária para rodar o código sem medo de ele calcular todos os preços apenas como cafés comuns.

- 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros

Composição exige responsabilidade no encapsulamento: Se a classe A compõe a classe B, a classe A deve agir como intermediária. Expor a classe B através de um "getter" direto enfraquece o propósito de esconder a complexidade interna do sistema.

Confiança no Polimorfismo: Entendi na prática que coleções genéricas da superclasse (como ArrayList<Cafe>) são poderosas porque aceitam qualquer objeto filho e executam suas versões sobrescritas de métodos automaticamente, tornando o sistema altamente extensível caso eu precise adicionar um novo CafeGelado no futuro.