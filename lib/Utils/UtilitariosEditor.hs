module Utils.UtilitariosEditor where

import LI12425
import Utils.UtilitariosTorre
import Utils.Utilitarios
import Utils.UtilitariosPortal
import System.IO.Unsafe (unsafePerformIO)
import System.Directory


insereTerrenoNaPosicao :: Mapa -> (Int, Int) -> Terreno -> Mapa
insereTerrenoNaPosicao mapa (x, y) terreno =
    [ if i == y then atualizaLinha linha x terreno else linha
    | (linha, i) <- zip mapa [0..]
    ]
  where
    atualizaLinha linha x terreno =
        [ if j == x then terreno else elem
        | (elem, j) <- zip linha [0..]
        ]

isValidTower :: Posicao -> Mapa -> [Torre] -> Bool
isValidTower (x,y) mapa torres = checkPositionRelva (x,y) mapa && not (verificaCollisionTorres torres)

inserePortalNaLista :: [Portal] -> Posicao -> [Portal]  
inserePortalNaLista portais (x,y) = portais ++ [Portal {posicaoPortal = (x,y), ondasPortal = [
    Onda {inimigosOnda = [Inimigo {posicaoInimigo = (x,y), vidaInimigo = 10, velocidadeInimigo = 1}], cicloOnda = 3, tempoOnda = 20, entradaOnda = 20}
]}] 

validaPortalEditor :: (Int,Int) -> Mapa -> Bool
validaPortalEditor (x,y) m =
    validaPosicaoObjeto (fromIntegral x, fromIntegral y) m && checkPositionTerra (fromIntegral x, fromIntegral y) m

saveGame :: Jogo -> IO ()
saveGame jogo = do
    let nomeArquivo = "games/game"
    let extensao = ".txt"
    jaExiste <- doesFileExist (nomeArquivo ++ extensao)
    if jaExiste
        then do
            let tentaSalvar i = do
                    let novoNomeArquivo = nomeArquivo ++ show i ++ extensao
                    exists <- doesFileExist novoNomeArquivo
                    if exists then tentaSalvar (i + 1) else return novoNomeArquivo
            novoNomeArquivo <- tentaSalvar 1
            writeFile novoNomeArquivo (show jogo)
            putStrLn $ "File already exists, saving as: " ++ novoNomeArquivo
        else
            writeFile (nomeArquivo ++ extensao) (show jogo)
    

loadGame :: Int -> IO Jogo
loadGame save = 
    case save of
        1 -> do
            conteudo <- readFile "games/game.txt"
            return (read (conteudo))
        _ -> error "Save não encontrado"

listGames :: IO [String]
listGames = do
    files <- listDirectory "games"
    return files

