class MicroondasTelefone
  def ativar
    puts "Banana Verde detectada! O Microondas-Telefone (nome provisório) está operando!"
  end
end


class Relatorio
  attr_accessor :nome_projeto, :autor

  def initialize(nome_projeto, autor)
    @nome_projeto = nome_projeto
    @autor        = autor
  end
end

class LabRegistro
  def initialize
    @microondas = MicroondasTelefone.new  
    @registros  = []                       
  end

  def adicionar_registro(nome_projeto, autor)
    @microondas.ativar
    relatorio = Relatorio.new(nome_projeto, autor)
    @registros << relatorio
    puts "Relatório '#{nome_projeto}' registrado com sucesso!\n\n"
  end

  def listar_experimentos
    puts "=" * 48
    puts "     REGISTROS DO LABORATÓRIO — Okabe Lab"
    puts "=" * 48

    @registros.each_with_index do |r, i|
      puts "  [#{i + 1}] Projeto : #{r.nome_projeto}"
      puts "       Autor   : #{r.autor}"
      puts "  " + "-" * 44
    end

    puts "  Total de experimentos: #{@registros.length}"
    puts "=" * 48
  end
end


lab = LabRegistro.new

puts "\n--- Iniciando registros ---\n\n"

lab.adicionar_registro("Kerr Rotary Rig",       "Okabe Rintaro")
lab.adicionar_registro("CERN Hack",              "Hashida Itaru")
lab.adicionar_registro("Projeto Amadeus",        "Makise Kurisu")

lab.listar_experimentos