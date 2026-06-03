data Bebida = Bebida {
    nome  :: String,
    tipo  :: String,
    preco :: Double
} deriving (Show)

data StatusPedido = Aberto | Entregue | Cancelado deriving (Show, Eq)

data Pedido = Pedido {
    listaBebidas :: [Bebida],
    status       :: StatusPedido
} deriving (Show)

valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
    | status pedido == Cancelado = 0.0
    | otherwise                  = sum (map preco (listaBebidas pedido))

primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _)    = "A lista de bebidas do pedido esta vaziaa." 
primeiraBebida (Pedido (b:_) _) = nome b

main :: IO ()
main = do
    let cafeSimples = Bebida "Expresso" "Café" 5.50
    let cafeGourmet = Bebida "Leblanc Blend" "Café Gourmet" 15.00
    let chaVerde    = Bebida "Sencha" "Chá" 8.00

    let pedido1 = Pedido [cafeSimples, cafeGourmet] Entregue
    let pedido2 = Pedido [chaVerde] Cancelado


    putStrLn $ "Valro total do Pedido 1 (Entregue): R$ " ++ show (valorTotalPedido pedido1)
    putStrLn $ "Valro total do Pedido 2 (Cancelado): R$ " ++ show (valorTotalPedido pedido2)

    putStrLn $ "Primeira bebida do Pedido 1: " ++ primeiraBebida pedido1
    putStrLn $ "Primeira bebida do Pedido 2: " ++ primeiraBebida pedido2