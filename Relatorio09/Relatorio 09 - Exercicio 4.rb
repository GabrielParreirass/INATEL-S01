module Localizavel
  def local_atual
    puts "#{@nome} está em #{@localizacao}."
  end
end

module Perigoso
  def exibir_ameaca
    puts "⚠️ #{@nome} representa uma ameaça!"
  end
end

class Pessoa
  attr_accessor :nome, :localizacao

  def initialize(nome, localizacao)
    @nome = nome
    @localizacao = localizacao
  end
end

class Testemunha < Pessoa
  include Localizavel
end

class Suspeito < Pessoa
  include Localizavel
  include Perigoso
end

class CenaDoCrime
  def initialize
    @pessoas = []
  end

  def adicionar_pessoa(pessoa)
    @pessoas << pessoa
  end

  def listar_todos
    puts "\n👥 Pessoas na cena do crime:"
    @pessoas.each do |p|
      puts "- #{p.nome}"
      p.local_atual if p.respond_to?(:local_atual)
    end
  end

  def identificar_perigosos
    @pessoas.select { |p| p.respond_to?(:exibir_ameaca) }
  end
end

t1 = Testemunha.new("John Watson", "Sala de estar")
s1 = Suspeito.new("James Moriarty", "Rua Baker Street")
s2 = Suspeito.new("Irene Adler", "Próximo ao banco")

cena = CenaDoCrime.new

cena.adicionar_pessoa(t1)
cena.adicionar_pessoa(s1)
cena.adicionar_pessoa(s2)

cena.listar_todos

puts "\n🚨 Suspeitos perigosos:"
perigosos = cena.identificar_perigosos
perigosos.each do |p|
  p.exibir_ameaca
end