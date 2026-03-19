DIM reais AS DOUBLE
DIM dolares AS DOUBLE
DIM euros AS DOUBLE

CONST TAXA_DOLAR = 5.0
CONST TAXA_EURO = 5.4

PRINT "Digite o valor em reais (R$):"
INPUT reais

dolares = reais / TAXA_DOLAR
euros = reais / TAXA_EURO

PRINT
PRINT "Valor em reais: R$ "; reais
PRINT "Valor em dolares: US$ "; dolares
PRINT "Valor em euros:  "; euros
