package main

import "fmt"

func main() {
	var a, b, c int

	fmt.Println("Digite os três lados do triângulo:")
	_, err := fmt.Scan(&a, &b, &c)

	if err != nil {
		fmt.Println("Erro: Por favor, insira apenas números inteiros.")
		return
	}


	if a+b > c && a+c > b && b+c > a {
		switch {
		case a == b && b == c:
			fmt.Println("Triângulo Equilátero (3 lados iguais).")
		case a == b || a == c || b == c:
			fmt.Println("Triângulo Isósceles (2 lados iguais).")
		default:
			fmt.Println("Triângulo Escaleno (todos os lados diferentes).")
		}

	} else {
		fmt.Println("Erro: Os valores informados não podem formar um triângulo.")
	}
}