class ArmaCorpoACorpo:
    """Composição: existe apenas dentro de Joker, criada e destruída com ele."""
    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = dano

    def __str__(self) -> str:
        return f"{self.nome} (dano: {self.dano})"


class PhantomThieves:
    """Agregação: existe independentemente de Joker."""
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self) -> str:
        return f"  • {self.nome:<12} | Arma: {self.arma}"


class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        self._arma = ArmaCorpoACorpo(nome="Faca", dano=45)
        self.equipe = equipe

    def mostrar_equipe(self):
        print("       PHANTOM THIEVES — EQUIPE      ")
        print(f"  Líder  : Joker")
        print(f"  Arma   : {self._arma}  [Composição]\n")
        print(f"  Membros:  [Agregação]")
        for membro in self.equipe:
            print(membro)
        print()


if __name__ == "__main__":
    ryuji   = PhantomThieves("Ryuji",   "Shotgun")
    ann     = PhantomThieves("Ann",     "Whip")
    yusuke  = PhantomThieves("Yusuke",  "Sword")
    makoto  = PhantomThieves("Makoto",  "Revolver")
    futaba  = PhantomThieves("Futaba",  "— (Suporte)")
    haru    = PhantomThieves("Haru",    "Axe")

    equipe = [ryuji, ann, yusuke, makoto, futaba, haru]

    joker = Joker(equipe=equipe)
    joker.mostrar_equipe()

    print("--- Membros existem fora de Joker (Agregação) ---")
    for membro in equipe:
        print(membro)