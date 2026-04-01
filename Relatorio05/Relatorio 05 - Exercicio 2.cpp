#include <iostream>

using namespace std;

float multiplicaArray(float arr[], int tamanho) {
    float produto = 1.0;
    for (int i = 0; i < tamanho; i++) {
        produto *= arr[i];
    }
    return produto;
}

int main() {
    int tamanho;
    
    cout << "Quantos valores voce deseja inserir? " << endl;
    cin >> tamanho;
    
    if (tamanho <= 0) {
        cout << "Tamanho invalido." << endl;
        return 1;
    }

    float* arr = new float[tamanho];
    
    for (int i = 0; i < tamanho; i++) {
        cout << "Digite o valor " << i + 1 << ": " << endl;
        cin >> arr[i];
    }
    
    float resultado = multiplicaArray(arr, tamanho);
    
    cout << "O resultado da multiplicacao e: " << resultado << endl;
    
    delete[] arr;
    
    return 0;
}