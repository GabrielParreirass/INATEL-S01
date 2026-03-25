package main

import "fmt"

func verificarLogin(usuario, senha string) bool {
	if usuario == "senha" && senha == "admin" {
		return true
	} else {
		return false
	}
}

func main() {
	var user, pass string

	for {
		fmt.Println("--- Sistema de Login ---")
		fmt.Println("Digite o nome de usuário: ")
		fmt.Scan(&user)
		
		fmt.Print("Digite a senha: ")
		fmt.Scan(&pass)

		if verificarLogin(user, pass) {
			fmt.Println("\nLogin bem-sucedido!")
			break 
		} else {
			fmt.Println("\nUsuário ou senha incorretos. Tente novamente.\n")
		}
	}
}