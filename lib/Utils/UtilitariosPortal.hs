{-|
Module      : Utils.UtilitariosPortal
Description : Coleção de funções utilitarias necessárias para trabalhar com os portais
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com os portais no Jogo. Estes utilitarios são necessários p.ex para a validação dos Portais.
-}

module Utils.UtilitariosPortal where

import LI12425
import Utils.Utilitarios
import Utils.UtilitariosTorre

{-|
  Esta função 'validaPortais' valida um conjunto de 'Portal' quanto á sua conformidade com o esperado dadas as regras do jogo.

  ==__Exemplos de utilização__
  >>>validaPortais [] [[Terra, Terra, Terra, Relva]] Base {posicaoBase = (0,0)} 
  True
  >>>validaPortais [Portal {posicaoPortal = (1,0), ondasPortal = []}] [[Terra, Terra]] Base {posicaoBase = (0,0)}
  True
  >>>validaPortais [Portal {posicaoPortal = (0,0), ondasPortal = []}] [[Relva, Terra]] Base {posicaoBase = (1,0)}
  False
-}
validaPortais :: [Portal] -> Mapa -> Base -> Bool
validaPortais [] _ _ = True
validaPortais (p:ps) m b = 
   validaPortal p m b && validaPortais ps m b

{-|
  A função 'validaPortal' valida cada portal separadamente quanto á sua conformidade, recorrendo para isso a uma série de funções auxiliares.

  ==__Validações necessárias__
  *Validação de que o 'Portal' se encontra dentro do mapa
  *Verifcação de que o 'Portal' se encontra sobre o 'Terreno' do tipo 'Terra'
  *Verificação de que existe pelo menos um caminho que liga o 'Portal' á 'Base'
  *Verificação de que cada 'Portal' tem no máximo uma 'Onda' ativa

  ==__Exemplos de utilização__
  >>> validaPortal (Portal {posicaoPortal = (-1,-1), ondasPortal = []}) [[Terra, Terra, Relva, Agua]] (Base {posicaoBase = (1,0)})
  False
  >>> validaPortal (Portal {posicaoPortal = (0,0), ondasPortal = []}) [[Terra, Terra, Relva, Agua]] (Base {posicaoBase = (1,0)})
  True
  >>> validaPortal (Portal {posicaoPortal = (2,0), ondasPortal = []}) [[Terra, Terra, Relva, Agua]] (Base {posicaoBase = (1,0)})
  False
-}
validaPortal :: Portal -> Mapa -> Base -> Bool
validaPortal p@(Portal {posicaoPortal = posPortal, ondasPortal = ondas}) m b =
    validaPosicaoObjeto posPortal m && checkPositionTerra posPortal m && verificaCaminhoPortalBase p b m && verificaOndasPortal ondas

{-|
  A função 'verificaCaminhoAux' serve como função auxiliar que verifica se existe um caminho de 'Terra' de uma dada 'Posicao' para outra.

  ==__Observações__
  * Para evitar que durante a verificação a função volte para uma 'Posicao' anteriormente verificada, a cada iteração é sempre dado como terceiro argumento a 'Posicao' do antecessor (predecessor)
 
  ==__Exemplos de utilização__
  >>> verificaCaminhoAux (0,0) (2,1) (0,0) [[Terra, Relva, Agua], [Terra, Terra, Terra]]
  True
  >>> verificaCaminhoAux (0,0) (2,1) (0,0) [[Terra, Relva, Agua], [Agua, Terra, Terra]]
  False
-}

verificaCaminhoAux :: Posicao -> Posicao -> Posicao -> Mapa -> Bool
verificaCaminhoAux p@(px, py) b@(bx, by) (predx, predy) m
      | checkEqualBase = True
      | (px-1) >= 0 && checkPositionTerra (px-1, py) m && (px-1) /= predx = verificaCaminhoAux (px-1, py) b p m
      | checkPositionTerra (px+1, py) m && (px+1) /= predx = verificaCaminhoAux (px+1, py) b p m
      | (py-1) >= 0 && checkPositionTerra (px, py-1) m && (py-1) /= predy = verificaCaminhoAux (px, py-1)  b p m
      | floor (py+1) < length m && checkPositionTerra (px, py+1) m && (py+1) /= predy = verificaCaminhoAux (px, py+1) b p m
      | otherwise = False
    where
      checkEqualBase = px == bx && py == by

{-|
  A função 'verificaCaminhoPortalBase' verifica se existe pelo menos um caminho válido de um 'Portal' até á 'Base', para tal, recorrendo á função auxiliar 'verificaCaminhoAux'.

  ==__Exemplos de utilização__
  >>> verificaCaminhoPortalBase (Portal {posicaoPortal = (0,0)}) (Base {posicaoBase = (2,1)}) [[Terra, Relva, Agua], [Terra, Terra, Terra]]
  True
  >>> verificaCaminhoPortalBase (Portal {posicaoPortal = (0,0)}) (Base {posicaoBase = (2,1)}) [[Terra, Relva, Agua], [Agua, Terra, Terra]]
  True
-}
verificaCaminhoPortalBase :: Portal -> Base -> Mapa -> Bool
verificaCaminhoPortalBase (Portal {posicaoPortal = posP}) (Base {posicaoBase = posB}) = verificaCaminhoAux posP posB posP

{-|
  A função 'verificaOndasPortal' verifica se existe no máximo uma 'Onda' ativa em uma dada lista de ondas.

  ==__Propriedades__
  * Uma 'Onda' está ativa quando o seu argumento 'entradaOnda' é menor ou igual a 0.

  ==__Exemplos de utilização__
  >>> verificaOndasPortal []
  True
  >>> verificaOndasPortal [Onda {entradaOnda = 0}, Onda {entradaOnda = -1}]
  False
  >>> verificaOndasPortal [Onda {entradaOnda = 0}]
  True
-}
verificaOndasPortal :: [Onda] -> Bool
verificaOndasPortal ondas = amountOndasAtivas < 2
  where
    amountOndasAtivas = length ondasAtivas
    ondasAtivas = filter (\(Onda {entradaOnda = entOnda}) -> entOnda <= 0) ondas
