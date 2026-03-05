DIM N1 AS DOUBLE
DIM N2 AS DOUBLE
DIM N3 AS DOUBLE
DIM P1 AS DOUBLE
DIM P2 AS DOUBLE
DIM P3 AS DOUBLE
DIM MEDIA AS DOUBLE

PRINT "Digite a primeira nota:"
INPUT N1
PRINT "Digite o peso da primeira nota:"
INPUT P1

PRINT "Digite a segunda nota:"
INPUT N2
PRINT "Digite o peso da segunda nota:"
INPUT P2

PRINT "Digite a terceira nota:"
INPUT N3
PRINT "Digite o peso da terceira nota:"
INPUT P3

MEDIA = (N1 * P1 + N2 * P2 + N3 * P3) / (P1 + P2 + P3)

PRINT "Media ponderada = "; MEDIA

IF MEDIA > 70 THEN
    PRINT "Aprovado direto"
ELSE
    PRINT "Reprovado direto"
END IF
