class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    @property
    def vida(self) -> int:
        return self._vida

    @vida.setter
    def vida(self, valor: int):
        if valor < 0:
            raise ValueError("A vida não pode ser negativa.")
        self._vida = valor

    @property
    def resistencia(self) -> int:
        return self._resistencia

    @resistencia.setter
    def resistencia(self, valor: int):
        if valor < 0:
            raise ValueError("A resistência não pode ser negativa.")
        self._resistencia = valor

    def __str__(self) -> str:
        return f"Personagem com {self._vida} de vida e {self._resistencia} de resistência."


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self) -> str:
        armadura = "com" if self.armadura_pesada else "sem"
        return (
            f"Cavaleiro com {self._vida} de vida, "
            f"{self._resistencia} de resistência e "
            f"{armadura} armadura pesada."
        )


# --- Demonstração ---
if __name__ == "__main__":
    personagem = Personagem(vida=100, resistencia=50)
    print(personagem)

    cavaleiro = Cavaleiro(vida=200, resistencia=80, armadura_pesada=True)
    print(cavaleiro)

    print("\n--- Testando getter e setter de vida ---")
    print(f"Vida atual do cavaleiro: {cavaleiro.vida}")
    cavaleiro.vida = 150
    print(f"Vida após atualização: {cavaleiro.vida}")

    print("\n--- Testando validação (vida negativa) ---")
    try:
        cavaleiro.vida = -10
    except ValueError as e:
        print(f"Erro capturado: {e}")