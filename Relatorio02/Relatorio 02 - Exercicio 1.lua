io.write("Digite o valor de M (início do intervalo): ")
local M = tonumber(io.read())

io.write("Digite o valor de N (fim do intervalo): ")
local N = tonumber(io.read())

io.write("Digite o valor de X (número para a tabuada): ")
local X = tonumber(io.read())

if M and N and X then
    if M <= N then
        print("\n--- Tabuada do " .. X .. " de " .. M .. " até " .. N .. " ---")
        
        for i = M, N do
            local resultado = X * i
            print(X .. " x " .. i .. " = " .. resultado)
        end
        
        print("------------------------------")
    else
        print("\nErro: O valor de M deve ser menor ou igual ao valor de N.")
    end
else
    print("\nErro: Por favor, insira apenas números válidos.")
