use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let npt = (nota1 + nota2) / 2.0;
    let npl = nota3;
    
    let media_final = (npt * 0.7) + (npl * 0.3);
    
    if npt >= 60.0 && npl >= 60.0 {
        println!("Media Final: {:.2}", media_final);
        println!("Parabens! Voce foi aprovado.");
    } else {
        println!("Media Final: {:.2}", media_final);
        println!("Reprovado. NPT ou NPL menor que 60.");
    }
    
    media_final
}

fn main() {
    println!("Digite a NP1:");
    let mut str_np1 = String::new();
    io::stdin().read_line(&mut str_np1).unwrap();
    let nota1: f64 = str_np1.trim().parse().unwrap_or(0.0);

    println!("Digite a NP2:");
    let mut str_np2 = String::new();
    io::stdin().read_line(&mut str_np2).unwrap();
    let nota2: f64 = str_np2.trim().parse().unwrap_or(0.0);

    println!("Digite a NPL:");
    let mut str_npl = String::new();
    io::stdin().read_line(&mut str_npl).unwrap();
    let nota3: f64 = str_npl.trim().parse().unwrap_or(0.0);

    println!("--- Resultados ---");
    calcular_media(nota1, nota2, nota3);
}