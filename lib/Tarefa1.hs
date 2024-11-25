{-|
Module      : Tarefa1
Description : Invariantes do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a realização da Tarefa 1 de LI1 em 2024/25.
-}
module Tarefa1 where

import LI12425

{-| Função que recebe todas as validações (validaMapa, validaBase) -}
validaJogo :: Jogo -- Dados do jogo
           -> Bool
validaJogo (Jogo { 
              mapaJogo = mapa,
              baseJogo = Base { posicaoBase = (baseX,baseY),
                                creditosBase = creditos},
              portaisJogo = [ Portal {posicaoPortal = coordsPortal} ] }) =
                   validaMapa mapa
                && validaBase mapa (baseX,baseY)

{-| Valida a posição de um objeto qualquer dentro do mapa (base, portais, inimigos) -}
validaPosicaoObjeto :: [[Terreno]] -- Mapa
                    -> (Float, Float) -- Posição da base
                    -> Bool
validaPosicaoObjeto mapa (x,y) =
  x >= 0 && x < fromIntegral (length (head mapa)) && y >= 0 && y < fromIntegral (length mapa)

{-| Valida se o mapa está bem construído (isto é, o número de linhas é igual ao número de colunas) -}
validaMapa :: [[Terreno]] -- Mapa
           -> Bool
validaMapa mapa = 
  length (head mapa) == length mapa

{-| Valida se a base está num terreno de "Terra" -}
validaBase :: [[Terreno]] -- Mapa
           -> (Float, Float) -- Posição da base
           -> Bool
validaBase mapa (indexX, indexY) =
  verificaTerrenoBase mapa (indexX, indexY) == Terra 
  && validaPosicaoObjeto mapa (indexX, indexY)

{-| Pega o terreno da posição da base no mapa -}
verificaTerrenoBase :: [[Terreno]] -- Mapa
                -> (Float, Float) -- Posição da base
                -> Terreno -- Terreno da base
verificaTerrenoBase mapa (indexX,indexY) = terreno
  where 
    linhas = mapa !! (floor indexY)
    terreno = linhas !! (floor indexX)

-- TODO verificaCreditosBase :: 

-- TODO verificaSobreposicao ::                 
