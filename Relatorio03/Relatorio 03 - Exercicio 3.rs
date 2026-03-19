use std::io;

fn imprimir_multiplos(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        if i % numero == 0 {
            println!("{}", i);
        }
    }
}

fn main() {
    println!("Digite o numero da tabuada:");
    let mut str_numero = String::new();
    io::stdin().read_line(&mut str_numero).unwrap();
    let numero: i32 = str_numero.trim().parse().unwrap_or(1);

    println!("Digite o limite inferior:");
    let mut str_inferior = String::new();
    io::stdin().read_line(&mut str_inferior).unwrap();
    let limite_inferior: i32 = str_inferior.trim().parse().unwrap_or(1);

    println!("Digite o limite superior:");
    let mut str_superior = String::new();
    io::stdin().read_line(&mut str_superior).unwrap();
    let limite_superior: i32 = str_superior.trim().parse().unwrap_or(10);

    println!("Multiplos encontrados:");
    imprimir_multiplos(numero, limite_inferior, limite_superior);
}