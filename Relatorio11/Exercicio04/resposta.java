import java.util.ArrayList;

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void virarPrato();
}

class Lagosta extends Monstro {
    public Lagosta(String nome) {
        super(nome);
    }

    @Override
    public void virarPrato() {
        System.out.println("Senshi joga a " + getNome() + " na panela fervente até a carapaça ficar vermelha!");
    }
}

class Cogumelo extends Monstro {
    public Cogumelo(String nome) {
        super(nome);
    }

    @Override
    public void virarPrato() {
        System.out.println("Senshi fatia o " + getNome() + " fininho para soltar bastante umami na sopa!");
    }
}

class Tempero {
    private String nome;
    private String quantidade;

    public Tempero(String nome, String quantidade) {
        this.nome = nome;
        this.quantidade = quantidade;
    }

    public String getNome() {
        return nome;
    }

    public String getQuantidade() {
        return quantidade;
    }
}

class Prato {
    private String nome;
    private Monstro monstro;
    private Tempero tempero; 

    public Prato(String nome, Monstro monstro, String nomeTempero, String qtdTempero) {
        this.nome = nome;
        this.monstro = monstro;
        this.tempero = new Tempero(nomeTempero, qtdTempero);
    }

    public void servir() {
        System.out.println("\n>>> Hora de desgustar: " + this.nome);
        
        this.monstro.virarPrato();
        
        System.out.println("Tempero uitlizado: " + tempero.getQuantidade() + " de " + tempero.getNome());
    }
}

public class Main {
    public static void main(String[] args) {
        Lagosta monstro1 = new Lagosta("Lagosta Gigante");
        Cogumelo monstro2 = new Cogumelo("Cogumelo Andante");

        Prato prato1 = new Prato("Lagosta Fervida à Senshi", monstro1, "Sal de Rocha", "Um punhado generoso");
        Prato prato2 = new Prato("Sopa Revigorante", monstro2, "Ervas Secas da Masmorra", "Duas pitadas");

        System.out.println("--- Teste Individual dos Pratos ---");
        prato1.servir();
        prato2.servir();

        System.out.println("\n==================================");
        System.out.println("   CARDÁPIO OFICIAL DA EXPEDIÇÃO  ");
        System.out.println("==================================");
        
        ArrayList<Prato> cardapio = new ArrayList<>();
        cardapio.add(prato1);
        cardapio.add(prato2);

        for (Prato p : cardapio) {
            p.servir();
        }
    }
}