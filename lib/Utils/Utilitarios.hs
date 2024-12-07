{-|
Module      : Utils.Utilitarios
Description : Coleção de funções utilitarias geralmente aplicáveis.
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com os diversos objetos presentes neste jogo.
-}
module Utils.Utilitarios where

import LI12425

{-|
  A função utilitária 'verificaDuplosPos' verifica se numa lista de 'Posicao' existem elementos repetidos.

  ==__Exemplos de utilização__
  >>> verificaDuplosPos []
  False
  >>> verificaDuplosPos [(0,0), (1,2), (-1, 3)]
  False
  >>> verificaDuplosPos [(0,0), (1,2), (-1, 3), (0,0)]
  True
-}
verificaDuplosPos :: [Posicao] -> Bool
verificaDuplosPos [] = False
verificaDuplosPos (x:xs) = x `elem` xs || verificaDuplosPos xs

{-|
  A função 'validaPosicaoObjeto' valida se uma dada 'Posicao' se encontra dentro dos limites do 'Mapa'.

  ==__Exemplos de utilização__
  >>> validaPosicaoObjeto (-1, -1) [[Terra, Terra, Relva, Agua]]
  False
  >>> validaPosicaoObjeto (1, 1) [[Terra, Terra, Relva, Agua]]
  False
  >>> validaPosicaoObjeto (1, 0) [[Terra, Terra, Relva, Agua]]
  True
-}
validaPosicaoObjeto :: Posicao -> Mapa -> Bool
validaPosicaoObjeto (x,y) mapa = 
  x >= 0 && x < fromIntegral (length (head mapa)) && y >= 0 && y < fromIntegral (length mapa)

{-|
  A função 'checkPositionTerra' verifica se o bloco de uma dada 'Posicao' do 'Mapa' é do tipo 'Terra'

  ==__Exemplos de utilização__
  >>> checkPositionTerra (0,0) [[Terra]]
  True
  >>> checkPositionTerra (0,0) [[Relva]]
  False
-}
checkPositionTerra :: Posicao -> Mapa -> Bool
checkPositionTerra (x,y) m = validaPosicaoObjeto (x,y) m && m !! floor y !! floor x == Terra


{-|
  'converteTorresEmListaPos' converte uma lista de objetos do tipo 'Torre' em uma lista do tipo 'Posicao' ou seja extrai as respetivas posições para uma coleção

  ==__Exemplos de utilização__
  >>> converteTorresEmListaPos [Torre {posicaoTorre = (0,0)}, Torre {posicaoTorre = (1,2)}]
  [(0.0,0.0), (1.0,2.0)]
  >>> converteTorresEmListaPos []
  []
-}
converteTorresEmListaPos :: [Torre] -> [Posicao]
converteTorresEmListaPos = map (\(Torre {posicaoTorre = pos} ) -> pos)