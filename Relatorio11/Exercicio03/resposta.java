import java.util.HashMap;

interface Rastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;
    private int intensidade;

    public Poder(String nome, int intensidade) {
        this.nome = nome;
        this.intensidade = intensidade;
    }

    public String getNome() {
        return nome;
    }

    public int getIntensidade() {
        return intensidade;
    }
}

abstract class Entidade {
    private String nome;

    public Entidade(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

class Alien extends Entidade implements Rastreavel {
    private Poder poder;

    public Alien(String nome, String nomePoder, int intensidadePoder) {
        super(nome);
        this.poder = new Poder(nomePoder, intensidadePoder);
    }

    @Override
    public String obterCoordenadas() {
        return "Órbita Terrestre - Setor 7G";
    }
}


class Youkai extends Entidade implements Rastreavel {
    private Poder poder;

    public Youkai(String nome, String nomePoder, int intensidadePoder) {
        super(nome);
        this.poder = new Poder(nomePoder, intensidadePoder);
    }

    @Override
    public String obterCoordenadas() {
        return "Floresta de Aokigahara - Ponto Sul";
    }
}


class RegistroOculto {
    private HashMap<String, Entidade> mapaEntidades;

    public RegistroOculto() {
        this.mapaEntidades = new HashMap<>();
    }

    public void registrarEntidade(Entidade e) {

        if (mapaEntidades.containsKey(e.getNome())) {

            System.out.println("Aviso: A entidade '" + e.getNome() + "' já exite no registro! Ignorando...");
        } else {
            mapaEntidades.put(e.getNome(), e);
            System.out.println("Entidade '" + e.getNome() + "' registrada com sucesso.");
        }
    }

    public void listarEntidades() {
        System.out.println("\n--- Lista de Entidades Rastreadas ---");

        for (Entidade e : mapaEntidades.values()) {

            if (e instanceof Rastreavel) {
                Rastreavel rastreavel = (Rastreavel) e;

                System.out.println("Nome: " + e.getNome() + " | Cordendas: " + rastreavel.obterCoordenadas());
            }
        }
        System.out.println("-------------------------------------\n");
    }
}


public class Main {
    public static void main(String[] args) {
        RegistroOculto registro = new RegistroOculto();


        Alien alien1 = new Alien("Ziltox", "Telepatia", 80);
        Alien alien2 = new Alien("Xylar", "Raio de Plasma", 95);
        
        Youkai youkai1 = new Youkai("Kitsune Sombria", "Ilusão", 90);
        Youkai youkai2 = new Youkai("Tengu dos Ventos", "Vendaval", 85);


        registro.registrarEntidade(alien1);
        registro.registrarEntidade(alien2);
        registro.registrarEntidade(youkai1);
        registro.registrarEntidade(youkai2);


        registro.registrarEntidade(alien1);

        registro.listarEntidades();
    }
}