# IA_REPORT.md

## Identificação
- **Nome Completo:** Gabriel Parreiras Afonseca
- **Matrícula:** 644

---

## Histórico de Prompts

recorri à Inteligência Artificial para me ajudar a resolver desafios específicos relacionados ao uso do `HashMap` e conversão de tipos durante a exibição dos dados. Seguem os prompts:


### Prompt 1
> "Criei um `HashMap<String, Entidade>` para gerenciar os registros. Para listar os dados no método `listarEntidades`, como faço um laço for que percorra apenas os valores armazenados dentro do meu `HashMap`?"

### Prompt 2
> "meu for` percorre uma lista de objetos do tipo `Entidade`. Porém, o método `obterCoordenadas()` pertence à interface `Rastreavel`. Como as classes filhas (Alien e Youkai) implementam essa interface, como eu mostro que dentro do loop que aquela `Entidade` pode acessar o método da interface sem gerar erro de compilação?"

---

## Respostas Obtidas

- **Para o Prompt 1:** A IA demonstrou que o `HashMap` possui um método nativo chamado `.values()`, que retorna uma coleção apenas com os objetos (ignorando as chaves). O trecho sugerido foi direto ao ponto: `for (Entidade e : mapaEntidades.values()) { ... }`.
- **Para o Prompt 2:** A IA explicou o conceito de *Downcasting* seguro usando o operador `instanceof`. Ela me orientou a primeiro verificar se a entidade instanciada na memória possui a característica da interface e, em caso positivo, fazer um 'cast'. 
  **Trecho sugerido:**
  ```java
  if (e instanceof Rastreavel) {
      Rastreavel rastreavel = (Rastreavel) e;
      rastreavel.obterCoordenadas();
  }

## Relatório de Satisfação e Aprendizado
- 1. Como a resposta ajudou (ou falhou em ajudar) na solução do problema
As respostas foram fundamentais para ligar as peças do meu design. O bloqueio principal era fazer a classe RegistroOculto se comunicar com métodos específicos que a superclasse Entidade desconhecia. O suporte da IA para resolver a iteração do HashMap e a extração dos métodos de Interface salvou muito tempo que eu gastaria tentando resolver erros de compilação.

- 2. De que forma ela solucionou a sua dúvida
A IA atuou diretamente na sintaxe e nas regras de negócio do Java. Eu sabia a teoria estrutural de como o HashMap funcionava, mas não lembrava do método .values(), o que foi rapidamente sanado. Além disso, a explicação sobre o instanceof resolveu meu conflito de Polimorfismo, pois me mostrou como "enxergar" as habilidades de uma interface em um objeto genérico.

- 3. O que você aprendeu com aquele retorno para aplicar em problemas futuros

Memorizei que o Java exige a definição da "Família" (extends) antes dos "Contratos/Habilidades" (implements).

Diferente de um ArrayList, um HashMap precisa que você declare o que quer iterar (.keySet() para chaves ou .values() para valores).

Aprendi que forçar uma conversão de tipos (Cast) às cegas pode gerar quebras (ClassCastException). O uso do instanceof como "guarda-costas" antes de tentar acessar um método de interface é uma boa prática.