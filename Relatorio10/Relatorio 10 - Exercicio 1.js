
class Pokemon {
  constructor(nome, tipo, vida) {
    this.nome  = nome;
    this.tipo  = tipo;
    this._vida = vida;       
    this._vidaMax = vida;
  }

  get vida() {             
    return this._vida;
  }

  atacar() {
    return `${this.nome} usou um ataque genérico!`;
  }

  receber_dano(dano) {   
    this._vida = Math.max(0, this._vida - dano);
    return `${this.nome} recebeu ${dano} de dano! Vida: ${this._vida}`;
  }
}


class Pikachu extends Pokemon {
  constructor() {
    super('Pikachu', 'Elétrico', 100);
  }

  atacar() {               
    return `${this.nome} usou Thunderbolt!`;
  }
}

class Charizard extends Pokemon {
  constructor() {
    super('Charizard', 'Fogo/Voador', 150);
  }

  atacar() {              
    return `${this.nome} usou Flamethrower!`;
  }
}

// ── Main ─────────────────────────────────────────────
const pikachu   = new Pikachu();
const charizard = new Charizard();

console.log(pikachu.atacar());
console.log(charizard.atacar());
console.log(pikachu.receber_dano(30));
console.log(`Vida de ${pikachu.nome}: `, pikachu.vida);