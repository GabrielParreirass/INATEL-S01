
class Criatura {
  constructor(nome, perigo) {
    this.nome   = nome;
    this.perigo = perigo;
  }
}

class Diario {
  constructor() {
    this._criaturas = []; 
  }

  registrarCriatura(criatura) {
    this._criaturas.push(criatura);
  }

  listarCriaturas() {
    this._criaturas.forEach(c =>
      console.log(`[Perigo: ${c.perigo}] ${c.nome}`)
    );
  }
}

class Personagem {
  constructor(nome) {
    this.nome = nome;
  }
}

class CabanaMisterio {
  constructor(personagens) {
    this.personagens = personagens; 
  }

  listarFuncionarios() {
    this.personagens.forEach(p =>
      console.log(`Funcionário: ${p.nome}`)
    );
  }
}


const diario = new Diario();
diario.registrarCriatura(new Criatura("Gnomo",       "Médio"));
diario.registrarCriatura(new Criatura("Bill Cipher", "Alto"));
diario.registrarCriatura(new Criatura("Mermando",    "Baixo"));
diario.listarCriaturas();

const stan  = new Personagem("Grunkle Stan");
const mabel = new Personagem("Mabel");
const soos  = new Personagem("Soos");

const cabana = new CabanaMisterio([stan, mabel, soos]);
cabana.listarFuncionarios();