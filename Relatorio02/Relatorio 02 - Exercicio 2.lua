local function encontrarMaior(tabela)
    local maior = tabela[1] 
    
    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i] 
        end
    end
    
    return maior
end

io.write("Digite a quantidade de valores (N): ")
local N = tonumber(io.read())

if N and N > 0 then
    local numeros = {}
    
    for i = 1, N do
        io.write("Digite o valor " .. i .. ": ")
        numeros[i] = tonumber(io.read())
    end
    
    local resultado = encontrarMaior(numeros)
    print("\n" .. resultado)
else
    print("Erro: N deve ser um número válido e maior que zero.")
end
