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
              baseJogo = Base {
                                vidaBase = vida,
                                posicaoBase = (baseX,baseY),
                                creditosBase = creditos},
              portaisJogo = [ portais@Portal {posicaoPortal = coordsPortal} ],
              torresJogo = [ torres@Torre {posicaoTorre = coordsTorre} ] }) =
                   validaMapa mapa
                    && validaBase mapa vida (baseX,baseY) [coordsPortal] [coordsTorre] creditos
{-| Valida a posição de um objeto qualquer dentro do mapa (base, portais, inimigos) -}
validaPosicaoObjeto :: [[Terreno]] -- Mapa
                    -> Posicao -- Posição
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
           -> Float -- Vida da base
           -> Posicao -- Posição da base
           -> [Posicao] -- Lista de posições dos portais
           -> [Posicao] -- Lista de posições das torres
           -> Creditos -- Créditos da base
           -> Bool
validaBase mapa vida (xBase, yBase) portais torres creditos =
  verificaTerrenoBase mapa (xBase, yBase) == Terra 
  && validaPosicaoObjeto mapa (xBase, yBase)
  && validaCreditosBase creditos
  && verificaSobreposicao (xBase,yBase) portais torres

{-| Pega o terreno da posição da base no mapa -}
verificaTerrenoBase :: [[Terreno]] -- Mapa
                -> Posicao -- Posição da base
                -> Terreno -- Terreno da base
verificaTerrenoBase mapa (xBase,yBase) = terreno
  where 
    linhas = mapa !! (floor yBase)
    terreno = linhas !! (floor xBase)

{-| Valida se os créditos da base são positivos  -}
validaCreditosBase :: Creditos -> Bool
validaCreditosBase creditos = creditos > 0

{-| Verifica se a base está sobreposta a um portal ou a uma torre -}
verificaSobreposicao :: Posicao -- Posição da base
                     -> [Posicao] -- Lista de posições dos portais
                     -> [Posicao] -- Lista de posições das torres
                     -> Bool
verificaSobreposicao posicaoBase posicoesPortais posicoesTorres 
  = not (posicaoBase `elem` posicoesPortais || posicaoBase `elem` posicoesTorres)