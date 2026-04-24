from abc import ABC, abstractmethod


class Cibernetico(ABC):
    """Interface base — todo elemento hackeável de Night City."""

    @abstractmethod
    def realizar_hack(self):
        pass


class Implante:
    """Composição: criado e gerenciado internamente pelo NetRunner."""
    def __init__(self, funcao: str, custo: int):
        self.funcao = funcao
        self.custo = custo

    def __str__(self) -> str:
        return f"{self.funcao} (custo: {self.custo}€$)"


class NetRunner(Cibernetico):
    """Herda de Cibernetico e compõe um Implante internamente."""
    def __init__(self, nome: str, nivel: int):
        self.nome = nome
        self.nivel = nivel
        self._implante = Implante(funcao="Chip de Hack Neural", custo=nivel * 1000)

    def realizar_hack(self):
        print(f"  [{self.nome}] Iniciando hack nivel {self.nivel}...")
        print(f"           Implante ativo: {self._implante}")
        print(f"           -> Sistema comprometido. Acesso concedido.\n")

    def __str__(self) -> str:
        return f"NetRunner {self.nome} (nivel {self.nivel}) | Implante: {self._implante}"


class Faccao:
    """Agrega uma lista de objetos Cibernetico — eles existem fora da Faccao."""
    def __init__(self, nome: str, membros: list[Cibernetico]):
        self.nome = nome
        self.membros = membros

    def executar_hack_coletivo(self):
        print(f"===========================================")
        print(f"  {self.nome.upper()}")
        print(f"  INICIANDO HACK COLETIVO...")
        print(f"===========================================\n")
        for membro in self.membros:
            membro.realizar_hack()
        print(f"Todos os {len(self.membros)} membros completaram o hack.\n")

    def __str__(self) -> str:
        return f"Faccao '{self.nome}' com {len(self.membros)} membro(s)."


if __name__ == "__main__":
    netrunners = [
        NetRunner("Alt Cunningham", nivel=10),
        NetRunner("Rache Bartmoss", nivel=9),
        NetRunner("V",              nivel=7),
        NetRunner("Placide",        nivel=8),
    ]

    netwatch = Faccao(nome="NetWatch - Divisao Sombra", membros=netrunners)
    print(netwatch)
    print()

    netwatch.executar_hack_coletivo()

    print("--- Membros existem independentemente da Faccao (Agregacao) ---")
    for nr in netrunners:
        print(f"  {nr}")

    print("\n--- Tentando instanciar Cibernetico diretamente ---")
    try:
        c = Cibernetico()
    except TypeError as e:
        print(f"  Erro esperado: {e}")