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


{-|  
  A função 'adicionaTorreValida' verifica se é possível adicionar uma torre a um mapa.

  ==__Validações__
  * Verificação de que a 'Torre' se encontra num bloco do tipo 'Relva'
  * Verificação de que não existe colisão entre as torres
  * Verificação de que o jogador tem créditos suficientes para adicionar a torre

  ==__Exemplos de utilização__
  >>> adicionaTorreValida (0,0) [[Relva]] [] 100 100
  True
  >>> adicionaTorreValida (0,0) [[Relva]] [Torre {posicaoTorre = (0,0)}] 100 100
  False
  >>> adicionaTorreValida (0,0) [[Terra]] [] 100 100
  False
-}
adicionaTorreValida :: Posicao -> Mapa -> [Torre] -> Creditos -> Creditos -> Bool
adicionaTorreValida (x,y) mapa torres creditos custoTorre = checkPositionRelva (x,y) mapa && not (verificaCollisionTorres torres) && creditos >= custoTorre

{-| 
  A função 'insereTorreNaLista' insere uma torre numa lista de torres.

  ==__Exemplos de utilização__
  >>> insereTorreNaLista [] (0,0) Fogo
  [Torre {posicaoTorre = (0,0), danoTorre = 20, alcanceTorre = 30, rajadaTorre = 1, cicloTorre = 2, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = 5}}]
  >>> insereTorreNaLista [Torre {posicaoTorre = (0,0), danoTorre = 20, alcanceTorre = 30, rajadaTorre = 1, cicloTorre = 2, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = 5}}] (1,1) Resina
  [Torre {posicaoTorre = (0,0), danoTorre = 20, alcanceTorre = 30, rajadaTorre = 1, cicloTorre = 2, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = 5}},Torre {posicaoTorre = (1,1), danoTorre = 30, alcanceTorre = 20, rajadaTorre = 2, cicloTorre = 2, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Resina, duracaoProjetil = 5}}]
-}
insereTorreNaLista :: [Torre] -> Posicao -> TipoProjetil -> [Torre]  
insereTorreNaLista torres (x,y) tipo = case tipo of 
    Fogo -> torres ++ [Torre {posicaoTorre = (x,y), danoTorre = 40, alcanceTorre = 2, rajadaTorre = 3, cicloTorre = 4, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = Finita 5}}]
    Resina -> torres ++ [Torre {posicaoTorre = (x,y), danoTorre = 30, alcanceTorre = 3, rajadaTorre = 3, cicloTorre = 5, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Resina, duracaoProjetil = Infinita}}]
    Gelo -> torres ++ [Torre {posicaoTorre = (x,y), danoTorre = 20, alcanceTorre = 5, rajadaTorre = 3, cicloTorre = 5, tempoTorre = 0, projetilTorre = Projetil {tipoProjetil = Gelo, duracaoProjetil = Finita 1}}]

{-|
  A função 'custoTorre' devolve o custo de uma torre conforme o seu tipo.

  ==__Exemplos de utilização__
  >>> custoTorre Torre1 
  100
  >>> custoTorre Torre2
  200
  >>> custoTorre Torre3
  400
-}
custoTorre :: TipoTorre -> Creditos
custoTorre tipoTorre = case tipoTorre of
    Torre1 -> 200
    Torre2 -> 700
    Torre3 -> 300

{-|
  A função 'alcanceTorreTipo' devolve o alcance de uma torre conforme o seu tipo.

  ==__Exemplos de utilização__
  >>> alcanceTorreTipo Torre1
  3.0
  >>> alcanceTorreTipo Torre2
  2.0
  >>> alcanceTorreTipo Torre3
  5.0
-}
alcanceTorreTipo :: TipoTorre -> Float
alcanceTorreTipo tipo = case tipo of
    Torre1 -> 3
    Torre2 -> 2
    Torre3 -> 5