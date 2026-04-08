#include <iostream>
#include <string>

using namespace std;

class Robo {
public:
    string modelo;
    int versao;
    float potenciaLaser;
    int integridade;

   
    void disparar(Robo& alvo) {
        cout << "BZZZZT! O robô " << modelo << " disparou seu laser contra o robô " << alvo.modelo << "!" << endl;
        
        
        alvo.integridade -= potenciaLaser;
        
        cout << "Dano de " << potenciaLaser << " aplicado com sucesso." << endl;
    }

    void exibirStatus() {
        cout << "[ " << modelo << " ] "
             << "Versão: " << versao << " | "
             << "Poder de Fogo: " << potenciaLaser << " | "
             << "Integridade: " << integridade << "%" << endl;
    }
};

int main() {

    Robo robo1;
    robo1.modelo = "TitanX";
    robo1.versao = 4;
    robo1.potenciaLaser = 35.5;
    robo1.integridade = 100;


    Robo robo2;
    robo2.modelo = "Scrapper-V";
    robo2.versao = 2;
    robo2.potenciaLaser = 15.0;
    robo2.integridade = 80;


    cout << "=== STATUS INICIAL ===" << endl;
    robo1.exibirStatus();
    robo2.exibirStatus();
    cout << "----------------------\n" << endl;

    cout << "=== COMBATE INICIADO ===" << endl;
    robo1.disparar(robo2);
    cout << "------------------------\n" << endl;

  
    cout << "=== STATUS APOS O CONFRONTO ===" << endl;
    robo1.exibirStatus();
    robo2.exibirStatus();
    cout << "-------------------------------" << endl;

    return 0;
}