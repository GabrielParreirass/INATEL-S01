use std::io;

fn verificar_senha(senha: &str) -> bool {
    if senha.len() < 10 {
        return false;
    }

    let mut contador_numeros = 0;
    let mut tem_maiuscula = false;

    for c in senha.chars() {
        if c.is_digit(10) {
            contador_numeros += 1;
        }
        if c.is_ascii_uppercase() {
            tem_maiuscula = true;
        }
    }

    contador_numeros >= 2 && tem_maiuscula
}

fn main() {
    loop {
        let mut input = String::new();
        
     
        let bytes_lidos = io::stdin().read_line(&mut input).unwrap_or(0);
        
        
        if bytes_lidos == 0 {
            println!("Fim das tentativas. Nenhuma senha valida encontrada.");
            break;
        }

        let senha = input.trim();
        
        
        if senha.is_empty() {
            continue;
        }

        println!("Testando a senha: {}", senha);

        if verificar_senha(senha) {
            println!("A senha e valida, seja bem vindo!");
            break; 
        } else {
            println!("Senha invalida. Tente novamente...\n");
        }
    }
}