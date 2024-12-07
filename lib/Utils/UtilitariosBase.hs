{-|
Module      : Utils.UtilitariosBase
Description : Coleção de funções utilitarias necessárias para trabalhar com os portais
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com a base no Jogo. Estes utilitarios são necessários p.ex para a validação da Base do jogador.
-}

module Utils.UtilitariosBase where

import LI12425
import Utils.Utilitarios
import Utils.UtilitariosPortal
import Utils.UtilitariosTorre

{-|
  Esta função 'validaBase' valida a 'Base' recorrendo para tal a função 'validaBase'.

  ==__Validações__
  * Verificação de que a 'Base' se encontra num bloco do tipo 'Terra'
  * Verificação de que a 'Base' se encontra numa posicao válida do mapa
  * Verificação de que o valor de 'creditos' é um valor positivo

  ==__Exemplos de utilização__
  >>>validaBase [[Terra,Terra],[Terra,Relva]] (0,0) [(1,1)] [(0,1)] 10
  True
  >>>validaBase [[Terra,Relva],[Agua,Terra]] (1,1) [(0,0)] [(0,1)] 100
  True
  >>>validaBase [[Terra,Relva],[Agua,Agua]] (1,1) [(0,0)] [(0,1)] 12
  False
-}
validaBase :: [[Terreno]] -- Mapa
           -> Posicao -- Posição da base
           -> Creditos -- Créditos da base
           -> Bool
validaBase mapa posBase creditos =
  checkPositionTerra posBase mapa 
  && validaPosicaoObjeto posBase mapa
  && creditosPositivos creditos

{-|
  Verifica se o número de créditos da base é válido, isto é, se é um número positivo.

  ==__Exemplos de utilização__
  >>> creditosPositivos 10
  True
  >>> creditosPositivos (-10)
  False 
 -}
creditosPositivos :: Creditos -> Bool
creditosPositivos creditos = creditos > 0

{-|
  A função 'verificaColisaoBasePortais' verifica se existem colisões entre os objetos do tipo "Base", "Portal" e "Torre" presentes em 'Jogo'.

  ==__Exemplos de utilização__
  >>> verificaColisaoBasePortais [] [] (Base {posicaoBase = (0,0)})
  False
  >>> verificaColisaoBasePortais [Portal {posicaoPortal = (0,0)}] [] (Base {posicaoBase = (0,0)})
  True
-}
verificaColisaoBasePortais :: [Portal] -> [Torre] -> Base -> Bool
verificaColisaoBasePortais ps ts base = verificaDuplosPos listPos
    where
      posPortais = convertePortaisEmListaPos ps
      posTorres = converteTorresEmListaPos ts
      listPos = posPortais ++ posTorres ++ [posicaoBase base]
