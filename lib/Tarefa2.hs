{-|
Module      : Tarefa2
Description : Auxiliares do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a realização da Tarefa 2 de LI1 em 2024/25.
-}
module Tarefa2 where

import LI12425

{- 
    Implementação da função que retorna os inimigos que estão no alcance da torre.

    ==__Exemplo de utilização__
    >>> inimigosNoAlcance (Torre {posicaoTorre = (1,1), alcanceTorre = 2}) [Inimigo {posicaoInimigo = (1,1)}, Inimigo {posicaoInimigo = (1,2)}, Inimigo {posicaoInimigo = (1,3)}]
    [Inimigo {posicaoInimigo = (1,1)}, Inimigo {posicaoInimigo = (1,2)}]
    >>> inimiogosNoAlcance (Torre {posicaoTorre = (1,1), alcanceTorre = 1}) [Inimigo {posicaoInimigo = (1,1)}, Inimigo {posicaoInimigo = (1,2)}, Inimigo {posicaoInimigo = (1,3)}]
    [Inimigo {posicaoInimigo = (1,1)}]
 -}
inimigosNoAlcance :: Torre -> [Inimigo] -> [Inimigo]
inimigosNoAlcance (Torre {posicaoTorre = posicaoT, alcanceTorre = alcanceT}) inimigos = filter (\inimigo -> noAlcance posicaoT (posicaoInimigo inimigo) alcanceT) inimigos

{- 
    Implementação da função que verifica se um inimigo está no alcance da torre.

    ==__Exemplo de utilização__
    >>> noAlcance (1,1) (1,2) 1
    True
    >>> noAlcance (1,1) (1,3) 1
    False
 -}
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
