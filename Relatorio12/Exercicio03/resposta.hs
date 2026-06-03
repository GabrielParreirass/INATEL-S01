data Banda = Banda {
    nome   :: String,
    genero :: String,
    cache  :: Double
} deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado deriving (Show, Eq)

data Evento = Evento {
    listaBandas :: [Banda],
    status      :: StatusEvento
} deriving (Show)

custoTotalEvento :: Evento -> Double
custoTotalEvento evento
    | status evento == Cancelado = 0.0
    | otherwise                  = totalCaches * 1.20 
    where
        totalCaches = sum (map cache (listaBandas evento))

bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _)    = "Nenhuma banda de abeertura programada." 
bandaAbertura (Evento (b:_) _) = nome b

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento [] _)     = "Nenhuma banda programada."
bandaEncerramento (Evento bandas _) = nome (last bandas)

main :: IO ()
main = do
    let banda1 = Banda "Os Mutantes" "Rock Psicodélico" 5000.0
    let banda2 = Banda "Secos & Molhados" "MPB" 4500.0
    let banda3 = Banda "Novos Baianos" "Tropicália" 6000.0

    let eventoAtivo    = Evento [banda1, banda2, banda3] Ativo
    let eventoEncerrado = Evento [banda2, banda3] Encerrado
    let eventoCancelado = Evento [] Cancelado

    putStrLn "--- Evento de Sexta (Ativo) ---"
    putStrLn $ "Abertura: " ++ bandaAbertura eventoAtivo
    putStrLn $ "Encerramento: " ++ bandaEncerramento eventoAtivo
    putStrLn $ "Csto Total: R$ " ++ show (custoTotalEvento eventoAtivo)
    putStrLn ""

    putStrLn "--- Evento de Sábado (Encerrado) ---"
    putStrLn $ "Abertura: " ++ bandaAbertura eventoEncerrado
    putStrLn $ "Encerramento: " ++ bandaEncerramento eventoEncerrado
    putStrLn $ "Custo Total: R$ " ++ show (custoTotalEvento eventoEncerrado)
    putStrLn ""

    putStrLn "--- Evento de Domingo (Cancelado) ---"
    putStrLn $ "Abertura: " ++ bandaAbertura eventoCancelado
    putStrLn $ "Encerramento: " ++ bandaEncerramento eventoCancelado
    putStrLn $ "Custo Total: R$ " ++ show (custoTotalEvento eventoCancelado)