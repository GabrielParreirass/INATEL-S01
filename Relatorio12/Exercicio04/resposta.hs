data Servico = Servico {
    nome  :: String,
    tipo  :: String,
    preco :: Double
} deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado deriving (Show, Eq)

data Atendimento = Atendimento {
    listaServicos :: [Servico],
    status        :: StatusAtendimento
} deriving (Show)

totalServicos :: [Servico] -> Double
totalServicos servicos = sum (map preco servicos)

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
    | status atendimento == Cancelado        = 0.0
    | length (listaServicos atendimento) > 3 = total * 1.25
    | otherwise                              = total
    where
        total = totalServicos (listaServicos atendimento)

primeiroServico :: Atendimento -> String
primeiroServico (Atendimento [] _)    = "Nenhum servico registrado."
primeiroServico (Atendimento (s:_) _) = nome s

main :: IO ()
main = do
    let banhoSimples = Servico "Banho Quente" "Banho" 50.0
    let banhoErvas   = Servico "Banho de Ervas" "Especial" 120.0
    let massagem     = Servico "Massagem Terapêutica" "Terapia" 80.0
    let refeicao     = Servico "Banquete dos Deuses" "Alimentação" 250.0

    let atendimento1 = Atendimento [banhoSimples, banhoErvas, massagem, refeicao] Finalizado

    let atendimento2 = Atendimento [banhoErvas] EmAndamento

    putStrLn "--- Casa de Banhos da Yubaba ---"

    putStrLn $ "Atendiemento 1 - Primeiro servio: " ++ primeiroServico atendimento1
    putStrLn $ "Atendimento 1 - Valor Final: R$ " ++ show (valorFinalAtendimento atendimento1)
    
    putStrLn ""
    
    putStrLn $ "Atendimento 2 - Primeiro serviço: " ++ primeiroServico atendimento2
    putStrLn $ "Atendimento 2 - Valor Final: R$ " ++ show (valorFinalAtendimento atendimento2)