local function somar(a, b)
    return a + b
end

local function subtrair(a, b)
    return a - b
end

local function multiplicar(a, b)
    return a * b
end

local function dividir(a, b)
    if b == 0 then
        return "Erro: Divisão por zero não é permitida."
    end
    return a / b
end

local function calculadora(num1, num2, operador)
    if operador == '+' then
        return somar(num1, num2)
    elseif operador == '-' then
        return subtrair(num1, num2)
    elseif operador == '*' then
        return multiplicar(num1, num2)
    elseif operador == '/' then
        return dividir(num1, num2)
    else
        return "Erro: Operador '" .. tostring(operador) .. "' é inválido. Use '+', '-', '*' ou '/'."
    end
end

print("Soma: " .. calculadora(10, 5, '+'))
print("Subtração: " .. calculadora(10, 5, '-'))
print("Multiplicação: " .. calculadora(10, 5, '*'))
print("Divisão: " .. calculadora(10, 5, '/'))

print("Operador Inválido: " .. calculadora(10, 5, '^'))
print("Divisão por zero: " .. calculadora(10, 0, '/'))
