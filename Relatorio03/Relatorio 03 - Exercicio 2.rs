use std::io;

fn eh_impar(numero: i32) -> bool {
    numero % 2 != 0
}

fn main() {
    println!("Jogador 1, escolha 'par' ou 'impar':");
    let mut escolha = String::new();
    io::stdin().read_line(&mut escolha).unwrap();
    let escolha = escolha.trim().to_lowercase();

    println!("Jogador 1, digite seu numero:");
    let mut num1_str = String::new();
    io::stdin().read_line(&mut num1_str).unwrap();
    let num1: i32 = num1_str.trim().parse().unwrap_or(0);

    println!("Jogador 2, digite seu numero:");
    let mut num2_str = String::new();
    io::stdin().read_line(&mut num2_str).unwrap();
    let num2: i32 = num2_str.trim().parse().unwrap_or(0);

    let soma = num1 + num2;
    let soma_impar = eh_impar(soma);

    println!("A soma dos numeros e: {}", soma);

    if (escolha == "impar" && soma_impar) || (escolha == "par" && !soma_impar) {
        println!("O Jogador 1 venceu!");
    } else {
        println!("O Jogador 2 venceu!");
    }
}