{-|
Module      : Tarefa2
Description : Auxiliares do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a realização da Tarefa 2 de LI1 em 2024/25.
-}
module Tarefa2 where

import LI12425
import Utils.UtilitariosInimigo

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

{-|
    A função 'atingeInimigo' altera um 'Inimigo' conforme previsto quando este é atingido por um 'Projetil' de uma 'Torre'

    ==__Funcionalidades da função__
    * Reduzir a vida de um Inimigo conforme o dano causado pelo impacto do 'Projetil', para tal recorrendo à função 'reduzVidaInimigo'
    * Adicionar o efeito colateral do 'Projetil' à lista de projeteis do 'Inimigo'

    ==__Exemplos de utilização__
    >>> atingeInimigo (Torre { danoTorre = 5, projetilTorre = (Projetil { tipoProjetil = Fogo, duracaoProjetil = 15 }) }) (Inimigo { vidaInimigo = 15,  projeteisInimigo = [Projetil { tipoProjetil = Gelo, duracaoProjetil = 2}]})
    (Inimigo { vidaInimigo = 10,  projeteisInimigo = []})
    >>> atingeInimigo (Torre { danoTorre = 5, projetilTorre = (Projetil { tipoProjetil = Fogo, duracaoProjetil = 15 }) }) (Inimigo { vidaInimigo = 15,  projeteisInimigo = []})
    (Inimigo { vidaInimigo = 10,  projeteisInimigo = [Projetil {tipoProjetil = Fogo, duracaoProjetil = 15}]})
    >>> atingeInimigo (Torre { danoTorre = 5, projetilTorre = (Projetil { tipoProjetil = Resina, duracaoProjetil = 15 }) }) (Inimigo { vidaInimigo = 15,  projeteisInimigo = [Projetil { tipoProjetil = Gelo, duracaoProjetil = 2}]})
    (Inimigo { vidaInimigo = 10,  projeteisInimigo = [Projetil { tipoProjetil = Gelo, duracaoProjetil = 2}, Projetil { tipoProjetil = Resina, duracaoProjetil = 15 }]})
-}
atingeInimigo :: Torre -> Inimigo -> Inimigo
atingeInimigo (Torre {projetilTorre = p, danoTorre = dano}) i = 
    handleHitByProjetil (reduzVidaInimigo i dano) p

{-|
    TODO:
-}
ativaInimigo :: Portal -> [Inimigo] -> (Portal, [Inimigo])
ativaInimigo = undefined

{-|
    TODO:
-}
terminouJogo :: Jogo -> Bool
terminouJogo = undefined

{-|
    TODO:
-}
ganhouJogo :: Jogo -> Bool
ganhouJogo = undefined

{-|
    TODO:
-}
perdeuJogo :: Jogo -> Bool
perdeuJogo = undefined
