#include <iostream>
#include <string>

using namespace std;

class MembroInatel {
public:
    string nomeCompleto;

    
    virtual void identificar() {
        cout << "Sou um membro da comunidade Inatel: " << nomeCompleto << ".\n";
    }

    
    virtual ~MembroInatel() {}
};

class Coordenador : public MembroInatel {
public:
    string departamento;

    void identificar() override {
        cout << "Meu nome e " << nomeCompleto 
             << ", sou o coordenador do departamento de " << departamento 
             << " no Inatel.\n";
    }
};

class Pesquisador : public MembroInatel {
public:
    string laboratorio;

    void identificar() override {
        cout << "Meu nome e " << nomeCompleto 
             << ", e realizo pesquisas no laboratorio " << laboratorio 
             << " do Inatel.\n";
    }
};

int main() {
    
    Coordenador coord;
    coord.nomeCompleto = "Prof. Carlos Ribeiro";
    coord.departamento = "Engenharia de Software";

    Pesquisador pesq;
    pesq.nomeCompleto = "Dra. Ana Souza";
    pesq.laboratorio = "Centro de Referencia em Radiocomunicacoes (CRR)";

   
    MembroInatel* ptrMembro1 = &coord;
    MembroInatel* ptrMembro2 = &pesq;

    cout << "=== IDENTIFICACAO FETIN ===\n\n";

   
    ptrMembro1->identificar();
    cout << "--------------------------------------------------\n";
    ptrMembro2->identificar();
    cout << "--------------------------------------------------\n";

    return 0;
}