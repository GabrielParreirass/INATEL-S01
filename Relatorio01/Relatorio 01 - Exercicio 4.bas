DIM distancia AS DOUBLE
DIM combustivel AS DOUBLE
DIM consumo AS DOUBLE

PRINT "Digite a distancia percorrida em km:"
INPUT distancia

PRINT "Digite a quantidade de combustivel gasta em litros:"
INPUT combustivel

consumo = distancia / combustivel

PRINT
PRINT "Consumo medio do veiculo (km por litro): "; consumo
