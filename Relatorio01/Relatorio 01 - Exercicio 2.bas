DIM senhaCorreta AS INTEGER
DIM senhaDigitada AS INTEGER

senhaCorreta = 1234

PRINT "Digite a senha:"
INPUT senhaDigitada

WHILE senhaDigitada <> senhaCorreta
    PRINT "Senha incorreta. Tente novamente."
    PRINT "Digite a senha:"
    INPUT senhaDigitada
WEND

PRINT "Acesso liberado!"
