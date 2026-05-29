import java.util.ArrayList;

class Cafe {
    private String nome;
    private double preco;

    public Cafe(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double calcularPrecoFinal() {
        return preco;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double preco, double bonusAroma) {
        super(nome, preco);
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return getPreco() + bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> listaCafes;

    public Menu() {
        this.listaCafes = new ArrayList<>(); 
    }

    public void adicionarCafe(Cafe c) {
        this.listaCafes.add(c);
    }

    public void exibirMenu() {
        for (Cafe c : listaCafes) {
            System.out.println("- " + c.getNome() + " | Preço Final: R$ " + c.calcularPrecoFinal());
        }
    }
}

class CafeteriaLeblanc {
    private Menu menu;

    public CafeteriaLeblanc() {
        this.menu = new Menu(); 
    }

    public void adicionarNoCardapio(Cafe c) {
        this.menu.adicionarCafe(c);
    }

    public void abrirCafeteria() {
        System.out.println("Ah, você chegou. Bem bindos ao Leblanc.");
        System.out.println("Aqui está o nosso cardápio:");
        this.menu.exibirMenu();
    }
}

public class Main {
    public static void main(String[] args) {
        CafeteriaLeblanc leblanc = new CafeteriaLeblanc();

        Cafe expresso = new Cafe("Expresso Simples", 5.00);
        CafeGourmet blendSojiro = new CafeGourmet("Blend da Casa (Gournmet)", 12.00, 3.50);
        CafeGourmet blueMountain = new CafeGourmet("Blue Mountain", 18.00, 5.00);

        leblanc.adicionarNoCardapio(expresso);
        leblanc.adicionarNoCardapio(blendSojiro);
        leblanc.adicionarNoCardapio(blueMountain);

        leblanc.abrirCafeteria();
    }
}