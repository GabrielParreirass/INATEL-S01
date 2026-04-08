#include <iostream>
#include <string>
#include <vector>

using namespace std;

class MembroConselho {
public:
    string nome;

    virtual void saudar() {
        cout << "Um membro do conselho faz uma reverencia silenciosa.\n";
    }

    virtual ~MembroConselho() {}
};

class Anao : public MembroConselho {
public:
    void saudar() override {
        cout << "Pela forca da montanha, eu sou " << nome << " e honro nosso aco!\n";
    }
};

class Orc : public MembroConselho {
public:
    void saudar() override {
        cout << "Pelo sangue e gloria, eu sou " << nome << " e trago a forca de minha tribo!\n";
    }
};

class Draconato : public MembroConselho {
public:
    void saudar() override {
        cout << "Pelo sopro dos ancestrais, eu sou " << nome << " e falo em nome dos dragoes!\n";
    }
};

int main() {
    vector<MembroConselho*> conselho;

    Anao representanteAnao;
    representanteAnao.nome = "Gimli";

    Orc representanteOrc;
    representanteOrc.nome = "Thrall";

    Draconato representanteDraconato;
    representanteDraconato.nome = "Rhogar";

    conselho.push_back(&representanteAnao);
    conselho.push_back(&representanteOrc);
    conselho.push_back(&representanteDraconato);

    cout << "=== CONSELHO DE PAZ DAS TERRAS ANCESTRAIS ===\n\n";

    for (int i = 0; i < conselho.size(); i++) {
        conselho[i]->saudar();
    }

    cout << "\n---------------------------------------------\n";

    return 0;
}