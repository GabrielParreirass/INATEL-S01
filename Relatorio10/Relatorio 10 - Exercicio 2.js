
class Habilidade {
  usar() {
    throw new Error("usar() deve ser sobrescrito pela subclasse!");
  }
}


class Smoke extends Habilidade {
  usar() { return "Lanca cortina de fumaca bloqueando visao!"; }
}
class Flash extends Habilidade {
  usar() { return "Dispara flash cegando inimigos na area!"; }
}
class Dash extends Habilidade {
  usar() { return "Executa dash ultra-rapido reposicionando!"; }
}
class Armadilha extends Habilidade {
  usar() { return "Instala armadilha monitorando o flanco!"; }
}


class Agente {
  constructor(nome, funcao, habilidade) {
    this.nome      = nome;
    this.funcao    = funcao;
    this._habilidade = habilidade; 
  }

  entrarEmCombate() {
    const resultado = this._habilidade.usar();
    return `[${this.funcao}] ${this.nome}: ${resultado}`;
  }
}


class Time {
  constructor(agentes) {
    this.agentes = agentes; 
  }

  iniciarPartida() {
    this.agentes.forEach(a => console.log(a.entrarEmCombate()));
  }

  listarControladores() {
    return this.agentes.filter(
      a => a._habilidade instanceof Smoke
    );
  }
}


const omen     = new Agente("Omen",    "Controlador", new Smoke());
const skye     = new Agente("Skye",    "Iniciador",  new Flash());
const jett     = new Agente("Jett",    "Duelista",   new Dash());
const cypher   = new Agente("Cypher",  "Sentinela",  new Armadilha());

const time = new Time([omen, skye, jett, cypher]);
time.iniciarPartida();

const ctrls = time.listarControladores();
console.log("Controladores:", ctrls.map(a => a.nome));