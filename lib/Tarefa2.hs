{-|
Module      : Tarefa2
Description : Auxiliares do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a realização da Tarefa 2 de LI1 em 2024/25.
-}
module Tarefa2 where

import LI12425

inimigosNoAlcance :: Torre -> [Inimigo] -> [Inimigo]
inimigosNoAlcance (Torre {posicaoTorre = posicaoT, alcanceTorre = alcanceT}) inimigos = filter (\inimigo -> noAlcance posicaoT (posicaoInimigo inimigo) alcanceT) inimigos

noAlcance :: Posicao -> Posicao -> Float -> Bool
noAlcance (x1,y1) (x2,y2) alcance = distancia <= alcance
    where distancia = sqrt((x2-x1)^2 + (y2-y1)^2)

atingeInimigo :: Torre -> Inimigo -> Inimigo
atingeInimigo = undefined

ativaInimigo :: Portal -> [Inimigo] -> (Portal, [Inimigo])
ativaInimigo = undefined

terminouJogo :: Jogo -> Bool
terminouJogo = undefined

ganhouJogo :: Jogo -> Bool
ganhouJogo = undefined

perdeuJogo :: Jogo -> Bool
perdeuJogo = undefined
