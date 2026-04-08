#include <iostream>
#include <string>

using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    void setNome(string n) {
        nome = n;
    }

    string getNome() {
        return nome;
    }

    void setIdade(int i) {
        idade = i;
    }

    int getIdade() {
        return idade;
    }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    void setNivel(int n) {
        nivel = n;
    }

    int getNivel() {
        return nivel;
    }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    void setRank(int r) {
        if (r >= 0 && r <= 10) {
            rank = r;
        } else {
            cout << "Erro: Rank deve estar entre 0 e 10. Definindo como 0.\n";
            rank = 0;
        }
    }

    int getRank() {
        return rank;
    }
};

int main() {
    Protagonista p1;
    p1.setNome("Ren Amamiya");
    p1.setIdade(16);
    p1.setNivel(35);

    Personagem aliado;
    aliado.setNome("Ryuji Sakamoto");
    aliado.setIdade(16);
    aliado.setRank(7);

    cout << "=== STATUS DO PROTAGONISTA ===\n";
    cout << "Nome: " << p1.getNome() << "\n";
    cout << "Idade: " << p1.getIdade() << "\n";
    cout << "Nivel: " << p1.getNivel() << "\n\n";

    cout << "=== STATUS DO ALIADO (SOCIAL LINK) ===\n";
    cout << "Nome: " << aliado.getNome() << "\n";
    cout << "Idade: " << aliado.getIdade() << "\n";
    cout << "Rank: " << aliado.getRank() << "\n";

    return 0;
}