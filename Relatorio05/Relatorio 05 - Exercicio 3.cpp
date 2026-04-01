#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    double saldo;
    int opcao;

    
    cout << "Informe o seu saldo inicial (R$): ";
    cin >> saldo;

    
    do {
        cout << "\n=== Menu da Conta Bancaria ===" << endl;
        cout << "1. Ver Saldo" << endl;
        cout << "2. Depositar" << endl;
        cout << "3. Sacar" << endl;
        cout << "4. Sair" << endl;
        cout << "Escolha uma opcao: " << endl;
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Seu saldo atual e: R$ " << fixed << setprecision(2) << saldo << endl;
                break;
                
            case 2: {
                double valorDeposito;
                cout << "Digite o valor para deposito: R$ " << endl;
                cin >> valorDeposito;
                
                if (valorDeposito > 0) {
                    saldo += valorDeposito;
                    cout << "Deposito realizado com sucesso!" << endl;
                } else {
                    cout << "Valor invalido para deposito." << endl;
                }
                break;
            }
                
            case 3: {
                double valorSaque;
                cout << "Digite o valor para saque: R$ ";
                cin >> valorSaque;
                
                if (valorSaque > saldo) {
                    cout << "Saldo Insuficiente." << endl;
                } else if (valorSaque > 0) {
                    saldo -= valorSaque;
                    cout << "Saque realizado com sucesso!" << endl;
                } else {
                    cout << "Valor invalido para saque." << endl;
                }
                break;
            }
                
            case 4:
                cout << "Encerrando o programa. Obrigado!" << endl;
                break;
                
            default:
                cout << "Opcao invalida. Por favor, escolha uma opcao de 1 a 4." << endl;
        }
    } while (opcao != 4);

    return 0;
}