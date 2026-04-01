#include <iostream>

using namespace std;

int main() {
    int sala[5][5] = {0};
    int opcao = 0;
    bool executando = true;

    while (executando) {
        cout << "\n--- Menu Principal ---" << endl;
        cout << "1. Reservar Assento" << endl;
        cout << "2. Ver Mapa da Sala" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        if (opcao == 1) {
            int f, c;
            cout << "Digite a fileira (0-4): ";
            cin >> f;
            cout << "Digite a coluna (0-4): ";
            cin >> c;

            if (f >= 0 && f < 5 && c >= 0 && c < 5) {
                if (sala[f][c] == 0) {
                    sala[f][c] = 1;
                    cout << "Sucesso!" << endl;
                } else {
                    cout << "Erro: Assento ocupado!" << endl;
                }
            } else {
                cout << "Posicao invalida! Tente novamente." << endl;
            }
        } else if (opcao == 2) {
            cout << "\nMapa da Sala:" << endl;
            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 5; j++) {
                    cout << "[" << sala[i][j] << "] ";
                }
                cout << endl;
            }
        } else if (opcao == 3) {
            executando = false;
        } else {
            cout << "Opcao invalida. Tente novamente." << endl;
        }
    }

    int ocupados = 0;
    int vazios = 0;

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            if (sala[i][j] == 1) {
                ocupados++;
            } else {
                vazios++;
            }
        }
    }

    cout << "\n--- Relatorio Final ---" << endl;
    cout << "Quantidade total de assentos ocupados: " << ocupados << endl;
    cout << "Quantidade total de assentos vazios: " << vazios << endl;

    return 0;
}