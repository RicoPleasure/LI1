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
import Utils.UtilitariosPortal
import Utils.Utilitarios
import Data.Maybe

{-|
    TODO:
-}
inimigosNoAlcance :: Torre -> [Inimigo] -> [Inimigo]
inimigosNoAlcance = undefined

{-|
    A função 'atingeInimigo' altera um 'Inimigo' conforme previsto quando este é atingido por um 'Projetil' de uma 'Torre'

    ==Funcionalidades da função
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
