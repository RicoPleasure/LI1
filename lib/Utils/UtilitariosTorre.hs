{-|
Module      : Utils.UtilitariosTorre
Description : Coleção de funções utilitarias necessárias para trabalhar com as torres
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com as torres no Jogo. Estes utilitarios são necessários p.ex para a validação das torres.
-}
module Utils.UtilitariosTorre where

import LI12425
import Utils.Utilitarios


{-|
  A função 'validaTorres' valida um conjunto de objetos do tipo 'Torre' recorrendo para tal á função 'validaTorre'

  ==__Exemplos de utilização__
  >>> validaTorres [] [[Terra, Relva]]
  True
  >>> validaTorres [Torre {posicaoTorre = (1,0), alcanceTorre = 5, rajadaTorre = 5, cicloTorre = 5}] [[Terra, Relva]]
  True
  >>> validaTorres [Torre {posicaoTorre = (0,0), alcanceTorre = 5, rajadaTorre = 5, cicloTorre = 5}] [[Terra, Relva]]
  False
-}
validaTorres :: [Torre] -> Mapa -> Bool
validaTorres torres mapa = all (validaTorre mapa) torres

{-|
  A função 'validaTorre' valida cada 'Torre' separadamente.

  ==__Validações__
  * Verificação de que a 'Torre' se encontra num bloco do tipo 'Relva'
  * Verificação de que o 'alcanceTorre' é um valor positivo
  * Verificação de que a 'rajadaTorre' é um valor positivo
  * Verificação de que o 'cicloTorre' é um valor positivo e finito

  ==__Exemplos de utilização__
  >>> validaTorre [[Relva]] (Torre {posicaoTorre = (0,0), cicloTorre = 2, rajadaTorre = 2, alcanceTorre = 5})
  True
  >>> validaTorre [[Relva]] (Torre {posicaoTorre = (0,0), cicloTorre = 2, rajadaTorre = 2, alcanceTorre = (-5)})
  True
  >>> validaTorre [[Relva]] (Torre {posicaoTorre = (0,0), cicloTorre = (1/0), rajadaTorre = 2, alcanceTorre = 5})
  False
  >>> validaTorre [[Terra]] (Torre {posicaoTorre = (0,0), cicloTorre = 2, rajadaTorre = 2, alcanceTorre = 5})
  False
-}
validaTorre :: Mapa -> Torre -> Bool
validaTorre mapa (Torre {posicaoTorre = pos, alcanceTorre = alcance, rajadaTorre = rajada, cicloTorre = ciclo}) = 
    checkPositionRelva pos mapa &&
    alcance > 0 &&
    rajada > 0 &&
    not (isInfinite ciclo) &&
    ciclo > 0

{-|
  A função 'verificaCollisionTorres' verifica se alguma 'Torre' está sobreposta a outra.

  ==__Exemplos de utilização__
  >>> verificaCollisionTorres []
  False
  >>> verificaCollisionTorres [Torre {posicaoTorre = (1,0)}]
  False
  >>> verificaCollisionTorres [Torre {posicaoTorre = (1,0)}, Torre {posicaoTorre = (1,1)}, Torre {posicaoTorre = (1,0)}]
  True
-}
verificaCollisionTorres :: [Torre] -> Bool  
verificaCollisionTorres torres = verificaDuplosPos (converteTorresEmListaPos torres)


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

adicionaTorreValida :: Posicao -> Mapa -> [Torre] -> Creditos -> Creditos -> Bool
adicionaTorreValida (x,y) mapa torres creditos custoTorre = checkPositionRelva (x,y) mapa && not (verificaCollisionTorres torres) && creditos >= custoTorre

insereTorreNaLista :: [Torre] -> Posicao -> TipoProjetil -> [Torre]  
insereTorreNaLista torres (x,y) tipo = case tipo of 
    Fogo -> torres ++ [Torre {posicaoTorre = (x,y), danoTorre = 20, alcanceTorre = 30, rajadaTorre = 1, cicloTorre = 2, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = 5}}]
    Resina -> torres ++ [Torre {posicaoTorre = (x,y), danoTorre = 30, alcanceTorre = 20, rajadaTorre = 2, cicloTorre = 2, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Resina, duracaoProjetil = 5}}]
    Gelo -> torres ++ [Torre {posicaoTorre = (x,y), danoTorre = 20, alcanceTorre = 15, rajadaTorre = 3, cicloTorre = 2, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Gelo, duracaoProjetil = 5}}]

custoTorre :: TipoTorre -> Creditos
custoTorre tipoTorre = case tipoTorre of
    Torre1 -> 100
    Torre2 -> 200
    Torre3 -> 400