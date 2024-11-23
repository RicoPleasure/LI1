{-|
Module      : Tarefa1
Description : Invariantes do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a realização da Tarefa 1 de LI1 em 2024/25.
-}
module Tarefa1 where

import ImmutableTowers -- O erro está ao importar este módulo
import LI12425

validaJogo :: Jogo -> Bool
validaJogo Jogo { 
              mapaJogo = mapa,
              baseJogo = Base { posicaoBase = (baseX,baseY)},
              portaisJogo = [ Portal {posicaoPortal = (x,y)} ] } =
                undefined

-- A função que eu estava a falar era esta: deve funcionar mas não consegui testar 
validaPosicaoObjeto :: (Float, Float) -> ImmutableTowers -> Bool
validaPosicaoObjeto (x,y) (ImmutableTowers { jogo = Jogo {mapaJogo = mapa}}) = 
  x >= 0 && x < fromIntegral (length (head mapa)) && y >= 0 && y < fromIntegral (length mapa)

{- existeBase :: Jogo ->  -}