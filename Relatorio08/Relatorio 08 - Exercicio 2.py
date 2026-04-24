from abc import ABC, abstractmethod


class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        """Cada herói deve implementar sua própria ultimate."""
        pass

    def __str__(self) -> str:
        return f"{self.nome} ({self.funcao})"


class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"[{self.nome}] 🛡️  ULTIMATE DE TANQUE: Ativa escudo total e empurra todos os inimigos!")


class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"[{self.nome}] 💥  ULTIMATE DE DANO: Dispara uma rajada devastadora em área!")


class Suporte(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Suporte")

    def usar_ultimate(self):
        print(f"[{self.nome}] 💊  ULTIMATE DE SUPORTE: Cura todos os aliados ao redor instantaneamente!")


if __name__ == "__main__":
    herois = [
        Tanque("Reinhardt"),
        Dano("Cassidy"),
        Tanque("D.Va"),
        Dano("Tracer"),
        Suporte("Ana"),
    ]

    print("=== OVERWATCH — ATIVANDO ULTIMATES ===\n")
    for heroi in herois:
        print(heroi)
        heroi.usar_ultimate()
        print()


    print("--- Tentando instanciar Heroi diretamente ---")
    try:
        h = Heroi("Genérico", "Nenhuma")
    except TypeError as e:
        print(f"Erro esperado: {e}")