
class Hunter {
  constructor(nome) {
    this.nome = nome;
  }
  lutar() {
    return `${this.nome} usa um ataque genérico de Hunter!`;
  }
}

class Gon extends Hunter {
  constructor() { super("Gon"); }
  lutar() {
    return `${this.nome} usa Jajanken — JAN KEN PON!`;
  }
}

class Killua extends Hunter {
  constructor() { super("Killua"); }
  lutar() {
    return `${this.nome} ativa Godspeed — velocidade máxima!`;
  }
}

class Kurapika extends Hunter {
  constructor() { super("Kurapika"); }
  lutar() {
    return `${this.nome} conjura as Correntes Imperativas!`;
  }
}

class TrupeFantasma {
  constructor(nome, membros) {
    this.nome    = nome;
    this.membros = membros; 
  }

  revelarMembros() {
    this.membros.forEach(m =>
      console.log(`[Aranha] ${m}`)
    );
  }
}


const gon      = new Gon();
const killua   = new Killua();
const kurapika = new Kurapika();

console.log(gon.lutar());
console.log(killua.lutar());
console.log(kurapika.lutar());

const trupe = new TrupeFantasma("Trupe Fantasma", [
  "Chrollo Lucilfer",
  "Hisoka",
  "Feitan"
]);
trupe.revelarMembros();