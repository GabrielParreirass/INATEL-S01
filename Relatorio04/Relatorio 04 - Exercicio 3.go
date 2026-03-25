package main

import "fmt"


func fibonacci(n int) {
	if n <= 0 {
		fmt.Println("Por favor, insira um número maior que zero.")
		return
	}

	a, b := 0, 1

	fmt.Printf("Sequência de Fibonacci (%d números): ", n)

	for i := 0; i < n; i++ {
		fmt.Printf("%d ", a)
		

		a, b = b, a+b
	}
	fmt.Println() 
}

func main() {
	var n int

	fmt.Println("Quantos números da sequência de Fibonacci você deseja ver? ")
	_, err := fmt.Scan(&n)

	if err != nil {
		fmt.Println("Erro: Digite um número inteiro válido.")
		return
	}

	fibonacci(n)
}