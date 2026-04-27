class Musico
  attr_accessor :nome, :instrumento

  def initialize(nome, instrumento)
    @nome        = nome
    @instrumento = instrumento
  end

  def tocar_partitura(obra)
    raise NotImplementedError, "#{self.class} deve implementar o método tocar_partitura!"
  end
end


class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(obra)
    puts "#{@nome} pressiona as teclas do #{@instrumento} com delicadeza, interpretando '#{obra}'..."
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(obra)
    puts "#{@nome} desliza o arco sobre as cordas do #{@instrumento}, dando vida a '#{obra}'..."
  end
end


class Maestro
  attr_accessor :nome, :musicos

  def initialize(nome)
    @nome    = nome
    @musicos = []
  end

  def adicionar_musico(musico)
    @musicos << musico
  end

  def iniciar_concerto(obra)
    puts "\n#{"=" * 52}"
    puts "  ♩  #{@nome} levanta a batuta — '#{obra}' começa."
    puts "=" * 52

    @musicos.each do |musico|
      musico.tocar_partitura(obra)
    end

    puts "\n  ♩  #{@nome} abaixa a batuta. A plateia respira."
    puts "=" * 52
  end

  def ajustar_postura(estado)
    @musicos.map do |musico|
      "#{musico.nome} está em ritmo #{estado}!"
    end
  end
end


obra = "Clair de Lune — Debussy"

kosei  = Pianista.new("Kosei Arima")
kaori  = Violinista.new("Kaori Miyazono")
hiroko = Pianista.new("Hiroko Seto")
nagi   = Violinista.new("Nagi Aiza")

maestro = Maestro.new("Takeshi Aiza")
[kosei, kaori, hiroko, nagi].each { |m| maestro.adicionar_musico(m) }

maestro.iniciar_concerto(obra)

puts "\n--- Ajuste de postura ---"
status = maestro.ajustar_postura("Allegro")
status.each { |s| puts "  ✦ #{s}" }
puts