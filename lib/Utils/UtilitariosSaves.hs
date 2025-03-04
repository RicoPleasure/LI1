{-|
Module      : Utils.UtilitariosSaves
Description : Coleção de funções utilitarias necessárias para trabalhar com o sistema de saves do jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

-}
module Utils.UtilitariosSaves where

import LI12425
import System.Directory
import Data.List
import Data.Char

{-|
    A função 'saveGame' guarda o estado do jogo num ficheiro.

    ==__Exemplos de utilização__
    >>> saveGame (Jogo { mapaJogo = [[Agua, Terra, Relva], [Relva, Terra, Terra], [Relva, Relva, Relva]], baseJogo = Base { posicaoBase = (0,0), vidaBase = 10 }, portaisJogo = [Portal { posicaoPortal = (0,0), inimigosPortal = [Inimigo { posicaoInimigo = (0,0), vidaInimigo = 10, projeteisInimigo = [] }] }], torresJogo = [Torre { posicaoTorre = (0,0), alcanceTorre = 1, danoTorre = 5, projetilTorre = Projetil { tipoProjetil = Fogo, duracaoProjetil = 15 } }], lojaJogo = Loja { torresLoja = [Torre { posicaoTorre = (0,0), alcanceTorre = 1, danoTorre = 5, projetilTorre = Projetil { tipoProjetil = Fogo, duracaoProjetil = 15 } }] })
    File already exists, saving as: games/game1.txt
-}
saveGame :: Int -> Jogo -> IO ()
saveGame slotSave jogo
    | otherwise = do
        let nomeArquivo = "games/" ++ show (slotSave) ++ ".txt"
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
loadGame :: String -> IO (Maybe Jogo)
loadGame saveSlot = do
    let nomeArquivo = "games/" ++ saveSlot ++ ".txt"
    fileExists <- doesFileExist nomeArquivo
    if fileExists
        then do
            conteudo <- readFile nomeArquivo
            putStrLn "Arquivo encontrado e carregado com sucesso!"
            return $ Just (read conteudo :: Jogo)
        else do
            putStrLn "Save não encontrado"
            return Nothing

{-|
    'extractNumber' é uma função auxiliar que extrai um número de uma string.

    ==__Exemplos de utilização__
    >>> extractNumber "game1.txt"
    1
-}
extractNumber :: String -> Int
extractNumber = read . takeWhile isDigit

{-|
    'sortFileNames' é uma função auxiliar que ordena uma lista de strings de acordo com o número que contêm.

    ==__Exemplos de utilização__
    >>> sortFileNames ["game1.txt", "game.txt"]
    ["game.txt", "game1.txt"]
-}
sortFileNames :: [String] -> [String]
sortFileNames = sortOn extractNumber

{-|
    A função 'listGames' lista os ficheiros de jogos guardados.

    ==__Exemplos de utilização__
    >>> listGames
    ["Empty save","Empty save","Empty save","Empty save","Empty save","Empty save"]
-}
listGames :: IO [String]
listGames = do
    files <- listDirectory "games"
    let ficheirosOrdenados = sortFileNames files
        slots = map extractNumber ficheirosOrdenados
        slotsPreenchidos = [if n `elem` slots then show n else "Empty save" | n <- [1..6]]
    return slotsPreenchidos