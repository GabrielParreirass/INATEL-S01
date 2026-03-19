local function filtrarImpares(tabelaOriginal)
    local tabelaImpares = {} 
    
    for i = 1, #tabelaOriginal do
        if tabelaOriginal[i] % 2 ~= 0 then
            table.insert(tabelaImpares, tabelaOriginal[i])
        end
    end
    
    return tabelaImpares
end

io.write("Digite a quantidade de números que deseja inserir (N): ")
local N = tonumber(io.read())

if N and N > 0 then
    local numeros = {}
    
    for i = 1, N do
        io.write("Digite o valor " .. i .. ": ")
        numeros[i] = tonumber(io.read())
    end
    
    local resultadosImpares = filtrarImpares(numeros)
    
    print("\n--- Nova Tabela (Apenas Ímpares) ---")
    if #resultadosImpares > 0 then
        for i = 1, #resultadosImpares do
            print("Posição " .. i .. ": " .. resultadosImpares[i])
        end
        
    else
        print("Nenhum número ímpar foi encontrado na tabela original.")
    end
else
    print("Erro: A quantidade (N) deve ser um número válido e maior que zero.")
end
