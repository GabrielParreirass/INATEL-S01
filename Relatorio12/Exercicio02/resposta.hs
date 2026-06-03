data Item = Item {
    nome      :: String,
    categoria :: String,
    preco     :: Double
} deriving (Show)

data StatusCompra = Pendente | Concluida | Cancelada deriving (Show, Eq)

data Compra = Compra {
    listaItens :: [Item],
    status     :: StatusCompra
} deriving (Show)

totalItens :: [Item] -> Double
totalItens itens = sum (map preco itens)

valorFinal :: Compra -> Double
valorFinal compra
    | status compra == Cancelada = 0.0
    | total > 200.0              = total * 0.90 
    | otherwise                  = total
    where 
        total = totalItens (listaItens compra) 

main :: IO ()
main = do
    let escudoHylian = Item "Escudo" "Defesa" 80.0
    let arcoZora     = Item "Arco" "Arma" 100.0
    let pocaoVida    = Item "Poção" "Consumível" 30.0

    let compraHyrule = Compra [escudoHylian, arcoZora, pocaoVida] Concluida

    putStrLn "--- Bem-vindo a Loja de Hyrule ---"
    putStrLn $ "Valor totla da compra (com possível desocnto): Rupees " ++ show (valorFinal compraHyrule)