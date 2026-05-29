import java.util.ArrayList;

abstract class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public abstract void apresentar();
}

class Mago extends Personagem {
    
    public Mago(String nome, int idade) {
        super(nome, idade);
    }

    @Override
    public void apresentar() {
        System.out.println("Eu sou o Mago " + getNome() + ", tenho " + getIdade() + " anos e consigo movmientar meu castelo com magia!");
    }
}

class Divisao {
    private String nome;
    private String funcao;

    public Divisao(String nome, String funcao) {
        this.nome = nome;
        this.funcao = funcao;
    }

    public String getNome() {
        return nome;
    }

    public String getFuncao() {
        return funcao;
    }
}

class CasteloAnimado {
    private ArrayList<Divisao> divisoes;

    public CasteloAnimado(ArrayList<Divisao> divisoes) {
        this.divisoes = divisoes;
    }

    public void adicionarDivisao(Divisao d) {
        this.divisoes.add(d);
    }

    public void listarDivisoes() {
        System.out.println("--- Listando as diviões do Castelo ---");
        for (Divisao d : divisoes) {
            System.out.println("Cômodo: " + d.getNome() + " | Função: " + d.getFuncao());
        }
    }
}

public class Main {
    public static void main(String[] args) {
  
        Mago howl = new Mago("Howl", 27);
        howl.apresentar();

        ArrayList<Divisao> listaInicial = new ArrayList<>();
        CasteloAnimado castelo = new CasteloAnimado(listaInicial);

        Divisao quarto = new Divisao("Quarto do Howl", "Descanso e feitiços pessoais");
        Divisao laboratorio = new Divisao("Laboratório", "Criação de poções e estudos mágicos");
        Divisao lareira = new Divisao("Sala da Lareira", "Onde Calcifer mora e gera energia");

        castelo.adicionarDivisao(quarto);
        castelo.adicionarDivisao(laboratorio);
        castelo.adicionarDivisao(lareira);

        castelo.listarDivisoes();
    }
}