module Utils.UtilitariosEditor where

import LI12425
import Utils.UtilitariosTorre
import Utils.Utilitarios
import Utils.UtilitariosPortal
import System.IO.Unsafe (unsafePerformIO)
import System.Directory

{-| 
    A função 'validaPosicaoObjeto' verifica se uma dada posição é válida no mapa.
    
    ==__Exemplos de utilização__
    >>> validaPosicaoObjeto (1,1) [[Terra, Relva], [Agua, Terra]]
    True
    >>> validaPosicaoObjeto (1,2) [[Terra, Relva], [Agua, Terra]]
    False
-}
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

{-| 
    A função 'validaPosicaoObjeto' verifica se uma dada posição é válida no mapa.
    
    ==__Exemplos de utilização__
    >>> validaPosicaoObjeto (1,1) [[Terra, Relva], [Agua, Terra]]
    True
    >>> validaPosicaoObjeto (1,2) [[Terra, Relva], [Agua, Terra]]
    False
-}
isValidTower :: Posicao -> Mapa -> [Torre] -> Bool
isValidTower (x,y) mapa torres = checkPositionRelva (x,y) mapa && not (verificaCollisionTorres torres)

{-| 
    A função 'validaPosicaoObjeto' verifica se uma dada posição é válida no mapa.
    
    ==__Exemplos de utilização__
    >>> validaPosicaoObjeto (1,1) [[Terra, Relva], [Agua, Terra]]
    True
    >>> validaPosicaoObjeto (1,2) [[Terra, Relva], [Agua, Terra]]
    False
-}
inserePortalNaLista :: [Portal] -> Posicao -> [Portal]  
inserePortalNaLista portais (x,y) = portais ++ [Portal {posicaoPortal = (x,y), ondasPortal = [
    Onda {inimigosOnda = [Inimigo {posicaoInimigo = (x,y), vidaInimigo = 10, velocidadeInimigo = 1, direcaoInimigo = Norte}], cicloOnda = 3, tempoOnda = 20, entradaOnda = 20}
]}] 

{-|
    A função 'validaPortalEditor' verifica se uma dada posição é válida no mapa.
    
    ==__Exemplos de utilização__
    >>> validaPortalEditor (1,1) [[Terra, Relva], [Agua, Terra]]
    True
    >>> validaPortalEditor (1,2) [[Terra, Relva], [Agua, Terra]]
    False
-}
validaPortalEditor :: (Int,Int) -> Mapa -> Bool
validaPortalEditor (x,y) m =
    validaPosicaoObjeto (fromIntegral x, fromIntegral y) m && checkPositionTerra (fromIntegral x, fromIntegral y) m

{-|
    A função 'saveGame' guarda o estado do jogo num ficheiro.

    ==__Exemplos de utilização__
    >>> saveGame (Jogo { mapaJogo = [[Agua, Terra, Relva], [Relva, Terra, Terra], [Relva, Relva, Relva]], baseJogo = Base { posicaoBase = (0,0), vidaBase = 10 }, portaisJogo = [Portal { posicaoPortal = (0,0), inimigosPortal = [Inimigo { posicaoInimigo = (0,0), vidaInimigo = 10, projeteisInimigo = [] }] }], torresJogo = [Torre { posicaoTorre = (0,0), alcanceTorre = 1, danoTorre = 5, projetilTorre = Projetil { tipoProjetil = Fogo, duracaoProjetil = 15 } }], lojaJogo = Loja { torresLoja = [Torre { posicaoTorre = (0,0), alcanceTorre = 1, danoTorre = 5, projetilTorre = Projetil { tipoProjetil = Fogo, duracaoProjetil = 15 } }] })
    File already exists, saving as: games/game1.txt
-}


saveGame :: Int -> Jogo -> IO ()
saveGame slotSave jogo
    | otherwise = do
        let nomeArquivo = "games/Level" ++ show (slotSave) ++ ".txt"
        writeFile nomeArquivo (show jogo)
        putStrLn $ "Salvo em: " ++ nomeArquivo

    
{-|
    A função 'loadGame' carrega o estado do jogo de um ficheiro.

    ==__Exemplos de utilização__                                                
    >>> loadGame 1
    Jogo {mapaJogo = [[Agua,Terra,Relva],[Relva,Terra,Terra],[Relva,Relva,Relva]], baseJogo = Base {posicaoBase = (0.0,0.0), vidaBase = 10}, portaisJogo = [Portal {posicaoPortal = (0.0,0.0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0.0,0.0), vidaInimigo = 10, velocidadeInimigo = 1}], cicloOnda = 3, tempoOnda = 20, entradaOnda = 20}]}, torresJogo = [Torre {posicaoTorre = (0.0,0.0), alcanceTorre = 1.0, danoTorre = 5, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = 15}}], lojaJogo = Loja {torresLoja = [Torre {posicaoTorre = (0.0,0.0), alcanceTorre = 1.0, danoTorre = 5, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = 15}}]}}
    >>> loadGame 2
    *** Exception: Save não encontrado
-}
loadGame :: Int -> IO Jogo
loadGame saveSlot = do
    let nomeArquivo = "games/Level" ++ show saveSlot ++ ".txt"
    fileExists <- doesFileExist nomeArquivo  -- Check if the file exists
    if fileExists
        then do
            conteudo <- readFile nomeArquivo
            return (read conteudo :: Jogo)
        else    
            error "Save não encontrado"  -- Error if file doesn't exist

{-|
    A função 'listGames' lista os ficheiros de jogos guardados.

    ==__Exemplos de utilização__
    >>> listGames
    ["game.txt"]
    >>> listGames
    ["game.txt", "game1.txt"]
-}
listGames :: IO [String]
listGames = do
    files <- listDirectory "games"
    return files

