{-|
Module      : Utils.UtilitariosTorre
Description : Coleção de funções utilitarias necessárias para trabalhar com as torres
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com as torres no Jogo. Estes utilitarios são necessários p.ex para a validação das torres.
-}
module Utils.UtilitariosTorre where

import LI12425

{-|
  'convertePortaisEmListaPos' converte uma lista de objetos do tipo 'Portal' em uma lista do tipo 'Posicao' ou seja extrai as respetivas posições para uma coleção

  ==__Exemplos de utilização__
  >>> convertePortaisEmListaPos [Portal {posicaoPortal = (0,0)}, Portal {posicaoPortal = (1,2)}]
  [(0.0,0.0), (1.0,2.0)]
  >>> convertePortaisEmListaPos []
  []
-}
convertePortaisEmListaPos :: [Portal] -> [Posicao]
convertePortaisEmListaPos = map (\(Portal {posicaoPortal = pos} ) -> pos)
