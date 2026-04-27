class BebidaAfterlife
  attr_accessor :nome

  def initialize(nome, custo_base)
    @nome = nome
    self.custo_base = custo_base
  end

  def custo_base
    @custo_base
  end

  def custo_base=(valor)
    if valor > 0
      @custo_base = valor
    else
      raise ArgumentError, "O custo deve ser maior que zero. Valor recebido: #{valor}"
    end
  end

  def preco_total
    @custo_base
  end

  def to_string
    "Bebida: #{@nome} | Valor Final: $#{"%.2f" % preco_total}"
  end
end

# ─────────────────────────────────────────────

class DrinkIconico < BebidaAfterlife
  attr_accessor :nivel_notoriedade

  def initialize(nome, custo_base, nivel_notoriedade)
    super(nome, custo_base)
    @nivel_notoriedade = nivel_notoriedade
  end

  def preco_total
    @custo_base + (@nivel_notoriedade * 8)
  end

  def to_string
    "DrinkIconico: #{@nome} | Notoriedade: #{@nivel_notoriedade} | Valor Final: $#{"%.2f" % preco_total}"
  end
end


drinks = [
  DrinkIconico.new("The Notorious Sip",   15.0, 7),
  DrinkIconico.new("Shadow of Cobain",    12.0, 9),
  BebidaAfterlife.new("Neon Highball",    10.0)
]

puts "=" * 50
puts "       BAR AFTERLIFE — CARDÁPIO DA NOITE"
puts "=" * 50
puts

drinks.each do |drink|
  puts drink.to_string
end

puts
puts "=" * 50